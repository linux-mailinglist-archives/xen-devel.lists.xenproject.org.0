Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5883247858B
	for <lists+xen-devel@lfdr.de>; Fri, 17 Dec 2021 08:22:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.248432.428546 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1my7ZD-0002j4-Px; Fri, 17 Dec 2021 07:22:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 248432.428546; Fri, 17 Dec 2021 07:22:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1my7ZD-0002gh-Mt; Fri, 17 Dec 2021 07:22:11 +0000
Received: by outflank-mailman (input) for mailman id 248432;
 Fri, 17 Dec 2021 07:22:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Cq30=RC=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1my7ZC-0002gb-Dh
 for xen-devel@lists.xenproject.org; Fri, 17 Dec 2021 07:22:10 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 0b3cd0a4-5f0a-11ec-9e60-abaf8a552007;
 Fri, 17 Dec 2021 08:22:08 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 410DE12FC;
 Thu, 16 Dec 2021 23:22:08 -0800 (PST)
Received: from e123311-lin.arm.com (unknown [10.57.7.107])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 036FD3F73B;
 Thu, 16 Dec 2021 23:22:06 -0800 (PST)
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
X-Inumbo-ID: 0b3cd0a4-5f0a-11ec-9e60-abaf8a552007
From: Michal Orzel <michal.orzel@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [PATCH v3] xen/arm64: Zero the top 32 bits of gp registers on entry...
Date: Fri, 17 Dec 2021 08:21:59 +0100
Message-Id: <20211217072159.3464-1-michal.orzel@arm.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

to hypervisor when switching from AArch32 state.

According to section D1.20.2 of Arm Arm(DDI 0487A.j):
"If the general-purpose register was accessible from AArch32 state the
upper 32 bits either become zero, or hold the value that the same
architectural register held before any AArch32 execution.
The choice between these two options is IMPLEMENTATION DEFINED"

Currently Xen does not ensure that the top 32 bits are zeroed and this
needs to be fixed. The reason why is that there are places in Xen
where we assume that top 32bits are zero for AArch32 guests.
If they are not, this can lead to misinterpretation of Xen regarding
what the guest requested. For example hypercalls returning an error
encoded in a signed long like do_sched_op, do_hmv_op, do_memory_op
would return -ENOSYS if the command passed as the first argument was
clobbered.

Create a macro clobber_gp_top_halves to clobber top 32 bits of gp
registers when hyp == 0 (guest mode) and compat == 1 (AArch32 mode).
Add a compile time check to ensure that save_x0_x1 == 1 if
compat == 1.

Signed-off-by: Michal Orzel <michal.orzel@arm.com>
---
Changes since v2:
-add clobbering of w30
Changes since v1:
-put new code into macro
-add compile time check for save_x0_x1
---
 xen/arch/arm/arm64/entry.S | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/xen/arch/arm/arm64/entry.S b/xen/arch/arm/arm64/entry.S
index fc3811ad0a..e351ef8639 100644
--- a/xen/arch/arm/arm64/entry.S
+++ b/xen/arch/arm/arm64/entry.S
@@ -102,6 +102,30 @@
         .endif
 
         .endm
+
+/*
+ * Clobber top 32 bits of gp registers when switching from AArch32
+ */
+        .macro clobber_gp_top_halves, compat, save_x0_x1
+
+        .if \compat == 1      /* AArch32 mode */
+
+        /*
+         * save_x0_x1 is equal to 0 only for guest_sync (compat == 0).
+         * Add a compile time check to avoid violating this rule.
+         */
+        .if \save_x0_x1 == 0
+        .error "save_x0_x1 is 0 but compat is 1"
+        .endif
+
+        .irp n,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30
+        mov w\n, w\n
+        .endr
+
+        .endif
+
+        .endm
+
 /*
  * Save state on entry to hypervisor, restore on exit
  *
@@ -111,6 +135,11 @@
  */
         .macro  entry, hyp, compat, save_x0_x1=1
         sub     sp, sp, #(UREGS_SPSR_el1 - UREGS_LR) /* CPSR, PC, SP, LR */
+
+        .if \hyp == 0         /* Guest mode */
+        clobber_gp_top_halves compat=\compat, save_x0_x1=\save_x0_x1
+        .endif
+
         push    x28, x29
         push    x26, x27
         push    x24, x25
-- 
2.29.0


