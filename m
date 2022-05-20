Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4738152EB9A
	for <lists+xen-devel@lfdr.de>; Fri, 20 May 2022 14:10:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.333901.557859 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ns1Sg-0006It-Gp; Fri, 20 May 2022 12:10:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 333901.557859; Fri, 20 May 2022 12:10:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ns1Sg-0006Fl-BI; Fri, 20 May 2022 12:10:30 +0000
Received: by outflank-mailman (input) for mailman id 333901;
 Fri, 20 May 2022 12:10:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ns1Se-0005v8-Hk
 for xen-devel@lists.xenproject.org; Fri, 20 May 2022 12:10:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ns1Se-0005oM-BP; Fri, 20 May 2022 12:10:28 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ns1Se-0001lI-3Z; Fri, 20 May 2022 12:10:28 +0000
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
	bh=noAFzbg7XMXNKcoQy6EbRQkG8IRrJ9Zy042sIzuyylk=; b=JMmHBQf30UDfDEGdAOJclsCP2F
	MfBJ0ImN4oLdOXiZZmlAYP361G0+BY+p+TKwEIwLRK4yddh+z4yP/tcYuOt7yxiUAsGsf3XQBPwCv
	9psvqC+wV5F5oe89mmB5JgLAhP+9RHy7QpMCX/jHvaDZoW7Ev1S0nszbujx5CneafAA8=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <julien.grall@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Julien Grall <jgrall@amazon.com>,
	Hongda Deng <Hongda.Heng@arm.com>
Subject: [PATCH 04/16] xen/arm: mm: Don't open-code Xen PT update in remove_early_mappings()
Date: Fri, 20 May 2022 13:09:25 +0100
Message-Id: <20220520120937.28925-5-julien@xen.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220520120937.28925-1-julien@xen.org>
References: <20220520120937.28925-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <julien.grall@arm.com>

Now that xen_pt_update_entry() is able to deal with different mapping
size, we can replace the open-coding of the page-tables update by a call
to modify_xen_mappings().

As the function is not meant to fail, a BUG_ON() is added to check the
return.

Note that we don't use destroy_xen_mappings() because the helper doesn't
allow us to pass a flags. In theory we could add an extra parameter to
the function, however there are no other expected users. Hence why
modify_xen_mappings() is used.

Signed-off-by: Julien Grall <julien.grall@arm.com>
Signed-off-by: Julien Grall <jgrall@amazon.com>
Reviewed-by: Hongda Deng <Hongda.Heng@arm.com>

---
    Changes in v4:
        - Add Hongda's reviewed-by
        - Add a comment to explain what modify_xen_mappings() does.
        - Clarify in the commit message hwy modify_xen_mappings() is
          used rather than destroy_xen_mappings().

    Changes in v2:
        - Stay consistent with how function name are used in the commit
        message
        - Add my AWS signed-off-by
---
 xen/arch/arm/mm.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index 747083d820dd..64a79d45b38c 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -614,11 +614,12 @@ void * __init early_fdt_map(paddr_t fdt_paddr)
 
 void __init remove_early_mappings(void)
 {
-    lpae_t pte = {0};
-    write_pte(xen_second + second_table_offset(BOOT_FDT_VIRT_START), pte);
-    write_pte(xen_second + second_table_offset(BOOT_FDT_VIRT_START + SZ_2M),
-              pte);
-    flush_xen_tlb_range_va(BOOT_FDT_VIRT_START, BOOT_FDT_SLOT_SIZE);
+    int rc;
+
+    /* destroy the _PAGE_BLOCK mapping */
+    rc = modify_xen_mappings(BOOT_FDT_VIRT_START, BOOT_FDT_VIRT_END,
+                             _PAGE_BLOCK);
+    BUG_ON(rc);
 }
 
 /*
-- 
2.32.0


