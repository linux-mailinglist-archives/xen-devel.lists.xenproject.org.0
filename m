Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBAF36D6670
	for <lists+xen-devel@lfdr.de>; Tue,  4 Apr 2023 16:58:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517944.803972 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pji6a-0004Yt-8M; Tue, 04 Apr 2023 14:57:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517944.803972; Tue, 04 Apr 2023 14:57:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pji6a-0004X0-5M; Tue, 04 Apr 2023 14:57:52 +0000
Received: by outflank-mailman (input) for mailman id 517944;
 Tue, 04 Apr 2023 14:57:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Jsu=73=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pji6Y-0004Wr-Jx
 for xen-devel@lists.xenproject.org; Tue, 04 Apr 2023 14:57:50 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0630.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 104f1fcb-d2f9-11ed-b464-930f4c7d94ae;
 Tue, 04 Apr 2023 16:57:48 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PR3PR04MB7387.eurprd04.prod.outlook.com (2603:10a6:102:91::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Tue, 4 Apr
 2023 14:57:46 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6254.035; Tue, 4 Apr 2023
 14:57:46 +0000
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
X-Inumbo-ID: 104f1fcb-d2f9-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MkqA52HTGsGEPM35miugkVaUCcy2ru4hCst91XMg6yVjJk+YOkh3F7YNfIv8qIA7ssiiHZUpkCbZch159eXVdSAq5zkABZ44TzhTS/C5MD+cbVq6Zk7Z4b6pE1v2EVERKzTxFDp7muBdQxH4xYef+sUSHL583eRAExUxMq+tV4xH21iMPmPkAfNTJeg73UoyNnOSPQllKwdQhEplRTSxNHxgQ1SRjRyrO3n/lSLGsW5yDofgh2Pe0KrDmGvIDIWKgYrMvRvj083kg8bd1jQA1PNiSAd2R6TJSngCyOxEVmfrhTQwBvvgcp9EE1tf5wFd1TfD0DnL6q9BQZzXHJD6Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AsDrIOoJ4XkstJMEfZwJev2okvsusmdA6pBNEPh/60E=;
 b=eGIvZ07gW4tEn/ePHr6nzsksQKoVyNY++RB3Axt1CRkVGloYJpvvr7PuSMEIj/IAYr8Mxo4DHo/ITD+6hK7eb/0ujFK6SClgyJKK0sQ1LY2FNriEFH6XrDCm6PE943CO6I4wiI7VSVKuyOuTor/l58HRZn3jS/44kId3+Kw1pQc0sWDyPebMUUoMlZQSIYmNYjKCwdRhJ5hm3rdrW0bzseeN8Wn+cNfGnkAwlk8Mu+nNAY0SEXELNL4gCljYe2TNZyCCHjHjtiOw3Fbi1kjC+aPKDDsQw/e/l9ueyRJmuAJrvSf5hv+jpLMA/mrg87qvEBiCdPNVbLT0sxHm2YEw4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AsDrIOoJ4XkstJMEfZwJev2okvsusmdA6pBNEPh/60E=;
 b=V0H63stCf+XcTSPlqe45Uh8sLOv/pEl13b3f7lNZNSLADEmuSAzyHox9CGpeC0VjzHcZVdqcnUbJN/f6xGaGDuW7NcjrhVibdPi701tYigkSeNAPwN5jcvHDdM9OxuocCCMxh/8kKgPwcZvY4DtXsPQ3ywXtGmr7o5Uhj8Wnsc3ezsgNeOwss9ApAC46UC7O5Tqo4Hbo8Mb/OlOl2aL2mSUYS0c3RJK+N36SQd92gtYYplwp1phCQglvjzq0vWCdO55Tapts05oF7dhrLzlW3rNj0QVsEeCFP3xJHcfTCG/McTUeIkyp9LQWr8CJjAbCNgC9UBvEVqD6wpnk2vxODg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <31d27d25-f576-d605-d3d1-b56b543df568@suse.com>
Date: Tue, 4 Apr 2023 16:57:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 9/9] x86emul+VMX: support {RD,WR}MSRLIST
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>
References: <c7f748fe-f062-c2fc-4cc4-b2f888633abe@suse.com>
 <b567e068-dcab-b294-9706-ffbecb36de3c@suse.com>
In-Reply-To: <b567e068-dcab-b294-9706-ffbecb36de3c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0152.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b3::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PR3PR04MB7387:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a2e1e52-5555-4953-2544-08db351cf324
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	j71GX9BV6knxN1YyWwgQ1jD5Rld8A6hmBbKYZEUs5kbopOO4IgvmLRO2I0kB9iZkhoH8H8zKKLuBGtGFY0Pepcw5AbqJ7CuhofmFjnK2IUqrqYJCcgoc+xxygT2VsbC8EdFhApaFkilK94GowVT/E7LvpbE9g+ypjw3iHxns8jztGmdCfaPc8kg5tMP5/fgDK+SNZBeiTjV5N+QY6lEdHDiAylljjWuqCBICR7VZ+DU2lKbxKiqkjYddxSqGiJ3P/9CZSHleYLi92otTbxtFEEg32n/rSj8WrfNQBah9jdUZRIU0B9xK7Akt/K+kzf2cEaaqT3r9RJEad/Ip2qv12fCxWGDaoCoBOzR1Ar+oNGQkfjdEsNvvEmVENn8Fk5zqmOn1nCjgg9MhVLjJpAS1rSES6z4sYRcH3NE81FS106Z2tJdb5TI7vw49VTEIeGdBERS7YvjrmRjH2aD7Ilko6UjrdKEIgK/UoNlbvf42HBolFW9sRlfWIPGHP2knl7dAE6V4xPAQrUq6EzznTIJu1ELCRBggG3Fpf8YMGo7WPYQqQxydD3I0cwkVXEpI++EM55zwSmgIJwpyswCrhpgRl6fS2aSVmcS0zcPhQD8wnPh+0co+7/CfKp6yoZMdr7xD9qQAGKstbxzxPy8tzrOCBg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(376002)(396003)(136003)(39860400002)(366004)(451199021)(83380400001)(2616005)(6486002)(6506007)(316002)(6512007)(478600001)(54906003)(53546011)(2906002)(26005)(186003)(30864003)(5660300002)(38100700002)(66946007)(66556008)(66476007)(41300700001)(86362001)(8676002)(31696002)(8936002)(6916009)(4326008)(36756003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YW9uOEEzaVRPUjFEcWZDeDJabFo3Q1hPdEdWb3VxZVE4NUU0dlB1N3RXWlVr?=
 =?utf-8?B?OGNNYmNTb2RtSVdkSXN2NzQ2Q1BKcWZkMDVqTE1rWTcwNzJ0UWt4cUw1bGlG?=
 =?utf-8?B?WW1CKy8xWFc4bkFpMXpuL1FnQnh4d1lHcVkwc09DTGJoWHpBYmdpTjl6RHBy?=
 =?utf-8?B?KzNDaG5GQ3Y2NnlrMWdmeEtkSFhkeGppaC80c1dEZU83MkFJU2EyWnRuTDV3?=
 =?utf-8?B?ak1weVNqMkN0VlJKaEFCYWFNM29SNjRZR1UzSTdvNSsra1RaWi9TdWpOak1x?=
 =?utf-8?B?ZmcvVzMwMjg1MHdqdWVaRWYzWnNDeUQzdkJOQUdUSnd4dEhzaFhkVnZMRGpO?=
 =?utf-8?B?TUEyaXFmVDN4RFh3YStUSDJUc0FxZUhEak1jOVhSbzk1bnN5b3hpbHhuWElG?=
 =?utf-8?B?TVU0enRBTVorR0k3RWRjNXFkUUhVQnZlK0hSSFpmUXduZlRFVnQxL1NPcEdt?=
 =?utf-8?B?K1p1TVZYeFJrODZld0ZCZ0p6UmQvUlFDK0pNa3B3c0Y5QU8xZVNZTDBLMXlS?=
 =?utf-8?B?c1h3QnJVdVhrZHdPOTNBVXpVMXVYbVZmL1dsQjlLV1FWV1JsT3NDT0E0dnln?=
 =?utf-8?B?dURUeDdwWk9OYUR3em0zMktiZFc1eTJoVGpiaHhlaXJpRjRkOFMyN2xjdjdH?=
 =?utf-8?B?RFVMVmoyTTJ2TTlKMEU3bGZGNTduYmMxclUrWDF2dkRUZ1NQNnBuR1oweElE?=
 =?utf-8?B?TnlWb0p1bVNBTzMxY0FrdytjWWtGcWYyU3ZaWGI4KzlCNk9GWWZ1MEFHZ0hZ?=
 =?utf-8?B?OG5ZOUszbWxIYUVsN1B3UjZiM3doZTRXUlEvQUNVR2hhUzcwMHJaYkR6TWZM?=
 =?utf-8?B?aFRWL1NEejJ1bG9IaHFnNUd6aEZSN2dXTEdsUEp0UGE2ZWxwZ2hUVGF4U21n?=
 =?utf-8?B?U3gyRkRXMFpTcTNyUDV5OElhVmdXRmo0T1J1cmo4eW9RdHJudlVDR2piTU02?=
 =?utf-8?B?K2xpazVDeGY4R25Pa09kc2dyNmx3eTBhSm9vUjdxWno1TWY1RnNtVmYxeTlF?=
 =?utf-8?B?K0R3N043VDNlS3pXWU9mZDYya3I1bk43TmZMWHBleWFCMWZDWmZqMXl2cy9w?=
 =?utf-8?B?UTlobTl5K0VsTWs5QktzUnp0NGlkdjlFNm5UQnlCSE41cnU2dDczR3hPMmpU?=
 =?utf-8?B?UXhtcnV3bFV3UGQ1czZhbCtRaXR6eVFEVmViN1N3djJ5ZE1RMjhzc09WV0ph?=
 =?utf-8?B?M2lmeWQva1gyMTFLZXRCZUhZM3VVVHE3ODlYUE9WeUEzM012Z09UZnBHZzNw?=
 =?utf-8?B?bGE5Z2RlU2hhMGJaYjFzQUJIbEFxbmJsZlcrUlBwdHYwUC9qRDY3SEx6WDVn?=
 =?utf-8?B?OTI3YXhPV1Y0UGVrUTBpMVlWeWJ1dTJRWjFWcS9FUXRoR2IvbUJXYTN2NDQx?=
 =?utf-8?B?M2VHcDYvd0IzWUFEUGVpc2V0aGplVVU4Qk0wcnRUQ3FFZEFWM05MRE5IRyto?=
 =?utf-8?B?dWFIZVBjUGppQTdJNEx3amhMdVF1d21uYU9GTmR2YkhacTNteWRob1VXY2Jk?=
 =?utf-8?B?NVNQWnQ0VndzTG0vQWkvc21DTlc3ZHZYQXYzb1E3U09KZVlyN0d0RmQ0K1g3?=
 =?utf-8?B?bHAzR0hmSjI3UGQyalk4MHJnczhuNVRLU2plMHhETndTbXZaNnMxS1NSL0x3?=
 =?utf-8?B?N0hHMFNLMnVwU1VXZ2RKMEdVR0dhRklwU0NqK2NTT1lYMlJiZ0NpM2VNeUEv?=
 =?utf-8?B?b0t5U3hsZjhYWko2cjJtZGJ4SnpIYkN3V0Y1dGJTUytBVjhiQnhYSFJwT0ZX?=
 =?utf-8?B?dkFlcC82OHVaYkRTSUhoY2M1N1l2ZUlzZXdCZVJhS2pRUFhQeWE4ZDZYUm5y?=
 =?utf-8?B?dDNtRXFaMWZCMzJUalNIWE9wdytwWjlBT2tpUGJxb1daVEptTXVOQmNVa2Ji?=
 =?utf-8?B?N2NMVlQ2SUU3LzgvbktETkVIZnZ5UElQcE5lVFJnZzh3RG4wYWxGenhMd09L?=
 =?utf-8?B?M0c3NkxnM0Zwanh4RXMzc2puZzNuMFFScVhTUkE2V1o5ZmdHandkMXVXQjZF?=
 =?utf-8?B?R29XQWVSR0F0ZWc4dHBsRjlaVkFzckh5ZFNmcXRZYVBtQ25GU3FGaFM1R0Fo?=
 =?utf-8?B?UWxvV2xGYnd0dU8zRXA5NFFZem9hcEJZdzEvQW5QNll2eTlSODdqQmozMGp5?=
 =?utf-8?Q?iQeOPa4Bk/ka4LCWlEE9nVMTp?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a2e1e52-5555-4953-2544-08db351cf324
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 14:57:45.9412
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uRvVk0AgHxp0pnLXpPA/RfyurjTWRctGCFrtPTCSLSibt2rcjzrLSbp25fQKK7F1SGfWEbwtwU34Os1RitGxzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7387

On 04.04.2023 16:55, Jan Beulich wrote:
> These are "compound" instructions to issue a series of RDMSR / WRMSR
> respectively. In the emulator we can therefore implement them by using
> the existing msr_{read,write}() hooks. The memory accesses utilize that
> the HVM ->read() / ->write() hooks are already linear-address
> (x86_seg_none) aware (by way of hvmemul_virtual_to_linear() handling
> this case).
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> TODO: Use VMX tertiary execution control (once bit is known; see
>       //todo-s) and then further adjust cpufeatureset.h.

Argh, should have Cc-ed Kevin and Jun, even if there weren't this issue.

Jan

> RFC: In vmx_vmexit_handler() handling is forwarded to the emulator
>      blindly. Alternatively we could consult the exit qualification and
>      process just a single MSR at a time (without involving the
>      emulator), exiting back to the guest after every iteration. (I
>      don't think a mix of both models makes a lot of sense.)
> 
> RFC: For PV priv_op_ops would need to gain proper read/write hooks,
>      which doesn't look desirable (albeit there we could refuse to
>      handle anything else than x86_seg_none); we may want to consider to
>      instead not support the feature for PV guests, requiring e.g. Linux
>      to process the lists in new pvops hooks.
> 
> RFC: I wasn't sure whether to add preemption checks to the loops -
>      thoughts?
> 
> With the VMX side of the spec still unclear (tertiary execution control
> bit unspecified in ISE 046) we can't enable the insn yet for (HVM) guest
> use. The precise behavior of MSR_BARRIER is also not spelled out, so the
> (minimal) implementation is a guess for now.
> 
> --- a/tools/libs/light/libxl_cpuid.c
> +++ b/tools/libs/light/libxl_cpuid.c
> @@ -240,6 +240,7 @@ int libxl_cpuid_parse_config(libxl_cpuid
>          {"lkgs",         0x00000007,  1, CPUID_REG_EAX, 18,  1},
>          {"wrmsrns",      0x00000007,  1, CPUID_REG_EAX, 19,  1},
>          {"avx-ifma",     0x00000007,  1, CPUID_REG_EAX, 23,  1},
> +        {"msrlist",      0x00000007,  1, CPUID_REG_EAX, 27,  1},
>  
>          {"avx-vnni-int8",0x00000007,  1, CPUID_REG_EDX,  4,  1},
>          {"avx-ne-convert",0x00000007, 1, CPUID_REG_EDX,  5,  1},
> --- a/tools/misc/xen-cpuid.c
> +++ b/tools/misc/xen-cpuid.c
> @@ -195,6 +195,8 @@ static const char *const str_7a1[32] =
>      [18] = "lkgs",          [19] = "wrmsrns",
>  
>      /* 22 */                [23] = "avx-ifma",
> +
> +    /* 26 */                [27] = "msrlist",
>  };
>  
>  static const char *const str_e21a[32] =
> --- a/tools/tests/x86_emulator/predicates.c
> +++ b/tools/tests/x86_emulator/predicates.c
> @@ -342,6 +342,8 @@ static const struct {
>      { { 0x01, 0xc4 }, { 2, 2 }, F, N }, /* vmxoff */
>      { { 0x01, 0xc5 }, { 2, 2 }, F, N }, /* pconfig */
>      { { 0x01, 0xc6 }, { 2, 2 }, F, N }, /* wrmsrns */
> +    { { 0x01, 0xc6 }, { 0, 2 }, F, W, pfx_f2 }, /* rdmsrlist */
> +    { { 0x01, 0xc6 }, { 0, 2 }, F, R, pfx_f3 }, /* wrmsrlist */
>      { { 0x01, 0xc8 }, { 2, 2 }, F, N }, /* monitor */
>      { { 0x01, 0xc9 }, { 2, 2 }, F, N }, /* mwait */
>      { { 0x01, 0xca }, { 2, 2 }, F, N }, /* clac */
> --- a/tools/tests/x86_emulator/test_x86_emulator.c
> +++ b/tools/tests/x86_emulator/test_x86_emulator.c
> @@ -589,6 +589,7 @@ static int read(
>      default:
>          if ( !is_x86_user_segment(seg) )
>              return X86EMUL_UNHANDLEABLE;
> +    case x86_seg_none:
>          bytes_read += bytes;
>          break;
>      }
> @@ -619,7 +620,7 @@ static int write(
>      if ( verbose )
>          printf("** %s(%u, %p,, %u,)\n", __func__, seg, (void *)offset, bytes);
>  
> -    if ( !is_x86_user_segment(seg) )
> +    if ( !is_x86_user_segment(seg) && seg != x86_seg_none )
>          return X86EMUL_UNHANDLEABLE;
>      memcpy((void *)offset, p_data, bytes);
>      return X86EMUL_OKAY;
> @@ -711,6 +712,10 @@ static int read_msr(
>  {
>      switch ( reg )
>      {
> +    case 0x0000002f: /* BARRIER */
> +        *val = 0;
> +        return X86EMUL_OKAY;
> +
>      case 0xc0000080: /* EFER */
>          *val = ctxt->addr_size > 32 ? 0x500 /* LME|LMA */ : 0;
>          return X86EMUL_OKAY;
> @@ -1499,9 +1504,53 @@ int main(int argc, char **argv)
>           (gs_base != 0x0000111122224444UL) ||
>           gs_base_shadow )
>          goto fail;
> +    printf("okay\n");
>  
>      cp.extd.nscb = i;
>      emulops.write_segment = NULL;
> +
> +    printf("%-40s", "Testing rdmsrlist...");
> +    instr[0] = 0xf2; instr[1] = 0x0f; instr[2] = 0x01; instr[3] = 0xc6;
> +    regs.rip = (unsigned long)&instr[0];
> +    regs.rsi = (unsigned long)(res + 0x80);
> +    regs.rdi = (unsigned long)(res + 0x80 + 0x40 * 2);
> +    regs.rcx = 0x0002000100008000UL;
> +    gs_base_shadow = 0x0000222244446666UL;
> +    memset(res + 0x80, ~0, 0x40 * 8 * 2);
> +    res[0x80 + 0x0f * 2] = 0xc0000101; /* GS_BASE */
> +    res[0x80 + 0x0f * 2 + 1] = 0;
> +    res[0x80 + 0x20 * 2] = 0xc0000102; /* SHADOW_GS_BASE */
> +    res[0x80 + 0x20 * 2 + 1] = 0;
> +    res[0x80 + 0x31 * 2] = 0x2f; /* BARRIER */
> +    res[0x80 + 0x31 * 2 + 1] = 0;
> +    rc = x86_emulate(&ctxt, &emulops);
> +    if ( (rc != X86EMUL_OKAY) ||
> +         (regs.rip != (unsigned long)&instr[4]) ||
> +         regs.rcx ||
> +         (res[0x80 + (0x40 + 0x0f) * 2] != (unsigned int)gs_base) ||
> +         (res[0x80 + (0x40 + 0x0f) * 2 + 1] != (gs_base >> (8 * sizeof(int)))) ||
> +         (res[0x80 + (0x40 + 0x20) * 2] != (unsigned int)gs_base_shadow) ||
> +         (res[0x80 + (0x40 + 0x20) * 2 + 1] != (gs_base_shadow >> (8 * sizeof(int)))) ||
> +         res[0x80 + (0x40 + 0x31) * 2] || res[0x80 + (0x40 + 0x31) * 2 + 1] )
> +        goto fail;
> +    printf("okay\n");
> +
> +    printf("%-40s", "Testing wrmsrlist...");
> +    instr[0] = 0xf3; instr[1] = 0x0f; instr[2] = 0x01; instr[3] = 0xc6;
> +    regs.eip = (unsigned long)&instr[0];
> +    regs.rsi -= 0x11 * 8;
> +    regs.rdi -= 0x11 * 8;
> +    regs.rcx = 0x0002000100000000UL;
> +    res[0x80 + 0x0f * 2] = 0xc0000102; /* SHADOW_GS_BASE */
> +    res[0x80 + 0x20 * 2] = 0xc0000101; /* GS_BASE */
> +    rc = x86_emulate(&ctxt, &emulops);
> +    if ( (rc != X86EMUL_OKAY) ||
> +         (regs.rip != (unsigned long)&instr[4]) ||
> +         regs.rcx ||
> +         (gs_base != 0x0000222244446666UL) ||
> +         (gs_base_shadow != 0x0000111122224444UL) )
> +        goto fail;
> +
>      emulops.write_msr     = NULL;
>  #endif
>      printf("okay\n");
> --- a/tools/tests/x86_emulator/x86-emulate.c
> +++ b/tools/tests/x86_emulator/x86-emulate.c
> @@ -88,6 +88,7 @@ bool emul_test_init(void)
>      cp.feat.rdpid = true;
>      cp.feat.lkgs = true;
>      cp.feat.wrmsrns = true;
> +    cp.feat.msrlist = true;
>      cp.extd.clzero = true;
>  
>      if ( cpu_has_xsave )
> --- a/xen/arch/x86/hvm/vmx/vmx.c
> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> @@ -835,6 +835,17 @@ static void cf_check vmx_cpuid_policy_ch
>      else
>          vmx_set_msr_intercept(v, MSR_PKRS, VMX_MSR_RW);
>  
> +    if ( cp->feat.msrlist )
> +    {
> +        vmx_clear_msr_intercept(v, MSR_BARRIER, VMX_MSR_RW);
> +        //todo enable MSRLIST tertiary execution control
> +    }
> +    else
> +    {
> +        vmx_set_msr_intercept(v, MSR_BARRIER, VMX_MSR_RW);
> +        //todo disable MSRLIST tertiary execution control
> +    }
> +
>   out:
>      vmx_vmcs_exit(v);
>  
> @@ -3705,6 +3716,22 @@ gp_fault:
>      return X86EMUL_EXCEPTION;
>  }
>  
> +static bool cf_check is_msrlist(
> +    const struct x86_emulate_state *state, const struct x86_emulate_ctxt *ctxt)
> +{
> +
> +    if ( ctxt->opcode == X86EMUL_OPC(0x0f, 0x01) )
> +    {
> +        unsigned int rm, reg;
> +        int mode = x86_insn_modrm(state, &rm, &reg);
> +
> +        /* This also includes WRMSRNS; should be okay. */
> +        return mode == 3 && rm == 6 && !reg;
> +    }
> +
> +    return false;
> +}
> +
>  static void vmx_do_extint(struct cpu_user_regs *regs)
>  {
>      unsigned long vector;
> @@ -4513,6 +4540,17 @@ void vmx_vmexit_handler(struct cpu_user_
>          }
>          break;
>  
> +    case EXIT_REASON_RDMSRLIST:
> +    case EXIT_REASON_WRMSRLIST:
> +        if ( vmx_guest_x86_mode(v) != 8 || !currd->arch.cpuid->feat.msrlist )
> +        {
> +            ASSERT_UNREACHABLE();
> +            hvm_inject_hw_exception(TRAP_invalid_op, X86_EVENT_NO_EC);
> +        }
> +        else if ( !hvm_emulate_one_insn(is_msrlist, "MSR list") )
> +            hvm_inject_hw_exception(TRAP_gp_fault, 0);
> +        break;
> +
>      case EXIT_REASON_VMXOFF:
>      case EXIT_REASON_VMXON:
>      case EXIT_REASON_VMCLEAR:
> --- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
> +++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
> @@ -211,6 +211,8 @@ static inline void pi_clear_sn(struct pi
>  #define EXIT_REASON_XRSTORS             64
>  #define EXIT_REASON_BUS_LOCK            74
>  #define EXIT_REASON_NOTIFY              75
> +#define EXIT_REASON_RDMSRLIST           78
> +#define EXIT_REASON_WRMSRLIST           79
>  /* Remember to also update VMX_PERF_EXIT_REASON_SIZE! */
>  
>  /*
> --- a/xen/arch/x86/include/asm/msr-index.h
> +++ b/xen/arch/x86/include/asm/msr-index.h
> @@ -24,6 +24,8 @@
>  #define  APIC_BASE_ENABLE                   (_AC(1, ULL) << 11)
>  #define  APIC_BASE_ADDR_MASK                0x000ffffffffff000ULL
>  
> +#define MSR_BARRIER                         0x0000002f
> +
>  #define MSR_TEST_CTRL                       0x00000033
>  #define  TEST_CTRL_SPLITLOCK_DETECT         (_AC(1, ULL) << 29)
>  #define  TEST_CTRL_SPLITLOCK_DISABLE        (_AC(1, ULL) << 31)
> --- a/xen/arch/x86/include/asm/perfc_defn.h
> +++ b/xen/arch/x86/include/asm/perfc_defn.h
> @@ -6,7 +6,7 @@ PERFCOUNTER_ARRAY(exceptions,
>  
>  #ifdef CONFIG_HVM
>  
> -#define VMX_PERF_EXIT_REASON_SIZE 76
> +#define VMX_PERF_EXIT_REASON_SIZE 80
>  #define VMEXIT_NPF_PERFC 143
>  #define SVM_PERF_EXIT_REASON_SIZE (VMEXIT_NPF_PERFC + 1)
>  PERFCOUNTER_ARRAY(vmexits,              "vmexits",
> --- a/xen/arch/x86/msr.c
> +++ b/xen/arch/x86/msr.c
> @@ -223,6 +223,12 @@ int guest_rdmsr(struct vcpu *v, uint32_t
>      case MSR_AMD_PPIN:
>          goto gp_fault;
>  
> +    case MSR_BARRIER:
> +        if ( !cp->feat.msrlist )
> +            goto gp_fault;
> +        *val = 0;
> +        break;
> +
>      case MSR_IA32_FEATURE_CONTROL:
>          /*
>           * Architecturally, availability of this MSR is enumerated by the
> @@ -493,6 +499,7 @@ int guest_wrmsr(struct vcpu *v, uint32_t
>          uint64_t rsvd;
>  
>          /* Read-only */
> +    case MSR_BARRIER:
>      case MSR_IA32_PLATFORM_ID:
>      case MSR_CORE_CAPABILITIES:
>      case MSR_INTEL_CORE_THREAD_COUNT:
> --- a/xen/arch/x86/x86_emulate/0f01.c
> +++ b/xen/arch/x86/x86_emulate/0f01.c
> @@ -40,6 +40,7 @@ int x86emul_0f01(struct x86_emulate_stat
>      switch ( s->modrm )
>      {
>          unsigned long base, limit, cr0, cr0w, cr4;
> +        unsigned int n;
>          struct segment_register sreg;
>          uint64_t msr_val;
>  
> @@ -54,6 +55,56 @@ int x86emul_0f01(struct x86_emulate_stat
>                                  ((uint64_t)regs->r(dx) << 32) | regs->eax,
>                                  ctxt);
>              goto done;
> +
> +        case vex_f3: /* wrmsrlist */
> +            vcpu_must_have(msrlist);
> +            generate_exception_if(!mode_64bit(), X86_EXC_UD);
> +            generate_exception_if(!mode_ring0() || (regs->r(si) & 7) ||
> +                                  (regs->r(di) & 7),
> +                                  X86_EXC_GP, 0);
> +            fail_if(!ops->write_msr);
> +            while ( regs->r(cx) )
> +            {
> +                n = __builtin_ffsl(regs->r(cx)) - 1;
> +                if ( (rc = ops->read(x86_seg_none, regs->r(si) + n * 8,
> +                                     &msr_val, 8, ctxt)) != X86EMUL_OKAY )
> +                    break;
> +                generate_exception_if(msr_val != (uint32_t)msr_val,
> +                                      X86_EXC_GP, 0);
> +                base = msr_val;
> +                if ( (rc = ops->read(x86_seg_none, regs->r(di) + n * 8,
> +                                     &msr_val, 8, ctxt)) != X86EMUL_OKAY ||
> +                     (rc = ops->write_msr(base, msr_val, ctxt)) != X86EMUL_OKAY )
> +                    break;
> +                regs->r(cx) &= ~(1UL << n);
> +            }
> +            goto done;
> +
> +        case vex_f2: /* rdmsrlist */
> +            vcpu_must_have(msrlist);
> +            generate_exception_if(!mode_64bit(), X86_EXC_UD);
> +            generate_exception_if(!mode_ring0() || (regs->r(si) & 7) ||
> +                                  (regs->r(di) & 7),
> +                                  X86_EXC_GP, 0);
> +            fail_if(!ops->read_msr || !ops->write);
> +            while ( regs->r(cx) )
> +            {
> +                n = __builtin_ffsl(regs->r(cx)) - 1;
> +                if ( (rc = ops->read(x86_seg_none, regs->r(si) + n * 8,
> +                                     &msr_val, 8, ctxt)) != X86EMUL_OKAY )
> +                    break;
> +                generate_exception_if(msr_val != (uint32_t)msr_val,
> +                                      X86_EXC_GP, 0);
> +                if ( (rc = ops->read_msr(msr_val, &msr_val,
> +                                         ctxt)) != X86EMUL_OKAY ||
> +                     (rc = ops->write(x86_seg_none, regs->r(di) + n * 8,
> +                                      &msr_val, 8, ctxt)) != X86EMUL_OKAY )
> +                    break;
> +                regs->r(cx) &= ~(1UL << n);
> +            }
> +            if ( rc != X86EMUL_OKAY )
> +                ctxt->regs->r(cx) = regs->r(cx);
> +            goto done;
>          }
>          generate_exception(X86_EXC_UD);
>  
> --- a/xen/arch/x86/x86_emulate/private.h
> +++ b/xen/arch/x86/x86_emulate/private.h
> @@ -600,6 +600,7 @@ amd_like(const struct x86_emulate_ctxt *
>  #define vcpu_has_lkgs()        (ctxt->cpuid->feat.lkgs)
>  #define vcpu_has_wrmsrns()     (ctxt->cpuid->feat.wrmsrns)
>  #define vcpu_has_avx_ifma()    (ctxt->cpuid->feat.avx_ifma)
> +#define vcpu_has_msrlist()     (ctxt->cpuid->feat.msrlist)
>  #define vcpu_has_avx_vnni_int8() (ctxt->cpuid->feat.avx_vnni_int8)
>  #define vcpu_has_avx_ne_convert() (ctxt->cpuid->feat.avx_ne_convert)
>  
> --- a/xen/arch/x86/x86_emulate/util.c
> +++ b/xen/arch/x86/x86_emulate/util.c
> @@ -112,6 +112,9 @@ bool cf_check x86_insn_is_mem_access(con
>          break;
>  
>      case X86EMUL_OPC(0x0f, 0x01):
> +        /* {RD,WR}MSRLIST */
> +        if ( mode_64bit() && s->modrm == 0xc6 )
> +            return s->vex.pfx >= vex_f3;
>          /* Cover CLZERO. */
>          return (s->modrm_rm & 7) == 4 && (s->modrm_reg & 7) == 7;
>      }
> @@ -172,7 +175,11 @@ bool cf_check x86_insn_is_mem_write(cons
>          case 0xff: /* Grp5 */
>              break;
>  
> -        case X86EMUL_OPC(0x0f, 0x01): /* CLZERO is the odd one. */
> +        case X86EMUL_OPC(0x0f, 0x01):
> +            /* RDMSRLIST */
> +            if ( mode_64bit() && s->modrm == 0xc6 )
> +                return s->vex.pfx == vex_f2;
> +            /* CLZERO is another odd one. */
>              return (s->modrm_rm & 7) == 4 && (s->modrm_reg & 7) == 7;
>  
>          default:
> --- a/xen/include/public/arch-x86/cpufeatureset.h
> +++ b/xen/include/public/arch-x86/cpufeatureset.h
> @@ -286,6 +286,7 @@ XEN_CPUFEATURE(FRED,         10*32+17) /
>  XEN_CPUFEATURE(LKGS,         10*32+18) /*S  Load Kernel GS Base */
>  XEN_CPUFEATURE(WRMSRNS,      10*32+19) /*A  WRMSR Non-Serialising */
>  XEN_CPUFEATURE(AVX_IFMA,     10*32+23) /*A  AVX-IFMA Instructions */
> +XEN_CPUFEATURE(MSRLIST,      10*32+27) /*   MSR list instructions */
>  
>  /* AMD-defined CPU features, CPUID level 0x80000021.eax, word 11 */
>  XEN_CPUFEATURE(LFENCE_DISPATCH,    11*32+ 2) /*A  LFENCE always serializing */
> 
> 


