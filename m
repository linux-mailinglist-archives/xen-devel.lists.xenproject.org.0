Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9BEAD54C4
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jun 2025 13:54:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1011642.1390100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPK1x-0003K4-SZ; Wed, 11 Jun 2025 11:54:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1011642.1390100; Wed, 11 Jun 2025 11:54:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPK1x-0003Id-Oj; Wed, 11 Jun 2025 11:54:09 +0000
Received: by outflank-mailman (input) for mailman id 1011642;
 Wed, 11 Jun 2025 11:54:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hVzw=Y2=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uPK1w-0003IN-6a
 for xen-devel@lists.xenproject.org; Wed, 11 Jun 2025 11:54:08 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20630.outbound.protection.outlook.com
 [2a01:111:f403:2417::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c647b255-46ba-11f0-a307-13f23c93f187;
 Wed, 11 Jun 2025 13:54:06 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by SN7PR12MB8769.namprd12.prod.outlook.com (2603:10b6:806:34b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Wed, 11 Jun
 2025 11:54:01 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8792.034; Wed, 11 Jun 2025
 11:54:00 +0000
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
X-Inumbo-ID: c647b255-46ba-11f0-a307-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HkBGB4dgTnj+Bv68mEu+PT0ukwtxYBC4+rATIr2gXn2QlUqhEci0lGA3s6gqpJZKzg+qAh9ezXl2gYXoekdN3AUPiB4y0H2ZLpp2eemLjXrjBRt/o7MdP2+B4WrcJ1U3UMcC/DJGjVVF6AmKDsqpnbGbgLCcu7p3Kdvw7G+TeEpPWYmNrNLHo8Z/lWbl9MfK/ztPZ8Eru53q06M6D9FHR9lIOHD+MrEUkbnSwyZk+iMEiYP//eonR2V2cKsvSILdygbckHnksIjgojoIRtzyxYB7h652nXbZkLS/IXc8aScUq4Eporlm8+VeH94us0bsim0kSihxC6u/7vCGMueNgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OrVLsrPx6XW4DEkM6stIzfwimKEjZr3IfOxRKjnMDoQ=;
 b=IIW6dUQHnY/qrkPP6kTFgts3CSjiw0x+muu+QS1PbiJ6kVoiimF1gavYefx9x8VhZf3Lom0weTe/33GV5Dwz1q+DynMLwwhtQNUBdObZrFVhqvK7YkYzo8gxY9Tee+l5YcQkRDOHSlbA4UkXjAlxC6aHcD7snZXAfYR6D46B6nmhPQsADT/XttqDcZysXhfJCq7W1K0XRfyFZ5wE6Eum/2MQ8NTEc1n8WKNrbTe5pv+bNE4dnnJTWI4vHb+9wnirbxMOg1fKAaBT4vJ98ZU6Ye6UHPfoiPMf18948YtiVS9UeZHICx9fqSbPbEpLtODGO3ebbw+zqEn1qIOA1sVPgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OrVLsrPx6XW4DEkM6stIzfwimKEjZr3IfOxRKjnMDoQ=;
 b=MayRIFOmwE7GG95hTDicUQGScNStYKaGFVIUxSI/CnCVaWdoYdsA0Y38/wv2MQr/lqoB2yaxYz0TyhjjS2iIPFuiJ2mm2AkINnLnB2OrYx8LUacOd8/b/0WchKshyEtAOXKc3a98pvunE00VZxBcAVC6X1m6i/s2p1Z7U1QzWS0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <97cefe77-d876-489e-bd54-7a79d1209774@amd.com>
Date: Wed, 11 Jun 2025 13:53:57 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: move declarations of device_tree_get_{reg,u32}() to
 xen/device_tree.h
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250611114415.64480-1-oleksii.kurochko@gmail.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20250611114415.64480-1-oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0P190CA0024.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:208:190::34) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|SN7PR12MB8769:EE_
X-MS-Office365-Filtering-Correlation-Id: ac96d381-5b31-4a61-2828-08dda8dea788
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TEdTN1pZMlNpSjF1b1VOdkNySzErUW5HS3FOZVFvcmUyb2xQVTFud3RCekF5?=
 =?utf-8?B?dWd5WVRKdHVHUTZPOGF4b3dsdkJTaEc0bWx0K1kvREt3dWUrNzJYKzhHbEx4?=
 =?utf-8?B?VWQ0YmpKUkJaamV3VjV1NW9MT3luZTJxTjZSbHBCL005Slg2SFF3ODBhUzIx?=
 =?utf-8?B?N1FGem82azY5Ynk2ZFFCQ04vZ1cydExiY1p4c3ZXcXh3eit0cmh4NEZkazRp?=
 =?utf-8?B?dzlNVWZiYTBlOEgrbXFodVl2Vk1IS2JLbjJ1Y2FUdDdGVmF5TExiMkVjL2Vs?=
 =?utf-8?B?bXBGbElxdWw3cmZjZjV5VDc5akNVQXZMUkJ2OU80VkJMZmtLWmNvUlNzZ1Jm?=
 =?utf-8?B?ZzZjYlhjallNd1FNTDd2NkNHZk9OQWJVZUtLS0RBdGQ0MGV1aENGbENMY29V?=
 =?utf-8?B?d25TVE1Bd3dZQlVvYVBQYThYQnNnWE1sT0xtNDlyOHZEWGJ5NWNlcXZhM1BF?=
 =?utf-8?B?SHByYjRka0RwNkhzRHZUa0dWdjRrUGJZMWI0L0pRMWxHUFVablRTSzg5UnU4?=
 =?utf-8?B?TjFUb1MxSEtobDIyQ0JPcFZOTDJCS0tYOW5XbDljZzd5VndQUWhkeHEvRVly?=
 =?utf-8?B?Y0ovR29vNFJWSDZDTSs2UWZrSVRZRWptY3poSlZUSDdrS3pGcnByaVE4VUFl?=
 =?utf-8?B?VE9McGt3eXlkWFMxSGd6MStidHlOMnRWVmFHU0krVHFhb0xaZHAxbldvbGxK?=
 =?utf-8?B?Y3M5R09ZRWt4UDltZ2Z1cUNXaEJUcDMrUjlPdWlNTEFUYXd3anlmU3JUYUNR?=
 =?utf-8?B?SEpFT1A1Y21YSVk2b1dkZUw5aDdtT3BSbTJtQXh0bGdwRGltdVhpWEpJK3Fq?=
 =?utf-8?B?S3RjS1FVYk5PUnRKMmRwaVBBVUdyenhZZ2RiUkZmaEd2NVdzOEx2VGI1TVRp?=
 =?utf-8?B?NXFRZVJwdWJ3Q29Kek1zaWNjTSsyOEk2YlkxYVdnWElEbU9MRkNkbWsyb29i?=
 =?utf-8?B?MnUwYy9tSGswR3g5TEpuS2l4cmlVbWppamlvRW5WOTVQVFNoVE1EK1BhdEFV?=
 =?utf-8?B?K3RReCtkNjRxQXBNcDVJNW50bVdUQmhWTWo1V095VGRXTXJGMGF1VEpSTk5z?=
 =?utf-8?B?bEx5NU9aQ3ZaZ2JzcWs4dmtDazg5amVmcThocjFpSUxiU1RDK0lmUFl3SGt5?=
 =?utf-8?B?RFJUZEIrV3lMM3VMUGc5TVFFa3FaUFlQSFF2T1VwUkZaS3RqNElrQkhyUmFw?=
 =?utf-8?B?SEwyN0tMaWc5a2pyWi9YUnVpdGRLWmJQY3NpOHlDMFgwdU9ReHlpT2xNeUQ0?=
 =?utf-8?B?TG9wR094OGFGakNEOU13WGVDS01mcGd1akVWM0lrQUtsK2hPMUVTRjdsQWJa?=
 =?utf-8?B?bU5GTlUydG42NXZNbjEreS9ma25CVy9jcEs4Tzd4Y1E2N09Cdzd3ZHBaZS8x?=
 =?utf-8?B?UXZCSGNLY21Sa1RscG1rR0UwR2hwTXBEUUErUEdBZ21lM0wwbEl1U3hIb2Vi?=
 =?utf-8?B?L3QwSUhEMzFtU2JqdCtScWxsVm12SUR3RWFNUFl0bHdTVFRtN215R1pKb3JF?=
 =?utf-8?B?aDZXUksrUzNzdnBvU0RjSHF6dlJaQVBGQXhOUU9SM1NWbThwOFFHTmYyYzFy?=
 =?utf-8?B?UkZtQ0VMS0EzS2c2bDNQOGdPcEl6WFhpUDVPZUMyZnZ1MmtGY3Yra0pOeXBZ?=
 =?utf-8?B?UnpnbzFtRk9MTE9TZit5cVNpclJnaVlFSDh4Z2ZTa2hMM3BtN0s5akRSZ0ZO?=
 =?utf-8?B?V1lVL0NjOGNjZ093dGUvdTJZMHhOc1BsZEhrbHdqSGdLU2tPZlhUNisxQlpm?=
 =?utf-8?B?S2pwaWpYNTY1cElZQ1JaWEltVGMyYlZoektxZmVVSkFJblRsNGxrVTZnOGpO?=
 =?utf-8?B?YmVqeXNkLy92VkZIOHdmR3NLb25VYVBoTzhPOXltc3pqT3FvZFM1eW55Rmxo?=
 =?utf-8?B?QmpCRnIvdEUxdnFWblpIZkFzaEVqdGVWMkltUXlUVzlERUpmU2FEb2t5dlRV?=
 =?utf-8?Q?ztLvoWuH9dY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T3NKQzlCb05FVXkwRVovYmpUUzAvLzl2NDJOOWw0clFEZ3R2djBKWE12VXBV?=
 =?utf-8?B?dHA0RXNYVkhndmsrUmRqYXJMNU8rZ2ZmbFZoQk0wRDFwU00vOWdPZUJ1b09a?=
 =?utf-8?B?dE1ZT2dyMXB0KzJ4eHh4TGRFWis2VTc1SjJhZUtqUnMzblZtaFFrY3NFaXdC?=
 =?utf-8?B?THFHd3duckI2RTNEMVJDbkRLOHNFQkN1U28ycSsvSGdBSFNZWkRNWElGTXAv?=
 =?utf-8?B?c21CN01lS0lWVFROOEE5OUNSQytsMlcwbFIvNlh3UGNaRkJPeEVkUGFYanU2?=
 =?utf-8?B?bm9GNGtoaG5QUW13eUJ3bXZTNS9vbnMrb3l1TGFTcmZrNDl3eGVnREZhdUxT?=
 =?utf-8?B?QVJPUEZibzhHUGF4d0Fic05seVdTUm9rRkxsMitaNEpyd29sYitWTW91aVdv?=
 =?utf-8?B?L0dTTHg0REYzLzlibUFnUFNMT3dNOC9Mb2FzTFMxYnFCaFpYbys2cC8wcEFi?=
 =?utf-8?B?MXJyZThZSElOTWlmV2NnQmVzR1RlaWhVM2dzb0JoanRXODI1dnVxVVdWbmtZ?=
 =?utf-8?B?bG0wR1RqQ1JPRGw3V2JGZXZ6UVZLV0xHOEs5VmFwSGltd1BIT0t3UWJJRXdG?=
 =?utf-8?B?MEc3QlNqN3RIVFZ3MGFDcWNZc1VCcHpiLzIvcVJ5SHZiTUsxR2pqMkhyajhO?=
 =?utf-8?B?Q2YvM3A5aG9qcG81akhlZUk2VmlpS3ZhS3hHVTlUTlVFMWZqMW5MTERCMkcz?=
 =?utf-8?B?c09mcUE1bVh6Wkh1VmxjRGUvWnV1b2M1ZHpTeE5jeEcxRHh4dm1yVVZkY1FE?=
 =?utf-8?B?MGhSdGZjYXNCU25vMFdJOXY0VCs2Y09KZGc3UUU3eUdoVmFNTkZwZVV6SGkx?=
 =?utf-8?B?QUFkU3liaDJGTlJ6V0RQMU1BSjMyV2lLY1BSamtmS0tKY0RzUXZWMTk5b3Ru?=
 =?utf-8?B?eFBoWkJUaDc4cFZRMy9WWGRhdjJFcnhkS216cEJqaWluV0FNRkI5TFlVaWQz?=
 =?utf-8?B?VlFNR084RytLMVdrN1pCYXBSaGNKRXh4S3BnYWpIK3VpOEZ2WFp2SHlob3hY?=
 =?utf-8?B?WmgvYmlwaWFWMHZ3TThsUVVzN1d3UTFGYmZ1QmdwWldBWjFuK1hDWnR5TWF3?=
 =?utf-8?B?eXE0Nk43NXFkQWJwNU5ZOXlrYlZhbXFFWVdSNTlKdlVRV015Yy9CbVA4L2VE?=
 =?utf-8?B?TnEzWHVQQVNDZjVGa3hOYUF2T1FmTDVLVWFGbjY0dTZoZ21vUU5nWDI2aUJP?=
 =?utf-8?B?U1poQzZHSXJnMG5IWWNuYXphT3VsaE03UnZYU2VrazRUeHlZUFR1RDFpaEta?=
 =?utf-8?B?aG5hZlRTL0MvMTNYNUxhV1VhZC9qMC9pdzlLVFdLRkE1aHRaOWtVOS9TOVcr?=
 =?utf-8?B?OXh3V1JXSkc1RlV3NVZxdnRrOVdqbUN3MytHRVNBNzZyenY2UVZBanIwZE9k?=
 =?utf-8?B?ODloZmhuOGRVV0g3VER2QmZaVXhMUG5NQ1gwZlcvMStHVUxqdUhLTUFkNVlt?=
 =?utf-8?B?ek5XL2RJTk1ZbVp4ejFheW1hTG5rb3dLVmtURnlJbllkdmp4bTRVSFU2Mi9D?=
 =?utf-8?B?UFU1UUlsU25FekFYZURCVThrb0tTMnFiZ1VSYkZ6SUl2Tm5wUXlJU1ZxT2xj?=
 =?utf-8?B?VnZRb09MVlprZWhDZDI3bTZ2MlVJU2huVnhSUmQ5UG5Db05HOXlTdnZiaVFR?=
 =?utf-8?B?c0p3VERsZzl2MTRWZG1SRTdqTC9IdDNaNnVEUUJZY1Zob2lyNVkwUWdKRGRH?=
 =?utf-8?B?eDRnQXB1dkRzelVjVVkxaG0ybnp1RXQzZXhuSUpiOU9jV0FIejg0YXFOLzdP?=
 =?utf-8?B?MFBNSWVIby9HdDhKRGhiVnJFU051SU90eGFuTzg4aHk5c21iTjJDOWovaHRj?=
 =?utf-8?B?MURpcmNlS3huODB2eTErQUNiN0M3RDNZcFJTRE8ybTRZWVZwWnRWNGM2RHJx?=
 =?utf-8?B?QnVDZ1ZySkQrTktQb2FFOHpLb1EvLy9FTHRNYXIwTHZFM0dQV0JYR01tdHJR?=
 =?utf-8?B?R2Rrd0hsalNpYVJ0b1B3ZUpLcExCMGlxYWllQlBjUk9QUGNmdUdxUXJxS2Fr?=
 =?utf-8?B?VFNTRGtYekVUT0N5SHA4V2tRRmZpZ0l0V2ZDOHBRV1hSdGZMR05sRjEySSsw?=
 =?utf-8?B?YTFZMm1NQVpqWmZQMzlEd0dpcXp2VENVTnJxeWh4M05DQWhYanpubldpenh5?=
 =?utf-8?Q?qsdY=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac96d381-5b31-4a61-2828-08dda8dea788
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 11:54:00.5714
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PSq3Fzvr1dikDQR7FzDmXjyG51g4iIDgfWi04VbdKpLs1fRt82gDd5oOX6tzGD6x
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8769



On 11/06/2025 13:44, Oleksii Kurochko wrote:
> There is nothing Arm specific for these functions thereby it makes sense
> to move their declarations to common header: xen/device_tree.h.
I find it a bit odd that you don't mention that the definitions are already in
common and therefore the prototypes should be too. For me that's the main reason
(in fact the prototypes should have been moved together with definitions).

> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal

> ---
>  xen/arch/arm/include/asm/setup.h | 6 ------
>  xen/include/xen/device_tree.h    | 6 ++++++
>  2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
> index 6cf272c160..2b58549c1a 100644
> --- a/xen/arch/arm/include/asm/setup.h
> +++ b/xen/arch/arm/include/asm/setup.h
> @@ -53,12 +53,6 @@ void setup_mm(void);
>  extern uint32_t hyp_traps_vector[];
>  void init_traps(void);
>  
> -void device_tree_get_reg(const __be32 **cell, uint32_t address_cells,
> -                         uint32_t size_cells, paddr_t *start, paddr_t *size);
> -
> -u32 device_tree_get_u32(const void *fdt, int node,
> -                        const char *prop_name, u32 dflt);
> -
>  int handle_device(struct domain *d, struct dt_device_node *dev, p2m_type_t p2mt,
>                    struct rangeset *iomem_ranges, struct rangeset *irq_ranges);
>  
> diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
> index 6dc1fb5159..75017e4266 100644
> --- a/xen/include/xen/device_tree.h
> +++ b/xen/include/xen/device_tree.h
> @@ -949,6 +949,12 @@ int dt_get_pci_domain_nr(struct dt_device_node *node);
>  
>  struct dt_device_node *dt_find_node_by_phandle(dt_phandle handle);
>  
> +void device_tree_get_reg(const __be32 **cell, uint32_t address_cells,
> +                         uint32_t size_cells, paddr_t *start, paddr_t *size);
> +
> +u32 device_tree_get_u32(const void *fdt, int node,
> +                        const char *prop_name, u32 dflt);
> +
>  #ifdef CONFIG_DEVICE_TREE_DEBUG
>  #define dt_dprintk(fmt, args...)  \
>      printk(XENLOG_DEBUG fmt, ## args)


