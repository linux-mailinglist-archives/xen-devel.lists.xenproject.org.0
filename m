Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9561D7711
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2020 13:31:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jadyZ-0005jw-11; Mon, 18 May 2020 11:30:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/+tu=7A=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jadyX-0005jk-7n
 for xen-devel@lists.xenproject.org; Mon, 18 May 2020 11:30:29 +0000
X-Inumbo-ID: f8d52a8d-98fa-11ea-a850-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f8d52a8d-98fa-11ea-a850-12813bfff9fa;
 Mon, 18 May 2020 11:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lD1rKTHPpy3ZHsAcorCh4F2qKZRDeWwZ6XqxYnQhffE=; b=YAkxoSZtaUEfszOUP6wQmzgkw2
 fb2xZjDNbO2cCQE9Eg/VY/xs7x7D4ZCzU/P3nNC2a2mPX18s/7O4hWryyFz69hh1nRqPRCEnFx1uo
 Yu7yYNi33gxHa781bH5ZOOf7vc4wTyy/3wXi8jTOkvmI8brsMxOv5SBh21u5bOfeGdpQ=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jadyV-0006PN-1F; Mon, 18 May 2020 11:30:27 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jadyU-0000cn-Ns; Mon, 18 May 2020 11:30:26 +0000
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH for-4.14 2/3] xen/arm: Take into account the DMA width when
 allocating Dom0 memory banks
Date: Mon, 18 May 2020 12:30:07 +0100
Message-Id: <20200518113008.15422-3-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200518113008.15422-1-julien@xen.org>
References: <20200518113008.15422-1-julien@xen.org>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 minyard@acm.org, Julien Grall <jgrall@amazon.com>, roman@zededa.com,
 jeff.kubascik@dornerworks.com, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Julien Grall <jgrall@amazon.com>

At the moment, Xen is assuming that all the devices are at least 32-bit
DMA capable. However, some SoCs have devices that may be able to access
a much restricted range. For instance, the Raspberry PI 4 has devices
that can only access the first GB of RAM.

The function arch_get_dma_bit_size() will return the lowest DMA width on
the platform. Use it to decide what is the limit for the low memory.

Signed-off-by: Julien GralL <jgrall@amazon.com>
---
 xen/arch/arm/domain_build.c | 32 +++++++++++++++++++-------------
 1 file changed, 19 insertions(+), 13 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 430708753642..abc4e463d27c 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -211,10 +211,13 @@ fail:
  *    the ramdisk and DTB must be placed within a certain proximity of
  *    the kernel within RAM.
  * 3. For dom0 we want to place as much of the RAM as we reasonably can
- *    below 4GB, so that it can be used by non-LPAE enabled kernels (32-bit)
+ *    below 4GB, so that it can be used by non-LPAE enabled kernels (32-bit).
  *    or when a device assigned to dom0 can only do 32-bit DMA access.
- * 4. For 32-bit dom0 the kernel must be located below 4GB.
- * 5. We want to have a few largers banks rather than many smaller ones.
+ * 4. Some devices assigned to dom0 can only do 32-bit DMA access or
+ *    even be more restricted. We want to allocate as much of the RAM
+ *    as we reasonably can that can be accessed from all the devices..
+ * 5. For 32-bit dom0 the kernel must be located below 4GB.
+ * 6. We want to have a few largers banks rather than many smaller ones.
  *
  * For the first two requirements we need to make sure that the lowest
  * bank is sufficiently large.
@@ -245,9 +248,9 @@ fail:
  * we give up.
  *
  * For 32-bit domain we require that the initial allocation for the
- * first bank is under 4G. For 64-bit domain, the first bank is preferred
- * to be allocated under 4G. Then for the subsequent allocations we
- * initially allocate memory only from below 4GB. Once that runs out
+ * first bank is part of the low mem. For 64-bit, the first bank is preferred
+ * to be allocated in the low mem. Then for subsequent allocation, we
+ * initially allocate memory only from low mem. Once that runs out out
  * (as described above) we allow higher allocations and continue until
  * that runs out (or we have allocated sufficient dom0 memory).
  */
@@ -262,6 +265,7 @@ static void __init allocate_memory_11(struct domain *d,
     int i;
 
     bool lowmem = true;
+    unsigned int lowmem_bitsize = min(32U, arch_get_dma_bitsize());
     unsigned int bits;
 
     /*
@@ -282,7 +286,7 @@ static void __init allocate_memory_11(struct domain *d,
      */
     while ( order >= min_low_order )
     {
-        for ( bits = order ; bits <= (lowmem ? 32 : PADDR_BITS); bits++ )
+        for ( bits = order ; bits <= lowmem_bitsize; bits++ )
         {
             pg = alloc_domheap_pages(d, order, MEMF_bits(bits));
             if ( pg != NULL )
@@ -296,24 +300,26 @@ static void __init allocate_memory_11(struct domain *d,
         order--;
     }
 
-    /* Failed to allocate bank0 under 4GB */
+    /* Failed to allocate bank0 in the lowmem region. */
     if ( is_32bit_domain(d) )
         panic("Unable to allocate first memory bank\n");
 
-    /* Try to allocate memory from above 4GB */
-    printk(XENLOG_INFO "No bank has been allocated below 4GB.\n");
+    /* Try to allocate memory from above the lowmem region */
+    printk(XENLOG_INFO "No bank has been allocated below %u-bit.\n",
+           lowmem_bitsize);
     lowmem = false;
 
  got_bank0:
 
     /*
-     * If we failed to allocate bank0 under 4GB, continue allocating
-     * memory from above 4GB and fill in banks.
+     * If we failed to allocate bank0 in the lowmem region,
+     * continue allocating from above the lowmem and fill in banks.
      */
     order = get_allocation_size(kinfo->unassigned_mem);
     while ( kinfo->unassigned_mem && kinfo->mem.nr_banks < NR_MEM_BANKS )
     {
-        pg = alloc_domheap_pages(d, order, lowmem ? MEMF_bits(32) : 0);
+        pg = alloc_domheap_pages(d, order,
+                                 lowmem ? MEMF_bits(lowmem_bitsize) : 0);
         if ( !pg )
         {
             order --;
-- 
2.17.1


