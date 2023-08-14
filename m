Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F0277B4B3
	for <lists+xen-devel@lfdr.de>; Mon, 14 Aug 2023 10:54:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.583488.913710 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVTKZ-0004qk-Jc; Mon, 14 Aug 2023 08:53:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 583488.913710; Mon, 14 Aug 2023 08:53:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVTKZ-0004nd-GA; Mon, 14 Aug 2023 08:53:43 +0000
Received: by outflank-mailman (input) for mailman id 583488;
 Mon, 14 Aug 2023 08:53:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DK7P=D7=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qVTKY-0004nX-3Z
 for xen-devel@lists.xenproject.org; Mon, 14 Aug 2023 08:53:42 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 10e42706-3a80-11ee-b288-6b7b168915f2;
 Mon, 14 Aug 2023 10:53:41 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id DE8FB4EE0737;
 Mon, 14 Aug 2023 10:53:39 +0200 (CEST)
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
X-Inumbo-ID: 10e42706-3a80-11ee-b288-6b7b168915f2
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
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [XEN PATCH v2] xen/arm: traps: remove unused function 'dump_guest_s1_walk'
Date: Mon, 14 Aug 2023 10:53:06 +0200
Message-Id: <771478833d2f5f0d0c7ee706fcc7e57637b5068b.1692003039.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function has no uses in the codebase, and can be removed.
This also avoids the violation of MISRA C:2012 Rule 8.4 and Rule 2.1
because it has no declaration and the function's code is unreachable.

Suggested-by: Julien Grall <julien@xen.org>
Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
Changes in v2:
- Modified commit message according to review suggestions.

The function in question has no callers and its removal has already
been proposed (and acked) as part of this larger series [1].
There have been further bugfixes to that function (commits
a43cc8fc0827 and 60e06f2b1b2b) but they do not add any caller,
hence it can be removed.

[1] https://lore.kernel.org/xen-devel/1395766541-23979-27-git-send-email-julien.grall@linaro.org/
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

