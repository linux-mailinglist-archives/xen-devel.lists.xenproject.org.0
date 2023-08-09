Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80840776C14
	for <lists+xen-devel@lfdr.de>; Thu, 10 Aug 2023 00:18:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.581408.910093 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTrVA-0006LJ-Cm; Wed, 09 Aug 2023 22:18:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 581408.910093; Wed, 09 Aug 2023 22:18:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTrVA-0006Ic-A8; Wed, 09 Aug 2023 22:18:00 +0000
Received: by outflank-mailman (input) for mailman id 581408;
 Wed, 09 Aug 2023 22:17:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FTx5=D2=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qTrV8-0006IQ-K6
 for xen-devel@lists.xenproject.org; Wed, 09 Aug 2023 22:17:58 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9759735e-3702-11ee-b282-6b7b168915f2;
 Thu, 10 Aug 2023 00:17:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id EF8A282868E2;
 Wed,  9 Aug 2023 17:17:55 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id YVsL932o5Hnk; Wed,  9 Aug 2023 17:17:55 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 3A6FA828553F;
 Wed,  9 Aug 2023 17:17:55 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id O0kQthIAsvar; Wed,  9 Aug 2023 17:17:55 -0500 (CDT)
Received: from raptor-ewks-026.lan (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id CBC2A8285C0F;
 Wed,  9 Aug 2023 17:17:54 -0500 (CDT)
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
X-Inumbo-ID: 9759735e-3702-11ee-b282-6b7b168915f2
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 3A6FA828553F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1691619475; bh=KqI9TVA8FbZ1LWbWWdF8L7W6TWK7/HIuQJKiQybY8cE=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=LW2iBzxaHgS3r+jsNRs/39lnDpsTuoj2Z1xWqMk1IQcsrUyuU+/qsqd5SxhTkMoNC
	 tb5xl6rArrBe0VpAKat+5CvQDG0SroecokSzzIhJSTLmHKSEzOPWKGMumY7ZKRgpIQ
	 8UTF9VcgpsljK/BLTzCh6zz0Ij/6Gopl2NqGULv0=
X-Virus-Scanned: amavisd-new at rptsys.com
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: xen-devel@lists.xenproject.org
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH v2 2/3] xen/ppc: Relocate kernel to physical address 0 on boot
Date: Wed,  9 Aug 2023 17:17:42 -0500
Message-Id: <bf711c0bdc06279fbe07aea271aea17fa0c3b9b3.1691617957.git.sanastasio@raptorengineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1691617957.git.sanastasio@raptorengineering.com>
References: <cover.1691617957.git.sanastasio@raptorengineering.com>
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
index d060f0dca7..b76f940431 100644
--- a/xen/arch/ppc/include/asm/config.h
+++ b/xen/arch/ppc/include/asm/config.h
@@ -39,7 +39,7 @@
     name:
 #endif

-#define XEN_VIRT_START _AT(UL, 0xc000000000000000)
+#define XEN_VIRT_START _AC(0xc000000000000000, UL)

 #define SMP_CACHE_BYTES (1 << 6)

diff --git a/xen/arch/ppc/ppc64/head.S b/xen/arch/ppc/ppc64/head.S
index 8f1e5d3ad2..d91bd7f92d 100644
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
+    LOAD_REG_ADDR(%r1, _start)
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
--
2.30.2


