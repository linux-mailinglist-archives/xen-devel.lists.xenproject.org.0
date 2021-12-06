Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C84D4698DB
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 15:27:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239089.414424 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muExP-0002FT-8n; Mon, 06 Dec 2021 14:27:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239089.414424; Mon, 06 Dec 2021 14:27:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muExP-0002DT-0j; Mon, 06 Dec 2021 14:27:07 +0000
Received: by outflank-mailman (input) for mailman id 239089;
 Mon, 06 Dec 2021 14:27:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w5uy=QX=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1muErC-0004et-6h
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 14:20:42 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id b081380c-569f-11ec-a5e1-b9374ead2679;
 Mon, 06 Dec 2021 15:20:41 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EBDF01FB;
 Mon,  6 Dec 2021 06:20:39 -0800 (PST)
Received: from e123311-lin.arm.com (unknown [10.57.4.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 776063F5A1;
 Mon,  6 Dec 2021 06:20:38 -0800 (PST)
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
X-Inumbo-ID: b081380c-569f-11ec-a5e1-b9374ead2679
From: Michal Orzel <michal.orzel@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [PATCH] xen/arm64: Zero the top 32 bits of gp registers on entry...
Date: Mon,  6 Dec 2021 15:20:32 +0100
Message-Id: <20211206142032.27536-1-michal.orzel@arm.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

to hypervisor when switching to AArch32 state.

According to section D1.20.2 of Arm Arm(DDI 0487A.j):
"If the general-purpose register was accessible from AArch32 state the
upper 32 bits either become zero, or hold the value that the same
architectural register held before any AArch32 execution.
The choice between these two options is IMPLEMENTATIONDEFINED"

Currently Xen does not ensure that the top 32 bits are zeroed and this
needs to be fixed.

Fix this bug by zeroing the upper 32 bits of these registers on an
entry to hypervisor when switching to AArch32 state.

Set default value of parameter compat of macro entry to 0 (AArch64 mode
as we are on 64-bit hypervisor) to avoid checking if parameter is blank
when not passed.

Signed-off-by: Michal Orzel <michal.orzel@arm.com>
---
 xen/arch/arm/arm64/entry.S | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/arm64/entry.S b/xen/arch/arm/arm64/entry.S
index fc3811ad0a..d364128175 100644
--- a/xen/arch/arm/arm64/entry.S
+++ b/xen/arch/arm/arm64/entry.S
@@ -109,8 +109,16 @@
  * If 0, we rely on the on x0/x1 to have been saved at the correct
  * position on the stack before.
  */
-        .macro  entry, hyp, compat, save_x0_x1=1
+        .macro  entry, hyp, compat=0, save_x0_x1=1
         sub     sp, sp, #(UREGS_SPSR_el1 - UREGS_LR) /* CPSR, PC, SP, LR */
+
+        /* Zero the upper 32 bits of the registers when switching to AArch32 */
+        .if \compat == 1      /* AArch32 mode */
+        .irp nr,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29
+        mov w\nr, w\nr
+        .endr
+        .endif
+
         push    x28, x29
         push    x26, x27
         push    x24, x25
-- 
2.29.0


