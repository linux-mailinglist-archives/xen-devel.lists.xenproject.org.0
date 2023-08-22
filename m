Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9351A784D25
	for <lists+xen-devel@lfdr.de>; Wed, 23 Aug 2023 01:04:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.588745.920349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYaPz-0008NV-Ga; Tue, 22 Aug 2023 23:04:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 588745.920349; Tue, 22 Aug 2023 23:04:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYaPz-0008Gi-Cq; Tue, 22 Aug 2023 23:04:11 +0000
Received: by outflank-mailman (input) for mailman id 588745;
 Tue, 22 Aug 2023 23:04:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SWhE=EH=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qYaPx-0007yw-LL
 for xen-devel@lists.xenproject.org; Tue, 22 Aug 2023 23:04:09 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 31e5af81-4140-11ee-9b0c-b553b5be7939;
 Wed, 23 Aug 2023 01:04:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 5B78B82857CB;
 Tue, 22 Aug 2023 18:04:06 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 6gYpXrOsn9zj; Tue, 22 Aug 2023 18:04:05 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 5B0D782869F7;
 Tue, 22 Aug 2023 18:04:05 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id qGk5eU5ANTiC; Tue, 22 Aug 2023 18:04:05 -0500 (CDT)
Received: from raptor-ewks-026.rptsys.com (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id D066682869EE;
 Tue, 22 Aug 2023 18:04:04 -0500 (CDT)
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
X-Inumbo-ID: 31e5af81-4140-11ee-9b0c-b553b5be7939
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 5B0D782869F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1692745445; bh=nBHc/NSB1GzcgAwDsGUzug5+YbfZfT8y28R3niPgy2g=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=hZDut9wwhtDOvcbYsba+tu11w4wZAs/KRvzxanzJ53aRlYW5JtN1E44JPfv0Hd2El
	 Ya+MgDm9F+f/v53DhkB2eS9ap06pKmUl5j5LQnP9sTOUfhLuSTM5bBrmOhSBmHYiVX
	 LgU74GacLLvZKv/S+CRjvfqH0b7nMfWCDco0xnJ0=
X-Virus-Scanned: amavisd-new at rptsys.com
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: xen-devel@lists.xenproject.org
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH v4 2/3] xen/ppc: Relocate kernel to physical address 0 on boot
Date: Tue, 22 Aug 2023 18:03:51 -0500
Message-Id: <03ef20c327c6f4a0ce47078dae52465b3cb32d2e.1692744718.git.sanastasio@raptorengineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1692744718.git.sanastasio@raptorengineering.com>
References: <cover.1692744718.git.sanastasio@raptorengineering.com>
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
v4:
  - Don't re-use stack pointer register (%r1) for non-stack-related purpo=
ses
    in head.S
v3: no changes.
v2:
  - Fix definition of XEN_VIRT_START macro which incorrectly used
    _AT instead of _AC.
  - Use _start instead of start as symbol referring to beginning of
    Xen binary
 xen/arch/ppc/include/asm/config.h |  2 +-
 xen/arch/ppc/ppc64/head.S         | 27 +++++++++++++++++++++++++++
 2 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/xen/arch/ppc/include/asm/config.h b/xen/arch/ppc/include/asm=
/config.h
index d060f0dca7..30438d22d2 100644
--- a/xen/arch/ppc/include/asm/config.h
+++ b/xen/arch/ppc/include/asm/config.h
@@ -39,7 +39,7 @@
     name:
 #endif

-#define XEN_VIRT_START _AT(UL, 0xc000000000000000)
+#define XEN_VIRT_START _AC(0xc000000000000000, UL)

 #define SMP_CACHE_BYTES (1 << 6)

diff --git a/xen/arch/ppc/ppc64/head.S b/xen/arch/ppc/ppc64/head.S
index 8f1e5d3ad2..a149339ad0 100644
--- a/xen/arch/ppc/ppc64/head.S
+++ b/xen/arch/ppc/ppc64/head.S
@@ -17,6 +17,33 @@ ENTRY(start)
     addis   %r2, %r12, .TOC.-1b@ha
     addi    %r2, %r2, .TOC.-1b@l

+    /*
+     * Copy Xen to physical address zero and jump to XEN_VIRT_START
+     * (0xc000000000000000). This works because the hardware will ignore=
 the top
+     * four address bits when the MMU is off.
+     */
+    LOAD_REG_ADDR(%r14, _start)
+    LOAD_IMM64(%r12, XEN_VIRT_START)
+
+    /* If we're at the correct address, skip copy */
+    cmpld   %r14, %r12
+    beq     .L_correct_address
+
+    /* Copy bytes until _end */
+    LOAD_REG_ADDR(%r11, _end)
+    addi    %r14, %r14, -8
+    li      %r13, -8
+.L_copy_xen:
+    ldu     %r10, 8(%r14)
+    stdu    %r10, 8(%r13)
+    cmpld   %r14, %r11
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
--
2.30.2


