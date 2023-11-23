Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A041C7F58CF
	for <lists+xen-devel@lfdr.de>; Thu, 23 Nov 2023 08:06:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639360.996634 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r63mV-0006tf-9z; Thu, 23 Nov 2023 07:05:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639360.996634; Thu, 23 Nov 2023 07:05:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r63mV-0006rG-7B; Thu, 23 Nov 2023 07:05:47 +0000
Received: by outflank-mailman (input) for mailman id 639360;
 Thu, 23 Nov 2023 07:05:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=licP=HE=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r63mT-0006l9-MZ
 for xen-devel@lists.xenproject.org; Thu, 23 Nov 2023 07:05:45 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on061c.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::61c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b82bbef1-89ce-11ee-98e2-6d05b1d4d9a1;
 Thu, 23 Nov 2023 08:05:44 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PA4PR04MB7600.eurprd04.prod.outlook.com (2603:10a6:102:f2::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.13; Thu, 23 Nov
 2023 07:05:41 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7046.012; Thu, 23 Nov 2023
 07:05:40 +0000
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
X-Inumbo-ID: b82bbef1-89ce-11ee-98e2-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YZYxG/JF6aOycck1rxuHpRmA4XhZVcBeq9TgFa1k+xmQy0KoIUNBXG/EfsD6kJpaKo1MgEe3JLHcYSIZwFRIjU9HixOMyJHaQ8KxtLWGR4osb7V50Qh47nEyXjRTYprw8eYzmWTosuzpVWaNRVBM5XhsAf0nHgRomaFXqmrzS3dThhDMZ+zBRaERC8/2rp1p9kJ/K4x5MIAFVBurBHCycua/vE0DCgUmSbuGrxo2bxJVq5tbmeU8PtooDw64s0Gkv6T4c3x5lKZO/l73huWPUI/FRBiLPT0l0AC2w6cMKtPmSgfXeRG2aahbAf1Tm2A6U6Iw9mUcQSfAwjBJD8kCUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GT0iUfl/h/N6hydzBvIEoqzJgerkIUihKxNSrRI5mdo=;
 b=TyTOsjGWG+g4OPwcXd9+ZW+saVjfI+KboxSpoB0UODuumyzCGRhqz511yifCFedjy666No++803XOx0B6J/NQeDc2d5N0NRc+LbJX50t2ICgBF2TwT7FkOL9t8BWn/Z4IZ6khkgPpa4zaJgs7rCmY6DAbkprfZ5ChXxicDhwIOYtDOPu5K9tNLwLGmL/rmgWSaNU+SRSdEOVSPmkBe3mNRaZRb5VhxsH1N4hw/hGQq3Tma19D6c/7xyWeM56fNWVCekM/DOuXU3Ao11BP8qbR00pSZN+kjqogIjG2bEPvDLwOmo8mM+COjnG6TUF8kggI0pE/AUv0KPNxlxKZFshLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GT0iUfl/h/N6hydzBvIEoqzJgerkIUihKxNSrRI5mdo=;
 b=rpyc5p2ic3DBp+n4U6uuOs9ZpMT9bDAJFWVXPF2mF5Wv3hAx778AJa0YcfEgloisavF0VYVAZUgh6kMjy9NSGSvqVW8kNe/34/ew4ZGqVBIBQarUp1g16pxWsr8sJm07jdABs0IpmzOqfjj5LNNnHc7nilBnRMYyKUH3jAYGd/J5wJhR0yxyDyNcw0TVkO53GISey4uvEfz0CnjrLort6AAVsVsSWaHgsXyKpg46fSdxqs5u1lQj9iktrzFRrdBcoZNZc3DzAhUHrfpjAGw+WRcB+VMUOWYwRppcl5U1N8AejNjlpP479BMm+WSE9USk2x6lfjEyBDQCtC4lOTYgmg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7c388eba-6458-4b05-944a-f8a0b6665066@suse.com>
Date: Thu, 23 Nov 2023 08:05:38 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] tools: add two local .gitignore files
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <20231122130220.10247-1-jgross@suse.com>
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
In-Reply-To: <20231122130220.10247-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0041.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::6) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PA4PR04MB7600:EE_
X-MS-Office365-Filtering-Correlation-Id: 53ebe36c-6e82-4d1d-fdde-08dbebf29a4e
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rdlhruYK0eN81iQGVHlv3H26fJc8huHRJIlIMfM2mDxE2eTuoIZ01kSWuYs2pQTAHFekxo0+WTRkCiAdBbQSxS9xdqtdWsPr4zkojFD5AN6zke+2QF0fWWlF94PwftaySwDmCJjlgaxJHczVYsfPWfoM3U3YNQKusHKkG0gKnPYgq0s1h82ISB70wbgDk54+GRKuRa/kpmx40UdyQOK7RyZZ0HruXljR5sVK1HHgWaGQ1t9yCJteJIOUPjbpe8yHyhb7zYISEFw9dhRNyu55KGFOywTdMG8oo+p6RQsky8ULxaFcbsuU5VzSYln9gEVZzdhPnudXam4buE4rGwMPEMG6DdIdAzAd6WHe5HeO4zAZzZNEkjprNZCr2jhypMsuJCyiwMOzHaZLGqgd8SAX7SUp2cS1B5kb+bh9nulWKjcORFGmh7TLctk1dEBfugchKEjwb+c+OoiWQabD6uf+E3YpALkynMsosHTeWxf8y8fYIzShOTjDk8qJf3GKYGsP/xtiZvQmdUlzyt6NdJovFAwitTzQBY8Tq/9Cz7j8iGrnSau3OAl/IEbOxKKYuazmRVDVlL85yrIOq1YDSlcVJUMCM9FNfMFyoIIYKhmg3914OVAbA17rq1t011wbQvhhWHhjLiTnUTdFEshb4oRRSHsWZkmOKTjUZgaA8MM089S72OG0NARpzYxgWZ1r0/U1
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(136003)(366004)(39860400002)(376002)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(5660300002)(4744005)(2906002)(4326008)(6862004)(8936002)(8676002)(66476007)(66556008)(41300700001)(37006003)(66946007)(54906003)(316002)(6636002)(478600001)(6486002)(6506007)(53546011)(31686004)(26005)(2616005)(6512007)(38100700002)(36756003)(86362001)(31696002)(142923001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S0VWQmY1Zkh0L3Y3di9uSE5DaGxjNWR5TjlnTmk5TWg3VXR1ZEdIU3lGSGZI?=
 =?utf-8?B?elFaN3pkVkJxU2Z5K2xlQzdFUFI3bVZwR2kwcXRjWGpyMS9FQ0YyN3QwUXRi?=
 =?utf-8?B?RW9jT0RrWEphWXNQeXMwKzFRTy9KcWxHMDQ4Y2JtWHk2TzI5eDBheng3WEFp?=
 =?utf-8?B?NTJ4T0g4VWZhNFBlZkZCUzV2SDQ5d29VaVRBUlJjSFpDaXNkMUlKQjhNK1pB?=
 =?utf-8?B?c3duQ00xN0hKdUhsR3kvb09PUk5la29FNzhrdDE5RHVVdXh6eTdpQjVBcEVL?=
 =?utf-8?B?VmMvV0t2MXBoNXdidkpKZWVUVnlxWHBKNUYySExhUEdjRUtyY09qQksrRTh6?=
 =?utf-8?B?d3g5YkhmUlZEVmhmNFpJM0FWc0Jvckl5K1FFTTR3bWViQjFTekg1YlJCY3F5?=
 =?utf-8?B?RGJsUG5QSkxOTVEveTg4Q2hCYlRMZnpTYUlvNXN2dVBrQTg4RnR6czI0bGEr?=
 =?utf-8?B?VU93SE10Um9OM2VGN21KMlRwS2VFck1acXBDaENSaUx2UDhhRllzT3JiSjNF?=
 =?utf-8?B?Y1hvTENzS09Bb3FvN0dvOEV0bGlBL0RuN3prUnFheVJDRkdBSUExMnQ2aVdO?=
 =?utf-8?B?U3N0bHN5NmNoUGNmWjdXeGhqalQ3UDhmWnZRaFZrbmRaWUh2cGJ1d1Zia256?=
 =?utf-8?B?SjAxTnI2UVh3ZzJTRzBrTWpLMVdRemNKWGpHQmI0eFovdXdiTWZpbHZuR2hV?=
 =?utf-8?B?eTBJbzE0ZitjOGoxUUZFcE5iam4zMHg2WS9Td2hWbjdIN1hmNmxIMHVLYlNZ?=
 =?utf-8?B?aHBKOHlHTDNWOEpCVlRDb0FESmFnYWo0NGpMbzdmenMwWldaTnJpeTFGazJJ?=
 =?utf-8?B?SW9RODYxN2JkbGtFQnNXTUVXRmkxSitDMzdiYzJUUWx3dEdqUnRUcUNZaFpT?=
 =?utf-8?B?QWZUV1R1d1E3aXc3VDFjQlBJeUxPb2xsbzZ0d2JYemovd2s4NnRsMmFMZUM1?=
 =?utf-8?B?NXJETTNGL3JwOVdjb0FhRkZrRE1WSFNuZHpQajk5cEFncVdnaWcraHJ0VWFt?=
 =?utf-8?B?amw5TXVCcmZLVHE0YnBtY2N0THZtZFFPc0xTcjFqUllWdFhtSFBlTlZyOWlI?=
 =?utf-8?B?TE1Tc1JmUStuSWNwdzlyZUFDZHBOMEhwUVdIRFBhbHh3VkFNelVqblQxcnFG?=
 =?utf-8?B?eXI0UmJZOCt2S1o1RFlyS1hjWk0yeG5tS1FhL3psWW9ZNnlLcG0zM2hWelBa?=
 =?utf-8?B?eUdDcGFNL2prL0tKWkxRSFJTaGk5MzhEWlppQ2h2Sitsc0tSbXJNbTRLRHVl?=
 =?utf-8?B?dFNvSE0xUnkrQVhZYldKN0Y2TUxiOURramhyUlFrN1JVRU9adkZDeVNaZkJJ?=
 =?utf-8?B?b0djVEQ0ejM3dWZ4NWVwYjdGVkduYTJ2MnRvREU4TGcxaCt1YTNwRk9Kd1dL?=
 =?utf-8?B?Y0RacnptUC9GdGhJdHlSdVpma1VVWlFyUFI2d3FScEp0VGJmZGJJcytyd3o1?=
 =?utf-8?B?MlBKTmQveXNVTjNXa2w5aTVINXdjdEZ5dkUvQ21HdllBelVpOFNiaXJTcGhy?=
 =?utf-8?B?T2NYN0UzU0ZLcXlzd0h5cCtCWERFaHBQM1NER0t2azY1eFErMWgwditmSk5s?=
 =?utf-8?B?NFlNYVF2RGEzUm4yZGREcXdNK3hoUGZxQTA2bXlKVDdzQzluQStXeGRPeDBy?=
 =?utf-8?B?S0dUYmRYWlJRcktkbDRIZFF2aVl1UmJJOVVVSTE0ZzFOdzhpWVhSOFlJODZS?=
 =?utf-8?B?L013RGlTQzM0R1BvNG1BM2xsN1oxckVMdWcxWXhnYmZXMStQckVVVjN4UUtp?=
 =?utf-8?B?Y2tYbnNUTCtuR01JN0psdzI1RStyUnBra3VFWFRLV3VOV0k0OVFReDZBWlMw?=
 =?utf-8?B?UVk3OUM2TUFDa2paelY2S2NZVUp3Zm1rL3FUTFoxaFQyNlFWSUtFb2RVUlZr?=
 =?utf-8?B?QU44R2VFcnRXeFFGTXczZmMzcEx1Zmg2aGxFa0pOZzRhd3NUN3VCdW5NOHBi?=
 =?utf-8?B?V2Z3OHFiREJxUW1aWU42SDB2YmtSdFYrSFJOUHhxbHZyL1VXTnB5SkRpc08z?=
 =?utf-8?B?KzYxRmZ5alVCTkhKalNiSDJNdlpWOGlnSnVnc3kzTmxwREZTOXE2cmp2bnRm?=
 =?utf-8?B?NWZ5TWVwaVIvMHU3WnpWQjJQNmFCSXJnQlU3SHZlVFV3REFsUmxoTEhsRnhu?=
 =?utf-8?Q?syEOyZSeym0/dBIk70Qs7DgaZ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53ebe36c-6e82-4d1d-fdde-08dbebf29a4e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2023 07:05:40.8306
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A7ssJ8fUw2p7FejMtP23sz4Eje+PnX1KENPOXKINeNHo1XKFqlUrMIHzgnAOnZeiK1iEXrXw6KBQKM+4o2a2sA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7600

On 22.11.2023 14:02, Juergen Gross wrote:
> After a new build on my system (OpenSUSE Leap 15.5) "git status" will
> print out:
> 
> Untracked files:
>   (use "git add <file>..." to include in what will be committed)
>         tools/pygrub/pygrub.egg-info/
>         tools/python/xen.egg-info/
> 
> This small patch series fixes that by adding the related entries to
> local .gitignore files, while moving the existing global entries for
> those directories to them.
> 
> Changes in V2:
> - use "/dir/" as matching pattern for directories
> 
> Juergen Gross (2):
>   tools/pygrub: add .gitignore file
>   tools/python: add .gitignore file

Reviewed-by: Jan Beulich <jbeulich@suse.com>



