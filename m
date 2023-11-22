Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 349327F3FE8
	for <lists+xen-devel@lfdr.de>; Wed, 22 Nov 2023 09:18:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638495.995075 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5iQl-0003ZX-Dk; Wed, 22 Nov 2023 08:17:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638495.995075; Wed, 22 Nov 2023 08:17:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5iQl-0003Wu-Ag; Wed, 22 Nov 2023 08:17:55 +0000
Received: by outflank-mailman (input) for mailman id 638495;
 Wed, 22 Nov 2023 08:17:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4N3t=HD=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r5iQk-0003Wm-0W
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 08:17:54 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0611.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::611])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a121528c-890f-11ee-9b0e-b553b5be7939;
 Wed, 22 Nov 2023 09:17:52 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by GVXPR04MB10024.eurprd04.prod.outlook.com (2603:10a6:150:117::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.17; Wed, 22 Nov
 2023 08:17:48 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7025.019; Wed, 22 Nov 2023
 08:17:47 +0000
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
X-Inumbo-ID: a121528c-890f-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y09A/6MK0KL7q9ZR4FIZxZdXBQ12QE47yRo+wS1U/FAW0iXpVWXBMXS/Mrvk9lRhP29A1Z0UR5YKwQSHSr4u8Qc1Qa81g3281fa5TVTw9xbaCthssrDnY7vzoABKux9txVOtvxljT0yYlOzokk58RcCIUM7pa7SejgjPG0yUJgmZ1tebsVj568MsW7EmMebqmwSen5uwkHzVpfR9eAvg7LFqF+WdPgKMG8tahwtG+W/oahFnTxqjRU+HJYBDRc9nlxIlefAn93vNi/hn5qc0RAE6lT00W3RsoKRlVtTujwP7njeGsXiWwkGlAm0qi3fYdSvbgncJe++fi4TQ8IpNzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b8SBeJw/pAokfoZ+EhsRYPTd5uRbwwN0dPoECBXD4C0=;
 b=IQGRgd1z7PUxRip+GDiUfW63H8Dp1QvyO9wdv+A21qDnt0Tjn4+woIu2cR3qVgRSL2B0C35mgouigUKKLtIkv3fcVRi0GeyIzZt73ITtygMXegSxjFrnVSb+20K69QMSvT1qRGqnkPrsu+EmyzZoJ8S/qvy9nnOqBWwNjq4tv/0NlpOQpZAHeyPa3wcuaKaDuwz5kiH3GiGrZsxVcMxC/nw5gwXfCN9SBntIKr0w1lxO76yVyE/BsDuOWIUqe9+C99GdjJ6KOp7u2WpEEe3AyolQYhwuqDHPu+GO/xMZVbi4lffnYKNpkiVUn1+WNa0UTJlvba163Ehps0cjvAXtzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b8SBeJw/pAokfoZ+EhsRYPTd5uRbwwN0dPoECBXD4C0=;
 b=aZLlJebP/HZ226sTfi/OSwyZPLJHKpSlEmrM5c21Z22gRGBpS/IwFEU99HQzLmB15gHkjIYV/snXAylG12Gt8YDAHgfZqCq0FXxLJU4ZlkqIAOISm9umTkb7K8o5lYJhJ4u6jCGQr3tPeoIQFZ31g3wpoFSstDyD18lfQPppx9ZrpDkmx87GMpCxES5SfWonNj/8ceWegyWK5OJ3diyng/l5rNxztsUpH7jJpq+hgvriQ8iG4lga5cF2Sm5B5VFXIoUP6hS1E2CD462K+AQvJOI8NlJQxxw77H8uPSOPQWlv+dssLe/KZzoHPA5cVNkLin8foH5bQJu9s5l+0TECdQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <83860936-b308-40c2-8120-bb143c20d0e2@suse.com>
Date: Wed, 22 Nov 2023 09:17:45 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/hvm: Trivial style cleanup in vlapic.c
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20231121174054.1486631-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20231121174054.1486631-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0174.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b7::20) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|GVXPR04MB10024:EE_
X-MS-Office365-Filtering-Correlation-Id: 3266b678-9c57-438a-5059-08dbeb3382e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	E8ePDUusqzuEYFyr5gfdCTs+qCeiKSHf/3vVT+25xcL/h3zcM2OkNjoCOQavUxo+Cdp++N2De0aAT1iV1lIaCtkIRKMCeD5w8d2x1vRy9h5ba1CFBNQAQ4KoRbA9JX/85ZKXvJQsXEBgCBRBV5+SgMYC/g+CMHoHEGwZqTAdCFvfBFjEEkPHCjMIvdYcZNMojprb60SUrTC1Z27dBMGCw3Si2SfWdJVZ7H1Pg9XvvXpcKJYytBAgwaXpZaL22mmpKg2ZjunZKMMUhmZViLvKM7FXK/H+B/10hak8Qj9YYMY7QsFMaOBGnMv2j2mgGYCifitFWDzuvFDcvXDxfwhCm4MdjAQtKb7Z1qP7NinsCMUu9ujta2G2IJiARlJ7n5381PSiG04uYyA+lUcMh2vAUIWEn75nYT3gnDf07plhpuMDDkyO76EDFY1bAxB5Rm2U/59i6yQA6N5Jb6rWZgIYppL0/IUmJyZbrroFReuTEDjFKGjvYf4FrsShAUSsCOeTrPJSUV5XO5T5TGUA1W0BqJw8J+z7gZO4jI99Efx2/6fHEnRE06iCJxPWkWxgXSIoulbiR4okmJnFtA3XXVlkK9vc/RhXqIbQDD3WbDFEAQ1s5sbUUlHlIZwI/1Bayvlc/SKXyfRk4zHTtYb20imknA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(136003)(376002)(39860400002)(396003)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(38100700002)(558084003)(36756003)(86362001)(31696002)(66946007)(66476007)(8676002)(4326008)(54906003)(66556008)(8936002)(316002)(41300700001)(5660300002)(2906002)(26005)(31686004)(53546011)(6512007)(2616005)(478600001)(6486002)(6916009)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dHJZeGdxWUgrUkV6SGxnRlp5S0w4SU42K0gwM2NLVjhRS3IycitaZmE5dXBq?=
 =?utf-8?B?TTNuYTNSWFo2V3NkelJVSDBsSkxNUGtlWjZKMWY2eGN2KzZhREJyR296ZndS?=
 =?utf-8?B?Y2pZaEVWOUQyQmtuT0N4SjFMb3VHS09RNjcvV0F2NWFIUHNwV0FtTmxFUnds?=
 =?utf-8?B?WW9zNXJDYzAybkxIWmxwUngxMXBabmd2bWJzL3ZsQUxTTmZuRUczVjN0QmN5?=
 =?utf-8?B?cktJdFZEdGhVaDlRNTdQMCsvaXVjZlh1dkxtYlRGM296WkJRdTVFVWRCMm9U?=
 =?utf-8?B?b29zVzFTZE5Ya0FlTGNTcndiQ1pNaDdjZ1B4QTQ0bjkvaGZwelZ1aE11Zm0z?=
 =?utf-8?B?NWNPWEpEbmhWRUZ6NVJSNjI4Z3JjdkJnSFZLRXR1WjMzNFNoYUR2a0JidWhE?=
 =?utf-8?B?YlV5cDRvNU05RFNTMWFtU2dhcGl2N3IwU0tRb3Fid0g1cGM4MXVvRnNmZVFw?=
 =?utf-8?B?TDB2VzYrTXRWL3dUdG1FU2djcXJIRXBsbnZueU5oNE9tSlhXUkFjeTk1WTVD?=
 =?utf-8?B?WVBMQWhYUUtNaVdvSUpBVFNDejd2OHdqR0lXTExlSzFrNTBPU2lMTEhPQk1O?=
 =?utf-8?B?MEVoM2w1L1E3ZVlpSUYxY2I0ZUlWUHBZaHRZZWhFV2xrSmcxVjJWbXVhS0xW?=
 =?utf-8?B?bE9tZzQ2Ulc5U09CZ0lyWWZWTmV6bkRZcTN2WG9RbHQ1RC9pbm9TQStBdFNH?=
 =?utf-8?B?cVVxaVdyVEJUZmYzVXVjK1A3dDFwLzFyR3lKQ21ITWJOMWZnWXZOU3FaMzJL?=
 =?utf-8?B?T3l3cHZ3OGRaaE1WVkhQS3VZK1llemdUZnRoNEZjSjlYcWtCanBsNG95QnJX?=
 =?utf-8?B?eEFtQm1GeGRJYVNVR3NXQ3NmV281KzVEUHF3c2xzamI2OXNWakN4dDRvOSt4?=
 =?utf-8?B?VEk0Q1pJMVNEKzlVZjkvR3FmSXdzWVgxR1RWSUpjZVJIQ0FWRm5heExmeDBa?=
 =?utf-8?B?ZXpGcW94Vm8vOWFVSGJ3Ty9HNkRwemsvS0NnOUIwbzhTbHpZUThFYTlLbzVu?=
 =?utf-8?B?VXEzTTBkenFaUEw0a1ZmZWZ3dm9keHFOVmZJaXBTVmRCZ0VEQXYrQzRjS3BK?=
 =?utf-8?B?bVN2UmhXMDhoOHU0T2RwMUpDZ2lteTJQd3REemd3ZHZDQWF4R0FUQm8xb2Ir?=
 =?utf-8?B?R0xnQjJsa3p4bVhqUkRxT29hMXRaMmd5a2J4RWVsQmQ5TDZxeDcyMkpUUEQw?=
 =?utf-8?B?SVRCemNxeTdwMFU0VGJBWU5XRVUxcWxyL1dqc1pZK2FnaE5NY0dubjBpSEtL?=
 =?utf-8?B?YWdHZzEydGJxK0NjcFFyRnp3MnlWRXV2c2Q5K1BkTS9RRzRaVG9MdWtHSnhz?=
 =?utf-8?B?YytGa0h1OWV3bFM5a2doY2R2N3RRUDBJLzcvMmQ2ck16aDhadWJwaDllaXNr?=
 =?utf-8?B?alAzNHB4RVFNMXJPRkM1UFpSM2FrK0RiaW84YVhRS0dBNEN5cW82RmhpQ1Iw?=
 =?utf-8?B?L2Y0c3pRaE95cGN1SzdCQVJYSldXU3Vod2NING1KRlVDZ0lzWFpGOW1Ga0xQ?=
 =?utf-8?B?KzUrVXFCbXIxRkVZZ2F2UEl3b2hueURydndwcStpc1ZveDRuOTZObW15dllJ?=
 =?utf-8?B?eG5Bem9BT2QzdERXRjlqc0VXODBPTC9TaU9POWN0S0o4ZDVQdHQzNENYOWQw?=
 =?utf-8?B?c213Y2VoZ2U0K0VWall5SC9NL0VKb0FnN3FPRCtRRi9xU05UNkllK3dFVm9K?=
 =?utf-8?B?WmVVa1RWVGZOOGZiV1ViTFJUcG9mQXFKYWZEOWxUdkwxS0Yrc2F5amZ6Zm00?=
 =?utf-8?B?K0tYTFpLcnJnQ2VCdk5sSFg2MXlCd1dEM3JJcVM0Qi9jdjk5dVNrUVlJU01K?=
 =?utf-8?B?NGEvQlRnMEFIeUlvVm03cXdlak9UbzlCbUF1ZVF4SjdnMzRtSU5OQjI5c3JB?=
 =?utf-8?B?alJtVzBPVnBvRGNOVFVKeEZtcUZzcURyVWNQU25nQnRNNks0UmErZ2F5YUpW?=
 =?utf-8?B?SFVZTmN5aFU0RXNnTGc5bG9QZi9iMWFsVG9ZS1BCdmd5MFNnMllJNUxVOVo0?=
 =?utf-8?B?ZHluWlRSeVNrQXhUMHFBeTUyK3JKaU1rQUtDOWFKZlNQMlNxL0t5VnJPaEVk?=
 =?utf-8?B?b3VxaDY4UGpmTUlpWndobDFIMm9tbmdoU01tdy9wOFo1N0lDTlpUbnh5SUx1?=
 =?utf-8?Q?CDM/BHed1Gtezv1y+0FDEq4zz?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3266b678-9c57-438a-5059-08dbeb3382e2
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2023 08:17:47.5704
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lwzIvWtt98ZDyjhieTtegrDckB5e/xVlIiYLWFd5jot2Umv4JgPX6izqIBgymJjob+GBBwicvMekDfkh/ADgXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10024

On 21.11.2023 18:40, Andrew Cooper wrote:
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



