Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 043DD298946
	for <lists+xen-devel@lfdr.de>; Mon, 26 Oct 2020 10:13:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.12091.31759 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kWyZY-0005Ol-91; Mon, 26 Oct 2020 09:13:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 12091.31759; Mon, 26 Oct 2020 09:13:48 +0000
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
	id 1kWyZX-0005N9-UU; Mon, 26 Oct 2020 09:13:47 +0000
Received: by outflank-mailman (input) for mailman id 12091;
 Mon, 26 Oct 2020 09:13:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=l58c=EB=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kWyZV-0004f1-S3
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 09:13:45 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d8c24bb7-8e2d-4583-acb4-5a9f8c6fa148;
 Mon, 26 Oct 2020 09:13:22 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 29ED6B248;
 Mon, 26 Oct 2020 09:13:21 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=l58c=EB=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kWyZV-0004f1-S3
	for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 09:13:45 +0000
X-Inumbo-ID: d8c24bb7-8e2d-4583-acb4-5a9f8c6fa148
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id d8c24bb7-8e2d-4583-acb4-5a9f8c6fa148;
	Mon, 26 Oct 2020 09:13:22 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603703601;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BtuXFg+GprfOQoW7qcf8PMrXYl8U5hOCU9BdXI7w0yo=;
	b=X6sFx1rS9WEJvX5kbsaQAt19W7YP4+Bqr2R8LLtyKOUIrvJq/MPQG1mnjkxkKFXfAhCpQe
	ova2WKr80t7vA5to7plnDvHfrbuK8FuCN0noIsDDYfUeD96tFt7Ko5fv3sMkS9tXs6v6xx
	TLgu8mcIfDHuNxe5UH8ufStdahvCuYc=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 29ED6B248;
	Mon, 26 Oct 2020 09:13:21 +0000 (UTC)
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
Subject: [PATCH 11/12] xen/hypfs: add scheduling granularity entry to cpupool entries
Date: Mon, 26 Oct 2020 10:13:15 +0100
Message-Id: <20201026091316.25680-12-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201026091316.25680-1-jgross@suse.com>
References: <20201026091316.25680-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a "sched-gran" entry to the per-cpupool hypfs directories.

For now make this entry read-only and let it contain one of the
strings "cpu", "core" or "socket".

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 docs/misc/hypfs-paths.pandoc |  4 +++
 xen/common/sched/cpupool.c   | 51 +++++++++++++++++++++++++++++++++---
 2 files changed, 52 insertions(+), 3 deletions(-)

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
index 8612ee5cf6..8674ac0fdd 100644
--- a/xen/common/sched/cpupool.c
+++ b/xen/common/sched/cpupool.c
@@ -42,9 +42,10 @@ static DEFINE_SPINLOCK(cpupool_lock);
 static enum sched_gran __read_mostly opt_sched_granularity = SCHED_GRAN_cpu;
 static unsigned int __read_mostly sched_granularity = 1;
 
+#define SCHED_GRAN_NAME_LEN  8
 struct sched_gran_name {
     enum sched_gran mode;
-    char name[8];
+    char name[SCHED_GRAN_NAME_LEN];
 };
 
 static const struct sched_gran_name sg_name[] = {
@@ -53,7 +54,7 @@ static const struct sched_gran_name sg_name[] = {
     {SCHED_GRAN_socket, "socket"},
 };
 
-static void sched_gran_print(enum sched_gran mode, unsigned int gran)
+static const char *sched_gran_get_name(enum sched_gran mode)
 {
     const char *name = "";
     unsigned int i;
@@ -67,8 +68,13 @@ static void sched_gran_print(enum sched_gran mode, unsigned int gran)
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
@@ -1057,6 +1063,43 @@ static struct hypfs_entry *cpupool_dir_findentry(struct hypfs_entry_dir *dir,
     return hypfs_gen_dyndir_entry_id(&cpupool_pooldir, id);
 }
 
+static int cpupool_gran_read(const struct hypfs_entry *entry,
+                             XEN_GUEST_HANDLE_PARAM(void) uaddr)
+{
+    const struct hypfs_dyndir_id *data;
+    struct cpupool *cpupool;
+    const char *name = "";
+
+    data = hypfs_get_dyndata();
+    if ( !data )
+        return -ENOENT;
+
+    spin_lock(&cpupool_lock);
+
+    cpupool = __cpupool_find_by_id(data->id, true);
+    if ( cpupool )
+        name = sched_gran_get_name(cpupool->gran);
+
+    spin_unlock(&cpupool_lock);
+
+    if ( !cpupool )
+        return -ENOENT;
+
+    return copy_to_guest(uaddr, name, strlen(name) + 1) ? -EFAULT : 0;
+}
+
+static struct hypfs_funcs cpupool_gran_funcs = {
+    .read = cpupool_gran_read,
+    .getsize = hypfs_getsize,
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
     .read = cpupool_dir_read,
     .getsize = cpupool_dir_getsize,
@@ -1075,6 +1118,8 @@ static int __init cpupool_init(void)
 
 #ifdef CONFIG_HYPFS
     hypfs_add_dir(&hypfs_root, &cpupool_dir, true);
+    hypfs_string_set_reference(&cpupool_gran, granstr);
+    hypfs_add_leaf(&cpupool_pooldir, &cpupool_gran, true);
 #endif
 
     cpupool0 = cpupool_create(0, 0, &err);
-- 
2.26.2


