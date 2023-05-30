Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BEAC715A6A
	for <lists+xen-devel@lfdr.de>; Tue, 30 May 2023 11:40:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541035.843323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3vps-0002mi-IV; Tue, 30 May 2023 09:40:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541035.843323; Tue, 30 May 2023 09:40:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3vps-0002kM-FV; Tue, 30 May 2023 09:40:12 +0000
Received: by outflank-mailman (input) for mailman id 541035;
 Tue, 30 May 2023 09:40:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8LP9=BT=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q3vpr-0002kG-UC
 for xen-devel@lists.xenproject.org; Tue, 30 May 2023 09:40:11 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20619.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::619])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f7b3aac5-fecd-11ed-8611-37d641c3527e;
 Tue, 30 May 2023 11:40:09 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM7PR04MB7062.eurprd04.prod.outlook.com (2603:10a6:20b:122::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Tue, 30 May
 2023 09:40:08 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6433.022; Tue, 30 May 2023
 09:40:08 +0000
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
X-Inumbo-ID: f7b3aac5-fecd-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=efMjdv7Y7y35+6rF8/j3SdstbkG7NBHek+zW/FeNOi0h7h91vzv53hw5aKjvMUerpnvdJwqAw+z5d/LAwX92iyczNoV3Kcj24YM3V8puoDO3hOCUjOv0/9eIXEtCXZPw73v/twR/wGPtU0L3vWFXzYO7RPHuBopHZjoezzuO38vpc6gFGEb9kD0kYiweg6A3oYBiS4Hlc8rtmm/5pIgPJvxQdyzCSJcDXPPq+yG84O+64GOzBN/zX/w1wgN19ardeVUwwe5n9XGzDWPD8edQaxKCVtUDRsPAZSBtr0nMNJNypqEJghaRU24pVmkPrkAyoIZRZiXgn3F41041ulHlGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QPlRds1aKkS9Jt2WZWKGp/RmajI79kjJd7AQIbdsjcQ=;
 b=chUIVMNroHsgzIP5EEU7rwK9pB0/fuZisTVuDv5EAtTkOpZkagkLprOBJYKyxwLb0S58NqSXNMlm9+lyVDq9rR/ofckYPejF1jD93zJoB6YLpV1ITaul6S9FcjesITl0i8SfZovo4yIVOk8c2vEnNIw2zE+PVECA2kzqalajHHs8Xi/6h2s1vhKgq0gJ24LIij9JuAH4819KypLqyz5pJZvVyOqCLdF/s8+KI+3LDbm1J3oD/B8lH72zRzYtDDvDYjNoyqaXvDJ4vZGJ+guTO/AgzZZXzLtVcHCmblC431kFm8+5zsg/k1PpC7rjSIobVR55X5UJxOsh3CI6wur2Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QPlRds1aKkS9Jt2WZWKGp/RmajI79kjJd7AQIbdsjcQ=;
 b=mdGB6BX4FZu4w/CwqSxTM1jR+S0rqKt2mgl+n/OCZPGCH7OGaDwF/DS+hpzvoJ+81eyPLw1LkpfdXKzwEwS0fM24eR3tQ4SmRFnLGpI5dM4MGOFr6RNclynTFjIosNp6LUDYAqAuZx2oS/d9aaO2t4q1Xot1f/RoQH2StokP5SfXAOkBzStVLYls7IN9Amn7f7u5r3T5ZBOWJxjzfqmkTK5o/vFoXKXSbGYpM6wek5HEs+wD/yh++FS36k6Sv/RHbtWyvR5P8gHqrYifiiagMWwr2GqUU9L6TfC5v97Q/StgV/z0Cx9Bye80Z4OCelXbM4D6/W4IfZ8iW7gdkg/a3Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8d31e4a3-3f3c-f7a2-8d7d-0b0febf17f65@suse.com>
Date: Tue, 30 May 2023 11:40:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 4/4] x86/cpu-policy: Derive {,R}RSBA for guest policies
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230526110656.4018711-1-andrew.cooper3@citrix.com>
 <20230526110656.4018711-6-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230526110656.4018711-6-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0113.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM7PR04MB7062:EE_
X-MS-Office365-Filtering-Correlation-Id: ce34007f-377a-4ec4-9950-08db60f1dad5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	l0C0g3gUXqlB8gnQQqPrO4zm8ohEwnElUildO8bT6wsc8JDWYAxcR7gFCH7NAshau21Zcdb2U/my+Zrbkndw/Bn4+2o+A2D2spjjshAd/R6m+mOUyXNT/2/LXa5KDg3uM0mykXRgfu+cdBoGw9WRYsV6PN1rAVz/2sGZA19xdv4ESgpG7cwfvhCtTFFwhokSjY8+cMfJN2M1VecAgq0zMNgFVcY57sDgk7UXqTGOqvSwifKUB8Zx2/OY/dv2BBVMCpxw5eSrKB+Hv4Yldl7AZo3SWN6yxq8eIw8Ml1omv7cR8t+pooTMJTZiNaewzzmEWMXuSFr9qAxa1YGCpZG0jC/Js1wBIKv/LFQqIigiD392GDf4xaQltPWSUnSgHWYeQxkaZEWo94VPSXMIGM9mNzl/Gwtc015rT3bP5fQHX1zWPOxR6LrbmWPZAqt13WbaTziY61qnCWchhhr22WGQqlRH7zhIdPpLs147zr0H2C8v5RCX9nH534qxaujgFtoaEOVtVmi/ndHcT1wgM8/cMm/bAZPeT/cvpzQFSHRRkHAOQ3LDslLinrzTPuJeMunVEanW05iop9gbItWZ/geFreqP6BwbZUulD2cofYf39jiOVIVvoTBTq5v/P71CJAUXB7AnpCDpZUkryMjiGgkBRA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(136003)(366004)(39850400004)(346002)(396003)(451199021)(26005)(38100700002)(41300700001)(6486002)(186003)(31686004)(6506007)(53546011)(6512007)(2616005)(478600001)(54906003)(66556008)(6916009)(66946007)(66476007)(4326008)(316002)(5660300002)(8676002)(8936002)(31696002)(86362001)(2906002)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aUN1SkhqbUZmNXNMUTFOeStobTV2NXpDMjVvK1g2Y2JpYnRrVGZvcjhPV21V?=
 =?utf-8?B?WHc3RVFvNUV4M2o5eUhNLzZWUzd3ajBoMU5RNGJXNTFJd21MSTN2Z0hETXYv?=
 =?utf-8?B?QmpmYUNaNkdDckk1TGtCOUt1VXVRamxpNXlhOEsvWVJWUkc3eFQ1WWk0Nm8w?=
 =?utf-8?B?dHI0Q1FhRzZuc0hNVm5HQS9lWndDZHQ5ZXliY3d2RFJnaTBjclVNVFhMMHI3?=
 =?utf-8?B?T25EODhrTHBIcTQ5bWpmYTZGaE8zbEVQM1JuVVpPSFVqV1JZVVZMam9EZVJl?=
 =?utf-8?B?ZERrWU1neUpZRGxlV0l1VGtpbE1WNHA5cUg3aFFWZnE3SWZKTE5sVGlQQlVp?=
 =?utf-8?B?ckxHSUVhcGE1b2xGVDF6LzlUb0JpWEdVOFFBTVBhSDlGQmtpTldHVzVOY25h?=
 =?utf-8?B?aVR5eVRxUjlZQ2V5aEdNbThEUlo0dVczd3Q4UkZYK0lGY09UOWd0S2ZPczAw?=
 =?utf-8?B?UW1pYllJVXFOM0d2WE16RG43RU56Z2dUck1GQ1FwNFFCQytROTN3QjFOaTdn?=
 =?utf-8?B?cS9hYjF4d0pMZFJiZmdVelU0WjRoOHpXblZrUlZOdUd6alZsUjh2eVNOYWtX?=
 =?utf-8?B?Y2c3VG5DUlE5cTNHUWRpdEJyYWJnWEduSmRuWURsOWRIbUdVYkkwS0JKQjl4?=
 =?utf-8?B?OWc5eTc0QWo3bW5MZGNRY1RrQkxuVlpFVk5uUVBlbjl4MkxWUjF5dm5kbnRN?=
 =?utf-8?B?bVBENEhvZ241Q1lmZ1JJQ2c4c3NrU3NXQWZSL0FrZGMvRTJ5OENocTNsUzhW?=
 =?utf-8?B?cmxjejduRE9CVytwUzdBTzFVY3ZtV0Y2SWV2dFpZeCt3OHlZUjhXeUhwNlNO?=
 =?utf-8?B?ZmNiNFhFQnFzSzQzSFp0MElwY1laY3kzcmpvRWZnV2RaYXFadUw3M29FZ2Qw?=
 =?utf-8?B?SUF4bVlWbCtKb3htQ3Q3T1VJQisvYU5LWTA4ZWNLUDNTcURnWTg5SExuRzdB?=
 =?utf-8?B?L3o0bkpWMmNRVExwOFp5cUdVcGpZSEFVL1dCdXJqY05WQnhRSUt5VENaSUk3?=
 =?utf-8?B?VHBRWngyMnRhdEE0TW1rdXYxY2JUQWdWTldGUGtTMmVRNVVoZVRrVHZNVFVs?=
 =?utf-8?B?bEJQT2VmdHBuVllSYXdiOE5ReWNteHlJTXJnS0JnT3dGZHQrb3h5VDZNZk9J?=
 =?utf-8?B?SGF2Y0tYSmZnUWlBeThJZHZ1YVh2V1g0cjJxd1V2SnkxVzJiS2tXYm11Vmtw?=
 =?utf-8?B?UmdlVUxsanhHZFlhZG1TWWhhUzcyUXp3bW1EQmdLRTNMQ09mNWVZWm1hT1hM?=
 =?utf-8?B?VUh1SUQrcVJoQlJ1dU9rZDlValZMMy9IbXpWTG1CWG51MGlDNHZWZm9iNXNl?=
 =?utf-8?B?bTl0NVdmeWNtTFEvYkxrY2Q1SFJFYVZzM1NkQ3dIclEwTlZjTVk1MmxlL0pw?=
 =?utf-8?B?YlFHZVUvOGo2cVBIQ1N4OUJBUnFIdmhoY21iazVZKzRxVlZpR3QvSUxmVk1m?=
 =?utf-8?B?WVVJRWY2RTUwQkkrNFJoRzVwTnpvUWR3YkVlWktjT3ZXNVVMZmlCTnpuVzRw?=
 =?utf-8?B?cG5LWVN5QXZ0WUs3TEUwRXdVM2tDbCtVVFg2NGdaWTlKSE1JVjhaN0tkN2tk?=
 =?utf-8?B?Ty8yMWRmSkFSM0tKZ2pjeVNDNWl1MkhlU081Um82S1NqZHNucjhhTHdRQmpt?=
 =?utf-8?B?bVN0Wk96V2UrR0NCWnJaMFJ3QkFYemVLQ3laeElMVi9wUGhzcTE5cUxDRU9B?=
 =?utf-8?B?NW5BbWRtMnJpOHBrTGpaSlBrdDhVQkxQRkZ0aGJDN0pYN0R4NVZSZlNGaDJn?=
 =?utf-8?B?LzRlODlTU0RCR3F4QUtnS1QxN1N1RENjb0FvaEl0YTd1ZUFERkJTRUVRUWtl?=
 =?utf-8?B?U2N6UmFrYUVoUks4K0NNM09keFRKaDB1VDh1S3RqNitSV0tza1JUb1lBdUtH?=
 =?utf-8?B?KzBCZmhDK3Nwa21TSEV0aHpvVTd6SUlRR2krYmxHWndTaGhpcHNFWU9LbE5w?=
 =?utf-8?B?WEd3bmVheldQUkhZZi9QL0dxMTFOSEpsTGpRdm5EU29BQTZWV3BLb0JLdTFi?=
 =?utf-8?B?Um1kM3NWM1htd3c5SlBQaFE5eFFSYVdCTFJxbmVuRUJlL25CUXRaNUhqUk9J?=
 =?utf-8?B?UC80Y1RyeVRKR05jNHdicThlNU1rZEJZMERwb0hFSGdXNC8xMDk2ZEMwdmhJ?=
 =?utf-8?Q?DQkXgI99sjCakEyHLXbmlAoP2?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce34007f-377a-4ec4-9950-08db60f1dad5
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2023 09:40:07.9366
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a8CWCGthdpAopX2NRvVSHNXyITFmiZjrrWZhc/dEqOS9LijPgZQDN8l3v5tP5SyC4A4B6/ANGRgSSkmk/g1p1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7062

On 26.05.2023 13:06, Andrew Cooper wrote:
> The RSBA bit, "RSB Alternative", means that the RSB may use alternative
> predictors when empty.  From a practical point of view, this mean "Retpoline
> not safe".
> 
> Enhanced IBRS (officially IBRS_ALL in Intel's docs, previously IBRS_ATT) is a
> statement that IBRS is implemented in hardware (as opposed to the form
> retrofitted to existing CPUs in microcode).
> 
> The RRSBA bit, "Restricted-RSBA", is a combination of RSBA, and the eIBRS
> property that predictions are tagged with the mode in which they were learnt.
> Therefore, it means "when eIBRS is active, the RSB may fall back to
> alternative predictors but restricted to the current prediction mode".  As
> such, it's stronger statement than RSBA, but still means "Retpoline not safe".

Just for my own understanding: Whether retpoline is safe with RRSBA does
depend on the level of control a less privileged entity has over a more
privileged entity's alternative predictor state? If so, maybe add
"probably" to the quoted statement?

> --- a/xen/arch/x86/cpu-policy.c
> +++ b/xen/arch/x86/cpu-policy.c
> @@ -423,8 +423,14 @@ static void __init guest_common_max_feature_adjustments(uint32_t *fs)
>           * Retpoline not safe)", so these need to be visible to a guest in all
>           * cases, even when it's only some other server in the pool which
>           * suffers the identified behaviour.
> +         *
> +         * We can always run any VM which has previously (or will
> +         * subsequently) run on hardware where Retpoline is not safe.  Note:
> +         * The dependency logic may hide RRSBA for other reasons.
>           */
>          __set_bit(X86_FEATURE_ARCH_CAPS, fs);
> +        __set_bit(X86_FEATURE_RSBA, fs);
> +        __set_bit(X86_FEATURE_RRSBA, fs);
>      }
>  }

Similar question to what I raised before: Can't this lead to both bits being
set, which according to descriptions earlier in the series and elsewhere
ought to not be possible?

> --- a/xen/tools/gen-cpuid.py
> +++ b/xen/tools/gen-cpuid.py
> @@ -318,7 +318,7 @@ def crunch_numbers(state):
>          # IBRSB/IBRS, and we pass this MSR directly to guests.  Treating them
>          # as dependent features simplifies Xen's logic, and prevents the guest
>          # from seeing implausible configurations.
> -        IBRSB: [STIBP, SSBD, INTEL_PSFD],
> +        IBRSB: [STIBP, SSBD, INTEL_PSFD, EIBRS],

Is this really an architecturally established dependency? From an abstract
pov having just eIBRS ought to be enough of an indicator? And hence it would
be wrong to hide it just because IBRSB isn't also set. Plus aiui ...

> @@ -328,6 +328,9 @@ def crunch_numbers(state):
>  
>          # The ARCH_CAPS CPUID bit enumerates the availability of the whole register.
>          ARCH_CAPS: list(range(RDCL_NO, RDCL_NO + 64)),
> +
> +        # The behaviour described by RRSBA depend on eIBRS being active.
> +        EIBRS: [RRSBA],

... for the purpose of the change here this dependency is all you need.

Jan

