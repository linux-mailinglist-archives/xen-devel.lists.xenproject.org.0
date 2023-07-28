Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B1B76786D
	for <lists+xen-devel@lfdr.de>; Sat, 29 Jul 2023 00:22:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571600.895873 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPVqN-0000fw-61; Fri, 28 Jul 2023 22:21:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571600.895873; Fri, 28 Jul 2023 22:21:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPVqN-0000e4-3O; Fri, 28 Jul 2023 22:21:55 +0000
Received: by outflank-mailman (input) for mailman id 571600;
 Fri, 28 Jul 2023 22:21:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/sdN=DO=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qPVqL-00009S-9O
 for xen-devel@lists.xenproject.org; Fri, 28 Jul 2023 22:21:53 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 25069253-2d95-11ee-8613-37d641c3527e;
 Sat, 29 Jul 2023 00:21:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id B9ED582855B2;
 Fri, 28 Jul 2023 17:21:48 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id Msq2y8vS1EcQ; Fri, 28 Jul 2023 17:21:47 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 8B65D828570D;
 Fri, 28 Jul 2023 17:21:47 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id z44vgiV4To4s; Fri, 28 Jul 2023 17:21:47 -0500 (CDT)
Received: from raptor-ewks-026.lan (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 296608285801;
 Fri, 28 Jul 2023 17:21:47 -0500 (CDT)
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
X-Inumbo-ID: 25069253-2d95-11ee-8613-37d641c3527e
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 8B65D828570D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1690582907; bh=+5ECp6wS9uRRFp9pqDwISksI9/iWLpR0QNbzLSOMVw8=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=u/ZahkOXtdgsAlImPreLCuy0ejyJZinB+xlc2XNxQVa/M9KxfQYc9S1zIA+R93pzD
	 BDCbdR7yniTTH4WSjCT/hji8mLpkl4wvXLIAMkL1mFyezWevcqb5M19zNBB+6wZRI7
	 n9w4M5b3PPu4YDtFGE/PGbGZFKCdZC8d+AM52xLU=
X-Virus-Scanned: amavisd-new at rptsys.com
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: xen-devel@lists.xenproject.org
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH 2/3] xen/ppc: Relocate kernel to physical address 0 on boot
Date: Fri, 28 Jul 2023 17:21:29 -0500
Message-Id: <0802fad2743526da4fe49f0225e14161464f192e.1690582001.git.sanastasio@raptorengineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1690582001.git.sanastasio@raptorengineering.com>
References: <cover.1690582001.git.sanastasio@raptorengineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Introduce a small assembly loop in `start` to copy the kernel to
physical address 0 before continuing. This ensures that the physical
address lines up with XEN_VIRT_START (0xc000000000000000) and allows us
to identity map the kernel when the MMU is set up in the next patch.

We are also able to start execution at XEN_VIRT_START after the copy
since hardware will ignore the top 4 address bits when operating in Real
Mode (MMU off).

Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
---
 xen/arch/ppc/ppc64/head.S | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/xen/arch/ppc/ppc64/head.S b/xen/arch/ppc/ppc64/head.S
index 5ac2dad2ee..beff8257fa 100644
--- a/xen/arch/ppc/ppc64/head.S
+++ b/xen/arch/ppc/ppc64/head.S
@@ -18,6 +18,33 @@ ENTRY(start)
     addis   %r2, %r12, .TOC.-1b@ha
     addi    %r2, %r2, .TOC.-1b@l
=20
+    /*
+     * Copy Xen to physical address zero and jump to XEN_VIRT_START
+     * (0xc000000000000000). This works because the hardware will ignore=
 the top
+     * four address bits when the MMU is off.
+     */
+    LOAD_REG_ADDR(%r1, start)
+    LOAD_IMM64(%r12, XEN_VIRT_START)
+
+    /* If we're at the correct address, skip copy */
+    cmpld   %r1, %r12
+    beq     .L_correct_address
+
+    /* Copy bytes until _end */
+    LOAD_REG_ADDR(%r11, _end)
+    addi    %r1, %r1, -8
+    li      %r13, -8
+.L_copy_xen:
+    ldu     %r10, 8(%r1)
+    stdu    %r10, 8(%r13)
+    cmpld   %r1, %r11
+    blt     .L_copy_xen
+
+    /* Jump to XEN_VIRT_START */
+    mtctr   %r12
+    bctr
+.L_correct_address:
+
     /* set up the initial stack */
     LOAD_REG_ADDR(%r1, cpu0_boot_stack)
     li      %r11, 0
--=20
2.30.2


