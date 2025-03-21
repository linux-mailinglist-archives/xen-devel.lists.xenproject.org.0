Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4161AA6B9D5
	for <lists+xen-devel@lfdr.de>; Fri, 21 Mar 2025 12:26:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.923933.1327300 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvaVQ-00017E-0s; Fri, 21 Mar 2025 11:25:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 923933.1327300; Fri, 21 Mar 2025 11:25:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvaVP-00014H-TI; Fri, 21 Mar 2025 11:25:39 +0000
Received: by outflank-mailman (input) for mailman id 923933;
 Fri, 21 Mar 2025 11:25:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YWv/=WI=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1tvaVO-00013o-Oa
 for xen-devel@lists.xenproject.org; Fri, 21 Mar 2025 11:25:38 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20628.outbound.protection.outlook.com
 [2a01:111:f403:2612::628])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3610e5b5-0647-11f0-9ffa-bf95429c2676;
 Fri, 21 Mar 2025 12:25:37 +0100 (CET)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by DU2PR03MB7847.eurprd03.prod.outlook.com (2603:10a6:10:2d2::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.35; Fri, 21 Mar
 2025 11:25:33 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%4]) with mapi id 15.20.8534.034; Fri, 21 Mar 2025
 11:25:33 +0000
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
X-Inumbo-ID: 3610e5b5-0647-11f0-9ffa-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IQoZJUJKKh/cpnAt0NxqTuW2I5Jz/Q5cdfZVWqE2dkpVBktC1+8TztebKtUUgT+4K5k/tk7AUPAeKGR7WHGTz198EtK2fagfdiBVtuit1rVeA8pOBeKXLN5mnnbyruyZ4dbBOmOEqI3Gh/b95jbEmnmM/4LKJ7lUET+vC9FEs3r3m2NM4rtm0U+dNjc2PkQ3H79iG5zYk245OphpcQF14caWW8UseCvyni3Q0IevvzyhG3iAL3D0gQ3cNf8x/gpUiRQsWH1wPs3AKGIAt34EGg43otmbHIfbF6X7/hqs1BTmT+HuEASd9mpltLmEqzcfz6Zf5MvENN6cpB3TxfcHDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gpfQrP6l+Q85UPdbQuzF8S7ooiSCIleN8TE3gXflWY4=;
 b=bxz7fChAxqa6zea14D014u6LrmyH7SHLC//nDeNHFZgcOMKt0WwPV9Xthtm0bJyK7LWVluJD9wMlEpK9uNPJr7/KlvN8TTTvqonCTOpUfhSsZSjAooxpaX0zWhBTbcqlVf0zdOnxZitF6QgIc9JocOilJReSiZoZdbg/k+gffEHoaRNkB90ovfEnTY29kfuAtk1JWdBPcqOywAeVskr3stI7jPHdnUcDKaGzh5bBmpVPIwyodx44HT4O83+O1ca/ybJs+VGpazRPBcu+9TdpCV0ppBhXkRxPYP2n5BkDmYyEMAANzwJQ2w9Rmn83yjSOLUrLRmwaqUduL+M07wd3oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gpfQrP6l+Q85UPdbQuzF8S7ooiSCIleN8TE3gXflWY4=;
 b=NkJaL+iihKYnJJXduUwCNP7dfMC5xumWRUPuRs62MZeVgVV2y0yJc+6fsWrFCLjFfym5l4WhyAnfrKTvnJWL/0jCCkrQbQ39+QoW75b+vwnM2gzU65DSvhjZghSupwOZRcXkXsMq1TiMh8vE39uqeXNyi50ITvjHGNpUmgYErmnW1ZyeDf2E1OhNMpBIQOZbD2ySQ20v86V9qf1Ed+k+HViQjD6yf0z8eOk3GgDQVmrJSyU2qqgOL+5EdFF3lqU4fXHAwsMXi60CG2xOy+cgKKD06X1p2ADrxz/3XFK+lh7ZNeVZ2/TC8lZIA2TLYhk7kycMpbkzLiCHZHE+plNMvQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <d12a3bea-6b2b-4753-89c2-35b96a48eff6@epam.com>
Date: Fri, 21 Mar 2025 13:25:31 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 0/7] xen/arm: scmi: introduce SCI SCMI SMC
 multi-agent support
To: Grygorii Strashko <gragst.linux@gmail.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Roger Pau Monne <roger.pau@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Oleksii Moisieiev <oleksii_moisieiev@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Juergen Gross <jgross@suse.com>
References: <20250311111618.1850927-1-grygorii_strashko@epam.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <20250311111618.1850927-1-grygorii_strashko@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0184.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::7) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|DU2PR03MB7847:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b3a3194-a7de-4642-e6d2-08dd686b1814
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R1FvRFc2bTlTdUpVZTdnMkcxOFFqRXRXRkRXVmdxUFpqTXV6K2MybS8xYWVX?=
 =?utf-8?B?Nks4NGI1YWh2ZHZqa0t3dmRnL0x4Z3o1Z0NsVHMxMHRKeXFIK0tjdStvSmkw?=
 =?utf-8?B?cCtRbFZTOXN2bW1TUXIralNVZ1ZRSHVmclkxQkxvUExyclJ2bU1TSU5SSTA2?=
 =?utf-8?B?SEN0ekNzbzVJL1hnQlRKMVRpYWZBYkcyVWtlMEpxWVh2UU94MUZaZ3g2OVpp?=
 =?utf-8?B?YTFSY09QMHk4aGM2SWZrdUxUOEs4bmRtZWd0TS8ycG5PM3kzcmNkdkN3Ujd3?=
 =?utf-8?B?NVo2UVEvTHIwZXEvVmd3WWk0Wk1JQjB6MDc3TFZ5NUlBTlF1UDREL2RvU0JE?=
 =?utf-8?B?UTVjczlRa2tTd1I1QTE5Z0RycElBamhSTVBtbkpCVGhYbE5vdkxYOXBLY0JS?=
 =?utf-8?B?WU1QSFUxVnluVEo2QWhHRzB5OHFsVXo5eW9EZFoxYjFoYnIwYmx4Z3I5YXFj?=
 =?utf-8?B?WHdpd1dVSWxaWFVTTmNvQjZYUThJdWh6NGgyNkNpUGhkZDQ3OXRSTFM0YmFr?=
 =?utf-8?B?UCtnRUNxci9tQkdEMndKS09USEpFdXBsdUZpUGdTZHdVQXZqZEk0T2tiaW1k?=
 =?utf-8?B?Mi95S3ZydlBST3o0U3Bud0tFM2RtMk9IQ2IwY21yd2xWWkpaYkUzSnprd2Ni?=
 =?utf-8?B?aUh1aGY0TkpHNHVVb3VJOExrVTNvNVcyUTV5QUEyWnFHTkVBTENMNksrNUY5?=
 =?utf-8?B?MlcyZmo2QkZVVGlHb0ZFU3hUbTNvMDRYUUxkMjR5RHFQUHNXcVZxSG11emlR?=
 =?utf-8?B?SThVdjhuQjRLWUlDczhWNFdMelB5L0xFOWtHWW1hbjBONzBtbFp6UXVYSDE5?=
 =?utf-8?B?KzhyY2RkdWxxYU54MUVOQUhubzRnaGwyMXFEdjF6VlN4bVphTURYSEtKWm5V?=
 =?utf-8?B?RFhKZVhxRHdJdUloV0lmQjhwaDM2VG9UYmt3MEs2RVMwbG0xRHM2cjZFQzFj?=
 =?utf-8?B?Q1d4MlY0Y3dKOXEyWEYrUFVnTzFVbDFlMEJZWTY3bS9sYTRlU2pRMmQ5RXVK?=
 =?utf-8?B?OWk1OEpNM2k2M3F6cjI0K2JSbVBXRWVDU0lEb2RBd0kxRXkrT2ZOMndkaFdT?=
 =?utf-8?B?YVRpWUtGWjh2T25SMVJIa0U1V2tBSFVOWC9XNUtod2NYdklpNkdVK2hwTk90?=
 =?utf-8?B?Ull5ZmZTVDVPNzNmMGRHUTh1UG5YOU1uZkJiaURLSVVNZWhxSll4QjlCNG1T?=
 =?utf-8?B?NWp3cDBpNnhBRENtQnQzWm5CMzRLaEI0Vytxdm1OeE5MOXhrUEJaY01QU3FX?=
 =?utf-8?B?V21MWEgyZ2RPV0VFdit0ZnFtS0ViRktZV3pkVVRZYm9oZFJNVDdZQ0lzZU1S?=
 =?utf-8?B?NnZkRXBGR0JUUkxyOCtLQnhhNVJseVloNlFwOWZwdHc1QUpXWUtmVTBBNEI1?=
 =?utf-8?B?U3ZoMUlBUVRLbUNGRGhjMDVIdmg0M2JEYjBaNWFNQW1QSGFCSFc0Q3VYMGVP?=
 =?utf-8?B?biswaTI5V2txVGpubzVnKy9mQ0VMaUV1T3NNWWt1eVlYS1FDK3V5UXFDcnND?=
 =?utf-8?B?SWhwdW1GNTA0TkNYazJCQ0pzQ2N2K0Y2THdOcFRTUDh5by8wMmVEU2lGUStK?=
 =?utf-8?B?VHYyVHhSSTA1Z3hwT2pKcUVOZ0poTXJXeUxlRHdYdUVzQk9jbk03bVpWdUxR?=
 =?utf-8?B?Y01xNlVRM0g3a3NIQjI4M2tmSXRWZzVnbVloTWNVYngyR1o5eExadEZkMjNL?=
 =?utf-8?B?QzA4ekMwN2ZkZWlrWjBOd2F2eVljSFIwdDVkYzlvamFDMlZ5d2xRazI3elRo?=
 =?utf-8?B?RFZpWXk3K2d6cU1kN2dnd2U1Sk4wcVp4YVU5clZ1NklUczBQNzZvazVVRCtx?=
 =?utf-8?B?dnVjWjhXSGVITUk4Umh2aG1PeVU3R3ZzTzN6dkVOUDM3L1hTS2VEalh6V0NP?=
 =?utf-8?Q?Se+rZdZmEg9BU?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QWpLVUhGNW84RTRMTVV5cStHb09HTDlTTjMwM0lWem0rUnJYUncrOXdaUTdI?=
 =?utf-8?B?ME9GNGdOSGdVSXZJMWI0Y0tQSWFmSnpKSklOYURtdm11L1J5cmk0VGZNUm9B?=
 =?utf-8?B?a1B4Tm85NlJQVmxjZHFsZXh2Uk1RZE9PRUx1ODllQm96N0Mzb0hpWWdhK3Vx?=
 =?utf-8?B?bTU0YTVhYnJVY2VnWmFoOVVDaEplUEFsNVVkdFVIZSs4MDlkSzYvSDI1VDU4?=
 =?utf-8?B?SnNITldxSXgwU2ZzbHZmeHRFUE5iQjV4bWEzSUt1N1RkLzVqTUliNzJ4QlJj?=
 =?utf-8?B?RmlLNmJ3aXYvYjhqTWhPd0tMTWNKSGYxdXhKRW5WU09PczVHNGJLZWpPZDdx?=
 =?utf-8?B?TzNSeThiR1drYklzVHdXME1Lc2hJbmRwU1k5SndLSWJCbnpKZUNCc1N0MVBJ?=
 =?utf-8?B?NnVQL3I4ZndKaGpPK2dUK2l5YWlidmdWRXlLSisvanQrL25nbEJUYU5qcE5w?=
 =?utf-8?B?QWo3TURQMHFmUmwxVkFGT2llNWx5bDlJZnJTeHVVcXFBY0JHRmNJcUdFdmZO?=
 =?utf-8?B?R05BMTU1ZWJFTkIyY3g1bkE4cEVycURMTlRzMjQrRW1LS3NKKzZVL1d6aGFV?=
 =?utf-8?B?ZHNOZGhvSXJlb3ZHK1IzWGF5VXlJeDVVdjdXQmUyMXhGcHpMaExWaVlsdXAw?=
 =?utf-8?B?Z0tYcUxKTjNKKzQwREVxZ1EwOWVJYWEzU0FFZzhZK2s3RDN2V01zeDh1Smx3?=
 =?utf-8?B?MW5xblZRUWJSMG9MQ0xNOURPSVYyRUNCc3hKc3gzcHVpUCtyb1FPRHcxYUt2?=
 =?utf-8?B?aG9xZWpzUkxEWUcwTEVla3J4eFJkZFc3MnFiYVhZY29WVTZjcktPWTdsejJE?=
 =?utf-8?B?V0FYcmIzbDJLZXNkK1VKVDZhMGNQVlBqbWFvNzhxbUVUL1B6SHlNc1U3Qkpa?=
 =?utf-8?B?bVFWN0l4WUhZV1o2U0JRbnZsZzA4VkRaT29vQURoQlRGNTNvNVpDaFFMTDJ5?=
 =?utf-8?B?T2NOQUw3UlByUThTQlcxWklSMmw3blpNdmR2c1d4YUxoV1JKMUdROGZxa1NB?=
 =?utf-8?B?ckpHUlF3d1dGMjViODdlZGQ0cWhkOWQxYWdSTTBnWXpTdjJ3T3lUNHV2djhX?=
 =?utf-8?B?NTRyOExkemE5VWNRSEVEL2tOU0IxTTRISG9pMHBpZmhHM2lmTXBjL3ozVzlo?=
 =?utf-8?B?ajNQT0VhM1phQy9vYU5QUDI2WXBYYjNhWVJpUVR4WjVPZkF0TmdKQnNjT1Ba?=
 =?utf-8?B?S3RYUDdOd1g4MUZqZjVLeGl0YVV4aGQ2TGNjUjRCeGlzTDloZHBvSDQwdndT?=
 =?utf-8?B?a3djUkpPVkZWLzVDVWdWQTV3cDAxSXNzMG1GenVOVXBSY09YNlNYUzZocFRy?=
 =?utf-8?B?MWRndVNOQVFLdVpGNU05WFRSd3UvdTZoSTBMVEJISXhJdklFNFlhMmFTZDV2?=
 =?utf-8?B?dFBVdUw0cTdISGRVK0JRaXVkR080UXJZdmZsd1BBZ003Z2hqTi9nbXRBUWtW?=
 =?utf-8?B?WEhTTVFsMDZqbkZMMjZDa0tPQjVjMHRFK1Mvajk3VC9EMEFIbkJwUG13cVBU?=
 =?utf-8?B?djJMbHcvVWIwTjNKY3hVeEthaERtcUh4QkNITXJFa3BIL3dsdEE4aWkvZTJv?=
 =?utf-8?B?MTdBdlJ1SXVhblFOUFlGcFkreDJ1azEwVEdWRXdNcngzaHNaY2p2d0hIQ2dU?=
 =?utf-8?B?Vk92b1A3QXhhWmczQ0xoSldFSGVqbFlVVUVPR20yTFBZTW13emFoazAyNlhs?=
 =?utf-8?B?dVphN1pnZ1I4VEJUYURzTWV6NS9vSkhVN090NnI0OXVoVGw4MVdYb28vSHFz?=
 =?utf-8?B?LzRycmZMTWRTeTNVSmM2Rm4xRTE1aXFjUGkyN3RDT1lqQi9XUC9rKzRpbmNW?=
 =?utf-8?B?RXJrT2k3dE9xa0VRVlVCMmYyYzRzQnMrUjd2Ukpmd0ptbXVjakVvaWFzZlpu?=
 =?utf-8?B?MDYzRXlaZnVPK1o3VW9pQUQ0TkMyUlZYU0ppUVY1Y0NLSkRGdDRGL1d4SnV3?=
 =?utf-8?B?WXQ3SHh5cnh2NS9SRkhWQTJFSnpUUUlHSFIwYU05dC96cVlwbE5ndHVqVnFU?=
 =?utf-8?B?SVQ3amorWHFMVHRlbW8reEg5WkRUYjA5V1U0aEh1bU1nQVh2NHQrY2JQOHBU?=
 =?utf-8?B?QWx4Unh3cFYxSG43YU80aVlYUXhjRTRZaWl2aW15U0ZDWGVGeWJDUzFLTERP?=
 =?utf-8?B?QlFsckZ4NDRNUVY0OC9obnNNVlh3c0xLYUtMQmlJMTNPaXFuUlZJVENxZG5L?=
 =?utf-8?B?NWc9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b3a3194-a7de-4642-e6d2-08dd686b1814
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2025 11:25:33.3512
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zpyQkqCkusYtfetGtir60ckrD40XjYsKtnoAMY+B2z6o0MgbXGGmYLW5i78vTd9Tsk4y7gLFbzx1kSXEdzS+tYWoWgFrJOHjMwycl9c2heo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR03MB7847

Hi All, Jan, Anthony, Stefano,

On 11.03.25 13:16, Grygorii Strashko wrote:
> Hi,
> 
> This is respin of RFCv2 series from Oleksii Moisieiev [1] which was send pretty long time ago (2022),
> with the main intention is to resume this discussion in public and gather more opinions.
> 
> Hence the code was previously sent long time ago there are pretty high number of changes,
> including rebase on newer Xen version 4.20.0-rc2, which already contains some basic SCMI SMC driver
> introduced by Andrei Cherechesu, commit 3e322bef8bc0 ("xen/arm: firmware: Add SCMI over SMC calls
> handling layer").
> 
> Patch 1 "xen/arm: add generic SCI subsystem"
> - rebased and refactored
> - introduced DEVICE_ARM_SCI DT device class and used for SCI drivers probing instead of custom,
>    linker sections based implementation.
> - added SCI API for Dom0 DT handling, instead of manipulating with ARM arch dom0 code directly.
> - TODO: RFC changes in XEN_DOMCTL_assign_device OP processing
> 
> Patch 2 "xen/arm: scmi-smc: update to be used under sci subsystem"
> - update driver introduced by commit 3e322bef8bc0 ("xen/arm: firmware: Add SCMI over SMC calls
> handling layer") be used under sci subsystem.
> - no functional changes in general
> 
> Patch 3 "xen/arm: scmi-smc: passthrough SCMI SMC to guest domain
> This is new change which allows passthrough SCMI SMC, single agent interface to guest domain
> cover use case "thin Dom0 with guest domain, which serves as Driver domain".
> See patch commit message for full description.
> 
> Patch 4 - xen/arm: scmi: introduce SCI SCMI SMC multi-agent driver
> - added "xen,scmi-secondary-agents" property in "chosen" to inform SCI SCMI multi-agent driver
>    about available agents and their configuration. It defines <agent_id> to <smc-id,scmi_shm> map.
>    This option is Xen specific as Xen is the only one entry in the system which need to know
>    about SCMI multi-agent support and configuration.
> - each guest using SCMI should be configured with SCMI agent_id, so SCMI
>    FW can implement Agent-specific permission policy.
>    -- dom0: dom0_scmi_agent_id=<agent_id> in Xen command line option
>    -- toolstack: arm_sci = "type=scmi_smc_multiagent,agent_id=<agent_id>"
>    -- dom0less: todo: "xen,sci_type", "xen,sci_agent_id" properties in "xen,domain" nodes.
> - factored out SCMI generic definitions (re-usable)
> - factored out SCMI shmem code (re-usable)
> - the SCMI passthrough configuration for guest domains is similar to any other HW passthrough cfg.
> 
> Patches 5-7
> - no major changes, except to follow rebase and changes in previous patches
> 
> Regarding patches 5-7 I'd like to rise a question and I, personally, feel very skeptical doing any
> kind of SCMI DT nodes generation as from toolstack as from Xen.
> 1) SCMI is no differ as any other HW MFD device, and HW passthrough configuration works for it in
>     the same way.
> 2) if toolstack generates DT then dom0less case might need it also, but this means more code in Xen,
>     so, with certification in mind, it means more overhead requirements, docs and testing.
>     In my opinion if something can be done outside "kernel" - it should.
>     So better invest in tools (imagebuilder, lopper, etc.) instead.
> 3) Hence SCMI DT bindings are pretty complex the corresponding guest DT nodes can't be generated
>     from scratch - the user still need to add scmi node, protocols and protocols subnodes in the
>     partial device tree, at least empty. But stop, not exactly empty - the properties like
>     "#clock-cells" need to be added to avoid DTC warnings. Such behavior is rather confusing than
>     helpful.
> 4) Exposing the Host Device tree in Dom0 is another questionable thing for toolstack SCMI DT
>     generation. It consumes 128K of memory on Renesas r8a779g0-whitehawk.
> 5) No needs for additional public API (XEN_DOMCTL_get_sci_info, GUEST_SCI_SHMEM_BASE..) if dropped
> 


Thanks a lot for your time, review and valuable comments.
Most of comments are clear enough and will be addressed.

Those, required clarification, I'll reply separately.

-- 
Best regards,
-grygorii

