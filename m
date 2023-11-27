Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D5A7FA3D9
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 15:59:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642218.1001575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7d4n-0003qc-HQ; Mon, 27 Nov 2023 14:59:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642218.1001575; Mon, 27 Nov 2023 14:59:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7d4n-0003nx-EN; Mon, 27 Nov 2023 14:59:09 +0000
Received: by outflank-mailman (input) for mailman id 642218;
 Mon, 27 Nov 2023 14:59:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nblC=HI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r7d4l-0002jd-RO
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 14:59:07 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20628.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::628])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 826209e9-8d35-11ee-9b0e-b553b5be7939;
 Mon, 27 Nov 2023 15:59:05 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DBBPR04MB7849.eurprd04.prod.outlook.com (2603:10a6:10:1eb::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.19; Mon, 27 Nov
 2023 14:59:03 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7046.015; Mon, 27 Nov 2023
 14:59:03 +0000
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
X-Inumbo-ID: 826209e9-8d35-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DD81iWiWbGbHjBIBakaOcZJjJYhRiy/2WEa1kMCOovaEayov0vZXLG4Q9zteAuktKBOFQvasAC/Lwhm3umWl/zsLj6PEgu71AMheYhdZPO+tQqwR6tGC1KQbiWYzElQBLTEH6I/zS+LQ/WWBX6lBWeRYIh0Q3fXLPfEXmbXRV0XHgcSj144QYdGkDPJYNkwZAU4BMR9y8YMuJsZo2oZOmkvsFKeAVIyyHhdyoG+Ba5QXc8JWTYWTUG+BFLr6rDCY5C9EsINcOVbopRzAsfv28+IsSzbjm7S2vnCGnOSFL3u0RyiBjtA8rliedBJiaSIW+pRekx7uHi5kK4/uPaD5lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=huXVDHiHts0e+I2NQzjcV9hrChBr6RWKEkS+mrK+Ge0=;
 b=fQm5im2dGd+Z2g6yMJ9r7fYhc0vDMatKPcAjghhtDID+rChmOxY+u6fkedurLtZgOd5jN6TC9Wo4t6LXWjhEmIG9Qc9DUW5SJZgXH6Vsq6k2jx+CtZbq/4XqD+r9NUVuRUg/tV9gdY95wqrm0rTFboDLNPk2PTlVEj2zKQq7FdDCuvrDchJzZlDSa8dTzl3LxLiQJLYiW+UJywjPRAV4CISDMqmcXYN30FRnpZLB7M2/MciqDVm5Vg57qdYNpkbrMyg1k9FiPXV5ebgyKf7KF0UKoAO7UQAkNoo3Qyc/xnisz6CqImzhpj3QOONNB7TyraOlW3zrTZ++GjcUrXo2cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=huXVDHiHts0e+I2NQzjcV9hrChBr6RWKEkS+mrK+Ge0=;
 b=0Fwzg+1cdEGKOYBkHqGMIqWsgoqtjy5xQLPNy1LLER4+ixUpDhDJDmTdBoxLWmmuierivR2AthycCy3JtIItjK276scA7FkCJZoJZP+D7XJufW7iy7TvbkJmyH2UqIzPmo7o79WG7lPROA7ff+Yhow/pom5iSDgFP7wdhaqC+/PHy0FI9UacHDYMySiQIVYV9EeY5rj1a5exJZo9Rk6cFYCeEq5HF/arJDfyp2d3JhCczemOE8MC2uxcJQPYoM4rz6qjtSSPQufcMZK3L5jGjwj8xMwZ491j0AB1JabZHT1oo1E2FlUHkvY9uOvYeq0VUvlEBP/q7luKwXhdxS3BxQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b3e14bf0-def2-4e1c-83f6-a94a203c7b8d@suse.com>
Date: Mon, 27 Nov 2023 15:59:01 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: MISRA: Compatible declarations for sort and bsearch
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper3 <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Xen Devel <xen-devel@lists.xenproject.org>
References: <f60a702c838c3274cf9e1193964222f4@bugseng.com>
 <ca540835e3cce50a852fdf2b3956205a@bugseng.com>
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
In-Reply-To: <ca540835e3cce50a852fdf2b3956205a@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0114.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::6) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DBBPR04MB7849:EE_
X-MS-Office365-Filtering-Correlation-Id: a05a6dbf-e08b-41d1-5e2c-08dbef59652d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kNXgG0M5tAA+sz4k80MIjgW9+SNes8zaeyt9JlBeZusxzHAdYgGUgHxyS2pam/sQLBxqnkMhwdU/CRFgFwM/zg4AFxFA56pN58mOCBQ3tT9Lu068gu6og8Ur4xhewYlZTltll6MRUJo3Za+kHGrgEKsUsFHy/fO+N0+mI9P5LX9IGd3EyJuZkXADB5OmrhXwQTaLt6NdDdXtKKL9trzO20fhbe3pQF/BreZg8SR4cOwxCfXgaY6mA6iuVch8VZfuKozjoC/nncyaVTgev0TWyPhSTYXjEaR7ankr1RWitb4ccXDjMb1gJ2yis3glCDjtF1Fe+cTNom/JoPXlkJJ/zegjuymc/W4EFFmm+tbnSh1LTLzvh4zbejVIK4bathlJEz2NL0SyHMIm8uM0JbY+3Jch5g4bXi2ddgwHN5DJeKJCagJaLp/+6sqkBwQ8VAPGeyedR8IPQsgRKIm2Yr2Hd7lEDdmNDSKJ5+oOhfKmOVOe79bWPZB0tOtCSbXeHC8CdpAAGHf8lLlnjNNpKGCXVmoSZWFSneLITmYXslB3aBhS9ZUzD/p2vUjxW2DwsLVJFs6U95cVnWz7oYgW5oAv6+gUDaFmrBNsu9sCaHHJerkyVEz8ildAyYREviot3RE50kHsFgCK4xvu54h/xxQROg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(396003)(136003)(376002)(346002)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(38100700002)(31686004)(4326008)(8936002)(53546011)(6512007)(6506007)(8676002)(66556008)(66476007)(66946007)(6916009)(54906003)(316002)(31696002)(5660300002)(6486002)(86362001)(478600001)(41300700001)(2906002)(36756003)(26005)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZDdGbEdXUDdVN2dPRmlvUllWOHo4cE43Y0ZTZW91SUc4TjVqYU82RWdDR2l1?=
 =?utf-8?B?cDljL00rK09sT0JUK1R5cFBGaTNURW90SkNBb2l3QVQ4SFFycnpiNk1XajlB?=
 =?utf-8?B?cllueEFuVnU0ZWNtUTJ6V0VWNU13dGRkMS8yenArZStySm9OazA1UXBvYldC?=
 =?utf-8?B?V2RseDlKcFVCeFpvRTNrT0U5UHN2Y3cyZFptVWNWczE4Yi91L3dpNW1qRi9v?=
 =?utf-8?B?ajZGNFJ5bDZtUEJIbTQ4Yk1xTmhOVVFhVERxMmFpQUI3dUpYYW5jZnZ6ZHpv?=
 =?utf-8?B?TzlsMVkycHp2VWx5MVYyMkpHOExEd1pSMUVMNHdVRlMyc1FUTUZyMFF2Y01I?=
 =?utf-8?B?dk5xUXpndk9XenVuRGo4dDBvTDBySXg0UldsM3NnZkwwRmdRK2NPT0hDUk43?=
 =?utf-8?B?MHl3QnpwVzVHd00wV28za0VVUU4wbndWM1lIdysxRVJvLytYQUZWSGorZmxj?=
 =?utf-8?B?eDVsL3FqRGZiVWh1aU16TTl0NGZvL3pXTFFiaDJsWEhaUXJURkY2Y2Ird3NJ?=
 =?utf-8?B?d2NFZkxZOEJ5aWkxQm0rMStWcE01L3lXaWVaQ25yeFkrTi8rUVoxcG9SdEIz?=
 =?utf-8?B?bGUybHRuMTJsSVFsYWNwUC9NWDh2bE9wVitub25NL3d1bU85TXVkTmRWanA2?=
 =?utf-8?B?a3lWVWsySUlNdnMyWlF3WlVIenUwcDRLaWRSMThnY1NlSkJLRlpGck13M3pJ?=
 =?utf-8?B?NG12RGVqU0tBbyt0Q0dxWUxSeG1SYjlNUHJ2WHphc3ZVS2xlbStWaWhHWUZh?=
 =?utf-8?B?RUxaVHd2R2tJZ044TnVxNERwSzJkSDRGN1VQRHE5OUJSR0cvWk44RnFObitq?=
 =?utf-8?B?bzFpbDdNd2lIdk9kUVl2T2hwNmU0ZHo5VXZQSlErUnRPZkx0RW5sUXBWTWpX?=
 =?utf-8?B?ZWJrTkNYdmFlNGprbWtiNWJhb2JLM1BnM3dCdGdCYWlDc2N3R1FaT0NaK0kx?=
 =?utf-8?B?dlFqOWFybHRrVDdDQ1hheHlkN0NGQUQ4NDJYeHYrWjEyN1pFRVRURjZRdkhD?=
 =?utf-8?B?MGFPNXpkTWw5NzhycHJZbmhXelFSckVoSVFEOVpuczl1M01KR3Q1Zkl2ckkz?=
 =?utf-8?B?VDBVMGxQNTkwaVBvQUZDeFpDZjF1b0N5VmpoeUJQSFBhR1ZqODBEdy94WS9P?=
 =?utf-8?B?R3ZGNndVYlVpUnVoVDBNRS9JS1hTUjl0d3BiWXNoVFdtMVM1RzFjSk4yMG9v?=
 =?utf-8?B?UUpBdzBzbnY0MDdLQ0o3WWQwdUh3RGNZQW00SzVVZDhVSFMzS1R3RDR0TFFO?=
 =?utf-8?B?N2FDRzY4aVBvbFZxd0Qwc3R5d0h5QlM2YlpqazhTaUdwZGliaGxabEZ4NGxJ?=
 =?utf-8?B?aDZmUFcxZVY5R1ZTMCsxb0tvT3VKL1JuUkFHakV2Q0ZFTHpUTGJyNlZWYkla?=
 =?utf-8?B?V2ZzUG05dVliNkRTTUI3OWZJSDkydFBpRzVFbXRvd0wzM01qNUlBWkF5RDRy?=
 =?utf-8?B?K2VUVUNiSDFkS0ZmaU1YS2F6dnlLREhxQkhPRGNWaTRaaDN6S01BSVRQU0dW?=
 =?utf-8?B?Rzd6aGVFSklCRU5pei9WZ2NtTDVVd0N2ZnZWTkpERnFnVnFSWnphZnNMSTdR?=
 =?utf-8?B?dDdscmc3TkdJd0xlbUpkTVRuTGlRNUgyc1ljSDN1YU8zZDY0ckRvMU9IZHJV?=
 =?utf-8?B?YnFJbUg3NHllZithczNBVXQyR1h6UkhkOE4zSlRpWDhuQkJyRjhsVlBWdHRx?=
 =?utf-8?B?NVdQYXhOeUlTSm9kSTNsMHRlOW0yZm9nR2NnekZuTEhacjYzWXhRSW9WWmxn?=
 =?utf-8?B?WThEWFhQNXJRK0ExbHJxM0FmR0hOZlUxYk9TczRMaHJGWUdTUkNsRUoxS29R?=
 =?utf-8?B?M2szYlVLMHRFNzBScjJDTENBQTRNQ0kzR2NKT3lQQmVGSVFUNGdQajRmMmhH?=
 =?utf-8?B?RG5kREkrSHhGTWl4WWx2dklOajRrYWpEd0hYZmNQWGhNVElJQUFsaWFQS25S?=
 =?utf-8?B?VHdRcHE1cWtDYXo5bG9mWTAwNVRkK3ZtcnhMaG42Y29JK3RrQ0VUdU9ERHZy?=
 =?utf-8?B?OFF3U0NlMVBiNXN1b2toSk1zQ2dQWXZGMkgwYy9XNTNjdmZUSVd4bm9OZ1JD?=
 =?utf-8?B?Q25jSnlaQnM5Z1NNcUc3YnB6ZWhQL3R1UW9LWWpzLzFHMmQ5RkdrZnNBdUJq?=
 =?utf-8?Q?LIRAktP58kruNVH9CLzkocU9Z?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a05a6dbf-e08b-41d1-5e2c-08dbef59652d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2023 14:59:03.5813
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wcsYJJcGTuwZ4bItPOgaw4a+2UnHvVGXMUCZTDgukOOmLA3lPkScoXmb4huePtdKMuPYMoANkuZZiHtX11tBHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7849

On 27.11.2023 15:32, Nicola Vetrini wrote:
> Still on the matter of Rule 8.4, though not related to bsearch or sort:
> 
> - the definition of do_mca in x86/cpu/mcheck/mca.c has the following 
> header:
>    #include <xen/hypercall.h> /* for do_mca */
>    which in turn leads to x86/include/asm/hypercall.h, which includes the 
> following:
>    #include <public/arch-x86/xen-mca.h> /* for do_mca */
> 
>    where I can't see a declaration for do_mca, as I would have expected. 
> I'd like to understand what's going on here, since I may be missing some 
> piece of information (perhaps something is generated during the build).

It can't possibly live in the public header. The comment simply went
stale with the auto-generation of headers; the decl is in hypercall-defs.h
now.

> - x86/traps.c do_general_protection may want a declaration in 
> x86/include/asm/traps.h, or perhaps it should gain the asmlinkage 
> attribute, given that it's used only by asm and the TU that defines it.

Neither is really attractive imo.

> - function test and variable data in x86/efi/check.c look like they 
> should not be MISRA compliant, so they may be added to the 
> exclude-list.json

This file isn't contributing to the final binary.

> - given the comment in xen/common/page_alloc.c for first_valid_mfn
> 
> /*
>   * first_valid_mfn is exported because it is use in ARM specific NUMA
>   * helpers. See comment in arch/arm/include/asm/numa.h.
>   */
> mfn_t first_valid_mfn = INVALID_MFN_INITIALIZER;
> 
> and the related ARM comment
> 
> /*
>   * TODO: make first_valid_mfn static when NUMA is supported on Arm, this
>   * is required because the dummy helpers are using it.
>   */
> extern mfn_t first_valid_mfn;
> 
> it should probably be deviated.

NUMA work is still in progress for Arm, I think, so I'd rather wait with
deviating.

> - compat_set_{px,cx}_pminfo in x86/x86_64/cpufreq.c are perhaps declared 
> with an autogenerated header?

I don't think so. Only top-level hypercall handlers would be. This works by
(perhaps even unintentional) trickery: xen/pmstat.h is included only after
set_{c,p}x_pminfo are re-defined to compat_set_{c,p}x_pminfo, so the same
declarations happen to serve two purposes (but of course don't provide the
intended caller/callee agreement).

Jan

