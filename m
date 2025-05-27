Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6230AC48A0
	for <lists+xen-devel@lfdr.de>; Tue, 27 May 2025 08:50:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.997889.1378676 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJo7g-0002lf-9a; Tue, 27 May 2025 06:49:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 997889.1378676; Tue, 27 May 2025 06:49:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJo7g-0002jP-4I; Tue, 27 May 2025 06:49:16 +0000
Received: by outflank-mailman (input) for mailman id 997889;
 Tue, 27 May 2025 06:49:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3hp9=YL=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uJo7e-0002jJ-Sk
 for xen-devel@lists.xenproject.org; Tue, 27 May 2025 06:49:15 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2060a.outbound.protection.outlook.com
 [2a01:111:f403:240a::60a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ab174de0-3ac6-11f0-a2fd-13f23c93f187;
 Tue, 27 May 2025 08:49:01 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by PH7PR12MB7018.namprd12.prod.outlook.com (2603:10b6:510:1b8::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Tue, 27 May
 2025 06:48:56 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8769.025; Tue, 27 May 2025
 06:48:56 +0000
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
X-Inumbo-ID: ab174de0-3ac6-11f0-a2fd-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WDslE75ptcNkoCyaXI9kus90ILcwaeJfOMuJasm+TEBzAIVUZr9Ba9LN5cGPoEx+XzUngRbTwS7qUJxXS2vJD6Uj4/rkdo/PmY2NaLM6LkU7WAdu6XWNkTsPNlITLFFMJ4JBwsdZVj9E5EC+hSCJXegSRGjQmuI/+UBgvKbTKL8Tvy1M3F01je6ADBq1n3w73GOYzArGsIWKqsm6TXl5Hc2a82tfo+Ramse5Hcc25OYX00qe1huGBJP4JuxUIU3tjhdYZH3Gr6tqy2yu0Mtj/tSOfappmNH5m2jqxlRdZxuBs8QOMF5s0t4j1i4CVnqFFhUbbBa+WHTAauw3mUQdbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WRO9yt6TVAFdho2d8tnHuRwZW6RfvoYX6bnVpba72ZQ=;
 b=FswTfcqOtaLWh+VZnJUbT3/a9cQ7sFMiUtDlszTjPJyTx1CSr++7XOcv3YEGNnnj7e3TlssVVdrh/V4VfiZfIlciRUNL+k+WmVrrNMempFg0ETyBP/GPThUSACca8JlSoSNtoC0jLNUmLH/hMBZWKjEaGGantsZNz/IEydQSHbDO14Pg0KeQ/3S6StofWhUuqmVjv6AP2bJo+vQa+maMm2WXcVsxLKJEM241lvRv7LXAi0MayFxRfSr3Rnt8/36wCbiPJMbzo4qjLqNsjGvbYASzodRdZmThxA/qZM8GuEyYo0vH2vEFbE616rOdh+ovnEWChXddfxc5/9SKdBBnbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WRO9yt6TVAFdho2d8tnHuRwZW6RfvoYX6bnVpba72ZQ=;
 b=kaV2VnuqoKH9R4eTAe0DizK/gw1exfHNW2dVZyvbQ82HrTlZlU73ZjfTo/9qIC4sezTd7BaIbAjLGcQwZoUGBvJddRgIht+2J/YzmHLofnqE/B4PsKuOdqLrAWGiTZzLEwl5VsWlWlF9+DTEO1Iih2nKHhY+ToQThM71g5cabuA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <51a4f845-1337-415d-ba01-40f530a7cb95@amd.com>
Date: Tue, 27 May 2025 08:48:52 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm/vgic-v3: Fix GICD_ICPENDR read access in
 __vgic_v3_distr_common_mmio_read()
To: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250527001151.3804521-1-oleksandr_tyshchenko@epam.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20250527001151.3804521-1-oleksandr_tyshchenko@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PAZP264CA0160.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:1f9::22) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|PH7PR12MB7018:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a51ba9f-baad-4e46-88ad-08dd9cea8d12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cWJ0ZXBXL0N2MUp1RXpYRkpEbjJ6aGpQRjZ3ek5oVjRsS2VhdjY4TXk5ZW5G?=
 =?utf-8?B?T3FBbUhYU3BHVWozeTdrSWl1dmZpMkN4MHd6eEFhdll3V01xTEZkcm1NdFZh?=
 =?utf-8?B?NTlqcmRLemREU1R4WFd1aFM5TzIrVUNrWW1udnFWMlVjUnhSU1JZK3VXM3dq?=
 =?utf-8?B?aHEyOVcxSkVCZ3BzTE5OTCtwQXR2NDFjbjM4dVUzcE1MRGdQWWFKWTV1OEJ2?=
 =?utf-8?B?d3FhQmNqMTB2WVNlRzFadW5xTXFoYi9WWTBtRGdxN05TUkRmZDhJRzJFY25t?=
 =?utf-8?B?SUJTSk0xUE1INmNwdm1sOEp6OG8rbWY0VjJrQ3I0WTExa2U3bk1IUWJCUG5V?=
 =?utf-8?B?cDRpY3FxMDhvWldzV01pOUFObDAwUldDNE9WSWs1Q1BPMTJ5ZWU3K08wbUdZ?=
 =?utf-8?B?L0M4UktLYVJ0UWsyK01oSXI5blBnd2kwS3dJZ29naUJ6N29PWWJBS1VEZjM2?=
 =?utf-8?B?amNTR1JvcCtDQ0trb2FwMW9Uc1RBVjY4dVhHZXhieW9neUN5UUlCU0JwbXEv?=
 =?utf-8?B?YzFKQ2t5TEM3cjJ2SDRRVkQyRjNFMXAzcDJrd2hacGtpNndxVFNQV09ndmE1?=
 =?utf-8?B?anh1enZTa29uVzBoVzNTdXhlRmpQdUp2OHREM2RZUHV2Z0tZQjQrUGRMLzIw?=
 =?utf-8?B?T2hmNDlEam90dWxlaTl1SlNCaFZaR1hvSFB0Y3QzMnhiUzRKanFTazZCS0p4?=
 =?utf-8?B?eTFpSnVxRndyZWpNZHdmQ2MzbUUyTlFLUU9XNmd3MlVnSTFCaW5zR2JLc08w?=
 =?utf-8?B?cm90OC9sL0orSER6eTZ3Z1U5Wi9nVGlQN0JsQURxUFBJck9FSkNwVnQvbS9i?=
 =?utf-8?B?alMzMHFpS0t2ZGk4TWYzeTArd05saGJBNDRYbWUraFdnaUpCd0oycE9qd25l?=
 =?utf-8?B?RlRxcDZQYVg2THkrNnRFUVNaOS9tbUN2b0tsS1JQVks4NmlxUFBqQTY2Tzh4?=
 =?utf-8?B?Y1ZJRUNCMlBTMkZLNzZ4eFR6RmtaT0x3RTd0eEVDVkE2eEF2MWdKbk0waWla?=
 =?utf-8?B?T1gxWWRMOVVpZzFib3loVThPcGlBRVBGV0xaZys0UU9NMDVjVjBQMmdPS1hK?=
 =?utf-8?B?c014dDk2Q3RvVUowUFBlRXZiQW5LL1B5SXdKYnludUJyamlSdTRxajVCUStn?=
 =?utf-8?B?K2pCRXNUb05VSk1DQ01vc3pBanc3VjNCeVpYL3ZBZndQTHJCRnBkRmtzdTNu?=
 =?utf-8?B?U1pjcG1Gc2QwazkzNER0SGlxTGZBYllwUXM1c0R2WFhJbVJwT0pzdEtaZWU5?=
 =?utf-8?B?eFpzVjR0ZUoyMEJ5dmNJaWN1bkFWeDZVUDN4a0huUmd2N3Nwd0JINjBuaFlw?=
 =?utf-8?B?bEtzOFBFMHNiWXJGNkFLenRIcVpGcUpKMWZza0NwbnJ6aEJnaGVBSXdMNTFs?=
 =?utf-8?B?OVg5LzRNY0tNaUhFV0h4V2VHa1E3VmFFVHl1SkVrcHRIeCtSYlBXMmJlcWh4?=
 =?utf-8?B?QXd5cWluS0k4VFJLeU5QTnM1RTMrZGg2cXM3SFF4Z3U0akpnMmMwTEUvT3pI?=
 =?utf-8?B?OTFpaUh4TytwY3BPK0I4SkpLeHlib3JTOFdYcUxVSmVoMUw4Mi9MWmtIdjla?=
 =?utf-8?B?dUVYK3haZ2RJYXFJRGU4YVBJdzlBUy9naGRzYmVrL0o0TEpHZGdvcTdsY0J6?=
 =?utf-8?B?M1ByOEdYOWxaVjNLZ1BaQSsyTGRuZVNPNCt5amZvUDkwOXk4L1JRK2Yvd1dU?=
 =?utf-8?B?ME5VNHJSZUxQaTByYzhaY2FZUzV2T0R2T2RHNm5UeGNtT0pONWZYVGVjeXpG?=
 =?utf-8?B?ZndBOTRzL1FDSmFvOVF0ODhWVEI5SkhDSnFnYkxZUEQwUkhtZ3BTaXd6bHo4?=
 =?utf-8?B?ZTQvUHE4Rmc3Mmxkc3NNaGJJSE8zSElBd1dJZGp5Q2JDaDVoVjJianFDbjF3?=
 =?utf-8?B?RUFzUDEzWlFqQ09Md0YvRUFnakFkbG9zWkV5b2V4a21FR1ZBUWFCU1ZFb2s2?=
 =?utf-8?Q?yIZ1UXeilWs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?emlYT3o1aHM5YTNoMnFXVFdTT1BiZmVQT1g5ZS90WFBhNVFkUXpMUnpFdDJi?=
 =?utf-8?B?eXlwcVQwa055dmVjTUVPWUZpeHc1Ukd2b3ZiUEFvc2E4UU5qekRhRlpvT1RI?=
 =?utf-8?B?SDRsN1ExeE8vL0loYnRVY1dMTUN5WkFNR1VrMDczRHdZcmxoaHRkSDBJcjdy?=
 =?utf-8?B?RVR0YlJxQWR2em1PUUxQd01TYzBJZ1FmekhQWkgxTHNaeVBwejFZV3NNWVNG?=
 =?utf-8?B?V2JJZW1rTG85T1VMZEUwdjhUOVZ6WmpFMXdJNytlUUxtYWhiZzJVU2U3UVYz?=
 =?utf-8?B?WmNRTmtZeDNuZXlxTHNKNmoxSmpTWEdZRmRSMk5kejh0OW5pZUJZQjhFTG5l?=
 =?utf-8?B?ZGVwZ2JJcEpadzVJb0VpSWp1bDRzNnpMaHhDVlRvaGFwNlJaQ3l1eStCcnBE?=
 =?utf-8?B?Y2lTZjNVa0ZyUTYzUUc2TWUrM0Jmb0pndDRnYzhzMVk5dWx1citLLzVGZm5U?=
 =?utf-8?B?WWluL0lZSVIxaEJtTUNLR1pJVWJPWWVDdVFWUGtQRnFMWStuejhyaU5EVDVm?=
 =?utf-8?B?TFFwbnBBVWlNdFVXSWZacUJBQ2p1a0lSVW4vbjFnOHo5b3ZVY2VPL1VtM28w?=
 =?utf-8?B?TTNRU1lwcm8wZE1qcTRnUUZlWkFOeUhQYXU3cWw3SkNQWTBWQ2drK3NXRVBH?=
 =?utf-8?B?MEprQ09JZU5yVy9XNDhhRHRxSkVqaVF6ZHBkaThJY3RvL1lReWJmUE9wVDY5?=
 =?utf-8?B?eS8zNnR3eVNqcjFwclgycDVqODRyM3dlV204aTQwWW1xRGszOENDa3ZrUmV5?=
 =?utf-8?B?K044TkcxaHI0dmh2bmZqRllLVHV6N0Y3Rlh3cVFQNEgrZW9IbVUrMlVTQ2E1?=
 =?utf-8?B?L2NIaC8xN0V2U1Z6V0xFai9PTmZaZCsydXBCekpnZTQ2azBiclFWckFoTmJu?=
 =?utf-8?B?U0E4b3JpeHk1ell6QWZEK3ErMURGa3I5bnlpclBOdDNVTnE2WjlEdzU1c0hq?=
 =?utf-8?B?ZTJ5ak5DWGNiUjd4ZTdoRWRGNkI4bWdTd2hpUmt6VEIvN3ZZeGRXN2M3OGF1?=
 =?utf-8?B?dlA4cE4yaVU5RWZQeExJcUJEeXVwY3FIWUozS1NqdG1TVlFnWVpPTXhpeW9Y?=
 =?utf-8?B?QU02WGdUcGFTbERXUHVrbjk2MXNBRi9mYlBwRmY5VWNOQWE0NFRueGdDNkh4?=
 =?utf-8?B?TjFaSFRDaVllL0lONmV3VmRlckxyOWoya0FtR2J6WkZVbGdzM0tSNmtCNEVY?=
 =?utf-8?B?QkZpd0ZLeFNzTGladU9VVktzRklWZThkL0t6WFBlOGcvazBrMi9kbmtSTHo1?=
 =?utf-8?B?aFVGcmk2VXU0UnZnZm0yaUVHK0JhRllMSmtqekhPV3JMWkdMaksyMmtOOCsr?=
 =?utf-8?B?dGVQenYvNmJYSHI5VVY2L3NHZlY3TjdlWS9VVjVDaXRSK05kUnpIR3lLYTdY?=
 =?utf-8?B?Y2xXR1htZHpiKy9rZFJRazBFbTJ1cFpubkgrNDYwSXZUbTl1ZlFGbFlpTlNQ?=
 =?utf-8?B?VS9rWEZuNlVvai95QXQxcmc4dnZvaWJpRG9zemZUbFN6aTNBNkRiaEZJQ2Zu?=
 =?utf-8?B?Ym1KQ1UyOERsZFAzSUtoN2JKamtEMTdpQmp4U3pCa3NlVW5FYWdYMHE2b0dx?=
 =?utf-8?B?eUxxK3BrVi9vWmpGaDB4VXZkZ3BFZVIzeWtLejdxZU1jN3ptNlBYTHhSQXpS?=
 =?utf-8?B?K0pWREhyN2ZTUXRpUVJ6a3owS1UrK0d2LzJUeHpTL3p1bXl2MUowVFUrNzZm?=
 =?utf-8?B?ZkJGSGpBaVYrdC9ONi9SOXB1b3NUejdMV0s5eUNZaDkwYU52OEtNa2dhYW56?=
 =?utf-8?B?ZUNXWERmcDZjL2k0UUZLdW9DY1MzSFdvMmd0SmxzSWVWSnNieUl6OXo1YWFo?=
 =?utf-8?B?RU9LMUF1T2cvV1dxODVtV2QvR1BZMjd0ay9PdXR1dUJDcWJCMVlLUm5hQ0F0?=
 =?utf-8?B?YzhoVzB0NC96VmM1SjdlVzZiaVdjYWFQNUZFL1ovMVYwUGt5ckwzeUsyRkRR?=
 =?utf-8?B?cks3SDVxeEVBMGZtKzV2WmtCaC9ZWHJMTmVrQ0JBQVpCZ2Jwb2NEMHlEMHU5?=
 =?utf-8?B?TTFUT1NkbXhaYzI1dGFMK08wMEwwdlBHSFRmUjM5SkJ3ZkxLR2R6UjZLTTJP?=
 =?utf-8?B?T0g1QUZ2eHVxYlQwMi9qRzBPYjU5cU1vRE5qUmdXSHkxSnBXTkgySDdKK21z?=
 =?utf-8?Q?8kpII3gEdLPNLQgHq4WZZLxux?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a51ba9f-baad-4e46-88ad-08dd9cea8d12
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 06:48:56.1851
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ktflc0Bbi9FWOMoEAdZ35OiYbnHbXQRD5b50QnTTj7p08y+qpsve6RJ03cuEB2K9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7018



On 27/05/2025 02:11, Oleksandr Tyshchenko wrote:
> An attempt to read access the GICD_ICPENDR<n> register (where n > 0)
> which should be RAZ (as not supported) causes the guest data abort
> due to incorrect end offset (GICD_ICPENDR) in the case range.
> Fix that by using the proper end offset (GICD_ICPENDRN).
> 
> Fixes: a2b83f95bfa ("xen/arm: vgic: Properly emulate the full register")
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


