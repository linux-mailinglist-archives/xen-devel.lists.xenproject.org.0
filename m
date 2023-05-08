Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8973F6FA01D
	for <lists+xen-devel@lfdr.de>; Mon,  8 May 2023 08:48:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.531261.826828 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pvuf4-00045O-ST; Mon, 08 May 2023 06:47:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 531261.826828; Mon, 08 May 2023 06:47:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pvuf4-00043A-PM; Mon, 08 May 2023 06:47:54 +0000
Received: by outflank-mailman (input) for mailman id 531261;
 Mon, 08 May 2023 06:47:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tnRg=A5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pvuf3-000430-Vi
 for xen-devel@lists.xenproject.org; Mon, 08 May 2023 06:47:53 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20627.outbound.protection.outlook.com
 [2a01:111:f400:fe12::627])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 403e2d84-ed6c-11ed-b226-6b7b168915f2;
 Mon, 08 May 2023 08:47:51 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS4PR04MB9623.eurprd04.prod.outlook.com (2603:10a6:20b:4cd::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.31; Mon, 8 May
 2023 06:47:48 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c%4]) with mapi id 15.20.6363.031; Mon, 8 May 2023
 06:47:48 +0000
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
X-Inumbo-ID: 403e2d84-ed6c-11ed-b226-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cjdfPY20SLys+79uzy3JuzD8RelYB5oOUxnczN5aaF+OC5Zjp4V1L+inrdUIYfrUT10AaczZ9PKuePmBF9PbwHOFCUuu0fh8NPOHSLO9GWPWm+OwiTGZceP/qhEbHZqhfFLFBKd2bYw6n+PlqgONYsb2xpG7MaGLlUY1VB8+GcyghbMKfMgF878cuAaqJ6PY81K0VaGMEGyPLpgUNBq05c8OO4M55851OeF/9y/zjVNRFEz0bkwFAUdrbsRtXRgemrBDYypjRV8G6QSJuG/ZnpJU8LA91HRL1QwnUt65ZAKQPVcbVWvdr+0wzRrYSgwDUNIRN01KMJpi0AMfKUIT0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hchJlrRfsacPsTKLPlIoSqERfo9BbLE4ltWKo+IyKQ8=;
 b=aSXOvM5spfhFIAM09Ja0glGPauzTxC8hi/F9Buual1tDZDIztCbKSGK87lqTyVo+NxlqgpeQ0f0mS2jhgeASWPk/TVcotsiJ5W+iudKtpOqEZeopIVKyHFni2cpOun6Kts/2WZXllTlSSnRsqf+JnpjQgDLVtbNLHoO1MVwxjKvdeYW+820wVRhFx80AGc4eZWGBIf1QtQt/EiSmsA2xTVdM47cO5uJxCOcrPJYB7BX9kQInTXoRUPFn/5vg+OwVe9z/DOeQAnTjtMMmzCa/P8SNq6je+P3psGoO4aSlH95kqIqQxJQUrXg38G15E6FrbdAPhEx2X4rLsvf0zVBuaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hchJlrRfsacPsTKLPlIoSqERfo9BbLE4ltWKo+IyKQ8=;
 b=PF20BQpSyzuHJoYoh5p2Fy0TArJfXzqUhjG4nUVX5pFJ4mG9IERCg5rMgKWzNF1y+m5t1rrCm4TFarFqaAwJe5uhagk/lfBDclcs1ZWmKdZIgYilEAzXKpsbZ8D7GrKbWu43fpup50Egyr7iDWVMXQu6vc3cZDt3YsHD3whzM7xmCPJI+SDOXXhDQdvmtJ2KHEykuGGcd4PJvdSJuL++rr0CcFg7MXdVtHtHON+uM5Y6ICpfocOowgd6TEfnRYAD8uescPt4Cyt8HRYSp3jmjT/4Y8pgL0wOS2OiyuyqoKNwxXpVFUJkGqSaK9Gx7WbXQcxLADK4hzxgH1U+sn9YpQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6531df09-7f7f-a1e2-5993-bd2a14e22421@suse.com>
Date: Mon, 8 May 2023 08:47:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 1/6] x86/cpu-policy: Drop build time cross-checks of
 featureset sizes
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230504193924.3305496-1-andrew.cooper3@citrix.com>
 <20230504193924.3305496-2-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230504193924.3305496-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0109.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS4PR04MB9623:EE_
X-MS-Office365-Filtering-Correlation-Id: 298d4b9b-2929-44db-5210-08db4f9022a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LLwvp3bhhzoSJyM4/CCY1voqXA/qHlj2l/0oe1TuCeEm2HLr0q6vyf1d1u4gyYdtdZTLa+Wkz2pMZMKrFzqzVzvQDSfpvEO1OgByqTWbwl0mn6KIzy8fSzu8s6fCbu7SVwcWMf2wAecBXM19nXUZGHN1H+3oUZOYVljJW7p/QKcPzYlurAD05mDS/nOC704sStkWPNtvWoHlv69Y3DvdLOv6y3B10vh1BTl5HtKvJ5LjYHF+r7M2wOjfh6coDh/TB5MRl5XGom3LN5CEzFbBCRTWzuxO1MWDcMiQy9JTDcLEm9wVO61eB4Dy/ObeyBmAMQYylsEBMBXQ/Sg9TTg7urhlw2CMPXEW+AQg2DVjdB1WAFQjmic/yWK5/V/sXkdBDMN9UX7iHE6TQ+AJNUZ0Bdq5o/EP7e5je7vdUq36ssIyZCdQPG8IChnuEOk+U74JYOO7uhYAXO3dOVzR0l6LVRi2lzCywXpvw8VCvcAHbKhbQC+oHavyD8WQ1d4jmCwNzkWGyNqW2fO+OPCqaU9JW8CnqD8GRoy7TRrBdKHs01QmkO8WqpIN+YQup+cWY3uTfxgFmcI27nrrCm9UMsZ7vrg1HILu8tugqI5/TTOQLKDM1242fLKVbW/7hxKlaPJpcAyF4A9rIEYtHMalsijrRw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(39860400002)(396003)(136003)(366004)(346002)(451199021)(31686004)(36756003)(38100700002)(2906002)(8676002)(8936002)(5660300002)(316002)(31696002)(86362001)(66476007)(66556008)(66946007)(6916009)(41300700001)(4326008)(83380400001)(53546011)(186003)(6512007)(6506007)(26005)(6486002)(478600001)(6666004)(2616005)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?elhtQXRneHAxMzNIdStTNzJwQ1M4YkRPQkROOUd6aitTYml5OHZaNzYyek9Z?=
 =?utf-8?B?b0VWT0RKeHduOWZVZVpFM1RQTjkyY241U25jSDIzK1JTNENuSVA3SWtLYi9V?=
 =?utf-8?B?T2JQa216Sm9mMW5HSXVJRG5pWWdZZWpzUjNiOW9GelJYWjN5OEN6WjcwYnZh?=
 =?utf-8?B?R2t5S2gzVDViOEkzdVJSc3lZazYwaDNqV0ZjVDVzQ2ZNZy9pY3BIY3dmdXg0?=
 =?utf-8?B?aktCT01jNyt6WnhIdXJkV0sveis1eWt4d09MSlVLR01yQ3dhZ1cxVTVBRWg5?=
 =?utf-8?B?dkFNRXFzeEZYcWNwU0lXZUQwQ0RkVGVyeE5DMUxrSkhyWkhUS1lvTDRGb25r?=
 =?utf-8?B?OXhzN3ozRVRtRTN3K0VBK2NsUkU4eUJzeXdkVHd5RklIYXdDOVVmWVNucDBa?=
 =?utf-8?B?azlWaGNpOGhGU1FVb0R4Qm5zQ1ZiNWwzQ1kvc2NrdnpqMXZuZlJaTTNMMkdy?=
 =?utf-8?B?WndZZXdQdE90SnRJbFEweS9yZHg1aWxvV3RaV2N4TmMwNGFyc2tPdEZrTGpO?=
 =?utf-8?B?QVZnemN5bnFqdGpOcEc2OTk0ZGYvaWJXV1hqaFFqZUVtSy80Q2txWDdsU1hY?=
 =?utf-8?B?N2pJeHpycDJMeHVpSTB2Vm13U0NyM3BLaEp5VlJnSWdPTjRtY0p6Ylo1Y2Zx?=
 =?utf-8?B?RmpkTDV3cDROdFgwK2R2aFNnYis4cnJ0OUFFWUwwais1aE9EdzIzc0VKa0Jk?=
 =?utf-8?B?eVplc2hvT3hXVGI2YjlsZkZmWmNsYXQxaExjK2kwSHozaEoyc3oxSGNTV0pz?=
 =?utf-8?B?N3cweWhqZWxSc2wvcWpMZjA5MDc2bkVxa29HTk9CS3kyQXhMVW4yYUdHNzlH?=
 =?utf-8?B?Ty9PdG52YmlUQzl6eXZoK3F1UnVxY1NLQS8yRlBnQ1RKeUZ0SVJtVVpncjJB?=
 =?utf-8?B?NmxzR3M4RzFvV29Iam85WVZ2Zi85c0MvMzdFWmU0ZGlUSUpYMjRlOVA2S2Rn?=
 =?utf-8?B?SmgzdnFWWVhPL1liUXVtK2FZbHcvVTF4TUhteEVVVHZTN3pBMWtKZm5FKzYx?=
 =?utf-8?B?YWM0VldKaC9zRGJyVDBieHVkMVo1dkxHeUZ4QlRJZmk3QVFEenRMbFlGZVVJ?=
 =?utf-8?B?cEtnMEF4c0laVDJEd0VkVGJqM2hBU0g4Yjd0QmhTbWpiMUhJbkRuUkdOOWM3?=
 =?utf-8?B?UFhLMDVlUlEvZlVkc0RDUENCTDR1TUpkakhsakkzTmVibUkybm9hdTd1K3Jz?=
 =?utf-8?B?SU9Oc0ZiTm5CdjVyUXBxWGZadVc2b1Y3WUJDWVRaSHBpSlJma2RUTGw0dy82?=
 =?utf-8?B?NzZab0JyT0psdUwzRVM3VkVRdHFMVC8zRkU0MEgrY3JVV2VsVldPS05NT1N3?=
 =?utf-8?B?aHA0WVJyeWFHMHBVZ1FGeUlmc3A2Skw0VU1hKy9VSjI1YWRkcjIwM3BSM2ZS?=
 =?utf-8?B?bDRrbkp4TngrT1JqMHZxRzhrWVl2dHliMGRZZXJCYWdtSStFcmFtWjc1VzFj?=
 =?utf-8?B?Q2NyaUJtbUluRitKVy9YdGlqSTR2MzcvcDFGaGd0cW4xMExTNTRkeUpPQnhF?=
 =?utf-8?B?Y2JSeS9rTlhZK1FJU0lmamVSSVVpWkFqaU02M0hxYVdQcUorNW0zc3ZYUTl0?=
 =?utf-8?B?ZGlISi9vR25EcmM5aXNQcFQwSStLUXBTMlNJUkFQeUZ5Vy85R2lqRFA3UDUr?=
 =?utf-8?B?aWFDMWZZUVN3UFZ0SkF5Z1FUdUdEL3k4Um45TXNWaEVnZEd1ZEZaRWtHUlRy?=
 =?utf-8?B?K0Fob2hxYTVsQTkrL0VJVWxLVHVudUExMEsrWEV0T3A4RmU3V1pERmxZWUgw?=
 =?utf-8?B?YWkwbldCOUhHVUdRb0k2RTAvajBacG1BU3FXRjJrL203NVNMV0tObkU3cHkx?=
 =?utf-8?B?VWhtdkVJN1dqWHdqV0xhUTdXSG42MlRSOENkR1l6czBFRjNzcENYRnROMGtu?=
 =?utf-8?B?NWxPUmV2cCt6T21PSFpwM0owSjVVVHVXQkw0NnRDSU00cXNjMnAxeXpZQ3Nj?=
 =?utf-8?B?ei9xTlA0bCt0dmlFTjI4Z0NobGJQdkh2d3liek1vb0RyOWl4WCs5OGJ6M3BB?=
 =?utf-8?B?MzZtV3hla3Y2MGlJRFViQlcwNlB4TmR1OW5tOWR3Vzc4V1YxVEUyNldnNjBY?=
 =?utf-8?B?YVNscm1hREp1MFRLbVVwcmtsMm1BM0lUSktVWi9aNVgrSWFEL3ZLd080WjJZ?=
 =?utf-8?Q?QLPt32wgi/bsQR2f+yiwE5Eut?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 298d4b9b-2929-44db-5210-08db4f9022a8
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 06:47:47.9399
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /kUS8EGBWpyBLQKRCwrqKTAQ0ANF78njD4hEgCFMF/4NigqJ2E7hxx3gCbrY902teLkGuJCzYGPb+zFHKHGI2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9623

On 04.05.2023 21:39, Andrew Cooper wrote:
> These BUILD_BUG_ON()s exist to cover the curious absence of a diagnostic for
> code which looks like:
> 
>   uint32_t foo[1] = { 1, 2, 3 };
> 
> However, GCC 12 at least does now warn for this:
> 
>   foo.c:1:24: error: excess elements in array initializer [-Werror]
>     884 | uint32_t foo[1] = { 1, 2, 3 };
>         |                        ^
>   foo.c:1:24: note: (near initialization for 'foo')

I'm pretty sure all gcc versions we support diagnose such cases. In turn
the arrays in question don't have explicit dimensions at their
definition sites, and hence they derive their dimensions from their
initializers. So the build-time-checks are about the arrays in fact
obtaining the right dimensions, i.e. the initializers being suitable.

With the core part of the reasoning not being applicable, I'm afraid I
can't even say "okay with an adjusted description".

Jan

> and has found other array length issues which we want to fix.  Drop the cross
> check now tools can spot the problem case directly.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> ---
>  xen/arch/x86/cpu-policy.c | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/xen/arch/x86/cpu-policy.c b/xen/arch/x86/cpu-policy.c
> index ef6a2d0d180a..44c88debf958 100644
> --- a/xen/arch/x86/cpu-policy.c
> +++ b/xen/arch/x86/cpu-policy.c
> @@ -883,12 +883,6 @@ void __init init_dom0_cpuid_policy(struct domain *d)
>  
>  static void __init __maybe_unused build_assertions(void)
>  {
> -    BUILD_BUG_ON(ARRAY_SIZE(known_features) != FSCAPINTS);
> -    BUILD_BUG_ON(ARRAY_SIZE(pv_max_featuremask) != FSCAPINTS);
> -    BUILD_BUG_ON(ARRAY_SIZE(hvm_shadow_max_featuremask) != FSCAPINTS);
> -    BUILD_BUG_ON(ARRAY_SIZE(hvm_hap_max_featuremask) != FSCAPINTS);
> -    BUILD_BUG_ON(ARRAY_SIZE(deep_features) != FSCAPINTS);
> -
>      /* Find some more clever allocation scheme if this trips. */
>      BUILD_BUG_ON(sizeof(struct cpu_policy) > PAGE_SIZE);
>  


