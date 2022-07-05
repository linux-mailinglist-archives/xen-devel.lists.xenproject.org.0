Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3BDC566E9F
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jul 2022 14:48:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.361164.590544 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8hyS-0005x5-K4; Tue, 05 Jul 2022 12:48:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 361164.590544; Tue, 05 Jul 2022 12:48:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8hyS-0005td-FQ; Tue, 05 Jul 2022 12:48:16 +0000
Received: by outflank-mailman (input) for mailman id 361164;
 Tue, 05 Jul 2022 12:48:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IaUl=XK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o8hwr-0002H7-4s
 for xen-devel@lists.xenproject.org; Tue, 05 Jul 2022 12:46:37 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2052.outbound.protection.outlook.com [40.107.104.52])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 818efadb-fc60-11ec-a8e4-439420d8e422;
 Tue, 05 Jul 2022 14:46:36 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB6065.eurprd04.prod.outlook.com (2603:10a6:208:139::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.21; Tue, 5 Jul
 2022 12:46:34 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5395.021; Tue, 5 Jul 2022
 12:46:34 +0000
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
X-Inumbo-ID: 818efadb-fc60-11ec-a8e4-439420d8e422
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iwLfJM6XjWiHI5Mb/VNr/+4IM6o8NlBY4BuKhUpLzjtKn7RtTTCCYb8hUoZgf2HypT3ymJdEZlKnYhVVSJhHNboLKpS87kJtV0SxKgHrDRP7eupEDQlIXtgrZ4eXSowj5yt3YDHmkbMcQB2nL+kfiWLaM8zJM4hjf7Ee5U/2DFKKFc6aV0AQOyilUhAtQ6t6ko0vVJ4M9V/+8pFp/fy4dVN5P6VV+nmHFvgV3bBvNQSPErYAwSAlMXTHgOOOnRTCU6nuetmE0v7tPs2BLD/tfe/Tyn1BW1t1roCACz8nHAagyZFxAle9E6erA2K9ZnvjBEZbn63LZPOyq0MhtRlzOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r9TbBkHolhWw357aMMMhJeh7vv8iPQuKs2+KWYhw3tU=;
 b=Jhy7PtBpO4/IbzKKwebjPIIvYBWG0jMo6k6/pyVrzJzknog1PRZZQwK1rIeVwfuiTsEAUtF70k9WYVLSl+lqYmf3n44zQtVzbUj8mN+DFGQlnlE99atepZZ/8KnQOWHY6zTkzGZ/SXvrVYxotknfK2Qc5DH7NiyFHYHvIcwoksdDqaWRSKYNfh3ZyYx6lkSIM5HaV8QOf1KhSWxnEGrqJJe3bZKOSJLW+dh6zD7g7ss8BbGDYvgNTDMqx0nZ1yyvMU5CpeAZnQ462+dWO7RCNZeUu+ewR9Dg9k9MZuKu4KyfCF5m8MuvLvrC4z3p9XORL84Nf/mDGzuanDu36Tejxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r9TbBkHolhWw357aMMMhJeh7vv8iPQuKs2+KWYhw3tU=;
 b=30F6K3uBwjJUuRu93fYxfi9eZ4lzhQOWT2Ss5hs/0HkMrssJjpLLrdYjkaFSuoLqaS4TSvSoRhoLhM1HstUmZTASaf9IbcZxiqK8jJ78J6xjYnwrp7dCeVn4EgLQ0zsdOFLDbo8piuOt3sg0a5IME7cwyseZmK93E5NV8cuHJiRMnaAyzdeXFy+1OrnAiTrHP7fB5Ow1lzc74P1yd7VI6D3Sfpb5f55JF55oNp8hcG+UKhSLnyzVyWeSJUAokgo8yP5bqWLnDU5wgkYzhAiGkjHDwZcfwUV8Iy+hHIbmjT9NMQruEGczC0XYFfZU09KPxRehir8KJ/bxIDNCEl9lmg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <629e7e8a-b846-14cd-08eb-75433c8c3369@suse.com>
Date: Tue, 5 Jul 2022 14:46:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: [PATCH v7 06/14] VT-d: allow use of superpage mappings
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <4c9d4b32-d4db-3a4f-fe92-6022e63c3f82@suse.com>
In-Reply-To: <4c9d4b32-d4db-3a4f-fe92-6022e63c3f82@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0087.eurprd06.prod.outlook.com
 (2603:10a6:20b:464::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e0d20481-ace4-43af-cb40-08da5e8464ce
X-MS-TrafficTypeDiagnostic: AM0PR04MB6065:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UVnmM27Nhwn7EPjuVI9rcbxI5SVaANOlv6d5HbDhFucy07l/duo3635renKb810yapyrLuuJXAhllUGD+WqEqOmnI+n/jUsQFc3FkyS4hfdMYSaAWfVhYtefF4IkBEXFqOQv7o/3EtjJYOOhFN5BQXUpXB2y8zIxkasGTi8jaL/qU/jhBt3AmAHRv4M3zKpP6TdvCQyFAk3AC+FdtjT9KGD62D9XA+jdHt+H7HzmzWsBSVMnw3KXaCybUsy7oqAm4ma3CAYjWHZcnOYIGBMkb6wYwualo0g50wGy/LpoF2H8qM7QNdnf969jrVgY56h3JONdF3V941MXfxZbCyJeurVlo3hBghfUC9xi3RTeoRHNmdVMj+k61QIa01EDMRjP4HsOiaKYNLjRXrBajvI4xKiTILmoDHFx2ibCB8LO+8d9k9kS9AcB7uIIsO0nBtS352jneJIqQO66bd7e1pAyMGifhidRVm7/r2CD56rwN7KwNG2m/9BXqkHaDRk+VAfVvmHsuBDlIwlzWVfXNDOfkRbaV2smjcuaDxQvxNErG8E5zxBNiart1MbbLjQKrlC0rPj62zmzW2e9AsnSCg3HUqyjis+/43sIZbhbv0LnX+yyra3nqUtirOLznWHtz81BKjcEAecpjbbFjw/X76z0x14eN8CF+XAybSAEI9RrWbKjBNwAAWbCq7Ti26ISqf+hyjr0Wygcg5X3xxt3iKRGhqI9uMly2O6U6L8UHdDbWFFdjYsE0KCbENO5HTGOqm37YzWdd6oMJXGuetmT9eEYGFk1C85gRutx5p0SRZNp2JtVoL0EbxmABlKfyTo4TzXhHWdiemAKalT/k4c6dvFTdukqjSEWeJPunfMzXQ/WgEc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(136003)(376002)(39860400002)(346002)(366004)(83380400001)(31686004)(6506007)(36756003)(6486002)(478600001)(26005)(186003)(2616005)(6512007)(41300700001)(2906002)(31696002)(86362001)(54906003)(6916009)(4326008)(316002)(38100700002)(66476007)(66556008)(66946007)(8676002)(5660300002)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OEQ0L0JTV3o5ZnRSeXppMlo0ejlXNlZlR09SdHFnVTVOdEdKcGFpOGdzaktE?=
 =?utf-8?B?N25SdXNlTTZ5T3pjU3pSTUFwdVZSOFQzeHlOclFjNzRvNXcrM3lhSGJoLzJ2?=
 =?utf-8?B?Y204OVEwRkVrK0lFbkpNbXNuZ3ZKcnhXRnQwdCtaR1RRTmxDVDY5UHdLY20v?=
 =?utf-8?B?Q2h4cDAyL2FncTdmeDVMQTF4cE1aelhxZDBlN3VJR2RNKytSMzk4eHBNcTh2?=
 =?utf-8?B?L3ZlM1ZXVU8yRnpYTTBQZms2T2lkMWZjdFpRZkJpQzQzcjNxNkd2Vzd0aUFr?=
 =?utf-8?B?ZUdEdWRZRE5qeWVNZVlUT2xiaTRrRG5jYzJpR1pHOTdYM1ZieHFrdllHWXM4?=
 =?utf-8?B?aTNld04xZzdHTHJ5WkV6M2ViQ1ZrSjNJa0lQMTc2RDB4Z3FZY3plWFA0SHRJ?=
 =?utf-8?B?UlJnN0s4V2ZrUTRNbjhiamhPTVkzTStBWjFFM0Jxd1kza0dRY1h6MXFSczJ3?=
 =?utf-8?B?dWlwaVViMFBmOVlHS1NRcmE1azh3M3phK1p5SEtxRzJKTjF0UnUwVE9tdlFO?=
 =?utf-8?B?cHgvUDRrWmFaakhhT09PRUdyR2RBdXg3YlFKTFI5ekNGZXNXVkwzQzV2Uzg4?=
 =?utf-8?B?YVJueDZkc0QyM0RWVkFqRE9oTTZ6MFR3Unl0Z2JnSmV4OTdVU1psZW8weDVu?=
 =?utf-8?B?R0NGRmJoY1hXcHVYTlFpNGtMNUxnWmt1TEl5dFRaUlVWWEtNdWYwR2s2dFFM?=
 =?utf-8?B?cWkrbktGanF5WEVDaXR3VUloNmdkcG5YU1Y1UDFqWGh3dEN2YkhVUEg5dWRE?=
 =?utf-8?B?YW5JbG00UGk0azNFeUx2TUNOUTlqWlNHcHhLQkI0RVJxY1p1VWYxQVBZQjFR?=
 =?utf-8?B?blREbXp6YmwxU2pscUlkZzgwd2VzaU5tbjZFTjFiNTIvaTBBZHh1RGY5Y0Fj?=
 =?utf-8?B?WVBrcDNTZngwZCtvbDlMMXd1MHBOcUVralRBT2RJYTI1dis2V2xkMHQyZDVy?=
 =?utf-8?B?ampZYWo4S1JnNkVDQkRiRUFMTzh4ajhKN0NNeDltaVRQdS9LUThmN2hiUHh3?=
 =?utf-8?B?QmtyK0RZUVhLWHRQdDloMUtMYS90ajhCbURNMmV3TE91Q0dFRU1oYUR4Q1hz?=
 =?utf-8?B?dWFJbXZwMWc2aFpycElaT1FpTkJueldJTC9pRHlMbGx3R09qZFN6YzBZcW85?=
 =?utf-8?B?RGg3NEZYRXc3elVhWnFsTm1DZUZHbUMweVM2WmIwYm1MbzlpNnVKUCs4bjVM?=
 =?utf-8?B?WFdUeTYzYmJ5TUxDV1V5VEpNWUxDM0s5eWdmUGtlQVlJVmZCVlZaaEdxd25m?=
 =?utf-8?B?bnBieHpFbEpObXc0Rm1Qc2RzVHZzc3VDR0pEdm5CL1FzQlJ2N0hKd3g4bmFm?=
 =?utf-8?B?aVQ5T0duSFVMalIwQ3FpUHdaL0FyRFl3Vm1tM1BSYlFtRHZ3aVBaMThBYmIz?=
 =?utf-8?B?MStIL2h1aDJOTGdFSStXRzFNR2NYUmw3b0JjNi9tM1pHWDNIa1BLVStOanJv?=
 =?utf-8?B?TVYzYSt6T3FBRkd5UzVnVGVPR2I4MlBCLzdEbmhTUDZVZDN3d3FWdjN4c1Nr?=
 =?utf-8?B?NTJmWnVzOVA2TjdVZ0JWVUROOUxFbXNrRVZpS0VwUDFROUZybjRld1hUNGZl?=
 =?utf-8?B?YjF4YXFJMjJoRlBQNkEyZ1pnMDJLYnR0VVpsSEl0aDZQc0pPcGlDb2llS3F1?=
 =?utf-8?B?N3lhNWdtdmpHLzNwRS96S2p1QlorWGJpd1BwQTFldVBXR0NBQzBudWdsakR1?=
 =?utf-8?B?UnBwTXVYNFMxa3hVMEtoclFzUEVzVXgwSmZRRy9jYW81SEJHY3hQekFKdXl1?=
 =?utf-8?B?Q1k2UTlXdllIc1FDWkszYUVaMWZ2YlZPcTkxdko0eEErWVBBSm5SbVhIWEdG?=
 =?utf-8?B?NVEvYUhwaHpUNU1jNW5aYzJndFY2WUZWZlozcmtrbzN2Rks3Z295dDA3OElV?=
 =?utf-8?B?emtUM2F3REJ0N280ZFdjcWFOSlRnaG1GczNOK20rQTZJcDVBd0owSnBXRGxY?=
 =?utf-8?B?dEx1UWZQQzk3dFRodWxZdlZEYnhpMXQvdm1nejA4eCtaNzJtUkRneTg5Sk52?=
 =?utf-8?B?UkJXMFI1TEZ6aHUxSXlvd2p5eVZwT0NtWHk3NEZPQXZHcXRtVWZvSDJmWG1l?=
 =?utf-8?B?SkRrMWVZUVZGeG9sSGJoK3FMaEVudHc1aWgvaWtScUgvVzRMVytkWUtZMG1T?=
 =?utf-8?Q?sQcNZKWlgKwcH4AjwG+UFBk5s?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0d20481-ace4-43af-cb40-08da5e8464ce
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2022 12:46:34.8189
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pyEXXP1xKVZZJ3W7dFCoixVirL0irMd9YCEB6KbF1N/3OnMYREpnlRv50q22D1mF7UkuDl6UF/ucAJS9xgdY5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6065

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
@@ -2516,6 +2559,7 @@ static int __init cf_check vtd_setup(voi
 {
     struct acpi_drhd_unit *drhd;
     struct vtd_iommu *iommu;
+    unsigned int large_sizes = iommu_superpages ? PAGE_SIZE_2M | PAGE_SIZE_1G : 0;
     int ret;
     bool reg_inval_supported = true;
 
@@ -2558,6 +2602,11 @@ static int __init cf_check vtd_setup(voi
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
@@ -2629,6 +2678,9 @@ static int __init cf_check vtd_setup(voi
     if ( ret )
         goto error;
 
+    ASSERT(iommu_ops.page_sizes == PAGE_SIZE_4K);
+    iommu_ops.page_sizes |= large_sizes;
+
     register_keyhandler('V', vtd_dump_iommu_info, "dump iommu info", 1);
 
     return 0;
@@ -2961,7 +3013,7 @@ static void vtd_dump_page_table_level(pa
             continue;
 
         address = gpa + offset_level_address(i, level);
-        if ( next_level >= 1 ) 
+        if ( next_level && !dma_pte_superpage(*pte) )
             vtd_dump_page_table_level(dma_pte_addr(*pte), next_level,
                                       address, indent + 1);
         else


