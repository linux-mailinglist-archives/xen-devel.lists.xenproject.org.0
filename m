Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7946E7FF591
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 17:30:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645055.1006837 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8jvF-0003z0-61; Thu, 30 Nov 2023 16:29:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645055.1006837; Thu, 30 Nov 2023 16:29:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8jvF-0003w4-2q; Thu, 30 Nov 2023 16:29:53 +0000
Received: by outflank-mailman (input) for mailman id 645055;
 Thu, 30 Nov 2023 16:29:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BG3/=HL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r8jvD-0003eV-Fg
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 16:29:51 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20600.outbound.protection.outlook.com
 [2a01:111:f403:2612::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ae64d8b2-8f9d-11ee-9b0f-b553b5be7939;
 Thu, 30 Nov 2023 17:29:49 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by VI1PR04MB10052.eurprd04.prod.outlook.com (2603:10a6:800:1db::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.18; Thu, 30 Nov
 2023 16:29:46 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7068.012; Thu, 30 Nov 2023
 16:29:46 +0000
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
X-Inumbo-ID: ae64d8b2-8f9d-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dfg+7GfByELd6qbl0C2eFevwxwBrYL0ih6WBqkjMWY6ZB6j8oWlbTOHhqsgUQ/ExdcP7pES/flfM7lXAHyUkP0znzqDVCBSLbJ9oQEoVvYApUZX/f89VGsKKAxN3M7pZ2R1bHX5N7FWF0RddGppp3wOVdB5ed+tnFalHEYrsTLTJXOyDszWpYmC8k1yawT/BJs52lJT/PpJyjQaW193tkGNE9BRHesUL0uKuAwQxw6L49e2UiO5VMYf9x4T72EcIbv62LMk8flt+/u4k+zn/RT/BYICSBAKcsj7yz22xA7NpKY+85A2pkB6Gh3ndWYgHwvFJjFS022Xjm7ggyk3+vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=19th791u8Q40P67jno3Zsl0Clu2tY5TxkMTqR6JbPmE=;
 b=PUGv26ZVve7As+RQ+1pj2oOjB0YZ/N9F8Khzs7BY1bMo8xhQrvbwQ/gzrmlO09SOzpB41B6mVoIzH0srBwaKdnaAqiC28soLehNs8vk9Rb+0FtFtkmwcOqP3di6j5ubEDd5QHEsX14v7j83svTeP1N6JwEBly3JNeNVJ/ukXsYe+CAkcGpFa4dBGFQITK+ElB4hGeAySw1e5RrEDNsVCohAN2Let/A7F4IT+/SKCCWDNgLSLxCUCNk08irnSK5wSH0urlHOyFsQnnWa2FXCjYNs9uMH0d+T0pR1yRg0r+vIWAcXmxp2y7rJsjSzcMH5QdRph5Y1/CH9Ln+Uv8niYfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=19th791u8Q40P67jno3Zsl0Clu2tY5TxkMTqR6JbPmE=;
 b=GP7rQ6oJosJoSpZ9TjNsQ7KyTDBAkInJCD3HiJTnVXhrclrSPCZpFnlJqrAFeN4ADfzgezyRtS522rTY4PvK79VP8EIr0kd3Nw6NUZwlebJWiyp8CGP8AyZkbtM9p+8Bpy2eSpHE6xOuFMU7O3rjP8+enopp5zl6fr/OqJD0/VD1H+hLhaQkBoquvjmKf1t4HVEwyJKumjkDl/wkj5uQ52EFcUQhfPsEOLDdKGWkosQoWzguBtox+wSbBYzi7AtHSNszOP40dLUhmtcLApe2Bu501WBsagfBhJ+/62Bc0RpJjhK5n10TaPIUdMrX+3OL8wm19/77bMnDl4CqoAnlsw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3423b479-f99d-49f6-bf5f-15e5c1aee823@suse.com>
Date: Thu, 30 Nov 2023 17:29:43 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 09/11] xen/param: address a violation of MISRA C:2012
 Rule 8.2
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1700832962.git.federico.serafini@bugseng.com>
 <2ef34f3beec85dac126a89c6da1bbbdfaa00727d.1700832962.git.federico.serafini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <2ef34f3beec85dac126a89c6da1bbbdfaa00727d.1700832962.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0146.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b8::10) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|VI1PR04MB10052:EE_
X-MS-Office365-Filtering-Correlation-Id: 141691c1-5be9-41db-a55a-08dbf1c1909c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hjMx/1keWF/khSv+WeA3EeJ979HHABRwAxzn4VX3aZa5RUvnEfDizOlB3WObSQ99JokRHBJgtZKtOf7QH3D3VLIExscGf8/dBMDqnXs5op8tZ1OMAGaETZ7mj7OcHI441/2m9bgD86/zb4TqwH4PpvX9Bh2/I5ajOcpcp3lOwLKKelpG0uOvIwOoaFAiAn6T2fPMUDVlj3xHhmSaAv8kBMBqOudN2l2xE8YeoAic29vn4PVDasG04+IP+ct4RW/WxexbMNIeotw54lR6zGxFjAHK/8de7CA19Ks4fpehkcPxETwOIuoIhY4DIKWxLI3MNJBv1u6jBSx6Nb3WusAaikyoD/ZDUib67G+x3aZA6AVCSL3PLqe3wydjXqVCdDRufdsYf0NVB74LU5RbQ+wwMLSNvp/kJee3HmwPAQ7TGpS0pZw7pUBoFLnkr/YWQNO1CJUP84v3Zk7P7HcPotmhV3xIu4Jp5MEwXY2RTjsbZr1qhJI0rCNhmfrVRYQ9eiag0honQOP5LV1J2ZONY8KtlKNA5yTjq9TX2J7XrMI1xi8K9d54o3j5Bu7oGG7ba92PNDvACMbbEufTh9qFslsXMBmKJkGPWWYCFcXSdCkznqmIZhagUM0jFiJSh7stBi3J6KW1drFGDXigsaYSb24fzw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(376002)(346002)(366004)(396003)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(8936002)(66476007)(478600001)(6486002)(8676002)(66946007)(66556008)(316002)(54906003)(4326008)(110136005)(4744005)(5660300002)(36756003)(6506007)(86362001)(2906002)(53546011)(31696002)(6666004)(41300700001)(38100700002)(26005)(6512007)(2616005)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bXdjdUN3YUF1cTFxSmNnK2dZWFVZZGZrRmJOdFl4aHFRVTFrMTN4RllXNmJ0?=
 =?utf-8?B?c0lHUHhVQkc5cjZYdU9ibmYrNVBJR3BYRHFIVlFoeEU0RFRJQTN3M291ZGlZ?=
 =?utf-8?B?Y2wwaDhjNkVpZCtwNkxjTDU5UEZLd0FYNFhOU2o1NWVpVkJRdjQzL3RkbThI?=
 =?utf-8?B?VUZJaW9nNVBKcE1zOXZadmxrRHU1Yk0rMkVvb2tDRnZPQXlQM2VlY3R4Rm1T?=
 =?utf-8?B?akdLRXJwek5DeDBtLzVodXloNUxmdHRPMVNNRUhTVWhYWWZWZ3hSR3RNYVQ4?=
 =?utf-8?B?Yjkwc2FqaWdSQkRvZnhhejlTZzlFSnQwdTV3VXBiYTZOcWlUNXk2V3VWRE9n?=
 =?utf-8?B?aG84TjRpNk52ZjF0NFgrVFhFVEl2OThrandoL3JET0tTT0ZTZTV6WGpRUmJU?=
 =?utf-8?B?NzYrZCs0VVF1NVBLQ3VzRElzeTVXMzV2U1I5VVgwMUFjM3pDczg5cmxqSDFD?=
 =?utf-8?B?QzE1dGZwNkVIdEU4YUxZcDkvZmJmRFNFai9HU3dGendFbzFMTHo1WVZqSk9s?=
 =?utf-8?B?R1ZpLzNOU0svNVRFLy9US1RoMEt4TFBybmJGMlBleGNOb3oxa29NbTdhN2Qv?=
 =?utf-8?B?VG9LWWlaOUcyRUdYYjlseFhyMmNoZEtDaVVwUTBBeENxNXF4dElnNENoREo1?=
 =?utf-8?B?SjVXLzNIaTFoQVRCTklmVEhyMEZaNDU1aXNBVVBOUlcrVmI1VzBKbjZGUVRS?=
 =?utf-8?B?Y2drNnBDNzZtdHBkZkRJcEZ4ZmlwaC9rY1ZkVlpldmFWQ2NCSldHQVVtU2x2?=
 =?utf-8?B?a0pMUzl5dEszMWNlTUtGYzVTZmlRNDd5K3p2SXVOUjRaUU5LQWdFbFozQVJW?=
 =?utf-8?B?d2pwckJ4VERsVXFvcDJweGxaNk5sY29MVjNWMXZKMDNQakZteDNQK0RCY2tZ?=
 =?utf-8?B?dE8yMTVINy9YZ3pIdFpwdEJNVFpXUDB5UjRBcXFvWkRMR1dUVVplalNDU1hE?=
 =?utf-8?B?WkcrM2FCSHNzRTdNN0VZNkhMQVFZZ1JjZkFyMW5rcDRTZzB3Y0NVb1hPSjEy?=
 =?utf-8?B?YU5KSmRZZyt5dFBOSWswV0FrNjFWU1VEcy83V2h5Y3FCQ1BoYmdVVmNqU0hL?=
 =?utf-8?B?eitEek8wRExUTmVuNmdXekE4T3RpbmFjbHJEcTZNSk02bWVISW9DbnArc2VL?=
 =?utf-8?B?RlFjRG93dUZsaFVjTXltOU1vcE9GbnJXZmdHUGI5dGlGbEZZL2tvRnNIMTJP?=
 =?utf-8?B?akU2UURhZHBseDZVNEpLSFYzUlVhVWVweGlqaldMaE1RRW8rZEZKdlMyc1c2?=
 =?utf-8?B?M3MwRzU5dHk2cUJDV0R3QjN4SWZzd3h1MG54VTV1eW9pQzdaNU1BczVKSDFs?=
 =?utf-8?B?K28yTmdSL3dpaGQrdlRCWkNQZ240REphaWdablBtZ0NtdlZONExoeGhrNGo4?=
 =?utf-8?B?VnRxUTdOTnhSOUNqWG1LTGRkR20vQklZM0ZsUkRGblZtL3M0YlBoY0dpVjdP?=
 =?utf-8?B?bkpMY3NpQTZ0LzVHeU1UR1pOQ25FaENUUFEraFVsSkVRZFQ4VUQ0ZWhjVTg0?=
 =?utf-8?B?blBiaHo2alMzaC8wdWlHdys1L3RoUHA2MDlTNTdBSjhLV01BeU1SSzFqVE16?=
 =?utf-8?B?ZEQ1WTlTRkJaUXRWNjRWamlFZXNudkFvVmFTNTREV2crdVlpUXh2UjB3L244?=
 =?utf-8?B?TmFJVXRCTUNNeDF4NE9DZjFhUlVYRjRnak0yV2VDZ1RGM2JBY0tySzU1bzVY?=
 =?utf-8?B?cWNCWUxwODNDd2ZndlVNc2pGM3dVVktDS3VPTkdzYmdUYWJwTU9VTm5ERTVw?=
 =?utf-8?B?Z1JtakFnblFEMzJqSEVwKzQ2cjVvd210L0ZEVTljZ2lxOGZpRUdJNURkOTMy?=
 =?utf-8?B?YnQvMUM4TVVYd3hrRVM5ejNFK1g2MUdOczFkVnltREFDR3Z6QzhpQmU1TW9I?=
 =?utf-8?B?bW1sNkRQcUovNkh5Sit4bGJMSE1WNlE4NXRHTmlpeDIzRlBWRXZBalptRGZF?=
 =?utf-8?B?NFBibHZCblZMbW8vOEtQRDc4b1pPQTgrLzI0dzBDU3gxT2g1RzNpdHY4Y09R?=
 =?utf-8?B?aVhUdHA5cTdQeU4xZGRNNktYRlRXNlROWll3bFplb0NROGdxZWtSa0J3WHI1?=
 =?utf-8?B?Q3RQb2V5cHFzQVZ5dm13cm4zdDlKem1xeFlZdU9XakxqaklLaEVWQStsdElt?=
 =?utf-8?Q?g0T3ljuXqKsYR+Cx4bTZsfICE?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 141691c1-5be9-41db-a55a-08dbf1c1909c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2023 16:29:46.1692
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B2LQNhHWNQZnfskSWpg5Hi2rWwWBdxYLBqmKV09Rw95SqrJtu7FqDR+tP2MbtfQmNDYAR9hPeb3n33NNUL+WJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB10052

On 24.11.2023 15:03, Federico Serafini wrote:
> Add missing parameter name. No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

> --- a/xen/include/xen/param.h
> +++ b/xen/include/xen/param.h
> @@ -22,7 +22,7 @@ struct kernel_param {
>      unsigned int len;
>      union {
>          void *var;
> -        int (*func)(const char *);
> +        int (*func)(const char *s);

Still I again wonder what good this name does us here.

Jan


