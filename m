Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 190C3514A63
	for <lists+xen-devel@lfdr.de>; Fri, 29 Apr 2022 15:22:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.317290.536558 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkQYU-00029p-4F; Fri, 29 Apr 2022 13:21:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 317290.536558; Fri, 29 Apr 2022 13:21:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkQYU-00026Q-1B; Fri, 29 Apr 2022 13:21:06 +0000
Received: by outflank-mailman (input) for mailman id 317290;
 Fri, 29 Apr 2022 13:21:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iTs9=VH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nkQYT-00026K-7Z
 for xen-devel@lists.xenproject.org; Fri, 29 Apr 2022 13:21:05 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 37bbf62a-c7bf-11ec-a405-831a346695d4;
 Fri, 29 Apr 2022 15:21:03 +0200 (CEST)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2056.outbound.protection.outlook.com [104.47.6.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-32-ouXjSra1M7WTHTVbutst6g-1; Fri, 29 Apr 2022 15:21:01 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM6PR04MB5223.eurprd04.prod.outlook.com (2603:10a6:20b:3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.14; Fri, 29 Apr
 2022 13:20:59 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%8]) with mapi id 15.20.5206.013; Fri, 29 Apr 2022
 13:20:59 +0000
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
X-Inumbo-ID: 37bbf62a-c7bf-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651238462;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=7ZzJDH6f8FIiK74a5RGH7pg8PNMuStwl3xMqiFiX1TU=;
	b=HGqYJtJHzA43echm53PrircyQhNjc2TvWR2uNh3BPUIioXFG61nIBJll+FK6gx/rTGxEU8
	lTFgv/btFlqV7gVlrf9eUPBHABGVVrUSQqUWWTBe4ygxIHLYvhX0Gd0HxzydeUvijskwNZ
	2gnS81aIblNF/kNL6motdobZaV1opXU=
X-MC-Unique: ouXjSra1M7WTHTVbutst6g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PX1ffaPNRK1FY2CHsOsxhQnhq9KRAuuqr5Oiy+kS1DNAsRbwcHISqIhtKxBt1zApsmm9ocipgcp/mSEv9z9ph8nkc0SiLNF/gEjPCJuK3G+8UWbBgnizsepEvrHupEgal2S+4+N1b6mTKDpzsrfgix4+7ss9yMrbGSGoji1m3xK3t2k+9E15WmKhm5KTkMCBK/ztg/xalGNODaINcA1vVQuqrmqXW2hRHa0ScHVehYG0yWjjckRG458GCepGC2fj/N0IA2rgV3Y/LnNS9RkbXW9fSr+OlnQO/0QjE/J4Y6wr7RGM3hVWS1n5TA2UC2vKRqEQhZ3uMLf84BF+7NH5NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7ZzJDH6f8FIiK74a5RGH7pg8PNMuStwl3xMqiFiX1TU=;
 b=DCJZM5XhBDBTgamUX/1yL/sH2pSg/hs1/Ha3RRrTRX/nbgKv96W3SyJy0hRvE9nhecpe3gIIlRKVmLYJYz4bJQsiLzZ/cNvN5t6yeIjoqdR99YqJEkARIRPm9IW3nis5fcJG+ielv1nTP8RpF0jaocJG2z3SE4S0yO/H9B2oHV41ZEdnBNZn0Z1mmKEVsJCSkwrnrJgPgO2gXu/uTUmUdeab9Z6ReuhRoVyDZrPeBPpZyulojIWKnxa3p01/Oc9Ip4NIB/j/BrX4NHq+qqOk0nx33iROQIw5Y5KkCBJsWAmDVOFvO1uy6aJ2cPs/l34KHhBGgIlByC9LDP397/gR6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ad64e3c6-9f89-c0ea-05a9-cff995ac200f@suse.com>
Date: Fri, 29 Apr 2022 15:20:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 David Vrabel <dvrabel@cantab.net>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/mm: slightly relax TLB-flush-local check again
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR04CA0018.eurprd04.prod.outlook.com
 (2603:10a6:20b:92::31) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5ee6d385-f352-44c9-ba5b-08da29e319ee
X-MS-TrafficTypeDiagnostic: AM6PR04MB5223:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB5223C2F6060171F62AEF7309B3FC9@AM6PR04MB5223.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NIPYmRLCUCww0xKBIibWtF7p1zPWagotU+91lHEtAIDHiCyJNdsJ/zbM3chmcavI/hGlPRnYRbRXYb8D+xpRzsjEB3lqniLBzZxq0jnFqZKsxNr1ZJsF2LuXEb9tguLpBeZxy1FLelV+4cFzBt6cZ/u9kzFR8Wilmk7ZbOQ6J2Cl3ZpXVvdUOZuBlt3YwHFcHsidOmAreWshKwnMkZoLaTAB7ymlplLiv9UD/jwnEc9WxUwJBwEGnXcp5MvAZHxL2ByKyvECu+KmTE53x1/+OTdBn2YlnU+69VON5JoaN6TDdxJFtIUWrWV9L4baT82iaXnkSjADmFN5xpXGt1ZU7SMDD4TKNXdHal3QgJHf/gUQcdq3Ms7kGHJXW0S2pdzKQa3dX1it/XcNxhHM5kPQcD8ejJy9wHW645Ffm0iry4eESRPjkxunOeKC5BV4ZB7UB2VDUuMAkgwmNcE4X9HY5kbP3mY6GljqmQkipxaExQAddbB6XhOTG5tvqbop7p77MPVAymNuJunuT6c/GtoGYnn9eBFWkp0KqVgSw4lc2K6h+D9KbUIjd0ii7HdlKO8whqJ5oy6m4jpcRAmbpeaJAF0mjjDjUqtKj6khD3ZHkrnWpdmGGz+gPJw4Qu72ISssgm+Oi0zY7Cz5jI8Vav76R2Pwnd21lwgLFploDYUS3nLNl9gtLLVl4JlVIm4WTN+Oy3zI68Ir87y9FhUKmzBjguTu92966fU0bhU0Ik3KGpY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(86362001)(31696002)(26005)(6506007)(2906002)(6512007)(6486002)(8936002)(508600001)(38100700002)(36756003)(5660300002)(4326008)(83380400001)(8676002)(66556008)(66476007)(66946007)(31686004)(316002)(186003)(6916009)(54906003)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RTdTWXJsTHBwWldSQ1VUejVyc1Z1TEpaTTE0R3NMRXN6OXVWd2kwMU5GT2xI?=
 =?utf-8?B?dHdHRldTRlZrNThMckh1TWROYmRiMm5yb0dOYndzdFhsVFdPWndyQWE5ZGEv?=
 =?utf-8?B?RTA3Sm1nQmh5aGNDZVdXT2hmeEdHRTBha0JoeWZYREZDSXpmWFl6bXI4aXFL?=
 =?utf-8?B?cHhhYjV6eDBuc0w2UWF3d2o0UnkrbGxGV1FudjU1MVN5RkU1SmdGbmpYVUho?=
 =?utf-8?B?R2ZKZ3NYbHVHb29mYWRRWnhXZGV6Q2FuSlBlWFZlZG9OL0NnbkNtOEI0NS9L?=
 =?utf-8?B?engzbENaSk5HamFMWkVUdTlGaHpEMDVQeWtvN2UxcjltZnMySEMyM3drZFFO?=
 =?utf-8?B?V1UrclpnWDBvVXNVaHFJcW9LV1lmM2JoY0N0Z09GdThvZTF4eVRwUmhRWXJD?=
 =?utf-8?B?cnZXMHY3dVpkYUFidHFXTUJ5K0xvYkcwVy96MmtYY3N4MVl4Qk90VTBScnRG?=
 =?utf-8?B?ZWhha3ZsUHZBSEF6d2hXK2lNVG1yNHFHb214bEtvc2orM0NacnVVcklweXRn?=
 =?utf-8?B?ZDRmMDYraXVkYnVvNnhHQ3hBTHJpVGVhL0pOR0t4Y2xISXNUUGNHS0RGVW9i?=
 =?utf-8?B?SExhMjUySkFaZkVGeUxkZGxTSlRYYTVaMm91MFFlMTRRK1ZGZzZ3STQzQk1p?=
 =?utf-8?B?UC9DbjkzZHBDdkpxM3IwRGwwcytxRGZxTmxtTjNVK0UyU3dCNUtKZnNNVGFs?=
 =?utf-8?B?RmFKb1RmdjNYNUg0S0o5UityTHY4STh2aFRXWXZheHVRSEhBc2Qxd3duL0ZT?=
 =?utf-8?B?SUlPSzh0RFJqb2Z6L0dPTTdRSWUzS3pnZC9DL3VjUk9oN3UvQUZUcHhDdU5W?=
 =?utf-8?B?ZERIOWpaR1BzY1Q4TTFyeHZIQTI2SzN3eWJVbUVqWHBRampYcTZxejI5c2dq?=
 =?utf-8?B?S0RCbFpvQ2hXaDBmSWt1QVowbEp5QjJSOFJmV2pWSW5sR3NnU0kyK0NOYWlS?=
 =?utf-8?B?M3NYS0c1NlNvNEx5bDdnT0pRVXYxVThTR0MxZXNYM3JWdTI5ZElqSXQzNjlN?=
 =?utf-8?B?d04veDRKUkN6amVPOW5vQVhZOTZPS0RxaFFVVFIzbjByVlVtQnBJSjVrSzJz?=
 =?utf-8?B?emduaWxrUXdsbkRrSU41eWpMNFpWa0FnRHZBeEQ4MjJlSXBkNTZtc3dGWlVt?=
 =?utf-8?B?VkZFa1FGK2phUGdVcFgzNkhTbEdGbXd4cUs0cjRnNUd6bFNXSzZvak04QVNM?=
 =?utf-8?B?Z2prWWhFQVFRQU0rcm1iMzhmS3dUUStCYWlnSFpVRXd4cTMyb0hmVFhRNmZX?=
 =?utf-8?B?QlovRlQ4ZWxOVU5NZFlXTlZtc2l5QzY1ZUpqSUwyUTBwNHhJUU1sRFVtNUtO?=
 =?utf-8?B?VmlBbWdIVGkydlBWQ0F6eWw1blFiTEo5YWpqaGlOSEczSmxHYkxZaG5uTEgx?=
 =?utf-8?B?Q09XclpwVFNuMnlSYTZtdVJ6YmVPdEg3dGs3VlQ3TmtrWURuNkRVSHIxeDBu?=
 =?utf-8?B?bjhWcyt1R3U3Z202SThMbzRtU0k4WkgwblpFZUlQSmF6dzc5Z1pYUExvRVAy?=
 =?utf-8?B?OERZZnFZdjAvUWo5bnNpWUwrbnU2bkg0aGtPRzdKOW0zL1VYRFVIeWtTRWgr?=
 =?utf-8?B?RjFVMDVOU1d1ckxwOHN3SDZQcmFMNXlDMG1jL2orMjhVZXdheFZLRm82L25N?=
 =?utf-8?B?dVdNQVVOOHZVaTJMU1d3RkZTWVVCbTNFUEFKZDRaOUdMTWY1NWsvNXQ1MElI?=
 =?utf-8?B?NmFDSjJCYmI3YXA3LzJoVmZIZk9sZ1IyUkVOL09xdzg1K3lHc2RtNUEwSFUz?=
 =?utf-8?B?R2VlZUNsQkp4b3hmWDc1NkwzN0FhRWN5ZjQwNjFINklSYXlFVTl1T3YwZFVx?=
 =?utf-8?B?QVZweVB2NlRHMU5oMzh2K3o5VG1GRGJxdTEzYWJENXFuUzdpd3FndVhYSVJ3?=
 =?utf-8?B?aFNoUnl1dUxxbDFWQ0VLUmcrN1llZHVCNDZXeGI0UmVZWnpSTUd1ZnluN2JG?=
 =?utf-8?B?MEN3OGZHbVI3RjJwU2R0R2JWL3hLM2VNZ0QxV3JHU2pTM0pvejJweHlyaXkx?=
 =?utf-8?B?ZUNqMFc3cjk3di85dzdmSCtzaTM5MC9lK0F5L050RGI0RWJlalU1a3hPbDF2?=
 =?utf-8?B?UU0zSGxGSGhqUlh1Sml1OTdjWG16VjdBVTdOazlpeGpBbzhkc0pOTnBQdSsx?=
 =?utf-8?B?TGlrRjZOSHUzSWRaTG4vK1puV01RREJ0eXUweFY3K0tPUk8yMU1vcXpVd0FN?=
 =?utf-8?B?TDhHdmErSVljeS9PdXhwL2NhbWhlMVRnRDkvV2JJQVJtVUZWY2NXUStFeEkv?=
 =?utf-8?B?UjJmMXJOZmY1Z0ZhRk5JdXhLZTlRa2FMYWdqcmxLV2dXeHpWbWdxdzI5NFN2?=
 =?utf-8?B?eGJDOE44cFZRTW9sL3JOYVV2N3gxRmUyQnlIZ2lPcDlaWU5nekVGZz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ee6d385-f352-44c9-ba5b-08da29e319ee
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2022 13:20:59.6674
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r0HJBganPe56/hvQqhWK0yf1D3F8x2LPY/GDmt//vJFUj/rcam1nC7iBvW8KkHtZ0qgpTmkN/eLyM799L4stlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5223

system_state changes to SYS_STATE_smp_boot before alternative_branches()
is invoked, yet that function, with CET-SS enabled, needs to invoke
modify_xen_mappings(). Convert to check for the number of online CPUs,
just like was done also in 88a037e2cfe1 / fa6dc0879ffd ("page_alloc:
assert IRQs are enabled in heap alloc/free", both instance of which
needed reverting for other reasons).

Fixes: 78e072bc3750 ("x86/mm: avoid inadvertently degrading a TLB flush to local only")
Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Only build-tested, as I don't have suitable hardware at hand.

--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -5074,7 +5074,7 @@ l1_pgentry_t *virt_to_xen_l1e(unsigned l
  * map_pages_to_xen() can be called early in boot before any other
  * CPUs are online. Use flush_area_local() in this case.
  */
-#define flush_area(v,f) (system_state < SYS_STATE_smp_boot ?    \
+#define flush_area(v,f) (num_online_cpus() <= 1 ?               \
                          flush_area_local((const void *)v, f) : \
                          flush_area_all((const void *)v, f))
 


