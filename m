Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44DAA782446
	for <lists+xen-devel@lfdr.de>; Mon, 21 Aug 2023 09:17:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.587309.918654 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qXzAA-0005s9-IF; Mon, 21 Aug 2023 07:17:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 587309.918654; Mon, 21 Aug 2023 07:17:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qXzAA-0005q1-EH; Mon, 21 Aug 2023 07:17:22 +0000
Received: by outflank-mailman (input) for mailman id 587309;
 Mon, 21 Aug 2023 07:17:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=phPX=EG=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qXzA9-0005pv-KN
 for xen-devel@lists.xenproject.org; Mon, 21 Aug 2023 07:17:21 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20611.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::611])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c3b0d1c2-3ff2-11ee-9b0c-b553b5be7939;
 Mon, 21 Aug 2023 09:17:19 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by VI1PR04MB7038.eurprd04.prod.outlook.com (2603:10a6:800:12d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Mon, 21 Aug
 2023 07:17:17 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7%6]) with mapi id 15.20.6678.029; Mon, 21 Aug 2023
 07:17:17 +0000
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
X-Inumbo-ID: c3b0d1c2-3ff2-11ee-9b0c-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CubBdbilDiK/upV/sEjV3C/Db14AkP60ghtHDWoHLtX6KrIiWvom8j1Ax5B1yF+x6wIDs/OyLza9Ebc21r5nkTDkIFgBCxZpIh4RQ+lXq/37fh9HXfqVAFj3wdSDNe3FmCMbf/OwQuvSs0yXEmzuQH9t7qqyLoDrzv8BENOTMthl9VBVgNM2f6gxEhiEWLL0WnkArmKKXI7O2/nbxZmDeYX/cEG5T9r8HlpXiqgJ77vh0j0ayn14jTEgu7JoetwTlp7L/kEcJAsTBDqQOGxR5nixSe0YEWff42+jyb/BDLzdUFEGBDhruw136rlDsVlX0xaJOrPiOGrkYnksqtmp5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7qYDr79cjjTJeLcBqVX/vv/SaPOHQNoRE+hAF9Pg1VU=;
 b=kq7N2hlTF3u8g6/c2Cqv7t3R+8Hc7X4I4Ht0myoMvc76dG7/OqAGu9LcggTWOaRljnHtKl3Aehcdq++Wg6wryR1sS41yiWctS3rI11DujfOvi8uP5l0zuqEXnFF0W9gas70CUzAzzsW5u3SnSmSWyufpNQqzcqv+hW0JMr9KiEMiZ4Y6YRBC7QvFh9OAqUpPFUgLTFByTPz3Agqz+aOP7LzzY+0SNO2VGVf7bzKxVdujtzmEkCjHyOj98yqVIqyvTGxYbSew5YUGn/FecoLzVf1U/IzIoLUo1xdFdmJRjncCpug+vDSVBJ+9eYv9ui2sq6K/4myjV5Z1irdjdt2nZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7qYDr79cjjTJeLcBqVX/vv/SaPOHQNoRE+hAF9Pg1VU=;
 b=thCXvhgwYRGO87g6jbv4XUqDld9gP4HCHuNyNgrzVdu9c6xRNvyPqU7rLfFx46hESQrznJoPrDaz1rcEZzoITv1FcSTJzsvD01OISgtHO9VaKC7X5ELAiNey8WOlbWWravrHMgCoeBrqZfWS4sRODZCWw0WrgdRdtga9pM8eqwscmbd7ReZ5ptNvy4YmeM1z1zJevcInK1m2vKrODSutcjPEMORlbO2w7sYAPslsNOfLXQCN+Zj4EICBd6xqDdMSCPZ7xJd9PBQV8eG8Xt8RIR3RHWCf/YsplJ/8/73YOoenPAnuBaasryV44FoLd07YIhIn9H7+L9riR5WVoq/Mig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d52880c4-96e1-58de-d51e-8a5fbd784de7@suse.com>
Date: Mon, 21 Aug 2023 09:17:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] docs/misra: document gcc-specific behavior with shifting
 signed integers
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com, julien@xen.org,
 bertrand.marquis@arm.com, Stefano Stabellini <stefano.stabellini@amd.com>,
 xen-devel@lists.xenproject.org
References: <20230819003303.1744466-1-sstabellini@kernel.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230819003303.1744466-1-sstabellini@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FRYP281CA0012.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::22)
 To DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|VI1PR04MB7038:EE_
X-MS-Office365-Filtering-Correlation-Id: 40cfe597-963f-437f-1ea5-08dba216a6e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4/7KazHygVUD4HDQkYqxtUbTuyd360W869F/xg3PGnnIH//AllYSo39xHoUBvRLg0z9BNTMFxZWeT+rONwawBC/0PkI5yJD+llFdNG7ydQeSaAtC7JUALUZo22INWNUCrGVQ5LyhBc2/lzgslC8hLr+5WKiSj6PY645NcILs0+pD3nAwIZ0A4+LybJqM8g8SsLyS4c0HVPJOyd9agO3rB244W8R1/kzChpvs66ZiwBy8pfZFo+1nw6KqTMDiKPceS6QUWwXuESfrb2tMhjB8jU4pu+u/wl+yse5cD1aRBDCpijAesySfeLBD0j6+cGB78UqFttX+WBkUBD/CZAmiCOZy6FEBWI3gu2b0Xvdee0Qn4SwA/VZKyznew/pwWndgZNgXJmWXQuVcvPpxwgoOpKh3yxhSAqlDwUxYJ4tPGqlTpjG3Fd0h0t3OMvNh6fkMb9Y8g6X60RLt4pWdNdYKcZz6Rfy8Xp60Brq0pGSuxOmjuq6EbYQQRMhjKhdgaLj136qY53IxT7X7eosFhFHOLPBTOkD6FrzB+qMNpnZA4g33qbBhjz6YJJDOKHupN+uoj8HYnpNZgyzc7mMc0GhCe2VG6zh8DwMaVBdHSiekFIjnkeNgQHyS89KATSWKW5J3zI2IOjOb8uXQoyymnXfwsA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(346002)(366004)(39850400004)(376002)(451199024)(186009)(1800799009)(2906002)(66556008)(66476007)(6916009)(66946007)(4326008)(5660300002)(8676002)(8936002)(316002)(41300700001)(478600001)(53546011)(6486002)(6506007)(31686004)(6512007)(26005)(2616005)(31696002)(38100700002)(86362001)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YTJHY3Mra1RTZHdGNVIrZmt3bVp2YVdKVmhERXkxdkF6OTI4UWo1Y0VoOHBm?=
 =?utf-8?B?c3pFWjUvN1NIbE53bnBXM2x1RmlCcUEvK2RnNUFDTWxDdkVtVTB4cjd1TEFw?=
 =?utf-8?B?ZmloWHoyY3RNeUJBMEEzQVhHZ1JpUmh3ZlhmRWFKK3ozY1V5T2ZMWGM4cEpO?=
 =?utf-8?B?a0wrcG9udktJUzZMMkJUbGJmei9xRTdmYTYyWXVKNkhybmp5TFNnWjdJeW5w?=
 =?utf-8?B?c0hyL1VMWlpmWHY1VlhPMlpEN3ZTeXc2VkJpWFE3V1Y4b2trU01LbSs3RHo4?=
 =?utf-8?B?QjNmUFJ2YnA2a1RXVytYUVRyZzRnNWM4ZndtMndWTXcxZ3BhUklGYW4wWVNW?=
 =?utf-8?B?ckRhdE93YndPZjJzZDhRVVhTZVFTUlFZS0pLNGhkUVpQOGpzZjk3Zklvd0lY?=
 =?utf-8?B?Yi9nRTVQSDZFQ0RGVDFXc3ZSUmpsTGd2WnMwUTVyZCtUNXdFWGlmS29WRGZ5?=
 =?utf-8?B?ZVI3dlhQNzdSQnhuSWlINXNjbUREbnA2RzJ6cEpsaGh4TVBoS0pDcDhNbFJn?=
 =?utf-8?B?Y1piWkVJdFpKOVRWTTY3K0dPeXNFRmdQUWdVeTg3VDExNnRZVDMycjhIVU05?=
 =?utf-8?B?SzR3S1lIdWtCcUprMDV1N3pmNFltM0JNQkdncEFMS2Z0Rzg2VmhHREpYUG5K?=
 =?utf-8?B?Ylc4c0VmNWVLRUtGM1hrZ2VUK2FyMTZQSTBzMkwzZHMxOWpYMVI3TFBzRGNU?=
 =?utf-8?B?SUhiYkhVSTJsdWNPNVpLcHBPKzErWFpjK1VWdW52cTNGN3hCUm1hQm1wdHJv?=
 =?utf-8?B?RVo0a1BRTTByaFFQZjVhK0lqS3E3a1JSN29BZTgyZ3I3WjBGQjEvSFB4N0tU?=
 =?utf-8?B?Sjh5QzlPQUtHRnUrc2RTQjdPTmg0TGNCQXR1YnJnaExQKzJwTjAreFJ1VUZS?=
 =?utf-8?B?dnJ1dTlobzZqNi9IeTBWMjJvRXhtYmN1elIzOXNxQUpUeVJNMHdHWTVSS0hu?=
 =?utf-8?B?TjVNc21PYlV2N2tNVzJTY2Y4WGE4aUVhdGZyTjZRWWpQQ0JZTkJJTWFtaWZP?=
 =?utf-8?B?ZHlUekovc0RFZDh6ZTJyUVNYZG9LQzdCMW5hSWNpVGlEeVR2MDRHK2NGRUR6?=
 =?utf-8?B?NzJCdW9PekxjOEo5L01OdEs4dHZHUTBXbnA0SHRKS1EvMHJXNWxrT3ZuOFh6?=
 =?utf-8?B?L3BjNFkySm56SWNiRHdFRVg0SlpxWXE4VEUvSXZzNmIxck4wSFFwOXdQOW1z?=
 =?utf-8?B?b1JkMFJ2ZkdsT21JaHJJbzVLWE1mNXZvT1J5dkVic2EzU0JsL2JZeFM4T3Jt?=
 =?utf-8?B?c2krY0JVZndvWklSQUMwNGo0Nnk3SjRZUTFxNzFxUnpreWNnK1BsSFFBZ1Bs?=
 =?utf-8?B?UkdRUDAxUk9UUkx3UlhoQ243SnowaXlnZGVnd3RtQUJWODJWa1RlRHN1V3FZ?=
 =?utf-8?B?RzN5TEpKMjI3QUpJTXpzY1JmRG01Sm4rZlZMYUVETmFTemJ4TFUzYTJSSUNV?=
 =?utf-8?B?OThjYytnVFRkcWNtSUgrY0U4YWt3SDJpeDQwZE1YSGRyMFdobS8wVFlaTFly?=
 =?utf-8?B?WklEYmNkZG5GelA1NnhwWFlpWTVacy83SHJIQWRRbUVyUHlleTJWR0c2bUkw?=
 =?utf-8?B?QTdFUDdZOUJNYk8xUEFjRE5UbU9zRjBCcTdiUXpKSHFNQlFZd2hnSUpsa3BF?=
 =?utf-8?B?cDk2cXBGRGJ6VndGem1INkt4QjJyR0J1MXc5TVo1QjZ5T05VUDRnMEVLajI2?=
 =?utf-8?B?Rk5Na0ZmN1JjNDRROGxlZERTT3RwWFdSWmxQeUlVQ2VUR09KaVFqeGJFSHJ2?=
 =?utf-8?B?bk16ZzI2VWZvWSs0bnJyL3F2S09oSUt1U25zRzE2aUVzbjhQYUNuZVgvdDd3?=
 =?utf-8?B?WTNGOUlSMHVJS2UyYjZVMDFvdW94dndIMWxTVG5ONUdldk13eDdiY29pRDQv?=
 =?utf-8?B?UFBuanVPYjJpL0tXTVcyRXNhSFJjSWd6R0FjcHM2MHU0WjlTYnVkK05YMHdL?=
 =?utf-8?B?bFNqTDJ3QXFubmJGKzNJWmN2Rjd0V2o3d3BiR0NENDRPMVN1WEdNOGNkVzNh?=
 =?utf-8?B?VjVOYk95M0hBNTJYV3FoNHRDUll3MGZMZS9zcDB4bTRETEpHczVFSGVPbXJP?=
 =?utf-8?B?bWNxUFRmaEFPSW0zK3VMUXJOUUo3a3NlckczRkJzWE9UVWRuRVRZcndDa2Fq?=
 =?utf-8?Q?/aQAUc7krJ3x1UT3bw9+A8kot?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40cfe597-963f-437f-1ea5-08dba216a6e0
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2023 07:17:17.7045
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dtfsukv9gQj110Zr8z3UmDoVOBWdSxUnVNO/Y2F+9KV0QZyM66+r3wzZ5dvxXuPyGFrnxWFdAQBeurM6hkadXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7038

On 19.08.2023 02:33, Stefano Stabellini wrote:
> From: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> ---
> Changes in v2:
> - use "shift" instead of << or >>
> - use All Architectures (I haven't changed all the other instances of
> x86/arm in the file yet)
> ---
>  docs/misra/C-language-toolchain.rst | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/docs/misra/C-language-toolchain.rst b/docs/misra/C-language-toolchain.rst
> index 785aed1eaf..f5ca7bd2c8 100644
> --- a/docs/misra/C-language-toolchain.rst
> +++ b/docs/misra/C-language-toolchain.rst
> @@ -200,6 +200,12 @@ The table columns are as follows:
>       - ARM64, X86_64
>       - See Section "6.29 Designated Initializers" of GCC_MANUAL
>  
> +   * - Signed shift acts on negative numbers by sign extension
> +     - All architectures
> +     - See Section "4.5 Integers" of GCC_MANUAL. As an extension to the
> +       C language, GCC does not use the latitude given in C99 and C11
> +       only to treat certain aspects of signed shift as undefined.

I'm sorry, but that's still not what the doc says. Replacing << and >> by
"shifts" was imo wrong. What's needed instead is that either this is split
into two top-level bullet points (one for << and one for >>), or the first
sub-bullet-point (which acts as kind of the title) be generalized, with
the << and >> details fully moved to the "explanatory" sub-bullet-point.

Jan

