Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 316873F6026
	for <lists+xen-devel@lfdr.de>; Tue, 24 Aug 2021 16:21:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.171463.312889 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIXJ9-0008Fj-D5; Tue, 24 Aug 2021 14:21:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 171463.312889; Tue, 24 Aug 2021 14:21:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIXJ9-0008Cc-8y; Tue, 24 Aug 2021 14:21:43 +0000
Received: by outflank-mailman (input) for mailman id 171463;
 Tue, 24 Aug 2021 14:21:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mvQ+=NP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mIXJ7-0008CS-NF
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 14:21:41 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b0862d5a-d76c-4430-b2fb-9634955bbe6d;
 Tue, 24 Aug 2021 14:21:40 +0000 (UTC)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2056.outbound.protection.outlook.com [104.47.10.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-23-r7Aesan0O-iVtg8_C5CQhg-1; Tue, 24 Aug 2021 16:21:37 +0200
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com (2603:10a6:208:125::12)
 by AM0PR04MB6161.eurprd04.prod.outlook.com (2603:10a6:208:148::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.22; Tue, 24 Aug
 2021 14:21:36 +0000
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::4822:460f:7561:33bf]) by AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::4822:460f:7561:33bf%5]) with mapi id 15.20.4436.025; Tue, 24 Aug 2021
 14:21:36 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR2P264CA0019.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Tue, 24 Aug 2021 14:21:35 +0000
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
X-Inumbo-ID: b0862d5a-d76c-4430-b2fb-9634955bbe6d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629814899;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XDhmLw87aiylH0GLKU5f6Zw6mmbLtfManAIqVhjiMWQ=;
	b=nlAex6iepmLBI4UAOCR8/argoZPjtCZC4wpsV6AKW8sR6l0/IZssRjqkMOSITnqNs4A5RM
	M4U4simw5JnJHQ2fOnByp/gRH4qqcv6GasAPMnGEJdwHcHDMu+H6ZtGpVcxF8+ElOp8orz
	44/b37UKCgI4dPgBX98c9oNnLNzZOls=
X-MC-Unique: r7Aesan0O-iVtg8_C5CQhg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BiMmJAFu//z1yWpAfBlQ/jna30JF/Th8qqAC1jAfH2+L+hw5dbsjXOhARNBmJqPhvm515vk/cGoHUMu96Pi1lgxd/jHZ3WkmIcJwJC+lcqapFqC0R0dS3/jbf/VlNm766v6f4eXAGqoNTohWRPA8blyHzagV+ovTgVxabKoAzqtpkjEhxUx9T9ul1wmd2hZwZx09GCtSowPqN7Fg5lSTsJBqxSCxii3KLDSLB4pLANTJRylGY9kJDE+MLKLlhZ5dELe+iEY3mEVMwYItc+7TuDMLoZKufvUzuGOU/QphqghG7dICT9+IuDtCb+rj0+c/at40uoWKLFeWSRK66l4UMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XDhmLw87aiylH0GLKU5f6Zw6mmbLtfManAIqVhjiMWQ=;
 b=Tcqkp/9z6G+kFesKTZtHlpvxyFYrFriXIIO43Z37AhbQPDLiYchAWojMgB6YGh0L7Ur9Iet08pg3D3Z6o2w7tqbwrFOy3rmtvJRcScmBIn/XFqnyenrCjU9YE81Viy4RiiZ//lYXnz2JfaXqHmfwgfkAxk43oLXk5Mox8ZInSIn4/c3M38o4Lkxr4BicFQ9w+nE8IwV0Tzr+fBf6Ii/CwOush46AW5k9vhQBoKqJ5fcA5yLOViqWQfU5dPW9VXgSWON9gUR2zsEXFjTQ+efC+SDj3KSsRlkbEGrQb7JbPXRyCSA6DBD54P85R6iy7oZ0VRsIwfXyxC2KUT1mOmo0IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: [PATCH 08/17] IOMMU/x86: perform PV Dom0 mappings in batches
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <d955d9a3-33f6-f228-d007-a844ed918168@suse.com>
Message-ID: <64501c4f-e723-8bca-1d9a-e734df15899c@suse.com>
Date: Tue, 24 Aug 2021 16:21:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <d955d9a3-33f6-f228-d007-a844ed918168@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR2P264CA0019.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101::31)
 To AM0PR04MB5587.eurprd04.prod.outlook.com (2603:10a6:208:125::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1dc0da5f-9cd2-40a0-34f4-08d9670a7acd
X-MS-TrafficTypeDiagnostic: AM0PR04MB6161:
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB6161CB80F03F154739D95D76B3C59@AM0PR04MB6161.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:669;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EO4uiKcWp2Kni3SpOndPaNYSyKe6FSDHyb+CoNNJXKPmQStFd6f3Xtv8yb16QmpzTOwVdnGXMYTzm+MVx53wu2LK0Quv8Bmf8pukDK8wJBtQERWw0z7hzK02QYuRDmFWwcZr3zkTRXeEflEXfNSviOrOFG/rJAe8u11qsxojHQeEi3ZdsdtBS7ssLIwIfLE3W+QNYdJa044r0Wkgn8xwSaCkFjpRulKMEhUIiAMwWnKP9NhLj3Q6zxRCA7agWh9V9+6uJ1Ou5iP29fzHH9HpZhx7KUvwGAA1lITDyAAnXZuKBjl93ByIbs+wGCH5huNL7Js3ArD593X8/AR/Pnhseje16FH4PBEdXF4xjBI9kPJK5ZvUmO5KvGQEsy/nbXtXJmXf6AET92+mwHDS8l5/iDNVSjBSAMxSiUhnschCoPCHNbhrDoENfftAJB/6P1jEH5KiXJCpVWss4x1bMCcCYYG21ncn8SflFOKL2zhZ4rBhp/Zf5U9oPXC6tD44rYe1kURZjVjMA+aCjdDVCsXC6jxRzyeSq3LBMqFzQFaHXi2inkOMoQchv1bbFAHv7O4jb3b/LGDKttAyVCKP7q1Fi0jwzvf7PZoLMy/NvT2dgg8nuhseiZ0oPPUMpzyhY+KY19ANNVqj0FoaNIz1mHArcEvyYkkgb24t5iEUi/JDFliwrTwi+hc080gVnQ821OzKPUdm3Ggmm51vbuBziLDRcmp3j0fk4KMORMBsD43fKTQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5587.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(39860400002)(376002)(136003)(366004)(396003)(5660300002)(66946007)(26005)(478600001)(66476007)(31696002)(8676002)(186003)(31686004)(38100700002)(4326008)(8936002)(2616005)(956004)(66556008)(36756003)(6916009)(83380400001)(16576012)(316002)(54906003)(86362001)(2906002)(6486002)(30864003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R2pSendjYVJLYThHeG5MTStkSyt1SmdiSzhQRDRyTkR4NDh5SHdCbmVlTXhZ?=
 =?utf-8?B?VEd0VFRlZmx0Y3VlTmJLc3llYWxoNVFhaGJRQzdqbHBYOStDNjROdzFRYVhE?=
 =?utf-8?B?d2tzL29SKytqNktSZmhhOWg3cFFJZU9Lck5xRHp5UFZQUVVVV1V2MDl1UDND?=
 =?utf-8?B?ZUluMEtRTlBjY2I2dUV2T3BqUHlRSVNsems2eG9BUVY4WUJ3bGR4ZmtnOG1I?=
 =?utf-8?B?T0VWQi9USktyejdzNmlaWDNxNlVQZkFrZHozYlRIT3FwZnR1SFlJck5wa2l2?=
 =?utf-8?B?Y1JINGVmNHB2MDZkNTlZUDl1TEdSd0lKZ0JweHZvRzRPN2RlZ2NIdnN3OHR1?=
 =?utf-8?B?amdSK3cxQUltRlowMjJnTFBhcVpFM2FKbmxGanVBUkgxa0xGSy91TStzcVlu?=
 =?utf-8?B?b3U0TnNLMGZDYW1tSlU1NUh3MytnQVpGSFhmb0wxODRNdkdzWFpBWVZFdFl3?=
 =?utf-8?B?cTVtbDl5RnJFWHZ5ZHV2QVh5VVhhY3BUZXVwVzhaRnFMR3VSNXpENjBzNllL?=
 =?utf-8?B?ZDg0amw0L1JZSlpJTlJLaVRJRzJFMVVZMHU1TFZwR00xeXJyOHBzQmFwMkdV?=
 =?utf-8?B?VG81Y0JWQVlrbkxJTkhYU0lxV2NuQ0NkSjUzWkRXL2FYVUVyaU9IVjdUU1lC?=
 =?utf-8?B?QmN2NWxTM2dWckdLMmFlZHdpMUdtMG44dTNxdGJjbFUzcWFlZzFWSy9ZbVVP?=
 =?utf-8?B?a2pNR3JGemF0aHdXdVVJMEpCVFFJcmFlazBJc0NVSlpFdkpyYzFsN1FEc2Ex?=
 =?utf-8?B?SDFlRmJaZGVEMU9pcmoyM3NreG5NRVh2MUxFRHhvb3JEMm11Snl2TzZQYXdX?=
 =?utf-8?B?QXNkVDRjUk9XQkQyRmRONWw4VjZrYzV2N0FPWGdRZWpNcEd0NkY2NVVuNFVR?=
 =?utf-8?B?Z1Z2T2JwRWVKUjNMdko0dXVhSXhXc05pYW9XM2JLanBZbFlEUzRNRmJCZUJM?=
 =?utf-8?B?NlRkWVladVd3OUhZMC9QMUE1VzF6WitGWFljZ2FVZVBrK2piT2dtcVRtaTR5?=
 =?utf-8?B?UGVlUlIzcTUybWZpZjh6L1BIMlU2WFltRTlHK09SV3ZRbW9qTkxRSUxmSWMr?=
 =?utf-8?B?ZFg0dUFJUlR3NnZxZVFVTk9WbTZuazgxcTJEZTdRUnc1RSt0T2JtOVNnWEFo?=
 =?utf-8?B?VnBLemdrY1E3UzJFV01zdmdTQ2RoMm0yeHYxQUY1R1pvblUvQzZNa3BxM3Fp?=
 =?utf-8?B?RWJXU3ZIVFRlSnUxOUpBcnJTRmVxYjY2UHU1Qm0rZUZKWXNoR1dqanVaUUx1?=
 =?utf-8?B?QlA1d0xua2JOUmJuY04vcm1Cb0xOSHBxZkM3T2ZyYTROSEw2QjdsUXRHRU5q?=
 =?utf-8?B?b0xmS2RuWnlmaEcrTmhwZnBNTTFXK3B6U3BLb1NpalYranpMUUl5MGkvdjN6?=
 =?utf-8?B?VjcyTnFwNU1rdHFRRktIMHd0U3lBcW93OWg1Z0J5aW1QbG50bXVlZ1dOYWFh?=
 =?utf-8?B?OXdrbGdEcHh6ZE9pZVIzQkQ0UTM1aEJkSnkyQk9BQzZjS1RJbXZ5UDg1SUhT?=
 =?utf-8?B?Ui9sa2I0OGxWUmN0T0RQQTZIbUJBVnZnckhudG5uSGRqSCtzZW1hSTh5YlNx?=
 =?utf-8?B?b21NVlFNQXV4MldPTmMrQU5WY3F6cWVIV3RWS2tHSnJoTmcyUUgwKzlXeDlZ?=
 =?utf-8?B?ZWFhbzNPNWNYeDBnS21DT2FkaGdvNCt2eWpISTVYS1huSFJmTGJ4Smd3UFAy?=
 =?utf-8?B?T25keGhsQVRHeGR5eFJBSkNZaFZraUxBUFZmY1RpblJZOE9DaEpZKzJLaFd2?=
 =?utf-8?Q?6VZ4scnetb24XC1p7sPVE1lIdwBip2lVr7Bvwyb?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dc0da5f-9cd2-40a0-34f4-08d9670a7acd
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5587.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 14:21:36.3924
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7T6VuU79roWzK006eE45ULl8l9BN7N3jY2JZmlLNja3/9627/J1PNCs3ddL1yOkK5YccyGl+MrRFLGaZ8ggZVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6161

For large page mappings to be easily usable (i.e. in particular without
un-shattering of smaller page mappings) and for mapping operations to
then also be more efficient, pass batches of Dom0 memory to iommu_map().
In dom0_construct_pv() and its helpers (covering strict mode) this
additionally requires establishing the type of those pages (albeit with
zero type references).

The earlier establishing of PGT_writable_page | PGT_validated requires
the existing places where this gets done (through get_page_and_type())
to be updated: For pages which actually have a mapping, the type
refcount needs to be 1.

There is actually a related bug that gets fixed here as a side effect:
Typically the last L1 table would get marked as such only after
get_page_and_type(..., PGT_writable_page). While this is fine as far as
refcounting goes, the page did remain mapped in the IOMMU in this case
(when "iommu=dom0-strict").

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Subsequently p2m_add_identity_entry() may want to also gain an order
parameter, for arch_iommu_hwdom_init() to use. While this only affects
non-RAM regions, systems typically have 2-16Mb of reserved space
immediately below 4Gb, which hence could be mapped more efficiently.

The installing of zero-ref writable types has in fact shown (observed
while putting together the change) that despite the intention by the
XSA-288 changes (affecting DomU-s only) for Dom0 a number of
sufficiently ordinary pages (at the very least initrd and P2M ones as
well as pages that are part of the initial allocation but not part of
the initial mapping) still have been starting out as PGT_none, meaning
that they would have gained IOMMU mappings only the first time these
pages would get mapped writably.

I didn't think I need to address the bug mentioned in the description in
a separate (prereq) patch, but if others disagree I could certainly
break out that part (needing to first use iommu_legacy_unmap() then).

Note that 4k P2M pages don't get (pre-)mapped in setup_pv_physmap():
They'll end up mapped via the later get_page_and_type().

As to the way these refs get installed: I've chosen to avoid the more
expensive {get,put}_page_and_type(), putting in place the intended type
directly. I guess I could be convinced to avoid this bypassing of the
actual logic; I merely think it's unnecessarily expensive.

--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -106,11 +106,26 @@ static __init void mark_pv_pt_pages_rdon
     unmap_domain_page(pl3e);
 }
 
+/*
+ * For IOMMU mappings done while building Dom0 the type of the pages needs to
+ * match (for _get_page_type() to unmap upon type change). Set the pages to
+ * writable with no type ref. NB: This is benign when !need_iommu_pt_sync(d).
+ */
+static void __init make_pages_writable(struct page_info *page, unsigned long nr)
+{
+    for ( ; nr--; ++page )
+    {
+        ASSERT(!page->u.inuse.type_info);
+        page->u.inuse.type_info = PGT_writable_page | PGT_validated;
+    }
+}
+
 static __init void setup_pv_physmap(struct domain *d, unsigned long pgtbl_pfn,
                                     unsigned long v_start, unsigned long v_end,
                                     unsigned long vphysmap_start,
                                     unsigned long vphysmap_end,
-                                    unsigned long nr_pages)
+                                    unsigned long nr_pages,
+                                    unsigned int *flush_flags)
 {
     struct page_info *page = NULL;
     l4_pgentry_t *pl4e, *l4start = map_domain_page(_mfn(pgtbl_pfn));
@@ -123,6 +138,8 @@ static __init void setup_pv_physmap(stru
 
     while ( vphysmap_start < vphysmap_end )
     {
+        int rc = 0;
+
         if ( domain_tot_pages(d) +
              ((round_pgup(vphysmap_end) - vphysmap_start) >> PAGE_SHIFT) +
              3 > nr_pages )
@@ -176,7 +193,22 @@ static __init void setup_pv_physmap(stru
                                              L3_PAGETABLE_SHIFT - PAGE_SHIFT,
                                              MEMF_no_scrub)) != NULL )
             {
-                *pl3e = l3e_from_page(page, L1_PROT|_PAGE_DIRTY|_PAGE_PSE);
+                mfn_t mfn = page_to_mfn(page);
+
+                if ( need_iommu_pt_sync(d) )
+                    rc = iommu_map(d, _dfn(mfn_x(mfn)), mfn,
+                                   SUPERPAGE_PAGES * SUPERPAGE_PAGES,
+                                   IOMMUF_readable | IOMMUF_writable,
+                                   flush_flags);
+                if ( !rc )
+                    make_pages_writable(page,
+                                        SUPERPAGE_PAGES * SUPERPAGE_PAGES);
+                else
+                    printk(XENLOG_ERR
+                           "pre-mapping P2M 1G-MFN %lx into IOMMU failed: %d\n",
+                           mfn_x(mfn), rc);
+
+                *pl3e = l3e_from_mfn(mfn, L1_PROT|_PAGE_DIRTY|_PAGE_PSE);
                 vphysmap_start += 1UL << L3_PAGETABLE_SHIFT;
                 continue;
             }
@@ -202,7 +234,20 @@ static __init void setup_pv_physmap(stru
                                              L2_PAGETABLE_SHIFT - PAGE_SHIFT,
                                              MEMF_no_scrub)) != NULL )
             {
-                *pl2e = l2e_from_page(page, L1_PROT|_PAGE_DIRTY|_PAGE_PSE);
+                mfn_t mfn = page_to_mfn(page);
+
+                if ( need_iommu_pt_sync(d) )
+                    rc = iommu_map(d, _dfn(mfn_x(mfn)), mfn, SUPERPAGE_PAGES,
+                                   IOMMUF_readable | IOMMUF_writable,
+                                   flush_flags);
+                if ( !rc )
+                    make_pages_writable(page, SUPERPAGE_PAGES);
+                else
+                    printk(XENLOG_ERR
+                           "pre-mapping P2M 2M-MFN %lx into IOMMU failed: %d\n",
+                           mfn_x(mfn), rc);
+
+                *pl2e = l2e_from_mfn(mfn, L1_PROT|_PAGE_DIRTY|_PAGE_PSE);
                 vphysmap_start += 1UL << L2_PAGETABLE_SHIFT;
                 continue;
             }
@@ -310,6 +355,7 @@ int __init dom0_construct_pv(struct doma
     unsigned long initrd_pfn = -1, initrd_mfn = 0;
     unsigned long count;
     struct page_info *page = NULL;
+    unsigned int flush_flags = 0;
     start_info_t *si;
     struct vcpu *v = d->vcpu[0];
     void *image_base = bootstrap_map(image);
@@ -572,6 +618,18 @@ int __init dom0_construct_pv(struct doma
                     BUG();
         }
         initrd->mod_end = 0;
+
+        count = PFN_UP(initrd_len);
+
+        if ( need_iommu_pt_sync(d) )
+            rc = iommu_map(d, _dfn(initrd_mfn), _mfn(initrd_mfn), count,
+                           IOMMUF_readable | IOMMUF_writable, &flush_flags);
+        if ( !rc )
+            make_pages_writable(mfn_to_page(_mfn(initrd_mfn)), count);
+        else
+            printk(XENLOG_ERR
+                   "pre-mapping initrd (MFN %lx) into IOMMU failed: %d\n",
+                   initrd_mfn, rc);
     }
 
     printk("PHYSICAL MEMORY ARRANGEMENT:\n"
@@ -605,6 +663,22 @@ int __init dom0_construct_pv(struct doma
 
     process_pending_softirqs();
 
+    /*
+     * We map the full range here and then punch a hole for page tables via
+     * iommu_unmap() further down, once they have got marked as such.
+     */
+    if ( need_iommu_pt_sync(d) )
+        rc = iommu_map(d, _dfn(alloc_spfn), _mfn(alloc_spfn),
+                       alloc_epfn - alloc_spfn,
+                       IOMMUF_readable | IOMMUF_writable, &flush_flags);
+    if ( !rc )
+        make_pages_writable(mfn_to_page(_mfn(alloc_spfn)),
+                            alloc_epfn - alloc_spfn);
+    else
+        printk(XENLOG_ERR
+               "pre-mapping MFNs [%lx,%lx) into IOMMU failed: %d\n",
+               alloc_spfn, alloc_epfn, rc);
+
     mpt_alloc = (vpt_start - v_start) + pfn_to_paddr(alloc_spfn);
     if ( vinitrd_start )
         mpt_alloc -= PAGE_ALIGN(initrd_len);
@@ -689,7 +763,8 @@ int __init dom0_construct_pv(struct doma
         l1tab++;
 
         page = mfn_to_page(_mfn(mfn));
-        if ( !page->u.inuse.type_info &&
+        if ( (!page->u.inuse.type_info ||
+              page->u.inuse.type_info == (PGT_writable_page | PGT_validated)) &&
              !get_page_and_type(page, d, PGT_writable_page) )
             BUG();
     }
@@ -720,6 +795,17 @@ int __init dom0_construct_pv(struct doma
     /* Pages that are part of page tables must be read only. */
     mark_pv_pt_pages_rdonly(d, l4start, vpt_start, nr_pt_pages);
 
+    /*
+     * This needs to come after all potentially excess
+     * get_page_and_type(..., PGT_writable_page) invocations; see the loop a
+     * few lines further up, where the effect of calling that function in an
+     * earlier loop iteration may get overwritten by a later one.
+     */
+    if ( need_iommu_pt_sync(d) &&
+         iommu_unmap(d, _dfn(PFN_DOWN(mpt_alloc) - nr_pt_pages), nr_pt_pages,
+                     &flush_flags) )
+        BUG();
+
     /* Mask all upcalls... */
     for ( i = 0; i < XEN_LEGACY_MAX_VCPUS; i++ )
         shared_info(d, vcpu_info[i].evtchn_upcall_mask) = 1;
@@ -793,7 +879,7 @@ int __init dom0_construct_pv(struct doma
     {
         pfn = pagetable_get_pfn(v->arch.guest_table);
         setup_pv_physmap(d, pfn, v_start, v_end, vphysmap_start, vphysmap_end,
-                         nr_pages);
+                         nr_pages, &flush_flags);
     }
 
     /* Write the phys->machine and machine->phys table entries. */
@@ -825,7 +911,9 @@ int __init dom0_construct_pv(struct doma
         if ( get_gpfn_from_mfn(mfn) >= count )
         {
             BUG_ON(compat);
-            if ( !page->u.inuse.type_info &&
+            if ( (!page->u.inuse.type_info ||
+                  page->u.inuse.type_info == (PGT_writable_page |
+                                              PGT_validated)) &&
                  !get_page_and_type(page, d, PGT_writable_page) )
                 BUG();
 
@@ -841,22 +929,41 @@ int __init dom0_construct_pv(struct doma
 #endif
     while ( pfn < nr_pages )
     {
-        if ( (page = alloc_chunk(d, nr_pages - domain_tot_pages(d))) == NULL )
+        count = domain_tot_pages(d);
+        if ( (page = alloc_chunk(d, nr_pages - count)) == NULL )
             panic("Not enough RAM for DOM0 reservation\n");
+        mfn = mfn_x(page_to_mfn(page));
+
+        if ( need_iommu_pt_sync(d) )
+        {
+            rc = iommu_map(d, _dfn(mfn), _mfn(mfn), domain_tot_pages(d) - count,
+                           IOMMUF_readable | IOMMUF_writable, &flush_flags);
+            if ( rc )
+                printk(XENLOG_ERR
+                       "pre-mapping MFN %lx (PFN %lx) into IOMMU failed: %d\n",
+                       mfn, pfn, rc);
+        }
+
         while ( pfn < domain_tot_pages(d) )
         {
-            mfn = mfn_x(page_to_mfn(page));
+            if ( !rc )
+                make_pages_writable(page, 1);
+
 #ifndef NDEBUG
 #define pfn (nr_pages - 1 - (pfn - (alloc_epfn - alloc_spfn)))
 #endif
             dom0_update_physmap(compat, pfn, mfn, vphysmap_start);
 #undef pfn
-            page++; pfn++;
+            page++; mfn++; pfn++;
             if ( !(pfn & 0xfffff) )
                 process_pending_softirqs();
         }
     }
 
+    /* Use while() to avoid compiler warning. */
+    while ( iommu_iotlb_flush_all(d, flush_flags) )
+        break;
+
     if ( initrd_len != 0 )
     {
         si->mod_start = vinitrd_start ?: initrd_pfn;
--- a/xen/drivers/passthrough/x86/iommu.c
+++ b/xen/drivers/passthrough/x86/iommu.c
@@ -231,8 +231,8 @@ static unsigned int __hwdom_init hwdom_i
 
 void __hwdom_init arch_iommu_hwdom_init(struct domain *d)
 {
-    unsigned long i, top, max_pfn;
-    unsigned int flush_flags = 0;
+    unsigned long i, top, max_pfn, start, count;
+    unsigned int flush_flags = 0, start_perms = 0;
 
     BUG_ON(!is_hardware_domain(d));
 
@@ -259,7 +259,7 @@ void __hwdom_init arch_iommu_hwdom_init(
     max_pfn = (GB(4) >> PAGE_SHIFT) - 1;
     top = max(max_pdx, pfn_to_pdx(max_pfn) + 1);
 
-    for ( i = 0; i < top; i++ )
+    for ( start = count = i = 0; i < top; )
     {
         unsigned long pfn = pdx_to_pfn(i);
         unsigned int perms = hwdom_iommu_map(d, pfn, max_pfn);
@@ -272,16 +272,30 @@ void __hwdom_init arch_iommu_hwdom_init(
                                         perms & IOMMUF_writable ? p2m_access_rw
                                                                 : p2m_access_r,
                                         0);
+        else if ( pfn != start + count || perms != start_perms )
+        {
+        commit:
+            rc = iommu_map(d, _dfn(start), _mfn(start), count,
+                           start_perms, &flush_flags);
+            SWAP(start, pfn);
+            start_perms = perms;
+            count = 1;
+        }
         else
-            rc = iommu_map(d, _dfn(pfn), _mfn(pfn), 1ul << PAGE_ORDER_4K,
-                           perms, &flush_flags);
+        {
+            ++count;
+            rc = 0;
+        }
 
         if ( rc )
             printk(XENLOG_WARNING "%pd: identity %smapping of %lx failed: %d\n",
                    d, !paging_mode_translate(d) ? "IOMMU " : "", pfn, rc);
 
-        if (!(i & 0xfffff))
+        if ( !(++i & 0xfffff) )
             process_pending_softirqs();
+
+        if ( i == top && count )
+            goto commit;
     }
 
     /* Use if to avoid compiler warning */


