Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0682C9918
	for <lists+xen-devel@lfdr.de>; Tue,  1 Dec 2020 09:22:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.41677.75117 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kk0vT-0005zU-JZ; Tue, 01 Dec 2020 08:22:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 41677.75117; Tue, 01 Dec 2020 08:22:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kk0vT-0005yV-Bd; Tue, 01 Dec 2020 08:22:19 +0000
Received: by outflank-mailman (input) for mailman id 41677;
 Tue, 01 Dec 2020 08:22:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UECe=FF=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kk0vR-0004Uj-KF
 for xen-devel@lists.xenproject.org; Tue, 01 Dec 2020 08:22:17 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8c0bbf43-36d4-4383-b29a-fee1a0eed84c;
 Tue, 01 Dec 2020 08:21:35 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 37707AD71;
 Tue,  1 Dec 2020 08:21:34 +0000 (UTC)
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
X-Inumbo-ID: 8c0bbf43-36d4-4383-b29a-fee1a0eed84c
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606810894; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HM46dWJ+2EckZVs46afJ02xSZlPII/ZflhbtJ/soVzY=;
	b=si2eglK8gFZfvlwn7DwLnIfjPwj443YIA2y0+2TssmsqgTD1VpUZvitNvDWOvPhJZbQS6V
	H6lMLFAHhyc3EJFWNXxzU9nCuJnsn3hnRCrUF1EVh1mxqA/k9p3Ppo39CylLKOsK5gOPwX
	ZRK+gWBGuZMp8brKkizNXEPDGrUqBxI=
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
Subject: [PATCH v2 15/17] xen/cpupool: add cpupool directories
Date: Tue,  1 Dec 2020 09:21:26 +0100
Message-Id: <20201201082128.15239-16-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201201082128.15239-1-jgross@suse.com>
References: <20201201082128.15239-1-jgross@suse.com>
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
---
 docs/misc/hypfs-paths.pandoc |   9 +++
 xen/common/sched/cpupool.c   | 122 +++++++++++++++++++++++++++++++++++
 2 files changed, 131 insertions(+)

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
index 0db7d77219..3e17fdf95b 100644
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
@@ -1003,12 +1006,131 @@ static struct notifier_block cpu_nfb = {
     .notifier_call = cpu_callback
 };
 
+#ifdef CONFIG_HYPFS
+static const struct hypfs_entry *cpupool_pooldir_enter(
+    const struct hypfs_entry *entry);
+
+static struct hypfs_funcs cpupool_pooldir_funcs = {
+    .enter = cpupool_pooldir_enter,
+    .exit = hypfs_node_exit,
+    .read = hypfs_read_dir,
+    .write = hypfs_write_deny,
+    .getsize = hypfs_getsize,
+    .findentry = hypfs_dir_findentry,
+};
+
+static HYPFS_VARDIR_INIT(cpupool_pooldir, "%u", &cpupool_pooldir_funcs);
+
+static const struct hypfs_entry *cpupool_pooldir_enter(
+    const struct hypfs_entry *entry)
+{
+    return &cpupool_pooldir.e;
+}
+
+static int cpupool_dir_read(const struct hypfs_entry *entry,
+                            XEN_GUEST_HANDLE_PARAM(void) uaddr)
+{
+    int ret = 0;
+    const struct cpupool *c;
+    unsigned int size = 0;
+
+    list_for_each_entry(c, &cpupool_list, list)
+    {
+        size += hypfs_dynid_entry_size(entry, c->cpupool_id);
+
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
+    data = hypfs_alloc_dyndata(sizeof(*data));
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
+    const struct cpupool *cpupool;
+
+    id = simple_strtoul(name, &end, 10);
+    if ( end != name + name_len )
+        return ERR_PTR(-ENOENT);
+
+    cpupool = __cpupool_find_by_id(id, true);
+
+    if ( !cpupool )
+        return ERR_PTR(-ENOENT);
+
+    return hypfs_gen_dyndir_entry_id(&cpupool_pooldir, id);
+}
+
+static struct hypfs_funcs cpupool_dir_funcs = {
+    .enter = cpupool_dir_enter,
+    .exit = cpupool_dir_exit,
+    .read = cpupool_dir_read,
+    .write = hypfs_write_deny,
+    .getsize = cpupool_dir_getsize,
+    .findentry = cpupool_dir_findentry,
+};
+
+static HYPFS_VARDIR_INIT(cpupool_dir, "cpupool", &cpupool_dir_funcs);
+
+static void cpupool_hypfs_init(void)
+{
+    hypfs_add_dir(&hypfs_root, &cpupool_dir, true);
+    hypfs_add_dyndir(&cpupool_dir, &cpupool_pooldir);
+}
+#else
+
+static void cpupool_hypfs_init(void)
+{
+}
+#endif
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


