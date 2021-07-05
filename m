Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B963BC172
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jul 2021 18:13:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.150500.278261 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0RDL-0001Am-Iq; Mon, 05 Jul 2021 16:12:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 150500.278261; Mon, 05 Jul 2021 16:12:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0RDL-00018v-Fm; Mon, 05 Jul 2021 16:12:55 +0000
Received: by outflank-mailman (input) for mailman id 150500;
 Mon, 05 Jul 2021 16:12:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HGaV=L5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m0RDK-00018D-Q5
 for xen-devel@lists.xenproject.org; Mon, 05 Jul 2021 16:12:54 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d9afd69d-ddab-11eb-844d-12813bfff9fa;
 Mon, 05 Jul 2021 16:12:53 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2172.outbound.protection.outlook.com [104.47.17.172])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-19-EvxtuWEWMRmLX0KnF-uQ7w-1; Mon, 05 Jul 2021 18:12:52 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB2829.eurprd04.prod.outlook.com (2603:10a6:800:bb::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.33; Mon, 5 Jul
 2021 16:12:51 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4287.033; Mon, 5 Jul 2021
 16:12:51 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR2P264CA0009.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.21 via Frontend Transport; Mon, 5 Jul 2021 16:12:50 +0000
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
X-Inumbo-ID: d9afd69d-ddab-11eb-844d-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1625501573;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cGRUgXnfDy3yI0GcEOCYKjOGDUjbiMY8tUQFdNz76XI=;
	b=dJz7Z8Jg/eoNLIgmzUQ964dtmc+nXK3bgFQoepPuk0vH51yGpUiHn/Yfx662lwvefKfTNM
	MasWkTVTX9oa38enElTYtIJoIPyhcB7+KJPTZQmjllD8mfqbK6Tr/tVhBR1eDc/ogQcMQc
	K0HM/b6mR9cGV+l8qovcbcLp4aIulj4=
X-MC-Unique: EvxtuWEWMRmLX0KnF-uQ7w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ksJ1h3GtZLICOV47NlB5369a+kihIa891KUD3hOQscAYUVG3aHtktux31ton1wh39Op1JS9ULKiBlniUFLSqhOJVdhkfrG37Tz0kUvvcdmnxIdS45ExKkEJmpmwqmh+XwGPpWeKBTqcXxudFJJhjyyyeKVHAKQvXQIEjjkHbZ2ohIZjslmZggQRhneyfAHgv3CloQ582SYWwXDYIjwtXFENRXIQ/eMSL7uTZPP55J+ud7N3ZWvLKWH86V3DsP2ZH65RhmJ1OxiZ6SWn18GtLCkOIq1VumKLDtlBMPAX2w6mXytkmUhIt/oRAYD4fMEN15iFOnzlwJJSR0QE8Ypzg6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cGRUgXnfDy3yI0GcEOCYKjOGDUjbiMY8tUQFdNz76XI=;
 b=F6bUTYRKr1ceWjv30+NJGLtEpTSJGl677jttdWXPvfgTcP899zBB3ewO/2UEqwU3DgeaeeBJNPIvCGIIoJTCikN8sq3k7I5iO08LK/Wb2BE2oTqi+sF2aG7FV2XE/gVLNKutxBjeQAOd2nEUKv1VOEugtwBEm8ust7Ko5oCCX+CV5dfUfQQBk0FbbxxSX7krrWE/9p5qMFkljxkcp0qmn/GdP0U77O0WH3DXHFh8BBAucif6okwoMMsuX7vFV43nanLFyD4ChDwWQLNLPh6y/1iDCfl2YBMN+pX4GTyYSyRXn1PlFGfl/C9Vb621cV/2GuUccYU0vxQZvrIjXu70CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: [PATCH 12/16] x86/p2m: re-arrange {,__}put_gfn()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <d1fd572d-5bfe-21d8-3b50-d9b0646ce2f0@suse.com>
Message-ID: <61ea9272-c4ac-c2da-e1da-8b8930d85264@suse.com>
Date: Mon, 5 Jul 2021 18:12:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <d1fd572d-5bfe-21d8-3b50-d9b0646ce2f0@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR2P264CA0009.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101::21)
 To VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c25561a7-ae83-4b79-6ba7-08d93fcfbcdd
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2829:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB28291AB75E5D82BB7F6313C4B31C9@VI1PR0402MB2829.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8L1Cj+BjdaJ+dYFgX9le8V9sYd9NlvvW7RliphAZTMGa7zjdyYr0eg1BuOcN3OI/5kBNnABC5u2Nv21ZjJBVNVKX940555uDwGqgYRi5nniQSMRhAwadFit5RAa07fVbKbq7ufmchpbMc22rlVwhbSVX2ZbZwWxNRCeCULTDH78tds2LZ5PZgTaOmoRx+8WHkG5JcnblQPpQM6leN6NbAXzYmWP2vk2PvgHCejktJYyfHXxDg7Bxd4FO/4hVGtjTERYjxCL2Arxbc4Ag8pRgliWOJGfz5iRHbiAIVNY1AKKFnSxtw1DBEHOUdqNME+22dlwthwRPjawdvC1wYklm1ISyGjHvWCLu658ArtgAvx0WOgX2D6+hSeJ+IBO1YmRq18IoYC9NevH1jeE6K3eGIPTlNKobgsiDgXVUt3Q25fKsnt+iLXyKbxCmip6mkzWY+frL1qGz2iGQbArw+DLDQICh114GCDTV+JL6Rw6d+wKJ7UIBrAXExJnH6Y1Uxrn8ipm9TgMNXEjvl9jx6YhndiKgiFV3LT95sBqEb//7JlUi14yJLTEZoxi9GrE42/HD8YDc7Fa2Qo5ziqnt3m7K04d5/mJnoEsuZ30qW4Q4GMzyz8OAH9sbZFjPazj0eLUpoH4Qio3uT8cIV8QahwyBhZhqVLxyTFPEk74477jAFVdtZ+W8FJ1hi6C2lwlA7Ozkp1Vze6l+oSagRK/Vp1v9G/WCb37cFecVMqsgLRmYLDY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39850400004)(366004)(136003)(376002)(346002)(396003)(6486002)(26005)(16576012)(478600001)(2616005)(956004)(86362001)(2906002)(6916009)(316002)(83380400001)(8676002)(16526019)(66556008)(36756003)(8936002)(38100700002)(54906003)(31696002)(4326008)(66476007)(186003)(66946007)(31686004)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TThweFRCMXJGM2hoN2QwaDJMbVRIZGhFOUttb3ZCV3BQK2NnK2V4UUlsZjRz?=
 =?utf-8?B?T3R4YlRvV2pMaFhlc1hZVElUUExXYTZ1bmhVZDB5anhFaEN5VlQ4SDFDTTcy?=
 =?utf-8?B?QTZhalVsUDQybVdFblVNTjBHem1JYXcrbm05NUVJVVE1QXZGM1MrVkp0YVd1?=
 =?utf-8?B?SGREL3BkVEpLZnRmcDNBYWdFWnJMRjYvZ09tb2M4QTBJRlZocU4yVWsxZkpJ?=
 =?utf-8?B?cTI0SHlBdG13Undtamo3VWNRaTNhN2ZaRW1SOXlZYlVkT05wQnZUV3AydVF0?=
 =?utf-8?B?dXFmMm45SFl0MzdQL0JkaDNDc2dtcUVIVW9mQW5tQlZycjdnRGpkdE5EbzZU?=
 =?utf-8?B?N3pwNGp0RmphVzRLeUx3blhmeG9hbzRINUFRUWxnMWUvaUZHa3c2K3A1bUhx?=
 =?utf-8?B?T3YzQmJkc0tzbGRhUGt6UmFuNGxDR204NDhLd2I1Qm4raWVjcm9JYzJwYUxB?=
 =?utf-8?B?QUNLTU5Fci9IcWtFRmtnU2JoVEhzQkFnT2pOZ1owb3EwTkE1aDh1MVQ4UWpD?=
 =?utf-8?B?cFNmeExsNE1USTlQdExUUW9NT1ZrN1NPZnhRQlRBNDlnanRUMjNFOE9tcy91?=
 =?utf-8?B?Sk15eVM1WG13dkZWL1lDZlMydkl6b0w0YU13VmVNMzZZK3NtaVNCQmpzNitX?=
 =?utf-8?B?WFpKZ0ZMd01CRHVPRDZPblptQW55RDZFM2U0ZHBYMlgrWU1MNURmODRwTHpC?=
 =?utf-8?B?ZVhwRGdvT2FJbE9RMUk1Z1hSRTFCWldrengvY2liUXN0RGc4cE9PQURzalVM?=
 =?utf-8?B?cEpEUEFzNllSeUIwRE0yOVVNZXN4dUdKMGw2M2w2czRXWlM2eGtDdHJzWUFW?=
 =?utf-8?B?UDNVZ2dhSkdaa3hoQXZ5MmdMK2paVlliZFNMajgxL0xpMkpWRGE1R0c5R0dj?=
 =?utf-8?B?d0gvV0dtNjdOWm1DVlhsMWtCM0VsaldzQzJGaU50dk11L3dlamdSRlNhVGpD?=
 =?utf-8?B?aklaVlgzNHk0alczWVIxU0JSTEpCTGdSVmovV1FidHU3L1FzTndxVTgxTXBH?=
 =?utf-8?B?QlNKNTNIaGF6aXdKQkhxV1BSV1pqcWFHUEw4OEZ1aXFGRnBwZGQxL0t3UDNh?=
 =?utf-8?B?cEwxeld3SjFvMnJjNUVWcjhNRWxZWFViVGpvdkFUVEgzVE5FOVZ1MUg5ZzJ5?=
 =?utf-8?B?RjUxYkhqK2EyQVdxK2dCRnFqRm50NUllR1h3Ymk0TjVOa2d5RS9oNktnQS95?=
 =?utf-8?B?WEZwWVJTdGU1NUxOMXFnSXg2azVqK293cEt0bnVVcFA5WStMa2c3ZWFDcVIr?=
 =?utf-8?B?RnZuWGdaU05hdGVTOTFObmJpOXNRMXIxQ1kvbWk4WVJKaUxNSlNvRkQ2QlBh?=
 =?utf-8?B?RXZReVQ0c3d6ZVh1MDRqV1pLWm1qdVIwZ3ZpQWxSU3VSczJkNE9xUWdBV0RZ?=
 =?utf-8?B?Yi9yRmpnS2dJZ0k3eDA3ZllJUFpDS00yUjAxUU1xb0tja1BZT2Y4NWdSYjU3?=
 =?utf-8?B?S1hNWWV4Skw4V05ZZE1BYktrMW5POEhmTkZsYU1EK3JqZUpyRUl6UXVHQXlC?=
 =?utf-8?B?cWtRZnZkK21jUWlPQWxRRUhNbXhJVmhteERwTVFBLytLdkRKSnBZZi9qNVZO?=
 =?utf-8?B?Mm1DdmFkU0c3L3NtOFBoQnpia1pXQ3Z4MDZXRmpKM1piQ2xhTzFYRVd1VU94?=
 =?utf-8?B?STRZVTFuNHBzSXRlTGZHSDV5OGoyR0N6bld2dlVvb011Mkh6TExwaFo0WHJM?=
 =?utf-8?B?VElDNUZxZFhtMFFWWjZVVUJOUTVlWkdoUkR4U3ZRakNaa09uRGtyMDlYQjI3?=
 =?utf-8?Q?i2Hon1pGNSulP1QagqG7Odrxnqf/N0UAzOY6ESu?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c25561a7-ae83-4b79-6ba7-08d93fcfbcdd
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2021 16:12:51.0073
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SdW5n36p19hyxCs685t01pTf5ShDVRLmQ5QnqqscBsCVSpoL9IQ5YjXbn7I+/zTQuYrK+vsEy82TmEPAkXW/mw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2829

All explicit callers of __put_gfn() are in HVM-only code and hold a valid
P2M pointer in their hands. Move the paging_mode_translate() check out of
there into put_gfn(), renaming __put_gfn() and making its GFN parameter
type-safe.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -1969,9 +1969,9 @@ int hvm_hap_nested_page_fault(paddr_t gp
              * altp2m_list lock.
              */
             if ( p2m != hostp2m )
-                __put_gfn(p2m, gfn);
+                p2m_put_gfn(p2m, _gfn(gfn));
             p2m_change_type_one(currd, gfn, p2m_ram_logdirty, p2m_ram_rw);
-            __put_gfn(hostp2m, gfn);
+            p2m_put_gfn(hostp2m, _gfn(gfn));
 
             goto out;
         }
@@ -1993,8 +1993,8 @@ int hvm_hap_nested_page_fault(paddr_t gp
 
  out_put_gfn:
     if ( p2m != hostp2m )
-        __put_gfn(p2m, gfn);
-    __put_gfn(hostp2m, gfn);
+        p2m_put_gfn(p2m, _gfn(gfn));
+    p2m_put_gfn(hostp2m, _gfn(gfn));
  out:
     /*
      * All of these are delayed until we exit, since we might
--- a/xen/arch/x86/mm/hap/nested_hap.c
+++ b/xen/arch/x86/mm/hap/nested_hap.c
@@ -167,7 +167,7 @@ nestedhap_walk_L0_p2m(struct p2m_domain
 direct_mmio_out:
     *L0_gpa = (mfn_x(mfn) << PAGE_SHIFT) + (L1_gpa & ~PAGE_MASK);
 out:
-    __put_gfn(p2m, L1_gpa >> PAGE_SHIFT);
+    p2m_put_gfn(p2m, gaddr_to_gfn(L1_gpa));
     return rc;
 }
 
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -333,21 +333,13 @@ mfn_t p2m_get_gfn_type_access(struct p2m
     return mfn;
 }
 
-#endif /* CONFIG_HVM */
-
-void __put_gfn(struct p2m_domain *p2m, unsigned long gfn)
+void p2m_put_gfn(struct p2m_domain *p2m, gfn_t gfn)
 {
-    if ( !p2m || !paging_mode_translate(p2m->domain) )
-        /* Nothing to do in this case */
-        return;
-
-    ASSERT(gfn_locked_by_me(p2m, gfn));
+    ASSERT(gfn_locked_by_me(p2m, gfn_x(gfn)));
 
-    gfn_unlock(p2m, gfn, 0);
+    gfn_unlock(p2m, gfn_x(gfn), 0);
 }
 
-#ifdef CONFIG_HVM
-
 /* Atomically look up a GFN and take a reference count on the backing page. */
 struct page_info *p2m_get_page_from_gfn(
     struct p2m_domain *p2m, gfn_t gfn,
@@ -2086,7 +2078,7 @@ int p2m_altp2m_propagate_change(struct d
             else
             {
                 /* At least 2 altp2m's impacted, so reset everything */
-                __put_gfn(p2m, gfn_x(gfn));
+                p2m_put_gfn(p2m, gfn);
 
                 for ( i = 0; i < MAX_ALTP2M; i++ )
                 {
@@ -2110,7 +2102,7 @@ int p2m_altp2m_propagate_change(struct d
                 ret = rc;
         }
 
-        __put_gfn(p2m, gfn_x(gfn));
+        p2m_put_gfn(p2m, gfn);
     }
 
     altp2m_list_unlock(d);
@@ -2195,7 +2187,7 @@ void audit_p2m(struct domain *d,
              * blow away the m2p entry. */
             set_gpfn_from_mfn(mfn, INVALID_M2P_ENTRY);
         }
-        __put_gfn(p2m, gfn);
+        p2m_put_gfn(p2m, _gfn(gfn));
 
         P2M_PRINTK("OK: mfn=%#lx, gfn=%#lx, p2mfn=%#lx\n",
                        mfn, gfn, mfn_x(p2mfn));
--- a/xen/include/asm-x86/p2m.h
+++ b/xen/include/asm-x86/p2m.h
@@ -503,9 +503,16 @@ static inline mfn_t __nonnull(3) get_gfn
                                               P2M_ALLOC | P2M_UNSHARE)
 
 /* Will release the p2m_lock for this gfn entry. */
-void __put_gfn(struct p2m_domain *p2m, unsigned long gfn);
+void p2m_put_gfn(struct p2m_domain *p2m, gfn_t gfn);
 
-#define put_gfn(d, gfn) __put_gfn(p2m_get_hostp2m((d)), (gfn))
+static inline void put_gfn(struct domain *d, unsigned long gfn)
+{
+    if ( !paging_mode_translate(d) )
+        /* Nothing to do in this case */
+        return;
+
+    p2m_put_gfn(p2m_get_hostp2m(d), _gfn(gfn));
+}
 
 /* The intent of the "unlocked" accessor is to have the caller not worry about
  * put_gfn. They apply to very specific situations: debug printk's, dumps 


