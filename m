Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23871416F65
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 11:45:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.195092.347601 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mThlK-0005wZ-83; Fri, 24 Sep 2021 09:44:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 195092.347601; Fri, 24 Sep 2021 09:44:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mThlK-0005um-4d; Fri, 24 Sep 2021 09:44:58 +0000
Received: by outflank-mailman (input) for mailman id 195092;
 Fri, 24 Sep 2021 09:44:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wINm=OO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mThlJ-0005ug-8h
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 09:44:57 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 12c6fd84-1d1c-11ec-bab9-12813bfff9fa;
 Fri, 24 Sep 2021 09:44:56 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2050.outbound.protection.outlook.com [104.47.0.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-19-AJt0MlORMzeDdOz-RyxTTA-1; Fri, 24 Sep 2021 11:44:53 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5328.eurprd04.prod.outlook.com (2603:10a6:803:59::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.18; Fri, 24 Sep
 2021 09:44:51 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4544.018; Fri, 24 Sep 2021
 09:44:51 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0164.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1b::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.15 via Frontend Transport; Fri, 24 Sep 2021 09:44:50 +0000
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
X-Inumbo-ID: 12c6fd84-1d1c-11ec-bab9-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632476695;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ShVz0SZZ0jMQznxGF5xuq3Xcm5rK5MB8JC2kaB72Tbs=;
	b=Pbt1RcKdYzEPmDfqpXKoix1uDc6BKtWOl9En0GiXK9+q3Kr9/Sc+vzCuMuVXCfUd7hZwVE
	Oxns+/qVdm0YR2cJOxx5ftGZmf0oQqTgTFpqJdg3vPRlTJ4f+hdBo9GrqU9NDEJyARTisk
	uh4VM9BaVNraz6AVgz5U6w4sLT0jsRw=
X-MC-Unique: AJt0MlORMzeDdOz-RyxTTA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PiBv4x0FpwScyZIwciISMKrUc0tdO1gTXqrnQUq8rP51yK616rpam4T+00IaLG0tHxVxg4cD/30YnrgtqfG/0+6++Xp8k+XfuVD9bJ2XCv7hF28LaxysCSK5RQzdTP9DUQb03iN2L+/E/ONCtXkEqPGYUBzyYAlgdhC0pHj8YRrbk0KKaNrKCLoRdAsyb/+lO20F5MQ6sRVeFxHHQQ7jP9UW3r5u98a2BoEyOYdWsjrAAqYMol7ZXIbtosuC35+LEwyFdHE/8a6bysu2toazbna82D8lQh5pjLrSqi9YqbUPw77Gv9vN2hZMQe90t3UAD8Dp+pW5lykFbb0COn4JYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=ShVz0SZZ0jMQznxGF5xuq3Xcm5rK5MB8JC2kaB72Tbs=;
 b=oL0KxlXr8cwOEU/dIviiDjGR/F1VkUZV5qRvELxd8jlDrtL3+9UJ07VXWfZlaboMToFWx4oSkf/+BT97X+dRwvXgyvbLGA3dy7axPLMMU0UH8NfGFEte1UjTzc+8kCOlaJpgK9QRgQE0rtfh5pLy/GfEWHnxOP08494q1N1+/wIudv8FKs2YPt4V+vRgCoR+Ajq/xG5Oi+/tBneWIsSkKUuAfwHBvCgJcCQ78jAgbHTr3vDpBzcEAnv5gKefn1w2gz3HgSd88n/Oc18IAnkvYMQvMeVRYY9N3us7kPtXZpbxLHr1LJ2nZumzIwiGs+tx7TJc8FLYZWCeHT+btMIkSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: epam.com; dkim=none (message not signed)
 header.d=none;epam.com; dmarc=none action=none header.from=suse.com;
Subject: [PATCH v2 04/18] IOMMU: add order parameter to ->{,un}map_page()
 hooks
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Kevin Tian <kevin.tian@intel.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>
References: <957f067b-9fe1-2350-4266-51982f09d3a9@suse.com>
Message-ID: <7500296c-588e-983e-35ac-39048a72cb47@suse.com>
Date: Fri, 24 Sep 2021 11:44:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <957f067b-9fe1-2350-4266-51982f09d3a9@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0164.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1b::32) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4f4f7fa0-0a54-4d93-fc70-08d97f3ff49e
X-MS-TrafficTypeDiagnostic: VI1PR04MB5328:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB53289AF470D13E39BEF6D037B3A49@VI1PR04MB5328.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	r9F3ZsZjYKW9onHGkymSwG4oPK3busWGaFxn6bGdMM/bTMFcoZ1upz7+cmEOrJofVNGbVka4/X/ynzgaYMjYcJWjDU73vwP5my87EBQJoyM/pMHrs8BwbE7Yu9/LC5f1RHCCaeygK0cHXLhxBER471P3rCslbYLbKMadADWU6JjXr9S2SvYlZHGsT6u7TAJhg2Sf945CDI8SIIyX/zTri275y7Qfteb6CSrjqg87ykWqUuiUexHk4JBVX/9+Qas/XpQHAbqL9IHGLraZ0zGk0+oPEyfG1je5nuEVOJe+ByxLoMut1zzW4v7qgzYlr+u3me4Tikg0wwvshv/dhH19hgNECxX866l02pQyoXigjZX1eERweVx3GBzAuRFxXi6eT0vEW0PIfJXPAlgT0M8ajTJv0j/nmj+Kag5wUqhgz1/UJhreaoHlgln/SV5mpAVbjqV5S8clthgtp82+PR1V8qU9PHWwdLf/Vc6OpG8AuOD3sqcX/dY7W96lhZ85iMrsAJkLglKbUJKpPnyOLevA4qTQzOgZDWk575y/sca+haBaHU+IynkOWBJWyOORUWmEYCamB91XV0omauISl39lbZtq6pDKuz2R0swMJGq1VUJXnHJXH+wNiZIQoWj2ca+KmwXlhCdt8Wq2iriaPmdTyDfDJCsJVvrMGGmfC95j0jbC9nEmeecyyastQgIIRcfV7akENl6YbGVhUIocR5PYfIeUZRCu2CHDFAOo8tMHX1s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8676002)(83380400001)(31686004)(31696002)(38100700002)(186003)(16576012)(36756003)(6486002)(316002)(54906003)(2616005)(508600001)(66556008)(2906002)(26005)(6916009)(66946007)(66476007)(8936002)(86362001)(5660300002)(956004)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SkFWQ0VjSENRdzBZRXVYSEE2K05IRUMrVTBicnplVGRBSkhiMDN5Sm9ZUEE3?=
 =?utf-8?B?eC9ic0s1Z3V4T3cyNXlTTCtrem95bkhia08vMkl4Z3JQWHkwN0xKbWFpWGN2?=
 =?utf-8?B?cTJYam5HT2pxNHJMNTByL2dPSkFHaWF1RTRjQ3A2Yk44UjFUWTN2OWkrekhC?=
 =?utf-8?B?VG5sTmVobmVzL1l5NDJPQjBBWTEzTTN6WU13cFVuK3FIQ3RLRCtaNUZGTkdL?=
 =?utf-8?B?WlRONnFaVnJINU81NXQwL0kyb3k3K2d1YUVTSnlxM0NGVjR3TFJzc0pRQWVK?=
 =?utf-8?B?SnhSd0M5aUdXSkVGWGhPRUQ5aGlPNU01L0R3SmJhRlloYzV6TzRNcW8ySyt3?=
 =?utf-8?B?QUNEZFMweXJDb2E0WFRRTEMvMk91a3hpclNhaWUya2JRQStBVm5adkloYjJh?=
 =?utf-8?B?c3AyRmVwd0x2MXkzQSsvdThNK3hNVGlKckhwVWg4VGZ2R2s4aXlIb0swYlRm?=
 =?utf-8?B?ZldJQzlmRlhpRENhUzFGTW9uV3FPQ2M3Snh3VlBRTFVGaTk3MFl0NlNaT2dY?=
 =?utf-8?B?ZUwwZndEQVpzT0tndGNtTytCODN1Tk9EcHFvRHViMythaHZ1bXRJaDkrM016?=
 =?utf-8?B?emJaZ0hxRmNQN2FzOFpxZ1d5S1FRblhJOXR0a3JUQktqQnVrdEtIVjd0RWV3?=
 =?utf-8?B?VnUzOWVYRUxzdmk3TU5kT1grN3FtUGhITXRnVHRJbWdPNEpJSnR2K1dQeEhr?=
 =?utf-8?B?WjdrclVUMWZQLzNseCt3WVJNTVNFemhUcGxMTmRub2Y3Y2d6Z1Nod0xDWUJm?=
 =?utf-8?B?M1NtWGMxaE5nMHIxZE5yaEhVamRBY2EzTVFIQi9mK3o0anlkeHNpT3R6b1NK?=
 =?utf-8?B?WVpNSG9PSnhFbjFWTUhRRjl0blp1cVdjdGliSzdlbTFQYUc4K0xGdm52NUd3?=
 =?utf-8?B?ZXJzbXZvY29pbzhmZUltWFIwVjZid2V6QmdUUGVVVFE3VlhRRnIyKzdTTkds?=
 =?utf-8?B?VXVyNndxcGM2UjhYa2V3cE5mbER2NEk5bmkrOE00Tmp2dDJ3Wk1tM05Wb1R4?=
 =?utf-8?B?Uk9zTW10dW5ESVZsSi9tVEVCeUo1TmtqaWcvWjl0aStrYnJaS0R4MFVZOHkw?=
 =?utf-8?B?aW9NK1NMNUFCNXBWUllSWHpMd0VFK3lxMlJaZEVtdGlmcnBvbTA1MVpNS0JV?=
 =?utf-8?B?dEZVeldpSDZ2dVozR0JGbU5tUS9qOXB0ejc3eEhER0lkUkgzZm1NSEJwWTVC?=
 =?utf-8?B?S3RxSlFhcCtTRkd0YVFmb3gxNjhNaXZxN2NsNWVZdkNZTWd0T3JtV2tRSGNt?=
 =?utf-8?B?SlI2cXpFRGROeHVORGNBQnVTNE1KTTVwMDBUS0J2ZmJrZktWNjQvTVdaTmxU?=
 =?utf-8?B?aEhheUJBWEN1WkdHeW9DZ0Z5NVhRY2RzbmtBeTZrNTEzNVhwZWN0Y3dib0py?=
 =?utf-8?B?SnhteldBVlRTNVJKWlNUQWlRUTlLN0pQNXg3dWdRQ3hkeUcxa2R6WG1ybnFH?=
 =?utf-8?B?ckhKb1FwT2FHS2dJMU5MeGdBcTNkdEtFa1ZvWWVoVjZYcHFFUUtGN2hWTGds?=
 =?utf-8?B?R2NpcWNWSGFBc3FyTjRzOXRFTU4zbVpVUzZxK1hqZHlYc0JMUE96OE1RTWl1?=
 =?utf-8?B?eW5LaGlnQW9CeEtrR3c0c1dMRFhBL1F2SEl1T3QveFp5TmRSVFYvdUJWREY5?=
 =?utf-8?B?dVcxR1dmVm9sNlRGU2ZDRE1oTStSaVV1ZG1XNU1ZUlV2ejQ2cVRxd3gya2Zw?=
 =?utf-8?B?L2dFdWVLYURtb3dSNUR0dkllY3NXbUc3ZHc5c1VUTWdSL3VwOHN4RU1IVndj?=
 =?utf-8?Q?4vgijiCeIiOHQxVMbmEZyHainON0JIIEqrWTCwE?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f4f7fa0-0a54-4d93-fc70-08d97f3ff49e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2021 09:44:51.5681
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TeOl3674EEPBpKWegswLU0A0dzD1aZyexiltd+kcw+P5o3y0GBqjS2+PLJgrfBvYBuv6d9WKJdFL3A1nCsAkBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5328

Or really, in the case of ->map_page(), accommodate it in the existing
"flags" parameter. All call sites will pass 0 for now.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Kevin Tian <kevin.tian@intel.com>
---
v2: Re-base over change earlier in the series.

--- a/xen/drivers/passthrough/amd/iommu.h
+++ b/xen/drivers/passthrough/amd/iommu.h
@@ -230,6 +230,7 @@ int __must_check amd_iommu_map_page(stru
                                     mfn_t mfn, unsigned int flags,
                                     unsigned int *flush_flags);
 int __must_check amd_iommu_unmap_page(struct domain *d, dfn_t dfn,
+                                      unsigned int order,
                                       unsigned int *flush_flags);
 int __must_check amd_iommu_alloc_root(struct domain *d);
 int amd_iommu_reserve_domain_unity_map(struct domain *domain,
--- a/xen/drivers/passthrough/amd/iommu_map.c
+++ b/xen/drivers/passthrough/amd/iommu_map.c
@@ -328,7 +328,7 @@ int amd_iommu_map_page(struct domain *d,
     return 0;
 }
 
-int amd_iommu_unmap_page(struct domain *d, dfn_t dfn,
+int amd_iommu_unmap_page(struct domain *d, dfn_t dfn, unsigned int order,
                          unsigned int *flush_flags)
 {
     unsigned long pt_mfn = 0;
--- a/xen/drivers/passthrough/arm/iommu_helpers.c
+++ b/xen/drivers/passthrough/arm/iommu_helpers.c
@@ -57,11 +57,13 @@ int __must_check arm_iommu_map_page(stru
      * The function guest_physmap_add_entry replaces the current mapping
      * if there is already one...
      */
-    return guest_physmap_add_entry(d, _gfn(dfn_x(dfn)), _mfn(dfn_x(dfn)), 0, t);
+    return guest_physmap_add_entry(d, _gfn(dfn_x(dfn)), _mfn(dfn_x(dfn)),
+                                   IOMMUF_order(flags), t);
 }
 
 /* Should only be used if P2M Table is shared between the CPU and the IOMMU. */
 int __must_check arm_iommu_unmap_page(struct domain *d, dfn_t dfn,
+                                      unsigned int order,
                                       unsigned int *flush_flags)
 {
     /*
@@ -71,7 +73,8 @@ int __must_check arm_iommu_unmap_page(st
     if ( !is_domain_direct_mapped(d) )
         return -EINVAL;
 
-    return guest_physmap_remove_page(d, _gfn(dfn_x(dfn)), _mfn(dfn_x(dfn)), 0);
+    return guest_physmap_remove_page(d, _gfn(dfn_x(dfn)), _mfn(dfn_x(dfn)),
+                                     order);
 }
 
 /*
--- a/xen/drivers/passthrough/iommu.c
+++ b/xen/drivers/passthrough/iommu.c
@@ -271,6 +271,8 @@ int iommu_map(struct domain *d, dfn_t df
     if ( !is_iommu_enabled(d) )
         return 0;
 
+    ASSERT(!IOMMUF_order(flags));
+
     for ( i = 0; i < page_count; i++ )
     {
         rc = iommu_call(hd->platform_ops, map_page, d, dfn_add(dfn, i),
@@ -288,7 +290,7 @@ int iommu_map(struct domain *d, dfn_t df
         while ( i-- )
             /* if statement to satisfy __must_check */
             if ( iommu_call(hd->platform_ops, unmap_page, d, dfn_add(dfn, i),
-                            flush_flags) )
+                            0, flush_flags) )
                 continue;
 
         if ( !is_hardware_domain(d) )
@@ -333,7 +335,7 @@ int iommu_unmap(struct domain *d, dfn_t
     for ( i = 0; i < page_count; i++ )
     {
         int err = iommu_call(hd->platform_ops, unmap_page, d, dfn_add(dfn, i),
-                             flush_flags);
+                             0, flush_flags);
 
         if ( likely(!err) )
             continue;
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -1934,6 +1934,7 @@ static int __must_check intel_iommu_map_
 }
 
 static int __must_check intel_iommu_unmap_page(struct domain *d, dfn_t dfn,
+                                               unsigned int order,
                                                unsigned int *flush_flags)
 {
     /* Do nothing if VT-d shares EPT page table */
@@ -1944,7 +1945,7 @@ static int __must_check intel_iommu_unma
     if ( iommu_hwdom_passthrough && is_hardware_domain(d) )
         return 0;
 
-    return dma_pte_clear_one(d, dfn_to_daddr(dfn), 0, flush_flags);
+    return dma_pte_clear_one(d, dfn_to_daddr(dfn), order, flush_flags);
 }
 
 static int intel_iommu_lookup_page(struct domain *d, dfn_t dfn, mfn_t *mfn,
--- a/xen/include/asm-arm/iommu.h
+++ b/xen/include/asm-arm/iommu.h
@@ -31,6 +31,7 @@ int __must_check arm_iommu_map_page(stru
                                     unsigned int flags,
                                     unsigned int *flush_flags);
 int __must_check arm_iommu_unmap_page(struct domain *d, dfn_t dfn,
+                                      unsigned int order,
                                       unsigned int *flush_flags);
 
 #endif /* __ARCH_ARM_IOMMU_H__ */
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -127,9 +127,10 @@ void arch_iommu_hwdom_init(struct domain
  * The following flags are passed to map operations and passed by lookup
  * operations.
  */
-#define _IOMMUF_readable 0
+#define IOMMUF_order(n)  ((n) & 0x3f)
+#define _IOMMUF_readable 6
 #define IOMMUF_readable  (1u<<_IOMMUF_readable)
-#define _IOMMUF_writable 1
+#define _IOMMUF_writable 7
 #define IOMMUF_writable  (1u<<_IOMMUF_writable)
 
 /*
@@ -255,6 +256,7 @@ struct iommu_ops {
                                  unsigned int flags,
                                  unsigned int *flush_flags);
     int __must_check (*unmap_page)(struct domain *d, dfn_t dfn,
+                                   unsigned int order,
                                    unsigned int *flush_flags);
     int __must_check (*lookup_page)(struct domain *d, dfn_t dfn, mfn_t *mfn,
                                     unsigned int *flags);


