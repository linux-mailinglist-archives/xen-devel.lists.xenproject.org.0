Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4F3298945
	for <lists+xen-devel@lfdr.de>; Mon, 26 Oct 2020 10:13:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.12090.31753 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kWyZX-0005NC-KL; Mon, 26 Oct 2020 09:13:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 12090.31753; Mon, 26 Oct 2020 09:13:47 +0000
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
	id 1kWyZX-0005M6-8g; Mon, 26 Oct 2020 09:13:47 +0000
Received: by outflank-mailman (input) for mailman id 12090;
 Mon, 26 Oct 2020 09:13:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=l58c=EB=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kWyZV-0004ev-EQ
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 09:13:45 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c71bdaa5-202f-4353-9cbf-15d9e856f476;
 Mon, 26 Oct 2020 09:13:22 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 64294B234;
 Mon, 26 Oct 2020 09:13:21 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=l58c=EB=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kWyZV-0004ev-EQ
	for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 09:13:45 +0000
X-Inumbo-ID: c71bdaa5-202f-4353-9cbf-15d9e856f476
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id c71bdaa5-202f-4353-9cbf-15d9e856f476;
	Mon, 26 Oct 2020 09:13:22 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603703601;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zwN6kMRipkhMSsm6aORIIrosl9Cg2bYxBav4xp706Is=;
	b=KUWQ3HmOrCVw2Woxn7ZqwEd2ZJS4dD1x3r4iRWRx7iaQ6h/Wa0CMtME9CsHhcO0Tkzsjb9
	3ZnecGwimgvPBhBJhdeeyFwcAxOj/9AQ/G8ZWX5Gz5vaaD86LdI02gbRJswM5CnNAMIczy
	puqEIMPjqKD3mmyoDSGU7EIsbL/aXwo=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 64294B234;
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
Subject: [PATCH 12/12] xen/cpupool: make per-cpupool sched-gran hypfs node writable
Date: Mon, 26 Oct 2020 10:13:16 +0100
Message-Id: <20201026091316.25680-13-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201026091316.25680-1-jgross@suse.com>
References: <20201026091316.25680-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make /cpupool/<id>/sched-gran in hypfs writable. This will enable per
cpupool selectable scheduling granularity.

Writing this node is allowed only with no cpu assigned to the cpupool.
Allowed are values "cpu", "core" and "socket".

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 docs/misc/hypfs-paths.pandoc |  5 ++-
 xen/common/sched/cpupool.c   | 75 +++++++++++++++++++++++++++++++-----
 2 files changed, 69 insertions(+), 11 deletions(-)

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
index 8674ac0fdd..d0c61fb720 100644
--- a/xen/common/sched/cpupool.c
+++ b/xen/common/sched/cpupool.c
@@ -78,7 +78,7 @@ static void sched_gran_print(enum sched_gran mode, unsigned int gran)
 }
 
 #ifdef CONFIG_HAS_SCHED_GRANULARITY
-static int __init sched_select_granularity(const char *str)
+static int sched_gran_get(const char *str, enum sched_gran *mode)
 {
     unsigned int i;
 
@@ -86,36 +86,43 @@ static int __init sched_select_granularity(const char *str)
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
+#else
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
 
@@ -127,7 +134,7 @@ static void __init cpupool_gran_init(void)
 
     while ( gran == 0 )
     {
-        gran = cpupool_check_granularity();
+        gran = cpupool_check_granularity(opt_sched_granularity);
 
         if ( gran == 0 )
         {
@@ -153,6 +160,9 @@ static void __init cpupool_gran_init(void)
     if ( fallback )
         warning_add(fallback);
 
+    if ( opt_sched_granularity != SCHED_GRAN_cpu )
+        sched_disable_smt_switching = true;
+
     sched_granularity = gran;
     sched_gran_print(opt_sched_granularity, sched_granularity);
 }
@@ -1088,13 +1098,58 @@ static int cpupool_gran_read(const struct hypfs_entry *entry,
     return copy_to_guest(uaddr, name, strlen(name) + 1) ? -EFAULT : 0;
 }
 
+static int cpupool_gran_write(struct hypfs_entry_leaf *leaf,
+                              XEN_GUEST_HANDLE_PARAM(void) uaddr,
+                              unsigned int ulen)
+{
+    const struct hypfs_dyndir_id *data;
+    struct cpupool *cpupool;
+    enum sched_gran gran;
+    unsigned int sched_gran;
+    char name[SCHED_GRAN_NAME_LEN];
+    int ret = 0;
+
+    if ( ulen > SCHED_GRAN_NAME_LEN )
+        return -ENOSPC;
+
+    if ( copy_from_guest(name, uaddr, ulen) )
+        return -EFAULT;
+
+    sched_gran = sched_gran_get(name, &gran) ? 0
+                                             : cpupool_check_granularity(gran);
+    if ( memchr(name, 0, ulen) != (name + ulen - 1) || sched_gran == 0 )
+        return -EINVAL;
+
+    data = hypfs_get_dyndata();
+    if ( !data )
+        return -ENOENT;
+
+    spin_lock(&cpupool_lock);
+
+    cpupool = __cpupool_find_by_id(data->id, true);
+    if ( !cpupool )
+        ret = -ENOENT;
+    else if ( !cpumask_empty(cpupool->cpu_valid) )
+        ret = -EBUSY;
+    else
+    {
+        cpupool->gran = gran;
+        cpupool->sched_gran = sched_gran;
+    }
+
+    spin_unlock(&cpupool_lock);
+
+    return ret;
+}
+
 static struct hypfs_funcs cpupool_gran_funcs = {
     .read = cpupool_gran_read,
+    .write = cpupool_gran_write,
     .getsize = hypfs_getsize,
 };
 
 static HYPFS_VARSIZE_INIT(cpupool_gran, XEN_HYPFS_TYPE_STRING, "sched-gran",
-                          0, &cpupool_gran_funcs);
+                          SCHED_GRAN_NAME_LEN, &cpupool_gran_funcs);
 static char granstr[SCHED_GRAN_NAME_LEN] = {
     [0 ... SCHED_GRAN_NAME_LEN - 2] = '?',
     [SCHED_GRAN_NAME_LEN - 1] = 0
-- 
2.26.2


