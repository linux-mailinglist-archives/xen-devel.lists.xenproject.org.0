Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E83CB287BF2
	for <lists+xen-devel@lfdr.de>; Thu,  8 Oct 2020 20:58:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.4558.11934 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQb6o-0005Sp-0L; Thu, 08 Oct 2020 18:57:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 4558.11934; Thu, 08 Oct 2020 18:57:45 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQb6n-0005SQ-Sv; Thu, 08 Oct 2020 18:57:45 +0000
Received: by outflank-mailman (input) for mailman id 4558;
 Thu, 08 Oct 2020 18:57:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3RzB=DP=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1kQb6m-0005Rd-I8
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 18:57:44 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 22f72eed-43f4-4eb6-be00-1881072b7c92;
 Thu, 08 Oct 2020 18:57:43 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kQb6j-00041D-Hq; Thu, 08 Oct 2020 18:57:41 +0000
Received: from host109-146-187-185.range109-146.btcentralplus.com
 ([109.146.187.185] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kQb6j-0002P9-A5; Thu, 08 Oct 2020 18:57:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=3RzB=DP=xen.org=paul@srs-us1.protection.inumbo.net>)
	id 1kQb6m-0005Rd-I8
	for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 18:57:44 +0000
X-Inumbo-ID: 22f72eed-43f4-4eb6-be00-1881072b7c92
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 22f72eed-43f4-4eb6-be00-1881072b7c92;
	Thu, 08 Oct 2020 18:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=MH3Jcb2gIq1O8Mh9sTMsNlQA5vWj9EpZg8v7PZTX4es=; b=vLm+VSM1g8XlfzsW/Qq54eKPLa
	iubIj2PDUwi92PaDQQOb8bVRVlC60wlgtv8UUtz5UHjzygnhfWSZDYTZXK82LzAoOURDKxLVfPbF4
	J/KQz7Auv1cEE+alXIVZf8LNxjY9xpPJZaLwjsJI1EHqobBRoBFEttX2HXZa43GcJiLI=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kQb6j-00041D-Hq; Thu, 08 Oct 2020 18:57:41 +0000
Received: from host109-146-187-185.range109-146.btcentralplus.com ([109.146.187.185] helo=u2f063a87eabd5f.home)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kQb6j-0002P9-A5; Thu, 08 Oct 2020 18:57:41 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v10 02/11] xen: introduce implementation of save/restore of 'domain context'
Date: Thu,  8 Oct 2020 19:57:26 +0100
Message-Id: <20201008185735.29875-3-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201008185735.29875-1-paul@xen.org>
References: <20201008185735.29875-1-paul@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Paul Durrant <pdurrant@amazon.com>

A previous patch introduced the specification of the 'domain context' image
and the supporting public header. This patch introduces the code necessary
to generate and consume such an image. The entry points to the code are
domain_save_ctxt() and domain_load_ctxt(). Code to call these functions will
be introduced in a subsequent patch.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>
Cc: Ian Jackson <iwj@xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Wei Liu <wl@xen.org>

v10:
 - New in v10
 - Largely derived from patch #1 of the v9 series, but the code has been
   re-worked both functionally and cosmetically
---
 xen/common/Makefile    |   1 +
 xen/common/save.c      | 339 +++++++++++++++++++++++++++++++++++++++++
 xen/include/xen/save.h | 160 +++++++++++++++++++
 3 files changed, 500 insertions(+)
 create mode 100644 xen/common/save.c
 create mode 100644 xen/include/xen/save.h

diff --git a/xen/common/Makefile b/xen/common/Makefile
index b3b60a1ba2..3e6f21714a 100644
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
index 0000000000..9287b20198
--- /dev/null
+++ b/xen/common/save.c
@@ -0,0 +1,339 @@
+/*
+ * save.c: save and load state common to all domain types.
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
+struct domain_ctxt_state {
+    struct domain *d;
+    struct domain_context_record rec;
+    size_t len; /* for internal accounting */
+    union {
+        const struct domain_save_ctxt_ops *save;
+        const struct domain_load_ctxt_ops *load;
+    } ops;
+    void *priv;
+    bool dry_run;
+};
+
+static struct {
+    const char *name;
+    domain_save_ctxt_type save;
+    domain_load_ctxt_type load;
+} fns[DOMAIN_CONTEXT_NR_TYPES];
+
+void __init domain_register_ctxt_type(unsigned int type, const char *name,
+                                      domain_save_ctxt_type save,
+                                      domain_load_ctxt_type load)
+{
+    BUG_ON(type >= ARRAY_SIZE(fns));
+
+    ASSERT(!fns[type].save);
+    ASSERT(!fns[type].load);
+
+    fns[type].name = name;
+    fns[type].save = save;
+    fns[type].load = load;
+}
+
+int domain_save_ctxt_rec_begin(struct domain_ctxt_state *c,
+                               unsigned int type, unsigned int instance)
+{
+    struct domain_context_record rec = { .type = type, .instance = instance };
+    int rc;
+
+    c->rec = rec;
+    c->len = 0;
+
+    rc = c->ops.save->begin(c->priv, &c->rec);
+    if ( rc )
+        return rc;
+
+    return 0;
+}
+
+int domain_save_ctxt_rec_data(struct domain_ctxt_state *c, const void *src,
+                              size_t len)
+{
+    int rc = c->ops.save->append(c->priv, src, len);
+
+    if ( !rc )
+        c->len += len;
+
+    return rc;
+}
+
+int domain_save_ctxt_rec_end(struct domain_ctxt_state *c)
+{
+    size_t len = c->len;
+    size_t pad = ROUNDUP(len, DOMAIN_CONTEXT_RECORD_ALIGN) - len;
+    int rc;
+
+    if ( pad )
+    {
+        static const uint8_t zeroes[DOMAIN_CONTEXT_RECORD_ALIGN] = {};
+
+        rc = c->ops.save->append(c->priv, zeroes, pad);
+        if ( rc )
+            return rc;
+    }
+
+    if ( !c->dry_run )
+        gdprintk(XENLOG_DEBUG, "%pd save: %s[%u] +%zu (+%zu)\n", c->d,
+                 fns[c->rec.type].name, c->rec.instance,
+                 len, pad);
+
+    rc = c->ops.save->end(c->priv, c->len);
+
+    return rc;
+}
+
+int domain_save_ctxt(struct domain *d, const struct domain_save_ctxt_ops *ops,
+                     void *priv, bool dry_run)
+{
+    struct domain_ctxt_state c = {
+        .d = d,
+        .ops.save = ops,
+        .priv = priv,
+        .dry_run = dry_run,
+    };
+    domain_save_ctxt_type save;
+    unsigned int type;
+    int rc;
+
+    ASSERT(d != current->domain);
+
+    save = fns[DOMAIN_CONTEXT_START].save;
+    BUG_ON(!save);
+
+    rc = save(d, &c, dry_run);
+    if ( rc )
+        return rc;
+
+    domain_pause(d);
+
+    for ( type = DOMAIN_CONTEXT_START + 1; type < ARRAY_SIZE(fns); type++ )
+    {
+        save = fns[type].save;
+        if ( !save )
+            continue;
+
+        rc = save(d, &c, dry_run);
+        if ( rc )
+            break;
+    }
+
+    domain_unpause(d);
+
+    if ( rc )
+        return rc;
+
+    save = fns[DOMAIN_CONTEXT_END].save;
+    BUG_ON(!save);
+
+    return save(d, &c, dry_run);
+}
+
+int domain_load_ctxt_rec_begin(struct domain_ctxt_state *c,
+                               unsigned int type, unsigned int *instance)
+{
+    if ( type != c->rec.type )
+    {
+        ASSERT_UNREACHABLE();
+        return -EINVAL;
+    }
+
+    *instance = c->rec.instance;
+    c->len = 0;
+
+    return 0;
+}
+
+int domain_load_ctxt_rec_data(struct domain_ctxt_state *c, void *dst,
+                              size_t len)
+{
+    int rc = 0;
+
+    c->len += len;
+    if (c->len > c->rec.length)
+        return -ENODATA;
+
+    if ( dst )
+        rc = c->ops.load->read(c->priv, dst, len);
+    else /* sink data */
+    {
+        uint8_t ignore;
+
+        while ( !rc && len-- )
+            rc = c->ops.load->read(c->priv, &ignore, sizeof(ignore));
+    }
+
+    return rc;
+}
+
+int domain_load_ctxt_rec_end(struct domain_ctxt_state *c, bool ignore_data)
+{
+    size_t len = c->len;
+    size_t pad = ROUNDUP(len, DOMAIN_CONTEXT_RECORD_ALIGN) - len;
+
+    gdprintk(XENLOG_DEBUG, "%pd load: %s[%u] +%zu (+%zu)\n", c->d,
+             fns[c->rec.type].name, c->rec.instance,
+             len, pad);
+
+    while ( pad-- )
+    {
+        uint8_t zero;
+        int rc = c->ops.load->read(c->priv, &zero, sizeof(zero));
+
+        if ( rc )
+            return rc;
+
+        if ( zero )
+            return -EINVAL;
+    }
+
+    return 0;
+}
+
+int domain_load_ctxt(struct domain *d, const struct domain_load_ctxt_ops *ops,
+                     void *priv)
+{
+    struct domain_ctxt_state c = { .d = d, .ops.load = ops, .priv = priv, };
+    domain_load_ctxt_type load;
+    int rc;
+
+    ASSERT(d != current->domain);
+
+    rc = c.ops.load->read(c.priv, &c.rec, sizeof(c.rec));
+    if ( rc )
+        return rc;
+
+    load = fns[DOMAIN_CONTEXT_START].load;
+    BUG_ON(!load);
+
+    rc = load(d, &c);
+    if ( rc )
+        return rc;
+
+    domain_pause(d);
+
+    for (;;)
+    {
+        unsigned int type;
+
+        rc = c.ops.load->read(c.priv, &c.rec, sizeof(c.rec));
+        if ( rc )
+            break;
+
+        type = c.rec.type;
+        if ( type == DOMAIN_CONTEXT_END )
+            break;
+
+        rc = -EINVAL;
+        if ( type >= ARRAY_SIZE(fns) )
+            break;
+
+        load = fns[type].load;
+        if ( !load )
+            break;
+
+        rc = load(d, &c);
+        if ( rc )
+            break;
+    }
+
+    domain_unpause(d);
+
+    if ( rc )
+        return rc;
+
+    load = fns[DOMAIN_CONTEXT_END].load;
+    BUG_ON(!load);
+
+    return load(d, &c);
+}
+
+static int save_start(struct domain *d, struct domain_ctxt_state *c,
+                      bool dry_run)
+{
+    static const struct domain_context_start s = {
+        .xen_major = XEN_VERSION,
+        .xen_minor = XEN_SUBVERSION,
+    };
+
+    return domain_save_ctxt_rec(c, DOMAIN_CONTEXT_START, 0, &s, sizeof(s));
+}
+
+static int load_start(struct domain *d, struct domain_ctxt_state *c)
+{
+    static struct domain_context_start s;
+    unsigned int i;
+    int rc = domain_load_ctxt_rec(c, DOMAIN_CONTEXT_START, &i, &s, sizeof(s));
+
+    if ( rc )
+        return rc;
+
+    if ( i )
+        return -EINVAL;
+
+    /*
+     * Make sure we are not attempting to load an image generated by a newer
+     * version of Xen.
+     */
+    if ( s.xen_major > XEN_VERSION && s.xen_minor > XEN_SUBVERSION )
+        return -EOPNOTSUPP;
+
+    return 0;
+}
+
+DOMAIN_REGISTER_CTXT_TYPE(START, save_start, load_start);
+
+static int save_end(struct domain *d, struct domain_ctxt_state *c,
+                    bool dry_run)
+{
+    static const struct domain_context_end e = {};
+
+    return domain_save_ctxt_rec(c, DOMAIN_CONTEXT_END, 0, &e, sizeof(e));
+}
+
+static int load_end(struct domain *d, struct domain_ctxt_state *c)
+{
+    unsigned int i;
+    int rc = domain_load_ctxt_rec(c, DOMAIN_CONTEXT_END, &i, NULL,
+                                  sizeof(struct domain_context_end));
+
+    if ( rc )
+        return rc;
+
+    if ( i )
+        return -EINVAL;
+
+    return 0;
+}
+
+DOMAIN_REGISTER_CTXT_TYPE(END, save_end, load_end);
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
diff --git a/xen/include/xen/save.h b/xen/include/xen/save.h
new file mode 100644
index 0000000000..358cf2f700
--- /dev/null
+++ b/xen/include/xen/save.h
@@ -0,0 +1,160 @@
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
+struct domain_ctxt_state;
+
+int domain_save_ctxt_rec_begin(struct domain_ctxt_state *c, unsigned int type,
+                               unsigned int instance);
+int domain_save_ctxt_rec_data(struct domain_ctxt_state *c, const void *data,
+                              size_t len);
+int domain_save_ctxt_rec_end(struct domain_ctxt_state *c);
+
+static inline int domain_save_ctxt_rec(struct domain_ctxt_state *c,
+                                       unsigned int type, unsigned int instance,
+                                       const void *src, size_t len)
+{
+    int rc;
+
+    rc = domain_save_ctxt_rec_begin(c, type, instance);
+    if ( rc )
+        return rc;
+
+    rc = domain_save_ctxt_rec_data(c, src, len);
+    if ( rc )
+        return rc;
+
+    return domain_save_ctxt_rec_end(c);
+}
+
+int domain_load_ctxt_rec_begin(struct domain_ctxt_state *c, unsigned int type,
+                               unsigned int *instance);
+int domain_load_ctxt_rec_data(struct domain_ctxt_state *c, void *data,
+                              size_t len);
+int domain_load_ctxt_rec_end(struct domain_ctxt_state *c, bool ignore_data);
+
+static inline int domain_load_ctxt_rec(struct domain_ctxt_state *c,
+                                       unsigned int type,
+                                       unsigned int *instance, void *dst,
+                                       size_t len)
+{
+    int rc;
+
+    rc = domain_load_ctxt_rec_begin(c, type, instance);
+    if ( rc )
+        return rc;
+
+    rc = domain_load_ctxt_rec_data(c, dst, len);
+    if ( rc )
+        return rc;
+
+    return domain_load_ctxt_rec_end(c, false);
+}
+
+/*
+ * The 'dry_run' flag indicates that the caller of domain_save_ctxt() (see below)
+ * is not trying to actually acquire the data, only the size of the data.
+ * The save handler can therefore limit work to only that which is necessary
+ * to call domain_save_ctxt_rec_data() the correct number of times with accurate
+ * values for 'len'.
+ *
+ * NOTE: the domain pointer argument to domain_save_ctxt_type is not const as
+ * some handlers may need to acquire locks.
+ */
+typedef int (*domain_save_ctxt_type)(struct domain *d,
+                                     struct domain_ctxt_state *c,
+                                     bool dry_run);
+typedef int (*domain_load_ctxt_type)(struct domain *d,
+                                     struct domain_ctxt_state *c);
+
+void domain_register_ctxt_type(unsigned int type, const char *name,
+                               domain_save_ctxt_type save,
+                               domain_load_ctxt_type load);
+
+/*
+ * Register save and load handlers for a record type.
+ *
+ * Save handlers will be invoked in an order which copes with any inter-
+ * entry dependencies. For now this means that HEADER will come first and
+ * END will come last, all others being invoked in order of 'typecode'.
+ *
+ * Load handlers will be invoked in the order of entries present in the
+ * buffer.
+ */
+#define DOMAIN_REGISTER_CTXT_TYPE(x, s, l)                    \
+    static int __init __domain_register_##x##_ctxt_type(void) \
+    {                                                         \
+        domain_register_ctxt_type(                            \
+            DOMAIN_CONTEXT_ ## x,                             \
+            #x,                                               \
+            &(s),                                             \
+            &(l));                                            \
+                                                              \
+        return 0;                                             \
+    }                                                         \
+    __initcall(__domain_register_##x##_ctxt_type);
+
+/* Callback functions */
+struct domain_save_ctxt_ops {
+    /*
+     * Begin a new entry with the given record (only type and instance are
+     * valid).
+     */
+    int (*begin)(void *priv, const struct domain_context_record *rec);
+    /* Append data/padding to the buffer */
+    int (*append)(void *priv, const void *data, size_t len);
+    /*
+     * Complete the entry by updating the record with the total length of the
+     * appended data (not including padding).
+     */
+    int (*end)(void *priv, size_t len);
+};
+
+struct domain_load_ctxt_ops {
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
+int domain_save_ctxt(struct domain *d, const struct domain_save_ctxt_ops *ops,
+                     void *priv, bool dry_run);
+int domain_load_ctxt(struct domain *d, const struct domain_load_ctxt_ops *ops,
+                     void *priv);
+
+#endif /* XEN_SAVE_H */
-- 
2.20.1


