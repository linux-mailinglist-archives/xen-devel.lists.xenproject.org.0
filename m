Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E46B7729D5
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 17:52:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.578685.906309 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT2WF-0002Jz-Ln; Mon, 07 Aug 2023 15:51:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 578685.906309; Mon, 07 Aug 2023 15:51:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT2WF-0002I6-HZ; Mon, 07 Aug 2023 15:51:43 +0000
Received: by outflank-mailman (input) for mailman id 578685;
 Mon, 07 Aug 2023 15:51:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/Szp=DY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qT2WE-0002Hi-0m
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 15:51:42 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0601.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4c096440-353a-11ee-8613-37d641c3527e;
 Mon, 07 Aug 2023 17:51:39 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB9PR04MB9579.eurprd04.prod.outlook.com (2603:10a6:10:306::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.25; Mon, 7 Aug
 2023 15:51:37 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Mon, 7 Aug 2023
 15:51:36 +0000
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
X-Inumbo-ID: 4c096440-353a-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PRy22FFUXgBnKPEnowny5Cyg3alCZ4VfGxZxqFQAqOReWzxuT++H/c2HBYwCjrPVZkpBPXXtBoy/BpPBP0lQN+kGX8sEUBSx4BPLOGelcdwBGoIDlqFBoSMoDY4ViF4rITP/lCLpRBdGqB3bOLasIQl53lkTTxftH2wYGup6Klx8fK3k/L80tOFn5UL8qGaPO0jRQr2H2v4OrLY7Eh8eto17QmtKfurAN9mdjRxqqNjoHJBDfO5oEW0wxEEPJXtmgtIa0xyvUwn2xK/BGrvIzPjURMzp1uTggRZjIwlWJer2CTiqxIsmFCo8AiPio4qbx/ydLHU4MIG43b1pe0Iozw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JZM2aPtkR7BEx4uW72YUYodwBCKkNjvFv4Xb5eFtWpI=;
 b=cTLBZRvbCjrJjgTS17kpq0f0Unc90bW4Bjcp3dz/FvCN5I7Gj1DL86DIORUSeww19u4ghI6EosgXmKi+lkracZP+V8MT8cYzYN7lZGD/8p7DbJ50s2EB7eox9qekeuNgWRMAe0MJHb8J/LcIswj+22NuHa6SZiYK9hGvf++4Y1dDJrZNkR3Zm4QPk1EiB2YC5EyY/I0d3f8iYoKMla26jsGeeTvt9hb5b9rpdVDOIsG+zZKU8JsFXMWeIY5ETP8sTHymutMif2TcuK6BhxmhGhFpOO/dJjTcu81rei0e39G0zia3I5qaZKA9aHEUQ7qVzaT6KlsuXp+qY8TNyXBNZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JZM2aPtkR7BEx4uW72YUYodwBCKkNjvFv4Xb5eFtWpI=;
 b=3u0rc/LnZJ98RnwOqyjN/+/8XpSrPrz5unkevIkV9rl7uInQ3MVQ1t6FIsKb7exjNy8QtxAygjCarY697B3Zz7vPF6jjRhxm0wJrzltmIyPWR11cK9zuAI8cACSYFxKOoyZHpV9nbk9Y4mYQ3sYlmlB8gS+GH95c0eBXGZBFy1izvJEIxkcLbo28XiDKFBpk5tBgqlWmMOEHHkIJZlnNnL4XRPQsOJCMZWUpra6NMM2GFKSHninBaq5ayue+HgFP/lXMewFsvTqedZHHHpPtkvytcnIyZoPG4Az0cKSnMXYYbvRfDvJQspk6DU7hZsEOZRUSF+nq5MC6WOIiav5pQg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2705d5dd-e74f-4093-aad9-3e54060160f6@suse.com>
Date: Mon, 7 Aug 2023 17:51:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 2/9] xen/ppc: Add public/arch-ppc.h
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1691016993.git.sanastasio@raptorengineering.com>
 <14d8455ca49f69a56e87aad5d4e20cf8f77e55cd.1691016993.git.sanastasio@raptorengineering.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <14d8455ca49f69a56e87aad5d4e20cf8f77e55cd.1691016993.git.sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0185.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::18) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB9PR04MB9579:EE_
X-MS-Office365-Filtering-Correlation-Id: 2339f6a0-4568-4d5a-40b0-08db975e2ea1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZVW4/tcQZymBXP71LjG9leduZcKKMPXeZj+hBC5+mSp0LpIG9JA+VX6LlF0PceNWio8IlMupFyvnT2wZRDBKXNPnFRWXSaRzVIfwIJ8kLdxuQ81IwqAI3ncpXlBTEjde07d/UffepvalFjyxmuRpwjzWj9lI6LoZObIhoMOvlWHrFAODRCjFGHXhSHgTu5gp2mbQUgifxy8LKgnmdnhkjqNaWyoVmJYrOovfP2GFhLae/CCTeit1cAqXbGDHP00yvRW/XovE3Y54XUibvtdMThLA+jraaaWTUvJqg7XtC9ccS1a+T//LDc3YG2zv417O37sK6gEBENpd+JxaFLUEQOkAGMgMK9dxKC1o1LFH+5+H1rGgaSHkGNOAv9wZpnqP3d+RWeHOqQ3ah3xd0yysC94g/qCAFqjtk8BGWpgjxor5UWGxQc2RMWvyofvRHzicyD3LXOJgshbI7v41o1RZn0Qoq/DXA62dK5VPJQjeNgnl8ASWEEmKAYscKvI8uGerxlTQTmr5X2JpR7GsR4XFieiqRlgTALXOiBB7DiGyhPgkn+Nx7Zf2UC7626E2Rp18fGjBiXhwzm3VnRO//23jCxku0THPMFG96HCGBm75DWn0Dp0hKIQ9e2st33swYemgvJcpwXHYj0Sl4VoPxODYRwhN0To9r26p/87q8xOZbR8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(136003)(39860400002)(366004)(346002)(376002)(451199021)(186006)(1800799003)(2616005)(36756003)(6512007)(4326008)(316002)(6916009)(86362001)(38100700002)(54906003)(66946007)(478600001)(6486002)(66556008)(66476007)(31696002)(53546011)(6506007)(41300700001)(26005)(8676002)(8936002)(66899021)(2906002)(83380400001)(5660300002)(31686004)(21314003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T25tWEUrRmJ5Yyt1V3ArVFlTbjYyZFNlb2d1RGZuQjliK2lXblZQTUdxS2Vl?=
 =?utf-8?B?alh2VDFHN2NMWXk2WHBwYUpibzE5aysrWWRHQVV5Q1ZNMmNZcmJ5WlVmNjhU?=
 =?utf-8?B?U09QZGxLV3c5Rmk5MzU5bnNsQWI3REJmUDVhc09kRlJaSlVWNE5Wd0VublBR?=
 =?utf-8?B?WFhFOHNqWXR1ZVZ0YklRaFVCeUd1cjZTSkh6Ty9idHg4eEY1b3lKQlpub0tN?=
 =?utf-8?B?RllpOGczOHRZaS9WSlVNeTBMK2tvWkxWbFNmUFVvaXhlOTU4TGlsOFF5T2po?=
 =?utf-8?B?TFlzVFRXblJhbkd2SWY5eWFVcjJxa2JZU1NrY2lJSEVyZVBqQ0J1cUcvbm5F?=
 =?utf-8?B?Vks5N2toM0c3YmJJRXdPeFZZY0ZYcHF4MzNqM2JUMjRUMGcyUmNYem56VnpY?=
 =?utf-8?B?V2U5VlgzL1BFMENhUVJuQkZrZTZlMUhpN09XV0R1RXV2REZwYnlUWGUyVEhx?=
 =?utf-8?B?M3F3cUNHZGFtVHV4RmthQWZlVStoTEpCbnpqMGNxdU1rWnZqSnhwRGQxaTlv?=
 =?utf-8?B?VVQzU2NWTTZyaHAzVXRlOXV4T3dZVFIrYWFJdStJcWIvbUJ5QS9IMzQzM2FX?=
 =?utf-8?B?a25BcDFqZlJoRlJESWpqbkJLb3pOUHFlaUhOTktQdEg0WG4yazc2TUhEUXpZ?=
 =?utf-8?B?U2NUaDRSN0dtV3VFVStXQURsbFhZTktRSjhSM3RkRlVHNlRIYmpOZ3BubWlo?=
 =?utf-8?B?Z0lRK2FJSWhaOEFXZHJWQ3dwRzhVTDZQb0RMek4yYzBDYmFJN1Q1d2FWRW1q?=
 =?utf-8?B?c2h0dmY1Y0F5MllEWDhyNmtEMUp5V0ZTTUdvV25zdFlnMDZ2NXpUWEFQMmQ4?=
 =?utf-8?B?cytrQ3RUaXg4eTdXSXNlcFI2cWJPaTVrazdOQVM5ODUwc2lITUVhS2tVbkxz?=
 =?utf-8?B?eExFZy93aTB0T1RsTnIvd1ByUjNvbkNIVzhkbmdwRUo0djdIV0hETGRxSjMx?=
 =?utf-8?B?Z3F0dDRMOUdjNHRNbnl0Q2J5WFRkeG0xNmlXOTljWkIrQ1lUZHJzUVY4Y254?=
 =?utf-8?B?dWJoVUFkM081MG9sV3R0dWx0M0FjQXhaSUVzRjI1VWllSmFUNU53d1FnWUli?=
 =?utf-8?B?YW0yYk9od2d5eE40N3dDMjd2WkplSUs1NXNTTkEwYk5jMFVOUzh0TmVVTk9K?=
 =?utf-8?B?RDNtUFhMNjJ0R0RLeEY4MERRc2ttZTVjWTArZ2MrS2hjOFZOaE9PWVJKenU1?=
 =?utf-8?B?SjBLUGxaeSt5M2RZWjNVVUh6c2NSS3JoWGp1VGYwbFNHM1dpSk01L3V3YStL?=
 =?utf-8?B?YWZMWHpkRUI4aVVrZmVpb1VWMytVNkVyRXdVdWdnam5scmM0OG9nT3d5Tlhu?=
 =?utf-8?B?VlJjM2QydmVRZEZ3UTFORTZFc0p6QVRjMWNHNExrUlRzS0lTZzdiNnpLNWxy?=
 =?utf-8?B?YzdVWVNmWUJpSkZidFVHL2JNRTdFUnFYYU5BbWh1RkNqNzBYM0drYWpxcHEr?=
 =?utf-8?B?WkRXVEQ0QS9JWHY4NWRGS09jckZRUVIzUFlpZlk1YmJHL1djbEtjVkErK1Zh?=
 =?utf-8?B?b0hIeHJTa3Qxbi9GVHBVNmtyZk56TjRDWGcrNXpJN2k0NWJHdkRtYXk4cmtu?=
 =?utf-8?B?YkRBSTM0QzFkR2lGV1pFSzRLdmFOa3kwVWptYk1kQ2RJRWNOaTE2SmNZK2c4?=
 =?utf-8?B?QXFaT25nbXVUQ0RjUXJyamJYUUZZand0YnFGbWc4bGZYcnBBZ1N3VWdPQXh0?=
 =?utf-8?B?UGx6cnlSZDgvS1N6VmxBOUhYUjFVVmg5eGpRaU1HZmNvb0o2dUtRMjIyOUpj?=
 =?utf-8?B?dkZ3b0dQTUR2WlJoWm9heUhpeEx0SlZsMjFwQ25RbDZoUmRUN1hCenFvbVRF?=
 =?utf-8?B?enRpZ1lzTm8reW5CWDlsYUFNYm1XSG8rMGZJUkVCTFJuOFJuenNaMUlaaVJO?=
 =?utf-8?B?c3k1aVVFVzVpNGhzZ0JLWE0wT1NQMGcxeGVpdEtRZVo4cGZmSXdUczA5QWcy?=
 =?utf-8?B?VFM1L3RpYmVNTWJMTFZ5MzZkTEhpOWUyd3RuVy93M3hxMkpXK3ZjSDZUODNC?=
 =?utf-8?B?b2lldXJqRWlYRWRlQXkzWFRBaXgwSzN5YmZVR245eTJVZjk4TXBNL1RwN2dT?=
 =?utf-8?B?dFZ3ZHlkQXRIREl0UDhBNWM1V1EyMVBCV0JQMUlXTk95eGtGRnFRWW13cCtC?=
 =?utf-8?Q?OtciGJ2G3Bf/mNn8BRGC9o8gb?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2339f6a0-4568-4d5a-40b0-08db975e2ea1
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2023 15:51:36.9401
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C8ksfYEEJfu06bU/1HRb1x+u+ho6KPPCm0f39bq88iuL+wOPhD1GLLQNg2IBUAXweJ8mUp5LcTOO4Cc7jJ7MzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9579

On 03.08.2023 01:02, Shawn Anastasio wrote:
> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
> ---
>  xen/include/public/arch-ppc.h | 140 ++++++++++++++++++++++++++++++++++
>  1 file changed, 140 insertions(+)
>  create mode 100644 xen/include/public/arch-ppc.h
> 
> diff --git a/xen/include/public/arch-ppc.h b/xen/include/public/arch-ppc.h
> new file mode 100644
> index 0000000000..0eb7ce4208
> --- /dev/null
> +++ b/xen/include/public/arch-ppc.h
> @@ -0,0 +1,140 @@
> +/*
> + * Permission is hereby granted, free of charge, to any person obtaining a copy
> + * of this software and associated documentation files (the "Software"), to
> + * deal in the Software without restriction, including without limitation the
> + * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
> + * sell copies of the Software, and to permit persons to whom the Software is
> + * furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
> + * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
> + * DEALINGS IN THE SOFTWARE.

Any reason for a spelled out license rather than an SPDX header?

> + * Copyright (C) IBM Corp. 2005, 2006
> + * Copyright (C) Raptor Engineering, LLC 2023
> + *
> + * Authors: Hollis Blanchard <hollisb@us.ibm.com>
> + *          Timothy Pearson <tpearson@raptorengineering.com>
> + */
> +
> +#ifndef __XEN_PUBLIC_ARCH_PPC64_H__
> +#define __XEN_PUBLIC_ARCH_PPC64_H__

The 64 wants dropping here, considering the name of the header.

> +#define  int64_aligned_t  int64_t __attribute__((aligned(8)))
> +#define uint64_aligned_t uint64_t __attribute__((aligned(8)))

I understand arch-arm.h has it this way too, but in public headers I
think we're better off using __aligned__ (in the example here).

> +#ifndef __ASSEMBLY__
> +#define ___DEFINE_XEN_GUEST_HANDLE(name, type)                  \
> +    typedef union { type *p; unsigned long q; }                 \
> +        __guest_handle_ ## name;                                \
> +    typedef union { type *p; uint64_aligned_t q; }              \
> +        __guest_handle_64_ ## name
> +
> +#define __DEFINE_XEN_GUEST_HANDLE(name, type) \
> +    ___DEFINE_XEN_GUEST_HANDLE(name, type);   \
> +    ___DEFINE_XEN_GUEST_HANDLE(const_##name, const type)
> +#define DEFINE_XEN_GUEST_HANDLE(name)   __DEFINE_XEN_GUEST_HANDLE(name, name)
> +#define __XEN_GUEST_HANDLE(name)        __guest_handle_64_ ## name
> +#define XEN_GUEST_HANDLE(name)          __XEN_GUEST_HANDLE(name)
> +#define XEN_GUEST_HANDLE_PARAM(name)    __guest_handle_ ## name
> +#define set_xen_guest_handle_raw(hnd, val)                  \
> +    do {                                                    \
> +        __typeof__(&(hnd)) _sxghr_tmp = &(hnd);             \

In new code, can you please avoid underscore-prefixed macro locals,
which violate name space rules set forth by the standard? We appear
to be adopting underscore-suffixed naming for such locals.

> +        _sxghr_tmp->q = 0;                                  \
> +        _sxghr_tmp->p = val;                                \

"val" need parenthesizing here.

> +    } while ( 0 )
> +#define set_xen_guest_handle(hnd, val) set_xen_guest_handle_raw(hnd, val)
> +
> +#ifdef __XEN_TOOLS__
> +#define get_xen_guest_handle(val, hnd)  do { val = (hnd).p; } while (0)
> +#endif
> +
> +typedef uint64_t xen_pfn_t;
> +#define PRI_xen_pfn PRIx64
> +#define PRIu_xen_pfn PRIu64
> +
> +/*
> + * Maximum number of virtual CPUs in legacy multi-processor guests.
> + * Only one. All other VCPUS must use VCPUOP_register_vcpu_info.
> + */
> +#define XEN_LEGACY_MAX_VCPUS 1
> +
> +typedef uint64_t xen_ulong_t;
> +#define PRI_xen_ulong PRIx64
> +#endif
> +
> +/*
> + * Pointers and other address fields inside interface structures are padded to
> + * 64 bits. This means that field alignments aren't different between 32- and
> + * 64-bit architectures.
> + */
> +/* NB. Multi-level macro ensures __LINE__ is expanded before concatenation. */
> +#define __MEMORY_PADDING(_X)
> +#define _MEMORY_PADDING(_X)  __MEMORY_PADDING(_X)
> +#define MEMORY_PADDING       _MEMORY_PADDING(__LINE__)

This doesn't parallel anything in other architectures afaics, and it is
also not used anywhere in this header. What is this about? If it needs
to stay, it'll need properly moving into XEN_* namespace.

> +/* And the trap vector is... */
> +#define TRAP_INSTR "li 0,-1; sc" /* XXX just "sc"? */

Same question / remark here.

> +#ifndef __ASSEMBLY__
> +
> +#define XENCOMM_INLINE_FLAG (1UL << 63)

Is this an indication that you mean to revive xencomm.h?

> +typedef uint64_t xen_ulong_t;
> +
> +/* User-accessible registers: nost of these need to be saved/restored
> + * for every nested Xen invocation. */

Nit: comment style (and s/nost/most/).

> +struct vcpu_guest_core_regs
> +{
> +    uint64_t gprs[32];
> +    uint64_t lr;
> +    uint64_t ctr;
> +    uint64_t srr0;
> +    uint64_t srr1;
> +    uint64_t pc;
> +    uint64_t msr;
> +    uint64_t fpscr;             /* XXX Is this necessary */
> +    uint64_t xer;
> +    uint64_t hid4;              /* debug only */
> +    uint64_t dar;               /* debug only */
> +    uint32_t dsisr;             /* debug only */
> +    uint32_t cr;
> +    uint32_t __pad;             /* good spot for another 32bit reg */
> +    uint32_t entry_vector;
> +};
> +typedef struct vcpu_guest_core_regs vcpu_guest_core_regs_t;
> +
> +typedef uint64_t tsc_timestamp_t; /* RDTSC timestamp */ /* XXX timebase */
> +
> +/* ONLY used to communicate with dom0! See also struct exec_domain. */
> +struct vcpu_guest_context {
> +    vcpu_guest_core_regs_t user_regs;         /* User-level CPU registers     */
> +    uint64_t sdr1;                     /* Pagetable base               */
> +    /* XXX etc */
> +};
> +typedef struct vcpu_guest_context vcpu_guest_context_t;
> +DEFINE_XEN_GUEST_HANDLE(vcpu_guest_context_t);
> +
> +struct arch_shared_info {
> +    uint64_t boot_timebase;
> +};
> +
> +struct arch_vcpu_info {
> +};
> +
> +struct xen_arch_domainconfig {
> +};
> +
> +typedef struct xen_pmu_arch { uint8_t dummy; } xen_pmu_arch_t;
> +
> +/* Support for multi-processor guests. */
> +#endif

Stray comment?

Jan

