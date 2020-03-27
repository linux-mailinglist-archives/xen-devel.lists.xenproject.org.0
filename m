Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF549195DEB
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2020 19:52:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHu3g-0007yG-Am; Fri, 27 Mar 2020 18:50:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=KiP0=5M=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1jHu3f-0007y5-FD
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2020 18:50:19 +0000
X-Inumbo-ID: cd6b50e6-705b-11ea-8a16-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cd6b50e6-705b-11ea-8a16-12813bfff9fa;
 Fri, 27 Mar 2020 18:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pJOwAcrK6KIKWnvYsNAA9b7zTABurM9HiPwMs3sEXl8=; b=bY68tZweZSBfM2QtlBah3yF8Qf
 TNW51pccTQxSjhnwM7XRqQbG5t5eAcvyuxgWAwnxHCgJCwd/DAkW+j9GsZUagNNc0YtmTvPUqSbwM
 N3pAl15oBGtYm0bMpDOmhEI1AQgga2rlUlf9FdskdzGiAjlK+oAarewRaYECqI+zVSpg=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <paul@xen.org>)
 id 1jHu3d-0008KG-EA; Fri, 27 Mar 2020 18:50:17 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=u2f063a87eabd5f.cbg10.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <paul@xen.org>)
 id 1jHu3c-0007P4-TW; Fri, 27 Mar 2020 18:50:17 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Date: Fri, 27 Mar 2020 18:50:08 +0000
Message-Id: <20200327185012.1795-2-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200327185012.1795-1-paul@xen.org>
References: <20200327185012.1795-1-paul@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Xen-devel] [PATCH 1/5] xen/common: introduce a new framework for
 save/restore of 'domain' context
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
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Domain context is state held in the hypervisor that does not come under
the category of 'HVM state' but is instead 'PV state' that is common
between PV guests and enlightened HVM guests (i.e. those that have PV
drivers) such as event channel state, grant entry state, etc.

To allow enlightened HVM guests to be migrated without their co-operation
it will be necessary to transfer such state along with the domain's
memory image, architectural state, etc. This framework is introduced for
that purpose.

This patch adds the new public header and the low level implementation,
entered via the domain_save() or domain_load() functions. Subsequent
patches will introduce other parts of the framwork, and code that will
make use of it within the current version of the libxc migration stream.

Signed-off-by: Paul Durrant <paul@xen.org>
---
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Wei Liu <wl@xen.org>
---
 xen/common/Makefile       |   1 +
 xen/common/save.c         | 262 ++++++++++++++++++++++++++++++++++++++
 xen/include/public/save.h |  74 +++++++++++
 xen/include/xen/save.h    | 115 +++++++++++++++++
 4 files changed, 452 insertions(+)
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
index 0000000000..bef99452d8
--- /dev/null
+++ b/xen/common/save.c
@@ -0,0 +1,262 @@
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
+struct domain_context {
+    bool log;
+    struct domain_save_descriptor desc;
+    domain_copy_entry copy;
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
+int domain_save_entry(struct domain_context *c, unsigned int tc,
+                      const char *name, const struct vcpu *v, void *src,
+                      size_t src_len)
+{
+    int rc;
+
+    if ( c->log && tc != DOMAIN_SAVE_CODE(HEADER) &&
+         tc != DOMAIN_SAVE_CODE(END) )
+        gdprintk(XENLOG_INFO, "%pv save: %s (%lu)\n", v, name, src_len);
+
+    if ( !IS_ALIGNED(src_len, 8) )
+        return -EINVAL;
+
+    BUG_ON(tc != c->desc.typecode);
+    BUG_ON(v->vcpu_id != c->desc.instance);
+    c->desc.length = src_len;
+
+    rc = c->copy(c->priv, &c->desc, sizeof(c->desc));
+    if ( rc )
+        return rc;
+
+    return c->copy(c->priv, src, src_len);
+}
+
+int domain_save(struct domain *d, domain_copy_entry copy, void *priv,
+                unsigned long mask, bool dry_run)
+{
+    struct domain_context c = {
+        .copy = copy,
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
+        if ( (mask && !test_bit(i, &mask)) || !save )
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
+                c.desc.instance = v->vcpu_id;
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
+int domain_load_entry(struct domain_context *c, unsigned int tc,
+                      const char *name, const struct vcpu *v, void *dst,
+                      size_t dst_len, bool exact)
+{
+    int rc;
+
+    if ( c->log && tc != DOMAIN_SAVE_CODE(HEADER) &&
+         tc != DOMAIN_SAVE_CODE(END) )
+        gdprintk(XENLOG_INFO, "%pv load: %s (%lu)\n", v, name, dst_len);
+
+    BUG_ON(tc != c->desc.typecode);
+    BUG_ON(v->vcpu_id != c->desc.instance);
+
+    if ( (exact ?
+          (dst_len != c->desc.length) : (dst_len < c->desc.length)) ||
+         !IS_ALIGNED(c->desc.length, 8) )
+        return -EINVAL;
+
+    rc = c->copy(c->priv, dst, c->desc.length);
+    if ( rc )
+        return rc;
+
+    if ( !exact )
+    {
+        dst += c->desc.length;
+        memset(dst, 0, dst_len - c->desc.length);
+    }
+
+    return 0;
+}
+
+int domain_load(struct domain *d,  domain_copy_entry copy, void *priv,
+                unsigned long mask)
+{
+    struct domain_context c = {
+        .copy = copy,
+        .priv = priv,
+        .log = true,
+    };
+    struct domain_save_header h, e;
+    int rc;
+
+    ASSERT(d != current->domain);
+
+    if ( d->is_dying )
+        return -EINVAL;
+
+    rc = c.copy(c.priv, &c.desc, sizeof(c.desc));
+    if ( rc )
+        return rc;
+
+    if ( c.desc.typecode != DOMAIN_SAVE_CODE(HEADER) ||
+         c.desc.instance != 0 )
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
+        domain_load_handler load;
+        struct vcpu *v;
+
+        rc = c.copy(c.priv, &c.desc, sizeof(c.desc));
+        if ( rc )
+            break;
+
+        if ( c.desc.typecode == DOMAIN_SAVE_CODE(END) ) {
+            rc = DOMAIN_LOAD_ENTRY(END, &c, d->vcpu[0], &e, 0, true);
+            break;
+        }
+
+        rc = -EINVAL;
+        if ( c.desc.typecode >= ARRAY_SIZE(handlers) ||
+             c.desc.instance >= d->max_vcpus )
+            break;
+
+        i = c.desc.typecode;
+        load = handlers[i].load;
+        v = d->vcpu[c.desc.instance];
+
+        if ( mask && !test_bit(i, &mask) )
+        {
+            /* Sink the data */
+            rc = c.copy(c.priv, NULL, c.desc.length);
+            if ( rc )
+                break;
+
+            continue;
+        }
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
diff --git a/xen/include/public/save.h b/xen/include/public/save.h
new file mode 100644
index 0000000000..84981cd0f6
--- /dev/null
+++ b/xen/include/public/save.h
@@ -0,0 +1,74 @@
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
+    uint16_t instance;
+    /*
+     * Entry length not including this descriptor. Entries must be padded
+     * to a multiple of 8 bytes to make sure descriptors remain correctly
+     * aligned.
+     */
+    uint32_t length;
+};
+
+/*
+ * Each entry has a type associated with it. DECLARE_DOMAIN_SAVE_TYPE
+ * binds these things together.
+ */
+#define DECLARE_DOMAIN_SAVE_TYPE(_x, _code, _type) \
+    struct __DOMAIN_SAVE_TYPE_##_x { _type t; char c[_code]; };
+
+#define DOMAIN_SAVE_TYPE(_x) \
+    typeof (((struct __DOMAIN_SAVE_TYPE_##_x *)(0))->t)
+#define DOMAIN_SAVE_CODE(_x) \
+    (sizeof (((struct __DOMAIN_SAVE_TYPE_##_x *)(0))->c))
+#define DOMAIN_SAVE_MASK(_x) (1u << DOMAIN_SAVE_CODE(_x))
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
index 0000000000..d5846f9e68
--- /dev/null
+++ b/xen/include/xen/save.h
@@ -0,0 +1,115 @@
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
+int domain_save_entry(struct domain_context *c, unsigned int tc,
+                      const char *name, const struct vcpu *v, void *src,
+                      size_t src_len);
+
+#define DOMAIN_SAVE_ENTRY(_x, _c, _v, _src, _len)                        \
+        domain_save_entry((_c), DOMAIN_SAVE_CODE(_x), #_x, (_v), (_src), \
+                          (_len));
+
+int domain_load_entry(struct domain_context *c, unsigned int tc,
+                      const char *name, const struct vcpu *v, void *dest,
+                      size_t dest_len, bool exact);
+
+#define DOMAIN_LOAD_ENTRY(_x, _c, _v, _src, _len, _exact)                \
+        domain_load_entry((_c), DOMAIN_SAVE_CODE(_x), #_x, (_v), (_src), \
+                          (_len), (_exact));
+
+/*
+ * The 'dry_run' flag indicates that the caller of domain_save() (see
+ * below) is not trying to actually acquire the data, only the size
+ * of the data. The save handler can therefore limit work to only that
+ * which is necessary to call DOMAIN_SAVE_ENTRY() with an accurate value
+ * for '_len'.
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
+/* Copy callback function */
+typedef int (*domain_copy_entry)(void *priv, void *data, size_t len);
+
+/*
+ * Entry points:
+ *
+ * int domain_save(struct domain *d, domain_copy_entry copy, void *priv,
+ *                 unsigned long mask, bool dry_run);
+ * int domain_load(struct domain *d, domain_copy_entry copy, void *priv,
+ *                 unsigned long mask);
+ *
+ * copy:    This is a callback function provided by the caller that will be
+ *          used to write to (in the save case) or read from (in the load
+ *          case) the context buffer.
+ * priv:    This is a pointer that will be passed to the copy function to
+ *          allow it to identify the context buffer and the current state
+ *          of the save or load operation.
+ * mask:    This is a mask to determine which save record types should be
+ *          copied to or from the buffer.
+ *          If it is zero then all save record types will be copied.
+ *          If it is non-zero then only record types with codes
+ *          corresponding to set bits will be copied. I.e. to copy save
+ *          record 'type', set the bit in position DOMAIN_SAVE_CODE(type).
+ *          DOMAIN_SAVE_CODE(HEADER) and DOMAIN_SAVE_CODE(END) records must
+ *          always be present and thus will be copied regardless of whether
+ *          the bits in those positions are set or not.
+ * dry_run: See the comment concerning (*domain_save) above.
+ *
+ * NOTE: A convenience macro, DOMAIN_SAVE_MASK(type), is defined to support
+ *       setting bits in the mask field.
+ */
+int domain_save(struct domain *d, domain_copy_entry copy, void *priv,
+                unsigned long mask, bool dry_run);
+int domain_load(struct domain *d, domain_copy_entry copy, void *priv,
+                unsigned long mask);
+
+#endif /* __XEN_SAVE_H__ */
-- 
2.20.1


