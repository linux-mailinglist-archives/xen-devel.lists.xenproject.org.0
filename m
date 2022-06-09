Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F03C95448C4
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jun 2022 12:25:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.344942.570583 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzFLx-0007Vb-OX; Thu, 09 Jun 2022 10:25:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 344942.570583; Thu, 09 Jun 2022 10:25:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzFLx-0007SU-KP; Thu, 09 Jun 2022 10:25:25 +0000
Received: by outflank-mailman (input) for mailman id 344942;
 Thu, 09 Jun 2022 10:25:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jWvP=WQ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1nzFIR-0003pZ-Ts
 for xen-devel@lists.xenproject.org; Thu, 09 Jun 2022 10:21:47 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on061b.outbound.protection.outlook.com
 [2a01:111:f400:fe0d::61b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f70c16e7-e7dd-11ec-b605-df0040e90b76;
 Thu, 09 Jun 2022 12:21:46 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Thu, 9 Jun
 2022 10:21:44 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5332.013; Thu, 9 Jun 2022
 10:21:44 +0000
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
X-Inumbo-ID: f70c16e7-e7dd-11ec-b605-df0040e90b76
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ITIHncsS5i6juTV/OQ1dadMZFTNGBGE/cDmro+DuVd3y3qytYIV8pJDYuJqyS7askxMnYDqyx6se6bIrjEKnj6wwrnmM/K/yAY1K8KjaP6rKfkAbDDhsmOfTq4I5YgYJ3/9wwBpHHe8QZgPkL4n5lKOf/i6vLgalwDK0GCd1h5YBvI7bCY28UcLXF05alB8GO2n6ULR0UVniV2NdU65mBI4N8eNeVAO1yQqqrHb15YQ4A4Tjz2gnM+penn37RpNXWrB9OU0hBkZ7oqCB3MYsGpWkGHQVsteug6pn6/PJ8dKRw/8eh8r91vVzVO1IP9xPkmUw6yhmhyGX9m0hW5ElGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aNGQdoucDFou5j3M8E7Hd4miL8kBXhKfjN3w6aHaDIs=;
 b=VzF/WEsM4wYMSbleMTCRK+yfIaQ7T4UtmEmrBurN+i7sJ9D/f6FaJTfIbYyGHFLAlosf84hzdkYzHEJ8uljnKHNznzbKmcWONR1V6+EaQMoI25suRclxWdk4udo+rYJ8m+XwJ0fDQ5GZl9gksqC1SiOOOZs3+95C3iG2fnrUeFVmTePtfWuetkNj9aTvHwws/dcNzizYp/u3EyAVi5h5fvTnb2OX0rShux73uQgTfr+jkpdI7HNqoTb23tnHg+nng3uJYMqJGLe2ZhgKApIRnEYDRqg6SMyZpkaX1s1ImUzLcuGixrMA7d9f215B5pRgfskJ4AGq9QTLDeXbzYs/UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aNGQdoucDFou5j3M8E7Hd4miL8kBXhKfjN3w6aHaDIs=;
 b=QcorO23eUpXazUWkY+jKT6nWBUWoitabBH5iY6WmuJcNNzU4xUBUv4g/Lpey4CjVRCeEJrnhXzb4Nf18G2gHRXBScqT0p/WllolbAYXiacQsKpMvSn4WodxT+87oCubVmIVlnkdPAxU7gKBpWDTLWKDqS8KlSv5z9VIW3jr76RC+cuO8NGteOS9H5cpoYp3SiMTqwgnYhaEELWRNa9+HNb4IDEIV5MYMMMdVu+oA8cVX6cjSFK0YmUgaSco9hParby/AK5IbiRCUjGLPj4YdZaECmMRFm/rpCkRRdAkclDo+iEoNQUgU/qplFQMee/bhpBGrQQaB7jQfeZfiseRcCg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <10a6eee9-099e-59c1-7dcc-60bdb9902703@suse.com>
Date: Thu, 9 Jun 2022 12:21:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: [PATCH v6 12/12] VT-d: fold dma_pte_clear_one() into its only caller
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <e873e30c-7a04-a8a3-2fe5-0dda30e654fe@suse.com>
In-Reply-To: <e873e30c-7a04-a8a3-2fe5-0dda30e654fe@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0473.eurprd06.prod.outlook.com
 (2603:10a6:20b:49a::25) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ffe31b03-f075-4088-0a26-08da4a01da72
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_
X-Microsoft-Antispam-PRVS:
	<DU2PR04MB87900B0C5E7959C47414FA81B3A79@DU2PR04MB8790.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PC4veMMXI+eII7Wml7Hvnh5o4eAhZtVk5BnBJXZ1EBeawvLsOsRgzwWB+x8gdGwFP5EGw5QqwQEnNaL9K8500w5q+2s43kq+1reYYCHUHN7TIUseiRFmE7QoUho1BA6u6CiI2zHNSM3JwnrOsrbWVP81a57jdlqyYDNeh4P9xhx1+yZYZkcsjq10FhgPjhTwwgX1obLXjpkmSaAu3iia77/x0q3VwAyJnKucV/Fni6oNJDaH6JQ5Uz54SMrL+RSX/6FUJJgjYw6f6Q2EbXn9aqDu29LgcyOPOYLAVi1Jb/iFSBNKaPmGQOLfsxaOJLrwVAwFRqIb5SWAywJg/fmxwwCSTEuU4RgfZHtBL5+IVyzcQMnD2GtNEvWLOsWfDFcWr/M/ndESGZ6w+SIsyEKsWlWCfF2Iv2HCryqh63gcdU824keqEePAyBUnu56JM38jqgdRimLolg4wvzAGM1yqHvPcwbCJc+VQu2ClImJVbFI0fr/ZuB60ebH9zOBDL5SAxxVHTDx9CDta8vwcyY1z9pQ3aGCnUAmnc1wfvxWa4SAPOjP+fCB7LCliYMLM3xH98tYSVUaAHGfvabQd/72ScPn8kCiVvt7c7DrhRpPTaUXPKP5rDsNC8SZTgaytUY7frFyL8vvOTjK2aLsLd51MieyyZzkCCu5u26/AGjdeK4CYKS5+O6mdA2z7WAruXg09aZaAs2AI7zIBFyUjQczgWdlH3sYuNy2dD8ypd7Ak9+c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66476007)(6916009)(66556008)(8676002)(4326008)(54906003)(31686004)(316002)(31696002)(5660300002)(6506007)(6486002)(26005)(6512007)(38100700002)(36756003)(2616005)(186003)(8936002)(66946007)(83380400001)(2906002)(86362001)(508600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TWcrbndFSFp5RjlvOXB4djl3WWhyenNDakFjeXV0SHJHd3hDSGxEbm5YZzFU?=
 =?utf-8?B?TEIzcXZCK2w4eUtDTEp6YU1neGJSWDREdCtHY0RwMTVUaHVCYVhZUTdKRUhS?=
 =?utf-8?B?RWZmd3pqOVJRMUhlR05QNnpIYzcxVTZvZTdPck16WE5Ma01KTWhUYzI3MVp2?=
 =?utf-8?B?aERiK052VUVhWjNJRDluUUJSZHl2NExScVp3QkxYd3hwVzJ1L1JhbXdGdmZv?=
 =?utf-8?B?NkUrSEl5b0FxbFFxb2gvbkNaUHY3RUpZbHRPcTJxeGZoSU8yN1VaUlFCUkJr?=
 =?utf-8?B?MXRhZEZiamttVnQzK3NpWTZsMDRDVkQxOUdldzJCS3c5WjQzZHJiOXpPR0t5?=
 =?utf-8?B?S2k1akNNNFhOak9TU1grV0dWaHRLNThJQ0dJSWRvaUVXdFVGdUVRTmVVVEFp?=
 =?utf-8?B?bXlrdXM1SzhGYkZmMHZHWkN1UnFSR0c0U1NQWG50VTFwdHJKM3VqencvMHpN?=
 =?utf-8?B?UVF6QWtaY0ZkSlVYazFFbElCV2w2Qkk4WTk1cVFWaCs5eVpJTUdOeiswRFJU?=
 =?utf-8?B?VzhibEZXeFpLYTdaU0V2bnkxM0dDbGlRTWcxc0JzVUJJcEZjeEFtOHFNQ0pH?=
 =?utf-8?B?eG45b0FoZXhjdGFtaUp0SE1GMW5vYnpxU2h4RG5BQWs4dFlOdEQ2elVlaTFJ?=
 =?utf-8?B?YUJnMUpvS1VvcnBYbUhaelhBZEZWS0wvMG01VTBOeEVpejNSOUJlMS9zaTVj?=
 =?utf-8?B?Z2hHeC9mbFo3c3lpYmZyc1J4a3VkbTRZUU5iSkVabXo4d3ZoZEIzVEZvSVVT?=
 =?utf-8?B?dXBYS2NqS3Y2VDg1ZTdzdHlwaFNLWVF0Q1dCWXR3eGxINDh6cXNwUGZJRGsz?=
 =?utf-8?B?UDBjYWg2RzJ1Sk9GWnUxbFhmdW5ZTnFYc0tHc3FIMktwSmprbSs1blFJcUdN?=
 =?utf-8?B?ZVA3WjVuVkMwTnQ0TTdweDczNXJXVHh3RnN1YVhkalpKUHpTM3UyYzI4enlO?=
 =?utf-8?B?dGd0cTFtemVUN2QvOHYvVmxldE9QWGlad0VkWmtlMVVjSlV1RlJlWE44YmRH?=
 =?utf-8?B?NkhiWmpxQWZSNXhPaS9KcDdkK3JVWXllWExJdEp6ZEVMWGJMQ3RPR1ZCNkJk?=
 =?utf-8?B?eW8vYjdwRHYrUjFPUzNYVm1KMGZ2SVN0dmIrdi9NRC9ZRUFxUGg4N29pNGdl?=
 =?utf-8?B?MG1kYXMvaTg0SmNaYkd1aEpKeCtOSnkrV1hGQk4vVTZBVjA2dHk0U3p5QU9a?=
 =?utf-8?B?bWkrQUliT213ays2Vk9kY3J4czVjWnZac2lxSTNWUHhJTURrc2h2Zkhlck4r?=
 =?utf-8?B?RkJrRnNuOWdZS3c1aXRENHFKR3ZtWjU1WFlyQVFLajJ2OVVDUVdZN1J3TDlY?=
 =?utf-8?B?cmFOazZKdTdnVWhsQ1RjcndFN0Y5Z3dVa3pSRG4wRUI2Z1U3RVdheFJ6c2NK?=
 =?utf-8?B?Wk9KNm43MkRzSHdQRkNYTHFGOG5ZZ3VTMDZGRlBMNmU3ZGEvNFdUTVpWUjNq?=
 =?utf-8?B?ZUx6ZlloTkxqcm1LdDcvRENEY1pMenlPRkxlbGlGcWJmWkI0aUZqaTdNdkRB?=
 =?utf-8?B?dlpNL0NtZ2t4U05ERldjb2xEUVB1K2dFOTY0NjVtdmM4SUVDTUVFZGd5dFdw?=
 =?utf-8?B?eU9PcHY1VjhvOG1xVDJaR2hvN0xXNzVKNTRpWjgrYWFwZFR6TnJrYVpoL2Zx?=
 =?utf-8?B?ZlJyVE4xQ0d2SWRQTEVqSVFPcFNzZ2JXUmNHbVA2WlgrWEl3djNvcUg2NWVm?=
 =?utf-8?B?RVZYK0wxS04wbWxnOCtidGkxNCs0a1VUQVM3WE90dndKakZZdjE5TkFFalZS?=
 =?utf-8?B?UFA2ZG1URDJBT2I4aTB0VWM3T1pPMUcrUUxtZERoeXMxenNwMWU2WDFQYjdv?=
 =?utf-8?B?Q25wd2lqbkt4L0NYQ1BiVXBDKy82RlhxWmNDWDlwb3ZjeDBSKzhkMGt3NUdx?=
 =?utf-8?B?T1ZGWTBTZW1UaFFXY0hxU2paU2JUWnU2MmluM2VOTkUxUlVpbU1KQThza20v?=
 =?utf-8?B?Z0g3ekRsMDhRTUdhVGd3c21DeG1UbGxFNlErQnJDSDJNZ2kySnBpd3RnQ2kw?=
 =?utf-8?B?QjhQM0NmRk5qaTRXUWZrUUtJOVZqUjNmYW9mUE4rNlNNVkxGNDRGdWtzazJx?=
 =?utf-8?B?TXJxWkhjRU56b1pOeGdJd25iVGV2cGVTQWI0dG5uY2xWVENPOHdKSjVxMmVK?=
 =?utf-8?B?SWx5eUhCNFk5ZGlYWmsrMUNoTWUxaUNPU1FiNGtKQXhabC9hZG5YVVN3S2NQ?=
 =?utf-8?B?VU1BY3VOZ293dVQ2WisrNmtKZTQ2QnM0MFl3eHF5UUt4OTZnYTJVaG1ueGlp?=
 =?utf-8?B?cmJ5Vlp4SlYwQmY2SitaU1I3N0ZyOW5HUmpiVzllQXRXbERuVHVmVzUxd096?=
 =?utf-8?B?RkZ5ZHhwaDNQWENwbkZvdklKSkE2dnNuaGo2WGhPZ0E2clRlSG0rQT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffe31b03-f075-4088-0a26-08da4a01da72
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2022 10:21:44.8082
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NE19DrHYCw9eNRXiHFZo5CthOYUaSwPVAjtq7php6oBacDI+uMdBGv4PB5rlLAbcBY9Z5u7/mJQRS9Sd+HLqww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8790

This way intel_iommu_unmap_page() ends up quite a bit more similar to
intel_iommu_map_page().

No functional change intended.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
---
v5: Re-base of changes earlier in the series.
v4: New.

--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -806,75 +806,6 @@ static void queue_free_pt(struct domain_
     iommu_queue_free_pgtable(hd, mfn_to_page(mfn));
 }
 
-/* clear one page's page table */
-static int dma_pte_clear_one(struct domain *domain, daddr_t addr,
-                             unsigned int order,
-                             unsigned int *flush_flags)
-{
-    struct domain_iommu *hd = dom_iommu(domain);
-    struct dma_pte *page = NULL, *pte = NULL, old;
-    u64 pg_maddr;
-    unsigned int level = (order / LEVEL_STRIDE) + 1;
-
-    spin_lock(&hd->arch.mapping_lock);
-    /* get target level pte */
-    pg_maddr = addr_to_dma_page_maddr(domain, addr, level, flush_flags, false);
-    if ( pg_maddr < PAGE_SIZE )
-    {
-        spin_unlock(&hd->arch.mapping_lock);
-        return pg_maddr ? -ENOMEM : 0;
-    }
-
-    page = (struct dma_pte *)map_vtd_domain_page(pg_maddr);
-    pte = &page[address_level_offset(addr, level)];
-
-    if ( !dma_pte_present(*pte) )
-    {
-        spin_unlock(&hd->arch.mapping_lock);
-        unmap_vtd_domain_page(page);
-        return 0;
-    }
-
-    old = *pte;
-    dma_clear_pte(*pte);
-    iommu_sync_cache(pte, sizeof(*pte));
-
-    while ( pt_update_contig_markers(&page->val,
-                                     address_level_offset(addr, level),
-                                     level, PTE_kind_null) &&
-            ++level < min_pt_levels )
-    {
-        struct page_info *pg = maddr_to_page(pg_maddr);
-
-        unmap_vtd_domain_page(page);
-
-        pg_maddr = addr_to_dma_page_maddr(domain, addr, level, flush_flags,
-                                          false);
-        BUG_ON(pg_maddr < PAGE_SIZE);
-
-        page = map_vtd_domain_page(pg_maddr);
-        pte = &page[address_level_offset(addr, level)];
-        dma_clear_pte(*pte);
-        iommu_sync_cache(pte, sizeof(*pte));
-
-        *flush_flags |= IOMMU_FLUSHF_all;
-        iommu_queue_free_pgtable(hd, pg);
-        perfc_incr(iommu_pt_coalesces);
-    }
-
-    spin_unlock(&hd->arch.mapping_lock);
-
-    unmap_vtd_domain_page(page);
-
-    *flush_flags |= IOMMU_FLUSHF_modified;
-
-    if ( order && !dma_pte_superpage(old) )
-        queue_free_pt(hd, maddr_to_mfn(dma_pte_addr(old)),
-                      order / LEVEL_STRIDE);
-
-    return 0;
-}
-
 static int iommu_set_root_entry(struct vtd_iommu *iommu)
 {
     u32 sts;
@@ -2264,11 +2195,17 @@ static int __must_check cf_check intel_i
 static int __must_check cf_check intel_iommu_unmap_page(
     struct domain *d, dfn_t dfn, unsigned int order, unsigned int *flush_flags)
 {
+    struct domain_iommu *hd = dom_iommu(d);
+    daddr_t addr = dfn_to_daddr(dfn);
+    struct dma_pte *page = NULL, *pte = NULL, old;
+    uint64_t pg_maddr;
+    unsigned int level = (order / LEVEL_STRIDE) + 1;
+
     /*
      * While really we could unmap at any granularity, for now we assume unmaps
      * are issued by common code only at the same granularity as maps.
      */
-    ASSERT((dom_iommu(d)->platform_ops->page_sizes >> order) & PAGE_SIZE_4K);
+    ASSERT((hd->platform_ops->page_sizes >> order) & PAGE_SIZE_4K);
 
     /* Do nothing if VT-d shares EPT page table */
     if ( iommu_use_hap_pt(d) )
@@ -2278,7 +2215,62 @@ static int __must_check cf_check intel_i
     if ( iommu_hwdom_passthrough && is_hardware_domain(d) )
         return 0;
 
-    return dma_pte_clear_one(d, dfn_to_daddr(dfn), order, flush_flags);
+    spin_lock(&hd->arch.mapping_lock);
+    /* get target level pte */
+    pg_maddr = addr_to_dma_page_maddr(d, addr, level, flush_flags, false);
+    if ( pg_maddr < PAGE_SIZE )
+    {
+        spin_unlock(&hd->arch.mapping_lock);
+        return pg_maddr ? -ENOMEM : 0;
+    }
+
+    page = map_vtd_domain_page(pg_maddr);
+    pte = &page[address_level_offset(addr, level)];
+
+    if ( !dma_pte_present(*pte) )
+    {
+        spin_unlock(&hd->arch.mapping_lock);
+        unmap_vtd_domain_page(page);
+        return 0;
+    }
+
+    old = *pte;
+    dma_clear_pte(*pte);
+    iommu_sync_cache(pte, sizeof(*pte));
+
+    while ( pt_update_contig_markers(&page->val,
+                                     address_level_offset(addr, level),
+                                     level, PTE_kind_null) &&
+            ++level < min_pt_levels )
+    {
+        struct page_info *pg = maddr_to_page(pg_maddr);
+
+        unmap_vtd_domain_page(page);
+
+        pg_maddr = addr_to_dma_page_maddr(d, addr, level, flush_flags, false);
+        BUG_ON(pg_maddr < PAGE_SIZE);
+
+        page = map_vtd_domain_page(pg_maddr);
+        pte = &page[address_level_offset(addr, level)];
+        dma_clear_pte(*pte);
+        iommu_sync_cache(pte, sizeof(*pte));
+
+        *flush_flags |= IOMMU_FLUSHF_all;
+        iommu_queue_free_pgtable(hd, pg);
+        perfc_incr(iommu_pt_coalesces);
+    }
+
+    spin_unlock(&hd->arch.mapping_lock);
+
+    unmap_vtd_domain_page(page);
+
+    *flush_flags |= IOMMU_FLUSHF_modified;
+
+    if ( order && !dma_pte_superpage(old) )
+        queue_free_pt(hd, maddr_to_mfn(dma_pte_addr(old)),
+                      order / LEVEL_STRIDE);
+
+    return 0;
 }
 
 static int cf_check intel_iommu_lookup_page(


