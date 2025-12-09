Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2472ACAFE98
	for <lists+xen-devel@lfdr.de>; Tue, 09 Dec 2025 13:25:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1181578.1504605 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSwm0-0007Od-Vn; Tue, 09 Dec 2025 12:24:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1181578.1504605; Tue, 09 Dec 2025 12:24:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSwm0-0007Mn-Rz; Tue, 09 Dec 2025 12:24:56 +0000
Received: by outflank-mailman (input) for mailman id 1181578;
 Tue, 09 Dec 2025 12:24:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I/6M=6P=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vSwm0-0007D7-4h
 for xen-devel@lists.xenproject.org; Tue, 09 Dec 2025 12:24:56 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 115ec780-d4fa-11f0-b15b-2bf370ae4941;
 Tue, 09 Dec 2025 13:24:54 +0100 (CET)
Received: from AM0PR03MB4594.eurprd03.prod.outlook.com (2603:10a6:208:c8::27)
 by PA4PR03MB8221.eurprd03.prod.outlook.com (2603:10a6:102:26b::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Tue, 9 Dec
 2025 12:24:52 +0000
Received: from AM0PR03MB4594.eurprd03.prod.outlook.com
 ([fe80::5a:31d6:fee4:ccae]) by AM0PR03MB4594.eurprd03.prod.outlook.com
 ([fe80::5a:31d6:fee4:ccae%6]) with mapi id 15.20.9388.013; Tue, 9 Dec 2025
 12:24:51 +0000
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
X-Inumbo-ID: 115ec780-d4fa-11f0-b15b-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VcPlT1apnxENTtAQsQtfaNXxqDnMnxGDo28xgWmr6wiViWMBvbLDtxuL25UtVbMzYx7hjIV2oefiKqRhLE85vmanLhj2bfzsRx94BAL+eUME1zCP3V24VmobjsYNvrEGTWTFEiv4iE8dnZNnFdmImu77u8ypW/jmpPnGQFuyIxvC5GK1zAVN3fvd/rPhB/PlCyUjKfGEQIA3Fm/CRE3ivYX5lM9fmBLFIct8PiSbsfxcvwhFnQLbeZpvJbXPQBTNtzHVbRht+z1EfvTslkwYbM8FhYByM2LLoujyILLeTA5TSOmuGGY9oVOcL1oZdj+O0UM+Fhzg+UZL57HC/dt9HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3cbQYfqNMkTWZznW/h+Ici5/kgpXubEoFtnD85axcvI=;
 b=h5kLFF6jh3agVA9iUpqK21KxTdQm4q9QfJ5raPcuCKswWQR4FzjqAs8B4L7qNy8XP86c7cf1IWZz6lB45Z7CQgVQP7vLfreN8LqM+p0EJXFpPqB7BhJAnax9C/xsy9hSavssb4e10jspdrJVGe7KfP0aoBo2slI4xvBuUHFOimFa427aCSx7KWh3CIOk2lsTqobjtBF06LAfOxudP6Fdmix1wWF+5B3wcFEoQTcjvobxjc+WRRHWbZaY0TIBPaqpg3DPH/9wRyZJRxKUDwoQdgJv6eyzS1QoC53aedRUW1mLlEQ8DUE9JFDk3/PdJCyKu78TIawKQR6A+cqeGz9emA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3cbQYfqNMkTWZznW/h+Ici5/kgpXubEoFtnD85axcvI=;
 b=Rso9GVzbuvoQOX37GgBE/NEwVq0WlJ5a5OdpI3NnZ5DODZZmRo9LjYEzVzjgnLzdxP41Ax7ssFbioewQtLP+0GwXkGtB3SIiP94BhCm1sZPgIXN/EwwJzsOQz7tBwQ96+0ol1zOe/KqtnpEgXG741buFjYl1Xp1KJOyBIrrYMw/auaP/HD4ZUGZJ7Y/D8vZoEzTgu8ul8FRLmHDYUiShF7uRTmaZUIlw2+rCRa4ENCEFUZvPyqUjBpEQJEufP/wbA2zUcW9Ajw2PmjcYnqgg6hXmz3kI2wmuIaGVrOeKhlqnK1Ouan6m0le516FUTl/6EVDUiSiJVEfcoNECJFN8iw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <f0da7ce3-1846-4865-8e66-bc3e50f78390@epam.com>
Date: Tue, 9 Dec 2025 14:24:35 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] xen/x86: move d->arch.physaddr_bitsize field
 handling to pv32
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20251128152218.3886583-1-grygorii_strashko@epam.com>
 <20251128152218.3886583-4-grygorii_strashko@epam.com>
 <c9ee4fc8-44c6-43e8-88eb-9041c51aed16@suse.com>
 <d025e3dd-ba2a-4a9d-af37-37570e690aee@epam.com>
 <a3dcfce1-4695-4064-a1e3-af09bfa04199@suse.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <a3dcfce1-4695-4064-a1e3-af09bfa04199@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: WA2P291CA0024.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::15) To AM0PR03MB4594.eurprd03.prod.outlook.com
 (2603:10a6:208:c8::27)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR03MB4594:EE_|PA4PR03MB8221:EE_
X-MS-Office365-Filtering-Correlation-Id: 7437f7f4-2050-4641-70a8-08de371defca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QjErNFFWVlhnZjBNUmRRbDdsOWxjWDErY0Fya2VLcFVqN3h2S0ZBaXBZenVL?=
 =?utf-8?B?NWZ3MjhUazlHaXdwb201MGR3TllsSDYybkIyOG1iVDFMNzljTnVhcFI5cHZ4?=
 =?utf-8?B?MkdkU3MrUVRITFp4YmlWSUNWaUpubHZxTlArSWlEd3psWi9NOVJsclpTNXFZ?=
 =?utf-8?B?dzhpRGdHMEg1TGtXcFRoem40dW5oSkhHV0NWR3B2Nlg1UU9IUG93U2FXSU1H?=
 =?utf-8?B?TXg3SG1MNG05RDVpMWtzRitxQ3pGV0VWdElOdHNIck1ReUtNT1g4aW5WdVdS?=
 =?utf-8?B?a2FuTFpMb1ZZVkFMMXF1QW0yOWdyVG5QQ3VsNHFNWExlMThXazNBaG1abXFE?=
 =?utf-8?B?WlRjTzFNQjRrRHBSK3ZYTStTM29uSmM4M1Riak1ybzUza2V2TzlMQ21ma21N?=
 =?utf-8?B?d2wwWVRHWU93bGw4Tk9sSkNkd256RjF6NkFhbDhIU1RIeFFWUDhLVHBDbEpS?=
 =?utf-8?B?REJOTmdmNlFVbEJhdG9BYTlkYnFuaTM3UlRCVEtILzNZL3p6TDlkVi9sdEtq?=
 =?utf-8?B?MktjL3NKZjZSbERHdXUyYk9YR3h0N3FKWWVlMzJUVWtVaHhDN2tQSzFtTXJ3?=
 =?utf-8?B?K2ZvdUFidHJPT29nOGZCVmRKUmxnaEhRWG5CZnJDMVcraitQNld5Z3FGSFVl?=
 =?utf-8?B?NlllWGozUmhrSHFGenJhTlpERng4MWovclBuQUxuWk9hRVBsZ1NRU0oyblNB?=
 =?utf-8?B?QmQ4SFB0OFJHcTRDZXk1V2xVZG1ybDRPRjRtSzk4djF5MlJtbnZhTDUwdUxN?=
 =?utf-8?B?SG55aHNxRkM2eUxTSXNjS0h2MFNJd3JueDNLZzlOSTZMNnRTV2o0dlBMWWdY?=
 =?utf-8?B?cmdMbWJkVnRYeVI5d1ZNclJ4QjFEcDFBL2t4ZXM4R3FoVjk1eXoyRUphOTlV?=
 =?utf-8?B?UjB5aDUreVI2R21SMXJWdktwMEVHeGlWY2E0Unk3TnRuRFluSkNtaDJvYmVV?=
 =?utf-8?B?QVI2SXZDQ254RitVaUVDeWxLSm9hUXA1eUJSbWQxSy9ZTGU5ZzNZd0d2MlpU?=
 =?utf-8?B?N3lnY0F5bndZcjFyTmVZUUtsQnFSVmdZcEM0SGxRS0JZNXc3Sm41M1lxdU03?=
 =?utf-8?B?MU1IWnBVQ1A5WGppb2s0OUkzc3plRmFUZnF0VGZtSjJncjVQTEN0WE5OdHhI?=
 =?utf-8?B?VlhKTytTa2R5U09OR0JKdjV1RUFxK0R0Smw5RDEyTW5lMHVTMmExbVYxaFNM?=
 =?utf-8?B?cjg2RGlxR2V0bGp5YldJbmJVa2F6dklURThRZUVUV3pIR1l4WmtiRnRMTUFT?=
 =?utf-8?B?YmtXWVhvSWp2TkgySDQ5YTFzN1hVR3FWYk9NWUtNS204Kytkb2Q5NitrYlcx?=
 =?utf-8?B?TkJuYXNzbHo5dkZRZ24ySG1jRHhLUXlWWm5HMThoaW9oMmUvcnI3K0RjNENi?=
 =?utf-8?B?dVVoVkpLanVFYWJ2eHF4QzZGcGYvWnlYMGhiUmZXTEpDRWF2TjNJT0twZnBR?=
 =?utf-8?B?YS9KMVQ5Mjl3ODdnRnhrandQL3RMMjJRMUI0YURiV3Fiby9mTUJsQytPZFZm?=
 =?utf-8?B?cmlnYzJuSE12T3lxdU9wcTZ0a202QVZ0V1F2SStTQWF6NEI1YmdOMWZzbHBB?=
 =?utf-8?B?Uy9UVHRFclJRQTljb3h1RnY3SEZuUXQvdnJTcndpaldpdFJHcVRYWTVlcllR?=
 =?utf-8?B?QkhrQjhvSVpqSDJQclY2L1lERXFOdGNHeEdObWVpQzFCeUd4Tlh4RlBwQXoy?=
 =?utf-8?B?aUpjc0dMcEZKOVRqRHFTQW91NEcrOG1VSUpkaHgzRDBxSExvQVROMExrMTNI?=
 =?utf-8?B?NFhYZ1hNVGZoMlZZd3prSXo2TnB0Qm1XeXluWkc3ZFArb0JrV0FMalZNRUZR?=
 =?utf-8?B?dTdHYjg3WElGc2RkTTNLR2ZFM21mL1Z0cGwyTzN0ZmZUWGhtSWJGVjZzcHdz?=
 =?utf-8?B?OVhORHhSdnJvQ2w2eGZCdmczMVBaQWRNejRQNXJJZkM1YlQ1TmUzM0RFU0xK?=
 =?utf-8?Q?oRj7nHz5J9OgqjaP3qy7CS4U65K+JreS?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB4594.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N2ptZ3NSZE93NXhVajhYSUs5Z0x6cVZHKzZVditLUzd5VHFZTTQzbWJzZXJF?=
 =?utf-8?B?ZUVLZnM1a2dEQUJ0cWlabGU2WGNYSzdJME14SFRJNEhyVXp6SEg5QXBEcmZh?=
 =?utf-8?B?R2s1ZkZPYjUvS28vN2R6MzVSdGVEVHhwSDAwYVNlalJPWmdJam41UlQyWi9C?=
 =?utf-8?B?RG9XVWVaZFFKK2ZGMWwrVlFOY3daL2FZeXMvWTU1WVJWNmRkTUtBdE40eWMx?=
 =?utf-8?B?VjRneWVPVWNZVUF2VUFXUW1qNEloVHZXdVd5VWtmTGpaQnBiMVQwT21QRitk?=
 =?utf-8?B?QjJSdml1c2tER0NjUS9Oc1hZcmx5a2doOGNmZk9aK0ZRWHFQUzlkZ0plYThT?=
 =?utf-8?B?Y0VSVm1SK3hTeHFCU1BVekl1eVp5dWJQSSt3cnN5dXcycGNDY09QdjYwNmg4?=
 =?utf-8?B?QWpvNkJYa1FLK0hiZEZTU2pTRURaanY0L2tQQlk4bVZ3N3NFVVBWR3Y2YkRM?=
 =?utf-8?B?ZVA4TzBrMmI2TGxkODd5dVIvZHNXcTFlakhkRndZNmNBWWxaYmhpa2RmZWJE?=
 =?utf-8?B?VU1nOWFZb1hFbkNXMXZpZ0xkcFg1dFNPWW1ic2JYZHJBellKOXEzeGtFbnBs?=
 =?utf-8?B?R25WRUZudnVpeVFlVk5FdFNTYzJTN3VlaCtwY3hSaVJrUVAzRG11eHFjM3dt?=
 =?utf-8?B?c0k0UThUWk1sVFZ0NEJETW5CZkkzNEg1QytRbGtwWjhSYjU1dUsxMUtqZmhR?=
 =?utf-8?B?bk9WUTh4MnVqM0V3aUJPdStiMXRwMFR0Y2dneVpiTm1UdzZXSFJXZU5Qc1Vx?=
 =?utf-8?B?UUV6MHpDN0pPV0Fsb2tYYURHVUpNdk9zYStSQlphdG10KzRKNzFZNWZ6c2Jx?=
 =?utf-8?B?Q2JVSzBTR0w4WDhYcloxazFtSmlmVXpqOUp4WWxqZERnbkJXcXYyWDVwRHFm?=
 =?utf-8?B?ZEc5UUpBdnY3NTB3ZGlmRWNrTXpKVGNoakpkV0VQeXV3M0Uxck96MEZyVU5p?=
 =?utf-8?B?Mm5JUG9lZ2J5Qjgya3Q4TjJEK3Z4WU1QVVN1T2xPcVp3M0s0d3lEemo5MkxG?=
 =?utf-8?B?T3hTTnFlSnhXSTAvUVFpNnFVQmVNdi9LM1dVOFlueFlLRlFKMXZTYjRLMWNw?=
 =?utf-8?B?MGIweWttbVlrR2VDMGwyUXptTkk2N3dnRG9wS016MVR4Wkh3NzRJV2dGcURz?=
 =?utf-8?B?VSs1dldWZEI5QjRXZVVDMnBORUxOTFBodFg3Tys3R2RUck1jTm5zdGtXUXhj?=
 =?utf-8?B?azgrYnNWeVgwYzlNWHJRM1NrQ3A5d1I1TFd3ZnM4YVliK0RaTG5JdmYzL1hM?=
 =?utf-8?B?c1lpTHorK1duYXk1dkZvdEovS3BUeGJjM3pqbjRiVDY0c09uSzR0dzJodHpT?=
 =?utf-8?B?R0dKTWo3T1o2WXVlU1ZwNThLMlhLaXYwQW11SG1tOGUvRXgrK2oyL1BIaDNG?=
 =?utf-8?B?S0pJVVR6ajVZV29NSHllS2s1QWlxbjFTSWVCVzI5cERia09wbVFFa2ZRVVly?=
 =?utf-8?B?MVVCR3c5Qnd3dXVXR2VxOFVVS20zSStVNys2alIrUlphUi9xSEhkWFpUWXh2?=
 =?utf-8?B?K0dUL1YrdlZ1RnVoTXkzZEFhS1FsUXdxbC9VT2hQSVlJZTdjVEpjUkU5dzla?=
 =?utf-8?B?M0xpamliRTFKUWd2L2JyNS96WTZhRklTTlRaRVJnWXo1R1RYb1MxYUxZSS9Z?=
 =?utf-8?B?Q1ZzOWZERmNXaUN6MEQ4bUdSbWxvZmh0Tyt1V1dPOVlmTnU5bDE3UFBNSEdm?=
 =?utf-8?B?UWxTT2F1bVE2SGNWRU5QTjREZlFGMkNtOUNTZU9ERk0wVkdUajhIWXErUm1k?=
 =?utf-8?B?QWhHRTU5NndkZWVnV2RrOXRGbHBFYm5scVJ3STF6R0dXb0pLVmRUd3FHdy82?=
 =?utf-8?B?dUtheEh1Rk1Vb0RHMkJqeWsxRUFnWlkwZzI5ZjVrd0s0RDhwWFljYWE1V2pR?=
 =?utf-8?B?cTJ1eWNzVGhBS1l3aFdxR0VDSDdEcUZyZStjRkZSQ0pqN1I5Zy9iNGhldWQ3?=
 =?utf-8?B?Q0t4eXVNOCtiZUl1cmZyVFpOSWFSaXR1VGo1cmJGYXAxQStXRDVmZ0FhdzIv?=
 =?utf-8?B?cW5GeFVQNitZa2RKMnpEV3VYcTVxTjNkU29ETmZtK1d2L2ZYS2VmcTNaZnVz?=
 =?utf-8?B?Z0loL1RuTnFtWnlZMUs5WGk5M010WEdIRGZ5YXBiNHJ4SnBTcFZCTkpxODlD?=
 =?utf-8?B?NWRFMkRQOHNza0pjZHJkMEJHQk4zeGtManNnL1JRaU5Cd0I5aGdDMm9sanJa?=
 =?utf-8?B?Vnc9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7437f7f4-2050-4641-70a8-08de371defca
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB4594.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 12:24:48.9456
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ig/nO/xKUJzKI8jpV4WYBKeSX1Jbe6d366dWLzQ3/NGxC7YHRZOB0aKt9OQS/zHe29CYCMTA3WuwmDsYsvAztjj3cRUHW+bwqMZ6qbTe7mQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB8221



On 09.12.25 10:59, Jan Beulich wrote:
> On 08.12.2025 20:21, Grygorii Strashko wrote:
>> On 08.12.25 14:44, Jan Beulich wrote:
>>> On 28.11.2025 16:22, Grygorii Strashko wrote:
>>>> --- a/xen/arch/x86/pv/domain.c
>>>> +++ b/xen/arch/x86/pv/domain.c
>>>> @@ -254,7 +254,11 @@ int switch_compat(struct domain *d)
>>>>                goto undo_and_fail;
>>>>        }
>>>>    
>>>> -    domain_set_alloc_bitsize(d);
>>>> +    if ( MACH2PHYS_COMPAT_NR_ENTRIES(d) < max_page )
>>>
>>> You mention the change in condition in the revlog (but not in the description),
>>
>> The updated chunk was based on snippet from Andrew [1], which
>> used incorrect condition - I've changed it and noted in change log
>>
>> [1] https://patchwork.kernel.org/comment/26680551/
>>
>>> and I'm having trouble to follow why ...
>>>
>>>> --- a/xen/arch/x86/x86_64/mm.c
>>>> +++ b/xen/arch/x86/x86_64/mm.c
>>>> @@ -1119,26 +1119,6 @@ unmap:
>>>>        return ret;
>>>>    }
>>>>    
>>>> -void domain_set_alloc_bitsize(struct domain *d)
>>>> -{
>>
>> The domain_set_alloc_bitsize() inlined in  switch_compat() and x86 PV domain
>> always created as 64bit domain.
>>
>> At the beginning of switch_compat() there is:
>>
>>    ( is_pv_32bit_domain(d) )
>>           return 0;
>> [2]
>> above ensures that switch_compat() can be actually called only once (at least it can reach
>> point [2] only once, because there is no way to reset PV domain state 32bit->64bit
>>
>> this is original condition which says:
>>>> -    if ( !is_pv_32bit_domain(d) ||
>>
>> do nothing if !is_pv_32bit_domain(d)
>>    - for inlined code is_pv_32bit_domain(d) == true, so is_pv_32bit_domain(d) can be ignored
>>
>>>> -         (MACH2PHYS_COMPAT_NR_ENTRIES(d) >= max_page) ||
>>
>> do nothing if (MACH2PHYS_COMPAT_NR_ENTRIES(d) >= max_page)
>>     - inlinded code should proceed if this condition is opposite
>>       (MACH2PHYS_COMPAT_NR_ENTRIES(d) < max_page)
>>
>>>> -         d->arch.physaddr_bitsize > 0 )
>>
>> do nothing if d->arch.physaddr_bitsize > 0 (already set)
>>     - inlined code will be executed only once, so (d->arch.physaddr_bitsize ==/!= 0)
>>       can be ignored
> 
> This is the crucial point: It being executed only once isn't spelled out
> anywhere in the description, and it's not entirely obvious why that would
> be. Yes, nowadays it is. Originally (iirc) one could switch the guest back
> to 64-bit mode, then again to 32-bit.

I'll update description.

Or can add it back as !d->arch.physaddr_bitsize to be safe and avoid
confusions?

> 
>>> ... this 3rd part is going away.
>>
>> Another observation: MACH2PHYS_COMPAT_NR_ENTRIES(d) is looks like a const, as
>> (d)->arch.hv_compat_vstart is always 0.
>>
>> grep -rw hv_compat_vstart ./*
>> ./arch/x86/include/asm/config.h:#define HYPERVISOR_COMPAT_VIRT_START(d) ((d)->arch.hv_compat_vstart)
>> ./arch/x86/include/asm/domain.h:    unsigned int hv_compat_vstart;
> 
> This observation isn't directly related here, is it?

Yep. Just found it while investigated.

-- 
Best regards,
-grygorii


