Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE3A3B5D52
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jun 2021 13:47:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.147800.272805 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lxpjM-0002OK-Py; Mon, 28 Jun 2021 11:47:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 147800.272805; Mon, 28 Jun 2021 11:47:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lxpjM-0002MJ-MJ; Mon, 28 Jun 2021 11:47:12 +0000
Received: by outflank-mailman (input) for mailman id 147800;
 Mon, 28 Jun 2021 11:47:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=T4Tg=LW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lxpjL-0002MD-0P
 for xen-devel@lists.xenproject.org; Mon, 28 Jun 2021 11:47:11 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2bfa1b81-0a13-4c20-8bb5-1e9b6902297f;
 Mon, 28 Jun 2021 11:47:09 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2053.outbound.protection.outlook.com [104.47.12.53]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-5-mzakSNy3OhOXQuOOJs3VSQ-1;
 Mon, 28 Jun 2021 13:47:07 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6382.eurprd04.prod.outlook.com (2603:10a6:803:122::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Mon, 28 Jun
 2021 11:47:05 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4264.026; Mon, 28 Jun 2021
 11:47:05 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0067.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4b::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.12 via Frontend Transport; Mon, 28 Jun 2021 11:47:04 +0000
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
X-Inumbo-ID: 2bfa1b81-0a13-4c20-8bb5-1e9b6902297f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1624880828;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=pchRJ7GBXfvuj3yvXkmACQFz+EgDnbCG1su6IHj8H1Y=;
	b=MhbcZV/GhW+bDCE5lT3weHhj5LNDHFId8oYNCdee8YuV6vHtSuS2Qpvjp/D4Pkhg5RNQ6J
	eAWZPSgRUM68zJFbaM9z3yFTdWz5c49B0L5943UiqI15Ig+XZ/fyY1bY1B3rvKz0mXrImW
	FT3GDzy+pSw4ITGG6H/5ewgxKgHIteQ=
X-MC-Unique: mzakSNy3OhOXQuOOJs3VSQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KwJzbxCRMpew94cYNpVb3dz0JZYNZLcqkGAAN92Q5FdQP1RjfBbph/HmdtJf5Y6nv4Is9yutQNL/Pt77KSa6qwNyVt81Yv578rlFTT5b+0RJo2Su7Bfwz48d31I9yCwkRENBBbZu7LrUfAagsMW8r9m02Y/X0pbPAvj0ZW18HlMDahWRgEjrbjtbt7sBVS525/nX7WKb8UGQ10N7cwGHw47RzlYr3LN8a+38vjjj1HJlnGbxhVzVtlE72qLfa2w+KoEpse5FqXskKGrVjJBrYXr9DspQbv+REoCFhpaJiVN7KE3ZDn27EgTQZB97RR9C/9ayHifu8b1WZZtr1NknmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pchRJ7GBXfvuj3yvXkmACQFz+EgDnbCG1su6IHj8H1Y=;
 b=RPxyrh+nPn0rtEFpm6k4hp8drkFUkaD7W0h/BFNddh2yVw6HpE4Akn7ilYalbtXAnlBh9i/OmQxy0REZjlotS9f7CrWJeuLn3bQFI6IznZxIdR/lmFMwr29HTZNiNYOrW2f2/gB4bvpTJfpZS/MxtwtL4W3gc97H9L8lILbfc1WZ843bCNEmEr+CZsEVdaKkfSOwqM+94tNuRF/KcGcPoCLf8FqnsJ19qFLQDUv2x9v8KaTCQ0eiOCTGzqnIE+A/SvHskU+OV9ca/zOjlmT4Q/jMnK0fsDQ17Q2Y7cV7pEfaw5TgNhAHC+XkJ40IrzFfNsns3bMU8oA7O9beQ1GKdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] libxl/x86: check return value of SHADOW_OP_SET_ALLOCATION
 domctl
Message-ID: <5d2bb2cf-8c0c-7300-c895-75bef0e50817@suse.com>
Date: Mon, 28 Jun 2021 13:47:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: FR3P281CA0067.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::14) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 05ccd0d7-a7e6-4273-5311-08d93a2a7392
X-MS-TrafficTypeDiagnostic: VE1PR04MB6382:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB63820CE6DF11FB8F67C843A5B3039@VE1PR04MB6382.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vuATSfMKwMh2tY8UwogTko1GrHp93S4yc+vvAEHb2CF4MX2EtwjELC/mx7cprXV3P3HC+4PnzDnWXMdyvR4YrTUwigxUJ7Fvvh56l9Be8Rq9M0f33gMSygn9uWAESseLVXpNxYsCJ5+SqbzIB5WolAFrxExDmmHUZ7O4NhvcDnvixBbXO+yXNOJMXK7rO1x/5u7PRrB7cnpbElH6D0Z5UwjZsOo21m/MGp2NNgfdxjQXzaoMA+nla1mUBdWfRA5RYumboAl+hJr+0Hlthfj7rIWl6daPMu2WLFyQCuKGGy8PX5XyaYu269adZdWbZxcW+B0nz05okxAtRaGq4swIwW+x4gXy2nadQVkK2Loug6OpJ00W343+9BgBc8ombRH302Mofr0YEXvR6bIQs+aSMWzyytMIDgOza3GNlpHsZLojUwpl6iYM3Cm9tllPDqlzatuOze8KAerHjSh2QyQgvPUff8SeP5d5mHXUq3YIF0XzS7OF6XeZlSwaA62rEI+IDoZD9yFjgeENp0UI8AQSdBrIRttcze61mCsjBxaMfG4ROrL3YqbFU3WG3n55a9Pnv/qWXDer88Z15g+BP8X4gt9WHLrQJyg1SfH9fa1gMyCXqr2HcPI2HMj9lDA9RhHA7Ks4Z4RlWkBloq8GShLR1E+JuccX4Fu9s40zR75SMC1kTX1xCzdE9+tfywADUHma
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(396003)(136003)(39860400002)(346002)(376002)(6486002)(8676002)(316002)(16576012)(54906003)(31686004)(8936002)(4326008)(6916009)(26005)(186003)(956004)(2616005)(16526019)(478600001)(66556008)(5660300002)(66946007)(36756003)(66476007)(83380400001)(31696002)(38100700002)(2906002)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aVV5L3VkVVpuaE9rZE5Md1ljVlF6VWlPaXdYanY3WGo1bTdtcnR5aGFicS9j?=
 =?utf-8?B?UnBFV3lyZmhDaWhhaHc3ZDJrM0F5R2RLdjJuVGRDZk5wdTJ0bkNNdVlUWGFi?=
 =?utf-8?B?Z0RIOFVDbHNrcHErQ1dvc05XM0hJZGg0N2xBanZQU1BiblRCSHBVbnlrRlJS?=
 =?utf-8?B?a2w5Q0lWWkhIdVEvczZnY3FFMG9WbU93L09hRnpuNE9XK1lhTnFWT1BESkVh?=
 =?utf-8?B?dGd4MC9FS1JCTVh6SHFCNVNLOW1pWlN6UXNnV3pKR1ovSU5qenNPMlZoMzJt?=
 =?utf-8?B?WTVlVDEvc2RibGlINEhHYjMyMXMydDN5NXh5dGhtMGx3ejdyUEl0U25jZ25X?=
 =?utf-8?B?ZW9IREVUKzFLYlovRkZmblRjcDBBOG9QQklFWWxqVUZBV1Rxc2xtMEQ3M092?=
 =?utf-8?B?OC9tRTN6MFlvWGZabnBORnZlWHdaQ2dJLzl1ZlFXMkVEbmdvaVNJaE5jendl?=
 =?utf-8?B?OE1ydEdEVnpLc3lwZk1VSnRoT2pUNllUMThNOFQzVEFaMklWdVBpQkV6Tk1r?=
 =?utf-8?B?QTlMZ1ZkczdMMkZXZ21KajM0Qmx1TklmZE9EYUprbjlSM29PNWJ4VGdsLzhB?=
 =?utf-8?B?ZlgrYUpHODk1UFdlMEI1dTJtSVgyZ0xvSVRBZXJEQnZPdnVZcFQ4VFp3TjlX?=
 =?utf-8?B?bHMzYVJ4cS9oU09BcE9mSkExcWo2TGNTOE1oVmM0QTRheTR3czJSZVhsbUN2?=
 =?utf-8?B?M3lGTlgzSFRodlprWUVYWi9SOC91MVFtQmJLaXZTb0F0RWx3YWxLOUxUaXBr?=
 =?utf-8?B?eFNqNjRlckRXai9sdHRmZlh4T0tBMHJpZk8zbWN6MTY1Uk5SY2UyMFFmQ050?=
 =?utf-8?B?b1NjTEVycGhiRzhSUXNCamZ2NVk3YzI0dEpUQTd1b05hN250UTBNcXVLemlK?=
 =?utf-8?B?SGhORDNsY0NsOXJLNFBjMWxQNmNpZlh2TVNmeE5oTmRyd2g0QWZSZVVVZlhm?=
 =?utf-8?B?ZXRwT2VyZXhvWlF5cTMrZndyUHdVZXkzS3RFZVhseWNsSXlRTXJzcm1FUGds?=
 =?utf-8?B?dzMxM05iN1dkRVNPbEwxeXVQeGxiOEVLLzVmeFMxN0JiL1JXalN6N2lITFpy?=
 =?utf-8?B?dVpCZFRZZUdXbzNyb29CM09vbVZuR1dCeWxhMnZmRWpFdm1XeW5LMkxQdGgw?=
 =?utf-8?B?bkVtTlhMVDRFNUNiMEdESFFuaDQrTmRTTGlSRlpqcFRuZnE5UXF5RDdWQjla?=
 =?utf-8?B?bUZUeFpqZXFCSWhKajl3UFRWUDUzUisxR1hRL3FuMEo4akoxbVhadzJqRjFG?=
 =?utf-8?B?NG9jdVYydXYzRXJDMEdCanZjdE02Vnl6S2xwSHhMWlpSd2R3SlVhMTRZT1hJ?=
 =?utf-8?B?NU9yaUZkZlRQdGlQYUY5bjZqT0lEdmFKMUxWeURnVFVGbjAwVityN21FQitm?=
 =?utf-8?B?MkwwbkZqb0dDc3pWckZrbHlvZEcxa2FmbVJ5YlVjL011T1pTQjluNVpaendL?=
 =?utf-8?B?eDRuZEVORFdRNTlaZjU1a3ByL1ZxWU1CZXVuVXZnOFZNUVlNR1JQNFpncU1L?=
 =?utf-8?B?bk5FVGlIM3pwQ3AyZFhJUnJXR09ZbWhtRjdhbXc1VDB0alNXTVg3ckY5eTBp?=
 =?utf-8?B?ZkRVdUlYU2hBS2dYMnEzUCtpdXdYR3Vsc3FIQWpsTG5iQkJGVmlkQzZtYXc3?=
 =?utf-8?B?eGRyMXJOUkIrb0V2TjNlb2ppVWFaL2YzWkhuZFZwbGdNMFBKQk1hSm1uYThv?=
 =?utf-8?B?cERhZmF3VVFkS2RVTS9KdStGdnRCUFJtVHZQUllmWUZlWjQyenNxODVXemdY?=
 =?utf-8?Q?P2fKhekRxF6brVMf49eFqj/Jo3hlr7zkhGx/ElF?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05ccd0d7-a7e6-4273-5311-08d93a2a7392
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2021 11:47:05.2552
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s1F0WvfmKaLg7RG8oLAy/aUAgMQ1HUjpW/dBnZNrf2YgnFNALbfhLwXhHTijcJ0OXtd5QKZQOzbT20qR8eO1TA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6382

The hypervisor may not have enough memory to satisfy the request.

Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Especially if the request was mostly fulfilled, guests may have done
fine despite the failure, so there is a risk of perceived regressions
here. But not checking the error at all was certainly wrong.

--- a/tools/libs/light/libxl_x86.c
+++ b/tools/libs/light/libxl_x86.c
@@ -531,8 +531,18 @@ int libxl__arch_domain_create(libxl__gc
     if (d_config->b_info.type != LIBXL_DOMAIN_TYPE_PV) {
         unsigned long shadow = DIV_ROUNDUP(d_config->b_info.shadow_memkb,
                                            1024);
-        xc_shadow_control(ctx->xch, domid, XEN_DOMCTL_SHADOW_OP_SET_ALLOCATION,
-                          NULL, 0, &shadow, 0, NULL);
+        int rc = xc_shadow_control(ctx->xch, domid,
+                                   XEN_DOMCTL_SHADOW_OP_SET_ALLOCATION,
+                                   NULL, 0, &shadow, 0, NULL);
+
+        if (rc) {
+            LOGED(ERROR, domid,
+                  "Failed to set %s allocation: %d (errno:%d)\n",
+                  libxl_defbool_val(d_config->c_info.hap) ? "HAP" : "shadow",
+                  rc, errno);
+            ret = ERROR_FAIL;
+            goto out;
+        }
     }
 
     if (d_config->c_info.type == LIBXL_DOMAIN_TYPE_PV &&


