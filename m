Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4B72D4687
	for <lists+xen-devel@lfdr.de>; Wed,  9 Dec 2020 17:16:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.48485.85779 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn28n-0004Yf-KB; Wed, 09 Dec 2020 16:16:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 48485.85779; Wed, 09 Dec 2020 16:16:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn28n-0004Y7-Fl; Wed, 09 Dec 2020 16:16:33 +0000
Received: by outflank-mailman (input) for mailman id 48485;
 Wed, 09 Dec 2020 16:16:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sDS6=FN=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kn28m-0004SF-21
 for xen-devel@lists.xenproject.org; Wed, 09 Dec 2020 16:16:32 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0ea05d4a-9f24-491c-9980-a2f279dc18e2;
 Wed, 09 Dec 2020 16:16:21 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F1257ADC5;
 Wed,  9 Dec 2020 16:16:20 +0000 (UTC)
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
X-Inumbo-ID: 0ea05d4a-9f24-491c-9980-a2f279dc18e2
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607530581; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KRtEHnVaMwtk5C3UwqZutxYpthuwswPsa5VGCeAsQUM=;
	b=IBlresOrvNrwtJf7ZbuEUaOvcpmnBPzux8muFTgD+31wgPQ6wDdatxNJHt1AUo0ZV3Tn3Q
	AdqtrHkD2RrTqrFyh8SrImPxPYJinrpTTsn9MP/TlG8lddn/+nTcTQYpi7loEs0k9kJ8ig
	DrrUGtUt8zl7uKYuZscvo6OvcfxTPjc=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: paul@xen.org,
	Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH RFC 2/3] xen/domain: add domain hypfs directories
Date: Wed,  9 Dec 2020 17:16:17 +0100
Message-Id: <20201209161618.309-3-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201209161618.309-1-jgross@suse.com>
References: <20201209161618.309-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add /domain/<domid> directories to hypfs. Those are completely
dynamic, so the related hypfs access functions need to be implemented.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V3:
- new patch
---
 docs/misc/hypfs-paths.pandoc |  10 +++
 xen/common/Makefile          |   1 +
 xen/common/hypfs_dom.c       | 137 +++++++++++++++++++++++++++++++++++
 3 files changed, 148 insertions(+)
 create mode 100644 xen/common/hypfs_dom.c

diff --git a/docs/misc/hypfs-paths.pandoc b/docs/misc/hypfs-paths.pandoc
index e86f7d0dbe..116642e367 100644
--- a/docs/misc/hypfs-paths.pandoc
+++ b/docs/misc/hypfs-paths.pandoc
@@ -34,6 +34,7 @@ not containing any '/' character. The names "." and ".." are reserved
 for file system internal use.
 
 VALUES are strings and can take the following forms (note that this represents
+>>>>>>> patched
 only the syntax used in this document):
 
 * STRING -- an arbitrary 0-delimited byte string.
@@ -191,6 +192,15 @@ The scheduling granularity of a cpupool.
 Writing a value is allowed only for cpupools with no cpu assigned and if the
 architecture is supporting different scheduling granularities.
 
+#### /domain/
+
+A directory of all current domains.
+
+#### /domain/*/
+
+The individual domains. Each entry is a directory with the name being the
+domain-id (e.g. /domain/0/).
+
 #### /params/
 
 A directory of runtime parameters.
diff --git a/xen/common/Makefile b/xen/common/Makefile
index d109f279a4..e88a9ee91e 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -15,6 +15,7 @@ obj-$(CONFIG_GRANT_TABLE) += grant_table.o
 obj-y += guestcopy.o
 obj-bin-y += gunzip.init.o
 obj-$(CONFIG_HYPFS) += hypfs.o
+obj-$(CONFIG_HYPFS) += hypfs_dom.o
 obj-y += irq.o
 obj-y += kernel.o
 obj-y += keyhandler.o
diff --git a/xen/common/hypfs_dom.c b/xen/common/hypfs_dom.c
new file mode 100644
index 0000000000..241e379b24
--- /dev/null
+++ b/xen/common/hypfs_dom.c
@@ -0,0 +1,137 @@
+/******************************************************************************
+ *
+ * hypfs_dom.c
+ *
+ * Per domain hypfs nodes.
+ */
+
+#include <xen/err.h>
+#include <xen/hypfs.h>
+#include <xen/lib.h>
+#include <xen/sched.h>
+
+static const struct hypfs_entry *domain_domdir_enter(
+    const struct hypfs_entry *entry)
+{
+    struct hypfs_dyndir_id *data;
+    struct domain *d;
+
+    data = hypfs_get_dyndata();
+    d = get_domain_by_id(data->id);
+    data->data = d;
+    if ( !d )
+        return ERR_PTR(-ENOENT);
+
+    return entry;
+}
+
+static void domain_domdir_exit(const struct hypfs_entry *entry)
+{
+    struct hypfs_dyndir_id *data;
+    struct domain *d;
+
+    data = hypfs_get_dyndata();
+    d = data->data;
+    put_domain(d);
+}
+
+static const struct hypfs_funcs domain_domdir_funcs = {
+    .enter = domain_domdir_enter,
+    .exit = domain_domdir_exit,
+    .read = hypfs_read_dir,
+    .write = hypfs_write_deny,
+    .getsize = hypfs_getsize,
+    .findentry = hypfs_dir_findentry,
+};
+
+static HYPFS_DIR_INIT_FUNC(domain_domdir, "%u", &domain_domdir_funcs);
+
+static int domain_dir_read(const struct hypfs_entry *entry,
+                           XEN_GUEST_HANDLE_PARAM(void) uaddr)
+{
+    int ret = 0;
+    const struct domain *d;
+
+    for_each_domain ( d )
+    {
+        ret = hypfs_read_dyndir_id_entry(&domain_domdir, d->domain_id,
+                                         !d->next_in_list, &uaddr);
+        if ( ret )
+            break;
+    }
+
+    return ret;
+}
+
+static unsigned int domain_dir_getsize(const struct hypfs_entry *entry)
+{
+    const struct domain *d;
+    unsigned int size = 0;
+
+    for_each_domain ( d )
+        size += hypfs_dynid_entry_size(entry, d->domain_id);
+
+    return size;
+}
+
+static const struct hypfs_entry *domain_dir_enter(
+    const struct hypfs_entry *entry)
+{
+    struct hypfs_dyndir_id *data;
+
+    data = hypfs_alloc_dyndata(struct hypfs_dyndir_id);
+    if ( !data )
+        return ERR_PTR(-ENOMEM);
+    data->id = DOMID_SELF;
+
+    rcu_read_lock(&domlist_read_lock);
+
+    return entry;
+}
+
+static void domain_dir_exit(const struct hypfs_entry *entry)
+{
+    rcu_read_unlock(&domlist_read_lock);
+
+    hypfs_free_dyndata();
+}
+
+static struct hypfs_entry *domain_dir_findentry(
+    const struct hypfs_entry_dir *dir, const char *name, unsigned int name_len)
+{
+    unsigned long id;
+    const char *end;
+    struct domain *d;
+
+    id = simple_strtoul(name, &end, 10);
+    if ( end != name + name_len )
+        return ERR_PTR(-ENOENT);
+
+    d = rcu_lock_domain_by_id(id);
+    if ( !d )
+        return ERR_PTR(-ENOENT);
+
+    rcu_unlock_domain(d);
+
+    return hypfs_gen_dyndir_id_entry(&domain_domdir, id, d);
+}
+
+static const struct hypfs_funcs domain_dir_funcs = {
+    .enter = domain_dir_enter,
+    .exit = domain_dir_exit,
+    .read = domain_dir_read,
+    .write = hypfs_write_deny,
+    .getsize = domain_dir_getsize,
+    .findentry = domain_dir_findentry,
+};
+
+static HYPFS_DIR_INIT_FUNC(domain_dir, "domain", &domain_dir_funcs);
+
+static int __init domhypfs_init(void)
+{
+    hypfs_add_dir(&hypfs_root, &domain_dir, true);
+    hypfs_add_dyndir(&domain_dir, &domain_domdir);
+
+    return 0;
+}
+__initcall(domhypfs_init);
-- 
2.26.2


