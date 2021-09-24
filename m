Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EED29416F41
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 11:42:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.195080.347578 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mThio-0004ea-Dy; Fri, 24 Sep 2021 09:42:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 195080.347578; Fri, 24 Sep 2021 09:42:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mThio-0004cj-AT; Fri, 24 Sep 2021 09:42:22 +0000
Received: by outflank-mailman (input) for mailman id 195080;
 Fri, 24 Sep 2021 09:42:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wINm=OO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mThin-0004cX-27
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 09:42:21 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b7ab1362-8d84-4907-b3e2-5df732f872ae;
 Fri, 24 Sep 2021 09:42:19 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2057.outbound.protection.outlook.com [104.47.12.57]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-17-adVlg-waNZuWIr99FQbj3w-1; Fri, 24 Sep 2021 11:42:17 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6303.eurprd04.prod.outlook.com (2603:10a6:803:f2::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14; Fri, 24 Sep
 2021 09:42:15 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4544.018; Fri, 24 Sep 2021
 09:42:15 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P192CA0016.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:56::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.15 via Frontend Transport; Fri, 24 Sep 2021 09:42:14 +0000
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
X-Inumbo-ID: b7ab1362-8d84-4907-b3e2-5df732f872ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632476538;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ou8PXKvNNIJKUClYCy2gG2WGmmb4DyDLE4jV2AzEnuQ=;
	b=OrZxJseX0+E4r229LqhBdLkqTa3MB+W074+N3I2gf/P357toeI0PKnZ3bn+E0cAus+1iZ9
	Z4k+8J4PM211AxlcC7RLQ086tDML4Lq0yEMgcZ8rbxnIoljr+JXeGuI+NGjb9eKCOoM8bg
	XUBeBS2ULywibK8LNzNsuPCOZsrqDss=
X-MC-Unique: adVlg-waNZuWIr99FQbj3w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=djRsVeta72DPaEfTt00mxBkIIPCRZKNBpOmJGd3nrxXW7qspNeNTomO3yqDIIiyZ/bFxvownlPdFz2QQ4EhLbEhAHT37qxw9rvf8yidg+dCMaFwEZIMbGak+3vyl8KryTt7JNXwzdkl9Kp4tC/ChQmAZTwk1SmxVFEwFP6HN3TDq6J2sIft6foFyoOIj4O26ek63Pd6urpQtDXwVXwZtHx2Oz8aUlhHLDQno//6Z8RuKAMaGomFiIWvUc2K2k93k3AD1N6Bnbg+laN/XaNMRNnglMmHPrdXiFkY7dMOk2C4uVgCKtO5rRSKiqJiIGO9295Y4rgbBLkF2ChCFmPELCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=Ou8PXKvNNIJKUClYCy2gG2WGmmb4DyDLE4jV2AzEnuQ=;
 b=TEixJleToN/Daz6GQY3BHpTEYsAq5oJgtOLbFNWigxsBob9IIUSZDbAxFQD2kxANWKdkFmUBFJ5qVHLu8WJCN4Mg7nAHYQTGvHQVkU25D7Xo6tDk4QxRdZLK7aUqZZF4Hrqy0CksDu65Rv/tc83E5hFmBSZlSUpMTn7pMDjNtOAPZl+EVFyToL4xzvVc0txwicH5To7WeBNnJ6thyqJOENdBei1WWkbNg9bgVa9iBfCmD3CxB7RT9VQ53LG1UMOJPvbXNhe3LjGpTOwoUDXvywmbBLVhiruLP9lQZal3QrqJt2BrZgS2JIOxaSKNnuUN+l4+dZNxQO7MSzo2fW3BFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=suse.com;
Subject: [PATCH v2 02/18] VT-d: have callers specify the target level for page
 table walks
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Kevin Tian <kevin.tian@intel.com>
References: <957f067b-9fe1-2350-4266-51982f09d3a9@suse.com>
Message-ID: <6d01a401-ac53-d4ca-e0ac-165d045341af@suse.com>
Date: Fri, 24 Sep 2021 11:42:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <957f067b-9fe1-2350-4266-51982f09d3a9@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P192CA0016.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:102:56::21) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ace5a24a-179e-4422-3ebd-08d97f3f9768
X-MS-TrafficTypeDiagnostic: VI1PR04MB6303:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB63036BF1FC722D86C8D91CB4B3A49@VI1PR04MB6303.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TIb5mSjHuRzyJrl/cdytFCcSl24glRtpJZQ4mMvpZ9sESNpL18GGp8IYR9Mg4CyUKNRsEtoB0wnTqRgsogwhNeAJn3QYewltUegMhGYYEfYpr9rFLUdO7qnRGDLBuCw9sYVbenRnd7La0KHqg6GfVP5sHK+bjNPpnFI4eAvwVPNUfyAGUYcSohj5x3vjqwN3DwzRAlYkTgdZQodugWepiAzHdPuGnEVU6mHQZylPhawmD4KyvBtE+aEQdscp2Svu7kH6N5tuWSdv6evFSSr9IpLdqLXHfaDG9GfP4QNilrUSpirdmOtIvISUG4eeHa6Pr72vzqu6aiabdtqAF3nfhxQpri4S/rEJh4OonGRNVRzW3twELDkhManJ+ZLobr6IVjXIr6bwI+CUzd2ZD07NWrHyiIdI6gM7kh1mEC08z7flugsjV5qtBPGZZGbYZZ1hgdzUAWQkOG+PvxotPg2mOWaiQWaudEaNdCdrEl5Fqe0gF+JavE6dbAc97ujPvtzbz+dUNZVE2hSXLTbVya70a7RceHbd34KwQvXcSCfVzZCdet0eEGAGHLpMd/Rwv9aKuGjbCOAkFHLkvnM+/cBJqO2RpHj6RqtshnFz8hHVNYN/Nd4gG9Jqqr7VzZUw2U8hH3RX00g6LnlYe5CDNI7lNP67UULKLf+LbbF0J2Y6/7/jbPrg88OuNzfYuuxekBpyIj5oDDAqvFvwPDI7biux9hFkxGLLXUZtkNs3neFWRf8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6916009)(2616005)(38100700002)(956004)(86362001)(83380400001)(508600001)(66476007)(66556008)(31696002)(31686004)(36756003)(8676002)(16576012)(66946007)(5660300002)(54906003)(8936002)(2906002)(4326008)(186003)(316002)(6486002)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MUZrQ1ZvZndZdWNvRlg3U01qMW4rQzZudEdVV05wRU5hWFU4UzltdGhoUi9Q?=
 =?utf-8?B?Um9PYTJxUmM5TzRFaFF5SmJsZ0hiOW1xb0cvdjFOSWYyTzd5T1VyVGpwaXB4?=
 =?utf-8?B?UmpNZFFUdUI1cGUzakc3Zk81R2drQUU0MXIvY0JmMmtVVTRhRFZ3c2x0R1BP?=
 =?utf-8?B?dmtXWmp0eGZCNU5aeTRiMDFGNWYzTFF5SU04MmFwZjdodlA2NEVlSkc1Rkti?=
 =?utf-8?B?NnUwRy8wRTNGSHF2Qm1BUlFQT0xMRmRkUUhxSit2MnAxVjAwZEh1R29jdDZi?=
 =?utf-8?B?NzZPbnlLWHVyTm5FcHJSK3R6bzMxeTBsczAvZTZLNkdZZTRnQTJEd2xUVllr?=
 =?utf-8?B?TkVZMVZIMlpLWXUzbXgzbURZeHN5VFRET082QmZFNUJoRENIQi8rT2FMZXFh?=
 =?utf-8?B?R3lBK2hGU1BYVXVkYytFM01XUS81eTR2cDJqNk5OTmh5c1lLRmZ3bFo1dm9C?=
 =?utf-8?B?R1FKUDdibmpMNnVLbUpCS3NuMVAxQ3JBYkhDNzNrVThBMXBQMkFVM2VzUnJz?=
 =?utf-8?B?dG9UMTM0eC9PQWhocWRuemNhK1l2aVRjWUF2dHdsRVpxT2hqb29HbnlKQ0Va?=
 =?utf-8?B?MjFJZnJoYkF6M3FzRmJhdU1wOGVyaHRIWW02ZEg2WmN5REZVMlJqSFhFYmx6?=
 =?utf-8?B?Znk4V0FFOHlRVUpHeHlWamVRWUl5eU5DbFN5VjJJUXZrT0dLelBFeEdrcFpz?=
 =?utf-8?B?TEJZU2tqUkU3aGpuSnBjR1cwQkVha3RITFVxNVRzZkU1S1F5TWhrWGdLMnd6?=
 =?utf-8?B?UDdPLy9yMEtjMzRLbXpEREhiaGVHMUt3SjRjWkRMQ2RIQ21zVStmSkJnVXg5?=
 =?utf-8?B?RFpVdEdGUHFPUjFRaTM4MDlIQzIvNG8rUnI5OGVvUytFangzYVh5ckVKRmQv?=
 =?utf-8?B?Z2RFeDdnVmw1ODBYZlJrY1Y2ZEMxaHNTS3BSY1luQXNENFRQWjkzT0w4SU11?=
 =?utf-8?B?TGJzdi8wL0VCdkVKVWZuZ1piTGQ4eFFRV1ZCVjV6UmhFai9jTWgrRk04bWg2?=
 =?utf-8?B?ZDFFRGNmQVdrMUw5MXR4ejVQa0F3Znk4aFFoV3dlRjJkZEdOTUhaTHo4dWU2?=
 =?utf-8?B?cEZ6aFVhK0UxVEI0bks2ZkJzZVVoVDVSQTVkNjljTzYzSVNZV0x4NkVlazR3?=
 =?utf-8?B?M3pCc1BtVm52NDJka0xDakF6M0sxYzRadjVTaFdpbi8zaVRwODdFaUN2b1dT?=
 =?utf-8?B?MFlpSEQxeTkwSUxsaVp0Rk5MaUxNay93eVM5VXM5b2krdnhqd3B0U0Q4TUNT?=
 =?utf-8?B?TDVRcnVEWGFROHR2WHFYenRwUFVVOFBYdjViUmlQSGhHSFVCeTJIUmtqWUUr?=
 =?utf-8?B?SXkyZzFRKy9vRlo4c1d4M0JKaGU2ZzB2bjJwRXBaYnlhQWJ0QjV3T1diM3Ux?=
 =?utf-8?B?bFFIRm9CZm4wMVdSWkFOaXNhQ1BBWlEvZW0wY25IRlVrbHRZRWJLbXhCb29O?=
 =?utf-8?B?VGVpSzFXZkVZMFZrRkhCN21tN1NWU0RkMFFuN2RGOXFCVEtFY0hzM2JuMHJ0?=
 =?utf-8?B?R3RTT2p2VGtWRGJ6aDQyVm0zdkNhb2lVSVE0b0pkcUZVNWNNN3JBOTNNT3Zh?=
 =?utf-8?B?WXh2aW1EcHR5OEludE1ZRmgwOFQ2ams2bHozeVJkMjA1UWZaNDV2b29hdkt2?=
 =?utf-8?B?SnFiYmltYVA3T2lRQWxyRzdHOVlMNjB3V3hxQUZkRjM1Rm5aQndEWUVzMGsw?=
 =?utf-8?B?YkIzVFhjWDd5Y25RTlFGUndXS05qQ1V3YTI2WUxNcnZSYlM0a3IraklTWlZN?=
 =?utf-8?Q?yEFOkRG1+PE2I2okVLSowuyYgAjzpStenFVx1Dn?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ace5a24a-179e-4422-3ebd-08d97f3f9768
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2021 09:42:15.0903
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GtPHs46Daeci0R1qTwIx05CMvFrxMvdaSePclm2v/EZ/zWNRNBLbSbCQzSKuAruDrqieDQFQr3XosvOiIBr3bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6303

In order to be able to insert/remove super-pages we need to allow
callers of the walking function to specify at which point to stop the
walk.

For intel_iommu_lookup_page() integrate the last level access into
the main walking function.

dma_pte_clear_one() gets only partly adjusted for now: Error handling
and order parameter get put in place, but the order parameter remains
ignored (just like intel_iommu_map_page()'s order part of the flags).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I have to admit that I don't understand why domain_pgd_maddr() wants to
populate all page table levels for DFN 0.

I was actually wondering whether it wouldn't make sense to integrate
dma_pte_clear_one() into its only caller intel_iommu_unmap_page(), for
better symmetry with intel_iommu_map_page().
---
v2: Fix build.

--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -264,63 +264,116 @@ static u64 bus_to_context_maddr(struct v
     return maddr;
 }
 
-static u64 addr_to_dma_page_maddr(struct domain *domain, u64 addr, int alloc)
+/*
+ * This function walks (and if requested allocates) page tables to the
+ * designated target level. It returns
+ * - 0 when a non-present entry was encountered and no allocation was
+ *   requested,
+ * - a small positive value (the level, i.e. below PAGE_SIZE) upon allocation
+ *   failure,
+ * - for target > 0 the address of the page table holding the leaf PTE for
+ *   the requested address,
+ * - for target == 0 the full PTE.
+ */
+static uint64_t addr_to_dma_page_maddr(struct domain *domain, daddr_t addr,
+                                       unsigned int target,
+                                       unsigned int *flush_flags, bool alloc)
 {
     struct domain_iommu *hd = dom_iommu(domain);
     int addr_width = agaw_to_width(hd->arch.vtd.agaw);
     struct dma_pte *parent, *pte = NULL;
-    int level = agaw_to_level(hd->arch.vtd.agaw);
-    int offset;
+    unsigned int level = agaw_to_level(hd->arch.vtd.agaw), offset;
     u64 pte_maddr = 0;
 
     addr &= (((u64)1) << addr_width) - 1;
     ASSERT(spin_is_locked(&hd->arch.mapping_lock));
+    ASSERT(target || !alloc);
+
     if ( !hd->arch.vtd.pgd_maddr )
     {
         struct page_info *pg;
 
-        if ( !alloc || !(pg = iommu_alloc_pgtable(domain)) )
+        if ( !alloc )
+            goto out;
+
+        pte_maddr = level;
+        if ( !(pg = iommu_alloc_pgtable(domain)) )
             goto out;
 
         hd->arch.vtd.pgd_maddr = page_to_maddr(pg);
     }
 
-    parent = (struct dma_pte *)map_vtd_domain_page(hd->arch.vtd.pgd_maddr);
-    while ( level > 1 )
+    pte_maddr = hd->arch.vtd.pgd_maddr;
+    parent = map_vtd_domain_page(pte_maddr);
+    while ( level > target )
     {
         offset = address_level_offset(addr, level);
         pte = &parent[offset];
 
         pte_maddr = dma_pte_addr(*pte);
-        if ( !pte_maddr )
+        if ( !dma_pte_present(*pte) || (level > 1 && dma_pte_superpage(*pte)) )
         {
             struct page_info *pg;
+            /*
+             * Higher level tables always set r/w, last level page table
+             * controls read/write.
+             */
+            struct dma_pte new_pte = { DMA_PTE_PROT };
 
             if ( !alloc )
-                break;
+            {
+                pte_maddr = 0;
+                if ( !dma_pte_present(*pte) )
+                    break;
+
+                /*
+                 * When the leaf entry was requested, pass back the full PTE,
+                 * with the address adjusted to account for the residual of
+                 * the walk.
+                 */
+                pte_maddr = pte->val +
+                    (addr & ((1UL << level_to_offset_bits(level)) - 1) &
+                     PAGE_MASK);
+                if ( !target )
+                    break;
+            }
 
+            pte_maddr = level - 1;
             pg = iommu_alloc_pgtable(domain);
             if ( !pg )
                 break;
 
             pte_maddr = page_to_maddr(pg);
-            dma_set_pte_addr(*pte, pte_maddr);
+            dma_set_pte_addr(new_pte, pte_maddr);
 
-            /*
-             * high level table always sets r/w, last level
-             * page table control read/write
-             */
-            dma_set_pte_readable(*pte);
-            dma_set_pte_writable(*pte);
+            if ( dma_pte_present(*pte) )
+            {
+                struct dma_pte *split = map_vtd_domain_page(pte_maddr);
+                unsigned long inc = 1UL << level_to_offset_bits(level - 1);
+
+                split[0].val = pte->val;
+                if ( inc == PAGE_SIZE )
+                    split[0].val &= ~DMA_PTE_SP;
+
+                for ( offset = 1; offset < PTE_NUM; ++offset )
+                    split[offset].val = split[offset - 1].val + inc;
+
+                iommu_sync_cache(split, PAGE_SIZE);
+                unmap_vtd_domain_page(split);
+
+                if ( flush_flags )
+                    *flush_flags |= IOMMU_FLUSHF_modified;
+            }
+
+            write_atomic(&pte->val, new_pte.val);
             iommu_sync_cache(pte, sizeof(struct dma_pte));
         }
 
-        if ( level == 2 )
+        if ( --level == target )
             break;
 
         unmap_vtd_domain_page(parent);
         parent = map_vtd_domain_page(pte_maddr);
-        level--;
     }
 
     unmap_vtd_domain_page(parent);
@@ -346,7 +399,7 @@ static uint64_t domain_pgd_maddr(struct
     if ( !hd->arch.vtd.pgd_maddr )
     {
         /* Ensure we have pagetables allocated down to leaf PTE. */
-        addr_to_dma_page_maddr(d, 0, 1);
+        addr_to_dma_page_maddr(d, 0, 1, NULL, true);
 
         if ( !hd->arch.vtd.pgd_maddr )
             return 0;
@@ -691,8 +744,9 @@ static int __must_check iommu_flush_iotl
 }
 
 /* clear one page's page table */
-static void dma_pte_clear_one(struct domain *domain, uint64_t addr,
-                              unsigned int *flush_flags)
+static int dma_pte_clear_one(struct domain *domain, daddr_t addr,
+                             unsigned int order,
+                             unsigned int *flush_flags)
 {
     struct domain_iommu *hd = dom_iommu(domain);
     struct dma_pte *page = NULL, *pte = NULL;
@@ -700,11 +754,11 @@ static void dma_pte_clear_one(struct dom
 
     spin_lock(&hd->arch.mapping_lock);
     /* get last level pte */
-    pg_maddr = addr_to_dma_page_maddr(domain, addr, 0);
-    if ( pg_maddr == 0 )
+    pg_maddr = addr_to_dma_page_maddr(domain, addr, 1, flush_flags, false);
+    if ( pg_maddr < PAGE_SIZE )
     {
         spin_unlock(&hd->arch.mapping_lock);
-        return;
+        return pg_maddr ? -ENOMEM : 0;
     }
 
     page = (struct dma_pte *)map_vtd_domain_page(pg_maddr);
@@ -714,7 +768,7 @@ static void dma_pte_clear_one(struct dom
     {
         spin_unlock(&hd->arch.mapping_lock);
         unmap_vtd_domain_page(page);
-        return;
+        return 0;
     }
 
     dma_clear_pte(*pte);
@@ -724,6 +778,8 @@ static void dma_pte_clear_one(struct dom
     iommu_sync_cache(pte, sizeof(struct dma_pte));
 
     unmap_vtd_domain_page(page);
+
+    return 0;
 }
 
 static int iommu_set_root_entry(struct vtd_iommu *iommu)
@@ -1836,8 +1892,9 @@ static int __must_check intel_iommu_map_
         return 0;
     }
 
-    pg_maddr = addr_to_dma_page_maddr(d, dfn_to_daddr(dfn), 1);
-    if ( !pg_maddr )
+    pg_maddr = addr_to_dma_page_maddr(d, dfn_to_daddr(dfn), 1, flush_flags,
+                                      true);
+    if ( pg_maddr < PAGE_SIZE )
     {
         spin_unlock(&hd->arch.mapping_lock);
         return -ENOMEM;
@@ -1887,17 +1944,14 @@ static int __must_check intel_iommu_unma
     if ( iommu_hwdom_passthrough && is_hardware_domain(d) )
         return 0;
 
-    dma_pte_clear_one(d, dfn_to_daddr(dfn), flush_flags);
-
-    return 0;
+    return dma_pte_clear_one(d, dfn_to_daddr(dfn), 0, flush_flags);
 }
 
 static int intel_iommu_lookup_page(struct domain *d, dfn_t dfn, mfn_t *mfn,
                                    unsigned int *flags)
 {
     struct domain_iommu *hd = dom_iommu(d);
-    struct dma_pte *page, val;
-    u64 pg_maddr;
+    uint64_t val;
 
     /*
      * If VT-d shares EPT page table or if the domain is the hardware
@@ -1909,25 +1963,16 @@ static int intel_iommu_lookup_page(struc
 
     spin_lock(&hd->arch.mapping_lock);
 
-    pg_maddr = addr_to_dma_page_maddr(d, dfn_to_daddr(dfn), 0);
-    if ( !pg_maddr )
-    {
-        spin_unlock(&hd->arch.mapping_lock);
-        return -ENOENT;
-    }
-
-    page = map_vtd_domain_page(pg_maddr);
-    val = page[dfn_x(dfn) & LEVEL_MASK];
+    val = addr_to_dma_page_maddr(d, dfn_to_daddr(dfn), 0, NULL, false);
 
-    unmap_vtd_domain_page(page);
     spin_unlock(&hd->arch.mapping_lock);
 
-    if ( !dma_pte_present(val) )
+    if ( val < PAGE_SIZE )
         return -ENOENT;
 
-    *mfn = maddr_to_mfn(dma_pte_addr(val));
-    *flags = dma_pte_read(val) ? IOMMUF_readable : 0;
-    *flags |= dma_pte_write(val) ? IOMMUF_writable : 0;
+    *mfn = maddr_to_mfn(val);
+    *flags = val & DMA_PTE_READ ? IOMMUF_readable : 0;
+    *flags |= val & DMA_PTE_WRITE ? IOMMUF_writable : 0;
 
     return 0;
 }


