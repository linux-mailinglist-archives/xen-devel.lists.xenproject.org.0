Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 729AF4D2DDE
	for <lists+xen-devel@lfdr.de>; Wed,  9 Mar 2022 12:21:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.287733.487916 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRuNs-0008IR-5D; Wed, 09 Mar 2022 11:21:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 287733.487916; Wed, 09 Mar 2022 11:21:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRuNr-0008Eb-SG; Wed, 09 Mar 2022 11:21:35 +0000
Received: by outflank-mailman (input) for mailman id 287733;
 Wed, 09 Mar 2022 11:21:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nRuNq-0007wX-5q
 for xen-devel@lists.xenproject.org; Wed, 09 Mar 2022 11:21:34 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nRuNp-0002l7-VM; Wed, 09 Mar 2022 11:21:33 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nRuNp-0004wn-NY; Wed, 09 Mar 2022 11:21:33 +0000
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
	bh=XzfP7FQZiQKfC2eU/eNRTo46unTVwCIHpPRL2SVGKE0=; b=JCOWKXWOV6mJbdieoB0sminCOz
	D98HJX2ducw2mQe2Gz3a9NCcf8wz8YqEZmYTn/8cifvZ2bf43XHTMLElNMoSvSbAMOKTztL4msko8
	0OM2xKiuei5kMRDPctFD+70qdA1KLU+vLbrCFFukPqTL8CgtA/0W/hdYVBw1FbZ6MTJU=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: marco.solieri@minervasys.tech,
	lucmiccio@gmail.com,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH early-RFC 4/5] xen/arm: mm: Rework switch_ttbr()
Date: Wed,  9 Mar 2022 11:20:47 +0000
Message-Id: <20220309112048.17377-5-julien@xen.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220309112048.17377-1-julien@xen.org>
References: <20220309112048.17377-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

At the moment, switch_ttbr() is switching the TTBR whilst the MMU is
still on.

Switching TTBR is like replacing existing mappings with new ones. So
we need to follow the break-before-make sequence.

In this case, it means the MMU needs to be switched off while the
TTBR is updated. In order to disable the MMU, we need to first
jump to an identity mapping.

Rename switch_ttbr() to switch_ttbr_id() and create an helper on
top to temporary map the identity mapping and call switch_ttbr()
via the identity address.

switch_ttbr_id() is now reworked to temporarily turn off the MMU
before updating the TTBR.

We also need to make sure the helper switch_ttbr() is part of the
identity mapping. So move _end_boot past it.

Take the opportunity to instruction cache flush as the operation is
only necessary when the memory is updated.

Signed-off-by: Julien Grall <jgrall@amazon.com>

---

    TODO:
        * Rename _end_boot to _end_id_mapping or similar
        * Check the memory barriers
        * I suspect the instruction cache flush will be necessary
          for cache coloring.
---
 xen/arch/arm/arm64/head.S | 31 ++++++++++++++++++++-----------
 xen/arch/arm/mm.c         | 14 +++++++++++++-
 2 files changed, 33 insertions(+), 12 deletions(-)

diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
index 878649280d73..c5cc72b8fe6f 100644
--- a/xen/arch/arm/arm64/head.S
+++ b/xen/arch/arm/arm64/head.S
@@ -803,36 +803,45 @@ fail:   PRINT("- Boot failed -\r\n")
         b     1b
 ENDPROC(fail)
 
-GLOBAL(_end_boot)
-
 /*
  * Switch TTBR
  *
  * x0    ttbr
  *
- * TODO: This code does not comply with break-before-make.
+ * XXX: Check the barriers
  */
-ENTRY(switch_ttbr)
+ENTRY(switch_ttbr_id)
         dsb   sy                     /* Ensure the flushes happen before
                                       * continuing */
         isb                          /* Ensure synchronization with previous
                                       * changes to text */
+
+        /* Turn off MMU */
+        mrs    x1, SCTLR_EL2
+        bic    x1, x1, #SCTLR_Axx_ELx_M
+        msr    SCTLR_EL2, x1
+        dsb    sy
+        isb
+
         tlbi   alle2                 /* Flush hypervisor TLB */
-        ic     iallu                 /* Flush I-cache */
         dsb    sy                    /* Ensure completion of TLB flush */
         isb
 
-        msr    TTBR0_EL2, x0
+        msr   TTBR0_EL2, x0
+
+        mrs   x1, SCTLR_EL2
+        orr   x1, x1, #SCTLR_Axx_ELx_M  /* Enable MMU */
+        msr   SCTLR_EL2, x1
 
         isb                          /* Ensure synchronization with previous
                                       * changes to text */
-        tlbi   alle2                 /* Flush hypervisor TLB */
-        ic     iallu                 /* Flush I-cache */
-        dsb    sy                    /* Ensure completion of TLB flush */
-        isb
+        /* Turn on the MMU */
+
 
         ret
-ENDPROC(switch_ttbr)
+ENDPROC(switch_ttbr_id)
+
+GLOBAL(_end_boot)
 
 #ifdef CONFIG_EARLY_PRINTK
 /*
diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index 5c4dece16f7f..a53760af7af0 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -660,7 +660,19 @@ static void xen_pt_enforce_wnx(void)
     flush_xen_tlb_local();
 }
 
-extern void switch_ttbr(uint64_t ttbr);
+extern void switch_ttbr_id(uint64_t ttbr);
+
+typedef void (switch_ttbr_fn)(uint64_t ttbr);
+
+static void switch_ttbr(uint64_t ttbr)
+{
+    vaddr_t id_addr = virt_to_maddr(switch_ttbr_id);
+    switch_ttbr_fn *fn = (switch_ttbr_fn *)id_addr;
+
+    update_identity_mapping(true);
+    fn(ttbr);
+    update_identity_mapping(false);
+}
 
 /* Clear a translation table and clean & invalidate the cache */
 static void clear_table(void *table)
-- 
2.32.0


