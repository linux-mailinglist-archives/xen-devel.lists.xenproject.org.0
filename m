Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B657416F9D
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 11:53:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.195153.347722 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTht1-0005CJ-2W; Fri, 24 Sep 2021 09:52:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 195153.347722; Fri, 24 Sep 2021 09:52:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTht0-00058d-VU; Fri, 24 Sep 2021 09:52:54 +0000
Received: by outflank-mailman (input) for mailman id 195153;
 Fri, 24 Sep 2021 09:52:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wINm=OO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mTht0-00055r-2l
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 09:52:54 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 15deca61-bb3c-4e11-88ce-c749ce2b69cf;
 Fri, 24 Sep 2021 09:52:53 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2054.outbound.protection.outlook.com [104.47.14.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-28-hP4Sf-beMd-BWGlFNp7Dkw-1; Fri, 24 Sep 2021 11:52:51 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7150.eurprd04.prod.outlook.com (2603:10a6:800:12a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Fri, 24 Sep
 2021 09:52:49 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4544.018; Fri, 24 Sep 2021
 09:52:49 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0041.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4a::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.9 via Frontend Transport; Fri, 24 Sep 2021 09:52:48 +0000
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
X-Inumbo-ID: 15deca61-bb3c-4e11-88ce-c749ce2b69cf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632477172;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uq1n+wvXInUj+R2+IA3D3xi4j2nX4n5cE5fQ+7WfxoE=;
	b=CF+ses7i1RsjwTWWkCthgB3rdZ/r6Afji7fEdkggg0XgN54RNOA0/hPjLfKJCuoK8O5/QF
	juHC6ilWDipVeentkHodEibM6WjkgPOAik5YIb/A6bRBPBth1ckLWs8QfY32YOopyeAYXI
	24yQrpAXjSg6tED98RuQvNnfZnwWJsw=
X-MC-Unique: hP4Sf-beMd-BWGlFNp7Dkw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P6CtNP403gb3t0MQX3b37wqIEKlcmvdbvi38upK8z3RfZzLfF/fVYxTDPuqiAWo+X980a0Noolt7jlIuj7dPGmvlwjqAq2xFlERoYMcr918z9X4wSzf/Dnl6hVBdZqCh3xT1bRgMziFZdwxVTC4Z9A9AOTp46WtY13/Z7xmQ9cMjeLmu13azhE8Dasvn6mWzRq0vDkCoJfIA9JO6ixC9azAR1J/5+bsK0GrEcMnmp6SrgUACTc5yywtyMCXWh6feocB3RodJcWJDpICb4F0TH2kJDAR5Ke9loGjIC4c/b1jlphx4LcxgHM6qqbT2RocUq0kJCoY5he/r2rC8navJ2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=uq1n+wvXInUj+R2+IA3D3xi4j2nX4n5cE5fQ+7WfxoE=;
 b=KJZzLHlBd8kYOJk7b10XLOohyPTGzrFH5bx/dvPiql/gmHeaYK6GNXvsF+hZZ0j6OKhOFybw/YVA2eTufDZHQ+dYXuT7b8YTqk5mCseJqlz6U2KDMoclQghOlOdoZuQx0Rn51IvYyLqypdMD0S7J6SC13WOMRV4JKF6nkbMLZTIfv5s2xT1n+MCmXrgpf/fgkju6Yb4cFfAxR/dHvYOY0FBGcTipg2B2XGU76cW3/uSFaYfwHKZhXwb35KNchQg0727xGH+GHEJ2kE4xpRSmmmyw/pdDCXww37RxLkbLPWlCcBFuLQtKdU/BoA9OAZTaaay9Tp20+TQ079WPRutRjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=suse.com;
Subject: [PATCH v2 13/18] VT-d: allow use of superpage mappings
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Kevin Tian <kevin.tian@intel.com>
References: <957f067b-9fe1-2350-4266-51982f09d3a9@suse.com>
Message-ID: <df4bfaa9-e708-929d-3c2c-68833dcc2d2f@suse.com>
Date: Fri, 24 Sep 2021 11:52:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <957f067b-9fe1-2350-4266-51982f09d3a9@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0041.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::17) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d1f2f27e-083b-460e-d624-08d97f411155
X-MS-TrafficTypeDiagnostic: VI1PR04MB7150:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB715092BE9E27CC454C2F7D13B3A49@VI1PR04MB7150.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lj87Ew5+NFKb/5zRCHsBh2/z0f1+SJh+UTNbTKRM7jTaD1L90zUXFTV1I2ydqY6LEYBUVoltI4uY40+FWPE8VGUR33o+i2bYl424SH4eIgAWl0zFVsOz8rZReoNo1Ww1XYfqshhRWVtxQNDh1mp39pPFHI8J8qfpb/8XOCJ5OxXMt60YfBUbl17zZ7CpGd93IkFRm4BX9+uUKqjPECJtgW/NYDKaJKJqJJPhtVwbAwrI+0MJCmJxY8rod17ZwObDGGNuG+Jt4+g8dJPJJSTuVJHNybvNq1KzGi3J6rRO1p2h1zgAKg8WchN6/88yV/+wLE4+WKL9NIUe6Yk/cVeEtaAjUtYhkHbxv5EBNAC9or0vim7FwQfV/StrVtIWPLHHlT3FMQqbPko6RXzt3OzSx31tLekzBBgAS3TirYLjqW/kZejaJ7wvEdUdZzg01fXQaTYyGdS0ColRvhdQJc2oJp+6rs4mCs3ekmVI98UGZ4s3GyCa2VsOs9+9p5f/yFqyFjPr58i/wEeiP40cFO7TNjzv5CLvWdZqdXoVyCZrQ0D02iWTsXr6CKN2xRp7fUUSkGlcdM7a1HkQEO4eBE/oZe3NgAsLcoxGcGUhi+wsiFCXD6QU3CHfe0Y2ElM8G2tmmkP0MPdssslGG61q3kDfyJY5UNuIl7/N6eBNGd4WPc9HOOk8SMzZMLECzpscxYgZZXhKtJXqnLxFtCk+eG2mlzj8A3NKOOykbiP7e3pfB3c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(186003)(8936002)(5660300002)(2616005)(508600001)(31686004)(956004)(38100700002)(66476007)(66946007)(26005)(8676002)(66556008)(6916009)(2906002)(36756003)(86362001)(6486002)(16576012)(31696002)(83380400001)(4326008)(316002)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Um9JWGtnemJZRndGVXRRelRjcTZPeHhlS0VXY2tTdURjUWN1NkIwT3JhZU4y?=
 =?utf-8?B?QkxLWFF5RnpuZE52bzZSZVlqeERtenhBSGNaNlVHRTBHeHBwckFRdnp3MWVL?=
 =?utf-8?B?WG1PWFlvTXIzWGRRY2NnSzZSSmVZZVB1cEFYYXIwLy9PR3JYeHpXMGNFVlYx?=
 =?utf-8?B?NGxxSldWcG9nY3J4ZGM4WDJtVzYrUmkwN0RZRUUyOCt6TVJLVUZtR2tiVm9O?=
 =?utf-8?B?aEprb2NwV28wMUs3WCtXMjJXVE9DbWJoand1MThOVjVhbzRhN2ZXeTUzNVQr?=
 =?utf-8?B?M0hHNzl5RGN1ZXFiWG50bXBhUG9CQkdMeUZCaVRMV09YdUtrRnptQm1NM0tU?=
 =?utf-8?B?L2E2UjVCS1J5UE5UUWVhb3VyVUMyN3d5Vjh1TVA0cC9IU0pBU0xqWkFMTXR4?=
 =?utf-8?B?Sy9PeHhLbi9rNVZDUVdoc3MxOTVsVXh3ekFvcXZyM3Fuazc5Y2UwMUJDTnJC?=
 =?utf-8?B?VGZSTHJick80eitIUzEvWWJFZjc0bllrTzdBcHBwNHRlN25MMFBjalNzemJs?=
 =?utf-8?B?Tm9wT2syRWZRY3FxY1p6bXpzZTJrVUVTOUJ3OThSVnVHdlY2QXN6ZjJCV0Qv?=
 =?utf-8?B?Zm4wMmJmdjU4UEZPWmF4OXJpenFzaHZLalZVNW42TDM4K3M4RTkwaUZUb0pr?=
 =?utf-8?B?aEdkUm9Gei9GMERwbkMyaHJjYU1mMGh5Y2twaHQycmJJcjRhTTdYNEZWZ3VE?=
 =?utf-8?B?QThTR2dzdEVnSWJXTWhNWTdMK0JUeHUvMzRvbUY2TlViQzViMVEydXpDbGhq?=
 =?utf-8?B?ek5PR2J2ZWg2czhUeWlVSHFrTlA3RDR6aUlwMmVsUHlOQWd2bzFBTkxoRW5F?=
 =?utf-8?B?QnFiQmlLaEpxUW5vaURFUkJGTUl5eUVoNVJIV2VidHhtVlJUNTl3ZFNUUm5t?=
 =?utf-8?B?TlBmUWcyMUZUYS9oQ2UvNStBVGdEVjZBWTBrVmcxL2VreXh2WE9CWnJ5Y1JS?=
 =?utf-8?B?ZGhJOVRxdCtlWmMwY0MydXEyZlZjMGpOZFdzVDIxMktHRUtEdnN3SXRtVDRx?=
 =?utf-8?B?cDBXTVNEQlpjQmF5OVlOdnBjKzFZS01tVllsRnB3TlFtTEJBQmh0SmNldXoy?=
 =?utf-8?B?bmRvRWxRRlgwNkxkUFl2UGI3OENLYVJ6MkxuNkVYT2QvUkYrV2JMV1B4aElV?=
 =?utf-8?B?SkdNVzRicFF3TkRKV2h2WXMzWWQ0VENsNXZMUUgxNGUyNHFWK244RUJGK0dv?=
 =?utf-8?B?RG9JYkxPeW5pazB0V05wczFRQjJ0Wk52YkdxN0xZeXBiMG1wSlV4d0dMc0R4?=
 =?utf-8?B?Y0tRNWlXY2N3MXRCekx1QTB2ajlYT0NDQ3ZpeFNTczd2dkZzdFZpME9VakV6?=
 =?utf-8?B?dWR1WGNYMll6WlhiYnlpbHdQRTIrL0E0M054U3orUmJpTmcyMUJqcmcrb0Rk?=
 =?utf-8?B?L0hQcU9KdjNxTFNYSlVmYnpRWnFMMktRdnJiaWF5STY0RnQyRDZjUEQrdTJo?=
 =?utf-8?B?eFJJOUtEaGh5RXB1UzdnOWdBMXVGdFp5R1Z6RVZvZHlIZHJpbFpVMVo1RFZE?=
 =?utf-8?B?NUdZcVVlSi9BYXZUU0thZm9Wek14L2tTQnhkUW8vNFZKaVY4MGd1UGxWbDEr?=
 =?utf-8?B?VFhBTSs4YUk5UFFHRTlQZXRkZWh0V0tkL2tNdEdoVVpBTDVJRVlUaHV5RzFM?=
 =?utf-8?B?ZjdEVytkT2NpWjZlbUtYQ3IvNzNKTUtmTmk2YmFzZjNkS0prUDREd2tGZmRo?=
 =?utf-8?B?cHVBK04vKzV4VWFLOGM4QkwvWGgyYUVxRkJVYWlmeitvZWRZNXRzRTgrUzlq?=
 =?utf-8?Q?jYDRTBy/Ue4rrmhLquAKL8DRe9pJOJWWfLDg0n5?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1f2f27e-083b-460e-d624-08d97f411155
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2021 09:52:49.1245
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rwXwJ/lgjokpY4GE2GUligQaF6vc3OtxUQ7NJujFQPkEaam4oFoouUWzbwk4qUyUfz9EZ16e80Zn0NR7FpMEbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7150

... depending on feature availability (and absence of quirks).

Also make the page table dumping function aware of superpages.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -743,18 +743,37 @@ static int __must_check iommu_flush_iotl
     return iommu_flush_iotlb(d, INVALID_DFN, 0, 0);
 }
 
+static void queue_free_pt(struct domain *d, mfn_t mfn, unsigned int next_level)
+{
+    if ( next_level > 1 )
+    {
+        struct dma_pte *pt = map_domain_page(mfn);
+        unsigned int i;
+
+        for ( i = 0; i < PTE_NUM; ++i )
+            if ( dma_pte_present(pt[i]) && !dma_pte_superpage(pt[i]) )
+                queue_free_pt(d, maddr_to_mfn(dma_pte_addr(pt[i])),
+                              next_level - 1);
+
+        unmap_domain_page(pt);
+    }
+
+    iommu_queue_free_pgtable(d, mfn_to_page(mfn));
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
@@ -762,7 +781,7 @@ static int dma_pte_clear_one(struct doma
     }
 
     page = (struct dma_pte *)map_vtd_domain_page(pg_maddr);
-    pte = page + address_level_offset(addr, 1);
+    pte = &page[address_level_offset(addr, level)];
 
     if ( !dma_pte_present(*pte) )
     {
@@ -771,14 +790,19 @@ static int dma_pte_clear_one(struct doma
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
+    if ( level > 1 && !dma_pte_superpage(old) )
+        queue_free_pt(domain, maddr_to_mfn(dma_pte_addr(old)), level - 1);
+
     return 0;
 }
 
@@ -1868,6 +1892,7 @@ static int __must_check intel_iommu_map_
     struct domain_iommu *hd = dom_iommu(d);
     struct dma_pte *page, *pte, old, new = {};
     u64 pg_maddr;
+    unsigned int level = (IOMMUF_order(flags) / LEVEL_STRIDE) + 1;
     int rc = 0;
 
     /* Do nothing if VT-d shares EPT page table */
@@ -1892,7 +1917,7 @@ static int __must_check intel_iommu_map_
         return 0;
     }
 
-    pg_maddr = addr_to_dma_page_maddr(d, dfn_to_daddr(dfn), 1, flush_flags,
+    pg_maddr = addr_to_dma_page_maddr(d, dfn_to_daddr(dfn), level, flush_flags,
                                       true);
     if ( pg_maddr < PAGE_SIZE )
     {
@@ -1901,13 +1926,15 @@ static int __must_check intel_iommu_map_
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
@@ -1928,8 +1955,13 @@ static int __must_check intel_iommu_map_
 
     *flush_flags |= IOMMU_FLUSHF_added;
     if ( dma_pte_present(old) )
+    {
         *flush_flags |= IOMMU_FLUSHF_modified;
 
+        if ( level > 1 && !dma_pte_superpage(old) )
+            queue_free_pt(d, maddr_to_mfn(dma_pte_addr(old)), level - 1);
+    }
+
     return rc;
 }
 
@@ -2286,6 +2318,7 @@ static int __init vtd_setup(void)
 {
     struct acpi_drhd_unit *drhd;
     struct vtd_iommu *iommu;
+    unsigned int large_sizes = PAGE_SIZE_2M | PAGE_SIZE_1G;
     int ret;
     bool reg_inval_supported = true;
 
@@ -2328,6 +2361,11 @@ static int __init vtd_setup(void)
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
@@ -2399,6 +2437,9 @@ static int __init vtd_setup(void)
     if ( ret )
         goto error;
 
+    ASSERT(iommu_ops.page_sizes & PAGE_SIZE_4K);
+    iommu_ops.page_sizes |= large_sizes;
+
     register_keyhandler('V', vtd_dump_iommu_info, "dump iommu info", 1);
 
     return 0;
@@ -2712,7 +2753,7 @@ static void vtd_dump_page_table_level(pa
             continue;
 
         address = gpa + offset_level_address(i, level);
-        if ( next_level >= 1 ) 
+        if ( next_level && !dma_pte_superpage(*pte) )
             vtd_dump_page_table_level(dma_pte_addr(*pte), next_level,
                                       address, indent + 1);
         else


