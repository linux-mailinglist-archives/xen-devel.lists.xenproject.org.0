Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5CEE649BE4
	for <lists+xen-devel@lfdr.de>; Mon, 12 Dec 2022 11:17:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.459402.717189 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4fsV-0007qh-Ik; Mon, 12 Dec 2022 10:17:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 459402.717189; Mon, 12 Dec 2022 10:17:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4fsU-0007bm-Iv; Mon, 12 Dec 2022 10:17:42 +0000
Received: by outflank-mailman (input) for mailman id 459402;
 Mon, 12 Dec 2022 10:17:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p4fsQ-0006gc-2g
 for xen-devel@lists.xenproject.org; Mon, 12 Dec 2022 10:17:38 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p4fsP-0002Cq-QK; Mon, 12 Dec 2022 10:17:37 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p4fXC-0001lz-S4; Mon, 12 Dec 2022 09:55:43 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=UT8Tsyu8d4SGb5ZWf0s64+GDPh3jW+1JI3bmNMKQng8=; b=SDE7CfU2BtwDgr0lkA/vZFryEL
	RgT5BQeVGdcLKxtD1Nm+OaFWIbzi6pCxpWEhheLyFbnL7MFP5C+wQB+NccCqDA6NWSvBoBuYtwnVY
	11thPiRmGHPujTC7SAtZOwE3i2OylsWdotPRqn+aEbocMl5yderdnI7abIBKuuFblxD8=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: michal.orzel@amd.com,
	Luca.Fancellu@arm.com,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 14/18] xen/arm: mm: Allow dump_hyp_walk() to work on the current root table
Date: Mon, 12 Dec 2022 09:55:19 +0000
Message-Id: <20221212095523.52683-15-julien@xen.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221212095523.52683-1-julien@xen.org>
References: <20221212095523.52683-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

dump_hyp_walk() is used to print the tables walk in case of the data or
instruction abort.

Those abort are not limited to the runtime and could happen at early
boot. However, the current implementation of dump_hyp_walk() check
that the TTBR matches the runtime page tables.

Therefore, early abort will result to a secondary abort and not
print the table walks.

Given that the function is called in the abort path, there is no
reason for us to keep the BUG_ON() in any form. So drop it.

Signed-off-by: Julien Grall <jgrall@amazon.com>

---
    Changes in v2:
        - Patch added
---
 xen/arch/arm/mm.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index 26d6b70410c5..0cf7ad4f0e8c 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -280,13 +280,11 @@ void dump_pt_walk(paddr_t ttbr, paddr_t addr,
 void dump_hyp_walk(vaddr_t addr)
 {
     uint64_t ttbr = READ_SYSREG64(TTBR0_EL2);
-    lpae_t *pgtable = THIS_CPU_PGTABLE;
 
     printk("Walking Hypervisor VA 0x%"PRIvaddr" "
            "on CPU%d via TTBR 0x%016"PRIx64"\n",
            addr, smp_processor_id(), ttbr);
 
-    BUG_ON( virt_to_maddr(pgtable) != ttbr );
     dump_pt_walk(ttbr, addr, HYP_PT_ROOT_LEVEL, 1);
 }
 
-- 
2.38.1


