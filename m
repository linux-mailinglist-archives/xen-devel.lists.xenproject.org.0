Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B10A5704696
	for <lists+xen-devel@lfdr.de>; Tue, 16 May 2023 09:38:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.534970.832497 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pypG1-0004Z3-PY; Tue, 16 May 2023 07:38:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 534970.832497; Tue, 16 May 2023 07:38:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pypG1-0004WQ-M4; Tue, 16 May 2023 07:38:05 +0000
Received: by outflank-mailman (input) for mailman id 534970;
 Tue, 16 May 2023 07:38:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=00Q8=BF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pypG0-0004T5-8V
 for xen-devel@lists.xenproject.org; Tue, 16 May 2023 07:38:04 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0608.outbound.protection.outlook.com
 [2a01:111:f400:fe02::608])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 964a0f5c-f3bc-11ed-8611-37d641c3527e;
 Tue, 16 May 2023 09:38:02 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB6909.eurprd04.prod.outlook.com (2603:10a6:803:13d::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Tue, 16 May
 2023 07:38:01 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%4]) with mapi id 15.20.6387.032; Tue, 16 May 2023
 07:38:00 +0000
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
X-Inumbo-ID: 964a0f5c-f3bc-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yber5EyOc9aXzPiJPMYSKpM3Vm9k4NS/Piv9Je2csp1OxZSGVw+iwEXOzpEdZOIHrB9aonpOmQkyp8uwsCDW4oNAygkDDwKAoty+Z0UW3WUrVqeqy0y/qyQm6YNkaEV4noMwAq2otc7L3L/1iZemgLvIqyS5fZasV9u+uJaSZ9ztjZHTEWhLfS6CzBXmH9XZu7CxNET5RUzL+FwS7yafjiZbcE2oz4sDE5+tyWf9eSd0o8nDf/eJv3hzIJynVpSTs2M3Wcy4qln+QvcOQAeZ58dx2CE4txouvsRz/qiDvWdKEY2+HVv0pCvoa8ZsxfepXtp82y3gad81zVtxWi9eEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pGINYhnPXGwClXBqXIKbDyrF0P+Sfo8bCBfLUCWu++0=;
 b=cLq+2yA0Y/wqyUcmk6kq3WKE520qYaO02tZRLok+o3vhzx6EIhrozIzyZULeJSR6BKsXraS79X6E5fvPJ7t6YJZYiGe9GGX++eN/rofN6YcYs/46ETYlMa9+UgYlpv8YTy3ELcnhgTXKnHODfSg0OhtS7DMm5vOiaI+Ujsj4IIrlaABahZyb6OoN+opbVApdQDV3DbmNSg3YARCFFtNxxdc/tGGvVw+g04tIG+SHkBMidW5w9s22o6NToZih3oeit0aMV8p+ogZ2yUn7e3BOvusDe5xg8qXTXqWgRNmdTV+gdoC3Hb1GzqjBrwtbOGPL0BLLiFiKiZNczO/qHMfT7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pGINYhnPXGwClXBqXIKbDyrF0P+Sfo8bCBfLUCWu++0=;
 b=V3d5QbNyX5RiqLW0/uh2DarxjiliGqhLANGRPs83Uf6Nn4+cEgzKj/pgnAow4Eyj0EFkMDleF0AkhWIZ2beo3IyRPLS4deyUxg+FfTlmlt+Ky4Rqy7gkscTaniyWQJZyCCgwa5HDUgzfbJSkpuYaG/Cy1x/2695A2N9Llbw+bJz2P+7RzJBBkT3rv2TKDckb/LQ54gMd9HWWlFJltYKSCLHDxhT4ZURbepDOaDqRXDuDOmcovfQVdiUNRnidor2x777hkSy0v1kM7VDf533CpysqVbQSk4XgUXy7cqW9wk9HD+bUqkDiqsvuEwSrjkfZqU79oPrmnUNygOlmyhPNyw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <55287753-1973-ef36-3802-82250b8bbad8@suse.com>
Date: Tue, 16 May 2023 09:37:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: [PATCH v3 01/12] x86/shadow: reduce explicit log-dirty recording for
 HVM
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>
References: <184df995-e668-1cea-6f9f-8e79a1ffcbbd@suse.com>
In-Reply-To: <184df995-e668-1cea-6f9f-8e79a1ffcbbd@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0099.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VI1PR04MB6909:EE_
X-MS-Office365-Filtering-Correlation-Id: b69b35a3-6210-4c9a-fc06-08db55e079c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2qFzKQV9W3mbOcgFtoC/hLG5mFn6oTsQpUsSClwyWzoCTW8bKki6EKUxZWq97IgwBm6Alko1rl7aRFi1fUmPeYmujZ5X5KUNCwLT9UUXDrZDwuE5cECAqDaj8UgkOKucdSun0e2meMseyX8WgghX+gy+urqqEjtzltcbdTm9fAbMsqz3HFivaco3FuTMwt2XQYiF4VZJuwitzeC0ohD7uFAAysMl96vNiMX85OvHUq8mA+y1k1PV/RnAA+8xKL/lep+iMYco3CwLWZGMscZgiDxKSvHIvWMO41AZxn234WR11JYHnrMTK8pMo/48mujkGDR42N01YB3fXeiMuis4ZCYbFuG4Ig4rzUpbeCGWWzKzm9XXyYxz4uxB7tm4iUTCQEyeB6ofxJJMudLsA/S4XVa1rp0j689wBC4xh7dRqxN2Ng/VP34/+kfYNBE12KgXnewCuRUtpE5BNtp2rOZs2ycudXIDs62ysb0zbytVeijiASCVjPgo+pmJj9EiYrXWjoc2o55UFjyVlhThK4qBIJJkf/qtk1/dP3UZ4CViMvtm5KafxFXCrIyrgRcS6X0OdlDnzvZiHRfIyhzSGj5ycuZv8x/ZumNVXSLxspJauYAnZhpXzncCK2yakwOVp14y1Dv6W3h69yN/NIEa5eR9hkxclhzG/UWu/UDBWLCzJsQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(366004)(396003)(346002)(376002)(136003)(451199021)(31686004)(83380400001)(4326008)(316002)(6916009)(36756003)(41300700001)(38100700002)(6506007)(6512007)(26005)(6486002)(8936002)(66556008)(478600001)(66476007)(66946007)(2616005)(86362001)(31696002)(5660300002)(8676002)(2906002)(54906003)(186003)(14143004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eDRxSXRsamJqR04xQWtybk1wY2x4UnNtVFZkNGM2cThyWXpBUXZCMUdVVGQ5?=
 =?utf-8?B?MUJrM0pnNUk3NlNDVWlhaXl1QWUvTEdYUDhQRllvLzBZT1U3akMwcFQ3MFlm?=
 =?utf-8?B?TjExclJkZnd3c0xiemFjZERZRWNyY2JRUlpjL2FUemlnNGNXdFBCNTZSUVo3?=
 =?utf-8?B?V2JJa0hlMWhjTDY2b2lCK1o4MzluRXpvdVdNY1FrWCtyNlh3Z1J1Y29xU003?=
 =?utf-8?B?V1RJVUx6eTIwMWl6TU1pUW9NeTZtRG9YVzdkUGNjSThha05MU2l4QXc4K1F6?=
 =?utf-8?B?WmJXOHFNWmc4TDNKUGpWSWU3K09QUzBFd2ltTEc4ZzAwRUlTSlkzRG93azBr?=
 =?utf-8?B?d2h3bzNrZGlJeVNNdnBpQ2NTakJodXJhWnVDSkN4YVVwMHA5UFpIQ2gySnBz?=
 =?utf-8?B?QzdkV2dacHNrc3ZabmhuMWM2dnZGakFJSjA0WmpsVnJ6eFBVdE42RE9wZnRO?=
 =?utf-8?B?d1JsZGxWcmpPTUxJeUJnQkY0QnZNaTNqRTVMcVNXeFlWbWN3bVNabUFCL0hi?=
 =?utf-8?B?UENyaW11Qk96bU5BSjQ3Z2JZVy9yVWlkNjBsQzl3cTVYeUU1TGw0dEY4eUd5?=
 =?utf-8?B?MGQvYi8yMkVpY0Z3anoybGpDRi9RNWRHQ3pTT0xGcFNWend4ampGWkM3dGNU?=
 =?utf-8?B?d01VUzFMK25CK3pBRVZwd3pTWWk0WjYvOHFCT1o4ektyaDZTU0RReXRUZ2Zl?=
 =?utf-8?B?VXRKSjVQOWJCMmhDL00ydEJxemwxaERzUUFHVmI3MFR5V2R1YWF4ZDdFa0ll?=
 =?utf-8?B?K1UvSEdJdDJ2NUhheHUrQkJWdEIycjZ2Wm1WSW96anFNMHJXQ3RPV3JoS2hF?=
 =?utf-8?B?N0xvcS9PTjh1aHlxVFlMa1NWQXJnRkhwN3AwOTgwMklrN1BUMmo0cWNyWW9F?=
 =?utf-8?B?aWE4MUVrZG5BQ2V2bHBWak0vTERVcUttdy9QUFVLcG9jdTJWQzhvMmFpQzFv?=
 =?utf-8?B?SDAzSUxxR205N1JWRUM1SmpBalVOdmdkSmFWYmFSbHVKZU9zN1NkbFgrMkVY?=
 =?utf-8?B?OWdyMG1XblBCWGR2Qm5qOWdNQUs2M2RHMjVaU053VXc0V3ZFeCtKZDF6MkZk?=
 =?utf-8?B?eU9aMnNocWVWUS9kQXRWdlJQc3RmL2dnRzRBSUNNYmJJVkh6NHF6dUFOY0k1?=
 =?utf-8?B?dGZTV1EvdjQwNUlYcXI1Z050WFVCcG5vckRqTmtvVXg0QWJYYitvdlpxSldu?=
 =?utf-8?B?WkJ4cTlsTTZaanhHZ3FVWGxFcE4zdnQva1JiWWR2ZWJnb0FPM2o1YnN4QWda?=
 =?utf-8?B?d05wSDU3ZmUzaGhCeXJVS0RxejVkQUJ4Z0FMbE5VSHF2NEFqT2V6Q0ZWdGxV?=
 =?utf-8?B?dlpPc0ZGNUdpSVA2dHJmbjR0NEFCQzJGb1gvMndFeU51allvK2xBQXNPY3NI?=
 =?utf-8?B?Z2ZXY0RTbUNuRVFZMDB0R3RjNDdiSHZ1eXRQQTJ6NkVkQ2ZyTTcrb29iOEl6?=
 =?utf-8?B?NXVTRGUvOXVaTDdqMXp3anhkM3J2b3Y5dThDK2tmekY2NHk1Qk5SeUxKdkFv?=
 =?utf-8?B?eUQ1UWQ5VFBJb3R4STAvVTZMdXk1SkI0ZWRTcG11NnNHMmM3RUEwR1ovcjh5?=
 =?utf-8?B?Q0ZHcGo0TW9UblJiMVlOOUdWQ256aTNwdTRXc0NxNUFUVk84ODI3Nmpoc2hK?=
 =?utf-8?B?RHJUUmV1djY1TU9pZjQrQ3JGNTIrajBqWURZVkRnaENBVEI4YnQ1RTVrUVow?=
 =?utf-8?B?RHZ2MjQxZXo4MzVxNThNSHdkY0lzaVJqK1g1NGVHekRSbnorM0RNY3FMSzBz?=
 =?utf-8?B?SURFaEorN09yeTkyTmp4NHEvNEtldkFLV2UzbzA2a08zVi9LakxQWjk1SVZ3?=
 =?utf-8?B?UG02ZFpiZE9SRWJRV1hUQ0dkeS90YWlWWnJJOTFxaFJsS3lZdHJPOHVWdmFa?=
 =?utf-8?B?MytZak9BRmNnSE1PYWg3YU5LYXZIbU1uM1FJdzZOdCtvcURPZ2FvUlBYRDAz?=
 =?utf-8?B?dzUxaGdvd3ZweGhVQkF2aFI5NE1CMmlHZSs5SHBQV0xjZVdhNFBlbFJ3Zy9Q?=
 =?utf-8?B?MlJobDAyZ2o3N1NyM09vWldXdTAxOUhLMmFkZ2hJVm1CNm9KU3BuM1laY3lN?=
 =?utf-8?B?RmQzM3Q2Rkd6UHEzZ3YydlFRRGlPaU1OaFpWS3pFV1kydHZKTzMzREt5SlU4?=
 =?utf-8?Q?TZmvgKDkVeSanWYOTUGjRauf2?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b69b35a3-6210-4c9a-fc06-08db55e079c8
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 07:38:00.8764
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DO95Hf4QjijuPlhz9Oocic0LejgKKbDuG9avgn8jpMrk/2Lx/EffCbpwwyXduYROPg47BLJFLw7NXHn/EZJfvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6909

validate_guest_pt_write(), by calling sh_validate_guest_entry(), already
guarantees the needed update of log-dirty information. Move the
operation into the sole code path needing it (when SHOPT_SKIP_VERIFY is
enabled), making clear that only one such call is needed.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm/shadow/hvm.c
+++ b/xen/arch/x86/mm/shadow/hvm.c
@@ -644,6 +644,7 @@ static void sh_emulate_unmap_dest(struct
     {
         /* Writes with this alignment constraint can't possibly cross pages. */
         ASSERT(!mfn_valid(sh_ctxt->mfn[1]));
+        paging_mark_dirty(v->domain, sh_ctxt->mfn[0]);
     }
     else
 #endif /* SHADOW_OPTIMIZATIONS & SHOPT_SKIP_VERIFY */
@@ -661,12 +662,10 @@ static void sh_emulate_unmap_dest(struct
             validate_guest_pt_write(v, sh_ctxt->mfn[1], addr + b1, b2);
     }
 
-    paging_mark_dirty(v->domain, sh_ctxt->mfn[0]);
     put_page(mfn_to_page(sh_ctxt->mfn[0]));
 
     if ( unlikely(mfn_valid(sh_ctxt->mfn[1])) )
     {
-        paging_mark_dirty(v->domain, sh_ctxt->mfn[1]);
         put_page(mfn_to_page(sh_ctxt->mfn[1]));
         vunmap((void *)((unsigned long)addr & PAGE_MASK));
     }


