Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 828662F9ED4
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jan 2021 12:56:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.69617.124787 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1T8A-0005hx-6C; Mon, 18 Jan 2021 11:55:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 69617.124787; Mon, 18 Jan 2021 11:55:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1T89-0005gh-Ol; Mon, 18 Jan 2021 11:55:33 +0000
Received: by outflank-mailman (input) for mailman id 69617;
 Mon, 18 Jan 2021 11:55:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=777z=GV=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1l1T87-0005WK-Pv
 for xen-devel@lists.xenproject.org; Mon, 18 Jan 2021 11:55:31 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 25d4e8b7-18d2-4e33-90d2-10ce82f442c1;
 Mon, 18 Jan 2021 11:55:22 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 508AEB8E7;
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
X-Inumbo-ID: 25d4e8b7-18d2-4e33-90d2-10ce82f442c1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610970920; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Zvj0WIR083HaUoZpxG9d5NzM+F+8nwp7U2Fyjv6QVtM=;
	b=dojN8pLPDg3/t6GXcEDE+e3vaa/gLgxQQ7oZTOox0BM4ihwMwrh2m01usfBP2pp2t70fq1
	98J7UNtIv+dCNG5KGEmpkKCQ3pIayqa4jGxXLhXhPo5H5fHvqQrPcQQnKKoN/CGQtC8XGk
	kFlzDZYFKr7vnrmjrFOv7J4q2b+yhj8=
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
Subject: [PATCH v4 5/5] xen/cpupool: make per-cpupool sched-gran hypfs node writable
Date: Mon, 18 Jan 2021 12:55:16 +0100
Message-Id: <20210118115516.11001-6-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210118115516.11001-1-jgross@suse.com>
References: <20210118115516.11001-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make /cpupool/<id>/sched-gran in hypfs writable. This will enable per
cpupool selectable scheduling granularity.

Writing this node is allowed only with no cpu assigned to the cpupool.
Allowed are values "cpu", "core" and "socket".

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- test user parameters earlier (Jan Beulich)

V3:
- fix build without CONFIG_HYPFS on Arm (Andrew Cooper)
---
 docs/misc/hypfs-paths.pandoc |  5 ++-
 xen/common/sched/cpupool.c   | 70 ++++++++++++++++++++++++++++++------
 2 files changed, 63 insertions(+), 12 deletions(-)

diff --git a/docs/misc/hypfs-paths.pandoc b/docs/misc/hypfs-paths.pandoc
index f1ce24d7fe..e86f7d0dbe 100644
--- a/docs/misc/hypfs-paths.pandoc
+++ b/docs/misc/hypfs-paths.pandoc
@@ -184,10 +184,13 @@ A directory of all current cpupools.
 The individual cpupools. Each entry is a directory with the name being the
 cpupool-id (e.g. /cpupool/0/).
 
-#### /cpupool/*/sched-gran = ("cpu" | "core" | "socket")
+#### /cpupool/*/sched-gran = ("cpu" | "core" | "socket") [w]
 
 The scheduling granularity of a cpupool.
 
+Writing a value is allowed only for cpupools with no cpu assigned and if the
+architecture is supporting different scheduling granularities.
+
 #### /params/
 
 A directory of runtime parameters.
diff --git a/xen/common/sched/cpupool.c b/xen/common/sched/cpupool.c
index e2011367bd..acd26f9449 100644
--- a/xen/common/sched/cpupool.c
+++ b/xen/common/sched/cpupool.c
@@ -77,7 +77,7 @@ static void sched_gran_print(enum sched_gran mode, unsigned int gran)
 }
 
 #ifdef CONFIG_HAS_SCHED_GRANULARITY
-static int __init sched_select_granularity(const char *str)
+static int sched_gran_get(const char *str, enum sched_gran *mode)
 {
     unsigned int i;
 
@@ -85,36 +85,43 @@ static int __init sched_select_granularity(const char *str)
     {
         if ( strcmp(sg_name[i].name, str) == 0 )
         {
-            opt_sched_granularity = sg_name[i].mode;
+            *mode = sg_name[i].mode;
             return 0;
         }
     }
 
     return -EINVAL;
 }
+
+static int __init sched_select_granularity(const char *str)
+{
+    return sched_gran_get(str, &opt_sched_granularity);
+}
 custom_param("sched-gran", sched_select_granularity);
+#elif CONFIG_HYPFS
+static int sched_gran_get(const char *str, enum sched_gran *mode)
+{
+    return -EINVAL;
+}
 #endif
 
-static unsigned int __init cpupool_check_granularity(void)
+static unsigned int cpupool_check_granularity(enum sched_gran mode)
 {
     unsigned int cpu;
     unsigned int siblings, gran = 0;
 
-    if ( opt_sched_granularity == SCHED_GRAN_cpu )
+    if ( mode == SCHED_GRAN_cpu )
         return 1;
 
     for_each_online_cpu ( cpu )
     {
-        siblings = cpumask_weight(sched_get_opt_cpumask(opt_sched_granularity,
-                                                        cpu));
+        siblings = cpumask_weight(sched_get_opt_cpumask(mode, cpu));
         if ( gran == 0 )
             gran = siblings;
         else if ( gran != siblings )
             return 0;
     }
 
-    sched_disable_smt_switching = true;
-
     return gran;
 }
 
@@ -126,7 +133,7 @@ static void __init cpupool_gran_init(void)
 
     while ( gran == 0 )
     {
-        gran = cpupool_check_granularity();
+        gran = cpupool_check_granularity(opt_sched_granularity);
 
         if ( gran == 0 )
         {
@@ -152,6 +159,9 @@ static void __init cpupool_gran_init(void)
     if ( fallback )
         warning_add(fallback);
 
+    if ( opt_sched_granularity != SCHED_GRAN_cpu )
+        sched_disable_smt_switching = true;
+
     sched_granularity = gran;
     sched_gran_print(opt_sched_granularity, sched_granularity);
 }
@@ -1126,17 +1136,55 @@ static unsigned int hypfs_gran_getsize(const struct hypfs_entry *entry)
     return strlen(gran) + 1;
 }
 
+static int cpupool_gran_write(struct hypfs_entry_leaf *leaf,
+                              XEN_GUEST_HANDLE_PARAM(const_void) uaddr,
+                              unsigned int ulen)
+{
+    const struct hypfs_dyndir_id *data;
+    struct cpupool *cpupool;
+    enum sched_gran gran;
+    unsigned int sched_gran = 0;
+    char name[SCHED_GRAN_NAME_LEN];
+    int ret = 0;
+
+    if ( ulen > SCHED_GRAN_NAME_LEN )
+        return -ENOSPC;
+
+    if ( copy_from_guest(name, uaddr, ulen) )
+        return -EFAULT;
+
+    if ( memchr(name, 0, ulen) == (name + ulen - 1) )
+        sched_gran = sched_gran_get(name, &gran) ?
+                     0 : cpupool_check_granularity(gran);
+    if ( sched_gran == 0 )
+        return -EINVAL;
+
+    data = hypfs_get_dyndata();
+    cpupool = data->data;
+    ASSERT(cpupool);
+
+    if ( !cpumask_empty(cpupool->cpu_valid) )
+        ret = -EBUSY;
+    else
+    {
+        cpupool->gran = gran;
+        cpupool->sched_gran = sched_gran;
+    }
+
+    return ret;
+}
+
 static const struct hypfs_funcs cpupool_gran_funcs = {
     .enter = hypfs_node_enter,
     .exit = hypfs_node_exit,
     .read = cpupool_gran_read,
-    .write = hypfs_write_deny,
+    .write = cpupool_gran_write,
     .getsize = hypfs_gran_getsize,
     .findentry = hypfs_leaf_findentry,
 };
 
 static HYPFS_VARSIZE_INIT(cpupool_gran, XEN_HYPFS_TYPE_STRING, "sched-gran",
-                          0, &cpupool_gran_funcs);
+                          SCHED_GRAN_NAME_LEN, &cpupool_gran_funcs);
 static char granstr[SCHED_GRAN_NAME_LEN] = {
     [0 ... SCHED_GRAN_NAME_LEN - 2] = '?',
     [SCHED_GRAN_NAME_LEN - 1] = 0
-- 
2.26.2


