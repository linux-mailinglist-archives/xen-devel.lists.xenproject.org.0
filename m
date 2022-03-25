Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA274E6BB0
	for <lists+xen-devel@lfdr.de>; Fri, 25 Mar 2022 02:02:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.294534.500868 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXYK4-0007RH-R1; Fri, 25 Mar 2022 01:01:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 294534.500868; Fri, 25 Mar 2022 01:01:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXYK4-0007NL-ND; Fri, 25 Mar 2022 01:01:00 +0000
Received: by outflank-mailman (input) for mailman id 294534;
 Fri, 25 Mar 2022 01:00:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LYjy=UE=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nXYK2-0006LN-ID
 for xen-devel@lists.xenproject.org; Fri, 25 Mar 2022 01:00:58 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 075dd4b6-abd7-11ec-8fbc-03012f2f19d4;
 Fri, 25 Mar 2022 02:00:57 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 90F5AB81DE2;
 Fri, 25 Mar 2022 01:00:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0ABC1C340EC;
 Fri, 25 Mar 2022 01:00:55 +0000 (UTC)
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
X-Inumbo-ID: 075dd4b6-abd7-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1648170055;
	bh=KejYKJaCYlyX4o30HHgdsNYj5chlo4v76HCeZ/X8/LI=;
	h=From:To:Cc:Subject:Date:From;
	b=aPxareYbgpipXvcAznJwm4b8Wt8ZEXvbAYTLMXSBR0NsIK4U7+SBQYC2bphox6iie
	 AuJvrrdXmrPui4FlBoCiCgNWzzRfhoI5ppiEaNZim1kpoLJAc7Ir/T4fn2KGid3gaI
	 t9A4uMYsIeqvGQK8+UFW9Lgm7Ch5cvzT7cwgOFSmAxL+ygHSADg2Yvj8eAgk6nOIIK
	 EL602/toRpGuJv2u+XffuMU3ycTpDAQYVaiOR70z5B0CppYrR9GsssGoYDLHdAhYXw
	 QBZAgSnsyhdHeEUYS/8iBJDtC2r1EG/y82C3e+MHMdbtZkeIbUc+Fv+njiTwl0PfS0
	 Q8Ph31baNeAkQ==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	sstabellini@kernel.org,
	bertrand.marquis@arm.com,
	Volodymyr_Babchuk@epam.com,
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: [PATCH] xen/arm: set CPSR Z bit when creating aarch32 guests
Date: Thu, 24 Mar 2022 18:00:52 -0700
Message-Id: <20220325010052.1597420-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Stabellini <stefano.stabellini@xilinx.com>

The first 32 bytes of zImage are NOPs. When CONFIG_EFI is enabled in the
kernel, certain versions of Linux will use an UNPREDICATABLE NOP
encoding, sometimes resulting in an unbootable kernel. Whether the
resulting kernel is bootable or not depends on the processor. See commit
a92882a4d270 in the Linux kernel for all the details.

All kernel releases starting from Linux 4.9 without commit a92882a4d270
are affected.

Fortunately there is a simple workaround: setting the "Z" bit in CPSR
make it so those invalid NOP instructions are never executed. That is
because the instruction is conditional (not equal). So, on QEMU at
least, the instruction will end up to be ignored and not generate an
exception. Setting the "Z" bit makes those kernel versions bootable
again and it is harmless in the other cases.

Note that both U-Boot and QEMU -kernel set the "Z" bit in CPSR when
booting a zImage kernel on aarch32.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
---
Changes in v3:
- improve commit message
- improve in-code comment

Changes in v2:
- improve commit message
- add in-code comment
- move PSR_Z to the beginning
---
 xen/include/public/arch-arm.h | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
index 94b31511dd..c0c1149e27 100644
--- a/xen/include/public/arch-arm.h
+++ b/xen/include/public/arch-arm.h
@@ -361,6 +361,7 @@ typedef uint64_t xen_callback_t;
 #define PSR_DBG_MASK    (1<<9)        /* arm64: Debug Exception mask */
 #define PSR_IT_MASK     (0x0600fc00)  /* Thumb If-Then Mask */
 #define PSR_JAZELLE     (1<<24)       /* Jazelle Mode */
+#define PSR_Z           (1<<30)       /* Zero condition flag */
 
 /* 32 bit modes */
 #define PSR_MODE_USR 0x10
@@ -383,7 +384,15 @@ typedef uint64_t xen_callback_t;
 #define PSR_MODE_EL1t 0x04
 #define PSR_MODE_EL0t 0x00
 
-#define PSR_GUEST32_INIT  (PSR_ABT_MASK|PSR_FIQ_MASK|PSR_IRQ_MASK|PSR_MODE_SVC)
+/*
+ * We set PSR_Z to be able to boot Linux kernel versions with an invalid
+ * encoding of the first 8 NOP instructions. See commit a92882a4d270 in
+ * Linux.
+ *
+ * Note that PSR_Z is also set by U-Boot and QEMU -kernel when loading
+ * zImage kernels on aarch32.
+ */
+#define PSR_GUEST32_INIT  (PSR_Z|PSR_ABT_MASK|PSR_FIQ_MASK|PSR_IRQ_MASK|PSR_MODE_SVC)
 #define PSR_GUEST64_INIT (PSR_ABT_MASK|PSR_FIQ_MASK|PSR_IRQ_MASK|PSR_MODE_EL1h)
 
 #define SCTLR_GUEST_INIT    xen_mk_ullong(0x00c50078)
-- 
2.25.1


