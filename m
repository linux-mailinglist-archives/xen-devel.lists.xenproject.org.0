Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B041A12D6
	for <lists+xen-devel@lfdr.de>; Tue,  7 Apr 2020 19:39:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jLsBh-0000uO-Rk; Tue, 07 Apr 2020 17:39:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ZKm6=5X=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1jLsBg-0000ts-8E
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2020 17:39:00 +0000
X-Inumbo-ID: a676ad8e-78f6-11ea-8122-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a676ad8e-78f6-11ea-8122-12813bfff9fa;
 Tue, 07 Apr 2020 17:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sUupaxZe1m2wsdVWEzsPraTd+XGtEAcP1dSKKA8pr8Y=; b=q+fzA2Z+09+F7KEUbp/OSvrfy4
 usYZ1zrMioIRKAZFi8+zCmWBGxPO69g2PklYDR1duDXq+lCoyISqQkjb/P0FYZUq2YsuJQy+1QjFI
 peVzmkbqLoFAoiGCgZR0qKG61ENVESl9sxLsfLbHTD+FH/mky1XTgcis3u95ddcUUVO4=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <paul@xen.org>)
 id 1jLsBZ-0000Jc-1P; Tue, 07 Apr 2020 17:38:53 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=u2f063a87eabd5f.cbg10.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <paul@xen.org>)
 id 1jLsBY-00088J-H6; Tue, 07 Apr 2020 17:38:52 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v2 1/5] xen/common: introduce a new framework for save/restore
 of 'domain' context
Date: Tue,  7 Apr 2020 18:38:43 +0100
Message-Id: <20200407173847.1595-2-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200407173847.1595-1-paul@xen.org>
References: <20200407173847.1595-1-paul@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
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
---
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Wei Liu <wl@xen.org>
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "Roger Pau Monné" <roger.pau@citrix.com>

v2:
 - Allow multi-stage save/load to avoid the need to double-buffer
 - Get rid of the masks and add an 'ignore' flag instead
 - Create copy function union to preserve const save buffer
 - Deprecate HVM-only framework
---
 xen/common/Makefile                    |   1 +
 xen/common/save.c                      | 329 +++++++++++++++++++++++++
 xen/include/public/arch-arm/hvm/save.h |   5 +
 xen/include/public/arch-x86/hvm/save.h |   5 +
 xen/include/public/save.h              |  84 +++++++
 xen/include/xen/save.h                 | 152 ++++++++++++
 6 files changed, 576 insertions(+)
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
index 0000000000..6cdac3785b
--- /dev/null
+++ b/xen/common/save.c
@@ -0,0 +1,329 @@
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
+#include <xen/save.h>
+
+union domain_copy_entry {
+    domain_write_entry write;
+    domain_read_entry read;
+};
+
+struct domain_context {
+    bool log;
+    struct domain_save_descriptor desc;
+    size_t data_len;
+    union domain_copy_entry copy;
+    void *priv;
+};
+
+static struct {
+    const char *name;
+    bool per_vcpu;
+    domain_save_handler save;
+    domain_load_handler load;
+} handlers[DOMAIN_SAVE_CODE_MAX + 1];
+
+void __init domain_register_save_type(unsigned int tc, const char *name,
+                                      bool per_vcpu,
+                                      domain_save_handler save,
+                                      domain_load_handler load)
+{
+    BUG_ON(tc > ARRAY_SIZE(handlers));
+
+    ASSERT(!handlers[tc].save);
+    ASSERT(!handlers[tc].load);
+
+    handlers[tc].name = name;
+    handlers[tc].per_vcpu = per_vcpu;
+    handlers[tc].save = save;
+    handlers[tc].load = load;
+}
+
+int domain_save_begin(struct domain_context *c, unsigned int tc,
+                      const char *name, const struct vcpu *v, size_t len)
+{
+    int rc;
+
+    if ( c->log )
+        gdprintk(XENLOG_INFO, "%pv save: %s (%lu)\n", v, name,
+                 (unsigned long)len);
+
+    BUG_ON(tc != c->desc.typecode);
+    BUG_ON(v->vcpu_id != c->desc.vcpu_id);
+
+    ASSERT(!c->data_len);
+    c->data_len = c->desc.length = len;
+
+    rc = c->copy.write(c->priv, &c->desc, sizeof(c->desc));
+    if ( rc )
+        return rc;
+
+    c->desc.length = 0;
+
+    return 0;
+}
+
+int domain_save_data(struct domain_context *c, const void *src, size_t len)
+{
+    if ( c->desc.length + len > c->data_len )
+        return -ENOSPC;
+
+    c->desc.length += len;
+
+    return c->copy.write(c->priv, src, len);
+}
+
+int domain_save_end(struct domain_context *c)
+{
+    /*
+     * If desc.length does not match the length specified in
+     * domain_save_begin(), there should have been more data.
+     */
+    if ( c->desc.length != c->data_len )
+        return -EIO;
+
+    c->data_len = 0;
+
+    return 0;
+}
+
+int domain_save(struct domain *d, domain_write_entry write, void *priv,
+                bool dry_run)
+{
+    struct domain_context c = {
+        .copy.write = write,
+        .priv = priv,
+        .log = !dry_run,
+    };
+    struct domain_save_header h = {
+        .magic = DOMAIN_SAVE_MAGIC,
+        .version = DOMAIN_SAVE_VERSION,
+    };
+    struct domain_save_header e;
+    unsigned int i;
+    int rc;
+
+    ASSERT(d != current->domain);
+
+    if ( d->is_dying )
+        return -EINVAL;
+
+    domain_pause(d);
+
+    c.desc.typecode = DOMAIN_SAVE_CODE(HEADER);
+
+    rc = DOMAIN_SAVE_ENTRY(HEADER, &c, d->vcpu[0], &h, sizeof(h));
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
+        memset(&c.desc, 0, sizeof(c.desc));
+        c.desc.typecode = i;
+
+        if ( handlers[i].per_vcpu )
+        {
+            struct vcpu *v;
+
+            for_each_vcpu ( d, v )
+            {
+                c.desc.vcpu_id = v->vcpu_id;
+
+                rc = save(v, &c, dry_run);
+                if ( rc )
+                    goto out;
+            }
+        }
+        else
+        {
+            rc = save(d->vcpu[0], &c, dry_run);
+            if ( rc )
+                goto out;
+        }
+    }
+
+    memset(&c.desc, 0, sizeof(c.desc));
+    c.desc.typecode = DOMAIN_SAVE_CODE(END);
+
+    rc = DOMAIN_SAVE_ENTRY(END, &c, d->vcpu[0], &e, 0);
+
+ out:
+    domain_unpause(d);
+
+    return rc;
+}
+
+int domain_load_begin(struct domain_context *c, unsigned int tc,
+                      const char *name, const struct vcpu *v, size_t len,
+                      bool exact)
+{
+    if ( c->log )
+        gdprintk(XENLOG_INFO, "%pv load: %s (%lu)\n", v, name,
+                 (unsigned long)len);
+
+    BUG_ON(tc != c->desc.typecode);
+    BUG_ON(v->vcpu_id != c->desc.vcpu_id);
+
+    if ( (exact && (len != c->desc.length)) ||
+         (len < c->desc.length) )
+        return -EINVAL;
+
+    ASSERT(!c->data_len);
+    c->data_len = len;
+
+    return 0;
+}
+
+int domain_load_data(struct domain_context *c, void *dst, size_t len)
+{
+    size_t copy_len = min_t(size_t, len, c->desc.length);
+    int rc;
+
+    if ( c->data_len < len )
+        return -ENODATA;
+
+    c->data_len -= len;
+    c->desc.length -= copy_len;
+
+    rc = c->copy.read(c->priv, dst, copy_len);
+    if ( rc )
+        return rc;
+
+    /* Zero extend if the descriptor is exhausted */
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
+    /* If data_len is non-zero there is unread data */
+    if ( c->data_len )
+        return -EIO;
+
+    return 0;
+}
+
+int domain_load(struct domain *d, domain_read_entry read, void *priv)
+{
+    struct domain_context c = {
+        .copy.read = read,
+        .priv = priv,
+        .log = true,
+    };
+    struct domain_save_header h;
+    int rc;
+
+    ASSERT(d != current->domain);
+
+    if ( d->is_dying )
+        return -EINVAL;
+
+    rc = c.copy.read(c.priv, &c.desc, sizeof(c.desc));
+    if ( rc )
+        return rc;
+
+    if ( c.desc.typecode != DOMAIN_SAVE_CODE(HEADER) || c.desc.vcpu_id ||
+         c.desc.flags )
+        return -EINVAL;
+
+    rc = DOMAIN_LOAD_ENTRY(HEADER, &c, d->vcpu[0], &h, sizeof(h), true);
+    if ( rc )
+        return rc;
+
+    if ( h.magic != DOMAIN_SAVE_MAGIC || h.version != DOMAIN_SAVE_VERSION )
+        return -EINVAL;
+
+    domain_pause(d);
+
+    for (;;)
+    {
+        unsigned int i;
+        unsigned int flags;
+        domain_load_handler load;
+        struct vcpu *v;
+
+        rc = c.copy.read(c.priv, &c.desc, sizeof(c.desc));
+        if ( rc )
+            break;
+
+        rc = -EINVAL;
+
+        flags = c.desc.flags;
+        if ( flags & ~DOMAIN_SAVE_FLAG_IGNORE )
+            break;
+
+        if ( c.desc.typecode == DOMAIN_SAVE_CODE(END) ) {
+            if ( !(flags & DOMAIN_SAVE_FLAG_IGNORE) )
+                rc = DOMAIN_LOAD_ENTRY(END, &c, d->vcpu[0], NULL, 0, true);
+
+            break;
+        }
+
+        i = c.desc.typecode;
+        if ( i >= ARRAY_SIZE(handlers) )
+            break;
+
+        if ( (!handlers[i].per_vcpu && c.desc.vcpu_id) ||
+             (c.desc.vcpu_id >= d->max_vcpus) )
+            break;
+
+        v = d->vcpu[c.desc.vcpu_id];
+
+        if ( flags & DOMAIN_SAVE_FLAG_IGNORE )
+        {
+            /* Sink the data */
+            rc = domain_load_entry(&c, c.desc.typecode, "IGNORED",
+                                   v, NULL, c.desc.length, true);
+            if ( rc )
+                break;
+
+            continue;
+        }
+
+        load = handlers[i].load;
+
+        rc = load ? load(v, &c) : -EOPNOTSUPP;
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
index 0000000000..7e5f8752bd
--- /dev/null
+++ b/xen/include/public/save.h
@@ -0,0 +1,84 @@
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
+#ifndef __XEN_PUBLIC_SAVE_H__
+#define __XEN_PUBLIC_SAVE_H__
+
+#include "xen.h"
+
+/* Each entry is preceded by a descriptor */
+struct domain_save_descriptor {
+    uint16_t typecode;
+    /*
+     * Each entry will contain either to global or per-vcpu domain state.
+     * Entries relating to global state should have zero in this field.
+     */
+    uint16_t vcpu_id;
+    uint32_t flags;
+    /*
+     * When restoring state this flag can be set in a descriptor to cause
+     * its content to be ignored.
+     *
+     * NOTE: It is invalid to set this flag for HEADER or END records (see
+     *       below).
+     */
+#define _DOMAIN_SAVE_FLAG_IGNORE 0
+#define DOMAIN_SAVE_FLAG_IGNORE (1u << _DOMAIN_SAVE_FLAG_IGNORE)
+
+    /* Entry length not including this descriptor */
+    uint64_t length;
+};
+
+/*
+ * Each entry has a type associated with it. DECLARE_DOMAIN_SAVE_TYPE
+ * binds these things together.
+ */
+#define DECLARE_DOMAIN_SAVE_TYPE(_x, _code, _type) \
+    struct __DOMAIN_SAVE_TYPE_##_x { char c[_code]; _type t; };
+
+#define DOMAIN_SAVE_CODE(_x) \
+    (sizeof(((struct __DOMAIN_SAVE_TYPE_##_x *)(0))->c))
+#define DOMAIN_SAVE_TYPE(_x) \
+    typeof(((struct __DOMAIN_SAVE_TYPE_##_x *)(0))->t)
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
+    uint32_t magic;             /* Must be DOMAIN_SAVE_MAGIC */
+    uint32_t version;           /* Save format version */
+};
+DECLARE_DOMAIN_SAVE_TYPE(HEADER, 1, struct domain_save_header);
+
+#define DOMAIN_SAVE_CODE_MAX 1
+
+#endif /* __XEN_PUBLIC_SAVE_H__ */
diff --git a/xen/include/xen/save.h b/xen/include/xen/save.h
new file mode 100644
index 0000000000..879bbb4390
--- /dev/null
+++ b/xen/include/xen/save.h
@@ -0,0 +1,152 @@
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
+#ifndef __XEN_SAVE_H__
+#define __XEN_SAVE_H__
+
+#include <xen/sched.h>
+#include <xen/types.h>
+#include <xen/init.h>
+
+#include <public/xen.h>
+#include <public/save.h>
+
+struct domain_context;
+
+int domain_save_begin(struct domain_context *c, unsigned int tc,
+                      const char *name, const struct vcpu *v, size_t len);
+
+#define DOMAIN_SAVE_BEGIN(_x, _c, _v, _len) \
+        domain_save_begin((_c), DOMAIN_SAVE_CODE(_x), #_x, (_v), (_len))
+
+int domain_save_data(struct domain_context *c, const void *data, size_t len);
+int domain_save_end(struct domain_context *c);
+
+static inline int domain_save_entry(struct domain_context *c,
+                                    unsigned int tc, const char *name,
+                                    const struct vcpu *v, const void *src,
+                                    size_t len)
+{
+    int rc;
+
+    rc = domain_save_begin(c, tc, name, v, len);
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
+#define DOMAIN_SAVE_ENTRY(_x, _c, _v, _src, _len) \
+    domain_save_entry((_c), DOMAIN_SAVE_CODE(_x), #_x, (_v), (_src), (_len))
+
+int domain_load_begin(struct domain_context *c, unsigned int tc,
+                      const char *name, const struct vcpu *v, size_t len,
+                      bool exact);
+
+#define DOMAIN_LOAD_BEGIN(_x, _c, _v, _len, _exact) \
+        domain_load_begin((_c), DOMAIN_SAVE_CODE(_x), #_x, (_v), (_len), \
+                          (_exact));
+
+int domain_load_data(struct domain_context *c, void *data, size_t len);
+int domain_load_end(struct domain_context *c);
+
+static inline int domain_load_entry(struct domain_context *c,
+                                    unsigned int tc, const char *name,
+                                    const struct vcpu *v, void *dst,
+                                    size_t len, bool exact)
+{
+    int rc;
+
+    rc = domain_load_begin(c, tc, name, v, len, exact);
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
+#define DOMAIN_LOAD_ENTRY(_x, _c, _v, _dst, _len, _exact) \
+    domain_load_entry((_c), DOMAIN_SAVE_CODE(_x), #_x, (_v), (_dst), (_len), \
+                          (_exact))
+
+/*
+ * The 'dry_run' flag indicates that the caller of domain_save() (see
+ * below) is not trying to actually acquire the data, only the size
+ * of the data. The save handler can therefore limit work to only that
+ * which is necessary to call DOMAIN_SAVE_BEGIN/ENTRY() with an accurate
+ * value for '_len'.
+ */
+typedef int (*domain_save_handler)(const struct vcpu *v,
+                                   struct domain_context *h,
+                                   bool dry_run);
+typedef int (*domain_load_handler)(struct vcpu *v,
+                                   struct domain_context *h);
+
+void domain_register_save_type(unsigned int tc, const char *name,
+                               bool per_vcpu,
+                               domain_save_handler save,
+                               domain_load_handler load);
+
+/*
+ * Register save and restore handlers. Save handlers will be invoked
+ * in order of DOMAIN_SAVE_CODE().
+ */
+#define DOMAIN_REGISTER_SAVE_RESTORE(_x, _per_vcpu, _save, _load) \
+static int __init __domain_register_##_x##_save_restore(void)     \
+{                                                                 \
+    domain_register_save_type(                                    \
+        DOMAIN_SAVE_CODE(_x),                                     \
+        #_x,                                                      \
+        (_per_vcpu),                                              \
+        &(_save),                                                 \
+        &(_load));                                                \
+                                                                  \
+    return 0;                                                     \
+}                                                                 \
+__initcall(__domain_register_##_x##_save_restore);
+
+/* Copy callback functions */
+typedef int (*domain_write_entry)(void *priv, const void *data, size_t len);
+typedef int (*domain_read_entry)(void *priv, void *data, size_t len);
+
+/*
+ * Entry points:
+ *
+ * int domain_save(struct domain *d, domain_copy_entry copy, void *priv,
+ *                 bool dry_run);
+ * int domain_load(struct domain *d, domain_copy_entry copy, void *priv);
+ *
+ * write/read: This is a callback function provided by the caller that will
+ *             be used to write to (in the save case) or read from (in the
+ *             load case) the context buffer.
+ * priv:       This is a pointer that will be passed to the copy function to
+ *             allow it to identify the context buffer and the current state
+ *             of the save or load operation.
+ */
+int domain_save(struct domain *d, domain_write_entry write, void *priv,
+                bool dry_run);
+int domain_load(struct domain *d, domain_read_entry read, void *priv);
+
+#endif /* __XEN_SAVE_H__ */
-- 
2.20.1


