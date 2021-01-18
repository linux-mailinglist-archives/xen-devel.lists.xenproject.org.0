Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 893342F9ED5
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jan 2021 12:56:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.69615.124762 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1T85-0005bZ-5C; Mon, 18 Jan 2021 11:55:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 69615.124762; Mon, 18 Jan 2021 11:55:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1T85-0005aa-01; Mon, 18 Jan 2021 11:55:29 +0000
Received: by outflank-mailman (input) for mailman id 69615;
 Mon, 18 Jan 2021 11:55:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=777z=GV=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1l1T82-0005WK-Ps
 for xen-devel@lists.xenproject.org; Mon, 18 Jan 2021 11:55:26 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ff53ab65-988a-48b3-9032-640508289ab6;
 Mon, 18 Jan 2021 11:55:20 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0ACB6B8E6;
 Mon, 18 Jan 2021 11:55:20 +0000 (UTC)
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
X-Inumbo-ID: ff53ab65-988a-48b3-9032-640508289ab6
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610970920; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=am94U0utN2Ue9jktg4hF/gzv3ykid5UM0GvnBsWgHyU=;
	b=ctJACRl8JO/dMrxFUYbBGG7Gg/JqVbZFv0KKRXtD/BU/OjMeA8bj47QxRh9EOppRus9tA0
	E5QY0yTqRg1+NYEfUEbEm6cHz7QRJJOBMVBN+Nhr0gSuFGl6DanvjlevbvVVLys0XmtG+p
	5Ws7JlUKE9hZBv3jicAUmjIVFOoZqnQ=
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
Subject: [PATCH v4 4/5] xen/cpupool: add scheduling granularity entry to cpupool entries
Date: Mon, 18 Jan 2021 12:55:15 +0100
Message-Id: <20210118115516.11001-5-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210118115516.11001-1-jgross@suse.com>
References: <20210118115516.11001-1-jgross@suse.com>
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
 docs/misc/hypfs-paths.pandoc |  4 ++
 xen/common/sched/cpupool.c   | 72 ++++++++++++++++++++++++++++++++++--
 2 files changed, 72 insertions(+), 4 deletions(-)

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
index f293ba0cc4..e2011367bd 100644
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
@@ -1014,10 +1020,16 @@ static int cpupool_dir_read(const struct hypfs_entry *entry,
                             XEN_GUEST_HANDLE_PARAM(void) uaddr)
 {
     int ret = 0;
-    const struct cpupool *c;
+    struct cpupool *c;
+    struct hypfs_dyndir_id *data;
+
+    data = hypfs_get_dyndata();
 
     list_for_each_entry(c, &cpupool_list, list)
     {
+        data->id = c->cpupool_id;
+        data->data = c;
+
         ret = hypfs_read_dyndir_id_entry(&cpupool_pooldir, c->cpupool_id,
                                          list_is_last(&c->list, &cpupool_list),
                                          &uaddr);
@@ -1080,6 +1092,56 @@ static struct hypfs_entry *cpupool_dir_findentry(
     return hypfs_gen_dyndir_id_entry(&cpupool_pooldir, id, cpupool);
 }
 
+static int cpupool_gran_read(const struct hypfs_entry *entry,
+                             XEN_GUEST_HANDLE_PARAM(void) uaddr)
+{
+    const struct hypfs_dyndir_id *data;
+    const struct cpupool *cpupool;
+    const char *gran;
+
+    data = hypfs_get_dyndata();
+    cpupool = data->data;
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
+    cpupool = data->data;
+    ASSERT(cpupool);
+
+    gran = sched_gran_get_name(cpupool->gran);
+
+    return strlen(gran) + 1;
+}
+
+static const struct hypfs_funcs cpupool_gran_funcs = {
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
 static const struct hypfs_funcs cpupool_dir_funcs = {
     .enter = cpupool_dir_enter,
     .exit = cpupool_dir_exit,
@@ -1095,6 +1157,8 @@ static void cpupool_hypfs_init(void)
 {
     hypfs_add_dir(&hypfs_root, &cpupool_dir, true);
     hypfs_add_dyndir(&cpupool_dir, &cpupool_pooldir);
+    hypfs_string_set_reference(&cpupool_gran, granstr);
+    hypfs_add_leaf(&cpupool_pooldir, &cpupool_gran, true);
 }
 
 #else /* CONFIG_HYPFS */
-- 
2.26.2


