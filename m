Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FECE50DB81
	for <lists+xen-devel@lfdr.de>; Mon, 25 Apr 2022 10:45:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.312600.529931 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1niuLK-0008Di-U6; Mon, 25 Apr 2022 08:45:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 312600.529931; Mon, 25 Apr 2022 08:45:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1niuLK-0008BX-Qt; Mon, 25 Apr 2022 08:45:14 +0000
Received: by outflank-mailman (input) for mailman id 312600;
 Mon, 25 Apr 2022 08:45:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OfhB=VD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1niuLJ-0007xd-DJ
 for xen-devel@lists.xenproject.org; Mon, 25 Apr 2022 08:45:13 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 04f4af2b-c474-11ec-8fc2-03012f2f19d4;
 Mon, 25 Apr 2022 10:45:12 +0200 (CEST)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2057.outbound.protection.outlook.com [104.47.12.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-30-883xrxsdMsqnka3G6lzhlA-1; Mon, 25 Apr 2022 10:45:11 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM6PR0402MB3589.eurprd04.prod.outlook.com (2603:10a6:209:3::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21; Mon, 25 Apr
 2022 08:45:09 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%9]) with mapi id 15.20.5186.021; Mon, 25 Apr 2022
 08:45:09 +0000
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
X-Inumbo-ID: 04f4af2b-c474-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650876312;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jXroAWCzWdcYKf4JkOt1e3tm2yhGlKfIfFmJbhMkY+A=;
	b=kr7KnmwIPS0SFGtkzRGxOcuaquHDQMxy0Lrudl11hcm1TcEjrmkizs8kXqIRGIHSTPJqhf
	8V4g1WhjsU1gx1tiHB5psTZX9/meI+KkktqWQifKM5PWTX5hsTbt/PnscP/MDj3yBQF3jT
	FlCyG0Y5RJ5bDFy500i5oxW+nCRGKXg=
X-MC-Unique: 883xrxsdMsqnka3G6lzhlA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HInOMlI4Bg+9oFbVpgietINA1BzkEzKrxHWbmndiaqi9B2OYq9MmpV9uHvIn5vMOiZ/s4hFehxZ/hKgpgilB2YXr85ajz9FaL5dHYcbti/5Mtwhe2jv0HObKRK1kkasPcqcu9NmZgM/PSBb3y6NdeDNDkMK5Olu02U/iCX4W+XzOsstZvCyDtHdGIJSAU2SgRdvrXXusN+zqLW/5SLvjX55+bFVdiukUqeEonmFAAA8wiS3onyomkvSWqwBAKrrB0O3svKrdUS1llNOoAQUJNC/iO2cDHBT89XPjxp3AqaulG1uMnr+2pCsVvCy7W0tGbm/Ons5m0Pbx8lMSiVK3cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jXroAWCzWdcYKf4JkOt1e3tm2yhGlKfIfFmJbhMkY+A=;
 b=UJmktIb5WKgJhWQl2o7vw3K/tgnDvU/9G/Rm3SnqXQCiSIRtaNcuYU11TtrmNCoWACN7o8F+QOl5FpEE5nKqDa8hJks1V6n01PiUuxx+rcDoG0TX6GxakFG3DcWrMykV84mArem5Nb0MOrl/1qk00ttzwdD0Cwf8vtecea7VLpxGsYZs98EULABok0++/L5TW7dP85vexLSJVFdKu4vjr/bMrHo+05soCwwLlwceVzyOAHuXdDunsv0gS8HPoXx6wXkOv8IKtoPK4x8NZJrZM8YU7g3VTyd5ETVqDUVniiTrqeAoBBwme9WbmOm83IiTIWT4mses2pRL+JkDF2xu4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4a24a85e-267f-9de5-4009-b32b9ab8aa0d@suse.com>
Date: Mon, 25 Apr 2022 10:45:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: [PATCH v4 21/21] VT-d: fold dma_pte_clear_one() into its only caller
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>
References: <b92e294e-7277-d977-bb96-7c28d60000c6@suse.com>
In-Reply-To: <b92e294e-7277-d977-bb96-7c28d60000c6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P194CA0064.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:84::41) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: abf36fe3-1522-4f9d-a676-08da2697e768
X-MS-TrafficTypeDiagnostic: AM6PR0402MB3589:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR0402MB3589F6FEEE54DBF4E0084686B3F89@AM6PR0402MB3589.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yPzY50RVEYMGVEFRJHYq9HhHq4nVfj0OeqWX5vARnB16yOCSpV6ggN25iBkI8FrV8bzRAVbeYign74vdpzDp3lcVf1VIS4tY7c+uBQmKp89oy89E8guMr0AXZ5rEwLax1L6ACdVA2uTeHOU3x15ZhGyeVRtO7DhYMXIVFeNf/vus7iUbsQSxXMOzkAwFTMMag5qdriUpRG5riTzS6F/1KE0ZV6E3mRFDrAGG6wxtjQ/KEkNwCycV/ncYcivEyFv/7mEsgC0mD6hWQNV9fTd6ZU0UHQGArnxgO4NIQiY8g37w7WoTX/JDe7ozL0gGHzb0tx9JaB5+Tf8t/JYqqjsVVdbseFFpFCUHXCekUR6DgyOfC5rwsl0F9gj/ifzLEjEntzilbNQAUhSoBDhzTDXEdHbxfNPT1eyOefJliQshLxEFCkQYIxcCKq1rVroKCJsHgLsLfJW4A2xx19bElrlD5L4Xb0WZ4ebJ3u3YanwhZq03B5ZUetM7Pq1su/12/hJbzYkOD/X2+RCJJ0WCeaEBzCVTacOVTwsxkZJWU18ZhA0hvxHrOQgmHA5Dqwc75/8NvE1OWIYLP6r9omoJ7MqDwpThlp1RCHIZbH1J5pQCHawW05iiGVAm++R0g7GUqQPxJsUJrwSP/15z3i05Qi18TE+NO/+yRh3Kd0wpURWpO7ARYt58F6PBz8HH8WeX8j0ZldUwc1IQ0YtpYM5IS+MJwAtVHh+pf+zoIPnDIFytukQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(86362001)(54906003)(6486002)(5660300002)(508600001)(8936002)(2906002)(31686004)(83380400001)(2616005)(186003)(8676002)(4326008)(66946007)(66476007)(66556008)(26005)(6512007)(6506007)(6666004)(316002)(6916009)(31696002)(38100700002)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZGt4ZlgvSEU4Mjc3NlZ6TVliT284eXEzWUdBU1RyZUJULys3di9sZE5seEFF?=
 =?utf-8?B?UllnZUgzYWEweTVGd2hQTlVPSVBSMjZzSWRWM0x0ZSt5UUhBajRIWjlVLzl6?=
 =?utf-8?B?YlRiaUt5NkM4bDQrWEJoN3JxVkdENHJOd25pZ3NlMG1rWXNQNyt1Ym5QcVdx?=
 =?utf-8?B?Ty9BZVdlNGowanRtd3hnZm9laGUwVTd2dXN6bjErNEpGNzFyWmdlUVRBdGRr?=
 =?utf-8?B?SmFJd0dNTm8rN01YNkFYcWViUUZYamY0WldDaW9jWlhMV1hBUVAyY0hORWZN?=
 =?utf-8?B?Vnd1amRPYUdMb3hldlZBWGVuV0pVTkVaeVZsUFNCSFUwVForaGp5SkZXN3Yx?=
 =?utf-8?B?czRJZU0vVnlMMU9MSmdmZHVzOXZPR2hicVp0alRWQVBuUWluZUtxSHlkMmg0?=
 =?utf-8?B?UTJWQThNc1NGelBtdDRGMndON3BYcHErSmNrbEhabmRMZGlKMnljMGRRMlQ5?=
 =?utf-8?B?Rk0wUlRMemZxVklmUVhlOVFFZW42N2VVZ1dQZkN5UFZiRXFKc29SRUhUK0ha?=
 =?utf-8?B?NUdNMytTWHRHRzZIS0Z2QTRRa1VTNFZGdThGSDZ1eUZEdXZnWDNTSG9qVlBl?=
 =?utf-8?B?THZtMm9UMnR0VzEvMW1udjdIZDVnbURKQXMvOUdSRHRjWDZocUppT0MrSmlm?=
 =?utf-8?B?S2EyLzh4bGlFOEk1RlR2anoxSjRncGNDV2RPcmd2MjJEbVByY3liRENPejlp?=
 =?utf-8?B?cTJGdlVUbHVpam81OHkyQ2g5YmZLeEZKQkJuZjFObWJGMHhLN21vMkl1Z3dN?=
 =?utf-8?B?WVczYWtSWEdZMHZnMG5lbm5qcHFocXY0UUFuaDh5Y1dlVFJuWGZMWlVNWU5F?=
 =?utf-8?B?RnAwSXVBZVEwaXViZ0ZOZWg4MTF3dmVBaVNoSDdtT0U1bXlFM0d6V2NadG96?=
 =?utf-8?B?S3c5RWI1SiswOFpJUVNnZWJWd0ZJK3pIR0QxKzNxa2NyT2xHVE1QUURpMVlD?=
 =?utf-8?B?VFREMko1OHJNWk1QbDhjZjd4VmorZVh2NGhQNnRERjB5T0FxcTE0bHhlRWkv?=
 =?utf-8?B?WkQ5aG9RZytmekZBcGk3M3ZrOENKSXZXaitnRmJhMHNXUVpyUERhMXJSVHNh?=
 =?utf-8?B?K1NpYlZOcUVWdHJlak5nYkttbEw1VVJBZVV3WmlQL1VzUmtHT0kvbDhManVz?=
 =?utf-8?B?dU9qcW4wS1hqWGgzeHFWTUt2UndTQS9uTHRubE1vaHRpSlpGclRBc1ptQ1RN?=
 =?utf-8?B?eEVaaGhueUl6bHV5ZXJnbllPU29lSmMycHVicGllV2RKWi9TYTR2ZjErVnNm?=
 =?utf-8?B?bk85VWVydzFBUk5LaHpIUGp3SXN1bWVKMkpiZXNkS3dnRVNLRXBRdHk2ZGJZ?=
 =?utf-8?B?K2tUNi92QUZ1SFRGYy9ZNzdxTTYvZEVaMktxNW4vZGNZUmFSVndScWIvUWNj?=
 =?utf-8?B?Z0JZREI4eGpmOHlBZE1pc01XTVBpSGdyUm5BdmtIY3VIVURiR0gxMGE2ZmxO?=
 =?utf-8?B?QjBlYTdxYksyMXBuc0FBb3BtdHF2UW1KZkpKVDlkQUwvUkorR2wzRjhsR0FX?=
 =?utf-8?B?Z05iT2JkTHVaemtrdVRDNjJrdU9LaGVzVHRtVHJLMWxRbEVjNEE0Q0lZMlIx?=
 =?utf-8?B?OTZZRnlIc0JlSERmMWlTWGNMd1lxRlQyNTJndVpWS00vcXZIRU9vY0dNRjl1?=
 =?utf-8?B?MUMzYlhnWkVZSVNBbkUramkxYWVGSkVpdG5CanQ2REdLUXdvSVBPREdJZ0pH?=
 =?utf-8?B?K1lLd2NBSDB2L0Fic1YwZGgwQXNCRk8xdThmT3pqSHJ5aTduc0VJZWNzUjJM?=
 =?utf-8?B?LzEvM0VxSmdsZTB1c1BObHdmV1dsU1R1UkI2ZDI3dUJvQ2RZRmI2c3JJU0J4?=
 =?utf-8?B?M3dIbTcrRDNnUUJ3cE51ZVlSR0pVbUtBTE05bHlrTjRPNWhnQno5WFNpOTJt?=
 =?utf-8?B?dHBxRmF3Ynd1ZUswWUIrWXdxY0hxSGFNNUZlb1dyODRmUW8za1k4ZkFUcTBR?=
 =?utf-8?B?TG1ESFBWZGFhRlIyMk43cFN6OGd4RW54TnVVRmpzdFFmamw0R1AxWlYxZEpX?=
 =?utf-8?B?UGhReXFqeC9WZHVYZlNZS3IyZERzSnpnMUhKN2FJRjc4UTNNbXZYV1AxV3hR?=
 =?utf-8?B?UmRPL3ZQVmdxZDBIMTNBYXJ6U1U0bGREcDE5U1orQkN6UnRORWFveXNBb3ow?=
 =?utf-8?B?SEwzWGdtQVI3WkdXemYwMmlka3QxcGY1TWxDb05WaDBjUy9TMUFSTS9XQVly?=
 =?utf-8?B?c3JpYTZQU2ovTGJac2ZZc0cxUXdNQXJMd3YvSzZBRzRXSW5NU0pEZjhoSHJo?=
 =?utf-8?B?clRUdjhnQjZuUzRaYlFQMFl4UXNQWUdjT3hDNXUxYjdjbkMwTHVuTFFUdW55?=
 =?utf-8?B?cnJjbGZ6UzBTUkw0dE5aQS9yMjlSakVzT3pJV29hY1Z2ZTRDM1d0QT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abf36fe3-1522-4f9d-a676-08da2697e768
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2022 08:45:09.1596
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WTxGIlSfltNLOmE5j3Ebd+5bNFOtLGcC3NzX3aoayucvjIQmLH6Rw/FcV2ERoBJekHWtd19Yw2TBvDOyCxM1/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0402MB3589

This way intel_iommu_unmap_page() ends up quite a bit more similar to
intel_iommu_map_page().

No functional change intended.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
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
@@ -2261,6 +2192,12 @@ static int __must_check cf_check intel_i
 static int __must_check cf_check intel_iommu_unmap_page(
     struct domain *d, dfn_t dfn, unsigned int order, unsigned int *flush_flags)
 {
+    struct domain_iommu *hd = dom_iommu(d);
+    daddr_t addr = dfn_to_daddr(dfn);
+    struct dma_pte *page = NULL, *pte = NULL, old;
+    uint64_t pg_maddr;
+    unsigned int level = (order / LEVEL_STRIDE) + 1;
+
     /* Do nothing if VT-d shares EPT page table */
     if ( iommu_use_hap_pt(d) )
         return 0;
@@ -2269,7 +2206,62 @@ static int __must_check cf_check intel_i
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


