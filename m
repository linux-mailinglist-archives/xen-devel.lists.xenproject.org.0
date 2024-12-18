Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 645CA9F622D
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2024 10:53:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.860051.1272113 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNqjE-0001KW-Sf; Wed, 18 Dec 2024 09:52:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 860051.1272113; Wed, 18 Dec 2024 09:52:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNqjE-0001IG-Q0; Wed, 18 Dec 2024 09:52:28 +0000
Received: by outflank-mailman (input) for mailman id 860051;
 Wed, 18 Dec 2024 09:52:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7TrB=TL=epam.com=Sergiy_Kibrik@srs-se1.protection.inumbo.net>)
 id 1tNqjD-0001IA-LR
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2024 09:52:27 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170110001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c953ec6c-bd25-11ef-a0d6-8be0dac302b0;
 Wed, 18 Dec 2024 10:52:26 +0100 (CET)
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com (2603:10a6:20b:5c0::11)
 by GV1PR03MB8109.eurprd03.prod.outlook.com (2603:10a6:150:20::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.22; Wed, 18 Dec
 2024 09:52:23 +0000
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d]) by AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d%4]) with mapi id 15.20.8251.008; Wed, 18 Dec 2024
 09:52:23 +0000
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
X-Inumbo-ID: c953ec6c-bd25-11ef-a0d6-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=diKTDfMeiy8rqRgVT7q3cAAJp3EsaATU9GJci2GzwiCGL0rVwbsi3y9fFzhzvNOSs2/5Tr2KrbP0JrWwSq8rti5+8HFCYjsGHAztwhnufwS7x5woFvfeF32nmWwK7ev2IcjW+SJgRrI8K4me/dKiJLgCMqwc6+h9HegK2YqFynsRQqmE3+yaXrjOY6VShplKwhxht3qxp1TEJ1X8hQiqRvvObEdf1XPYoc9afi6Yb8wHwav8vuW9u/yF86n/IYoVZ3/etRSseWE/ZpJq7YvpQZR96kGtNyLVDifEXwt5TKRCYgBqEo3xtfoP30TwpKM7gNArcuf8hvhjvpY4mY8gDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IagAe6TxTOJFMUV2fa5E6nbHJ1PUjfJ/IsoMgwagsqk=;
 b=i+HGhzi9nJdej/SDqooev1M5cWMVLvuPkwY0+fOTsZY8UOl2is2GQpSbmQnwoUh3YfBrEi7CoxCRTZmfv0K58c4XgDdQVurShERPH3vNnpgWUkf/VI9O2BGQf98k9WsvyDQBwqH1wi2ZPzo9J4JWNNNC+lU+2q4w3HK3grxmZ9tU2BTh8PBGvfTssStq0xQ42zw3bSQlumgFPUoonE0JOIL1Tss4UOIKxFJhGqCgh4Juu5DzrBdLdfMJef+50MR4IMYZi2Imh+hT5s5oo1zA6JeklvBNv/yskp24Iti3EI5AA2KipCp/efDQV6j+2I/fx3C2ynNlElOIK54TgCpqJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IagAe6TxTOJFMUV2fa5E6nbHJ1PUjfJ/IsoMgwagsqk=;
 b=vLTVZ5QxY3e537FUWS/osqj0+prW/ULm7Kt+RdY2DZnSgaUIo0ccRVAV+zEGRf1N2WnPpE7OcGXWzF0em65W4otwRsSuifZFdZ35xWE9w1NpQBDMjz1sO2k7hdD3Dg+XIfZDf4mLkYsM2+6v5DaTx0JvABMb8AdzKR6LVxu2jBb/dxATC/nTU3RZtmDIjQe8rY2RtMq54eQlZHsXTXjE2ETneZjON+6n18v94oRI0P8ifbveR1b6Xw1Bcal5YKvV+xxkkHmJrvVqUulJytPhYKXZzZzNaxm49aqG7ojjlPPNElpLIV3xrNhzAd1IR+1+PFdnY+BkDDkRyGecgOLFjg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <5246aa98-d23c-41d5-ba14-c12b0a2ee9af@epam.com>
Date: Wed, 18 Dec 2024 11:52:21 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] xen/kconfig: allow LATE_HWDOM config for ARM
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
References: <20241217114719.2870676-1-Sergiy_Kibrik@epam.com>
 <4e437c60-4fee-40ed-9d2a-789bac0b36d9@xen.org>
Content-Language: en-US
From: Sergiy Kibrik <sergiy_kibrik@epam.com>
In-Reply-To: <4e437c60-4fee-40ed-9d2a-789bac0b36d9@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0014.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::19) To AS8PR03MB9192.eurprd03.prod.outlook.com
 (2603:10a6:20b:5c0::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9192:EE_|GV1PR03MB8109:EE_
X-MS-Office365-Filtering-Correlation-Id: bdf0237e-3cf6-44ec-1a40-08dd1f49abe6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SmlhZU42WVZmdnQyeE9FM3U1VTRFR214eWxrOHRKVGZPMGNDdWYxdG5IZE9O?=
 =?utf-8?B?LzQyWVA4TFFxaUNwZlladytuRnA1VFdZaUN3WnhFZGNtTkxFSVVPQU4wYzA4?=
 =?utf-8?B?b1RNV3pna0kvRGVuOTBhb3ZkS2lCRE5sdVcvWldZcDdxK000V1dwY1RPTUJJ?=
 =?utf-8?B?RDNVL0xka3o2cDZGY25iQm9MdTE5Wnp4WTlwdUdtUm1kV0V5ZDJkZExsb05y?=
 =?utf-8?B?MWhhaFBDdHNEQzJ0YlpidGcrbDVBdGRGTHg5clk5MWVCOEtqZlRHcC82MlRY?=
 =?utf-8?B?YzdNa1kyNGFvSFdRV3lYN1BRcW5FV1pzQ0F3RTMxZG0yWTN1UFZsT25xOGV0?=
 =?utf-8?B?VFFzUnpNanlaeDZzcGM3VnVaZnZkaURCWi9LaXhQMGNTY3ZGUEJTUDF4QUwr?=
 =?utf-8?B?WCtRSElOQmw0SlNaMTJyOWQxUjFSVFpwWFNDNllnQXh2T2hSK1hTU29RWEYz?=
 =?utf-8?B?NkVwcUJKaUJlRlc1SURadGhoQnE5a1hXV0JROVVpTlZzNGhMSnRRcGZ2M0ZI?=
 =?utf-8?B?TG93b05HWTZCS09ibW5JT2psSXYwSjJzQWovY0luUE05VjlZUDFtcmFBWXM5?=
 =?utf-8?B?dTk3Nk8xZGVBcE5tRENKSHNzc0F1ZFF6WGlwbVBYclYyZWNNeXVTSHhuTU12?=
 =?utf-8?B?Q1dGUjFsWjU3Z1ljd0VEUG4rc1g2cS9hbGV3V2tZaHpKQnBBNkRrT3ppVEhr?=
 =?utf-8?B?Z3B0YUZTNzg2ZW5kdzRHbjVmUU9BME93Sit0Z3FtYyt6WURKQ1U2dm03d1Nq?=
 =?utf-8?B?OExlNVRwM1h4THNQKzE5RCtzMnZaUkZvWDVJNUFHb2Y4RDUvWHdlQlpndmhi?=
 =?utf-8?B?YU5XTXNuSFVNOUk4bkhIblZTUFpNYjZmc0NuRW1Ea01CL2E3N1RoTGFrKzlV?=
 =?utf-8?B?cEo2ZFFGTmhwbVB6R3V2TEExUXpoVXRnSEExNDFiUlI1VzA0aXVZaXIwaHBK?=
 =?utf-8?B?ZytHZ1A5VE1SNzA3K25pYlpKOWVYMmY1czF2eWVnRHVXOWNMME9obFEyWWlO?=
 =?utf-8?B?SmZVSGVvWXlpRWJsbllGRndpRXZsRUJoR3Zob1VBcHJORjlFclpkUlg1ZVpH?=
 =?utf-8?B?Y2hNdEZNbzVsbEwwQjU5b3RRcjFnYi9odmlYSURIdXE4cFZrbkdrL042V0hu?=
 =?utf-8?B?SzBIZmxDaGRxcUpqTHdjb0s0VlRhMnJjdUc2QURDSncrZlRtS0tqWFZoczFo?=
 =?utf-8?B?QWlaV3BwUEZMVG9aU0traW5VWGVuaWZadDlJQU5wdEMxV2k0b3dWdEpMejVM?=
 =?utf-8?B?emZselkrWFpEdnVoYlBsdFVyV0dGRkhOS2dnL2U0cGhJc05yR0J4M04vL1lm?=
 =?utf-8?B?MUpOKzAzRHVyd2VVa1dTYzNQaHRRbXoxekszNjkrN2IxZ3UvaU1uOTVjME5N?=
 =?utf-8?B?a3IyRFFPYlBKVlk5LzFZRDZyTWpRSi9RdkY2UHMyZG9JOUxwaSt1RWhLQ2g0?=
 =?utf-8?B?dmJjYzdSU1NoWHpOUFdhNVVmTTB3Rmd6dGcrR0RWOTNYeGVIWExxSmZ1eHFm?=
 =?utf-8?B?THVESm1uS1Q1ZEdzeEpVMUFzY0wxTVpDODV1RGE0MmpoVjU4cnh0SWpYTmdO?=
 =?utf-8?B?b0ZEODFiaFovS1Y1OS9pbFMyTERNVER1NFNRN3EwcFVGV3E0dmtxSWFDR3FU?=
 =?utf-8?B?Rk01QkFFTW5Fd2o0SXovMnRaNk5ZRGJ6VzkvWFZ2T1p1TGIxdS9NRHh5OEdy?=
 =?utf-8?B?SXN4Rk8xU1ZmOEtkNkpDekQwektEWDlpSGhHRnFsRktLc2FsWmE0N2ZjOUNP?=
 =?utf-8?B?ZTl0T1g0THpRV3JnMVc1UUtqaWlOTGFzRStaMkx5NzZYOG5CYnJuQmc4OUgx?=
 =?utf-8?B?bklPSkRPZ3NRQ2NlN1RqcnIwdXVyWVB0MW1XTHFVQ0VCUnVHNU5DWTJDaWxp?=
 =?utf-8?Q?gFeCkws3oeqG0?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9192.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cXdHRkp4SzRJWDAzbnovNEE5UXRibWZmeTBUV0VaMTUrZ2VZZGV1Vi9FUGRU?=
 =?utf-8?B?OTBsVFdUWU92NEoxNTY5anN3SUJaSVJ3SC8zMVdyb1M3dVNjZUNPeUxnemxv?=
 =?utf-8?B?b2djQ08xUVk3eFBEcVBWS1EvOERSTFp0cGN5SHFqMlRqZ3dTUGtaN0U3b0Rm?=
 =?utf-8?B?Z1EwYmNOU2ovMHh2blhINWFTbjk2TGVxV3RKcHVlUWNKNFZFbmxIblpmMlR3?=
 =?utf-8?B?UFZ1QUQvOVBwM1dLTjZTdGR2blhva1p1YzBYelBNcDJkZFhhU3NncGVGNzdT?=
 =?utf-8?B?RHNWWGJRQ0M0MlpnTE5KM3BvdFhUOTk3MlQ5S0g2NFRnLy9iMzJEZGs5bmhw?=
 =?utf-8?B?WGhyUFZRZGZwS2hPc2xyS2ZwMXlxOGpCL2o5bitVV3hpcEcxQStQSXRHZGt5?=
 =?utf-8?B?ZlNnbVNsbTNpcEVrMEwxQytrT0h0ODhaREp5Q25XWlYvMVRTWjliaHUybENL?=
 =?utf-8?B?T2gramR3ejZaaVJ2STl5aE41aUhyenFNdklrV0k5Ry9VSHlKSzl6QVRubVFN?=
 =?utf-8?B?ZzlWM010WEs1ZGNZSzI2MW13T2xrVFVHaVh0OE0yUGFiRThUOCttYmV4MCtG?=
 =?utf-8?B?ZTZsZFV4R0JqR2Ezdk9PV1pHckY3UmIrYnJjV1ZaYVhHOWJWaTRXNHU0RXZs?=
 =?utf-8?B?MjFaL0kyOVVseDRnZWt1ejJjMU94U2RXRVhvTzcwZzUySXJwdWYxbXVKVkxl?=
 =?utf-8?B?aGVWK2g2clRWSzFFZ09LNDdjMjZUbW5wTGpUZkt1elJsK0RwSC9nVWVxSHd2?=
 =?utf-8?B?UEtmZVJwRTN4aWZMeXJKOXhhWCsyYllvRDh0ZEovZVYyVm5DRmp6UXViY0p0?=
 =?utf-8?B?ZHkydUxzTUR3byttR2pWMFByQWF3d3NWdllmdEtQNlZRVDYyd091SVhHSzNi?=
 =?utf-8?B?WFFITitiME9ZL0Z0bzhJNmtXMDgzQmJKWXJBOFMvbEs0c2ZqN25odFNLUjRu?=
 =?utf-8?B?SGVreEg1TFR4bVRuM2lkL1RmZTRja2Z2eC8rTkM0UEk1SzNtcm9IcDJoTm8w?=
 =?utf-8?B?Z2pKQjNONWJLSEM0dTNWc0R0YmFQZis5M1NGZjZNK0x4MUlxSWpDNlp4Znpo?=
 =?utf-8?B?U01EVEpQV29UanZ1U1NsSjZrYmRTMWh2R0c3dTBEc3E3citXZzlzcXJyeTNa?=
 =?utf-8?B?L0NMNFczSUtpMTgzSjJsL0FEclVGL3VNamNpUWFjV2xuUElvOHVCbnpsVmF4?=
 =?utf-8?B?SzVjNmJmRWx4UmZqSnp1MlBnYlpaZDFTMGozS3FDK1Rubm8xTDYvWEl1UklF?=
 =?utf-8?B?ZjBOY09ySzl1Zm8xWHZGZmhlQVpadHozMXd2SFE4SVViU2Jrd28xeVFRVVJv?=
 =?utf-8?B?cFJha3JnSGl6VmhoMGlaUkpTQ2t0Q2VhcFBSNUJnakRGVG5nOE0zaTR6c2hL?=
 =?utf-8?B?QXVZMUJYUE8zY1F1N3ZXc1ZlYVJJc3Q1ZFhTelFiQ0dYN1M1MjZ2RVg5TGd6?=
 =?utf-8?B?OVNrV1pqaVA5RGxuU2ltRUFHSzBTZERjd1pueEhRdlJZeVJzNW1TdVovSzFl?=
 =?utf-8?B?b1NBNmU5SStQdnhEamQ2U1V6UkVuUjBPRkh6bVlEMUdtOXVOdkN0d3lqeEhR?=
 =?utf-8?B?OXhMTkJmT0tOWXFHRHZ3VTQwRHV5eEZpeHBmNXJCbnJ1TEdCblZYREYwWExE?=
 =?utf-8?B?b2VOY3YvQk9rKzdyWWlTbndjRUJKZm44S3NMQzF3NEMzNHA5eTVHL1V2WEpW?=
 =?utf-8?B?d0VrZVBROXIrenFaV2Q0SWdGMktYNXUxZVdTb09WM0N1dlF6WWJtbkFPam1u?=
 =?utf-8?B?V2NLODlFM3V5aWlDU294c0VuTHNaaHhVT0IzL0dVcTYyNmZtWUc5WFROTXJt?=
 =?utf-8?B?cWNCRFlUZzllT3VNVm10WnE4eERMZ01HcFd0MG5BUmJERTdxSzlVRTNFUVVX?=
 =?utf-8?B?VTEyL2VCV1plRlBtWmxHY2FNNU1vM3prTXZWa0U4SnVuWmxOUUc4dW04YlVk?=
 =?utf-8?B?aWxmL3JuanBoWm0rbzEvSUNMQkt2aFhjTTFCNWx1cE1zVlBuWVF6OFFuMFF2?=
 =?utf-8?B?NStLVHcyN2lFQ3JOb0E1aHRwRUMrSGZSTGhiR0lkamlwVFBFRmFrRDl3MFJl?=
 =?utf-8?B?SDN2cmN1dEM2bDAzMkk4WGNCYU9mcW9wODVaNGh4VWV1Y21NMXpNQzNnY0x3?=
 =?utf-8?B?d1JyYUVqM2J3eGxVT3M1Mks1SHpEY3FXb2FwNGdiRGR1OXJpdUNLVjUwU3Yy?=
 =?utf-8?B?Zmc9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bdf0237e-3cf6-44ec-1a40-08dd1f49abe6
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9192.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2024 09:52:23.4993
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DFiMGsvqf3IPlmfujw29m1PH2iyRgLYfgKdGixwDiWx+oBnUKCMUUf+plsHFhPyOt3MLNXDFpUbR8f91nGfYLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR03MB8109

hi Julien,

17.12.24 14:42, Julien Grall:
> Hi,
> 
> Can you clarify why this is an RFC?
> 

The code for LATE_HWDOM support on ARM seems to be already in place and 
working, yet I'm not sure that such configuration is ready to be exposed 
for users (well, probably not ready yet, considering Daniel's comments 
regarding XSM later in this thread).


> On 17/12/2024 11:47, Sergiy Kibrik wrote:
>> Allow to build ARM configuration with support for initializing 
>> hardware domain.
>> On ARM it is only possible to start hardware domain in multiboot mode, so
>> dom0less support is required. This is reflected by dependency on 
>> DOM0LESS_BOOT
>> instead of directly depending on ARM config option.
> 
> I am a bit confused with the explanation. We already have an hardware 
> domain on Arm. It is dom0. So what are you trying to achieve? Is this 
> remove some permissions from the hardware domain?

I agree, it should have better description.
This is to split dom0 permissions into control-only and hardware-only 
domains, much like it can be done in x86.

> 
> If so, why can't the hardware domain stay as dom0 and you remove the 
> feature you don't want (e.g. control domain)?

control domain is still needed, but as a separate instance & without 
hardware access.

> 
> Are you sure this patch is sufficient to use the late hwdom feature? 
> Looking at the code, to enable the late hwdom, the user needs to provide 
> a domid on the command line. But AFAICT, there is no way to provide a 
> domain ID in the DOM0LESS case...
> 

I append "hardware_dom=1" to xen,xen-bootargs in host's device tree and 
it works.

>>
>> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
>> ---
>>   xen/common/Kconfig | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/xen/common/Kconfig b/xen/common/Kconfig
>> index 90268d9249..7368ca8208 100644
>> --- a/xen/common/Kconfig
>> +++ b/xen/common/Kconfig
>> @@ -374,7 +374,7 @@ endchoice
>>   config LATE_HWDOM
>>       bool "Dedicated hardware domain"
>>       default n
>> -    depends on XSM && X86
>> +    depends on XSM && (X86 || DOM0LESS_BOOT)
> 
> This will enable LATE_HWDOM for other arch. Is this what we want?

my assumption was that DOM0LESS_BOOT only available on ARM, hence other 
arch won't be affected.

   -Sergiy

