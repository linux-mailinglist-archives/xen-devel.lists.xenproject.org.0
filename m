Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 450037F78FB
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 17:30:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640823.999556 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6Z4F-0001YU-OF; Fri, 24 Nov 2023 16:30:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640823.999556; Fri, 24 Nov 2023 16:30:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6Z4F-0001Q3-FF; Fri, 24 Nov 2023 16:30:11 +0000
Received: by outflank-mailman (input) for mailman id 640823;
 Fri, 24 Nov 2023 16:30:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SB6C=HF=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1r6Z4D-00015K-Px
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 16:30:09 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bbb43385-8ae6-11ee-98e2-6d05b1d4d9a1;
 Fri, 24 Nov 2023 17:30:09 +0100 (CET)
Received: from beta.station (net-37-182-35-120.cust.vodafonedsl.it
 [37.182.35.120])
 by support.bugseng.com (Postfix) with ESMTPSA id 8B8CF4EE074E;
 Fri, 24 Nov 2023 17:30:08 +0100 (CET)
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
X-Inumbo-ID: bbb43385-8ae6-11ee-98e2-6d05b1d4d9a1
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	maria.celeste.cesario@bugseng.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>
Subject: [PATCH 5/5] xen/arm: address violations of MISRA C:2012 Rule 11.8
Date: Fri, 24 Nov 2023 17:29:19 +0100
Message-Id: <df2af5f9a93c3cbcb61c28ff5228632c82d56f37.1700842832.git.maria.celeste.cesario@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1700842832.git.maria.celeste.cesario@bugseng.com>
References: <cover.1700842832.git.maria.celeste.cesario@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>

Add or amend casts to comply with Rule 11.8.

The violations are resolved either:
- by adding a missing const qualifier in the cast
- by removing a cast to non-const on a const-qualified object

No functional change.

Signed-off-by: Maria Celeste Cesario  <maria.celeste.cesario@bugseng.com>
Signed-off-by: Simone Ballarin  <simone.ballarin@bugseng.com>
---
 xen/arch/arm/domain_build.c       | 2 +-
 xen/arch/arm/include/asm/atomic.h | 2 +-
 xen/arch/arm/include/asm/regs.h   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 2dd2926b41..c17214f738 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -2749,7 +2749,7 @@ static int __init handle_passthrough_prop(struct kernel_info *kinfo,
     if ( node == NULL )
     {
         printk(XENLOG_ERR "Couldn't find node %s in host_dt!\n",
-               (char *)xen_path->data);
+               xen_path->data);
         return -EINVAL;
     }
 
diff --git a/xen/arch/arm/include/asm/atomic.h b/xen/arch/arm/include/asm/atomic.h
index 64314d59b3..517216d2a8 100644
--- a/xen/arch/arm/include/asm/atomic.h
+++ b/xen/arch/arm/include/asm/atomic.h
@@ -154,7 +154,7 @@ static always_inline void write_atomic_size(volatile void *p,
  */
 static inline int atomic_read(const atomic_t *v)
 {
-    return *(volatile int *)&v->counter;
+    return *(const volatile int *)&v->counter;
 }
 
 static inline int _atomic_read(atomic_t v)
diff --git a/xen/arch/arm/include/asm/regs.h b/xen/arch/arm/include/asm/regs.h
index 8a0db95415..79050937f3 100644
--- a/xen/arch/arm/include/asm/regs.h
+++ b/xen/arch/arm/include/asm/regs.h
@@ -48,7 +48,7 @@ static inline bool regs_mode_is_32bit(const struct cpu_user_regs *regs)
 
 static inline bool guest_mode(const struct cpu_user_regs *r)
 {
-    unsigned long diff = (char *)guest_cpu_user_regs() - (char *)(r);
+    unsigned long diff = (char *)guest_cpu_user_regs() - (const char *)(r);
     /* Frame pointer must point into current CPU stack. */
     ASSERT(diff < STACK_SIZE);
     /* If not a guest frame, it must be a hypervisor frame. */
-- 
2.40.0


