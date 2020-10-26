Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D18298940
	for <lists+xen-devel@lfdr.de>; Mon, 26 Oct 2020 10:13:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.12085.31713 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kWyZO-00054e-BA; Mon, 26 Oct 2020 09:13:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 12085.31713; Mon, 26 Oct 2020 09:13:38 +0000
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
	id 1kWyZO-00053L-2Z; Mon, 26 Oct 2020 09:13:38 +0000
Received: by outflank-mailman (input) for mailman id 12085;
 Mon, 26 Oct 2020 09:13:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=l58c=EB=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kWyZL-0004f1-Rl
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 09:13:35 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 07e6da9e-aa3a-4f34-8f06-da9f0e4f8e2e;
 Mon, 26 Oct 2020 09:13:21 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E1AA1B245;
 Mon, 26 Oct 2020 09:13:20 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=l58c=EB=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kWyZL-0004f1-Rl
	for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 09:13:35 +0000
X-Inumbo-ID: 07e6da9e-aa3a-4f34-8f06-da9f0e4f8e2e
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 07e6da9e-aa3a-4f34-8f06-da9f0e4f8e2e;
	Mon, 26 Oct 2020 09:13:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603703601;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M2krL48gwKtn5+NJtv6lNCEGODluTgIO1YbuF6efH7k=;
	b=L+h43uW4CetUkMAM1vDXaII+0gwnfcoYb/izkWwW0fDF4ogdzW7BHD4v/gdgvaBmOMzzRq
	zfpnAMZrb5Y2uk3vtPGOo8On3aJYFUMAKtnv26Q3xIL0C6IfdKlkiFVO8pixTBAvyPQa1p
	/irvmsgO06EfxSxhvotv8XmbPFgqF84=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id E1AA1B245;
	Mon, 26 Oct 2020 09:13:20 +0000 (UTC)
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
Subject: [PATCH 10/12] xen/hypfs: add cpupool directories
Date: Mon, 26 Oct 2020 10:13:14 +0100
Message-Id: <20201026091316.25680-11-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201026091316.25680-1-jgross@suse.com>
References: <20201026091316.25680-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add /cpupool/<cpupool-id> directories to hypfs. Those are completely
dynamic, so the related hypfs access functions need to be implemented.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 docs/misc/hypfs-paths.pandoc |  9 +++++
 xen/common/sched/cpupool.c   | 78 ++++++++++++++++++++++++++++++++++++
 2 files changed, 87 insertions(+)

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
index 84f326ea63..8612ee5cf6 100644
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
@@ -992,6 +994,78 @@ static struct notifier_block cpu_nfb = {
     .notifier_call = cpu_callback
 };
 
+#ifdef CONFIG_HYPFS
+static HYPFS_DIR_INIT(cpupool_pooldir, "id");
+
+static int cpupool_dir_read(const struct hypfs_entry *entry,
+                            XEN_GUEST_HANDLE_PARAM(void) uaddr)
+{
+    int ret = 0;
+    struct cpupool **q;
+
+    spin_lock(&cpupool_lock);
+
+    for_each_cpupool(q)
+    {
+        ret = hypfs_read_dyndir_id_entry(&cpupool_pooldir, (*q)->cpupool_id,
+                                         !(*q)->next, &uaddr);
+        if ( ret )
+            break;
+    }
+
+    spin_unlock(&cpupool_lock);
+
+    return ret;
+}
+
+static unsigned int cpupool_dir_getsize(const struct hypfs_entry *entry)
+{
+    struct cpupool **q;
+    unsigned int size = 0;
+
+    spin_lock(&cpupool_lock);
+
+    for_each_cpupool(q)
+        size += HYPFS_DIRENTRY_SIZE(snprintf(NULL, 0, "%d", (*q)->cpupool_id));
+
+    spin_unlock(&cpupool_lock);
+
+    return size;
+}
+
+static struct hypfs_entry *cpupool_dir_findentry(struct hypfs_entry_dir *dir,
+                                                 const char *name,
+                                                 unsigned int name_len)
+{
+    unsigned long id;
+    const char *end;
+    struct cpupool *cpupool;
+
+    id = simple_strtoul(name, &end, 10);
+    if ( id > INT_MAX || end != name + name_len )
+        return ERR_PTR(-ENOENT);
+
+    spin_lock(&cpupool_lock);
+
+    cpupool = __cpupool_find_by_id(id, true);
+
+    spin_unlock(&cpupool_lock);
+
+    if ( !cpupool )
+        return ERR_PTR(-ENOENT);
+
+    return hypfs_gen_dyndir_entry_id(&cpupool_pooldir, id);
+}
+
+static struct hypfs_funcs cpupool_dir_funcs = {
+    .read = cpupool_dir_read,
+    .getsize = cpupool_dir_getsize,
+    .findentry = cpupool_dir_findentry,
+};
+
+static HYPFS_VARDIR_INIT(cpupool_dir, "cpupool", &cpupool_dir_funcs);
+#endif
+
 static int __init cpupool_init(void)
 {
     unsigned int cpu;
@@ -999,6 +1073,10 @@ static int __init cpupool_init(void)
 
     cpupool_gran_init();
 
+#ifdef CONFIG_HYPFS
+    hypfs_add_dir(&hypfs_root, &cpupool_dir, true);
+#endif
+
     cpupool0 = cpupool_create(0, 0, &err);
     BUG_ON(cpupool0 == NULL);
     cpupool_put(cpupool0);
-- 
2.26.2


