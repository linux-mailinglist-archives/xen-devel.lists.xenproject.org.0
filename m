Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB11735110F
	for <lists+xen-devel@lfdr.de>; Thu,  1 Apr 2021 10:45:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104188.198975 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRsxQ-0006fy-Mb; Thu, 01 Apr 2021 08:45:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104188.198975; Thu, 01 Apr 2021 08:45:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRsxQ-0006fa-J1; Thu, 01 Apr 2021 08:45:40 +0000
Received: by outflank-mailman (input) for mailman id 104188;
 Thu, 01 Apr 2021 08:45:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=evtz=I6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lRsxP-0006ea-Os
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 08:45:39 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c655badc-64b4-4a19-a25d-c955f41f23d5;
 Thu, 01 Apr 2021 08:45:35 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C5355AEFB;
 Thu,  1 Apr 2021 08:45:34 +0000 (UTC)
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
X-Inumbo-ID: c655badc-64b4-4a19-a25d-c955f41f23d5
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617266734; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U0UO+wcl/jJCDP3esQE6oeXB/el7db31934Dib0PPcY=;
	b=ssFYZXkOpDDuCBuV8ar2q5Oy2a+BYqVUl/Y8nlVS6h0oQX3+2zYyEY439LwNm3qooOBYm0
	c/WZh7B6lp9mTmcPNRLO0l37Ih8O/u7vclO6KIOiE/NDIUzqtzukR5o6OjMVvdtTnLPrQ1
	ZmUB5IdTwQKyUQvVzuFczKqXD1oHwFs=
Subject: [PATCH 5/6] VT-d: avoid pointless use of 64-bit constants
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Kevin Tian <kevin.tian@intel.com>
References: <157e4a65-6d0b-7ea8-1c23-cd393c8c0d7f@suse.com>
Message-ID: <b6092c34-2462-a665-4477-2baf0fd2395a@suse.com>
Date: Thu, 1 Apr 2021 10:45:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <157e4a65-6d0b-7ea8-1c23-cd393c8c0d7f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

When the respective registers are just 32 bits wide there's no point in
making corresponding constants 64-bit ones.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/drivers/passthrough/vtd/iommu.h
+++ b/xen/drivers/passthrough/vtd/iommu.h
@@ -121,30 +121,30 @@
 #define DMA_TLB_IVA_HINT(x) ((((u64)x) & 1) << 6)
 
 /* GCMD_REG */
-#define DMA_GCMD_TE     (((u64)1) << 31)
-#define DMA_GCMD_SRTP   (((u64)1) << 30)
-#define DMA_GCMD_SFL    (((u64)1) << 29)
-#define DMA_GCMD_EAFL   (((u64)1) << 28)
-#define DMA_GCMD_WBF    (((u64)1) << 27)
-#define DMA_GCMD_QIE    (((u64)1) << 26)
-#define DMA_GCMD_IRE    (((u64)1) << 25)
-#define DMA_GCMD_SIRTP  (((u64)1) << 24)
-#define DMA_GCMD_CFI    (((u64)1) << 23)
+#define DMA_GCMD_TE     (1u << 31)
+#define DMA_GCMD_SRTP   (1u << 30)
+#define DMA_GCMD_SFL    (1u << 29)
+#define DMA_GCMD_EAFL   (1u << 28)
+#define DMA_GCMD_WBF    (1u << 27)
+#define DMA_GCMD_QIE    (1u << 26)
+#define DMA_GCMD_IRE    (1u << 25)
+#define DMA_GCMD_SIRTP  (1u << 24)
+#define DMA_GCMD_CFI    (1u << 23)
 
 /* GSTS_REG */
-#define DMA_GSTS_TES    (((u64)1) << 31)
-#define DMA_GSTS_RTPS   (((u64)1) << 30)
-#define DMA_GSTS_FLS    (((u64)1) << 29)
-#define DMA_GSTS_AFLS   (((u64)1) << 28)
-#define DMA_GSTS_WBFS   (((u64)1) << 27)
-#define DMA_GSTS_QIES   (((u64)1) <<26)
-#define DMA_GSTS_IRES   (((u64)1) <<25)
-#define DMA_GSTS_SIRTPS (((u64)1) << 24)
-#define DMA_GSTS_CFIS   (((u64)1) <<23)
+#define DMA_GSTS_TES    (1u << 31)
+#define DMA_GSTS_RTPS   (1u << 30)
+#define DMA_GSTS_FLS    (1u << 29)
+#define DMA_GSTS_AFLS   (1u << 28)
+#define DMA_GSTS_WBFS   (1u << 27)
+#define DMA_GSTS_QIES   (1u << 26)
+#define DMA_GSTS_IRES   (1u << 25)
+#define DMA_GSTS_SIRTPS (1u << 24)
+#define DMA_GSTS_CFIS   (1u << 23)
 
 /* PMEN_REG */
-#define DMA_PMEN_EPM    (((u32)1) << 31)
-#define DMA_PMEN_PRS    (((u32)1) << 0)
+#define DMA_PMEN_EPM    (1u << 31)
+#define DMA_PMEN_PRS    (1u <<  0)
 
 /* CCMD_REG */
 #define DMA_CCMD_INVL_GRANU_OFFSET  61
@@ -164,21 +164,23 @@
 #define DMA_CCMD_CAIG_MASK(x) (((u64)x) & ((u64) 0x3 << 59))
 
 /* FECTL_REG */
-#define DMA_FECTL_IM (((u64)1) << 31)
+#define DMA_FECTL_IM (1u << 31)
 
 /* FSTS_REG */
-#define DMA_FSTS_PFO ((u64)1 << 0)
-#define DMA_FSTS_PPF ((u64)1 << 1)
-#define DMA_FSTS_AFO ((u64)1 << 2)
-#define DMA_FSTS_APF ((u64)1 << 3)
-#define DMA_FSTS_IQE ((u64)1 << 4)
-#define DMA_FSTS_ICE ((u64)1 << 5)
-#define DMA_FSTS_ITE ((u64)1 << 6)
-#define DMA_FSTS_FAULTS    DMA_FSTS_PFO | DMA_FSTS_PPF | DMA_FSTS_AFO | DMA_FSTS_APF | DMA_FSTS_IQE | DMA_FSTS_ICE | DMA_FSTS_ITE
+#define DMA_FSTS_PFO (1u << 0)
+#define DMA_FSTS_PPF (1u << 1)
+#define DMA_FSTS_AFO (1u << 2)
+#define DMA_FSTS_APF (1u << 3)
+#define DMA_FSTS_IQE (1u << 4)
+#define DMA_FSTS_ICE (1u << 5)
+#define DMA_FSTS_ITE (1u << 6)
+#define DMA_FSTS_FAULTS (DMA_FSTS_PFO | DMA_FSTS_PPF | DMA_FSTS_AFO | \
+                         DMA_FSTS_APF | DMA_FSTS_IQE | DMA_FSTS_ICE | \
+                         DMA_FSTS_ITE)
 #define dma_fsts_fault_record_index(s) (((s) >> 8) & 0xff)
 
 /* FRCD_REG, 32 bits access */
-#define DMA_FRCD_F (((u64)1) << 31)
+#define DMA_FRCD_F (1u << 31)
 #define dma_frcd_type(d) ((d >> 30) & 1)
 #define dma_frcd_fault_reason(c) (c & 0xff)
 #define dma_frcd_source_id(c) (c & 0xffff)


