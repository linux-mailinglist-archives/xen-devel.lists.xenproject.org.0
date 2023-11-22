Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 695177F3F46
	for <lists+xen-devel@lfdr.de>; Wed, 22 Nov 2023 08:53:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638469.995006 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5i2U-0003Md-AH; Wed, 22 Nov 2023 07:52:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638469.995006; Wed, 22 Nov 2023 07:52:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5i2U-0003Kw-78; Wed, 22 Nov 2023 07:52:50 +0000
Received: by outflank-mailman (input) for mailman id 638469;
 Wed, 22 Nov 2023 07:52:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4N3t=HD=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r5i2T-0003Kp-3v
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 07:52:49 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on062d.outbound.protection.outlook.com
 [2a01:111:f400:fe02::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2021aa52-890c-11ee-9b0e-b553b5be7939;
 Wed, 22 Nov 2023 08:52:47 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by VE1PR04MB7248.eurprd04.prod.outlook.com (2603:10a6:800:1aa::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.17; Wed, 22 Nov
 2023 07:52:43 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7025.019; Wed, 22 Nov 2023
 07:52:43 +0000
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
X-Inumbo-ID: 2021aa52-890c-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fvddIeMpPoxPItWe+XDSwySb8kNZN7pjyrqtzNHG4EuxuQGhxMWNcGd8mEw75FSm30Ax0qHq52Kt2BAHgmaM0ZV8jxkvx+liE3pCzyJiQP0HH1UrwxfcMbTAiM1wZj0SYysisJJ+M0SXbv3W5mWfd0XkjpQzhDfusoYtWo6go6UgkQdmUphTvXAkRCWs0SiegtT9bYrkrCi6yUuQ+/W4XDdIohmOQfgVnChq1ViuZgoqxaRSKL7pu51JyZIzL3qAlseiJEkGzIeHCYjY8xc0760tf5T4gnIGaNA2ML5Kqvj00aJPxAMjCbxpFtZl89TICVZYGi8/p690elqCH+Qezg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7q4ZF8gCc/7gDZGwVFKqF3sfQnsb7NFM9eVOknlZWjo=;
 b=OzXoHzUnbg0QwMAMaCC81FOr046oZTkZynkyPhSVlhUkm8ny+T74ADnx9sjcQ5cXHENVOibc6iw4joLUSvczJ1BT1NkCQBZSfFFE9zTNnc4M7R8xpE/Vi6raEFErwftT7YySjrIoXqIZ2PNfMMmybVBCz9Js0I8WDl1usl4Jo/FYOv/ttj50YUmrB7+oS9ofevmEBNljglWgecwWt8HNi3OLgrZtj/DxLnAwIWVFIbl9EfQiRd8SPSh++NI0IKbsfAjFfkChqI3uOQn2+gALVd6fEgeYxbOooEiLRLX/OUQmaybqN1PNlSgrNiIHGvtI2bqxKw3CTEG6Fn4rPYvwCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7q4ZF8gCc/7gDZGwVFKqF3sfQnsb7NFM9eVOknlZWjo=;
 b=yDc220cZw3gW87iO4gy7i038e8qyKMt2VsE8rN1sz3k9WvEt6fC6MOG8XpSBlR1OYPA1jhBL7v9e8mad44QNcq4g0VO4vHo5nasWOYhJah9Vg3HDHDBfqfxV2D+5LoBLQfULIC5tHHyfPyDonJiLgBrh5tDeVXvWJbTB19pcmKEYgWFUL6EAQLqoX+A+MDxkBCsozfuot1NOpEuGKN+DShnw+B5DbJjTu4C/j+EROn8Crce/IEazE5xROT04JJDb9IYWC2Sgmqpj5kjYDE9kS35Na6Om69I7OsVKsCyjYdVea4Yi9dSfxDXiXS/Dt1qSuunT11g0yCDx+/XB9QTEzA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <33f43b2b-985b-4417-ba27-b7691deaa8b8@suse.com>
Date: Wed, 22 Nov 2023 08:52:41 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] x86/HVM: hide SVM/VMX when their enabling is
 prohibited by firmware
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Kevin Tian <kevin.tian@intel.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <791a9f45-2bed-48f9-af6a-9fbde65bcc71@suse.com>
 <b16802f5-13ae-47a0-b12d-604928f4cf7e@suse.com>
 <ZVzZy-KYgdAsqRE3@macbook.local>
 <d63dfc54-cf89-44b7-ab7e-983037892833@suse.com>
 <b75a4d31-260c-4377-b68c-c8153dfd948e@citrix.com>
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
In-Reply-To: <b75a4d31-260c-4377-b68c-c8153dfd948e@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0057.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::17) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|VE1PR04MB7248:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a4d8a25-c32d-492f-4ee8-08dbeb300297
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dau0fyDLLqmx8g6oODOFrzZHpPPd0rZumHPidWGEpuJFcL/aQ/ZYrHsh2WsbLFT3JgmHEZ3XzSd1BqNBhJY+Kj8JECBXICj04ui/bwrKqeW61L5zdSkInxNbznCfVml/fZvs9FejQKolULnmGchLeINtAOfcZhxOydOq9z7PM+2e1Eg+ImpdUX+J18VTOssvArXjQ5z8bSEG1TTb4yOwwavrLfuG1WOvCRtyCa79wqOgmpb7qqgqoW17gx3O9kv3viBRSJbLP7AZa3oN5L/fombP4gtK5+jfxHxRuaGUBOuvZeojsYTHgaE8vVQu2BS/Vy/Hxyq09L1wRGscIwlJkxZmbDg2NgqpvjefMgpighFI/pkC8LKr1Jq2/85LWutL/Xtfd0BRGrsCUAgH7kodQz6J+ptP0Zna0BxgxMmh4Wsj+Oud+zoUE9KZu21vXWa49T/a34tkcgFLYxxTkg7J8HNZZEr0FteQfdG4ufGg99XWC/AZz0ZNLZ/eZ0fjOmCsMsNS85ATuBuK7k93xqBDRN50DbnpzG8QgKG+kflP/NigUBpVRg8L1P3ykgvGs6HqBHDG4EHSXu2wOJMJ+ET+wXzOUetCrGmTnoBV0QWDcVjdXBVFCnJBQIWl0lKDGq+iiJzQ2YEwCPp1Ygo+qsfO1w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(366004)(396003)(346002)(39860400002)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(6916009)(66556008)(66476007)(316002)(54906003)(66946007)(26005)(41300700001)(36756003)(8936002)(4326008)(8676002)(38100700002)(86362001)(31696002)(2906002)(5660300002)(83380400001)(6486002)(6512007)(478600001)(53546011)(31686004)(6506007)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WXZNNHhmamFmVlovS1FSSmhhSyswcWRRaVlweEFQNEZXU1NOOXhWdGNSc1RD?=
 =?utf-8?B?R0lsK0VONzJQbEtCUkVKU2tKNS9Oelh0NW9FTW9UQjZlSCtoYlR2TnZDU21i?=
 =?utf-8?B?VENoQ3lqZVFzSmsxcldZejM4RmNwV0Z4R2pjMm83QnVaV0FHeS9ZZzRVWWpr?=
 =?utf-8?B?YkpmM2hDSFIxU2hwTUZ2eEk2U0tac0htVlI4Q0lBOSs5NWlkWHpDUVJKMHEx?=
 =?utf-8?B?VjUwVXphS0dhcXVYZ0JweHA0Vy9FMEJnME5mNXpTSDhXRGJieElQeHRjUlJU?=
 =?utf-8?B?bFE2c05WVWxLQm9BTDZhVUFrMVdLVldySXg0TVkyMm1zZ3Q0SFZZRE04cWRu?=
 =?utf-8?B?dFZ4Y0FoZDJuU2pwY1poMXBjTy96bkZFNVRRKytQZHc0c0c5bUZ6aTM1RkZH?=
 =?utf-8?B?QTlZd0ltV1o2cUlTdmlNd3g4N3liNUhEdVV0dnFsVjJBc2dxdXVrWiswV0pk?=
 =?utf-8?B?SmNrMGdwdjBacWJVenAxWlhrWElVSUJTRHRCcEpNc3F4MHROWGtpek93MFJw?=
 =?utf-8?B?OExTcXBEejNsZ2dzcFlaVTlobVpjRUtaV2xPZWE2LzRJZGowYUZvRHJ2ZE1a?=
 =?utf-8?B?T0V4amx4MHRpU3hWaWdGTnVKR0pVVjdseFhHem1CVWp0eUNaSzF5UGhZWW5i?=
 =?utf-8?B?MkFFWUNOaTA1STVYajJYR2NnemRTSFg1c1Z0UTd6N1ltYStZRm9rVDl5bE9k?=
 =?utf-8?B?eVQvNU1RVVBIb0tKSUJhYklNc3c4bFI1bkxrUFYzVE44bTE0WjVsVmpLazNw?=
 =?utf-8?B?d3lZdldhYzNtY2tIMWM1Nm5aekJEM0ZCZ2grUGQ4TjdMMW1zd3J2M0lnUWIv?=
 =?utf-8?B?b2E2RTlhVk0xOGthb0xxbzdxY2pWUlZNdXRRM0h6UWhVaVVoeUR3b05qQ0Fz?=
 =?utf-8?B?Qm9MSUpUZnM0YXJMeklORVdDT3dEU01VLzdNME10aUZ6b290UkNVRVBteTc4?=
 =?utf-8?B?SnNPQVhwSFAyMGgvRUdDa2xiUERxL2RrQ0RZajZwVm1pNkR0YzRpc3ozZk9t?=
 =?utf-8?B?eldFRzZheDMycFJ1cEtlZDZkZDFKTFUyRnNjR2ZnaVlwZ1p4OEFZS2R1Wk00?=
 =?utf-8?B?MWlUK1RuU3Q0dFBDdU42bUxqOWhIRmYrUjl4eTRQOVVXcU1vdzQxNkNuNDVj?=
 =?utf-8?B?SUJHc0hlMXN0U3hBamlOR1p5Q1NJNlJaUmtCY0tqZTNtb0xpR3RpcmlZVGQv?=
 =?utf-8?B?UEtGb3c1L0ZaVytydUxYMDNZOG5xeHdQdTZVZG1wWDd3eTdhUlo1M3VqVzFj?=
 =?utf-8?B?dU4xVUd3S3ZZREhKcElSVm1VRHlwZkxEWUU4Y3NpVkozaC80M05pcThrbDAz?=
 =?utf-8?B?Q2hCN2UzanAwaExXK01ycHEwU1d0am0xN1hSUzdYdVVqcHIwSVJtMHYvdVRj?=
 =?utf-8?B?NG83OGNDeG90d0dVU2c2Uk9yNnBoTmlrYmNYM3ZTSFJjbkpXd3g5ZWJNSW15?=
 =?utf-8?B?amw2ZzhhRVhpR1dXRlNiTElTZVRtaWpkbXBxN0V1a2NQNkZhZFhrb3JWeE1H?=
 =?utf-8?B?VmphR25GUEx4SEJMYVJFOGNDbkJiZG1Cc3paU2pxeDQvVWtlZlNkditzeDNp?=
 =?utf-8?B?bUVZaUJKV1BLdmFHN2UyQXNyVU9tM2VESVdPdmFneGFTY1ZnVVk5NytTakNY?=
 =?utf-8?B?VkgvRWEwZlNxb2c2QXVpcDVLbFFKTHNIajVQL2FacG44bHZXTjZSMXFKOXpO?=
 =?utf-8?B?a1JGbFE0TW9Cd05QMEFiZm96KytZOXNrYjVhUjFzUkRGYUQweVRhSkhOVlZH?=
 =?utf-8?B?RjlUTHZBamg1KzhWc3RRVnFCM2huSHhEb0pLNzYyVGI0TFhFeW1NaUZWN2I0?=
 =?utf-8?B?M2RIWUxrallFQ3VjdFk0UHJpWk5YemgvbU9Fak8rMzJCcEYzYTZVUElBNjQx?=
 =?utf-8?B?bkQ2d1ZPRHhKVnl5VEI5ZDdSdzNiNGpoZGM5UDhBVWFrcGwwT2Q2eFhsTTZk?=
 =?utf-8?B?eDhBUGxFc1pyL1lka2dac1VZSURkVklRV1UzWHlPaVFqUk96ZlZtMEZPODAw?=
 =?utf-8?B?YVVzSk5mcGR1OUlSQUZ1SmlubERWNC9IN1lBZVBnL1FJY3BCd0QwNW9hN3Nn?=
 =?utf-8?B?YzlDbzlMNk4rQUU4ZjI3SWM1cmlCWEhrWER5Qm9CYUt2cUsxRjVKZzJpazJR?=
 =?utf-8?Q?f7duyJ6QemX/HtRKIq/mfDT72?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a4d8a25-c32d-492f-4ee8-08dbeb300297
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2023 07:52:43.8617
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7kPWBjbrFRcO3KbVxBZLGV4OKmV0gVIqydK+8ZZUKapuZLHf5BxPg0EyPdtMOYsV79iTpfLSim3fuhCfAevoQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7248

On 21.11.2023 18:31, Andrew Cooper wrote:
> On 21/11/2023 5:27 pm, Jan Beulich wrote:
>> On 21.11.2023 17:24, Roger Pau Monné wrote:
>>> On Thu, Nov 16, 2023 at 02:31:05PM +0100, Jan Beulich wrote:
>>>> --- a/xen/arch/x86/hvm/vmx/vmcs.c
>>>> +++ b/xen/arch/x86/hvm/vmx/vmcs.c
>>>> @@ -2163,6 +2163,23 @@ int __init vmx_vmcs_init(void)
>>>>  
>>>>      if ( !ret )
>>>>          register_keyhandler('v', vmcs_dump, "dump VT-x VMCSs", 1);
>>>> +    else
>>>> +    {
>>>> +        setup_clear_cpu_cap(X86_FEATURE_VMX);
>>>> +
>>>> +        /*
>>>> +         * _vmx_vcpu_up() may have made it past feature identification.
>>>> +         * Make sure all dependent features are off as well.
>>>> +         */
>>>> +        vmx_basic_msr              = 0;
>>>> +        vmx_pin_based_exec_control = 0;
>>>> +        vmx_cpu_based_exec_control = 0;
>>>> +        vmx_secondary_exec_control = 0;
>>>> +        vmx_vmexit_control         = 0;
>>>> +        vmx_vmentry_control        = 0;
>>>> +        vmx_ept_vpid_cap           = 0;
>>>> +        vmx_vmfunc                 = 0;
>>> Are there really any usages of those variables if VMX is disabled in
>>> CPUID?
>> I wanted to be on the safe side, as to me the question was "Are there really
>> _no_ uses anywhere of those variables if VMX is disabled in CPUID?" And I
>> couldn't easily convince myself of this being the case, seeing how all of
>> vmcs.h's cpu_has_* are defined (and I'm pretty sure we have uses outside of
>> arch/x86/hvm/vmx/).
> 
> Before you commit, are you sure that VT-d will continue to be happy
> using IOMMU superpages when the EPT features are cleared like this?

There aren't going to be HVM guests in the case the clearing above happens.
And the only thing that happens when vtd_ept_page_compatible() returns
false is that page table sharing is suppressed, which is relevant only for
HVM guests.

Jan

