Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E6D7D7E99
	for <lists+xen-devel@lfdr.de>; Thu, 26 Oct 2023 10:38:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623594.971573 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvvso-0003w2-1k; Thu, 26 Oct 2023 08:38:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623594.971573; Thu, 26 Oct 2023 08:38:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvvsn-0003tB-Uc; Thu, 26 Oct 2023 08:38:25 +0000
Received: by outflank-mailman (input) for mailman id 623594;
 Thu, 26 Oct 2023 08:38:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hFWs=GI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qvvsm-0003t5-Qr
 for xen-devel@lists.xenproject.org; Thu, 26 Oct 2023 08:38:24 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0606.outbound.protection.outlook.com
 [2a01:111:f400:fe02::606])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 05fe346b-73db-11ee-98d5-6d05b1d4d9a1;
 Thu, 26 Oct 2023 10:38:23 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM8PR04MB7362.eurprd04.prod.outlook.com (2603:10a6:20b:1c5::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.18; Thu, 26 Oct
 2023 08:38:20 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6954.008; Thu, 26 Oct 2023
 08:38:20 +0000
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
X-Inumbo-ID: 05fe346b-73db-11ee-98d5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j3nX03QNmMoNMrUF4625vOpo4DObIYnjzjUG3X151jc2EV92S7F2tM7dzypjKeDIeJoI+kn3vCW8VlQFrDvOIrSondLQhczCpRhGu/yp+dhHO0OMMh38niPfMJcWNSNa3aPtGqXI1XsmXZD5TdvLztSFMYy9YDm2sdvGU/nJuTFII+G6syLzuLEglAxQWXQhNpt5bsiIlN1kuIJloVOahtiUOJqf4MNCgTYrFcWyZ1ZiNbP2eZoxupKq+4a7ID8ZOuWxrTaguUOg2laovVkCiz2qYMoV6yhCUl6jCG/y8VfJogSZqk8KP1QrTXhbGeCYGujhCI7kJeAADfcfWSSoSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y8rWSpsWnL1e2D1xcChTAv4edpUqiqVpJ+qqOYWwqiU=;
 b=JjGuHd+znlKe9qGJuRjUSsfKZnhMQlX9GY78ClMRP2HDvqlHCA+5LmVo011A16FlKICIoSw4UQFWdUtHTcengTPpr6MJ9ztavgFDSdAK8f/Q2e5Fg4Li1Zfvvo0FgT8kwGzLfQx8beoEg1cSMYfCYKVRm+mbq9wdbYCH6+rQmio9W43X2W0C/Fs46nqDw1yN7Vh0gwbpLLuWuBdmYG0pswYszht2lRRuOWkMjGbxFz+x2Vs6kS9yfYQDuq0BgUgtrXY4+BisNQrZwDZbXL2oKP9tuKpAvY9Lb3Se5kXBiTBuMcWV87sBQ04NzlMs+fXWnUlyPZia+eimoJQS57P2jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y8rWSpsWnL1e2D1xcChTAv4edpUqiqVpJ+qqOYWwqiU=;
 b=r7Ku+4I9vHeH6jWMvU5n+5+vOzXx40sMyGEIuGvewFbYS014cZvwPJhl6Z39PEqkSJ6kVbUVvL+c189Nvq5TJ4OuV1b0+MkrkC1rdAAXbPk0ZwIbKdkXJ2ntuDOE04St3zndw9YnzKsFWGwU65K3koGd05mCY4UveY7tjbwWa3r7wMKKil/Ug+Gg18nzKc1+ccLKRAzbqvnwid/UHWAUstnd5RM2KWb4dPaLLIV4wJwJq6zyTAKRMxWNwGIvziFd5jJ4AGG+qoY3Nrlu/2So2A0Ciyojr+4E1S+o2BrFtBkRGvMaXjUHvMQKcyDJIRfDR6+cTOCxMV/R/h0rgJ9zQQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f3ecae05-6fb0-79a7-c3ec-ed2093a8f40e@suse.com>
Date: Thu, 26 Oct 2023 10:38:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH][for-4.19 v4] xen: Add deviations for MISRA C:2012
 Rule 7.1
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <9bc37dc81744283ca3b92ce3ffad373740122288.1698308237.git.nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <9bc37dc81744283ca3b92ce3ffad373740122288.1698308237.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0446.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c6::12) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM8PR04MB7362:EE_
X-MS-Office365-Filtering-Correlation-Id: 807b5c47-63f8-4151-0c25-08dbd5fee855
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aCc0XDavIh/FHy2E2tmURYs+BdvBdyQ/UY/FPwR2Nwi5w+9wmSXto3OIR1biQksgrzQLULZU72fBPxWbHolWjIF+fW+HPpo48a9tMKYEmtp7o+95CRporhuF+lzShBJiGQqJB3YYn3oXdBiZv4QNUAxB2DEGjnm7fe62E5R3RvEbumH5o6Bg0gFwEo4c/sjWEsPWttakmN9icHmCveci5WZW40wDpAtG0MUJWlvoL5DRR3ACCY9cyGge/VRg3DgAPvD1gScwdhwoCLnp22jShlxV/MH7ExVoztNfUIF6/RAJrlp/lUsDG6E77YIxDYr4yXFaMvmS99dbn9QEk1f4Z2KCxT83XnC4POXdAwI9dlywsH56orOxwekbblpa2/DHReCBH30rSvsW+2vFjzmAAy2fPPcoxxseHmM0xhF1CoiDk3gb6H6oCnBlJ1FkRAacJFG0ojHdx2yU8yJIAEGNPgQG4ce7QixRDFaxP13/KDgqjDb8/vtOgIBOBOhUkZRwP1Jb5qVy9KNh+72NTet7/VjCXu3TAcaPkzJXvfdK/MrxVOsMg6C8u78Cew8Eq6Ai9IRTx7ErsKsTJ9/0MVnoDlRGXP5me465H3FCd+gKuWbdN7I7a6OViz/RDsv3OVL62AjIPxGAM1O0WYg737s8BA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(136003)(346002)(366004)(376002)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(6486002)(316002)(6916009)(2616005)(6512007)(38100700002)(26005)(6506007)(54906003)(53546011)(66556008)(66476007)(66946007)(31686004)(83380400001)(8936002)(6666004)(478600001)(4326008)(8676002)(41300700001)(7416002)(5660300002)(36756003)(2906002)(86362001)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QzFIMm52Y0llcWJQNGUvUEduZGt3NkFleTEyUDFzaDZKdFVvSFdBaHI0WFFu?=
 =?utf-8?B?ZEtsdksvM0ltQ1VRNVhEMjNzRjBveGxvUUFLOFBMeTJiZ0U5ZXNLbGRQa3Vp?=
 =?utf-8?B?cWx1TVZEYWJkWDV0YVdMRktvK3JickdVK2VtUWVremtDd0hkMGUyUU9wc2xx?=
 =?utf-8?B?RU9jRnJWMWVLSVFjMDh1TllzazlVWnB4Z3ZTa1NKUyt1ZU9xTEtYZVNtWkpr?=
 =?utf-8?B?eWQxMFB0TjRUZGtkSW11dUpBSGU5cnc2TVY5ajVnSkhHcEVjYVJlVVkxa1Ax?=
 =?utf-8?B?RVArY2tnTlc0NDRDVERIenhaYVcvS1JWNEtTT1l5VEZ5OEF1MlNJcmw5dG5k?=
 =?utf-8?B?azA0TTVvZ0p3VUY2anJucFJFSjM0dVBsUEkyeE5pbkM4YXZoem1RM2ZENmh4?=
 =?utf-8?B?bHgrdWtyRVRmUVNlUHJ3T2dtYUVhQlc0aXFhTmxBOTZjVGNqOUZKS1FyekxX?=
 =?utf-8?B?dVlMVzI2QzRjd2lzVnBjaVlIWnRGb21rc0NnTmFzbmxoWW0vRFNDYyswT3dF?=
 =?utf-8?B?TDRPNEpNcGdaUi90Zkw2di81czBzeEhvWlZ3dFk5bXpnUVVnd0tQbEUzS2Nz?=
 =?utf-8?B?T3RmbUoxZFZyc0xRTGROeEp2bkh4UGMxaHYxK2ZyN3Jsak9nZTJRb2M2Tllj?=
 =?utf-8?B?dSt5TEZvbWpIdjVrLzg5NWZtQnp6UVNLQndsUndjcTRJMmNyR2s5eDlrbmxN?=
 =?utf-8?B?VHoxTUFrSWRCbWNubEU0ZExhZnQwdm03UHIvZktJaVlING5kS1RNUFdhdm9O?=
 =?utf-8?B?YUdjR3k1N3QweGIzanR3QTNLYU9Ua0FnVjM0SWw2RTZMTUp2RzEyMFRNVEZN?=
 =?utf-8?B?WksxWkN6NW8weldYVHI2cXptam9ZNkR6WTgwY2RxVEVkQzMwQzM1c3ptZWdm?=
 =?utf-8?B?WEx4S2V2NzZ4MGFJQUNtMFhQK3IxVDhWbmNJd1NsdVZFT3B6ZWdaSmxZekFa?=
 =?utf-8?B?czRqN0p2VTBYQnB6NkVWeGVTY0s0QW5OL2Q4YjFUeURsOS8rcXIzM09HVElw?=
 =?utf-8?B?cWJUczNyUERmbkU1eVVnVTk2TUpSMEdYRk5iM1FxN2Z0eEFuOSsybWlIVjdi?=
 =?utf-8?B?czNSeHBuQlZyekR2b2cxOFpscjd0aUtyRTc2ZXRGZzJveXlTZEF6d2VIR083?=
 =?utf-8?B?UWpQdVhzQ2pNV043NGd5MENHajMzaE5RU2NiVU85aFNNVkRvcUpqanQ1aHNv?=
 =?utf-8?B?YngwL3NyR2o2d0ZWcUNMNGgvczlpS0ZrcjRabzJJRy9RZkVjS2xjZ3B1dDVQ?=
 =?utf-8?B?TEx5bUJSVXFvVTJkNHR0YkhJSEJFRzRpb3dJSElrQ092OGE1ZVByMkhOUStx?=
 =?utf-8?B?YmpDOUNPYjdWN3haT3pBcmZvSDlIaWkxY2xWN3QxejB3QmNYY0R4aVJGZXdy?=
 =?utf-8?B?OFdWYkhoWUNNVWRTNU9XM0dmV0NuajhVWE80cC9FM3Y4Ti93WlFPUmxNQTFI?=
 =?utf-8?B?OFR0SDVZeTdGMndwVndOV0RVTVFKem95YUdzMWVsLzc5STZKY2dnTmlVVTg1?=
 =?utf-8?B?TGhKRlNNd3JxQ3padTNMejc5c0NxVGh4ZCtaUE9kTHFpNTlIQ05jUVJ3aUhY?=
 =?utf-8?B?dGdhbS9oeXNzdzJCalM2SXhMSm9OYWVkbkxscEpYV256WlQ3MlpNaG1Nc2NK?=
 =?utf-8?B?bU1rcTZwc3JtTlIvUUNidkRLcDNSWkhvcW9GcWVSZHR3bzZmK0NYbDRpUDZF?=
 =?utf-8?B?a2NGa2pENE43eWthY0c4UkF5ditJVFJncDBtUW1Pd2tkUHJYd3hkRjk4VjJO?=
 =?utf-8?B?RWRua1NKVmFJTkcwbUF0aTFiOUtaOUlzL2NhTmlGUkxqNXRhMDVHZWNNNytB?=
 =?utf-8?B?N2pkWFY3QUlnZVpIb1YweFhsdEF1WVlxY1hLd0xlUnJXN3NNVGsrTjczV0dD?=
 =?utf-8?B?M2Y1ZHpwVjA0blh0K3VEUzBRNkdkcXFwREtpbEp5VW13NGRaKzhNNGNQVUYr?=
 =?utf-8?B?cnhmWVNCTkZzZ3ZjQ2dRT3pUbmpUR3NPUzhkcjhZSTkzbk9mV1pTcmFaeFMx?=
 =?utf-8?B?T2lVQUllbFhIcW13ZHFYV3BpcXY2eThsQlVQbUZuSGhkMGJWa0tlVy9RZTdp?=
 =?utf-8?B?aXFXbTIwa2RvdE95K2VjQ3lIQTF3R2FpRENqdXBpRmhkOHZrVUx5Sks0c0pp?=
 =?utf-8?Q?FKSfgPlteFYqttkmM+dPN8WGn?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 807b5c47-63f8-4151-0c25-08dbd5fee855
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2023 08:38:20.0309
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mHZ4U3acs/D/oS/RkGvRXTKHsLag2AdsPxesFO6mYcX83r/yvaePFhwZYMyQAF17jUQSSRKqKSTkATv9ARyMQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7362

On 26.10.2023 10:18, Nicola Vetrini wrote:
> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -85,10 +85,12 @@ conform to the directive."
>  # Series 7.
>  #
>  
> --doc_begin="Usage of the following constants is safe, since they are given as-is
> -in the inflate algorithm specification and there is therefore no risk of them
> -being interpreted as decimal constants."
> --config=MC3R1.R7.1,literals={safe, "^0(007|37|070|213|236|300|321|330|331|332|333|334|335|337|371)$"}
> +-doc_begin="It is safe to use certain octal constants the way they are defined in
> +specifications, manuals, and algorithm descriptions."
> +-file_tag+={x86_svm_h, "^xen/arch/x86/hvm/svm/svm\\.h$"}
> +-file_tag+={x86_emulate_c, "^xen/arch/x86/hvm/svm/emulate\\.c$"}
> +-config=MC3R1.R7.1,reports+={safe, "any_area(any_loc(any_exp(file(x86_svm_h)&&macro(^INSTR_ENC$))))"}
> +-config=MC3R1.R7.1,reports+={safe, "any_area(text(^.*octal-ok.*$)&&any_loc(any_exp(file(x86_emulate_c)&&macro(^MASK_EXTR$))))"}

Is the matching of file name and MASK_EXTR() still appropriate with ...

> --- a/docs/misra/deviations.rst
> +++ b/docs/misra/deviations.rst
> @@ -90,6 +90,13 @@ Deviations related to MISRA C:2012 Rules:
>           - __emulate_2op and __emulate_2op_nobyte
>           - read_debugreg and write_debugreg
>  
> +   * - R7.1
> +     - It is safe to use certain octal constants the way they are defined
> +       in specifications, manuals, and algorithm descriptions. Such places
> +       are marked safe with a /\* octal-ok \*/ in-code comment, or with a SAF
> +       comment (see safe.json).
> +     - Tagged as `safe` for ECLAIR.

... this description? I would have expected the key now solely is an
"octal-ok" comment?

Jan

