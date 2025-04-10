Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0190DA83AFC
	for <lists+xen-devel@lfdr.de>; Thu, 10 Apr 2025 09:25:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.944949.1343246 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2mIC-0005GY-F0; Thu, 10 Apr 2025 07:25:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 944949.1343246; Thu, 10 Apr 2025 07:25:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2mIC-0005Ed-C9; Thu, 10 Apr 2025 07:25:44 +0000
Received: by outflank-mailman (input) for mailman id 944949;
 Thu, 10 Apr 2025 07:25:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D8yV=W4=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1u2mIA-0005EX-Eo
 for xen-devel@lists.xenproject.org; Thu, 10 Apr 2025 07:25:42 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2060f.outbound.protection.outlook.com
 [2a01:111:f403:200a::60f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ff2ffe55-15dc-11f0-9ffb-bf95429c2676;
 Thu, 10 Apr 2025 09:25:36 +0200 (CEST)
Received: from DM4PR12MB5277.namprd12.prod.outlook.com (2603:10b6:5:390::7) by
 DM4PR12MB7693.namprd12.prod.outlook.com (2603:10b6:8:103::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8632.21; Thu, 10 Apr 2025 07:25:28 +0000
Received: from DM4PR12MB5277.namprd12.prod.outlook.com
 ([fe80::9ab:5367:ba51:af6e]) by DM4PR12MB5277.namprd12.prod.outlook.com
 ([fe80::9ab:5367:ba51:af6e%5]) with mapi id 15.20.8632.021; Thu, 10 Apr 2025
 07:25:28 +0000
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
X-Inumbo-ID: ff2ffe55-15dc-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qqflodGbQxH/hJLCA+6h59A9qKd92IEykBW+HCj2U/TS70UbiabMSty62gr5JwSzTsZi0dnJ7ZojzA2iMk+8lB7/nwa/lLaicgeuGFzjmRs6MOPNFtD+f8QvK3AWnHoggAEhzcXEBBHnxmvMy+N8PyPcod2qY6RNzY1owcv8pyHsV3l0PJfzb1F3c85vzw7kZTqHfazcwutVA5ZA++vhgRHXb8Hhy30q+o1i70GNj7Fi+D1ZHUuHclfMaivmePbeFyOc2BfIDlAp1/u2udrbcYOC/Dry43ajWsIgJF3mTA+ICj/G2LesIwcNEVCx+FKp8Jzp5LBUNDtaMznXHufLgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fMYTeH1/HV9XnW+AM2SSXm/F6djSjySFeTaO2Dx7NGQ=;
 b=sS/glz1A1EnEA9nUUIL7Ccq/xXHDYO7rTpjy/5UReNchcCDQbTchXy3xgvN4SwvtZ7eX/ZTYGhE3+N8X8gjiJhintnMnjd/HK8b2IJjDPfE4hqkvgVaxrFq52/NDpTSU/RM/c1/evsXIvsl7INunAJ6h6/s42cjSpvHvXHG0mGTvznpUU0fj6kROpk0i+V+abajzd9oGjkg/o+1LQi7m46jomPPvWgFhHH6IGkcA5lB2nRV/apMYc0p6nVh2WKP7I9l+U/+hoVGpWMt/a0Kg4iGx5ruk2x8jW06jwav2o8MdF/Tqhk9EOXndCZcBfKVDVMuRKHmHUvwdOgC5g4L4aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fMYTeH1/HV9XnW+AM2SSXm/F6djSjySFeTaO2Dx7NGQ=;
 b=urPgopek2lUeq4biJMeCNvwH8Myk4S1z71ijXmpIGnO7BKI9pdG29jADaOCWjlUnfOS7J95am4gQVTP/z8mSFO36WsbW/Fm7ECLv3jXrQToQBru/qKkaM9j2ZzMdQy9LB/toEmCYeA+OtNLw+3yzes3oeoDWaD0TINX0YY+rUzQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <8e15d185-7f04-432b-a091-a83a6f42e056@amd.com>
Date: Thu, 10 Apr 2025 09:25:19 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm/irq: Reduce size of irq_desc array to exclude local
 IRQs
To: Mykola Kvach <xakep.amatop@gmail.com>, xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <eafaff031771902c44c101736de7e1b690cc8303.1744083392.git.mykola_kvach@epam.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <eafaff031771902c44c101736de7e1b690cc8303.1744083392.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0103.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::19) To DM4PR12MB5277.namprd12.prod.outlook.com
 (2603:10b6:5:390::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5277:EE_|DM4PR12MB7693:EE_
X-MS-Office365-Filtering-Correlation-Id: 532cc480-9ccc-4ece-f3b6-08dd7800de3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dmlhUllRdTYya3BTcEwzVGFyS0hFQXM1Vmc2cnBkNkhVSjFFTHlSZVk3Yjdo?=
 =?utf-8?B?UGN3bXdPeThEZ01LRFpZcEEvWDk4aUJxelhFbFh5Rk5jeDhYN2F4WVFhRHEr?=
 =?utf-8?B?WmlQN21TemkwQ09lWm45UUdJeW1McjVselhDbVhGdHNXU2s0OGNaVmU1YzFt?=
 =?utf-8?B?dmpjYzlLUzFSYTkwVmFoVVJDR1lJdFNQOFQ3YkI5cHllOXltYTV4ZFl3QVFJ?=
 =?utf-8?B?ZU1MV2N3aFlKenZnOGowYUQyMUk2YlEzb0pkQnNZaGV5cDB6K0VwRDRsQnNx?=
 =?utf-8?B?VHpjbXZGaGtOUmtJVWY3djhKV3BvYWZBc0ducmora09VYjJmeURjTDNaeTJt?=
 =?utf-8?B?NlI4bGhQSGVUeWFzSW9pUHNyckdaejJNankzdkQ3cldzblNQTEp6dElQRE1G?=
 =?utf-8?B?RU9XNEU3bGt6YjQvQzNEOFJrU052NDcvelZDM1V6cW94d1I0UnhMa21ZSVJW?=
 =?utf-8?B?SWFDNEhPaGlKSzJuOHU3T1JMVmZ2L1JZcGxXK3F5RkpkMDZCVTgyNXR3RitN?=
 =?utf-8?B?UGZyYjJMdGFiRndSQnRnNlJKR1pibDdaYkZNUmZJSjBBZG1Ta1N0NDRrRHEv?=
 =?utf-8?B?SldOY09tbkhFVFJ2Mlg5VDdHQjVZb0ljWW9oN1crOXFSZWVWcHJqaG5nS01K?=
 =?utf-8?B?TGpwOVdzV0V5R1JHWGsxVkNtNi8rNFVlaldDN2ZOSy9rTkZMbHhpSVVJYXhH?=
 =?utf-8?B?S09NTWk3aVc4SFp6NWlYRmEzU0FjUTRyUVBhWU9zZ3drNkpMQkxLUnF0L2Nj?=
 =?utf-8?B?Znp4RFhXSXVqazZZUE4rbzVaT2xNUFBHWTBwQkxOYk54RXl3bHYxRzNIcmF1?=
 =?utf-8?B?SHQwYmt6bE5CYnBaMitqV1VqQTBzWExla0w0R09YTVcyVDB3WlZCc0pVaVR5?=
 =?utf-8?B?YVJrS1VjUUhGVGI5bFI2c1hnSjJoanY5M2N3UHpUaHVwWWJ1OVZHdnFnUVdP?=
 =?utf-8?B?eDViL21kMEQzWG9Oa0lmTU16M3ZsR1duMmV4NTJRaWhsSGNubnNxa1g4YVIy?=
 =?utf-8?B?ZzJvYTEzc0NqQzlzWXRJS2VPbWtDUElkbmxteWlTTHQwN0dya2NNTGd2MkdV?=
 =?utf-8?B?Mnl3LzRJRlZWNTlkV3ZMRUc3cGdoRlZwcncrNzcyUjBCMEhCcGY1OFp6Ykx5?=
 =?utf-8?B?UUtSb0c5V3I3R3VlUCtFQmVPaVNrUU5XQnJMamZrVCtVMENZVUJValg5YWZy?=
 =?utf-8?B?eW9ITWd5NzJpSHZiQmNLUURaWWVvQ2JnNHhTQjFTcEdkZFI4TkptZjlXODZh?=
 =?utf-8?B?MmtIdGd1NVp3S0E3cHkvaVN2dGFQc3VJTHdUQ0J5R2F5MWFGeTR5dnhiSFMx?=
 =?utf-8?B?Y0tKdHpOelJMQmI5L2FGeUR1VGNJbnFRQkFlNi9rYStxSVB3RUtXNjhlTlRr?=
 =?utf-8?B?VkpmRGVZamlIOTlKZnlWL2hDK1NuU1phQXp4ODRTa3V4b0JrUzVNR2R0OE9p?=
 =?utf-8?B?Q2c3T2EyMUtxOE96cWN6d0svR01BYU93d1RJbkVndm4xMmNMeWQvYjVsN3Qx?=
 =?utf-8?B?TVdCaTBSODMyeDhTR2Vqc1JEUkk3S1hMS1BmMTNCa25MbU1vWkNERnBFRTQw?=
 =?utf-8?B?eXYxWCsrN3hIMFlMWFNvM3FmVHFoV1FIR3pmU1AzMzVadGIyK1JFMC9QNDZk?=
 =?utf-8?B?MUU5Zm1NbW9GVXgxTDZuVDV1OHBPWVBSZDVkQStuRnZVR2VXbG9jYVpHM3RE?=
 =?utf-8?B?K2RMMWN0NWF6ZTh0RlZhZWQ4WTNGTlFvZnJreVB4ck5WSlJxSWxDSXR4clpm?=
 =?utf-8?B?c2lUTTZzN2tQanc5bXdUcVpjdktQTnRIWko2Vk9qY2wyazIwcWUvRlFsVFAx?=
 =?utf-8?B?R2tGZWsrWXhEOWtXQ0xKVzlpNllrbUUyUGxxWFdkTDd6VHF2blJvZlBFalNS?=
 =?utf-8?Q?TIF7PdqKmY9sP?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5277.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dWdpWTI1UTFyR1ByVkpadGVncFEzUDJMWnNTbDN4KzhqL3B6U3F2bzdJcTI1?=
 =?utf-8?B?SkhXdGtabGxnRUlEanY3N0w3Nk9rVnZXS3FxNmJnNmZwbmkvRjI4RnFYSExK?=
 =?utf-8?B?KzhXK1A3QmV0Rk52ckNXZEwxR1M5dXNkT3dXajZVZk9ZbFhUQ2ZPODNYL0tv?=
 =?utf-8?B?SWFRc2NyZSt0M1hDTXI3OVB3WHEwdHJmbXE1N1RZc1dWRkVSTVI3U2I2Vm5o?=
 =?utf-8?B?R1FoVENvZ1ZsOFgvY2ZrU3hnS1ZTckZzcmZUTlhMeFc2by8vRUFlbGRZczhK?=
 =?utf-8?B?TE5jalp2RkdWY0xrYkNsaTArbk5GblN1MHk4UWpOekFlbDhEbVk1UDBjTlly?=
 =?utf-8?B?V3Yrejd0L25LRVFNN2JwLzZJaHZNdnZvNnBHK3BRNmVIdFlGMnQweGJTQXc2?=
 =?utf-8?B?VitEMG5mVThzTkFya2xxZE85eXBDcytTc2JOMnJFWVF1SjI5TkZDOHFjcG9o?=
 =?utf-8?B?aDdocTdBSkFwaEhjeXdhV25PRTNEc0Z4V2ZPeWVCbXR2cEphM1pVeTNvMFk3?=
 =?utf-8?B?M3dsSFQ4dW4rbnBaNjRhWnRPUVBRQ29hdWZlcVA2VkJlVzhNYW1IUjlxZzN2?=
 =?utf-8?B?aXU2RGhQNnU3eHpBd1E4d3Z1WHE4NnFMK1RiTzgrcjloT2FEQTQ4QXUySUpr?=
 =?utf-8?B?ZndseEdhRFNVZFkwZjBmeW5VajdQV1JHZUxsZG1CZnJhM3djLzgvRmR5VG83?=
 =?utf-8?B?TFJxUU8vRkYreTNWNTBORmtwUHN6NG1YcDFlWHpSTUIrbnJOaGJEdnZ5dVkr?=
 =?utf-8?B?cmtGUHFweldxTlVTS3k5d2dWT0lCNml4V1hmblZXMmF5RnJYV0RWcUhqRUlh?=
 =?utf-8?B?V1k5RUtKTW9tdWNRT2JtWEJNSVAzTlZORURFdTZxdy9nY1N0bS9qUjA3Mm1k?=
 =?utf-8?B?RjI4MU9taklucU1rMGNUVmVWMFFqTVYya01OZUdGTERsbDc2bmxlbmZtZ1lC?=
 =?utf-8?B?OUI2QjRrUFVaK2lpcFgyY1BmbjE3dzU3Y203TlhnQmU5a2ZxVDRzcjRta0ts?=
 =?utf-8?B?WUdzU2ozbzdoVmt3dThsZlBzK09sNlhoNlBSelJxNWhWUTlqRWRBSFREbmd3?=
 =?utf-8?B?b2Jja0tESXpDNmNvdFlaUUxQUm8yOVMyb2hNakVrSWIrbjR2UXpWcjFmZXhj?=
 =?utf-8?B?cEc5MjdSRmt5UFluWDRsOGNLZERnalVEZmtUL1oyWTdhZE5zd01uOW1QaVpS?=
 =?utf-8?B?TWZHdFNkZS8zN3VrS0tHZkdjN2J0UmgvNk1KQ2JFeXVSVnZvUnpVRHYzQ2JY?=
 =?utf-8?B?cHYwK21SMnFUbzV4dlFuZWhDMXc4c0F5OU0vZkZ5RWpyY2liSlhiV29PbHVs?=
 =?utf-8?B?WmJvS3gwNzhQMUdJZEpRWGlxZWxRcVVjYVhrNGIzUDRZRTdwczVPcDdOdGlD?=
 =?utf-8?B?Sm5yUmc1ZkY5VEg2ZkIvWlIyNitXQitiNkdhbEwrRENwWnUvTThoTHQ4ZVV5?=
 =?utf-8?B?Rkw1R3VLcUEzYTlvTXVpaFZqdThnWE9uUVg2OE5pZkZjS2NJYmUvbjllbTJP?=
 =?utf-8?B?YUdDem5Fa3dPQk84aHk1b0JYcy9ERlIrbUR0VnNBU1RQbmdCS2NUTFlISlVE?=
 =?utf-8?B?ZUx5RjlIcmFaTUNaOE1qRnUrYW56WTNGbTAwU1JSalAzM1dsaFh6UWxyTjJk?=
 =?utf-8?B?d2owTHVkZ0FkN2xpVTRyRFNRVDgrRmRVTXZuZHFNYThLLzhnM3NJSFlheVo5?=
 =?utf-8?B?NFN0bk1rVGdDQjlKdWJNZXpPRGpQVjVCTFRWVnE2TjkraVd2dE9Ta2d1OTN2?=
 =?utf-8?B?ZENUOEpMQ3dGeEF4NDJXZ3VlY283NXp0ZjAvdVV3dnJNRGdadkFXWkFjcE9i?=
 =?utf-8?B?bG1BL0VGY1RzRjhwUkU4RHZhSGpLRHplQlkzc0ZPZzVHOGU5Z1hNZ3FmL1lp?=
 =?utf-8?B?Q3hBSnJCQ1FpSUs2bWR2aWZJS1Ewd3gxTy83MCtCZndnalZUOW5wKzIrUHZD?=
 =?utf-8?B?REhGVW5oMUcrdG5UOXFRZzN4c1VKeDNjeTBYZmtqTkllejlPb1Y1akFWcmhO?=
 =?utf-8?B?eHdtb0NudXUvdTZzdVo5aDhBdXYyRlhDWXBPUTBFa1pzZnNNWFZ2aXY4ak5i?=
 =?utf-8?B?ZXhicnROTFhySVlENkVtY1FKZ1k3OGViRHgyOTYyanVwMVB2b1pSZEdDS3V2?=
 =?utf-8?Q?8uv74+w7UPbv/mQgX/i1N6JLC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 532cc480-9ccc-4ece-f3b6-08dd7800de3e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 07:25:28.3006
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Oe4TzYrkLDSc09X79jf/d2UtsyDAuh8p6ihm8cA3cfSMBebbLZ4vSaj38eywmxOU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7693



On 08/04/2025 05:42, Mykola Kvach wrote:
> 
> 
> From: Mykola Kvach <mykola_kvach@epam.com>
> 
> SGI and PPI descriptors are banked and stored in the per-CPU local_irq_desc
> array, so not all elements of the global irq_desc array are used. This is
> already accounted for in the descriptor lookup logic inside __irq_to_desc:
>     return &irq_desc[irq - NR_LOCAL_IRQS];
> 
> Therefore, the size of the irq_desc array can be reduced by NR_LOCAL_IRQS,
> saving (NR_LOCAL_IRQS * L1_CACHE_BYTES) bytes of memory.
Good finding. History shows that local_irq_desc was introduced after irq_desc
that could explain the mistake.

> 
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal



