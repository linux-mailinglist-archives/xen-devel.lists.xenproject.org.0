Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7957F41C1
	for <lists+xen-devel@lfdr.de>; Wed, 22 Nov 2023 10:35:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638578.995286 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5jd6-0003xZ-E4; Wed, 22 Nov 2023 09:34:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638578.995286; Wed, 22 Nov 2023 09:34:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5jd6-0003v0-9Y; Wed, 22 Nov 2023 09:34:44 +0000
Received: by outflank-mailman (input) for mailman id 638578;
 Wed, 22 Nov 2023 09:34:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4N3t=HD=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r5jd4-0003uu-MD
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 09:34:42 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2060c.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::60c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5c24f9cd-891a-11ee-9b0e-b553b5be7939;
 Wed, 22 Nov 2023 10:34:40 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB9705.eurprd04.prod.outlook.com (2603:10a6:102:24b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.17; Wed, 22 Nov
 2023 09:34:37 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7025.019; Wed, 22 Nov 2023
 09:34:37 +0000
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
X-Inumbo-ID: 5c24f9cd-891a-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FTwGx12AVJmwU2EZ7YpVg2AabBNxd+EVDWEcDnMN/bRps2GV5Y4NKJRmrHbII8ywCBnDo0KL7pbujLb0ASsVjQl30+1Erf+2TDsb4F50xIIR+L/Xp57YHyxzctqdGgD2q0bKvPCpjZWVMAtusI+zOLuqJmI02rOFo1mZyru+QT6pQCYNPa3Q7DrsBiE87VqDdRkQDjO23G7Fmf0EGoIpUE3Ea4PCg2KUDZMSkXraLHp4TVmNuyg+md5z5YxfwOEHw1u7vpx5gq4MWsRwlwZB6LIi49hP75xnCqtwT9gHlnz3/FQiu408cLXl4tgvp24uoicrX+eXTgknr0MVTrSVew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J4fK8ycZr52LDtg5ZMoF9ysbb6U2RTCw4jSs7GlOUy4=;
 b=USMqxUnzjxpesICIIsnkEg4LGYBanMJi103QYtumjuEG2PUoEgHIjBBmQx9mrTm21wVEcgRjo4HzQwMGgRNXnm5mxqD6tnAynftbXXJ+DdsYdr9xLejayau6cqf70yHv7fu6yvsWeJPB/rwFhXuX3qSgiQsjHgdQQEREIR1MjSf14zgaSPwKj9mw/s22dlyFvKwKtxw2p/CzPzXigvCq99zMFVt37ncwJwTJLQOzBaDIUnpmDJ0auAwbbF3C8Q9uyEabdpx4yM4L4F/ab2QWcA3xY1f7bjaboT+VsgORiMTU3pcaw3zYe5QxDnlqqnaG3OzZwovwjgFRlMtXzYWGCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J4fK8ycZr52LDtg5ZMoF9ysbb6U2RTCw4jSs7GlOUy4=;
 b=Vx+1BifykEelaiN/Nz+/gj6J31Fre01I1PjieaYzf/GZWf6qcwqZ3eXnH9UtiGwCykmJsBIF6gyTT70nWB8IJm4xswMOSh0eynT9KIfAqSOFlKDPrUg5VyZM1owoOwdtI5O5fWTy0WGje4nxKzj6WztFGU/ocsNXDhZeAxDC/U/zc7ER81iilmCGaZKo9gsxCrPMpQREDm9kGaLnb40DK9GJOBD5bOpLcvffJpJPI0yZ4l4e5okMjS9QZ6n9Ry5tmNRXAZnGKV1G2IOTFn9NTeuygkI9vpGO6gIC7zXHM9QxS6Sm/kQh5jnS6xUqE6rc0IH5PL3fc/1DXBliSSDiSQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2a0f2f07-5d4c-438c-a333-336288206a61@suse.com>
Date: Wed, 22 Nov 2023 10:34:35 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] x86/HVM: introduce hvm_point_entry()
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <08e0708c-17e2-4a5e-aaf7-5f60a40f76db@suse.com>
 <9810305d-4b36-4e23-b807-a7a00f0ba6b6@suse.com>
 <8573291e-9c0b-4be0-a633-05906026c7b6@citrix.com>
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
In-Reply-To: <8573291e-9c0b-4be0-a633-05906026c7b6@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0129.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::16) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB9705:EE_
X-MS-Office365-Filtering-Correlation-Id: 120f403f-c293-41d6-cb82-08dbeb3e3e64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MT9uIBOzrYa8PVlqbcV2H3cwdsgIYjQX108fGpLYN895hCTDu7r1ohqQf5fJ0WxPIG5OZANQNfklBX/ncLWoeXpm9L/KmhtpQooYpHiJHNwXHEEKkC+je1lAldfYQNGEZSqBtbXqew90Vfj3P2EYiApG0wNt9xsEmMqGqnYOMshl0MjSrxQwPzJyU2FbZy6Z+atMCFSW2IW5v9C6n49unl+d5R8ckmjQ6Q7htOOzssXUtjs8T+wP2wfM8Q/tK2lw1IN+Pk59OPjxt7TDijcHmf5AWMq53JNVhexV0+nOwvNX7j4L3gni/U4XooZMTmFdHBAVHr8V0NJ8FDp1FTlLY6FKVgABctPYr0v2vHJbL5N24XZVS4kr8sFG0Kz5TibwTBAuu0uAgmK8PMBso+Nye2J3mC1VJRz7nrv2gBsioLcWy34BjiH5fwd6tcy89j9eX7mOI3aFBq3/ohsJL1bllyAkjRxMd9bxZZ00UL5ySSBjEds04v1Z7MTxd2cdYdc7UazJA9i6hN7uB6XKgsTBZ+liIxn5nWeWkOyjTbVuZuRXvc1hSpKV9BvXEdQDJC3c7z2zFHhRfk8aq7eBmhCkgkqQ9MoTOJC70DnpRtOe2HCrDkDIMYC14Edz8Pule9bIs8P4XGqNaMZ5EW2v4mLBr+tyAmKWLTxbq3T1sPeyBHy2Hk7wwdrOwZ3gOq4h0iztXtR70unpTdUd1bybUaUWYg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(396003)(39860400002)(346002)(136003)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(66899024)(316002)(54906003)(66556008)(6916009)(66476007)(36756003)(6506007)(53546011)(2616005)(6486002)(478600001)(26005)(6512007)(38100700002)(83380400001)(31696002)(66946007)(86362001)(5660300002)(2906002)(31686004)(8936002)(41300700001)(8676002)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TFRDQUtaUVdTOUJkS3YxUEVoZzRGZTlnR3hrckg1SlJ4MitHZUFtdFJFSnhz?=
 =?utf-8?B?VGx6cDVQWmQyNmIrWnMxWUpOc01SMWY5MEgvUVlacUJMNjc4aXFBVUNZcUtJ?=
 =?utf-8?B?aVRYQ2hHS1FkMmMvYXh6MGlHbFlTazVaaFNuTTRtS21POFB5Q2tOMElKMnlq?=
 =?utf-8?B?cnJKeDMvMHpmaVpRYlBsbTF6OWdkdnExSTE5QStFY3ZGcHpLVlp1UXNYcUNG?=
 =?utf-8?B?TThJQmFqa2hFWldDalc2VjZJcWlWb3VlTzRDdU1Rd2czbENyTk10U0dwOENm?=
 =?utf-8?B?WjMrKzgzRUxKOS9jYVVvTFdxcWZ5NUp4UmFMdTR5VFU4ZUxQYUYrTUxtZHU3?=
 =?utf-8?B?NFJ2TEYvRUZLckhnaVA4aS84OXdQN2JjTTNVQ3RNQlJSckh2aWxNWHZJMXdM?=
 =?utf-8?B?Mk9WZ0IwR2dBZTlJOVhhQklkYS9jRjd5ZnR6ZXlMQUdMVVZBRUhNWVk2dVIr?=
 =?utf-8?B?YTlhVjA3WjZaOUhXSEJuZGZ0NkVMYmdUUWJTMFdENEVqV0szbEtWSzQxSVRy?=
 =?utf-8?B?eUFtaUozZlByaXZycmFmMkFad3lmNXd6RVZkYlVaWWVIRXI0SDNDbjVDU3Jk?=
 =?utf-8?B?NWRpSlJYY3pmSXhiMDgxbkZlZ0J2bWppVWtEMktvY1Z1MkhzdjFaL1dWMFBo?=
 =?utf-8?B?dDRjYktEcXlhYkhNVXNISzlpZHlGVmpPL2NtbUhqYzlSaGhTMWNhaUw0NUhX?=
 =?utf-8?B?NUdiQ3VIaVhwUHVtMjBEMlVMZ0E0WXpaQ0ZSdHEwaDJlRHFIYml4TTRnNitp?=
 =?utf-8?B?SURSV21WN3lFQ1hnRjVPSVRrcjdpU1JBdVFEVWFuQm4rdmswYXJHTzJwQ1Uz?=
 =?utf-8?B?dE1zdlM1bElFbGJzSlRhQ0c4QmZnZ3oyTys4bXpmemQvdXNEWFJpZ051NkJ6?=
 =?utf-8?B?OEVRTkp1UjBEUGdpVkw1dms4S05YaVNnYVZpZ016RUFYdVFITjl1TE1rMUFz?=
 =?utf-8?B?QkQrbVhUazlBUUljTENxanpseTJMbHp2WVdpSHpjbndBN0plYU5vQW5WQ0E1?=
 =?utf-8?B?eUdZNHhiNkFhUUFCblAxaW5ycm1STVpkSGxQR0xmOTJ4WVlmUDlZN3JuNzJj?=
 =?utf-8?B?OFJhQnBqVFpoeG5NTjNNYU1DMFN6MTRyODRWRGJkb2Y2SG5zVW5IWWxnSEpj?=
 =?utf-8?B?OXEwUEd0OVJBZjY0cVRtNXVPYnZaT2xUalpXWExTaDRTaitlOHBCOHZ5alF5?=
 =?utf-8?B?STJqU015ZWh0d1RUSEhrbGh1b2w2T0dxWXhBN3BYeUdlbkRyYnNIQ1p6UFNz?=
 =?utf-8?B?OVRmdFhuT2xNYnpCVzZNdmR1UzRlcUpic24ramtpbHVwMHlaZStzVW5pNVAv?=
 =?utf-8?B?ako4Rk01MFFSMVlCQzBaNm5ZNGdUV3NlcFdNT3ZwWjROT3QzR2JJQXphamwy?=
 =?utf-8?B?MitoV3pBR0pwaFNxQWY2Q2puVDdOMHNSV0FqNU5HdldldWdkUGpHbS9jVm9H?=
 =?utf-8?B?OVRSQXJVTnI5dVhOenhLZFFpeSt4YlY3SlVLSDduWXpUb25RYURvQkQ1NzFv?=
 =?utf-8?B?a3FURXQxb2ttSEZoUFZzSEtERnJ6NE9KNXBYVnVod0pRdUNNWWc1ekg3cUln?=
 =?utf-8?B?b2tLcjRMWlh2NEtLNDBPb1ZkOHJXb0s1cCtUbkRHUWQxb3BJVlpncU13MDBx?=
 =?utf-8?B?OElodVBQUlJYbHV6Mzdoem9ZL1NIRURnT3FYcVlHYWJmTFI5TWFhRkZvdGRZ?=
 =?utf-8?B?TFNnRmFxOTJVUStzY2MrQzBTT2NnVWdMOXdEN2R5ZE9BOUlEY2Nsalo3Q2di?=
 =?utf-8?B?d0d0a0p2cTJBa1hXNnMzYzAyU05zNEt3QmMyekNxUWhXcDZqUjU0UkRyYXRj?=
 =?utf-8?B?cjJSV0ZGc2VMOXlVNEY1aXhCeW1pM3c2VDhuQnMycGRpQW80WGk1UlZ4Vzlp?=
 =?utf-8?B?eGkyQ1VHWlZXMGZJeFYrQ0lqN1NYa3pkY0IrM1hOWDVLQUMxQ1Erclh5c0Vz?=
 =?utf-8?B?ZEZ3eUlnNTRCcnFDS2RsWlZjNGlQZjVud0VOTDFFdXZ0VVJ0bGtqeHlJZC9v?=
 =?utf-8?B?VitTcHRlVWVPWGxoRHlpaUMvRnhaL0FMdUJwdXl0S0VNSXNzYmc4SXdGSHlx?=
 =?utf-8?B?a3lYb2U5bFpBRXVqUzVheml1T3hmaW9yeGhOSjhoMG5pcW5UV1ZCTUlyWjlS?=
 =?utf-8?Q?sz/JMG7e7Hpgz5TCwhhpOVWSC?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 120f403f-c293-41d6-cb82-08dbeb3e3e64
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2023 09:34:37.1370
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dZ3AKA0lollzFEjFXDqpF6Lt1XB5Z95YIr+b832q8ActglYSCF1jWZrRaXxYH9+P+zXdEOJlIHi4j1d0aO2cCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9705

On 21.11.2023 22:30, Andrew Cooper wrote:
> On 16/11/2023 1:46 pm, Jan Beulich wrote:
>> ... to accompany hvm_read_entry() when actual copying isn't desirable.
>> This allows to remove open-coded stream accesses from hpet_load(),
>> along with using the helper in hvm_load() itself.
>>
>> Since arch_hvm_load()'s declaration would need changing, and since the
>> function is not used from elsewhere, purge the declaration. With that it
>> makes little sense to keep arch_hvm_save()'s around; convert that
>> function to static then at the same time.
>>
>> In hpet_load() simplify the specific case of error return that's in
>> context anyway: There's no need to hold the lock when only updating a
>> local variable.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks.

> I really do hate all of this logic and most of it wants to live in
> userspace, but this an improvement.
> 
> The only thing I'm a little concerned with is the name. 
> hvm_read_entry() clearly consumes an entry, while hvm_point_entry()
> does, but doesn't obviously convey this at a glance.
> 
> Ideally I'd say that hvm_{get,copy}_entry() would be better nomeclature,
> as both have at least a vague implication of unmarshalling and one
> clearly is making a separate copy.

I'm fine renaming the new one to hvm_get_entry(). For the existing one,
"copy" may be marginally better than "read" / "load", but then it doesn't
indicate direction (i.e. somewhat collides with hvm_{write,load}_entry()).
So I'd want to leave those as they are.

Jan

