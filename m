Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD3076A5AC0
	for <lists+xen-devel@lfdr.de>; Tue, 28 Feb 2023 15:20:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.503399.775670 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pX0qG-00081P-58; Tue, 28 Feb 2023 14:20:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 503399.775670; Tue, 28 Feb 2023 14:20:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pX0qG-0007yh-2J; Tue, 28 Feb 2023 14:20:32 +0000
Received: by outflank-mailman (input) for mailman id 503399;
 Tue, 28 Feb 2023 14:20:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rjMb=6Y=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pX0qE-0007xt-Kv
 for xen-devel@lists.xenproject.org; Tue, 28 Feb 2023 14:20:30 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20619.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::619])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0da62a22-b773-11ed-9695-2f268f93b82a;
 Tue, 28 Feb 2023 15:20:30 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by GV1PR04MB9120.eurprd04.prod.outlook.com (2603:10a6:150:27::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.30; Tue, 28 Feb
 2023 14:20:27 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%7]) with mapi id 15.20.6134.030; Tue, 28 Feb 2023
 14:20:27 +0000
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
X-Inumbo-ID: 0da62a22-b773-11ed-9695-2f268f93b82a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PSC3BSRkap1o151+zZP13BSk+/oZmNjRJk64+KYFPyecMncciDOxyVlnP7tBT2ihtKO/NmKyfZOX8gbCEUTC4GJjC9PdGy8uD6UBD69P3nPHSh8vponZpB8gb4ZKaFWBgH2E9dWT8HA6M0M7bUcMZstS0NTlG973hAjfXjjClYkbW9xkTKf5HXROxE5Mrii7QaJepGYnHU6RCg/zG5PIWIzY7CyNXg9qQ6gg2izp3wc4+N9HLR3w4f3d7Ba1vDG1hiZk6lWm9ybmq9dOA6e6/1E/4fuJ2oN/D1gClBKl04nVT3rKd2gH0DP1jjGL1JmcI4k9RJDMHkcUArbzI/V+gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uVVvDQntc9q315EaDSRyD/80w51FevqWqxKqEXf8RQY=;
 b=QzGtmjj3Xre/rVVm46QBYcMlkJdhnSfHuUvN9SI0PmX1BkMTchHFOfGFJPqVv0EicLvuZwJmDf80Jed/zL1CSeKTQ/2B2tk/zL2KBosT1tF5UeMvZzyecP1ZJ+rU8RXTbK1LsvKym9LCav1GdQQvuFuboe5PQeWwAK9xjGq4hrVNtgPF2hNmyfM2UWedPmegqyW8jO1ct/e5HCy5BmFs1GTLxJ9KIjIQzHkYbIxWzhk54+RQ+ontqIDNB4E5LOKwR78VelbJ35a48Ex7b0TYmWHRdyr3N8qdbDXfDLW3H4DEIMqYrLGXp4uWnRl/j+JLZpAWx42uZKsTGkMIFAEHOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uVVvDQntc9q315EaDSRyD/80w51FevqWqxKqEXf8RQY=;
 b=a011LjkdeoQNuTpZELEguiet2BXm2WiNJBK3AzbLoPEicU7k3W74mjtmTTzs4LXiNU8Mu98tymmecBg2+4oyn8em+m6uVuVh3evvmTnql0ZvziedtQ+FeyBcgzsN0hnRcJg6he48q2MMmsDOtGgP7SMc9dCtIADHo3j1YXRD0ORL4vOyWumFQc90DChElYWivp65/Bh/lEZpa45xpUH3pV22gk2oXDCT/TQOygwzLyFxLz/HDLPizLwxhPHsly7+tozu0TEI/ZfqndiF4MLw/xj9GCV1ocRQjJz4PRj9bGPPiEpA8w/kM1CLoLrd8Pf+lO8HDv4WIO+Ow+mVCLljhg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <bf77733a-d0cc-8e31-5a05-f0709e7ef1fb@suse.com>
Date: Tue, 28 Feb 2023 15:20:26 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 2/4] x86/svm: split svm_intercept_msr() into
 svm_{set,clear}_msr_intercept()
Content-Language: en-US
To: Xenia Ragiadakou <burzalodowa@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20230227075652.3782973-1-burzalodowa@gmail.com>
 <20230227075652.3782973-3-burzalodowa@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230227075652.3782973-3-burzalodowa@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0059.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::21) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|GV1PR04MB9120:EE_
X-MS-Office365-Filtering-Correlation-Id: 3580b1f7-4174-457a-986f-08db1996f099
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	86tobA+56FQgW7FtGfSDMbI5URI71suZizyAvHrjG6ylga4C1TAufPvwhWio0whfzvOyuXWS94XZ7nTG7XRf8hHY/srPm5KNnnC5/5gicnnStiVcI7Jh8FWeeoTBe7Nnf2BCuqdm5A1zw78B7xVH2+HO79tPI5BgSW1MOQQG1PrZQnnol9wkm7AJJ1gqiD31mWF8kVzKTpWlO+3d6ndOjSiy33abCE383XVYZLoeh/eelSiE+jhrBIt8o7F1Lf3jJ7yyAmGmdvsCOs8P7jXIKtlEB5wySLVVRJUE01cZ56ldxQsdSWPpYK8yt883NJ9GNrlvXdyplCwTKcFceWD1qCvbGHZ67ARCR1C1ZsKrYVLxhh6qz95zoFw0TjGaI5zxXZ2cwgl4mqNy/gz4TtPs1Qk96vYyfQfzsg2C/OCkwEGRbFBLFkGyzRy/ueXdrJVoQ4NECTrKgvDgW4sVLKkeCXgUoQunpikKQQzpJ4b5UgjwRzoft0bZ8sjcQH6ny/GYnbG153ryhOqddIQiZNhDIbvpdwmh06pqx428tn8Po/L/OUbQ2PbQKOOmISl81dBnorRNzJoi4bWOUv2SdCkRxcIB5eMJ+yOYjEb62plVIC1Igzpu4JQ8wXt4ytpcX+Nfd65KY5vPTykiAh07oQEw1niKOMUOiWZ+EtQSoOzA9XHoZRuc+KSar1E8nSz6MyjFBY6KQdioWmDVAAYH6vne01op0Vrmmeln+sjqa5Ud1Qo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(346002)(136003)(396003)(366004)(376002)(451199018)(6512007)(186003)(26005)(478600001)(6486002)(316002)(66556008)(66946007)(66899018)(4326008)(66476007)(83380400001)(53546011)(6916009)(8676002)(6506007)(54906003)(31686004)(2616005)(41300700001)(8936002)(5660300002)(38100700002)(2906002)(36756003)(31696002)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OHRXRmtCVVlIQmp5dmJwR3duZ2lBZXpId0dJYkxvRk5KUlZCYmxUd1Z2UTFm?=
 =?utf-8?B?TldIMWhZQ05zMkYxKzlJUUdyZ2REeEJveUp6YlVFQll6WjM1Y0FaK3dGamFl?=
 =?utf-8?B?RW9ybkx2bzFzNHk1K2ltVFF5M2EyWmJBa2JnalZDZjJwRHR6Z0ZiWEwvd21Q?=
 =?utf-8?B?OFhDUjFtdTNhYkRxSVhmYVQ0ZzV5ZmhaTFVUTVprWFZ3aWVJNHVpdmZZRWZG?=
 =?utf-8?B?S01SMUFTdy9WQlJ2eVdQdVNtcU9Qa1JpNlJpK3IxZ0ZjL1B2NE1IZG5od3Bp?=
 =?utf-8?B?ZWVMOHZ4VWpQWllVY2ZtWVpTN0F2dU14cU53ZlhxdkJjWnhjdmM4dGdJeDlo?=
 =?utf-8?B?UWZaR3FPM1d1MDJvMWY4ZDg2YTJlOHRZS01HblZOMTluR3pyMmRYTzRCZVhO?=
 =?utf-8?B?d1N4S2dKa2pmTFJVOVZQWXJrUkxQQ2pMZjF3TnpxVG5OeDFlMm9DUDd3QnRU?=
 =?utf-8?B?ZFJ4dndoTGJqVkdEMXlLUlBMUVNUTE9pNkoyZ2V6NnV2dGlpWlpGWVZrKzQ4?=
 =?utf-8?B?a3lxbHdUelJCRGRHM3ZUc0FvWlk5NUU2VVBhV255Rk9SWXhrRFgwVVE5Smgw?=
 =?utf-8?B?L3dMNDFMdnQxWFJ1TU9DZlVjTUl4Sjczc1RLdkUxMlB1WlJlWkhyblNFWFJT?=
 =?utf-8?B?dW5aKzUxTlpYMDdidmNKVkNPbUgzemRGc2V5QlJlNjBaMm1UbGdZaForQmFp?=
 =?utf-8?B?UUVKUEh3d0cvbDloQldmQjNYbTUvOGVkQkZLYVZLUHdUbHF5d3dCSjlxZFpK?=
 =?utf-8?B?eEVFUkQxOUpjWnZnVGZrbTl5RWR3MDJTbjlvTEdPeXRMRHRuK3BiTVg2SDZZ?=
 =?utf-8?B?TEJkNUFZSlNWTmZlNTV5WFFJenVXaThkM21odUVSVlZHOVFiaStFelVTcmZw?=
 =?utf-8?B?SmRUeXFkUWJvbHpZUDdvNnV1MTdoQzMySWxRQ0xpaU4zZ1lDdlRCUjFLMXZU?=
 =?utf-8?B?S2hpcXNMcU9zalEyZFMwTHBESnEvV0hJN0lmKzRJTlF0Wll5S0NoYis5b0tH?=
 =?utf-8?B?a2U2WGNxRXN0TUxNYnpwcTdCZE93WS9rQzgxajBqWnJ0YlNac2N6YjRrYURa?=
 =?utf-8?B?cDZWOTFNWkFPM3hIQ0FJdVhKd2lPZGN4ZnptSy91Rktzb1JLaGpyei9jazMw?=
 =?utf-8?B?K0w1SUl5S2syMXNGT29XMFBHREc4V0dnNHhQN0xabVhES0hrbnRsMlRXclNJ?=
 =?utf-8?B?M1A0OEFHSmlJWEJsS0xsSXovemdHbUt3TnlLWHFVc1FkT1FJWGp6djFRbFZm?=
 =?utf-8?B?aUNXUGJ0am9qaHJ6NTNyajJib1RldTVCdGh1SnY1cjg4MURhWHhCVEZPZlpw?=
 =?utf-8?B?UW8ra1lycXVJNmNKVlVCVDJJeDF3RjZvSE9OSmw0a0xJN1FNUHRQbUVKaUFW?=
 =?utf-8?B?Mmk4SldGTFhZM3gzdDdUbHpJcnRCNVRVYWp1Slh0S0VFTEg2NGVESmJjN3Vt?=
 =?utf-8?B?QWdnckZMSitLaVY2T2x5U1M1TW93L1JUMFBTUVR3eTkxRERxV2JJamttbUF3?=
 =?utf-8?B?VnVNckZabHEwRnM2d0pvZ0dsa21STUNBSEFEaEZSVkpxQXE5TVRMT05FR01I?=
 =?utf-8?B?YkFlVzdUanh1YjZsZlUyWkRkV2FpVm1rTnpYcCtpeUQwZHlVMGhxUWtQeU9y?=
 =?utf-8?B?a3NSYWpRUVdRUm40L2VvM3NOc0FTTHJWMlZVRlBiUlJtaE9McHA4ZWJndjUz?=
 =?utf-8?B?dEtkYTE1WFlFcDVlaGY0dlZqa1NaQnBVS2F5U1dXQ0I1QVNOUVRhMlUwTmkz?=
 =?utf-8?B?eEU5SDZRYnhTeGZGRkYxUHZ4bVlIVk1yU3VkOFFtWkl5emE2RTdaWkYrbDQw?=
 =?utf-8?B?YnMybHhyRFpEYjBGTWZGVXpmTXFwZXdUVFpOejFINVd1YW0xN0tqK1ZnNFlk?=
 =?utf-8?B?NHp6ZVBHQ0h4dDlVNys1WFB2eXY1RVNSNUlab0pIVWdRODU2RUtuZVNPMW11?=
 =?utf-8?B?cXJ4REhNQ0lmT2hVNkNJbnhTYWpyQTN4Rmg3SDJoMmtTRUZ6MTZWdElZYkls?=
 =?utf-8?B?SkdITHNNeElQSjdsYmFaQ2ptTHFaalUvRkI0dmFCL3hJT1V4L1VzQXJsc1Qx?=
 =?utf-8?B?RkE1UFc5VUNwa0w5NUtjWnM4S2REWnZiYzE5S2VXUlhPNE1PRUFmQk44T2Rs?=
 =?utf-8?Q?6GkFY+vZCkhmxO3l3DK1hTeya?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3580b1f7-4174-457a-986f-08db1996f099
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2023 14:20:27.6537
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vmHKuGwiIJw60BCx0ESKzLf18HdSaVpXswz48YDWFnjvdarfTvyefup54gBzngB4q4Si4RczbkdObx03LwkCbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9120

On 27.02.2023 08:56, Xenia Ragiadakou wrote:
> This change aims to render the control interface of MSR intercepts identical
> between SVM and VMX code, so that the control of the MSR intercept in common
> code can be done through an hvm_funcs callback.
> 
> Create two new functions:
> - svm_set_msr_intercept(), enables interception of read/write accesses to the
>   corresponding MSR, by setting the corresponding read/write bits in the MSRPM
>   based on the flags
> - svm_clear_msr_intercept(), disables interception of read/write accesses to
>   the corresponding MSR, by clearing the corresponding read/write bits in the
>   MSRPM based on the flags

In how far is VMX'es present model better than SVM's? They both have pros and
cons, depending on the specific use. I'm not asking to do it the other way
around (at least not yet), I'd merely like to understand why we're going to
gain two new hooks (if I'm not mistaken) when we could also get away with
just one.

> --- a/xen/arch/x86/cpu/vpmu_amd.c
> +++ b/xen/arch/x86/cpu/vpmu_amd.c
> @@ -165,8 +165,9 @@ static void amd_vpmu_set_msr_bitmap(struct vcpu *v)
>  
>      for ( i = 0; i < num_counters; i++ )
>      {
> -        svm_intercept_msr(v, counters[i], MSR_INTERCEPT_NONE);
> -        svm_intercept_msr(v, ctrls[i], MSR_INTERCEPT_WRITE);
> +        svm_clear_msr_intercept(v, counters[i], MSR_RW);
> +        svm_set_msr_intercept(v, ctrls[i], MSR_W);
> +        svm_clear_msr_intercept(v, ctrls[i], MSR_R);
>      }
>  
>      msr_bitmap_on(vpmu);
> @@ -179,8 +180,8 @@ static void amd_vpmu_unset_msr_bitmap(struct vcpu *v)
>  
>      for ( i = 0; i < num_counters; i++ )
>      {
> -        svm_intercept_msr(v, counters[i], MSR_INTERCEPT_RW);
> -        svm_intercept_msr(v, ctrls[i], MSR_INTERCEPT_RW);
> +        svm_set_msr_intercept(v, counters[i], MSR_RW);
> +        svm_set_msr_intercept(v, ctrls[i], MSR_RW);
>      }

This, aiui, restores back original state (I question the condition that the
caller uses, though, but that's a separate issue). Therefore is the single
"set" in the earlier function actually needed?

> --- a/xen/arch/x86/hvm/svm/svm.c
> +++ b/xen/arch/x86/hvm/svm/svm.c
> @@ -288,23 +288,34 @@ svm_msrbit(unsigned long *msr_bitmap, uint32_t msr)
>      return msr_bit;
>  }
>  
> -void svm_intercept_msr(struct vcpu *v, uint32_t msr, int flags)
> +void svm_set_msr_intercept(struct vcpu *v, uint32_t msr, int flags)

Can the last parameter become "unsigned int", please?

>  {
> -    unsigned long *msr_bit;
> -    const struct domain *d = v->domain;
> +    unsigned long *msr_bit = svm_msrbit(v->arch.hvm.svm.msrpm, msr);
> +
> +    if ( msr_bit == NULL )
> +        return;
>  
> -    msr_bit = svm_msrbit(v->arch.hvm.svm.msrpm, msr);
> -    BUG_ON(msr_bit == NULL);

The conversion from BUG_ON() to "return" needs explanation; I don't see
why that's warranted here. From all I can tell the case is impossible
due to the way construct_vmcb() works, and hence BUG_ON() is appropriate
(and personally I would also be fine with no check at all, provided I'm
not overlooking anything).

> @@ -312,8 +323,10 @@ static void cf_check svm_enable_msr_interception(struct domain *d, uint32_t msr)
>  {
>      struct vcpu *v;
>  
> -    for_each_vcpu ( d, v )
> -        svm_intercept_msr(v, msr, MSR_INTERCEPT_WRITE);
> +    for_each_vcpu ( d, v ) {

Nit: Brace placement.

> @@ -595,22 +608,31 @@ static void cf_check svm_cpuid_policy_changed(struct vcpu *v)
>      vmcb_set_exception_intercepts(vmcb, bitmap);
>  
>      /* Give access to MSR_SPEC_CTRL if the guest has been told about it. */
> -    svm_intercept_msr(v, MSR_SPEC_CTRL,
> -                      cp->extd.ibrs ? MSR_INTERCEPT_NONE : MSR_INTERCEPT_RW);
> +    if ( cp->extd.ibrs )
> +        svm_clear_msr_intercept(v, MSR_SPEC_CTRL, MSR_RW);
> +    else
> +        svm_set_msr_intercept(v, MSR_SPEC_CTRL, MSR_RW);
>  
>      /*
>       * Always trap write accesses to VIRT_SPEC_CTRL in order to cache the guest
>       * setting and avoid having to perform a rdmsr on vmexit to get the guest
>       * setting even if VIRT_SSBD is offered to Xen itself.
>       */
> -    svm_intercept_msr(v, MSR_VIRT_SPEC_CTRL,
> -                      cp->extd.virt_ssbd && cpu_has_virt_ssbd &&
> -                      !cpu_has_amd_ssbd ?
> -                      MSR_INTERCEPT_WRITE : MSR_INTERCEPT_RW);
> +    if ( cp->extd.virt_ssbd && cpu_has_virt_ssbd && !cpu_has_amd_ssbd )
> +    {
> +        svm_set_msr_intercept(v, MSR_VIRT_SPEC_CTRL, MSR_W);
> +        svm_clear_msr_intercept(v, MSR_VIRT_SPEC_CTRL, MSR_R);
> +    }
> +    else
> +    {
> +        svm_set_msr_intercept(v, MSR_VIRT_SPEC_CTRL, MSR_RW);
> +    }

Preferably omit the braces for "else" here, just like you do above and ...

>      /* Give access to MSR_PRED_CMD if the guest has been told about it. */
> -    svm_intercept_msr(v, MSR_PRED_CMD,
> -                      cp->extd.ibpb ? MSR_INTERCEPT_NONE : MSR_INTERCEPT_RW);
> +    if ( cp->extd.ibpb )
> +        svm_clear_msr_intercept(v, MSR_VIRT_SPEC_CTRL, MSR_RW);
> +    else
> +        svm_set_msr_intercept(v, MSR_VIRT_SPEC_CTRL, MSR_RW);

... here.

> --- a/xen/arch/x86/include/asm/hvm/svm/vmcb.h
> +++ b/xen/arch/x86/include/asm/hvm/svm/vmcb.h
> @@ -585,13 +585,12 @@ void svm_destroy_vmcb(struct vcpu *v);
>  
>  void setup_vmcb_dump(void);
>  
> -#define MSR_INTERCEPT_NONE    0
> -#define MSR_INTERCEPT_READ    1
> -#define MSR_INTERCEPT_WRITE   2
> -#define MSR_INTERCEPT_RW      (MSR_INTERCEPT_WRITE | MSR_INTERCEPT_READ)
> -void svm_intercept_msr(struct vcpu *v, uint32_t msr, int enable);
> -#define svm_disable_intercept_for_msr(v, msr) svm_intercept_msr((v), (msr), MSR_INTERCEPT_NONE)
> -#define svm_enable_intercept_for_msr(v, msr) svm_intercept_msr((v), (msr), MSR_INTERCEPT_RW)
> +void svm_set_msr_intercept(struct vcpu *v, uint32_t msr, int flags);
> +void svm_clear_msr_intercept(struct vcpu *v, uint32_t msr, int flags);
> +#define svm_disable_intercept_for_msr(v, msr) \
> +    svm_clear_msr_intercept((v), (msr), MSR_RW)
> +#define svm_enable_intercept_for_msr(v, msr) \
> +    svm_set_intercept_msr((v), (msr), MSR_RW)

Please avoid excess parentheses. Also could you clarify why you retain
these shorthands when you don't use them in the conversion that you're
doing (e.g. amd_vpmu_unset_msr_bitmap())? Are you intending them to go
away down the road?

Jan

