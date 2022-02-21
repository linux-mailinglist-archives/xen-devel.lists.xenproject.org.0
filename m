Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D31034BD90F
	for <lists+xen-devel@lfdr.de>; Mon, 21 Feb 2022 11:22:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.275993.472077 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nM5px-0006GB-8D; Mon, 21 Feb 2022 10:22:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 275993.472077; Mon, 21 Feb 2022 10:22:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nM5px-00069E-29; Mon, 21 Feb 2022 10:22:33 +0000
Received: by outflank-mailman (input) for mailman id 275993;
 Mon, 21 Feb 2022 10:22:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nM5pu-0005TR-6s
 for xen-devel@lists.xenproject.org; Mon, 21 Feb 2022 10:22:30 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nM5pu-0002Bn-0t; Mon, 21 Feb 2022 10:22:30 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nM5pt-00070b-Pv; Mon, 21 Feb 2022 10:22:29 +0000
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
	bh=gj6Tx1Ts6XYE8jhOQFSpNUB23rP/9Mj+pm8BtVXwdgI=; b=uVjIeenzjjYRsw54H1HNYmxQfw
	3v2o/47jmnPmphrWNR5brpLJwHw36oVfIHhVYQH/HTvGFTztGzzBTXDPQ4l4FHFzZkV0lnJXXR4g9
	on+BkY3BJRTt+4hUBLh0xl947Qr63WSRovux0mdJsfwxG8NGpG/GuF77r2jda4RwhMI4=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <julien.grall@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v3 07/19] xen/arm: mm: Don't open-code Xen PT update in remove_early_mappings()
Date: Mon, 21 Feb 2022 10:22:06 +0000
Message-Id: <20220221102218.33785-8-julien@xen.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220221102218.33785-1-julien@xen.org>
References: <20220221102218.33785-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <julien.grall@arm.com>

Now that xen_pt_update_entry() is able to deal with different mapping
size, we can replace the open-coding of the page-tables update by a call
to modify_xen_mappings().

As the function is not meant to fail, a BUG_ON() is added to check the
return.

Signed-off-by: Julien Grall <julien.grall@arm.com>
Signed-off-by: Julien Grall <jgrall@amazon.com>

---
    Changes in v2:
        - Stay consistent with how function name are used in the commit
        message
        - Add my AWS signed-off-by
---
 xen/arch/arm/mm.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index 7b4b9de8693e..f088a4b2de96 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -599,11 +599,11 @@ void * __init early_fdt_map(paddr_t fdt_paddr)
 
 void __init remove_early_mappings(void)
 {
-    lpae_t pte = {0};
-    write_pte(xen_second + second_table_offset(BOOT_FDT_VIRT_START), pte);
-    write_pte(xen_second + second_table_offset(BOOT_FDT_VIRT_START + SZ_2M),
-              pte);
-    flush_xen_tlb_range_va(BOOT_FDT_VIRT_START, BOOT_FDT_SLOT_SIZE);
+    int rc;
+
+    rc = modify_xen_mappings(BOOT_FDT_VIRT_START, BOOT_FDT_VIRT_END,
+                             _PAGE_BLOCK);
+    BUG_ON(rc);
 }
 
 /*
-- 
2.32.0


