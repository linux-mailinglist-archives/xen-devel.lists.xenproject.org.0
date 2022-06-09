Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA6C544898
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jun 2022 12:18:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.344881.570506 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzFF1-0002A5-VJ; Thu, 09 Jun 2022 10:18:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 344881.570506; Thu, 09 Jun 2022 10:18:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzFF1-00027h-SL; Thu, 09 Jun 2022 10:18:15 +0000
Received: by outflank-mailman (input) for mailman id 344881;
 Thu, 09 Jun 2022 10:18:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jWvP=WQ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1nzFF0-000264-9E
 for xen-devel@lists.xenproject.org; Thu, 09 Jun 2022 10:18:14 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on0611.outbound.protection.outlook.com
 [2a01:111:f400:fe0d::611])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 77eaa28c-e7dd-11ec-b605-df0040e90b76;
 Thu, 09 Jun 2022 12:18:13 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Thu, 9 Jun
 2022 10:18:11 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5332.013; Thu, 9 Jun 2022
 10:18:11 +0000
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
X-Inumbo-ID: 77eaa28c-e7dd-11ec-b605-df0040e90b76
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DaR4wWkNvCjzOLg9rWoHFv8x0ogd7WgRJk9ugUcN35Y8HKoGQsEIYNP4mjuPLPXYIBKhF2FEqT/h2r+LFRuocknzytZfla8rHy7vN4dR+s/clp53R+0mIfXJA5Sm4r2zPty6IG9jOhvtkcpKq55yaxVEN5+k+DWSz0XfeSmctU1NjTuGoBNTTHtyj5lfsVCULOGhZfbjl4bKAu1l2w+Glsybz2WHkgg4dzOEGcavuijf8YKpuV2Yl3P26fClIjSkyPCTzE+J9y7MZV16lu1qIqntzt8bRasakcCMjuxcRowP0Z5zFMpO/ENv9eh2YqfQkMX3I+QTkof/XbRQuNAn1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nYq1b9sHpYOMu/7plOnkihexpK35czv31oBFyEyWWuo=;
 b=TVyCmsdizZX/7J0a2+6kXQOhB8eLu4WuTK7bz/DYYsaEyWy2CCPRlVXzg7H7ndMhz/y+RJg+ycs4hJors+QQapL4rW1Vy84vD1/y2D5prxbdRYqWYn/Ox6AX/LLt1oR5lf9OLcrWSvQhQbew6S80vgnhBSRgaZaMnDNfYJ4UESsixU0nflJO7vMwOwJE6bMY+2B4cH+QZ4Tbng9eAfth93aqv2RYzGFIP2IgRzhzpPPXjhWU5MNVf531EYxMnkltllisbl7gyb8WXCnf5k7hUX8iN/ZOZCPGtYidWx/9Ds0vNOqxdpJ5nnCJaHuSBI1OpZiS3bT5pvRAFuwnWwwfdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nYq1b9sHpYOMu/7plOnkihexpK35czv31oBFyEyWWuo=;
 b=bEtwslfUSOAUr720RO8IdKRPY7ukKrOKcfw3p3S/M1HG2Vf7vK0kemxLji0C9O/o+eLKYHp5Q3XLYq416rBiuFmZsvw7k14ygRoqtesOPBYwQVagixG1B6Y5+WHH67rQKOS0pxVvcgFpB/OJ5r1Pi24becsqJI0XmzCA4PLzNdIkqcbLzALx2F7/QDL9J0Ve73TEmXbSEQwIaYTEmjcdq3/bEqfgx0/ux06ZfQHCCTQUrd31CyZGXFoloW7aJ9YQNpgUtoVVMfCvkkGvy2Mw5O1KOaFk0A6zAsCmCEuEWqKba6L0ECyGEl6HkMVuL81JMvyc5DpqnbExCEotYckZ3A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a2a3e240-115e-4c76-7fd9-61cdcebafd13@suse.com>
Date: Thu, 9 Jun 2022 12:18:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: [PATCH v6 04/12] VT-d: allow use of superpage mappings
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <e873e30c-7a04-a8a3-2fe5-0dda30e654fe@suse.com>
In-Reply-To: <e873e30c-7a04-a8a3-2fe5-0dda30e654fe@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR04CA0131.eurprd04.prod.outlook.com
 (2603:10a6:20b:531::28) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ff67f553-29e7-400a-d708-08da4a015afb
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_
X-Microsoft-Antispam-PRVS:
	<DU2PR04MB8790CE75924B9BD1A1C3BA00B3A79@DU2PR04MB8790.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rcDKphobPpyg2XD4eV+IHvRKo/IeKj9+MWjKXYjRjUI4zcrpPYjtcKQHJSUNgBi2KIa0xWB1OxPD2v34XQfEAb5YnqIMHCp6SNaNpGExOuUAXfEZYVyZEJ0xHKrpPQ0CMu5bj9ZiTPDOstyi6c1+VXY3ROvA8Tol34bMLFjPXVpLU2N9oXEwPq1kXPH+qMlNxpuL5SmZ8XZWdE7AcW2Y70LLnSP1WyPZsgGigXo8ZTfyUWcxq3kDpc7Ky5Q5z+eZD4GkpB8R1eFrPysp9/N2U1taJulTN+Y6/TganLXK6cOv0a4r2kSs/VTryu61K8P9fGhJAmzuFUCBfv1hWJLUjuiiW+I/RtVn1aZ0k/qjZLTZenNCClkx5iRV2t7iQqg/UX1OGZl80AqoiYq7pLBTwPpIdIVH0uyHc56WCBt0Zzsm3l6Drl+0f0BV/XWAIgywXDVTq9jotdhRC6RdKO3I5cCMnNZdwwVNZqrg1Z2U/k96cPVMKM0iY220M3nQFqiAj1nY2JoUcUEC8VPXMEAK4c+aiukzwpxsZPrZBx3LGfayBe0HLzzazZne4BLAUvUshXjLSbuvhBvGejwxKrtNQtqBgSZMDnF4GAGvhiax92sXMHf2Asg72FQBjOOZDXsaWN/0rnB7Bqcm9u6u0mAxZOraNcOKdqYe9Y6wuQMmq7iC6OVWv88P3sMV77c7776kAV5r1+flklwxP828MBZSu+wGHM+PGTJAHmU7HL2vebluL0VIPpmNMA3bfzTWTGmE
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(26005)(6512007)(31696002)(6486002)(6506007)(5660300002)(186003)(66946007)(83380400001)(2906002)(86362001)(508600001)(8936002)(36756003)(2616005)(38100700002)(66476007)(66556008)(8676002)(4326008)(6916009)(316002)(54906003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SFMwOEVtQUZLU3hlVXFHc3dya2ZocGEweDN1bWd5S3U4UFJNS092QXlVS0Fn?=
 =?utf-8?B?eWUvaE9mM1BETC9uM0swcGNnMEp2WmFRQ3l2c1BlWVVOSUY4Vk1sWDU0YjV2?=
 =?utf-8?B?SFhJcVBjUmlNUmRHa1VVanhaaHZTZG55VnpQOGtTMHpiWGliUFo5SWMyQlpj?=
 =?utf-8?B?ODJwNkxHSFloSlZvdGNKcVorbURkY080UC93d1h5Z0ZRTFUwendkcU5kZWwv?=
 =?utf-8?B?QzVaZS9HRkZWVU85SFhqUlh4U3BNTS9XbjhQU0drUWdEL252SnBocVZBT3hR?=
 =?utf-8?B?RURrK0VyRHlMMFpNclpoMVFnOEhLSjBCMDhQdUc2c1BaeDVoOWk2SnBEVll2?=
 =?utf-8?B?cURlTDFoakExTFBFdlZ0UnZvSHNMRFR3bUJNZ0VCeVJxblRxbHZ4SW9HZWwv?=
 =?utf-8?B?UGJrT21DbVUrdE8zTUwxZlRPdjRJZHZpc3dsNUFZbngxVDZlQTd5d1FWQUli?=
 =?utf-8?B?dVpFSzZobFBvOHNCY1QyYWVibVZ0d1N2MlVub2NVYTQwMUlsOGtBUFdLcktv?=
 =?utf-8?B?QkpNRk1Ic3MyUjduU2sxZkpoRVhqZnNqUFJqelBxSGR6QTIveE5tdWNZem0x?=
 =?utf-8?B?aFlFenRueWRsclcxTG9mYzRlYnAxR1puTXB6cFdrd2hRQTB1QVpLTy9BRHRM?=
 =?utf-8?B?MjhJSTN6b3AxRDhUVG82cXlMMzBxSkc0NGpwK2p2VTdzQlZMemtoWUh4OFRy?=
 =?utf-8?B?bUtPRGVGTVdocTJubG44aUZ3TEFGOCtIenhXdkhpcTVnMTlabm56NENnVE9F?=
 =?utf-8?B?YXFsOXNubklBSnE0Y055NUhJYjkrcG4raUQ3SklxWWFZRzNTeDNNRHdhcTN2?=
 =?utf-8?B?eTRJY1pUczNHTDJXcDRmbFZLQ2Y3WU9Ed2pqRkl5NFU3UTNCbUo5TURDMkxH?=
 =?utf-8?B?aXgwclVBeHArekNaK3A3WlU4empENkw3ZWs2enExYnAwb0V1ZUFXZVVQb0VB?=
 =?utf-8?B?bHFNU2pibnY0anBleTBnSkh3UEprby92L0VtU0hQaVc5cGhqby95S3hCamhi?=
 =?utf-8?B?enVOUWJmdUJiNkgzQTB6d2VsTFV6UWdHVHozaWJadGV6dWtKdWpOV1lDamhw?=
 =?utf-8?B?YVpwL3l6R3Z3SjIxd1ZyUFVTbktoTTlYR296S1NBSVdsNGF2UnZOdHgrc0FQ?=
 =?utf-8?B?RnZMNzRHWWFHSVIyUUE0SDRKN3ZVbmxHaFlJRU40YytieUZVQm5qUnl0TWRZ?=
 =?utf-8?B?VTZZQVNFaW1qckh2dk5mYzR4ZGt1eEVlcnZNaGsvdkVQR24rSnJuQmxGTmVa?=
 =?utf-8?B?VG1hT0JxQ21TSHVjMzZPN0tQU09tQ2QyemUwY29hNUdkRTBZVSsxRElVektW?=
 =?utf-8?B?b2pTazA4dVlNZWg0SUxEbTdCQ2lwaGhJTkNFQVJZSW1paGVWam9NV2lFV3Vx?=
 =?utf-8?B?RHNzcjA3elU0ZFJQS3dFenR5M1lMcmdpeFBHOWRmQzYycUVqLzdGUC9nZlAz?=
 =?utf-8?B?ekVNeC9oZmhFQXJJOTBsOHE3M05UUnJ2TkU2WWFlSVpHY3U4VXNmZXd5THNP?=
 =?utf-8?B?emFIdERlUDNLbDdIdnFOWW9la1VBVlJrTW51d1AvbmNzYmorbEx4ZXlNeVpk?=
 =?utf-8?B?VUgweFdwSkExQ2tGRXM2Q0JONEVleE1RcS80NlhuUXlQdnlHQ1hxOUxRanh6?=
 =?utf-8?B?WDZHaEp4a1E1dmEvbmhKbUhJYTNPZ1JxYmtBaVhQbmhDSytmd1BqNWtRb2w3?=
 =?utf-8?B?eEx4Z2s5UGNKZzlTVW9nU1dxcWhFT0NmZHNjMW5SWGc1bGVPRjJXaEx6WFlZ?=
 =?utf-8?B?TjNDUEk2M1lEZnF5NnBHSHYyUDRMWGtLMFJFdE80cEJKQUtaa2JWeXpOWU9o?=
 =?utf-8?B?MENBYUtFNWM3WFBJVjZrQlZvb0pWRHVFWnUxM2tZNEhEakVkNmtNSkhZMERW?=
 =?utf-8?B?SzBSdVVGVDJNS2JOWnZEU2N4MzFKZlBCZUNsNnB3dE5rT05LYUIxNk0zOEYz?=
 =?utf-8?B?d2JsU2Z5dE00YW1QTVVYcHdjUlczaW1EWHM4Ykc3VUQxQm9jVEdseENWMkJI?=
 =?utf-8?B?UVV0cHFkTEsybkxYc3QzVWxrd2VGcUtFWlZHeTlzUkpMbjhCYlhYSFhzQzdo?=
 =?utf-8?B?SVU2V21jNlZUZmwwa2dFZW93ZzlvSlpiRXczd0xaL1RlWktqeFhVMWswUWRq?=
 =?utf-8?B?a1NhMXlkakFGOHFMSE15N1RhSFlsVytJRDFwQnBLOGVmK0NlcERwa1JsSG1N?=
 =?utf-8?B?NkZVMlVxQ3UrUE5MVnp0UmthV3pRZHV6TGFLb1RHSDBhVzdJKzhzVFpMOTdI?=
 =?utf-8?B?WmpFWEhYK0hXUm9QSkhBV1dQc3AyKzlqT1RnUkJjWDBJVmVNWUxlaFNpVVBo?=
 =?utf-8?B?eHQ5VFc0bDN3aDdDQ1dCbHBjbzd4Z3ZYSlpqenlqcnFvNkFmaTdWdz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff67f553-29e7-400a-d708-08da4a015afb
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2022 10:18:10.9629
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sUs2cUBD3ZPyLCVKWVJVXpTHP5n+ceV5RpWJk2WWBtvofpRjs1k4TN0t6nrYvjnT08S4LWf4TOB0Xo4QSqCS3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8790

... depending on feature availability (and absence of quirks).

Also make the page table dumping function aware of superpages.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
---
v6: Re-base over addition of "iommu=no-superpages" command line option.
v5: In intel_iommu_{,un}map_page() assert page order is supported.
v4: Change type of queue_free_pt()'s 1st parameter. Re-base.
v3: Rename queue_free_pt()'s last parameter. Replace "level > 1" checks
    where possible. Tighten assertion.

--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -779,18 +779,37 @@ static int __must_check cf_check iommu_f
     return ret;
 }
 
+static void queue_free_pt(struct domain_iommu *hd, mfn_t mfn, unsigned int level)
+{
+    if ( level > 1 )
+    {
+        struct dma_pte *pt = map_domain_page(mfn);
+        unsigned int i;
+
+        for ( i = 0; i < PTE_NUM; ++i )
+            if ( dma_pte_present(pt[i]) && !dma_pte_superpage(pt[i]) )
+                queue_free_pt(hd, maddr_to_mfn(dma_pte_addr(pt[i])),
+                              level - 1);
+
+        unmap_domain_page(pt);
+    }
+
+    iommu_queue_free_pgtable(hd, mfn_to_page(mfn));
+}
+
 /* clear one page's page table */
 static int dma_pte_clear_one(struct domain *domain, daddr_t addr,
                              unsigned int order,
                              unsigned int *flush_flags)
 {
     struct domain_iommu *hd = dom_iommu(domain);
-    struct dma_pte *page = NULL, *pte = NULL;
+    struct dma_pte *page = NULL, *pte = NULL, old;
     u64 pg_maddr;
+    unsigned int level = (order / LEVEL_STRIDE) + 1;
 
     spin_lock(&hd->arch.mapping_lock);
-    /* get last level pte */
-    pg_maddr = addr_to_dma_page_maddr(domain, addr, 1, flush_flags, false);
+    /* get target level pte */
+    pg_maddr = addr_to_dma_page_maddr(domain, addr, level, flush_flags, false);
     if ( pg_maddr < PAGE_SIZE )
     {
         spin_unlock(&hd->arch.mapping_lock);
@@ -798,7 +817,7 @@ static int dma_pte_clear_one(struct doma
     }
 
     page = (struct dma_pte *)map_vtd_domain_page(pg_maddr);
-    pte = page + address_level_offset(addr, 1);
+    pte = &page[address_level_offset(addr, level)];
 
     if ( !dma_pte_present(*pte) )
     {
@@ -807,14 +826,20 @@ static int dma_pte_clear_one(struct doma
         return 0;
     }
 
+    old = *pte;
     dma_clear_pte(*pte);
-    *flush_flags |= IOMMU_FLUSHF_modified;
 
     spin_unlock(&hd->arch.mapping_lock);
     iommu_sync_cache(pte, sizeof(struct dma_pte));
 
     unmap_vtd_domain_page(page);
 
+    *flush_flags |= IOMMU_FLUSHF_modified;
+
+    if ( order && !dma_pte_superpage(old) )
+        queue_free_pt(hd, maddr_to_mfn(dma_pte_addr(old)),
+                      order / LEVEL_STRIDE);
+
     return 0;
 }
 
@@ -2092,8 +2117,12 @@ static int __must_check cf_check intel_i
     struct domain_iommu *hd = dom_iommu(d);
     struct dma_pte *page, *pte, old, new = {};
     u64 pg_maddr;
+    unsigned int level = (IOMMUF_order(flags) / LEVEL_STRIDE) + 1;
     int rc = 0;
 
+    ASSERT((hd->platform_ops->page_sizes >> IOMMUF_order(flags)) &
+           PAGE_SIZE_4K);
+
     /* Do nothing if VT-d shares EPT page table */
     if ( iommu_use_hap_pt(d) )
         return 0;
@@ -2116,7 +2145,7 @@ static int __must_check cf_check intel_i
         return 0;
     }
 
-    pg_maddr = addr_to_dma_page_maddr(d, dfn_to_daddr(dfn), 1, flush_flags,
+    pg_maddr = addr_to_dma_page_maddr(d, dfn_to_daddr(dfn), level, flush_flags,
                                       true);
     if ( pg_maddr < PAGE_SIZE )
     {
@@ -2125,13 +2154,15 @@ static int __must_check cf_check intel_i
     }
 
     page = (struct dma_pte *)map_vtd_domain_page(pg_maddr);
-    pte = &page[dfn_x(dfn) & LEVEL_MASK];
+    pte = &page[address_level_offset(dfn_to_daddr(dfn), level)];
     old = *pte;
 
     dma_set_pte_addr(new, mfn_to_maddr(mfn));
     dma_set_pte_prot(new,
                      ((flags & IOMMUF_readable) ? DMA_PTE_READ  : 0) |
                      ((flags & IOMMUF_writable) ? DMA_PTE_WRITE : 0));
+    if ( IOMMUF_order(flags) )
+        dma_set_pte_superpage(new);
 
     /* Set the SNP on leaf page table if Snoop Control available */
     if ( iommu_snoop )
@@ -2152,14 +2183,26 @@ static int __must_check cf_check intel_i
 
     *flush_flags |= IOMMU_FLUSHF_added;
     if ( dma_pte_present(old) )
+    {
         *flush_flags |= IOMMU_FLUSHF_modified;
 
+        if ( IOMMUF_order(flags) && !dma_pte_superpage(old) )
+            queue_free_pt(hd, maddr_to_mfn(dma_pte_addr(old)),
+                          IOMMUF_order(flags) / LEVEL_STRIDE);
+    }
+
     return rc;
 }
 
 static int __must_check cf_check intel_iommu_unmap_page(
     struct domain *d, dfn_t dfn, unsigned int order, unsigned int *flush_flags)
 {
+    /*
+     * While really we could unmap at any granularity, for now we assume unmaps
+     * are issued by common code only at the same granularity as maps.
+     */
+    ASSERT((dom_iommu(d)->platform_ops->page_sizes >> order) & PAGE_SIZE_4K);
+
     /* Do nothing if VT-d shares EPT page table */
     if ( iommu_use_hap_pt(d) )
         return 0;
@@ -2515,6 +2558,7 @@ static int __init cf_check vtd_setup(voi
 {
     struct acpi_drhd_unit *drhd;
     struct vtd_iommu *iommu;
+    unsigned int large_sizes = iommu_superpages ? PAGE_SIZE_2M | PAGE_SIZE_1G : 0;
     int ret;
     bool reg_inval_supported = true;
 
@@ -2557,6 +2601,11 @@ static int __init cf_check vtd_setup(voi
                cap_sps_2mb(iommu->cap) ? ", 2MB" : "",
                cap_sps_1gb(iommu->cap) ? ", 1GB" : "");
 
+        if ( !cap_sps_2mb(iommu->cap) )
+            large_sizes &= ~PAGE_SIZE_2M;
+        if ( !cap_sps_1gb(iommu->cap) )
+            large_sizes &= ~PAGE_SIZE_1G;
+
 #ifndef iommu_snoop
         if ( iommu_snoop && !ecap_snp_ctl(iommu->ecap) )
             iommu_snoop = false;
@@ -2628,6 +2677,9 @@ static int __init cf_check vtd_setup(voi
     if ( ret )
         goto error;
 
+    ASSERT(iommu_ops.page_sizes == PAGE_SIZE_4K);
+    iommu_ops.page_sizes |= large_sizes;
+
     register_keyhandler('V', vtd_dump_iommu_info, "dump iommu info", 1);
 
     return 0;
@@ -2960,7 +3012,7 @@ static void vtd_dump_page_table_level(pa
             continue;
 
         address = gpa + offset_level_address(i, level);
-        if ( next_level >= 1 ) 
+        if ( next_level && !dma_pte_superpage(*pte) )
             vtd_dump_page_table_level(dma_pte_addr(*pte), next_level,
                                       address, indent + 1);
         else


