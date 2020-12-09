Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A872D4663
	for <lists+xen-devel@lfdr.de>; Wed,  9 Dec 2020 17:10:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.48429.85666 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn22a-00036V-3y; Wed, 09 Dec 2020 16:10:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 48429.85666; Wed, 09 Dec 2020 16:10:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn22Z-00035S-TC; Wed, 09 Dec 2020 16:10:07 +0000
Received: by outflank-mailman (input) for mailman id 48429;
 Wed, 09 Dec 2020 16:10:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sDS6=FN=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kn22Y-0002Or-6q
 for xen-devel@lists.xenproject.org; Wed, 09 Dec 2020 16:10:06 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a2cfb2ef-da70-498d-8298-e61b67c49e9d;
 Wed, 09 Dec 2020 16:10:01 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 56988B262;
 Wed,  9 Dec 2020 16:10:00 +0000 (UTC)
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
X-Inumbo-ID: a2cfb2ef-da70-498d-8298-e61b67c49e9d
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607530200; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vnXlBBXDbMK1+Yl5pOhMMaMgERekk96ALZfGkXhOrdM=;
	b=dyDAkVMHprI72vEcBc/P1SiyqOVzfw0JGgZtEwAoi3MF32zbTWsgyhhau5+29pYArS0qz/
	CPY04Iw9K1z5cErHxJJ4xH4swH1+0+RDTc7Yy8ISvo48rCDvYF81cL2uvjVqi15Y0vb633
	OKJagR2VatOt1rVOfW5vJqlyE0FHhSY=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Dario Faggioli <dfaggioli@suse.com>
Subject: [PATCH v3 6/8] xen/cpupool: add cpupool directories
Date: Wed,  9 Dec 2020 17:09:54 +0100
Message-Id: <20201209160956.32456-7-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201209160956.32456-1-jgross@suse.com>
References: <20201209160956.32456-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add /cpupool/<cpupool-id> directories to hypfs. Those are completely
dynamic, so the related hypfs access functions need to be implemented.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- added const (Jan Beulich)
- call hypfs_add_dir() in helper (Dario Faggioli)
- switch locking to enter/exit callbacks

V3:
- use generic dyndirid enter function
- const for hypfs function vector (Jan Beulich)
- drop size calculation from cpupool_dir_read() (Jan Beulich)
- check cpupool id to not exceed UINT_MAX (Jan Beulich)
- coding style (#if/#else/#endif) (Jan Beulich)

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 docs/misc/hypfs-paths.pandoc |   9 +++
 xen/common/sched/cpupool.c   | 104 +++++++++++++++++++++++++++++++++++
 2 files changed, 113 insertions(+)

diff --git a/docs/misc/hypfs-paths.pandoc b/docs/misc/hypfs-paths.pandoc
index 6c7b2f7ee3..aaca1cdf92 100644
--- a/docs/misc/hypfs-paths.pandoc
+++ b/docs/misc/hypfs-paths.pandoc
@@ -175,6 +175,15 @@ The major version of Xen.
 
 The minor version of Xen.
 
+#### /cpupool/
+
+A directory of all current cpupools.
+
+#### /cpupool/*/
+
+The individual cpupools. Each entry is a directory with the name being the
+cpupool-id (e.g. /cpupool/0/).
+
 #### /params/
 
 A directory of runtime parameters.
diff --git a/xen/common/sched/cpupool.c b/xen/common/sched/cpupool.c
index 0db7d77219..f293ba0cc4 100644
--- a/xen/common/sched/cpupool.c
+++ b/xen/common/sched/cpupool.c
@@ -13,6 +13,8 @@
 
 #include <xen/cpu.h>
 #include <xen/cpumask.h>
+#include <xen/guest_access.h>
+#include <xen/hypfs.h>
 #include <xen/init.h>
 #include <xen/keyhandler.h>
 #include <xen/lib.h>
@@ -33,6 +35,7 @@ static int cpupool_moving_cpu = -1;
 static struct cpupool *cpupool_cpu_moving = NULL;
 static cpumask_t cpupool_locked_cpus;
 
+/* This lock nests inside sysctl or hypfs lock. */
 static DEFINE_SPINLOCK(cpupool_lock);
 
 static enum sched_gran __read_mostly opt_sched_granularity = SCHED_GRAN_cpu;
@@ -1003,12 +1006,113 @@ static struct notifier_block cpu_nfb = {
     .notifier_call = cpu_callback
 };
 
+#ifdef CONFIG_HYPFS
+
+static HYPFS_DIR_INIT(cpupool_pooldir, "%u");
+
+static int cpupool_dir_read(const struct hypfs_entry *entry,
+                            XEN_GUEST_HANDLE_PARAM(void) uaddr)
+{
+    int ret = 0;
+    const struct cpupool *c;
+
+    list_for_each_entry(c, &cpupool_list, list)
+    {
+        ret = hypfs_read_dyndir_id_entry(&cpupool_pooldir, c->cpupool_id,
+                                         list_is_last(&c->list, &cpupool_list),
+                                         &uaddr);
+        if ( ret )
+            break;
+    }
+
+    return ret;
+}
+
+static unsigned int cpupool_dir_getsize(const struct hypfs_entry *entry)
+{
+    const struct cpupool *c;
+    unsigned int size = 0;
+
+    list_for_each_entry(c, &cpupool_list, list)
+        size += hypfs_dynid_entry_size(entry, c->cpupool_id);
+
+    return size;
+}
+
+static const struct hypfs_entry *cpupool_dir_enter(
+    const struct hypfs_entry *entry)
+{
+    struct hypfs_dyndir_id *data;
+
+    data = hypfs_alloc_dyndata(struct hypfs_dyndir_id);
+    if ( !data )
+        return ERR_PTR(-ENOMEM);
+    data->id = CPUPOOLID_NONE;
+
+    spin_lock(&cpupool_lock);
+
+    return entry;
+}
+
+static void cpupool_dir_exit(const struct hypfs_entry *entry)
+{
+    spin_unlock(&cpupool_lock);
+
+    hypfs_free_dyndata();
+}
+
+static struct hypfs_entry *cpupool_dir_findentry(
+    const struct hypfs_entry_dir *dir, const char *name, unsigned int name_len)
+{
+    unsigned long id;
+    const char *end;
+    struct cpupool *cpupool;
+
+    id = simple_strtoul(name, &end, 10);
+    if ( end != name + name_len || id > UINT_MAX )
+        return ERR_PTR(-ENOENT);
+
+    cpupool = __cpupool_find_by_id(id, true);
+
+    if ( !cpupool )
+        return ERR_PTR(-ENOENT);
+
+    return hypfs_gen_dyndir_id_entry(&cpupool_pooldir, id, cpupool);
+}
+
+static const struct hypfs_funcs cpupool_dir_funcs = {
+    .enter = cpupool_dir_enter,
+    .exit = cpupool_dir_exit,
+    .read = cpupool_dir_read,
+    .write = hypfs_write_deny,
+    .getsize = cpupool_dir_getsize,
+    .findentry = cpupool_dir_findentry,
+};
+
+static HYPFS_DIR_INIT_FUNC(cpupool_dir, "cpupool", &cpupool_dir_funcs);
+
+static void cpupool_hypfs_init(void)
+{
+    hypfs_add_dir(&hypfs_root, &cpupool_dir, true);
+    hypfs_add_dyndir(&cpupool_dir, &cpupool_pooldir);
+}
+
+#else /* CONFIG_HYPFS */
+
+static void cpupool_hypfs_init(void)
+{
+}
+
+#endif /* CONFIG_HYPFS */
+
 static int __init cpupool_init(void)
 {
     unsigned int cpu;
 
     cpupool_gran_init();
 
+    cpupool_hypfs_init();
+
     cpupool0 = cpupool_create(0, 0);
     BUG_ON(IS_ERR(cpupool0));
     cpupool_put(cpupool0);
-- 
2.26.2


