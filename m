Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF334D1BA8
	for <lists+xen-devel@lfdr.de>; Tue,  8 Mar 2022 16:27:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.287093.486909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRbjv-0001ET-Mh; Tue, 08 Mar 2022 15:27:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 287093.486909; Tue, 08 Mar 2022 15:27:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRbjv-0001BJ-Ij; Tue, 08 Mar 2022 15:27:07 +0000
Received: by outflank-mailman (input) for mailman id 287093;
 Tue, 08 Mar 2022 15:27:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KW+D=TT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nRbju-0001B7-PF
 for xen-devel@lists.xenproject.org; Tue, 08 Mar 2022 15:27:06 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 35d3bb5c-9ef4-11ec-8eba-a37418f5ba1a;
 Tue, 08 Mar 2022 16:27:05 +0100 (CET)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2052.outbound.protection.outlook.com [104.47.2.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-13-39R90pkVMt-CHVmX-VWmMw-1; Tue, 08 Mar 2022 16:27:04 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM6PR04MB4792.eurprd04.prod.outlook.com (2603:10a6:20b:2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.19; Tue, 8 Mar
 2022 15:27:02 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.027; Tue, 8 Mar 2022
 15:27:01 +0000
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
X-Inumbo-ID: 35d3bb5c-9ef4-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646753225;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=bi41F84unF7k8jt/I9MJYkNADDQudK8erSyx/4BpEpI=;
	b=L4kyAodO7512kEBY64qZXeO6cwAWYm+iQqwsGOBKrZuAQ0F5b8WJwuStou1JM8sK6EG4ZQ
	r6Vtgww/MiOcG7nBpPHcve3O7z7ALy5z44I43n+4QABuM0yrrXKVA33R3SVrDV2iRjrFfv
	1h2682qK7D5yI1C1Mx69z8O4hvCrSoU=
X-MC-Unique: 39R90pkVMt-CHVmX-VWmMw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VsgK1CJulYFy30pduwbL/qFCWgLYSse7cegho/cj6rDfVf/qKFS6LJWrd4rJRNyAbrIC08VVu/iYeVJgRUpXgAIxku/L7Vhb50LHQCKWwCnhTp0GWutvLti1DTEVWI646GVmhdfxIAdAa/p1GuhCKFRDCVHQQ2y5cAQSUvQpFqhv+Eqc4S3k7ijxe3mGHeg586Zstf+sUbcwUXLFj9S3EMq+7uITtaJJExB2ZPKwPtKl8wKA0a0P/g3cUIg9moovQZeWNpyC39H2eNBVzYEuuM2QdDmhvyKXRuFu6fOzm5kpC0sGJoB9WXhpUP6QmzL6WYhlfwnpUJUcahJrbpnSVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bi41F84unF7k8jt/I9MJYkNADDQudK8erSyx/4BpEpI=;
 b=eyaeXPppK0oph3OgreKbwOOQp2DV5hIum29LY06FYoUGzNxDrAC23U9tOTh0PxzI+WNRyZg9I9r4uWf2IED/u9vjoMvP8TDpqTFv9azaKJGJ7Si1AqMLiwCTugXGfWnPZZUYOyC/ZEYtVWSSpd3uDQpAgx7X+rpyXGf5hkowKQ9QusmTiYafV2J25qtI5WUu/rJfsQA2tO3Oee7JtFSgWcAb2UQDG9BpbIF0eEpLqg924J4ULg1S0J+QdnhZW75NSM48bAC3A1mpv8HYygyLoYSHifCjQLlaqKxL+p2dYN9a8QWjYO+gjVfFSD0hFrcECgjQ0WncB0BnFoOGWOdZAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c71ac406-15a9-6291-d670-0f965a59bebf@suse.com>
Date: Tue, 8 Mar 2022 16:27:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 4.16] VT-d: drop undue address-of from
 check_cleanup_domid_map()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FRYP281CA0007.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::17)
 To VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 30fd100e-076c-4de5-a96f-08da011817d6
X-MS-TrafficTypeDiagnostic: AM6PR04MB4792:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB479277BA20CB5A035CFB4ED7B3099@AM6PR04MB4792.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5Rnmbr2UR7wYE38pPGTdwFCIdA/yhkhNbBEY0ob18nUf8wjxaA/rNytA0F8hzyUpwKJUkkfy1DCBdgFJqPMeAyzw+mSrEDZH2cfLqLhvkqkFrC5B1n+FHowKR4lIeWHuhSBUI9HbAsp14J+E8VupM5mSuQAFFf4zh6nyIttH48syWlvcskQNHIArdpeUvDw+ZNTbxP8cYqQFAO85s/a+qgFzAejwtUZ23AVyNkatteUAtr9UgJb9Rj8yIC6avQJoQ+9efChZofESJO8xxg/eIwq33+7LxvR3e8TsDiRH5o/iIc1sL4aH8i5bypQC1q4U2p1YPdaVpk03ZTUc3ITyxn+xVX9JTZ7OkVoTYAlRw1k6AeKlKUycnefVjuh9z1wJQkB1O0+jLMMQB7k/ATVz6sC0KiwHNqHsyhu48rtAJBuC+9RLP4YMuR/by3+QcPybExz6QZ73QQ3ZM14eQIB65ClF0o0hg3Jk9B4dht2CIOz8XbstJ+j6fftmo2LeKyNDGc+IvAELCtEAalLzaUfSgdlKPQiMhyqJIEM3L7LHv2CQe6f7FTHnw4fA/M2f93DLRPdKw2ZKoi/v34c7frxZeV7Eiq/3XzMqqg67Gk/71Vc4hJAlO8l7Q5v8fnDANKyAZKtn5JurS7QvgJ/S1NzQonsKcl8FGRUdRhwVgyODRCS9k+jHF8yIsPrOxBdVxbSxv6ij54WJ+Wl7DEF6FN0NjfYfA1fcMkSJwMvNvBKcdng=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(26005)(186003)(6512007)(2906002)(4744005)(36756003)(2616005)(38100700002)(31696002)(86362001)(316002)(6506007)(8676002)(4326008)(6916009)(54906003)(66946007)(66556008)(66476007)(508600001)(31686004)(5660300002)(8936002)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZExnMFh6blpmbDVhME9YR0JrV240S3dQMjVybTNWd1dUdFVuQmhKWTJyRjRp?=
 =?utf-8?B?SGNnWDZYb2x6NlpvcytHdUJaa3lnbCs1eFZGWUdSVjlSREUxYlhvc2N4Q01L?=
 =?utf-8?B?Wk1jMUE3Qkw5VGF0UGFQZWNRK21IbSszUUEvVGdLd0xpNG9FSUtGY2V2L3Vl?=
 =?utf-8?B?dDFERnY0ZWNONHFnQkdOUXlHN09FQXFEeGc0QWo5QlVkZkp4YVEzNjdUMTRP?=
 =?utf-8?B?YTJLckJkSjcraXRMeWdEVEJ2Q25JT1JsTnZkWm5VazkwNVRHbzYyZ1Z6aFZC?=
 =?utf-8?B?ZDJabUM5MHgvRWkrVDN5RlZqZEowcEd4R0NUaEhDRWpvK1JwMVNHN0NJTjA3?=
 =?utf-8?B?UFF4c0s0TTNZT2NxN1hrQ2dxbm1uaEV0RXM5ZUZxdHNDdXpjTTd4T1hPV2dE?=
 =?utf-8?B?NGR6L2d2c0NCTVhJb3poN013MXByaWJQOGtjaTEzTnkwU3lpc250Z1dhdzJt?=
 =?utf-8?B?dngyRHUvVVVtVVNBa2p6dU82V1IyZGNLcnBVc0VXK3BQaWY5SGZtd2drMm5L?=
 =?utf-8?B?RlJjNTJyTTJDQXFrKzNteitJeHljeVAvTjhJTVU0MTUvTFhBS1N3V1l2MlV4?=
 =?utf-8?B?OFN4cDN4S3ovVVBXOFdvQ3g3L2NxRkVFbzYyc0QyOS9rUndxR080akVlUHh0?=
 =?utf-8?B?WnhvcmlNVmw2aHlaS3k4S2dKbnh5Wkl3dGREV2F4L0lmcFY4QU5aUVZZNStF?=
 =?utf-8?B?VGI0aXE0eHVJTjhzeGoyVkZtWjdXY1dzdStHenpNT1Yva2toTi9OMGMvS2hU?=
 =?utf-8?B?SDJxUVcxUnptNkxJK0ZzZko0Wi9RM3BYNHRuSkkxVUloVk1YWU1yRGRxNDdy?=
 =?utf-8?B?MkQ3OTdkNWJVMVM2QTcvTXZxUUFPTjRnMjI3dGNZejg5VW1RMUlJRkZDNStP?=
 =?utf-8?B?VzJJUWN0YWg0UFN6c2lZS2RIWW5JK0wvdlorbjBaM2l1cXM5eXZoQnM4aFJC?=
 =?utf-8?B?UUFQL2VIQ3FhNWhhZlBvL0trZmlrSXhJWHVkOVRwdVJBTnRPdkptVEV5VEZk?=
 =?utf-8?B?QzByM0xrbkg1em9Lc3ZVUHJBSVhDVXBhY2x3MzlCOHZ6UUxRcEdlMTVNN0pR?=
 =?utf-8?B?UGUxNm9zaUhsekVqN05IOTkzUmVGdjZ5VEdWcE52c0h3VmFta1NGY2cxc2ZD?=
 =?utf-8?B?UUZzbGI2T3kzYnZhcnZDKzNiVEhBU25jdFFxR3Fsek5BemZiYVB2cksvZlUw?=
 =?utf-8?B?OERmNCsyWkxONmJaNEsxVTFKVVNiaUYrUGhPUlVCZGhPa25MMmV1c2tkaElj?=
 =?utf-8?B?WjBucTRZbkZHWFN0ckZTYkdwMmpDa3FGcm5pTlJEb0hRdnRNb25oN2VWTm9B?=
 =?utf-8?B?V3dEK0ltV0RTWEc1bTlnb2x6Q3FDZkdsd2tIb01Oa1hTanA3cW1PdGE1VS9h?=
 =?utf-8?B?RDFqY25tbEkwTG9tNXNxK1h1SE5lTzJXdjU5V1VkTTVITUpSTk1iRVlCSVJa?=
 =?utf-8?B?WGFnemlPTkU3ZGFZTldMdEF2YnRSa0dmRCtNR1pJTlpCdEswbkt2MWNVb3FT?=
 =?utf-8?B?NkhWZkNJc0xlZitibGh2S21ncnRGTTFwVVY3VDFwTEFUZGRMUE4zc0Z1Vk5L?=
 =?utf-8?B?NHpVaHViN3g1RnRNT293U0toMG9SUi9KY0kvTCtUc3FLWlc1K1FGN2x4V2JW?=
 =?utf-8?B?U2d3elVJdlYzSVllbmhjUDI5R1VMbHpTSWNYa2lsNExrU2s1MGZ2RGlyalVN?=
 =?utf-8?B?YURsNlc0Z2x2Y3I1NVBnMm50ajdENzhsc21ZZC9LY0ZSczEwUWdTVzNxNVpB?=
 =?utf-8?B?WnFIYmlEQ2RSSS90MGpiYVVSL2pzWWdxcmhaMWxSa1lXMnBqcDM4Q0xHZnFO?=
 =?utf-8?B?NWdMVU1ZeExkMkd5ZHJ5MzBTSmZXS1Rnb0dzN2NKWnBaTHl6c05Vb2lLVzE4?=
 =?utf-8?B?ZUZCUlVZeHBHRTFTMjVlUC9VRUZNZXVBYVV6dTBaUENoa1U5M1ptUVlYTVB1?=
 =?utf-8?B?ZVdsNVVrcWlzaEJCejl5YzAxRFJlUUVGZXBCYUhHeStkcitURGxZRW1STks5?=
 =?utf-8?B?SkJYamJRUjU5bnpDbkV4ZklpOEJLc1gwT1ZHWUphWXRMczNSSmFkb3RsZWZ5?=
 =?utf-8?B?QnAvK3ZWYWgycFYzRmlLSk5KUDVKRitoWTFqckZlODdCeWtQenhhMmJqeEpT?=
 =?utf-8?B?a1FWdEJMMTd1R2NvdTljbGFyb1puNTAzUmpadFFWM1pIbVFHVU9ibGVWa3VV?=
 =?utf-8?Q?yctygHdwbnu2CXRvjN9utd4=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30fd100e-076c-4de5-a96f-08da011817d6
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2022 15:27:01.8383
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P8C8cm5NovRdtwJJZm6sdRWivnL4VEa5ZlOlqPTKbkHGy/8FffWb44ehu0CeEhNc2pKUi6jCXY8MALcHMm+2/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4792

For an unknown reason I added back the operator while backporting,
despite 4.16 having c06e3d810314 ("VT-d: per-domain IOMMU bitmap needs
to have dynamic size"). I can only assume that I mistakenly took the
4.15 backport as basis and/or reference.

Fixes: fa45f6b5560e ("VT-d: split domid map cleanup check into a function")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -197,7 +197,7 @@ static void check_cleanup_domid_map(stru
 
     if ( !found )
     {
-        clear_bit(iommu->index, &dom_iommu(d)->arch.vtd.iommu_bitmap);
+        clear_bit(iommu->index, dom_iommu(d)->arch.vtd.iommu_bitmap);
         cleanup_domid_map(d, iommu);
     }
 }


