Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7CC4BD937
	for <lists+xen-devel@lfdr.de>; Mon, 21 Feb 2022 11:51:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.276090.472147 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nM6HS-0006RJ-Lq; Mon, 21 Feb 2022 10:50:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 276090.472147; Mon, 21 Feb 2022 10:50:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nM6HS-0006QH-HJ; Mon, 21 Feb 2022 10:50:58 +0000
Received: by outflank-mailman (input) for mailman id 276090;
 Mon, 21 Feb 2022 10:50:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nM6HR-0006Pn-I8
 for xen-devel@lists.xenproject.org; Mon, 21 Feb 2022 10:50:57 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nM6HR-0002lS-6D; Mon, 21 Feb 2022 10:50:57 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nM5pw-00070b-Q2; Mon, 21 Feb 2022 10:22:33 +0000
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
	bh=zEuypYbMOVU+QCEpQRIrLKSHSHuGJNjHPBiDujcG7MU=; b=oD4C8Xy85gKcZSzamwua69gzJh
	vwmWHW3VGsBHpotI4HnvBmxqIi3fJRGT/PtfWcILV3mCMobBjoTKgwF+P8BkoX4Z+NMHHFrMbh05t
	l82nYJCrb5EbAVvUVtuPLZVSqH4FEwWBlOgZJykIVF/kxIFvVb5hzb8a5B2LzLPYzL/Y=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 10/19] xen/arm32: mm: Re-implement setup_xenheap_mappings() using map_pages_to_xen()
Date: Mon, 21 Feb 2022 10:22:09 +0000
Message-Id: <20220221102218.33785-11-julien@xen.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220221102218.33785-1-julien@xen.org>
References: <20220221102218.33785-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

Now that map_pages_to_xen() has been extended to support 2MB mappings,
we can replace the create_mappings() call by map_pages_to_xen() call.

Signed-off-by: Julien Grall <jgrall@amazon.com>

---
    Changes in v3:
        - Fix build when CONFIG_DEBUG=y

    Changes in v2:
        - New patch

    TODOs:
        - add support for contiguous mapping
---
 xen/arch/arm/mm.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index f18f65745595..1e5c2c45dcf9 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -809,7 +809,12 @@ void mmu_init_secondary_cpu(void)
 void __init setup_xenheap_mappings(unsigned long base_mfn,
                                    unsigned long nr_mfns)
 {
-    create_mappings(xen_second, XENHEAP_VIRT_START, base_mfn, nr_mfns, MB(32));
+    int rc;
+
+    rc = map_pages_to_xen(XENHEAP_VIRT_START, _mfn(base_mfn), nr_mfns,
+                          PAGE_HYPERVISOR_RW | _PAGE_BLOCK);
+    if ( rc )
+        panic("Unable to setup the xenheap mappings.\n");
 
     /* Record where the xenheap is, for translation routines. */
     xenheap_virt_end = XENHEAP_VIRT_START + nr_mfns * PAGE_SIZE;
-- 
2.32.0


