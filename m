Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F631E4BF5
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2020 19:35:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdzwX-00030u-M9; Wed, 27 May 2020 17:34:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=baN0=7J=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1jdzwW-00030n-Gh
 for xen-devel@lists.xenproject.org; Wed, 27 May 2020 17:34:16 +0000
X-Inumbo-ID: 4895dd22-a040-11ea-a76e-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4895dd22-a040-11ea-a76e-12813bfff9fa;
 Wed, 27 May 2020 17:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wMlxPJkYWIuTwIy5RKdZAcuhjCIm+Q739FXn913ExJg=; b=A5hyp6XDyuvX11MxaeKZrXJAYR
 i52sUTflYDjlx5UO73u+/CfAFgwydHL/omMU8xaSf/k77lM8CkRJPF32wH4O84f70DmLEHu1DUDpj
 mN74navNwKJSgoKT97GAwYfGMHhgjUuNa3fTo0aPPotUl5syA8EG3q98fBonudMagBr8=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1jdzwT-00015y-Ii; Wed, 27 May 2020 17:34:13 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=u2f063a87eabd5f.cbg10.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1jdzwT-0003od-5l; Wed, 27 May 2020 17:34:13 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v6 1/5] xen/common: introduce a new framework for save/restore
 of 'domain' context
Date: Wed, 27 May 2020 18:34:03 +0100
Message-Id: <20200527173407.1398-2-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200527173407.1398-1-paul@xen.org>
References: <20200527173407.1398-1-paul@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

To allow enlightened HVM guests (i.e. those that have PV drivers) to be
migrated without their co-operation it will be necessary to transfer 'PV'
state such as event channel state, grant entry state, etc.

Currently there is a framework (entered via the hvm_save/load() functions)
that allows a domain's 'HVM' (architectural) state to be transferred but
'PV' state is also common with pure PV guests and so this framework is not
really suitable.

This patch adds the new public header and low level implementation of a new
common framework, entered via the domain_save/load() functions. Subsequent
patches will introduce other parts of the framework, and code that will
make use of it within the current version of the libxc migration stream.

This patch also marks the HVM-only framework as deprecated in favour of the
new framework.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
Acked-by: Julien Grall <julien@xen.org>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Wei Liu <wl@xen.org>
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "Roger Pau Monné" <roger.pau@citrix.com>

v4:
 - Addressed further comments from Jan

v3:
 - Addressed comments from Julien and Jan
 - Save handlers no longer need to state entry length up-front
 - Save handlers expected to deal with multiple instances internally
 - Entries are now auto-padded to 8 byte boundary

v2:
 - Allow multi-stage save/load to avoid the need to double-buffer
 - Get rid of the masks and add an 'ignore' flag instead
 - Create copy function union to preserve const save buffer
 - Deprecate HVM-only framework
---
 xen/common/Makefile                    |   1 +
 xen/common/save.c                      | 315 +++++++++++++++++++++++++
 xen/include/public/arch-arm/hvm/save.h |   5 +
 xen/include/public/arch-x86/hvm/save.h |   5 +
 xen/include/public/save.h              |  89 +++++++
 xen/include/xen/save.h                 | 170 +++++++++++++
 6 files changed, 585 insertions(+)
 create mode 100644 xen/common/save.c
 create mode 100644 xen/include/public/save.h
 create mode 100644 xen/include/xen/save.h

diff --git a/xen/common/Makefile b/xen/common/Makefile
index e8cde65370..90553ba5d7 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -37,6 +37,7 @@ obj-y += radix-tree.o
 obj-y += rbtree.o
 obj-y += rcupdate.o
 obj-y += rwlock.o
+obj-y += save.o
 obj-y += shutdown.o
 obj-y += softirq.o
 obj-y += sort.o
diff --git a/xen/common/save.c b/xen/common/save.c
new file mode 100644
index 0000000000..ceec129b3f
--- /dev/null
+++ b/xen/common/save.c
@@ -0,0 +1,315 @@
+/*
+ * save.c: Save and restore PV guest state common to all domain types.
+ *
+ * Copyright Amazon.com Inc. or its affiliates.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program; If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include <xen/compile.h>
+#include <xen/save.h>
+
+struct domain_context {
+    struct domain *domain;
+    const char *name; /* for logging purposes */
+    struct domain_save_descriptor desc;
+    size_t len; /* for internal accounting */
+    union {
+        const struct domain_save_ops *save;
+        const struct domain_load_ops *load;
+    } ops;
+    void *priv;
+};
+
+static struct {
+    const char *name;
+    domain_save_handler save;
+    domain_load_handler load;
+} handlers[DOMAIN_SAVE_CODE_MAX + 1];
+
+void __init domain_register_save_type(unsigned int typecode,
+                                      const char *name,
+                                      domain_save_handler save,
+                                      domain_load_handler load)
+{
+    BUG_ON(typecode >= ARRAY_SIZE(handlers));
+
+    ASSERT(!handlers[typecode].save);
+    ASSERT(!handlers[typecode].load);
+
+    handlers[typecode].name = name;
+    handlers[typecode].save = save;
+    handlers[typecode].load = load;
+}
+
+int domain_save_begin(struct domain_context *c, unsigned int typecode,
+                      unsigned int instance)
+{
+    int rc;
+
+    if ( typecode != c->desc.typecode )
+    {
+        ASSERT_UNREACHABLE();
+        return -EINVAL;
+    }
+    ASSERT(!c->desc.length); /* Should always be zero during domain_save() */
+    ASSERT(!c->len); /* Verify domain_save_end() was called */
+
+    rc = c->ops.save->begin(c->priv, &c->desc);
+    if ( rc )
+        return rc;
+
+    return 0;
+}
+
+int domain_save_data(struct domain_context *c, const void *src, size_t len)
+{
+    int rc = c->ops.save->append(c->priv, src, len);
+
+    if ( !rc )
+        c->len += len;
+
+    return rc;
+}
+
+#define DOMAIN_SAVE_ALIGN 8
+
+int domain_save_end(struct domain_context *c)
+{
+    struct domain *d = c->domain;
+    size_t len = ROUNDUP(c->len, DOMAIN_SAVE_ALIGN) - c->len; /* padding */
+    int rc;
+
+    if ( len )
+    {
+        static const uint8_t pad[DOMAIN_SAVE_ALIGN] = {};
+
+        rc = domain_save_data(c, pad, len);
+
+        if ( rc )
+            return rc;
+    }
+    ASSERT(IS_ALIGNED(c->len, DOMAIN_SAVE_ALIGN));
+
+    if ( c->name )
+        gdprintk(XENLOG_INFO, "%pd save: %s[%u] +%zu (-%zu)\n", d, c->name,
+                 c->desc.instance, c->len, len);
+
+    rc = c->ops.save->end(c->priv, c->len);
+    c->len = 0;
+
+    return rc;
+}
+
+int domain_save(struct domain *d, const struct domain_save_ops *ops,
+                void *priv, bool dry_run)
+{
+    struct domain_context c = {
+        .domain = d,
+        .ops.save = ops,
+        .priv = priv,
+    };
+    static const struct domain_save_header h = {
+        .magic = DOMAIN_SAVE_MAGIC,
+        .xen_major = XEN_VERSION,
+        .xen_minor = XEN_SUBVERSION,
+        .version = DOMAIN_SAVE_VERSION,
+    };
+    const struct domain_save_end e = {};
+    unsigned int i;
+    int rc;
+
+    ASSERT(d != current->domain);
+    domain_pause(d);
+
+    c.name = !dry_run ? "HEADER" : NULL;
+    c.desc.typecode = DOMAIN_SAVE_CODE(HEADER);
+
+    rc = DOMAIN_SAVE_ENTRY(HEADER, &c, 0, &h, sizeof(h));
+    if ( rc )
+        goto out;
+
+    for ( i = 0; i < ARRAY_SIZE(handlers); i++ )
+    {
+        domain_save_handler save = handlers[i].save;
+
+        if ( !save )
+            continue;
+
+        c.name = !dry_run ? handlers[i].name : NULL;
+        memset(&c.desc, 0, sizeof(c.desc));
+        c.desc.typecode = i;
+
+        rc = save(d, &c, dry_run);
+        if ( rc )
+            goto out;
+    }
+
+    c.name = !dry_run ? "END" : NULL;
+    memset(&c.desc, 0, sizeof(c.desc));
+    c.desc.typecode = DOMAIN_SAVE_CODE(END);
+
+    rc = DOMAIN_SAVE_ENTRY(END, &c, 0, &e, sizeof(e));
+
+ out:
+    domain_unpause(d);
+
+    return rc;
+}
+
+int domain_load_begin(struct domain_context *c, unsigned int typecode,
+                      unsigned int *instance)
+{
+    if ( typecode != c->desc.typecode )
+    {
+        ASSERT_UNREACHABLE();
+        return -EINVAL;
+    }
+
+    ASSERT(!c->len); /* Verify domain_load_end() was called */
+
+    *instance = c->desc.instance;
+
+    return 0;
+}
+
+int domain_load_data(struct domain_context *c, void *dst, size_t len)
+{
+    size_t copy_len = min_t(size_t, len, c->desc.length - c->len);
+    int rc;
+
+    c->len += copy_len;
+    ASSERT(c->len <= c->desc.length);
+
+    rc = copy_len ? c->ops.load->read(c->priv, dst, copy_len) : 0;
+    if ( rc )
+        return rc;
+
+    /* Zero extend if the entry is exhausted */
+    len -= copy_len;
+    if ( len )
+    {
+        dst += copy_len;
+        memset(dst, 0, len);
+    }
+
+    return 0;
+}
+
+int domain_load_end(struct domain_context *c)
+{
+    struct domain *d = c->domain;
+    size_t len = c->desc.length - c->len;
+
+    while ( c->len != c->desc.length ) /* unconsumed data or pad */
+    {
+        uint8_t pad;
+        int rc = domain_load_data(c, &pad, sizeof(pad));
+
+        if ( rc )
+            return rc;
+
+        if ( pad )
+            return -EINVAL;
+    }
+
+    ASSERT(c->name);
+    gdprintk(XENLOG_INFO, "%pd load: %s[%u] +%zu (-%zu)\n", d, c->name,
+             c->desc.instance, c->len, len);
+
+    c->len = 0;
+
+    return 0;
+}
+
+int domain_load(struct domain *d, const struct domain_load_ops *ops,
+                void *priv)
+{
+    struct domain_context c = {
+        .domain = d,
+        .ops.load = ops,
+        .priv = priv,
+    };
+    unsigned int instance;
+    struct domain_save_header h;
+    int rc;
+
+    ASSERT(d != current->domain);
+
+    rc = c.ops.load->read(c.priv, &c.desc, sizeof(c.desc));
+    if ( rc )
+        return rc;
+
+    c.name = "HEADER";
+
+    rc = DOMAIN_LOAD_ENTRY(HEADER, &c, &instance, &h, sizeof(h));
+    if ( rc )
+        return rc;
+
+    if ( instance || h.magic != DOMAIN_SAVE_MAGIC ||
+         h.version != DOMAIN_SAVE_VERSION )
+        return -EINVAL;
+
+    domain_pause(d);
+
+    for (;;)
+    {
+        unsigned int i;
+        domain_load_handler load;
+
+        rc = c.ops.load->read(c.priv, &c.desc, sizeof(c.desc));
+        if ( rc )
+            return rc;
+
+        rc = -EINVAL;
+
+        if ( c.desc.typecode == DOMAIN_SAVE_CODE(END) )
+        {
+            struct domain_save_end e;
+
+            c.name = "END";
+
+            rc = DOMAIN_LOAD_ENTRY(END, &c, &instance, &e, sizeof(e));
+
+            if ( instance )
+                return -EINVAL;
+
+            break;
+        }
+
+        i = c.desc.typecode;
+        if ( i >= ARRAY_SIZE(handlers) )
+            break;
+
+        c.name = handlers[i].name;
+        load = handlers[i].load;
+
+        rc = load ? load(d, &c) : -EOPNOTSUPP;
+        if ( rc )
+            break;
+    }
+
+    domain_unpause(d);
+
+    return rc;
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/include/public/arch-arm/hvm/save.h b/xen/include/public/arch-arm/hvm/save.h
index 75b8e65bcb..d5b0c15203 100644
--- a/xen/include/public/arch-arm/hvm/save.h
+++ b/xen/include/public/arch-arm/hvm/save.h
@@ -26,6 +26,11 @@
 #ifndef __XEN_PUBLIC_HVM_SAVE_ARM_H__
 #define __XEN_PUBLIC_HVM_SAVE_ARM_H__
 
+/*
+ * Further use of HVM state is deprecated. New state records should only
+ * be added to the domain state header: public/save.h
+ */
+
 #endif
 
 /*
diff --git a/xen/include/public/arch-x86/hvm/save.h b/xen/include/public/arch-x86/hvm/save.h
index 773a380bc2..e61e2dbcd7 100644
--- a/xen/include/public/arch-x86/hvm/save.h
+++ b/xen/include/public/arch-x86/hvm/save.h
@@ -648,6 +648,11 @@ struct hvm_msr {
  */
 #define HVM_SAVE_CODE_MAX 20
 
+/*
+ * Further use of HVM state is deprecated. New state records should only
+ * be added to the domain state header: public/save.h
+ */
+
 #endif /* __XEN_PUBLIC_HVM_SAVE_X86_H__ */
 
 /*
diff --git a/xen/include/public/save.h b/xen/include/public/save.h
new file mode 100644
index 0000000000..551dbbddb8
--- /dev/null
+++ b/xen/include/public/save.h
@@ -0,0 +1,89 @@
+/*
+ * save.h
+ *
+ * Structure definitions for common PV/HVM domain state that is held by
+ * Xen and must be saved along with the domain's memory.
+ *
+ * Copyright Amazon.com Inc. or its affiliates.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to
+ * deal in the Software without restriction, including without limitation the
+ * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
+ * sell copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
+ * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ */
+
+#ifndef XEN_PUBLIC_SAVE_H
+#define XEN_PUBLIC_SAVE_H
+
+#if defined(__XEN__) || defined(__XEN_TOOLS__)
+
+#include "xen.h"
+
+/* Entry data is preceded by a descriptor */
+struct domain_save_descriptor {
+    uint16_t typecode;
+
+    /*
+     * Instance number of the entry (since there may be multiple of some
+     * types of entries).
+     */
+    uint16_t instance;
+
+    /* Entry length not including this descriptor */
+    uint32_t length;
+};
+
+/*
+ * Each entry has a type associated with it. DECLARE_DOMAIN_SAVE_TYPE
+ * binds these things together, although it is not intended that the
+ * resulting type is ever instantiated.
+ */
+#define DECLARE_DOMAIN_SAVE_TYPE(_x, _code, _type) \
+    struct DOMAIN_SAVE_TYPE_##_x { char c[_code]; _type t; };
+
+#define DOMAIN_SAVE_CODE(_x) \
+    (sizeof(((struct DOMAIN_SAVE_TYPE_##_x *)0)->c))
+#define DOMAIN_SAVE_TYPE(_x) \
+    typeof(((struct DOMAIN_SAVE_TYPE_##_x *)0)->t)
+
+/*
+ * All entries will be zero-padded to the next 64-bit boundary when saved,
+ * so there is no need to include trailing pad fields in structure
+ * definitions.
+ * When loading, entries will be zero-extended if the load handler reads
+ * beyond the length specified in the descriptor.
+ */
+
+/* Terminating entry */
+struct domain_save_end {};
+DECLARE_DOMAIN_SAVE_TYPE(END, 0, struct domain_save_end);
+
+#define DOMAIN_SAVE_MAGIC   0x53415645
+#define DOMAIN_SAVE_VERSION 0x00000001
+
+/* Initial entry */
+struct domain_save_header {
+    uint32_t magic;                /* Must be DOMAIN_SAVE_MAGIC */
+    uint16_t xen_major, xen_minor; /* Xen version */
+    uint32_t version;              /* Save format version */
+};
+DECLARE_DOMAIN_SAVE_TYPE(HEADER, 1, struct domain_save_header);
+
+#define DOMAIN_SAVE_CODE_MAX 1
+
+#endif /* defined(__XEN__) || defined(__XEN_TOOLS__) */
+
+#endif /* XEN_PUBLIC_SAVE_H */
diff --git a/xen/include/xen/save.h b/xen/include/xen/save.h
new file mode 100644
index 0000000000..f2e58bafef
--- /dev/null
+++ b/xen/include/xen/save.h
@@ -0,0 +1,170 @@
+/*
+ * save.h: support routines for save/restore
+ *
+ * Copyright Amazon.com Inc. or its affiliates.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program; If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef XEN_SAVE_H
+#define XEN_SAVE_H
+
+#include <xen/init.h>
+#include <xen/sched.h>
+#include <xen/types.h>
+
+#include <public/save.h>
+
+struct domain_context;
+
+int domain_save_begin(struct domain_context *c, unsigned int typecode,
+                      unsigned int instance);
+
+#define DOMAIN_SAVE_BEGIN(x, c, i) \
+    domain_save_begin((c), DOMAIN_SAVE_CODE(x), (i))
+
+int domain_save_data(struct domain_context *c, const void *data, size_t len);
+int domain_save_end(struct domain_context *c);
+
+static inline int domain_save_entry(struct domain_context *c,
+                                    unsigned int typecode,
+                                    unsigned int instance, const void *src,
+                                    size_t len)
+{
+    int rc;
+
+    rc = domain_save_begin(c, typecode, instance);
+    if ( rc )
+        return rc;
+
+    rc = domain_save_data(c, src, len);
+    if ( rc )
+        return rc;
+
+    return domain_save_end(c);
+}
+
+#define DOMAIN_SAVE_ENTRY(x, c, i, s, l) \
+    domain_save_entry((c), DOMAIN_SAVE_CODE(x), (i), (s), (l))
+
+int domain_load_begin(struct domain_context *c, unsigned int typecode,
+                      unsigned int *instance);
+
+#define DOMAIN_LOAD_BEGIN(x, c, i) \
+    domain_load_begin((c), DOMAIN_SAVE_CODE(x), (i))
+
+int domain_load_data(struct domain_context *c, void *data, size_t len);
+int domain_load_end(struct domain_context *c);
+
+static inline int domain_load_entry(struct domain_context *c,
+                                    unsigned int typecode,
+                                    unsigned int *instance, void *dst,
+                                    size_t len)
+{
+    int rc;
+
+    rc = domain_load_begin(c, typecode, instance);
+    if ( rc )
+        return rc;
+
+    rc = domain_load_data(c, dst, len);
+    if ( rc )
+        return rc;
+
+    return domain_load_end(c);
+}
+
+#define DOMAIN_LOAD_ENTRY(x, c, i, d, l) \
+    domain_load_entry((c), DOMAIN_SAVE_CODE(x), (i), (d), (l))
+
+/*
+ * The 'dry_run' flag indicates that the caller of domain_save() (see below)
+ * is not trying to actually acquire the data, only the size of the data.
+ * The save handler can therefore limit work to only that which is necessary
+ * to call domain_save_data() the correct number of times with accurate values
+ * for 'len'.
+ */
+typedef int (*domain_save_handler)(const struct domain *d,
+                                   struct domain_context *c,
+                                   bool dry_run);
+typedef int (*domain_load_handler)(struct domain *d,
+                                   struct domain_context *c);
+
+void domain_register_save_type(unsigned int typecode, const char *name,
+                               domain_save_handler save,
+                               domain_load_handler load);
+
+/*
+ * Register save and load handlers.
+ *
+ * Save handlers will be invoked in an order which copes with any inter-
+ * entry dependencies. For now this means that HEADER will come first and
+ * END will come last, all others being invoked in order of 'typecode'.
+ *
+ * Load handlers will be invoked in the order of entries present in the
+ * buffer.
+ */
+#define DOMAIN_REGISTER_SAVE_LOAD(x, s, l)                    \
+    static int __init __domain_register_##x##_save_load(void) \
+    {                                                         \
+        domain_register_save_type(                            \
+            DOMAIN_SAVE_CODE(x),                              \
+            #x,                                               \
+            &(s),                                             \
+            &(l));                                            \
+                                                              \
+        return 0;                                             \
+    }                                                         \
+    __initcall(__domain_register_##x##_save_load);
+
+/* Callback functions */
+struct domain_save_ops {
+    /*
+     * Begin a new entry with the given descriptor (only type and instance
+     * are valid).
+     */
+    int (*begin)(void *priv, const struct domain_save_descriptor *desc);
+    /* Append data/padding to the buffer */
+    int (*append)(void *priv, const void *data, size_t len);
+    /*
+     * Complete the entry by updating the descriptor with the total
+     * length of the appended data (not including padding).
+     */
+    int (*end)(void *priv, size_t len);
+};
+
+struct domain_load_ops {
+    /* Read data/padding from the buffer */
+    int (*read)(void *priv, void *data, size_t len);
+};
+
+/*
+ * Entry points:
+ *
+ * ops:     These are callback functions provided by the caller that will
+ *          be used to write to (in the save case) or read from (in the
+ *          load case) the context buffer. See above for more detail.
+ * priv:    This is a pointer that will be passed to the copy function to
+ *          allow it to identify the context buffer and the current state
+ *          of the save or load operation.
+ * dry_run: If this is set then the caller of domain_save() is only trying
+ *          to acquire the total size of the data, not the data itself.
+ *          In this case the caller may supply different ops to avoid doing
+ *          unnecessary work.
+ */
+int domain_save(struct domain *d, const struct domain_save_ops *ops,
+                void *priv, bool dry_run);
+int domain_load(struct domain *d, const struct domain_load_ops *ops,
+                void *priv);
+
+#endif /* XEN_SAVE_H */
-- 
2.20.1


