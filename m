Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB017D2BD3
	for <lists+xen-devel@lfdr.de>; Mon, 23 Oct 2023 09:49:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621036.967020 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qupgN-0004G7-Bh; Mon, 23 Oct 2023 07:49:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621036.967020; Mon, 23 Oct 2023 07:49:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qupgN-0004DT-8J; Mon, 23 Oct 2023 07:49:03 +0000
Received: by outflank-mailman (input) for mailman id 621036;
 Mon, 23 Oct 2023 07:49:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OVTz=GF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qupgL-0004DN-VT
 for xen-devel@lists.xenproject.org; Mon, 23 Oct 2023 07:49:02 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2060b.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::60b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9f2157eb-7178-11ee-9b0e-b553b5be7939;
 Mon, 23 Oct 2023 09:48:57 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU0PR04MB9249.eurprd04.prod.outlook.com (2603:10a6:10:350::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.23; Mon, 23 Oct
 2023 07:48:55 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6933.011; Mon, 23 Oct 2023
 07:48:55 +0000
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
X-Inumbo-ID: 9f2157eb-7178-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rn7u9yFD0PBViPyine2ZyX8jPkJkZSyUYxZudlwKlfGKFC0RI+Lx9QFW3hfmYTn3qANa4rT11Ea3NXi8qXqDNyKOVWcdc/zBe3QeQEMBVahkifMqqgfb3Fp5qXry+t9hECodYHOUq07U3KzwE3oeZmDNlw622p0/o6R6qIFIOQQ7ASVGiFouqsnrZNU0yXwlLqlzonirVvUudgpDLgOw6Pt1b5K/aMIhjZ8wm3pbye+H0A9UPSPGsaRhnpFG3U2KZYwf1raXGH8q1ZOgBpsyKdH3ct5W0wFg22VeYsmQdeG3tlAwP6Pi74GU7Hzpu8QJeAa2sSHvH35rDVRhPekNfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5+zaxI8ygfM09GnjNGWGx8e/iL1POZBNLYJmwX2j5aA=;
 b=NPcYalWrRCvc0K8fGX0WLyCWoiC0JZsByTcV5Ntl/rmswP7B55icyixyPcFT/VMR8+qL+c5Er4HXhZKWrwRfb1DPcNl2Z9XcXVPR1GJsDgy9uQvdISKqd5BzyOdyPiGspqY4LDENE92wDY68pHYfS1IeSxBhWzXfPYjtCj2lXBGvYqcu2Ft/ol+drUgivhosG4ZGFE58PH/P203aLroMwMNIwJrIAJ1hhGsnG2fVyH0juA5oheCHaiNT8EUOj29FcrLSr8PUXUHYy214IOJEVwnyzntE6DlqHRq0nwe8hnIb5rFqezvlmO7jwmrTKMMA/zouDvEsaH9UmOPDnpLfPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5+zaxI8ygfM09GnjNGWGx8e/iL1POZBNLYJmwX2j5aA=;
 b=d0Qrr+sEOFSBpgx2lPmmO5MguQ1MblXrvKIzNfndSd2XfCt54tOOtv28BaiPdZ3ms2KmuWcgJO4gnN7j3IYqLt3MuDx5JgzurHXxXdqjYxtg3FrxRRcKh0Sd6CI3bMeGlaL6gpJh7pnvbg4oBiGvDafsnnxcO1qz64Hy4uHlUP9D3PWrSYD+FQYxQUY4rON6xtSxyxPmTNU4gKjcPWtd+L6QtSTmBa309lRXJ72pYhEPKD9QxrGIUrjuYcbPAAvlu387OKI3+oRrC4hnpMN4VBXgl2ksZfy6pjFP6qWNww3aMs4v6YhCHWAm1zhtkB8Ai1Xi8WbOuBL1yVbGxhKSLA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f504772a-68b4-fbfa-e7d4-8d22992c7944@suse.com>
Date: Mon, 23 Oct 2023 09:48:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH][for-4.19 v3 1/8] xen/include: add macro LOWEST_BIT
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1697815135.git.nicola.vetrini@bugseng.com>
 <546cf30aa43d6d0687a9a6c6d23b11128e5783e8.1697815135.git.nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <546cf30aa43d6d0687a9a6c6d23b11128e5783e8.1697815135.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0162.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::14) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU0PR04MB9249:EE_
X-MS-Office365-Filtering-Correlation-Id: 00b67351-d931-4354-bba9-08dbd39c820a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZLdcYliy/PwsQ78tJfpLxbWhE1f0MHWzvkYrH57CG7Um1F4z6GCLv23/8+VREnjWGtFdWmZtDxK1JX63u74LBGBeV6GbyZzWSeryvjYpNlAxEuqcLY7xPm5HfBBoSiWmmwtXlh1Ml4s6HdXmewyNj0x1u0XaS+cQvoJFMR/ze/ol7AUsmAY/32BbBXj5lw3mirkYM631GNMT+7czt20RE/oD/fb0WIUbPdkmMmpq7YoLF2ul/DqGfiC4CaAAZhJQGvlhHXj8UiGVhs6LGJG6RXf9HWdbj4GzU40sr081Z31MUdqNyoxsI73L9n07HZOArYCu0P966L7cMuRD3kVWytjY7GupQuZq83d0uQjqPQtv8VYLODXuNtQe5ABVdCgJhR50K0wj9duWbPXPmsZlqHEbZGMRwYnrqslFCo+DRGJWFP2X0MHa5E9TVKATb8IeVMBwgqceaoqzrMtuRYQXqHcbnMSRsnN4mQ4RTHrvbFiGbfomWGMPxAaI9Mgbh4au07QbDd/TaUe6+p/IYMIegDAad6jh6tfy6OrYC73EGASKFuUMcdJRaldRT0gDvP5I8iBKPweWiXI5lB2CSeHzWErkCOOxwyQHVVxhQpRllCEZK5uXhr4tWe4/mJ1vn8BQWcsBphvMrgbzfGEUY1ufiA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(366004)(376002)(346002)(396003)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(478600001)(6486002)(26005)(6506007)(53546011)(2616005)(6512007)(38100700002)(54906003)(66556008)(66476007)(66946007)(6916009)(41300700001)(316002)(31686004)(2906002)(7416002)(31696002)(5660300002)(8936002)(4326008)(36756003)(86362001)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VnJWL3NEQWtac2JiSlF5WHlXb0dvWFhKSzBvN080b1Y0WHN4dVlOLzBVYmpk?=
 =?utf-8?B?YTF2UXRmRVhjQkhBeEVOUzBDTUFucTExc0VCeDZqOXRib2h6MjRIcGZBUDhw?=
 =?utf-8?B?Rkg4bU5wQzBHZFNLQzBwL1hwTzJIcjFUMTg1aWtVRkd6N09XQzdraGVVVlhY?=
 =?utf-8?B?cmhEQ1htSWdKZVhlVFpwSHhlblkrdFRmWk5NUFdKM2FacXM2QndQWWRseTZi?=
 =?utf-8?B?eEJicXE3VkcyU0VsdjdqbURiRWwyRHpsdFZaSWpkUG9pcG5IZFJtRjI4N3k1?=
 =?utf-8?B?OERBaWtQTUNaRHpJcUpmTmZ4d0lPN2VzenM5bHJsV1g2Y1RHNk9Za1N4cjBE?=
 =?utf-8?B?cDExd3RnTkkxOHkrSWR2TWpRdVZkNW0vSHdFTUl5T01yMTAvRkR6SEpYODh3?=
 =?utf-8?B?SXdQN2N4Zlk5dWxOOTVHcEttamVtUnlUZ29PayttNXlzYmZzWHo2Mm15RktQ?=
 =?utf-8?B?NWFRTnYxSlpKY2ZvTytscXA5dXdueWxiTGFaeUN5WXRQSlh3VDhncEhCNnBt?=
 =?utf-8?B?Yi93QlhOOEt5cFZtR2RVdXVVcllPZUpIV2dPKzNqNTRQS0REUzhDMHZNL2hV?=
 =?utf-8?B?aCtURXpESmxuSTVUT3Y2U0w2RGhUMHE2T1VrQzd3dnBBYVFNbXVvWTB2SFZr?=
 =?utf-8?B?TmZyV0tzZ2VpQ21HcG1lMTZndkpOVlRXNi9GNDdBYUN5Z1JCV1FhVUtTaDRQ?=
 =?utf-8?B?R0NuMUdDUEEvRmhiRkFzVGtvQi9hTStteXZPNnVBMWNpbExUTmFoWDMrQVVh?=
 =?utf-8?B?M2FUdHdKY0NvMmphRWVaNzdCTGVGRmJmRS9UeXUrN280TFBnU0FhSWJlZUVo?=
 =?utf-8?B?aGs3QWxTbkpJK2FoYk1LdVlFVXcwTC8yTjE1RmNaMlRJT0lXeTJxY3gwbjJu?=
 =?utf-8?B?YlREc0tMQ0QvUGJ3TGpUNTdKaS9CYVlTTmxLRnJoeHJGQ2F1V2M2eTR3aE1P?=
 =?utf-8?B?cnkxZVBhQWFseG5vNDZXR2VIWDJTY0JBVE0wclFLbzR6N3pKRlQwV1h5WFRl?=
 =?utf-8?B?Z0NIM3ZDelp2b2FzNlJ6ZTkrcFNad2JlSHEySlExY0lEeFYyWjU3MmR5c25G?=
 =?utf-8?B?V3pxaWtxNWNMbEV6bkp4bHhGc04rMkpPeGlYSkMzWEtNVDRmNCtlL29HanRV?=
 =?utf-8?B?dkhrclYvcUttR3QxMFo2V1VaR2c0a2F3TG0yT0dOOVF0eTRZbGVSRWRFUjZy?=
 =?utf-8?B?UFU1RWxOcmZaUjhiRFJqYkJweEQzUUYzaVp0ZVZnalg0WWJPYUFiN1pjQldK?=
 =?utf-8?B?YWl6WXNBemFlemlZMWJzN3dabFlZNnY0cllYRkY5M2JsVkxYOWIwQ0tXWlZx?=
 =?utf-8?B?Rkp3eU1OanF6T085bytKZ0VaL0FzRzhWQy91UE9vai8vTFFRQkhvOFo0NXpO?=
 =?utf-8?B?cnh1SWgvdy9BdEs1THE5aGZlcmt3NmhSWEF1cnZBanoweFRNaVNXbGxoRDV2?=
 =?utf-8?B?eFRnQjE3Z3JTMkpUdkxQOE1BTTlYTzM0dzA0ckE3K1djUktTT1Era0twdEFM?=
 =?utf-8?B?MStzODA1cEg4bjFWMVNidzNhOXE2TXkzN0t0L01jUWxqRU5hZFc3T1BtL09v?=
 =?utf-8?B?TTRFYzNFUFNCbG5vTkd6MjNjdjNQd2RlNFpvSXRWL3AxbnBqWnVFeW15bWdx?=
 =?utf-8?B?VXBVMXNjanZ5eGQwaFZ2VUVmNGJ4NHJRQkk4OVEzeENPQ0gxNHE4SHZqV2ZL?=
 =?utf-8?B?aDNUei9PdUVjYjJkcXJENFdKS0lwMVNVL1BEdENTL0cyZkxJQWlrZzNWYUxS?=
 =?utf-8?B?QXBZS09YclNiQ0FwWmx6bGZSUU9ua2djZmgzTDUrS2kvVFljdzJ4YVRTcHZ3?=
 =?utf-8?B?MWNrNXVvNWEvTzJsVFJEWkZxRUplS3BlZGpiWTJEV0NZNmxOWXY0ZDFDbTAz?=
 =?utf-8?B?K1BXWHRPLzFIZkwrRENyajFKR3VRMkZTTU9OdnJtc295a0VTbzRsMmNIMjIy?=
 =?utf-8?B?cjRtR0MzM1h2cVR0b0xQV3Fidjc2RktENzkzVDFzK0YxTGJpSlFqOEF4MzBp?=
 =?utf-8?B?VmorWXJ4a1FzMGxoQUxMKy81VU8wdHZ6NkQxR1VhYlRmQzFpb0VGRUZxS3lp?=
 =?utf-8?B?UjcvT0syRVhDenNQQUYvUXpoSCtoRFgrU0xLMHFKRFdwQU1yOXh0ZWtGeVJQ?=
 =?utf-8?Q?udmtvTkSgI6C4c0bDAL8UYecT?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00b67351-d931-4354-bba9-08dbd39c820a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2023 07:48:55.4403
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yQuvggOogixX4KcFgGncXYZ4jnwDYgJM/hEoSPpCPW3Kg8PCPl6bG1r2jDMGhRpP/n42YBXFJqAUHqLF5u/qMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9249

On 20.10.2023 17:28, Nicola Vetrini wrote:
> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -246,6 +246,12 @@ constant expressions are required.\""
>    "any()"}
>  -doc_end
>  
> +-doc_begin="The macro LOWEST_BIT encapsulates a well-known pattern to obtain the value
> +2^ffs(x) for unsigned integers on two's complement architectures
> +(all the architectures supported by Xen satisfy this requirement)."
> +-config=MC3R1.R10.1,reports+={safe, "any_area(any_loc(any_exp(macro(^LOWEST_BIT$))))"}
> +-doc_end

This being deviated this way (rather than by SAF-* comments) wants
justifying in the description. You did reply to my respective
comment on v2, but such then (imo) needs propagating into the actual
patch as well.

> --- a/docs/misra/deviations.rst
> +++ b/docs/misra/deviations.rst
> @@ -192,6 +192,13 @@ Deviations related to MISRA C:2012 Rules:
>         See automation/eclair_analysis/deviations.ecl for the full explanation.
>       - Tagged as `safe` for ECLAIR.
>  
> +   * - R10.1
> +     - The well-known pattern (x & -x) applied to unsigned integer values on 2's
> +       complement architectures (i.e., all architectures supported by Xen), used
> +       to obtain the value 2^ffs(x), where ffs(x) is the position of the first
> +       bit set. If no bits are set, zero is returned.
> +     - Tagged as `safe` for ECLAIR.

In such an explanation there shall not be any ambiguity. Here I see
an issue with ffs() returning 1-based bit position numbers, which
isn't in line with the use in 2^ffs(x). (Arguably use of ^ itself is
also problematic, as that's XOR in C, not POW. I'd suggest 2^^ffs(x)
or 2**ffs(x).)

> --- a/xen/include/xen/macros.h
> +++ b/xen/include/xen/macros.h
> @@ -8,8 +8,11 @@
>  #define DIV_ROUND(n, d) (((n) + (d) / 2) / (d))
>  #define DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
>  
> -#define MASK_EXTR(v, m) (((v) & (m)) / ((m) & -(m)))
> -#define MASK_INSR(v, m) (((v) * ((m) & -(m))) & (m))
> +/* Returns the 2^ffs(x) or 0, where ffs(x) is the index of the lowest set bit */
> +#define LOWEST_BIT(x) ((x) & -(x))

I'm afraid my concern regarding this new macro's name (voiced on v2) hasn't
been addressed (neither verbally nor by finding a more suitable name).

Jan

