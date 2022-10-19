Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E125603AE5
	for <lists+xen-devel@lfdr.de>; Wed, 19 Oct 2022 09:46:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.425591.673517 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ol3m4-00087C-4k; Wed, 19 Oct 2022 07:46:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 425591.673517; Wed, 19 Oct 2022 07:46:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ol3m4-00085O-0h; Wed, 19 Oct 2022 07:46:00 +0000
Received: by outflank-mailman (input) for mailman id 425591;
 Wed, 19 Oct 2022 07:45:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=illN=2U=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ol3m1-0007wU-Ml
 for xen-devel@lists.xenproject.org; Wed, 19 Oct 2022 07:45:58 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60071.outbound.protection.outlook.com [40.107.6.71])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1089ad06-4f82-11ed-8fd0-01056ac49cbb;
 Wed, 19 Oct 2022 09:45:56 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB8018.eurprd04.prod.outlook.com (2603:10a6:20b:236::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Wed, 19 Oct
 2022 07:45:54 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5723.034; Wed, 19 Oct 2022
 07:45:54 +0000
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
X-Inumbo-ID: 1089ad06-4f82-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HmShmaqQykFqvmtCcfCQ1GOW4Os2WvVSex46DrA1W/IA2XONfWPJZk5ErWkmBSOyIQcFanUMApAoyfk0ZDxh8FzhVIO7CA6rfV2hDgbW+t1/zAhL8XLnTdcvwJRX0QgKHiQzkYP/8jNhm8wJEPoHxHZxJtkRwKhRkQeJkKAvdwL93aLXZ+zVYLRrFAeBjjXDLh5i0TD4nJI6gX3Flbs6aBKlg+mFcQmIDgFhXtFxqKvZE7wZJiC6JQZyY63TPGbLH9TW06OCdQ2q+38G75SjDet/Px5X+ONIiwoh9mGmaUXwD3yjz2HWvpy7uucLO/pTsvbHSUWGGgYXVNAUe/MaLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DgBhR75TKXzhjJAKk8igA43OaQRf/s9CHiXdfaBkBfE=;
 b=iz25YbwMEI8ZEwfiXIX1isd7+QjHbDI+Qenlwqd9kfuEWxhyFlnFnfkNjwJk+zJC7NwCMvfM2rE2b3n3/g5pC+T6E6H3s46UAWZF6dHOKxRy0gLJy/Z2DTSBKebYZf20WNYpq4kNVFtTMO+5Uf+7tnu5g0q0eyIYCt32M2CVo2RMYKGFu3vaXrdd4uEmUdDRR0WGMGuNR5JWpRcJbZo65/gc1VQDWdSXc/GYk4UAlLwKRP0LNzBjSoWFohyn2ycG0G0MEyg1+a021jYjFSsBLE45BCftmEilv+yUh2qVszJ0je4jXgWmaCgL3MBmaCIaOO7SLlq66cbWLzs/JtAH/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DgBhR75TKXzhjJAKk8igA43OaQRf/s9CHiXdfaBkBfE=;
 b=WiPwRwz/yM48cBypGN2NvO1SJMJmqMJFJ9laL+qptGd36jswR3IjjY0vPTweTf0D8slKscE/lIwMRgm2L94IXyePTnpc8FMVE51PiaehwApJKMdUG/HhnOMUP59DFLDWQSWrX0/0yhQz0/IniIPwHIm9/FFzowW/M6yoRFxYQOACuoM9YCbDU21cDx1nTuG5lhinDDA1NxnfB21IQvNEjMV8xssOfS1jFMWqqLmwDwkSvKnOswRtjUoY9kRDzYqY4cZY1bV/gkeaqMydEXUh8lDa8jimiFS4caDW56m984f+GcrJFevW5DDT+BwgrKhEW4XQBd/aCwABX2CWaJZYLA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f1745e62-8a46-e9af-6a79-592a5402a5f4@suse.com>
Date: Wed, 19 Oct 2022 09:45:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: [PATCH RFC 10/10] common: convert vCPU info area registration
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>
References: <bcab8340-6bfd-8dfc-efe1-564e520b3a06@suse.com>
In-Reply-To: <bcab8340-6bfd-8dfc-efe1-564e520b3a06@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0601CA0047.eurprd06.prod.outlook.com
 (2603:10a6:203:68::33) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM8PR04MB8018:EE_
X-MS-Office365-Filtering-Correlation-Id: 2dcfca35-a02f-4ce7-ae75-08dab1a5f3d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2T65b7R6Aal8xTNpLsZA6Y7pIPoufXUXsCieyNMeOAV2reGiv0yma6tRbOwmzYhH5DrYW/HT/scx6UVlkfFkdoXKbnYcDwMrbzPKAI2JDDle5u4y5nI1g1bUW+EiQFZjxzzqicyP2HJtzF+QLnSBwOlWoFUxTitmz+ETchAcRMXaAnN6v1FR17uZhF22XIIyMLOysb0i4gfQCfHu+wAoS3SAU8snYxb/t4Gd57Kck0CYwHGxbOkL2FKV3b+69uHvy+miEhZh5oXLrfH7gmcj2Z+8Oy6ujAVXdpK7er3nIJeETIEASlIykqPZ+IurHICF8yD1koUPC3rFwPAIj8YrpN1QPFU0LDPSZaWj9CJP4PT5XxJo4ndhjzntTD6qIuYS+aRRhTDtNaHkudWcUUuE+NlWDGPYl5h8pIUBaJB/li0vKRBlF/M7Q1fXHDrloj/nAatLvzDcOiS+5JcNjCa7Sc6SYFQnLB7PJf6GUzCtayhZKfPO7jQcXjpLv+toKQl8rWXA8z6Y6PDriduKc9HJRP4bqYavER+OU0SlFlJeUKJKTbupX8VDfIPCb7WyCzJLpHj62zR2CcSfS3/hPQQIlemylO3CJ9TL6aXlcolVvWeFyas5ew97Hh81EMlZq1ZECXGLzBsGP/IRDP5uk/JLOi7NYKgwfAwkpwsJMgYpd79LM4ioWPBqdnx9XEekz8WM2WgNFUZYdus5JyBSI7/Rz1XY+aNS4HkMvHRMWfMV831KLqLM5rqqJeQa0Wa2uQT45uBmj/pUGwhUqSKJDrOq4iUOygoN9veXGr28YNcZ7Zy64W48VTuYQ0bcX9RHk9Vp
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(376002)(136003)(366004)(39860400002)(396003)(451199015)(316002)(186003)(2906002)(83380400001)(31696002)(36756003)(86362001)(38100700002)(31686004)(6486002)(478600001)(6916009)(54906003)(2616005)(41300700001)(6506007)(5660300002)(8936002)(30864003)(26005)(6512007)(4326008)(66476007)(66946007)(8676002)(66556008)(45980500001)(43740500002)(309714004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UmY3SGhPOGp3UmtoZjhGSFBETWQ5clNSWG5IQkMzSUJQdG5Da2lObzRhd0Jh?=
 =?utf-8?B?QTJoaGVkMUpnUjhwTlRWdTJaR3hHdy8xZEhwWndKTWVsdTJMT2Y3cnhMUVM3?=
 =?utf-8?B?QVZ6SE5ISHMzbkJBbGJ3UXZNZEN2elVDeFVmWWptVjEyN1AwT0VPVmdpUklJ?=
 =?utf-8?B?cXVxVlpyTWZQQWt2MlNJZHB2dS9wdHdpK3ozNUhTTFNrT2ExNy85dDJhdWRT?=
 =?utf-8?B?NVhiU0ZydlMyY3N3WW9VaU0vRkpUemFyTDJQMVV0MDFxQUNJZ3JYWTd3RmZN?=
 =?utf-8?B?QktvbnRDQjR5K1BpUmJxQm5wUjNrdHJCTitKRllZa3loRXJGdEg2VUsrckZ3?=
 =?utf-8?B?dFEzb2NoSWdZNVJMYitEc0xnMTZpczd1eDRSRzljMEtwaDY5bUFqdERROE1H?=
 =?utf-8?B?NllKZHF0VmxBek5EK1ZzT052ZWc3dW01UmNVOU5BUnluQUpZYWdtRElrUHRm?=
 =?utf-8?B?aWt2R0JzOVZuU1grM2FHMHdmUTIvR3UyMkg2Yk5GY05SSjZBQTlvVDVhT3Nr?=
 =?utf-8?B?ZE01OFNEY0R2ZDFMbStrakVUR08wMnFGZlcwWlVRR1d2UlVvcU1pUTdpaHgr?=
 =?utf-8?B?Tk5zY1JDNWZoeEcwMWtsSDlRQ0JhSmZXbWVUbkt0a2FDRGdyNE1veUlyNTFZ?=
 =?utf-8?B?WDNxQ1duQVRwME11VXRHNjViUUFXSFZLTmNFY0ZNbjl0T2t4VlVjNWN6K2RT?=
 =?utf-8?B?aGY4ZUNxRWh0M00vS21VenZUZ0hsTzRLVW1xanNHNWRBbU5oaHdQdkZjT2hu?=
 =?utf-8?B?TDl0TWR5ak9RNkJFb3FCQzY4UjhUNW95b0gvN1lPREpNa01yUnl0M2pkdEJQ?=
 =?utf-8?B?THVxby9FRnhYUktzSU91WXl3V05Fclc1NldZQ1Z2Q2E2MFBabmZ3d2J4cisr?=
 =?utf-8?B?UEpjL09DU0N4enk4RFBXUVlJWmpVUXNwL1N4NWZ6RHFHL1BGd09TZlU5VTV2?=
 =?utf-8?B?SXZRQ082QnZ5aCtxNUJyY0YzRjVVRCt1a0JMZ2tHSDJ1VW5yS1crcC9EZnNt?=
 =?utf-8?B?ODhSVWNGYzJMVHhtQThFWjdEdTFiTEZTZ2tET0xrT2pYZlJ6TkQzNzhqT0JE?=
 =?utf-8?B?VzVyY29Gb05zODBWbWFVOXBReURnTml3dWZ3MHREOXhVWWtsVmJtZ2R1UlR0?=
 =?utf-8?B?U0txam5sUWpmMHF2cWNDZUNSM0pxTmRxcTJmQjJNRzFjTndQVmR1bXNDU2hL?=
 =?utf-8?B?ZE9VcFo1dkJZYXZ2SkgvZElYRE9OY3k5ZFEvVGlJN1JrWUdKbnlsbXEySnpn?=
 =?utf-8?B?T0wrb3JxMng4UkRJM29OcTFvRC90UnJCbjBPSm5iSHNEQnBaWnJuRHNyMDNn?=
 =?utf-8?B?YlFDUkU1U2VJWHd1TnB4cFhKTmxqTFNlRTY0VEdWUGJJcFpKQ1RSd09FWHIz?=
 =?utf-8?B?TGVZVC9DV0hoYWVJUHpNeGNoWUhuVHlFOTFUVmJkZFIwTGd2TTk1YWloZHBL?=
 =?utf-8?B?dFRvOHRYRVd0cnBvMVFEeVRGMlF6VThucGp1eVNsVGQvdEVUNVhkMTV4L2Ry?=
 =?utf-8?B?djVqRTJGZGRrck9mY3JVWGJOTE41bVBONWsrRnRNcmsvYVlQNytRdFlHaEcz?=
 =?utf-8?B?VnVHZ3RmTGlwQ0cwWE9HaFVDRU5RYkVCVllJWHVuRXdGczhaNVBLaHF1UVYr?=
 =?utf-8?B?S2Y5RGYzWGRmb1pHUDIraG0yR1VXV1ExenRiUjBwUVozUk81cWtUUjNib2VS?=
 =?utf-8?B?WXBicWlQajBJTVRPSzl2bkFFNSsrWWlzWHpMcUp2MUNRcDhZekJCcEJXdHhZ?=
 =?utf-8?B?SUphbjZyN1N4WGxyb0o4KzRNRng5eStWMEo5ckpGaVhKRkhEV2l5T0dNRUVy?=
 =?utf-8?B?RlFIcWRXeDhZQk5ELytOSFdtcS9rRjBMbXdWajZWOFdEY01JdlVCSlZQWENI?=
 =?utf-8?B?MXUxdGZNS3J4NThoYkFvOXVyZUo5OVBDR216Z2EyMVpDbk96U2swNXAzVmdJ?=
 =?utf-8?B?RDBMcjVjQWFOd1RLVWxCaCtOYXVITWpvd2lQb1FMdU4wZTFrQlFuNkgwbEtF?=
 =?utf-8?B?QTBpQzc5WitXVzF0bkRoNlkvdTNJRURtZDk5VitHYlF6bDFzblBjcEpZY0VG?=
 =?utf-8?B?NGYzSStET0trWXFVaW5OTkcyMWlWYWZ0eHFEMHpVY2w0Z0xTN3YrSFBMcGtL?=
 =?utf-8?Q?qmJnh+8sP2n6iG0pnW7oOlmCR?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dcfca35-a02f-4ce7-ae75-08dab1a5f3d9
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2022 07:45:54.6446
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HIxhdHhpl8su2QnFekvrpJ10UDoYmLUcgdVaDKrmkZLPIde2EjEbvwB92JvDLaUxr1Pr7dBkAd30niVc4nRVxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB8018

Switch to using map_guest_area(). Noteworthy differences from
map_vcpu_info():
- remote vCPU-s are paused rather than checked for being down (which in
  principle can change right after the check),
- the domain lock is taken for a much smaller region,
- areas could now be registered more than once, if we want this,
- as a corner case registering the area at GFN 0 offset 0 is no longer
  possible (this is considered an invalid de-registration request).

Note that this eliminates a bug in copy_vcpu_settings(): The function
did allocate a new page regardless of the GFN already having a mapping,
thus in particular breaking the case of two vCPU-s having their info
areas on the same page.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
RFC: While the "no re-registration" check is retained, it is now racy.
     If we really think it needs retaining _and_ properly enforcing,
     then locking will be needed, but I don't think we can hold the
     domain lock around a call to map_guest_area(), first and foremost
     because of its use of vcpu_pause().

RFC: Is the GFN 0 offset 0 behavioral change deemed acceptable?

RFC: To have just a single instance of casts to vcpu_info_t *,
     introducing a macro (or inline function if header dependencies
     permit) might be nice. However, the only sensible identifier for it
     would imo be vcpu_info(). Yet we already have a macro of that name.
     With some trickery it might be possible to overload the macro
     (making the "field" argument optional), but this may not be
     desirable for other reasons (it could e.g. be deemed confusing).

--- a/xen/arch/x86/include/asm/shared.h
+++ b/xen/arch/x86/include/asm/shared.h
@@ -27,16 +27,16 @@ static inline void arch_set_##field(stru
 static inline type arch_get_##field(const struct vcpu *v)       \
 {                                                               \
     return !has_32bit_shinfo(v->domain) ?                       \
-           v->vcpu_info->native.arch.field :                    \
-           v->vcpu_info->compat.arch.field;                     \
+           ((const vcpu_info_t *)v->vcpu_info_area.map)->native.arch.field : \
+           ((const vcpu_info_t *)v->vcpu_info_area.map)->compat.arch.field;  \
 }                                                               \
 static inline void arch_set_##field(struct vcpu *v,             \
                                     type val)                   \
 {                                                               \
     if ( !has_32bit_shinfo(v->domain) )                         \
-        v->vcpu_info->native.arch.field = val;                  \
+        ((vcpu_info_t *)v->vcpu_info_area.map)->native.arch.field = val; \
     else                                                        \
-        v->vcpu_info->compat.arch.field = val;                  \
+        ((vcpu_info_t *)v->vcpu_info_area.map)->compat.arch.field = val; \
 }
 
 #else
@@ -57,12 +57,12 @@ static inline void arch_set_##field(stru
 #define GET_SET_VCPU(type, field)                           \
 static inline type arch_get_##field(const struct vcpu *v)   \
 {                                                           \
-    return v->vcpu_info->arch.field;                        \
+    return ((const vcpu_info_t *)v->vcpu_info_area.map)->arch.field; \
 }                                                           \
 static inline void arch_set_##field(struct vcpu *v,         \
                                     type val)               \
 {                                                           \
-    v->vcpu_info->arch.field = val;                         \
+    ((vcpu_info_t *)v->vcpu_info_area.map)->arch.field = val; \
 }
 
 #endif
--- a/xen/arch/x86/mm/mem_sharing.c
+++ b/xen/arch/x86/mm/mem_sharing.c
@@ -1758,53 +1758,24 @@ static int copy_vpmu(struct vcpu *d_vcpu
 static int copy_vcpu_settings(struct domain *cd, const struct domain *d)
 {
     unsigned int i;
-    struct p2m_domain *p2m = p2m_get_hostp2m(cd);
     int ret = -EINVAL;
 
     for ( i = 0; i < cd->max_vcpus; i++ )
     {
         struct vcpu *d_vcpu = d->vcpu[i];
         struct vcpu *cd_vcpu = cd->vcpu[i];
-        mfn_t vcpu_info_mfn;
 
         if ( !d_vcpu || !cd_vcpu )
             continue;
 
-        /* Copy & map in the vcpu_info page if the guest uses one */
-        vcpu_info_mfn = d_vcpu->vcpu_info_mfn;
-        if ( !mfn_eq(vcpu_info_mfn, INVALID_MFN) )
-        {
-            mfn_t new_vcpu_info_mfn = cd_vcpu->vcpu_info_mfn;
-
-            /* Allocate & map the page for it if it hasn't been already */
-            if ( mfn_eq(new_vcpu_info_mfn, INVALID_MFN) )
-            {
-                gfn_t gfn = mfn_to_gfn(d, vcpu_info_mfn);
-                unsigned long gfn_l = gfn_x(gfn);
-                struct page_info *page;
-
-                if ( !(page = alloc_domheap_page(cd, 0)) )
-                    return -ENOMEM;
-
-                new_vcpu_info_mfn = page_to_mfn(page);
-                set_gpfn_from_mfn(mfn_x(new_vcpu_info_mfn), gfn_l);
-
-                ret = p2m->set_entry(p2m, gfn, new_vcpu_info_mfn,
-                                     PAGE_ORDER_4K, p2m_ram_rw,
-                                     p2m->default_access, -1);
-                if ( ret )
-                    return ret;
-
-                ret = map_vcpu_info(cd_vcpu, gfn_l,
-                                    PAGE_OFFSET(d_vcpu->vcpu_info));
-                if ( ret )
-                    return ret;
-            }
-
-            copy_domain_page(new_vcpu_info_mfn, vcpu_info_mfn);
-        }
-
-        /* Same for the (physically registered) runstate and time info areas. */
+        /*
+         * Copy and map the vcpu_info page and the (physically registered)
+         * runstate and time info areas.
+         */
+        ret = copy_guest_area(&cd_vcpu->vcpu_info_area,
+                              &d_vcpu->vcpu_info_area, cd_vcpu, d);
+        if ( ret )
+            return ret;
         ret = copy_guest_area(&cd_vcpu->runstate_guest_area,
                               &d_vcpu->runstate_guest_area, cd_vcpu, d);
         if ( ret )
--- a/xen/arch/x86/pv/shim.c
+++ b/xen/arch/x86/pv/shim.c
@@ -395,7 +395,7 @@ int pv_shim_shutdown(uint8_t reason)
     for_each_vcpu ( d, v )
     {
         /* Unmap guest vcpu_info page and runstate/time areas. */
-        unmap_vcpu_info(v);
+        unmap_guest_area(v, &v->vcpu_info_area);
         unmap_guest_area(v, &v->runstate_guest_area);
         unmap_guest_area(v, &v->arch.time_guest_area);
 
--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -1438,7 +1438,7 @@ static void __update_vcpu_system_time(st
     struct vcpu_time_info *u = &vcpu_info(v, time), _u;
     const struct domain *d = v->domain;
 
-    if ( v->vcpu_info == NULL )
+    if ( !v->vcpu_info_area.map )
         return;
 
     collect_time_info(v, &_u);
--- a/xen/arch/x86/x86_64/asm-offsets.c
+++ b/xen/arch/x86/x86_64/asm-offsets.c
@@ -53,7 +53,7 @@ void __dummy__(void)
 
     OFFSET(VCPU_processor, struct vcpu, processor);
     OFFSET(VCPU_domain, struct vcpu, domain);
-    OFFSET(VCPU_vcpu_info, struct vcpu, vcpu_info);
+    OFFSET(VCPU_vcpu_info, struct vcpu, vcpu_info_area.map);
     OFFSET(VCPU_trap_bounce, struct vcpu, arch.pv.trap_bounce);
     OFFSET(VCPU_thread_flags, struct vcpu, arch.flags);
     OFFSET(VCPU_event_addr, struct vcpu, arch.pv.event_callback_eip);
--- a/xen/arch/x86/x86_64/traps.c
+++ b/xen/arch/x86/x86_64/traps.c
@@ -97,7 +97,7 @@ static void _show_registers(
     if ( context == CTXT_hypervisor )
         printk(" %pS", _p(regs->rip));
     printk("\nRFLAGS: %016lx   ", regs->rflags);
-    if ( (context == CTXT_pv_guest) && v && v->vcpu_info )
+    if ( (context == CTXT_pv_guest) && v && v->vcpu_info_area.map )
         printk("EM: %d   ", !!vcpu_info(v, evtchn_upcall_mask));
     printk("CONTEXT: %s", context_names[context]);
     if ( v && !is_idle_vcpu(v) )
--- a/xen/common/compat/domain.c
+++ b/xen/common/compat/domain.c
@@ -49,7 +49,7 @@ int compat_common_vcpu_op(int cmd, struc
     {
     case VCPUOP_initialise:
     {
-        if ( v->vcpu_info == &dummy_vcpu_info )
+        if ( v->vcpu_info_area.map == &dummy_vcpu_info )
             return -EINVAL;
 
 #ifdef CONFIG_HVM
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -127,10 +127,10 @@ static void vcpu_info_reset(struct vcpu
 {
     struct domain *d = v->domain;
 
-    v->vcpu_info = ((v->vcpu_id < XEN_LEGACY_MAX_VCPUS)
-                    ? (vcpu_info_t *)&shared_info(d, vcpu_info[v->vcpu_id])
-                    : &dummy_vcpu_info);
-    v->vcpu_info_mfn = INVALID_MFN;
+    v->vcpu_info_area.map =
+        ((v->vcpu_id < XEN_LEGACY_MAX_VCPUS)
+         ? (vcpu_info_t *)&shared_info(d, vcpu_info[v->vcpu_id])
+         : &dummy_vcpu_info);
 }
 
 static void vmtrace_free_buffer(struct vcpu *v)
@@ -951,7 +951,7 @@ int domain_kill(struct domain *d)
             return -ERESTART;
         for_each_vcpu ( d, v )
         {
-            unmap_vcpu_info(v);
+            unmap_guest_area(v, &v->vcpu_info_area);
             unmap_guest_area(v, &v->runstate_guest_area);
         }
         d->is_dying = DOMDYING_dead;
@@ -1406,7 +1406,7 @@ int domain_soft_reset(struct domain *d,
     for_each_vcpu ( d, v )
     {
         set_xen_guest_handle(runstate_guest(v), NULL);
-        unmap_vcpu_info(v);
+        unmap_guest_area(v, &v->vcpu_info_area);
         unmap_guest_area(v, &v->runstate_guest_area);
     }
 
@@ -1454,111 +1454,6 @@ int vcpu_reset(struct vcpu *v)
     return rc;
 }
 
-/*
- * Map a guest page in and point the vcpu_info pointer at it.  This
- * makes sure that the vcpu_info is always pointing at a valid piece
- * of memory, and it sets a pending event to make sure that a pending
- * event doesn't get missed.
- */
-int map_vcpu_info(struct vcpu *v, unsigned long gfn, unsigned int offset)
-{
-    struct domain *d = v->domain;
-    void *mapping;
-    vcpu_info_t *new_info;
-    struct page_info *page;
-    unsigned int align;
-
-    if ( offset > (PAGE_SIZE - sizeof(*new_info)) )
-        return -ENXIO;
-
-#ifdef CONFIG_COMPAT
-    BUILD_BUG_ON(sizeof(*new_info) != sizeof(new_info->compat));
-    if ( has_32bit_shinfo(d) )
-        align = alignof(new_info->compat);
-    else
-#endif
-        align = alignof(*new_info);
-    if ( offset & (align - 1) )
-        return -ENXIO;
-
-    if ( !mfn_eq(v->vcpu_info_mfn, INVALID_MFN) )
-        return -EINVAL;
-
-    /* Run this command on yourself or on other offline VCPUS. */
-    if ( (v != current) && !(v->pause_flags & VPF_down) )
-        return -EINVAL;
-
-    page = get_page_from_gfn(d, gfn, NULL, P2M_UNSHARE);
-    if ( !page )
-        return -EINVAL;
-
-    if ( !get_page_type(page, PGT_writable_page) )
-    {
-        put_page(page);
-        return -EINVAL;
-    }
-
-    mapping = __map_domain_page_global(page);
-    if ( mapping == NULL )
-    {
-        put_page_and_type(page);
-        return -ENOMEM;
-    }
-
-    new_info = (vcpu_info_t *)(mapping + offset);
-
-    if ( v->vcpu_info == &dummy_vcpu_info )
-    {
-        memset(new_info, 0, sizeof(*new_info));
-#ifdef XEN_HAVE_PV_UPCALL_MASK
-        __vcpu_info(v, new_info, evtchn_upcall_mask) = 1;
-#endif
-    }
-    else
-    {
-        memcpy(new_info, v->vcpu_info, sizeof(*new_info));
-    }
-
-    v->vcpu_info = new_info;
-    v->vcpu_info_mfn = page_to_mfn(page);
-
-    /* Set new vcpu_info pointer /before/ setting pending flags. */
-    smp_wmb();
-
-    /*
-     * Mark everything as being pending just to make sure nothing gets
-     * lost.  The domain will get a spurious event, but it can cope.
-     */
-#ifdef CONFIG_COMPAT
-    if ( !has_32bit_shinfo(d) )
-        write_atomic(&new_info->native.evtchn_pending_sel, ~0);
-    else
-#endif
-        write_atomic(&vcpu_info(v, evtchn_pending_sel), ~0);
-    vcpu_mark_events_pending(v);
-
-    return 0;
-}
-
-/*
- * Unmap the vcpu info page if the guest decided to place it somewhere
- * else. This is used from domain_kill() and domain_soft_reset().
- */
-void unmap_vcpu_info(struct vcpu *v)
-{
-    mfn_t mfn = v->vcpu_info_mfn;
-
-    if ( mfn_eq(mfn, INVALID_MFN) )
-        return;
-
-    unmap_domain_page_global((void *)
-                             ((unsigned long)v->vcpu_info & PAGE_MASK));
-
-    vcpu_info_reset(v); /* NB: Clobbers v->vcpu_info_mfn */
-
-    put_page_and_type(mfn_to_page(mfn));
-}
-
 int map_guest_area(struct vcpu *v, paddr_t gaddr, unsigned int size,
                    struct guest_area *area,
                    void (*populate)(void *dst, struct vcpu *v))
@@ -1628,6 +1523,30 @@ int map_guest_area(struct vcpu *v, paddr
 
     domain_unlock(currd);
 
+    /* Set pending flags /after/ new vcpu_info pointer was set. */
+    if ( area == &v->vcpu_info_area )
+    {
+        /*
+         * Mark everything as being pending just to make sure nothing gets
+         * lost.  The domain will get a spurious event, but it can cope.
+         */
+#ifdef CONFIG_COMPAT
+        if ( !has_32bit_shinfo(currd) )
+        {
+            vcpu_info_t *info = area->map;
+
+            /* For VCPUOP_register_vcpu_info handling in common_vcpu_op(). */
+            BUILD_BUG_ON(sizeof(*info) != sizeof(info->compat));
+            write_atomic(&info->native.evtchn_pending_sel, ~0);
+        }
+        else
+#endif
+            write_atomic(&vcpu_info(v, evtchn_pending_sel), ~0);
+        vcpu_mark_events_pending(v);
+
+        force_update_vcpu_system_time(v);
+    }
+
     if ( v != current )
         vcpu_unpause(v);
 
@@ -1654,7 +1573,10 @@ void unmap_guest_area(struct vcpu *v, st
 
     domain_lock(d);
     map = area->map;
-    area->map = NULL;
+    if ( area == &v->vcpu_info_area )
+        vcpu_info_reset(v);
+    else
+        area->map = NULL;
     pg = area->pg;
     area->pg = NULL;
     domain_unlock(d);
@@ -1789,6 +1711,27 @@ bool update_runstate_area(struct vcpu *v
     return rc;
 }
 
+/*
+ * This makes sure that the vcpu_info is always pointing at a valid piece of
+ * memory, and it sets a pending event to make sure that a pending event
+ * doesn't get missed.
+ */
+static void cf_check
+vcpu_info_populate(void *map, struct vcpu *v)
+{
+    vcpu_info_t *info = map;
+
+    if ( v->vcpu_info_area.map == &dummy_vcpu_info )
+    {
+        memset(info, 0, sizeof(*info));
+#ifdef XEN_HAVE_PV_UPCALL_MASK
+        __vcpu_info(v, info, evtchn_upcall_mask) = 1;
+#endif
+    }
+    else
+        memcpy(info, v->vcpu_info_area.map, sizeof(*info));
+}
+
 static void cf_check
 runstate_area_populate(void *map, struct vcpu *v)
 {
@@ -1818,7 +1761,7 @@ long common_vcpu_op(int cmd, struct vcpu
     switch ( cmd )
     {
     case VCPUOP_initialise:
-        if ( v->vcpu_info == &dummy_vcpu_info )
+        if ( v->vcpu_info_area.map == &dummy_vcpu_info )
             return -EINVAL;
 
         rc = arch_initialise_vcpu(v, arg);
@@ -1942,16 +1885,30 @@ long common_vcpu_op(int cmd, struct vcpu
     case VCPUOP_register_vcpu_info:
     {
         struct vcpu_register_vcpu_info info;
+        paddr_t gaddr;
 
         rc = -EFAULT;
         if ( copy_from_guest(&info, arg, 1) )
             break;
 
-        domain_lock(d);
-        rc = map_vcpu_info(v, info.mfn, info.offset);
-        domain_unlock(d);
+        rc = -EINVAL;
+        gaddr = gfn_to_gaddr(_gfn(info.mfn)) + info.offset;
+        if ( !gaddr ||
+             gfn_x(gaddr_to_gfn(gaddr)) != info.mfn ||
+             /*
+              * Technically re-registration is okay, but it wasn't allowed
+              * originally.  By trying to win a race, a guest might be able
+              * to bypass this restriction.
+              */
+             v->vcpu_info_area.pg )
+            break;
 
-        force_update_vcpu_system_time(v);
+        /* See the BUILD_BUG_ON() in vcpu_info_populate(). */
+        rc = map_guest_area(v, gaddr, sizeof(vcpu_info_t),
+                            &v->vcpu_info_area, vcpu_info_populate);
+        if ( rc == -ERESTART )
+            rc = hypercall_create_continuation(__HYPERVISOR_vcpu_op, "iih",
+                                               cmd, vcpuid, arg);
 
         break;
     }
--- a/xen/include/xen/domain.h
+++ b/xen/include/xen/domain.h
@@ -79,9 +79,6 @@ void cf_check free_pirq_struct(void *);
 int  arch_vcpu_create(struct vcpu *v);
 void arch_vcpu_destroy(struct vcpu *v);
 
-int map_vcpu_info(struct vcpu *v, unsigned long gfn, unsigned int offset);
-void unmap_vcpu_info(struct vcpu *v);
-
 int map_guest_area(struct vcpu *v, paddr_t gaddr, unsigned int size,
                    struct guest_area *area,
                    void (*populate)(void *dst, struct vcpu *v));
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -175,7 +175,7 @@ struct vcpu
 
     int              processor;
 
-    vcpu_info_t     *vcpu_info;
+    struct guest_area vcpu_info_area;
 
     struct domain   *domain;
 
@@ -288,9 +288,6 @@ struct vcpu
 
     struct waitqueue_vcpu *waitqueue_vcpu;
 
-    /* Guest-specified relocation of vcpu_info. */
-    mfn_t            vcpu_info_mfn;
-
     struct evtchn_fifo_vcpu *evtchn_fifo;
 
     /* vPCI per-vCPU area, used to store data for long running operations. */
--- a/xen/include/xen/shared.h
+++ b/xen/include/xen/shared.h
@@ -44,6 +44,7 @@ typedef struct vcpu_info vcpu_info_t;
 extern vcpu_info_t dummy_vcpu_info;
 
 #define shared_info(d, field)      __shared_info(d, (d)->shared_info, field)
-#define vcpu_info(v, field)        __vcpu_info(v, (v)->vcpu_info, field)
+#define vcpu_info(v, field)        \
+        __vcpu_info(v, (vcpu_info_t *)(v)->vcpu_info_area.map, field)
 
 #endif /* __XEN_SHARED_H__ */


