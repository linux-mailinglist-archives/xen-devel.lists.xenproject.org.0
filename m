Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D043BC165
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jul 2021 18:09:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.150467.278206 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0R9n-0005na-Rh; Mon, 05 Jul 2021 16:09:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 150467.278206; Mon, 05 Jul 2021 16:09:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0R9n-0005lK-O7; Mon, 05 Jul 2021 16:09:15 +0000
Received: by outflank-mailman (input) for mailman id 150467;
 Mon, 05 Jul 2021 16:09:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HGaV=L5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m0R9m-0005l4-5B
 for xen-devel@lists.xenproject.org; Mon, 05 Jul 2021 16:09:14 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 78ae2efa-562e-45d5-98f4-8aede0b8acb8;
 Mon, 05 Jul 2021 16:09:13 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2053.outbound.protection.outlook.com [104.47.14.53]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-26-0O_MTB6WPxeQNjzxabADng-1; Mon, 05 Jul 2021 18:09:11 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB3293.eurprd04.prod.outlook.com (2603:10a6:802:11::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.32; Mon, 5 Jul
 2021 16:09:10 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4287.033; Mon, 5 Jul 2021
 16:09:10 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0075.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:18::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Mon, 5 Jul 2021 16:09:09 +0000
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
X-Inumbo-ID: 78ae2efa-562e-45d5-98f4-8aede0b8acb8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1625501352;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Tx30m7l+7/J2j/vr4dWWnozovQ/2dZxCTcm2hzQLKDs=;
	b=mXHwmU+dXBPm+qtIpbaOPMnbt+AFylARS6CeRsU/H3C+BHY/g6BHxarBQsKeDGaCMUIwOt
	mIu6YJX6pB8e8fRYYi9na5DT5jlYkboV0OPU5k5YcTrY5RU8BguBmoVfvmhfkdKjIQ63Tj
	e/stn1IQURKvgX+33xZQG2GyPumRLBg=
X-MC-Unique: 0O_MTB6WPxeQNjzxabADng-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WJKn1phpWKtXaOfTLDb86BWsbuUPFXBkK91sNo7joEVX+uDtymQF8dkzyeEb34rphxfSLg4JIoCiJ6eJd2NgnbeR0Ilz3LhRw607ym/lPVqo136HXq517hmugLwOuWjlruPlRMz0QDaEMaB5LfKK3Ndn6PH43F/qHZFmt7O9jq6P43NcJDSqeDKgXyuI6Kp9rYPN2ud8kleOnWbfLkCych5o7BM8IDxvBYtH0XOn/K5vQwo6g67aFpBshl/KYt64lFV57nUkl9AhysptPzOTEaDEzYPOn2E4C0qgBhOyokKeRKgTWRUjOBQ6YbjYa1CcDfrakicwz90yYUO2F85flA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tx30m7l+7/J2j/vr4dWWnozovQ/2dZxCTcm2hzQLKDs=;
 b=JKv+R4/+DvMwTIYh8Or7jBiLBPtx5CPLK32M+2NWt8XUpy7wL+zTVEE5dMuxy4jZ/dNq945CoX9qzjRcWarspQeHTFaUSDtNOuJwXngU4ddp0uJPFZS9vL/bYKqiTykf0Y5heE4uZfWUR68dPkQO2p5zlOjcm0IgjGtcxINzHwtocagLhk/FNK+8/WuMtBsYZANyKlq37jTEYmcKvBymaoZSAr1Ps9AxB/lGmfiXzu7kBHPHQqcE0HlTNs7VwE4D1KkdzGqwONmW8A2kvbY2HJWPZnjkhJt83ZB1n/opN1ee+hOwErtY6mlqxKR9Hod6hUsvGsMW3LDlQYti9WTV+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=suse.com;
Subject: [PATCH 07/16] x86/P2M: p2m_{alloc,free}_ptp() and p2m_alloc_table()
 are HVM-only
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Kevin Tian <kevin.tian@intel.com>
References: <d1fd572d-5bfe-21d8-3b50-d9b0646ce2f0@suse.com>
Message-ID: <fcd39881-e225-d1a7-a168-9aa9fd9a7735@suse.com>
Date: Mon, 5 Jul 2021 18:09:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <d1fd572d-5bfe-21d8-3b50-d9b0646ce2f0@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR0P264CA0075.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:18::15) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 53500c0f-4bd4-42f0-be2c-08d93fcf3932
X-MS-TrafficTypeDiagnostic: VI1PR04MB3293:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB3293C51D3390CD89CC44F966B31C9@VI1PR04MB3293.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kMH6Jkw6+UNMXlkq6qZoY56fAMLgcq0Iey5ZynVcCry3kOUYt1GDSC+MaKlBHGXl0u/7M49bvKObmi/cLAdWkuKGmORGOOgGxFLm3JllDn9sKWC4y+n42ZWz8kWlD5vfEvYado4J6Be4mMkpXe2Dfqzrd7UVUaHha26G8m22zOgrEfuNQPZhzTMevhY0yWvpgVbwhf/KXFEeBLe+xz8TGnp3NONK41dZ5NhruFmFU7yr2oQLG85Tp85H9Gwptsq6Um523RA7MyQbxz1LxNRsVXTD97c9cdHeuK3jbftc6Gqp2m8MLUSzps4MAslt/ForNLCo49ei3PclMYyPmBoSnYXhk/dN7CA3vPhzkbez7X+r4fkwQc8IEJUZs2ntTJyJmPWyq1pK69kPiyTvpmkINPoOyMkGYt0fRCB4Qh0EB7X4Uf8a0NNvVcLdnUvT+v+PC3+0frrhjtz/k2qJTIrF8FsznlKnvUUjd+FwkteOUR0xTHSiqheuAihH2wHvDJErjCuRMtTMwUKRhzKNN55mNdNNSdyAoSWCO+v89e69ojd4IW8+FNRsYxU7ErlYPRSazb4PAwPNw7MoohIMnsAfJFgMJAQqDE1uWQp0SNHqgfpa9PS3pNVBRT0mPTuEEvDlOc94QzKV2b+nUNb4FZeOnFSaW+01rA70IRI8kWkQgjugOLM4RwHie0aKjBw85MASE3cRT33tWM8Mu/eAmPEFeQCekdj4pB0v6mBNi2p/iKo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(346002)(396003)(136003)(376002)(39850400004)(5660300002)(316002)(956004)(66946007)(2616005)(16576012)(26005)(38100700002)(186003)(66476007)(66556008)(2906002)(36756003)(16526019)(86362001)(31686004)(6916009)(54906003)(83380400001)(31696002)(4326008)(478600001)(6486002)(8936002)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VlRiQUtJRU1zZWN3eEozQW5lNVhvUUdod0EwZnhBSnpQRGIzTURBdnJHUEJP?=
 =?utf-8?B?MkUycTVNdzZoL1lZODlnRlhYcytqOFlsSFl4dzdaMUtzYnFDT0t0a2IyUUU5?=
 =?utf-8?B?N0RoY2d6eFRiV3ZRZ01mTzRlb2oybytGZTJ6bm9rRHp2a2h3MXJ6VXk2RTNK?=
 =?utf-8?B?SjhneW1CcmRkU2o5L3hIbTQrSXpVMFhiekdMVkNyaUh1Rnp1cDJ6aXJ5Zkxo?=
 =?utf-8?B?aXlwSnZ6NXpFS0VaVFR3Q010cG9WQ3N4Sy9wUU5oT1d4Rkl5NnRma0Z6d0xz?=
 =?utf-8?B?SkNpWXNPdkc3Wml6WHJOa09NcGpNS0xvSlpiczlxa0RGMUVlZzNYNVRZRzRE?=
 =?utf-8?B?SFRVeFBkME5aRmpHYUo1L0NPNFVQLzU3cGxpUnZGWEd4eFhFd0ZXUG9JV3dw?=
 =?utf-8?B?aUR5VkpFa2V1cDF5WDh4amZsMW5hWHBpUFRiblhWZmtMMDQ3aWIrR0xPMUhj?=
 =?utf-8?B?aUlSczZoTXJaZmRxdUJreThCVHRndnZIRU9wTFh5WXRVZ3R6Y1k3V3VTa0Ra?=
 =?utf-8?B?OHZDcGJHUnpLc0x2Qzh4YlMzd3M4OTBURGE0eTBua2FGTEtaTmQ4MVUyZDBj?=
 =?utf-8?B?cWd0S1B0YktiNE1OaW1uVy9FbUp3L0crUGJ2SWhMcTh1aUVNaXFUaUNNUGtJ?=
 =?utf-8?B?WHZNTG9VVWVKMGNKNmNlWTV3VTVNTGZGcU1GYTN2Sm1udjhCZ1M5Y201d1I2?=
 =?utf-8?B?ckN3MzlhRGxFYWtVUFVZV1kyU0p1WTdCMk9id1RBVVlZRUppWEY5M243R09r?=
 =?utf-8?B?OERWbktNY1R5VGE2U201b1NNYWVzalNvbVNFS2gzTU54RUNOakFIV0poN29I?=
 =?utf-8?B?V2RwUlVMUjZUMjV5RTNwMW1vQWRPYm5YaDdEQUlMei8wYXRtRVlWR2c4UlFz?=
 =?utf-8?B?SGdYZCsvQnVPb1p1d2pGWSt2QjJwV0lxWHJ1ZzRpWWpIclNYekttNGVkN0ND?=
 =?utf-8?B?MzhJNHZDYmhVN2VEeVFZaUswQWZ0ZUZzaVJYcVUxcC91dGZmY25hc0IxN0Nz?=
 =?utf-8?B?MWpSODIrV3czZ1pTMGt4bHR3SVpnTHhPa1p0Vkd0ZzZ4Um1YSTRvdVJvWVdM?=
 =?utf-8?B?NWhSUGd4b1k5TkNEWm90dHV6V1M0dnkxd0d5ZzZIQlZwOXQ1S3d3NnF1dEdH?=
 =?utf-8?B?ZjNCbGRGdFNkQUFXcFdjSUVFeEJjYkJNU0ZwUWQxQTF2Vm10anZoU2tGTHlZ?=
 =?utf-8?B?TVZhMVczT0tMMUJQcmh0a2VyQ3RpR2ZaSlRqZ2VjVytsUElDSVZ6QTRRWnE0?=
 =?utf-8?B?UW9kaVVqTHZWUXhNc2d6ME1aWXpkSmsrdjA1Sm5NU0l1VEdZUCtleVBIYmc3?=
 =?utf-8?B?bGV5T2lidE50TCtGMGgrYU03QURXQzhhQlZTN1R2eDFPN29kdHFseU5FVWpK?=
 =?utf-8?B?RWl3cnA2c1MxY1YweGdqdFNzUDBsY3ZrWWRhZTUrSGl4a0c3dVZQUTEzTW04?=
 =?utf-8?B?MC8wZnJxN0VFR3lHb1BTQUJRTzVlVkxiNFc2eGhFZE5GbkJ4NmFON1Jzc0N0?=
 =?utf-8?B?bVBJM3FzaDlGRWdqa0E4MG01UDB1d0hmOEtLd2ZVSkdxQXJKRWh1KzljUnZw?=
 =?utf-8?B?Wmg1MlhqdXVrZFNFcG9HWXZJMXNxOTM1NEsyeCtxa0ZOY2x3dTFFNTZ6Ri9l?=
 =?utf-8?B?UUk4R205U1Fodmx4c0NEU0xiUGE4dGVjY3VMVklWdmxYSnlQUjZOWllyUGlz?=
 =?utf-8?B?ZTFYblh5Q0xOUHB0Q1krNUt1T2VFSmlwM1F5aTliRTVwRlhTUVlHOXVPMUtu?=
 =?utf-8?Q?GdIHjxmayNle13MC8n6h56dNMoIjEJ17RSpvbTS?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53500c0f-4bd4-42f0-be2c-08d93fcf3932
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2021 16:09:10.1142
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VUdBhF/qJ8KGxQAldHRc1AQAGsaHcCs+0Qtz/B7Y5mSXOX7AGDiKe6FOgcw2TGgLQtTtBvggov9l/WEcaCRISA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3293

This also includes the two p2m related fields.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -94,7 +94,9 @@ static int p2m_initialise(struct domain
     int ret = 0;
 
     mm_rwlock_init(&p2m->lock);
+#ifdef CONFIG_HVM
     INIT_PAGE_LIST_HEAD(&p2m->pages);
+#endif
 
     p2m->domain = d;
     p2m->default_access = p2m_access_rwx;
@@ -628,6 +630,7 @@ struct page_info *p2m_get_page_from_gfn(
 }
 
 #ifdef CONFIG_HVM
+
 /* Returns: 0 for success, -errno for failure */
 int p2m_set_entry(struct p2m_domain *p2m, gfn_t gfn, mfn_t mfn,
                   unsigned int page_order, p2m_type_t p2mt, p2m_access_t p2ma)
@@ -667,7 +670,6 @@ int p2m_set_entry(struct p2m_domain *p2m
 
     return rc;
 }
-#endif
 
 mfn_t p2m_alloc_ptp(struct p2m_domain *p2m, unsigned int level)
 {
@@ -746,6 +748,8 @@ int p2m_alloc_table(struct p2m_domain *p
     return 0;
 }
 
+#endif /* CONFIG_HVM */
+
 /*
  * hvm fixme: when adding support for pvh non-hardware domains, this path must
  * cleanup any foreign p2m types (release refcnts on them).
@@ -754,7 +758,9 @@ void p2m_teardown(struct p2m_domain *p2m
 /* Return all the p2m pages to Xen.
  * We know we don't have any extra mappings to these pages */
 {
+#ifdef CONFIG_HVM
     struct page_info *pg;
+#endif
     struct domain *d;
 
     if (p2m == NULL)
@@ -763,11 +769,16 @@ void p2m_teardown(struct p2m_domain *p2m
     d = p2m->domain;
 
     p2m_lock(p2m);
+
     ASSERT(atomic_read(&d->shr_pages) == 0);
+
+#ifdef CONFIG_HVM
     p2m->phys_table = pagetable_null();
 
     while ( (pg = page_list_remove_head(&p2m->pages)) )
         d->arch.paging.free_page(d, pg);
+#endif
+
     p2m_unlock(p2m);
 }
 
--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -2700,8 +2700,10 @@ int shadow_enable(struct domain *d, u32
  out_locked:
     paging_unlock(d);
  out_unlocked:
+#ifdef CONFIG_HVM
     if ( rv != 0 && !pagetable_is_null(p2m_get_pagetable(p2m)) )
         p2m_teardown(p2m);
+#endif
     if ( rv != 0 && pg != NULL )
     {
         pg->count_info &= ~PGC_count_mask;
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -339,12 +339,14 @@ static uint64_t domain_pgd_maddr(struct
 
     ASSERT(spin_is_locked(&hd->arch.mapping_lock));
 
+#ifdef CONFIG_HVM
     if ( iommu_use_hap_pt(d) )
     {
         pagetable_t pgt = p2m_get_pagetable(p2m_get_hostp2m(d));
 
         return pagetable_get_paddr(pgt);
     }
+#endif
 
     if ( !hd->arch.vtd.pgd_maddr )
     {
--- a/xen/include/asm-x86/p2m.h
+++ b/xen/include/asm-x86/p2m.h
@@ -202,9 +202,6 @@ struct p2m_domain {
     /* Lock that protects updates to the p2m */
     mm_rwlock_t           lock;
 
-    /* Shadow translated domain: p2m mapping */
-    pagetable_t        phys_table;
-
     /*
      * Same as a domain's dirty_cpumask but limited to
      * this p2m and those physical cpus whose vcpu's are in
@@ -223,9 +220,6 @@ struct p2m_domain {
      */
     p2m_access_t default_access;
 
-    /* Pages used to construct the p2m */
-    struct page_list_head pages;
-
     /* Host p2m: Log-dirty ranges registered for the domain. */
     struct rangeset   *logdirty_ranges;
 
@@ -233,6 +227,12 @@ struct p2m_domain {
     bool               global_logdirty;
 
 #ifdef CONFIG_HVM
+    /* Translated domain: p2m mapping */
+    pagetable_t        phys_table;
+
+    /* Pages used to construct the p2m */
+    struct page_list_head pages;
+
     /* Alternate p2m: count of vcpu's currently using this p2m. */
     atomic_t           active_vcpus;
 


