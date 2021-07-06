Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B8433BD98D
	for <lists+xen-devel@lfdr.de>; Tue,  6 Jul 2021 17:09:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.151438.279878 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0mhf-0002XJ-TR; Tue, 06 Jul 2021 15:09:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 151438.279878; Tue, 06 Jul 2021 15:09:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0mhf-0002US-QD; Tue, 06 Jul 2021 15:09:39 +0000
Received: by outflank-mailman (input) for mailman id 151438;
 Tue, 06 Jul 2021 15:09:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/cLt=L6=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1m0mhe-0002UM-Ch
 for xen-devel@lists.xenproject.org; Tue, 06 Jul 2021 15:09:38 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id d947b234-7e35-45da-a3bd-c505a11bb348;
 Tue, 06 Jul 2021 15:09:36 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5505C106F;
 Tue,  6 Jul 2021 08:09:36 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 337073F73B;
 Tue,  6 Jul 2021 08:09:35 -0700 (PDT)
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
X-Inumbo-ID: d947b234-7e35-45da-a3bd-c505a11bb348
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: jgrall@amazon.com,
	michal.orzel@arm.com,
	olaf@aepfle.de,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>,
	George Dunlap <george.dunlap@citrix.com>
Subject: [PATCH] tools: Fix CPSR/SPSR print size
Date: Tue,  6 Jul 2021 16:09:10 +0100
Message-Id: <f28690afd8c4f36351fcdb1e95704cc5240b193a.1625583993.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.17.1

With the changes of register size introduced in
918b8842a852e0e7446286f546724b1c63c56c66, CPSR and SPSR are now stored
as 64bit values.

Fix the print size to use 64bit type.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 tools/libs/guest/xg_dom_arm.c | 4 ++--
 tools/xentrace/xenctx.c       | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/tools/libs/guest/xg_dom_arm.c b/tools/libs/guest/xg_dom_arm.c
index 01e85e0ea9..5e3b76355e 100644
--- a/tools/libs/guest/xg_dom_arm.c
+++ b/tools/libs/guest/xg_dom_arm.c
@@ -140,7 +140,7 @@ static int vcpu_arm32(struct xc_dom_image *dom)
 
     ctxt->flags = VGCF_online;
 
-    DOMPRINTF("Initial state CPSR %#"PRIx32" PC %#"PRIx32,
+    DOMPRINTF("Initial state CPSR %#"PRIx64" PC %#"PRIx32,
            ctxt->user_regs.cpsr, ctxt->user_regs.pc32);
 
     rc = xc_vcpu_setcontext(dom->xch, dom->guest_domid, 0, &any_ctx);
@@ -182,7 +182,7 @@ static int vcpu_arm64(struct xc_dom_image *dom)
 
     ctxt->flags = VGCF_online;
 
-    DOMPRINTF("Initial state CPSR %#"PRIx32" PC %#"PRIx64,
+    DOMPRINTF("Initial state CPSR %#"PRIx64" PC %#"PRIx64,
            ctxt->user_regs.cpsr, ctxt->user_regs.pc64);
 
     rc = xc_vcpu_setcontext(dom->xch, dom->guest_domid, 0, &any_ctx);
diff --git a/tools/xentrace/xenctx.c b/tools/xentrace/xenctx.c
index 972f473dbf..85ba0c0fa6 100644
--- a/tools/xentrace/xenctx.c
+++ b/tools/xentrace/xenctx.c
@@ -556,7 +556,7 @@ static void print_ctx_32(vcpu_guest_context_t *ctx)
     printf("PC:       %08"PRIx32, regs->pc32);
     print_symbol(regs->pc32, KERNEL_TEXT_ADDR);
     printf("\n");
-    printf("CPSR:     %08"PRIx32"\n", regs->cpsr);
+    printf("CPSR:     %08"PRIx64"\n", regs->cpsr);
     printf("USR:               SP:%08"PRIx32" LR:%08"PRIx32"\n",
            regs->sp_usr, regs->lr_usr);
     printf("SVC: SPSR:%08"PRIx32" SP:%08"PRIx32" LR:%08"PRIx32"\n",
@@ -614,8 +614,8 @@ static void print_ctx_64(vcpu_guest_context_t *ctx)
     printf("LR:       %016"PRIx64"\n", regs->x30);
     printf("ELR_EL1:  %016"PRIx64"\n", regs->elr_el1);
 
-    printf("CPSR:     %08"PRIx32"\n", regs->cpsr);
-    printf("SPSR_EL1: %08"PRIx32"\n", regs->spsr_el1);
+    printf("CPSR:     %08"PRIx64"\n", regs->cpsr);
+    printf("SPSR_EL1: %08"PRIx64"\n", regs->spsr_el1);
 
     printf("SP_EL0:   %016"PRIx64"\n", regs->sp_el0);
     printf("SP_EL1:   %016"PRIx64"\n", regs->sp_el1);
-- 
2.17.1


