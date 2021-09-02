Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F643FEAAA
	for <lists+xen-devel@lfdr.de>; Thu,  2 Sep 2021 10:34:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.177151.322399 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLiAR-0000ER-7g; Thu, 02 Sep 2021 08:33:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 177151.322399; Thu, 02 Sep 2021 08:33:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLiAR-0000BU-4U; Thu, 02 Sep 2021 08:33:51 +0000
Received: by outflank-mailman (input) for mailman id 177151;
 Thu, 02 Sep 2021 08:33:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K8X1=NY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mLiAP-0000BK-Kj
 for xen-devel@lists.xenproject.org; Thu, 02 Sep 2021 08:33:49 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7e10e197-0bc8-11ec-ae46-12813bfff9fa;
 Thu, 02 Sep 2021 08:33:48 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2057.outbound.protection.outlook.com [104.47.0.57]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-25-U9UFGGm3PHCgDY-C_PZclA-1; Thu, 02 Sep 2021 10:33:46 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4382.eurprd04.prod.outlook.com (2603:10a6:803:73::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17; Thu, 2 Sep
 2021 08:33:45 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4478.021; Thu, 2 Sep 2021
 08:33:45 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR02CA0213.eurprd02.prod.outlook.com (2603:10a6:20b:28f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19 via Frontend
 Transport; Thu, 2 Sep 2021 08:33:45 +0000
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
X-Inumbo-ID: 7e10e197-0bc8-11ec-ae46-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1630571627;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4Vo4Dkwt5tDPO7OINdISKIs97Cf1OIMtewg4ko0cXdk=;
	b=nN9SvvOIay6vC30EvNHJtrgaqAJUmMe2KpBr8+d+DbjQ80RtRAeBbokhnvLMK7omu6yIJZ
	gH2rBnJ/owZXsdJC5rmFx/R5jzJ0BZAMnEeWSMDJ/5D/RoxM+LgTutZF2dxhYDKMqE1+F3
	4Ky64GnFDn7C4LBQ+JvyUlZnxNBByWE=
X-MC-Unique: U9UFGGm3PHCgDY-C_PZclA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cJCmyBG9TXdvHXI8t+c3lNnbSqceaqc/oOMmaeofSybpK6E/5MjKHD2pdmGbWfOXAtECd2yY6lh0x1XnnrIVjqpuVaZa6W3iiI+sjf35WBRrxRFTO8ZmqHb9D9YMngnamdvJgXIxgoyEauGVpuvcK+eqgNUX2mFQb/JZO33gKuXlGvQqy0Lyx50iBjHiKenyXSnBd8QKR60sbV4Uv/SgimXVvCyj/SiIKnbAC59sL/Zmjo1X0BgRJp6LGyo/GD9o0AeAx61hkMXo9hHvQDmikiTd/oUlXNfTH6jjRAbzl2MAtcudNTH8jrid/0hWKqjaBdg0kRCKSOx6lKkkO/Oecw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Vo4Dkwt5tDPO7OINdISKIs97Cf1OIMtewg4ko0cXdk=;
 b=YkvDIDmpb4098GeRj2v/7Ht7iK4JAghUIsJipMxpDiFxVpPhc4z0XEhYJq3Le/JSsQ9ojRYweSH7ymUa6MT2UZkFeXKdxeky/6g2PEjwjJUanhUvIUBROrM9/ORs3mIh4da0Db28x85gM66mUOODF0vG/lBbE1iRaHiSbUa2as9pAVPe+1gOUgkJknp4tLDKqIxf9ZFl+7vksZluI0Q1SgblexiJNwlMkgeF64bopcbzNCSsH5blMXZ16O8s7lA0Txh+QNEtj5jP0AQ2t5SIG+X4g5yg+2vDhC3gLI24dX0mh1rKA60HtjHOavHvgLYVwMie116I3O91Vn74M/MQgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: [PATCH v2 3/6] x86/PVH: improve Dom0 memory size calculation
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <5972ce4c-bdb0-6d07-afad-cf4dd5615488@suse.com>
Message-ID: <98d4f692-5287-fe40-c8b7-4d8bea933d50@suse.com>
Date: Thu, 2 Sep 2021 10:33:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <5972ce4c-bdb0-6d07-afad-cf4dd5615488@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR02CA0213.eurprd02.prod.outlook.com
 (2603:10a6:20b:28f::20) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 526246b0-1ff0-4e2c-3d5e-08d96dec60d9
X-MS-TrafficTypeDiagnostic: VI1PR04MB4382:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4382D361F0ECF521DB20CB9CB3CE9@VI1PR04MB4382.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2276;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PLhfQ33scBgxDMfhItDtpr+1CdlEEg74uAtdMIiLxDFiO5dqJGnF29DzuukX/pXEqhjKPVuAQ6Ec94oFLHBUFFINr30hGL6dNDpmJYsr5XQB4rykjrLAWv13uwivMXcqsJo2pWPIT3QYySqGTKQahuTetOGCADZwokMc4qGpMtAh2Nf1NtzSQVlJ5V0M1zwvzmQz2ZGUWrCYbn3Y3+mPnyMy4GiWv6/CKnqo60GdjaptkSKfcv/V8Sgel/ZPUzxsjnSxUT4uw+guVg78mHaT8+PcYdi4Gm9EWEs4WWFjVKg+L/iRfQ24O9pEdP3MeHy3F47rPHGHU9pJUxmK9AV3rlukeHPkwW789r+8koQHMJZhbqHtfaiObLJs//B3HyD2vzIQONy2xjt3ni45KDug4ayqsCn9YeRRdVFKDluPJoK8x5qrzFiPUMqpcxFdpdG0CtPmn3RUd1c6n8unYHRGDFsNrnkgEBcuesw7jZr2JEXp9rIDlDvil8xdW0D71gGekLdvu2D/d/1dlSvtIe35YXucwMxMpkXpF7mIVmh5lkkGazMNQ2CTwZ835IxQKp5Of3z90YA/jrqCUgktgk9kpVAWdp5nQsC22WtD0PPX+wcd4Gp9vWDXo3HymetIswAd1+eyQsgdujNew0B8VnBnbf78ZSsSORtbASPJv/5f8hr+ucpfjcqBLHhuK/Uqj0hNmJhtQYU3WiRjvXJUQ14N/qZRzylNG14n/zLfRPw6rBpXOw61rNO/hlMKoVZ99JvQ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(136003)(366004)(396003)(376002)(346002)(31696002)(66476007)(2906002)(186003)(66946007)(38100700002)(26005)(66556008)(5660300002)(478600001)(4326008)(31686004)(36756003)(8676002)(6486002)(316002)(16576012)(6916009)(8936002)(54906003)(956004)(2616005)(83380400001)(86362001)(25903002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WG1rVUdOZHRHYlc4TTBiZHBNSkIzVGsxWk9ONlVwdUpneGttSi9HemJKbVY2?=
 =?utf-8?B?OXVqSVRsVGpzTHQ4aElpR1Rhbnp0QUtTa0FJK0xlN0UvK3JvQUh4eCtCb2gy?=
 =?utf-8?B?SkJFdmxia2Z6R3lvMlR0dy96VFdRaVBVbUpLZ21uYmNVM29DTUNZRmZoWDBK?=
 =?utf-8?B?MStleWhaTFFpTUhOY2duUmllUWlyd1orQzdYQm9LblRaZW9vLzQ5WVJ1dStQ?=
 =?utf-8?B?MWNkSTlIUERIbGswblBTSFNGeFpzbnhnQUt1VGV2T1VpYzR6VkVITGkrejdY?=
 =?utf-8?B?d3I2STJyMS95Y0lZUFVmZENqVVlrUkI5TXh0TmZkaTRmdkJYMEoxRkRSUEVw?=
 =?utf-8?B?aGl3UndrUnJ4NTZtQWVKTjA4YWlJcFBrMnZKYXBDVGF5QXlpMVF1ZlloemZI?=
 =?utf-8?B?Tlgxa3Y5SzVVVmhzb08xMzZIY3Z2ZDVERDU5VmRWSU1Gd1ArZTRQTWthejlp?=
 =?utf-8?B?ZzM0TVhkYnNSMnl2bzZuMWFyM0pER3EwSzJwY2NyT1RTUEczaUpUVUs1VytQ?=
 =?utf-8?B?aitadmJKNWZ3cStjTjBEalFJVDg0clIyV0RDcVVRUWlpdVEraGJEaHUrb3Zq?=
 =?utf-8?B?NlBMcGxJZysyMkJMelJoZVQwM2pVSkVvSUI5V0o3b0hnbGZLWlZ2anpmaHdr?=
 =?utf-8?B?UWpqaitmNGJNTHZBbkMxbFRDUUh4M2tyeVY2S3l3aEZ0TXJnZzZjNUc1elRw?=
 =?utf-8?B?YiswSWFvbGpMekRqUUNNeVllR0l6RXpaakYyNTZvc0F2QVIzWEdKQ20yeWs0?=
 =?utf-8?B?MEFqMS9YZWJreU1uS001L0NMMFZ4THpsRHFOTnRaMjV0MEwwU3FyTGFNalZN?=
 =?utf-8?B?a2ZZV3BPUUtMeUlZbVdrc3dJREdYM0pVNDRKZ09HTWQyTDlhWFFFUHVsNnEv?=
 =?utf-8?B?ckEvbWtobjB2ZE81U3Q4M1BVZjgxVHNDSk9UWFpteTVUVkpPSk9QZ0lqTk9W?=
 =?utf-8?B?QzZwcXUxU1RJSWR5OG1MSU9LNnhyeDFDL21ZT3NncHl2d0RGaVB2VFQzOFhv?=
 =?utf-8?B?blNVZTV1a0RzaG9RUjhnK1MrZkRoZ2FiUkg5a0craktHWUdLaGhUY0tFekJ0?=
 =?utf-8?B?eFdrZmlZOXdIYVQxL0krUUZnREtySUdPNnNobi9tSEYwbUZvazkyMVJzYUhr?=
 =?utf-8?B?V00zek9SbDRQc0p5aWdkaUtpaUppWmpVN3BBdjBhdS9lUktDUms5SjVONXFS?=
 =?utf-8?B?VXZoYjR6NWhwSGhSUGNVUFBRdVkzU2w2RjRPa1Y5blQ1Ujk2Y0tkSk9FT00z?=
 =?utf-8?B?czUyMit4eUdNQll0M3Vjb1A4NDBxdzVYMnNJUEpCRk9lUTdmWHEwOTRNdlpm?=
 =?utf-8?B?dDRiMnpERjRkb2QzY3lrYUNkYWdpcUxvNkVSV0JXcXFONHVFUkUzYXIxRHJY?=
 =?utf-8?B?b1VsaXYxdkFCOXNqQjRzdGdGV0VYbDUrUDJjK2ZRcU5yczR1VWRvWDA0QWdP?=
 =?utf-8?B?NEo3VmxSTW00ckFkbkRkVjZLMy93YVRPMFJtYVo1QWUzK1pCZHlSZWtKMVkz?=
 =?utf-8?B?VUtpUXF4c3VIUzZ2S1lNd25abkc3TTdlMU84SS9EU3ZWS2tJYzg0VGlXWTA3?=
 =?utf-8?B?RER6TTd5K292NTkvcWhnYkRHNzdqYmtTdTFnMkkxWkdsdkt4N0NjYlltaDFE?=
 =?utf-8?B?WTJQVnJGQUpUZ1IwWGFXb2dLTFZ3RVVNUExKenozRGJuT04veHV0aURvQ3Nw?=
 =?utf-8?B?d0laK0tEam5qN3g1b3kzc2xBQXVOakNxaWREQlBQYzZZSGJKdTRaSlgxcEhm?=
 =?utf-8?Q?MKIvYa6UBm20vqyImMoTq8mRrwaWX2ePzIu1fP3?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 526246b0-1ff0-4e2c-3d5e-08d96dec60d9
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2021 08:33:45.5974
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F1EGcA3cNjCnedJ3cetZGVH+d9QpKSas/7Uwo/r0EmOXbFG3P20VITadmjfLNd8Luy8EWmK1W3h7ayY3YYxRdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4382

Assuming that the accounting for IOMMU page tables will also take care
of the P2M needs was wrong: dom0_paging_pages() can determine a far
higher value, high enough for the system to run out of memory while
setting up Dom0. Hence in the case of shared page tables the larger of
the two values needs to be used (without shared page tables the sum of
both continues to be applicable).

While there also account for two further aspects in the PV case: With
"iommu=dom0-passthrough" no IOMMU page tables would get allocated, so
none need accounting for. And if shadow mode is to be enabled, setting
aside a suitable amount for the P2M pool to get populated is also
necessary (i.e. similar to the non-shared-page-tables case of PVH).

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/dom0_build.c
+++ b/xen/arch/x86/dom0_build.c
@@ -318,7 +318,7 @@ unsigned long __init dom0_compute_nr_pag
     struct domain *d, struct elf_dom_parms *parms, unsigned long initrd_len)
 {
     nodeid_t node;
-    unsigned long avail = 0, nr_pages, min_pages, max_pages;
+    unsigned long avail = 0, nr_pages, min_pages, max_pages, iommu_pages = 0;
     bool need_paging;
 
     /* The ordering of operands is to work around a clang5 issue. */
@@ -337,18 +337,23 @@ unsigned long __init dom0_compute_nr_pag
         avail -= d->max_vcpus - 1;
 
     /* Reserve memory for iommu_dom0_init() (rough estimate). */
-    if ( is_iommu_enabled(d) )
+    if ( is_iommu_enabled(d) && !iommu_hwdom_passthrough )
     {
         unsigned int s;
 
         for ( s = 9; s < BITS_PER_LONG; s += 9 )
-            avail -= max_pdx >> s;
+            iommu_pages += max_pdx >> s;
+
+        avail -= iommu_pages;
     }
 
-    need_paging = is_hvm_domain(d) &&
-        (!iommu_use_hap_pt(d) || !paging_mode_hap(d));
+    need_paging = is_hvm_domain(d)
+                  ? !iommu_use_hap_pt(d) || !paging_mode_hap(d)
+                  : opt_dom0_shadow;
     for ( ; ; need_paging = false )
     {
+        unsigned long paging_pages;
+
         nr_pages = get_memsize(&dom0_size, avail);
         min_pages = get_memsize(&dom0_min_size, avail);
         max_pages = get_memsize(&dom0_max_size, avail);
@@ -377,11 +382,20 @@ unsigned long __init dom0_compute_nr_pag
         nr_pages = min(nr_pages, max_pages);
         nr_pages = min(nr_pages, avail);
 
-        if ( !need_paging )
-            break;
+        paging_pages = paging_mode_enabled(d) || need_paging
+                       ? dom0_paging_pages(d, nr_pages) : 0;
 
         /* Reserve memory for shadow or HAP. */
-        avail -= dom0_paging_pages(d, nr_pages);
+        if ( !need_paging )
+        {
+            if ( paging_pages <= iommu_pages )
+                break;
+
+            avail -= paging_pages - iommu_pages;
+        }
+        else
+            avail -= paging_pages;
+        iommu_pages = paging_pages;
     }
 
     if ( is_pv_domain(d) &&


