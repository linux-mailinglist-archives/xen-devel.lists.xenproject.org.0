Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C1165510E1
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jun 2022 09:03:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.352422.579212 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3BRO-0002Vo-J7; Mon, 20 Jun 2022 07:03:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 352422.579212; Mon, 20 Jun 2022 07:03:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3BRO-0002Rw-FA; Mon, 20 Jun 2022 07:03:18 +0000
Received: by outflank-mailman (input) for mailman id 352422;
 Mon, 20 Jun 2022 07:03:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k7+S=W3=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1o3BRM-0001Yx-NL
 for xen-devel@lists.xenproject.org; Mon, 20 Jun 2022 07:03:16 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 0e30fc89-f067-11ec-b725-ed86ccbb4733;
 Mon, 20 Jun 2022 09:03:15 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3DD451042;
 Mon, 20 Jun 2022 00:03:15 -0700 (PDT)
Received: from e129167.arm.com (unknown [10.57.35.125])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6C8553F5A1;
 Mon, 20 Jun 2022 00:03:12 -0700 (PDT)
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
X-Inumbo-ID: 0e30fc89-f067-11ec-b725-ed86ccbb4733
From: Michal Orzel <michal.orzel@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>,
	Dario Faggioli <dfaggioli@suse.com>
Subject: [PATCH 3/9] xen/common: Use explicitly specified types
Date: Mon, 20 Jun 2022 09:02:39 +0200
Message-Id: <20220620070245.77979-4-michal.orzel@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220620070245.77979-1-michal.orzel@arm.com>
References: <20220620070245.77979-1-michal.orzel@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to MISRA C 2012 Rule 8.1, types shall be explicitly
specified. Fix all the findings reported by cppcheck with misra addon
by substituting implicit type 'unsigned' to explicit 'unsigned int'.

Signed-off-by: Michal Orzel <michal.orzel@arm.com>
---
 xen/common/grant_table.c   | 6 +++---
 xen/common/gunzip.c        | 8 ++++----
 xen/common/sched/cpupool.c | 4 ++--
 xen/common/trace.c         | 2 +-
 4 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
index 3918e6de6b..2d110d9f41 100644
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -895,7 +895,7 @@ done:
 static int _set_status(const grant_entry_header_t *shah,
                        grant_status_t *status,
                        struct domain *rd,
-                       unsigned rgt_version,
+                       unsigned int rgt_version,
                        struct active_grant_entry *act,
                        int readonly,
                        int mapflag,
@@ -1763,8 +1763,8 @@ static int
 gnttab_populate_status_frames(struct domain *d, struct grant_table *gt,
                               unsigned int req_nr_frames)
 {
-    unsigned i;
-    unsigned req_status_frames;
+    unsigned int i;
+    unsigned int req_status_frames;
 
     req_status_frames = grant_to_status_frames(req_nr_frames);
 
diff --git a/xen/common/gunzip.c b/xen/common/gunzip.c
index b9ecc17e44..244f8d8903 100644
--- a/xen/common/gunzip.c
+++ b/xen/common/gunzip.c
@@ -13,13 +13,13 @@ static memptr __initdata free_mem_end_ptr;
 #define WSIZE           0x80000000
 
 static unsigned char *__initdata inbuf;
-static unsigned __initdata insize;
+static unsigned int __initdata insize;
 
 /* Index of next byte to be processed in inbuf: */
-static unsigned __initdata inptr;
+static unsigned int __initdata inptr;
 
 /* Bytes in output buffer: */
-static unsigned __initdata outcnt;
+static unsigned int __initdata outcnt;
 
 #define OF(args)        args
 
@@ -72,7 +72,7 @@ static __init void flush_window(void)
      * compute the crc.
      */
     unsigned long c = crc;
-    unsigned n;
+    unsigned int n;
     unsigned char *in, ch;
 
     in = window;
diff --git a/xen/common/sched/cpupool.c b/xen/common/sched/cpupool.c
index a20e3a5fcb..2afe54f54d 100644
--- a/xen/common/sched/cpupool.c
+++ b/xen/common/sched/cpupool.c
@@ -850,7 +850,7 @@ int cpupool_do_sysctl(struct xen_sysctl_cpupool_op *op)
 
     case XEN_SYSCTL_CPUPOOL_OP_ADDCPU:
     {
-        unsigned cpu;
+        unsigned int cpu;
         const cpumask_t *cpus;
 
         cpu = op->cpu;
@@ -895,7 +895,7 @@ int cpupool_do_sysctl(struct xen_sysctl_cpupool_op *op)
 
     case XEN_SYSCTL_CPUPOOL_OP_RMCPU:
     {
-        unsigned cpu;
+        unsigned int cpu;
 
         c = cpupool_get_by_id(op->cpupool_id);
         ret = -ENOENT;
diff --git a/xen/common/trace.c b/xen/common/trace.c
index a7c092fcbb..fb3752ce62 100644
--- a/xen/common/trace.c
+++ b/xen/common/trace.c
@@ -834,7 +834,7 @@ void __trace_hypercall(uint32_t event, unsigned long op,
 
 #define APPEND_ARG32(i)                         \
     do {                                        \
-        unsigned i_ = (i);                      \
+        unsigned int i_ = (i);                  \
         *a++ = args[(i_)];                      \
         d.op |= TRC_PV_HYPERCALL_V2_ARG_32(i_); \
     } while( 0 )
-- 
2.25.1


