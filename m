Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CEF72C9911
	for <lists+xen-devel@lfdr.de>; Tue,  1 Dec 2020 09:22:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.41643.75033 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kk0v9-0005Fu-EJ; Tue, 01 Dec 2020 08:21:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 41643.75033; Tue, 01 Dec 2020 08:21:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kk0v9-0005EW-5p; Tue, 01 Dec 2020 08:21:59 +0000
Received: by outflank-mailman (input) for mailman id 41643;
 Tue, 01 Dec 2020 08:21:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UECe=FF=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kk0v7-0004VK-5p
 for xen-devel@lists.xenproject.org; Tue, 01 Dec 2020 08:21:57 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dc310c53-1e04-4611-b723-ff45b9e4ba3b;
 Tue, 01 Dec 2020 08:21:35 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 76E9EAD75;
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
X-Inumbo-ID: dc310c53-1e04-4611-b723-ff45b9e4ba3b
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606810894; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=se4zYxbxCXhFPxdQtqG6gW//2iyLAiNTMs1y0ZSZMwA=;
	b=VpXkgRaiPqc/ptp+PDZ3uGEMAf5rWeWN3Kp2eX7Wj8zOmp8Tb9AC9suqBG46hI5y3pKFTS
	8BPfOUFHdpKdUFulJm1s1QTnAGPzECVzPiOLnB2PaBz9mrJf2Y8p8fUyfTtbCUA6AzXt3+
	2N0W0pdw4AVqEidIu+euFXhq40JrPzg=
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
Subject: [PATCH v2 16/17] xen/cpupool: add scheduling granularity entry to cpupool entries
Date: Tue,  1 Dec 2020 09:21:27 +0100
Message-Id: <20201201082128.15239-17-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201201082128.15239-1-jgross@suse.com>
References: <20201201082128.15239-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a "sched-gran" entry to the per-cpupool hypfs directories.

For now make this entry read-only and let it contain one of the
strings "cpu", "core" or "socket".

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- added const (Jan Beulich)
- modify test in cpupool_gran_read() (Jan Beulich)
---
 docs/misc/hypfs-paths.pandoc |  4 +++
 xen/common/sched/cpupool.c   | 69 ++++++++++++++++++++++++++++++++++--
 2 files changed, 70 insertions(+), 3 deletions(-)

diff --git a/docs/misc/hypfs-paths.pandoc b/docs/misc/hypfs-paths.pandoc
index aaca1cdf92..f1ce24d7fe 100644
--- a/docs/misc/hypfs-paths.pandoc
+++ b/docs/misc/hypfs-paths.pandoc
@@ -184,6 +184,10 @@ A directory of all current cpupools.
 The individual cpupools. Each entry is a directory with the name being the
 cpupool-id (e.g. /cpupool/0/).
 
+#### /cpupool/*/sched-gran = ("cpu" | "core" | "socket")
+
+The scheduling granularity of a cpupool.
+
 #### /params/
 
 A directory of runtime parameters.
diff --git a/xen/common/sched/cpupool.c b/xen/common/sched/cpupool.c
index 3e17fdf95b..cfc75ccbe4 100644
--- a/xen/common/sched/cpupool.c
+++ b/xen/common/sched/cpupool.c
@@ -41,9 +41,10 @@ static DEFINE_SPINLOCK(cpupool_lock);
 static enum sched_gran __read_mostly opt_sched_granularity = SCHED_GRAN_cpu;
 static unsigned int __read_mostly sched_granularity = 1;
 
+#define SCHED_GRAN_NAME_LEN  8
 struct sched_gran_name {
     enum sched_gran mode;
-    char name[8];
+    char name[SCHED_GRAN_NAME_LEN];
 };
 
 static const struct sched_gran_name sg_name[] = {
@@ -52,7 +53,7 @@ static const struct sched_gran_name sg_name[] = {
     {SCHED_GRAN_socket, "socket"},
 };
 
-static void sched_gran_print(enum sched_gran mode, unsigned int gran)
+static const char *sched_gran_get_name(enum sched_gran mode)
 {
     const char *name = "";
     unsigned int i;
@@ -66,8 +67,13 @@ static void sched_gran_print(enum sched_gran mode, unsigned int gran)
         }
     }
 
+    return name;
+}
+
+static void sched_gran_print(enum sched_gran mode, unsigned int gran)
+{
     printk("Scheduling granularity: %s, %u CPU%s per sched-resource\n",
-           name, gran, gran == 1 ? "" : "s");
+           sched_gran_get_name(mode), gran, gran == 1 ? "" : "s");
 }
 
 #ifdef CONFIG_HAS_SCHED_GRANULARITY
@@ -1033,9 +1039,14 @@ static int cpupool_dir_read(const struct hypfs_entry *entry,
     int ret = 0;
     const struct cpupool *c;
     unsigned int size = 0;
+    struct hypfs_dyndir_id *data;
+
+    data = hypfs_get_dyndata();
 
     list_for_each_entry(c, &cpupool_list, list)
     {
+        data->id = c->cpupool_id;
+
         size += hypfs_dynid_entry_size(entry, c->cpupool_id);
 
         ret = hypfs_read_dyndir_id_entry(&cpupool_pooldir, c->cpupool_id,
@@ -1100,6 +1111,56 @@ static struct hypfs_entry *cpupool_dir_findentry(
     return hypfs_gen_dyndir_entry_id(&cpupool_pooldir, id);
 }
 
+static int cpupool_gran_read(const struct hypfs_entry *entry,
+                             XEN_GUEST_HANDLE_PARAM(void) uaddr)
+{
+    const struct hypfs_dyndir_id *data;
+    const struct cpupool *cpupool;
+    const char *gran;
+
+    data = hypfs_get_dyndata();
+    cpupool = __cpupool_find_by_id(data->id, true);
+    ASSERT(cpupool);
+
+    gran = sched_gran_get_name(cpupool->gran);
+
+    if ( !*gran )
+        return -ENOENT;
+
+    return copy_to_guest(uaddr, gran, strlen(gran) + 1) ? -EFAULT : 0;
+}
+
+static unsigned int hypfs_gran_getsize(const struct hypfs_entry *entry)
+{
+    const struct hypfs_dyndir_id *data;
+    const struct cpupool *cpupool;
+    const char *gran;
+
+    data = hypfs_get_dyndata();
+    cpupool = __cpupool_find_by_id(data->id, true);
+    ASSERT(cpupool);
+
+    gran = sched_gran_get_name(cpupool->gran);
+
+    return strlen(gran) + 1;
+}
+
+static struct hypfs_funcs cpupool_gran_funcs = {
+    .enter = hypfs_node_enter,
+    .exit = hypfs_node_exit,
+    .read = cpupool_gran_read,
+    .write = hypfs_write_deny,
+    .getsize = hypfs_gran_getsize,
+    .findentry = hypfs_leaf_findentry,
+};
+
+static HYPFS_VARSIZE_INIT(cpupool_gran, XEN_HYPFS_TYPE_STRING, "sched-gran",
+                          0, &cpupool_gran_funcs);
+static char granstr[SCHED_GRAN_NAME_LEN] = {
+    [0 ... SCHED_GRAN_NAME_LEN - 2] = '?',
+    [SCHED_GRAN_NAME_LEN - 1] = 0
+};
+
 static struct hypfs_funcs cpupool_dir_funcs = {
     .enter = cpupool_dir_enter,
     .exit = cpupool_dir_exit,
@@ -1115,6 +1176,8 @@ static void cpupool_hypfs_init(void)
 {
     hypfs_add_dir(&hypfs_root, &cpupool_dir, true);
     hypfs_add_dyndir(&cpupool_dir, &cpupool_pooldir);
+    hypfs_string_set_reference(&cpupool_gran, granstr);
+    hypfs_add_leaf(&cpupool_pooldir, &cpupool_gran, true);
 }
 #else
 
-- 
2.26.2


