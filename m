Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE252C25DE2
	for <lists+xen-devel@lfdr.de>; Fri, 31 Oct 2025 16:38:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1154421.1484434 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vErBv-0003xj-Ga; Fri, 31 Oct 2025 15:37:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1154421.1484434; Fri, 31 Oct 2025 15:37:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vErBv-0003vC-DT; Fri, 31 Oct 2025 15:37:27 +0000
Received: by outflank-mailman (input) for mailman id 1154421;
 Fri, 31 Oct 2025 15:37:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r2XW=5I=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vErBt-0003v6-Fj
 for xen-devel@lists.xenproject.org; Fri, 31 Oct 2025 15:37:25 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7cc0a13c-b66f-11f0-980a-7dc792cee155;
 Fri, 31 Oct 2025 16:37:20 +0100 (CET)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by DU0PR03MB9228.eurprd03.prod.outlook.com (2603:10a6:10:474::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Fri, 31 Oct
 2025 15:37:18 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%3]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 15:37:17 +0000
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
X-Inumbo-ID: 7cc0a13c-b66f-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dB34uLa0wylYsSXnzwuEea7oiw0ibB0lftPRzZ5kl0MSk/3J9l6mX9aFceGRXf3MzxFrOCnGz2LUGBhYrwwOSC4vdi168DcHUhcTPaAh8LcuseY7O27sMQBaqDd3lolsbZVf/9wisQsYlGP+NTonGm8LUTXvAnT7SplrPKtvu/jtyaYZCyt4VGyqo09qI/56Ul9ryX5/VUUeT8fXzS80D+T6JxO4BboX7Yq2eQavjTMM8Em8CI/eHq18jP048KP3RgniAkm0jKKhx7TTv2ZsFdigiPOjxLzk1meVrl+jiURkNkKPCQkUIK9oGQ/A2erRDoNpZMMydaccyuhcEFwGbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jYpG/V3hyL1rFtK/XM294qm1s0OtrnGX6CFA97tMHoU=;
 b=i/AWUXfJpsjc/DmYGTtPVwVkartaQt2Nb85++d1+H94ZyFm1oXb1tW/ARBfAJ7FKXNen/u3LIGbujZnUxlWRvQmj4mveBuWKb0inRbFu7i7ImqULrHkmagnzJpgr6kHQrn19x/YIr395X0OnNhm8UmWm0fOtCxg9UKOGZHeCYb2aK4uvGd1wiGcqqSMgMVpNhA23BSxVGl54iSW1ZYdTi9Bn5/7xbBIh8euoNor0Y0lGXyr90CNq+uF8yPvLNLIk7HMUXWOMoPQCN/aM6l61lTwb2sIPdIG++8REGxjhgPyVgQcuejamEoX3D2b8qcYt7D4+bGaYvKqmwNN7oldxMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jYpG/V3hyL1rFtK/XM294qm1s0OtrnGX6CFA97tMHoU=;
 b=HvQTFWl9eXX2vaBQ0oF+WuygpPJCh+Fv6URGRyjMc8BOTgPPOPLpuSWowVFAk/xJrkor6Rr+uD12ipGOZNwv+tR6ExpxngIN7YYP2axhFazZmjdp1H0gTRK7+vunMF0J65HHiD3oVh349hTUtvvVe+p1Usf37nHVH5ZnZIHPgACCYxyQKK+6dY0LoBEtgUVnnSS+aI9Jw+qHTv2wdo5ntj+lcXxXF6wispPLezC0C4gkYLw3wLPQWJqfR+f98Me6ezno8qwV9sPcCUQo9Si36RE2g6+6ujq6qne08HVVT9hFTvQ8AHP+MHGJq2+ac+OQ/Ib58KhlcO7ykuph3dfj/A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <f74ac4e9-55f9-49ac-b8f6-89ed65dc7090@epam.com>
Date: Fri, 31 Oct 2025 17:37:16 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH v5] x86: make Viridian support optional
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>
References: <20251023151807.560843-1-grygorii_strashko@epam.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <20251023151807.560843-1-grygorii_strashko@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR5P281CA0006.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f2::16) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|DU0PR03MB9228:EE_
X-MS-Office365-Filtering-Correlation-Id: 07f9fae4-c23a-4901-fe49-08de18935fa6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VlhuMHp5SDZaZ2xiSjBwZDNNbkhuRGRWVkk1ekhEQzFkaHlaYkhjeWd0U2NN?=
 =?utf-8?B?Snc5QUJ5ZmpsdUtyQm9EdjAranI5UHcvK1ZWNURZOG5GZXA5SFNCUzNFOXRs?=
 =?utf-8?B?U1VvNmRaMWJBQkh3Q0RXbmlhT3A1UVRZc3FNZThmblhJc244cGpLOGZOSlFD?=
 =?utf-8?B?KzU5TzBwNkNVSVg5Lys2NEpHSXRNNkkyM3ExUW1YdmpnVDBHL1V5R1lyZVZL?=
 =?utf-8?B?ZmpDbHhuQklTREJoU0VYYm15YXFHVE5Yeit5MXBMRDE5VWk0bWFta3JZUkNZ?=
 =?utf-8?B?cXlXY2JJY0xqUmdGQVhuWk4yNkVodzRxWmF2RlkwN0R4UDFOSlB3Qk5WZmZu?=
 =?utf-8?B?R2hvaEd5cWZ3YjgzNXBhYnNtcjJyL001eGFicnVPUWkxQi9sTjF0OS83d2RL?=
 =?utf-8?B?aytMNVRHdkc3SHRPMnFYWTZkSDlkZ3lVTlhkbHF4VklnNEgzYUlzK3M0U2d2?=
 =?utf-8?B?R2tWcTJqR21JTWw3dnEzd05HdFlIeHR4QzNlaFBmYkM0MHdTM2hzN243SkE1?=
 =?utf-8?B?Sk01TDNRVVlqMThHaTdMSVc3Z2hWS0RWMFJMS2g0SGJuamUwSGptb0gzMDRO?=
 =?utf-8?B?dENMWEZCb25ienB6L1pURUF5VTYvSGt4cVNIdno5K1lHcE5OV1RFKzhCYkZo?=
 =?utf-8?B?ZG1pL2lsdEkzbUlBRFliTGJsRGFuSEJjOTJJblhCWU5HUGEwU1pXRGxXa0dl?=
 =?utf-8?B?Z2dOYVQrWlRDUys4Zm92SnNnMHRHUTNPNXB0L0gwaGpZc3BOQTJTeWNaUFF5?=
 =?utf-8?B?NXJSeTMvcE5ZU09aNGUweGdIT3B1cFc5MU14THI4Rjd3MEtDQ0tDTC9ERCtE?=
 =?utf-8?B?UUNrdTlvM3FaV2NybTF4bGJrblphWVJSSE5XWjMvSWVuT0I4bHgrUWF3UzZX?=
 =?utf-8?B?Q3NwWDZ1a0ZWMXFGbTFYWTFqaWNnM2c4WjM0LzhHRFQxeGRPSHIyU21yK1po?=
 =?utf-8?B?UDI4OXNZWGd3Z1BiazZvbFJyTkNNL3FWdEFnOVpsTEJiTVhRNUpYTkd5S2hV?=
 =?utf-8?B?NkU1Rlk1NGlFakZUVzV2bWFCUWZGWDc2SmFpUVdQY1VMeTdsOWRwcVZubmQ4?=
 =?utf-8?B?UGF0SDEza2p3UGM1cklFTGlNd3N6UzFlTS95alB4eVNnL0c3M204d2Z0WmMw?=
 =?utf-8?B?TjZjd2NRUDk3RGw5N2VxUWl5Smh2Mkdrc1FVQzhBRTF3MVhlT1NneG53TDZD?=
 =?utf-8?B?YXR4MjlJWlRRbWZXOXRPUXVta2RiQTRUeVVCY2lSUnNWVGk5WW1jWnplekdl?=
 =?utf-8?B?ZWtQK01ZYXp3b2RUQzlaVWFTai9oVlhBSWN2ZHluYWN4NDMrTDRWd0dCSDFo?=
 =?utf-8?B?djArZkdUMmtPcURGOFZsYU42bFpVNkhnS1U3ZXRiTGZNYzBuSVhEaEpPOGN3?=
 =?utf-8?B?MDhrN1U4NE9BbWhIVkJwcW9NZ2g3RllZM3l0eWhCbkVqblJncis5dldMR3o2?=
 =?utf-8?B?VnR3TnZZY1JpMnZpUWt1bVBrKzZydWROdmtMTXVGYkUwYlFVd0RYVlJwRWNM?=
 =?utf-8?B?QjRPYzdnTDJDREhMZ3FDazRqdldsdFBwdncwR3Y1T0ovajkzZXVMRUhVZWFq?=
 =?utf-8?B?NDNJYU9wWDdsSUtYUFdacmhkSFAzcmpRMmtpZFgxWkNRU3hhWGdoZlhQd3hN?=
 =?utf-8?B?ZC9lbnBDckh1WjR0SUEvZHlnOXlBVWRiZVFtTUtjVS9yVm5Nb1ZwWC9hREhK?=
 =?utf-8?B?SElrTEdDRE1iWmxSOHY1MWNSYkQySVpkR1BmUEJvaGFZTnViaE8wOTNWSXpP?=
 =?utf-8?B?SGhabUg1ZjI5KzZsektUUjNqNVlOc2Y4QUFoMEwzaWFsSWpONWpHdEdxSmkz?=
 =?utf-8?B?elBERTE5eHBxQngxcFF3M2RwSnZ0WVZZQy9lS2tleHUvZWJkb09HNzRIbkdZ?=
 =?utf-8?B?SkZOcnQvMC9GN2dWYVpMVkFsYmJQWFRnNm55ZExaOW5YM0hYRW5XR092czVU?=
 =?utf-8?Q?gp+ULhKd3t8qvQXwgL3H0N2G6JtGqkRo?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dnFIdmMyZHJFWjhmc2VkZHFCMVFwY29YY0pJeDY2Um5kQ3ZwZXV0SkNnQmtR?=
 =?utf-8?B?M2VwN2VCQ3hXZ2pXdHowUXczWVk3MERNTkhyUGZma3Qxd1FEZ25aa1RlRnZh?=
 =?utf-8?B?QUVuRkdXTUhXSTdESDUzSHdXOFJ1Wk96ak84VDNMME95eThFRFcycitZOWJE?=
 =?utf-8?B?Q0ZmcFNORGR6UjV1ZWJKUENvTkt0UnI2a0Z5eW1MN3BIL0E3UnhrSm9rcHBp?=
 =?utf-8?B?K05ybHpaRE5NQXN4RkdraFk1VE91SU11N0VPZ0JQSWpmSjBqdkRqbUV0R0dE?=
 =?utf-8?B?cFVUaUUzV3gzc3I5V1RoL25JRTBpbUljN25leGg2KzZiMzRoS2EvckFJRXdN?=
 =?utf-8?B?MXlmUmJDOGYva3R3MGZ6Q2VDbHVtVzVYWWR0OUlBWm1OWXNiODh2NHIwZStw?=
 =?utf-8?B?Q0F5QldIWEwxcTJCT2xNcTNGRDI0aUwxS1VVZldBclZqN2RsQm16THlYYkNK?=
 =?utf-8?B?Y2cveXFxUnpDdVRGMHhBNld4RkpreloyQ0xwVm1vYWVRNUVaUWl6V2gwUy9w?=
 =?utf-8?B?Y0RPZkNpMlBMa0x5akhsZW8rVHFkQTBVY3RSRVdMWmJCTWhtYm9iRXZZdnFP?=
 =?utf-8?B?TTljck9tT0NiT3ptNDBoYW1JOGRRRG1XbXp4TnRMVTdxQXpCYTVMWlNKdXhL?=
 =?utf-8?B?NFpnWmRKUzNlRnk4Nkxna0RZYnN4QzZld2U5L0NEMnB1TWVybnlrSFFITmF3?=
 =?utf-8?B?VlRnQm9jNUNwNDl1SjRhUWZ1azhFSGhvZFNsNUZ2QzJhZUlRZFNNcWRPR2sr?=
 =?utf-8?B?ajVHbkNncUMxV1FXSitDTUtJMU92MjBmRmNxb3FlMzBYdkxuaTNSRnRaakRK?=
 =?utf-8?B?MFdzWUdLUmU4MTZ2RU1CZnRWbmFNS01FWXVtN3l3VHg1UlBueFVDQkt5V3Zp?=
 =?utf-8?B?OW5Ra1A4YllmY1lvZjhnVDEwNXhxNXI3bzNVblR6c2RKVjhzWTgwai9aYXdH?=
 =?utf-8?B?MVlRZXFMdWlvZEF2YUNLTnNuR1ZJVE9GNzhMaDdpWCtFR1NtRlpjR1BTTHk2?=
 =?utf-8?B?SkMrOTZPcGVNMCtITHhZd0VwT3JTYzlZamlJWGdGUU9vandxN01nb0hCZ3Yz?=
 =?utf-8?B?N2lMKzFpQkd1NU56Y0N2Mk9xTXNFRjFWNlRMbzBEMmh4QWdJMXNDTDlJMTlr?=
 =?utf-8?B?T3VGbXdSVXVmRnh2WjU2Q2hUSUNlMWZoNS92dElvU1YxWkp3SzZEV21MTXlB?=
 =?utf-8?B?WGpXTERtZTduWGY0M3dGNDU4Slk2ekFGMVR6Z08wNnViTWlkUFl4eTZMUCt0?=
 =?utf-8?B?eDlQN2gxQ3dINTVLSkV6UHYxSXEzZFJsZVhzTyt3SE52SytyeGVCUTZLdXJM?=
 =?utf-8?B?NUZDa1BUNm5jNzR3OHM3dDhYWERCWWMyVU9paS9kZXVpZUUxclQwS0VkWG1k?=
 =?utf-8?B?THJMbzFWTGdUaTRBUVJ1NFlwemJGQW8yd3AxQ3hwai9DQTA2TUgrNHFoOHdY?=
 =?utf-8?B?clRrdXE1Z20rRWxUMyszeDAzS2FGTXJaYnMvakljWHNNSGZMWER4OHlKMWUy?=
 =?utf-8?B?MzhiWUJ4RHIxYWRNZ0NrcXF2SWJtVytzdEZpcERUT3lQZXFnSkRyUE5aK3Vo?=
 =?utf-8?B?d0hvWVRQNkl3N1U0dVRHYUJZUThPdVVYN3pqQnpGaG4wS2puYndKdDB2R0Zk?=
 =?utf-8?B?YmRDZGMreWZLYWtHaDRidE5BWG01NFZCb0dtNW0wZGw1d1QwSmxkYWpvRUtj?=
 =?utf-8?B?ZDhUUEVUMDVSdFZIOW5OcmdwWkpnYWRnVnZWNDNQVjN0TnhtcnFJMTdxVXd1?=
 =?utf-8?B?QWxha1lNV3kzYmg4cDFZeFBIcDM0ZHBJTWhTaTc1YUFVY3JsdzRId3VZNTVN?=
 =?utf-8?B?MlRtTjlwQTF6VHdteVpVL0dOTzlXemhwUFpsT25mT2ZlLzhjemdEZHVWLzdR?=
 =?utf-8?B?aUxXOWQyS3NOZGN1dS9XRjFXTCtRbG1OZnFMR0dmTytta29UVVJwS0VLNlJk?=
 =?utf-8?B?UDFseVNZWTV2VzVIcllvV3NvaTFYanpRcjRpQXgwalh5OTJwQVJxMnNEMEZo?=
 =?utf-8?B?RGNDU2Y5dlRwR2hEaXY2d0tXeFF2V1EzSytGdjJFejc1OGEwRVhuUmJ2cHh0?=
 =?utf-8?B?aksvQVdLTGUvVk1zeUkveTBGeVdZRVhVbGRJSHlPaWFMWGg0S2VKSXIyemhH?=
 =?utf-8?B?QnhURFNpQXNRbVRNVld5VlZQTTBIYkxTYWlqRVNjLzZ2a05wcUl3Y1hzKzU3?=
 =?utf-8?B?Y3c9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07f9fae4-c23a-4901-fe49-08de18935fa6
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 15:37:17.8667
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oYhLoF73Ua/PUq+yrsTnsTY7Q6M4mPJjJGSQ6rBqENFhrq9kvu36cCU80RT8AoH02gHj8xsnK2ngjc0z+Gn/+IZUzxf8JNd2Hzm3yqDhfCw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB9228

Hi

It's actually v6, sorry.

On 23.10.25 18:18, Grygorii Strashko wrote:
> From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
> 
> Add config option VIRIDIAN that covers viridian code within HVM.
> Calls to viridian functions guarded by is_viridian_domain() and related macros.
> Having this option may be beneficial by reducing code footprint for systems
> that are not using Hyper-V.
> 
> [grygorii_strashko@epam.com: fixed NULL pointer deref in
> viridian_save_domain_ctxt(); stub viridian_vcpu/domain_init/deinit()]
> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
> ---
> changes in v6:
> - add stubs for viridian_vcpu/domain_init/deinit()
> - update Kconfig description
> - make set(HVM_PARAM_VIRIDIAN) return -ENODEV
>    if (!IS_ENABLED(CONFIG_VIRIDIAN) && value)
> 
> changes in v5:
> - drop "depends on AMD_SVM || INTEL_VMX"
> - return -EILSEQ from viridian_load_x() if !VIRIDIAN
> 
> changes in v4:
> - s/HVM_VIRIDIAN/VIRIDIAN
> - add "depends on AMD_SVM || INTEL_VMX"
> - add guard !is_viridian_vcpu() checks in viridian_load_vcpu_ctxt/viridian_load_domain_ctxt
> 
> changes in v3:
> - fixed NULL pointer deref in viridian_save_domain_ctxt() reported for v2,
>    which caused v2 revert by commit 1fffcf10cd71 ("Revert "x86: make Viridian
>    support optional"")
> 

[...]

Best regards,
-grygorii


