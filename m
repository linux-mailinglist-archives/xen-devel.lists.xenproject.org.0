Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40DA94E4781
	for <lists+xen-devel@lfdr.de>; Tue, 22 Mar 2022 21:28:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.293657.498944 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWl7H-0005W2-Hm; Tue, 22 Mar 2022 20:28:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 293657.498944; Tue, 22 Mar 2022 20:28:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWl7H-0005TG-E2; Tue, 22 Mar 2022 20:28:31 +0000
Received: by outflank-mailman (input) for mailman id 293657;
 Tue, 22 Mar 2022 20:28:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T+E5=UB=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nWl7F-0005TA-V0
 for xen-devel@lists.xenproject.org; Tue, 22 Mar 2022 20:28:29 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a166f8a7-aa1e-11ec-a405-831a346695d4;
 Tue, 22 Mar 2022 21:28:28 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 270A1616CC;
 Tue, 22 Mar 2022 20:28:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30967C340F0;
 Tue, 22 Mar 2022 20:28:26 +0000 (UTC)
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
X-Inumbo-ID: a166f8a7-aa1e-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1647980906;
	bh=43wCae7E5R9jd7/Raddt6nkAvz+XPtRSrLPJXw348Mk=;
	h=From:To:Cc:Subject:Date:From;
	b=W3LQGYsUOHOfVjuILdtFxegalzBk3xQSptsJ5a8GaItZ9AXxs0sKq6f6PiRxAEFwT
	 sLX9zpHEg/0vXH1xC/5GCT3Knx5fZ0rX6P08KhYW1OPkjBGmHZD6dNulIG+uVrUE+f
	 Vrvc+mgDDeCNN2NT2scDayHgBwuHUZSTFz/b/M5umisSau5cyWCCXjIrfgl02rnTf7
	 1+2ez68CYg9uDmI3vcQkI6PPkZO0HSCnL9Hoz4nQAT4CuUfInYxtqfQZgSzxL03Fth
	 rZWcXkJHSn5obU3YHOaFc5gnoJQ85K8hhe8HuhLlwUaoJoLGLlclVddc8YFHryoiOb
	 lz6JWacOAlJrA==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	sstabellini@kernel.org,
	bertrand.marquis@arm.com,
	Volodymyr_Babchuk@epam.com,
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: [PATCH v2] xen/arm: set CPSR Z bit when creating aarch32 guests
Date: Tue, 22 Mar 2022 13:28:25 -0700
Message-Id: <20220322202825.418232-1-sstabellini@kernel.org>
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

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
---
Changes in v2:
- improve commit message
- add in-code comment
- move PSR_Z to the beginning
---
 xen/include/public/arch-arm.h | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
index 94b31511dd..81cee95f14 100644
--- a/xen/include/public/arch-arm.h
+++ b/xen/include/public/arch-arm.h
@@ -361,6 +361,7 @@ typedef uint64_t xen_callback_t;
 #define PSR_DBG_MASK    (1<<9)        /* arm64: Debug Exception mask */
 #define PSR_IT_MASK     (0x0600fc00)  /* Thumb If-Then Mask */
 #define PSR_JAZELLE     (1<<24)       /* Jazelle Mode */
+#define PSR_Z           (1<<30)       /* Zero condition flag */
 
 /* 32 bit modes */
 #define PSR_MODE_USR 0x10
@@ -383,7 +384,12 @@ typedef uint64_t xen_callback_t;
 #define PSR_MODE_EL1t 0x04
 #define PSR_MODE_EL0t 0x00
 
-#define PSR_GUEST32_INIT  (PSR_ABT_MASK|PSR_FIQ_MASK|PSR_IRQ_MASK|PSR_MODE_SVC)
+/*
+ * We set PSR_Z to be able to boot Linux kernel versions with an invalid
+ * encoding of the first 8 NOP instructions. See commit a92882a4d270 in
+ * Linux.
+ */
+#define PSR_GUEST32_INIT  (PSR_Z|PSR_ABT_MASK|PSR_FIQ_MASK|PSR_IRQ_MASK|PSR_MODE_SVC)
 #define PSR_GUEST64_INIT (PSR_ABT_MASK|PSR_FIQ_MASK|PSR_IRQ_MASK|PSR_MODE_EL1h)
 
 #define SCTLR_GUEST_INIT    xen_mk_ullong(0x00c50078)
-- 
2.25.1


