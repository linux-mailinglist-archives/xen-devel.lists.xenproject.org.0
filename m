Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1825077747A
	for <lists+xen-devel@lfdr.de>; Thu, 10 Aug 2023 11:30:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.582020.911530 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qU1za-0001It-BK; Thu, 10 Aug 2023 09:30:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 582020.911530; Thu, 10 Aug 2023 09:30:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qU1za-0001GG-8e; Thu, 10 Aug 2023 09:30:06 +0000
Received: by outflank-mailman (input) for mailman id 582020;
 Thu, 10 Aug 2023 09:30:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MZIv=D3=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qU1zZ-00014T-Bg
 for xen-devel@lists.xenproject.org; Thu, 10 Aug 2023 09:30:05 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7bb95a11-3760-11ee-8613-37d641c3527e;
 Thu, 10 Aug 2023 11:30:03 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id BED7F4EE073F;
 Thu, 10 Aug 2023 11:30:01 +0200 (CEST)
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
X-Inumbo-ID: 7bb95a11-3760-11ee-8613-37d641c3527e
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Julien Grall <julien.grall@linaro.org>
Subject: [XEN PATCH] xen/arm: traps: remove unused function 'dump_guest_s1_walk'
Date: Thu, 10 Aug 2023 11:29:50 +0200
Message-Id: <23c5b1a1ffc755b5db17d699a08fc86e1f0cc788.1691659744.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function in question has no callers and its removal has already
been proposed (and acked) as part of this larger series [1].
There have been further bugfixes to that function [2], but they do not add
any caller, hence it can be removed.

[1] https://lore.kernel.org/xen-devel/1395766541-23979-27-git-send-email-julien.grall@linaro.org/
[2] https://lore.kernel.org/xen-devel/20160720161017.4508-1-jtd@galois.com/

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
Suggested-by: Julien Grall <julien.grall@linaro.org>
---
 xen/arch/arm/traps.c | 57 --------------------------------------------
 1 file changed, 57 deletions(-)

diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index 7baddfdc57b3..46c9a4031b30 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -1686,63 +1686,6 @@ void handle_ro_raz(struct cpu_user_regs *regs,
     handle_ro_read_val(regs, regidx, read, hsr, min_el, 0);
 }
 
-void dump_guest_s1_walk(struct domain *d, vaddr_t addr)
-{
-    register_t ttbcr = READ_SYSREG(TCR_EL1);
-    uint64_t ttbr0 = READ_SYSREG64(TTBR0_EL1);
-    uint32_t offset;
-    uint32_t *first = NULL, *second = NULL;
-    mfn_t mfn;
-
-    mfn = gfn_to_mfn(d, gaddr_to_gfn(ttbr0));
-
-    printk("dom%d VA 0x%08"PRIvaddr"\n", d->domain_id, addr);
-    printk("    TTBCR: 0x%"PRIregister"\n", ttbcr);
-    printk("    TTBR0: 0x%016"PRIx64" = 0x%"PRIpaddr"\n",
-           ttbr0, mfn_to_maddr(mfn));
-
-    if ( ttbcr & TTBCR_EAE )
-    {
-        printk("Cannot handle LPAE guest PT walk\n");
-        return;
-    }
-    if ( (ttbcr & TTBCR_N_MASK) != 0 )
-    {
-        printk("Cannot handle TTBR1 guest walks\n");
-        return;
-    }
-
-    if ( mfn_eq(mfn, INVALID_MFN) )
-    {
-        printk("Failed TTBR0 maddr lookup\n");
-        goto done;
-    }
-    first = map_domain_page(mfn);
-
-    offset = addr >> (12+8);
-    printk("1ST[0x%"PRIx32"] (0x%"PRIpaddr") = 0x%08"PRIx32"\n",
-           offset, mfn_to_maddr(mfn), first[offset]);
-    if ( !(first[offset] & 0x1) ||
-          (first[offset] & 0x2) )
-        goto done;
-
-    mfn = gfn_to_mfn(d, gaddr_to_gfn(first[offset]));
-
-    if ( mfn_eq(mfn, INVALID_MFN) )
-    {
-        printk("Failed L1 entry maddr lookup\n");
-        goto done;
-    }
-    second = map_domain_page(mfn);
-    offset = (addr >> 12) & 0x3FF;
-    printk("2ND[0x%"PRIx32"] (0x%"PRIpaddr") = 0x%08"PRIx32"\n",
-           offset, mfn_to_maddr(mfn), second[offset]);
-
-done:
-    if ( second ) unmap_domain_page(second);
-    if ( first ) unmap_domain_page(first);
-}
-
 /*
  * Return the value of the hypervisor fault address register.
  *
-- 
2.34.1


