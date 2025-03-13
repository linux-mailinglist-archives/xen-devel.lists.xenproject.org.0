Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB029A5F079
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 11:20:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.911830.1318230 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsffU-0003Bx-Ka; Thu, 13 Mar 2025 10:20:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 911830.1318230; Thu, 13 Mar 2025 10:20:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsffU-00038Y-Gv; Thu, 13 Mar 2025 10:20:00 +0000
Received: by outflank-mailman (input) for mailman id 911830;
 Thu, 13 Mar 2025 10:19:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a6QA=WA=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tsffT-0002qd-7e
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 10:19:59 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20604.outbound.protection.outlook.com
 [2a01:111:f403:2412::604])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b649498f-fff4-11ef-9ab9-95dc52dad729;
 Thu, 13 Mar 2025 11:19:58 +0100 (CET)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by DS2PR12MB9566.namprd12.prod.outlook.com (2603:10b6:8:279::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.28; Thu, 13 Mar
 2025 10:19:52 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%6]) with mapi id 15.20.8511.026; Thu, 13 Mar 2025
 10:19:52 +0000
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
X-Inumbo-ID: b649498f-fff4-11ef-9ab9-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fp3L8euKPnBUp1cPJZ6DxgqsW39LQbKpktefuKR1H5Hkf20wpomYndiG9MQ6vb+oAmjdyyBTHlM14G5mLJwYwpsVXsaYLxvVMCQzVb1FHcCIH4XMp5NsSEUSNnlk+5NQuggT7PQFO+k5XUzoM+yqE0g4alDLXjed+xgHjJiqTlw16/uiqtAnMUkjIGtbyT1UHEnDSV2WD33XfdInIIDePzxfcbhO2NpDWMhj+RXb+DRPMij/jv7tqlV0tFFQxvD6coD3OmTC9iXQQC0RXLRpRQqm+VBEibfjl8OlkNdpF0lTQf/RhGoEfd4CQkg+/Jux8M8qt1W0hyiZOl0IKwpMbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gkm32Nkjn10p3NZxcyEt95jQLsa531SN8i7olsg+l8w=;
 b=xsY/sLq6yTbdPImiSruDNjXbeJM0qODTEw2MnOsqN3RBtKZ3eU6YU7Xc5U5grhwh5LrLDgQSHPPUI7G+vPmdz6RTk4/vJYlTEhKnXyGWhQ5zChmrQnK2fRnOedfctChb8F3CmQSbRZbmph6WBoNAaqmHvUd5c6417rbqx4nbyFx1WxY5HlO2Pl4bUgu6DWh/o8cr9i81ELlfLrY8aN653IjbU3gunWc3MzKGlf7/DWcNmXYgiWvhpgTlErOhh4mmrqtu/kj1zLS2tieE2DGjZ09K+mEJoHvzTUw8+VwOY6vBWju3uvrYiXGJ3Jlv5OYV5ouGhgMduDP4vFRDVJjedQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gkm32Nkjn10p3NZxcyEt95jQLsa531SN8i7olsg+l8w=;
 b=gsBemZzGj3KTReBA4s8dTSBceVwFlSwU52aKzUYlmfOjFG2z3fjLUgqNFtygAL1LYOCghPHzMY83KjYqHcM1xXwYwovTFzjE40phgCGres/QUceQDnNZRB/xQbcOGubaBcjDJAvKXGqo1QAsiiokl0FGxZpakEgOAJ4zlqClS7U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <ada28315-0cfc-4be0-a543-31b589729044@amd.com>
Date: Thu, 13 Mar 2025 11:19:47 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/10] xen/arm: Rename setup_pagetables with a more
 generic name
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250312135258.1815706-1-luca.fancellu@arm.com>
 <20250312135258.1815706-9-luca.fancellu@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20250312135258.1815706-9-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0315.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f6::11) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|DS2PR12MB9566:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d775f67-81f0-4d89-3c89-08dd621897c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N0dOaTAzODBNbmhwZWFTWnJvSWppdDA4ak9tUGUySWFxYi9ZM3hUS282Z20v?=
 =?utf-8?B?N29Iem5pclFKQ1RSMjQ0K0ZkNkFVb25NcW9iQkQxYmRYU2t0d2h2c1QyNmxS?=
 =?utf-8?B?WmxaR09WMWR5K1phVDBVN3h1MTJ3M3k3emxKdzgrOFVaOEFWTHFzbjhtYWhW?=
 =?utf-8?B?MDZpNCs0a0VXUTkvRjAvRFJHZzBCM2ZFcy91aHdPRktkZ3B1bVFjYTZFZjkr?=
 =?utf-8?B?dmhzbnI0empSZUNXSEJmTXdBelE2eGZHMUllMW5PdjVpMnhqbkZ0YzVSd2sx?=
 =?utf-8?B?cTJRVjlHN0VYN1pSU0JiT0c0VWVlWGUvYXdzQ2hjNXFrREE0cUZqSDJrK0Qx?=
 =?utf-8?B?aklveUQreEphTlVNbHdBRk85T0ZTbTc0UTd0ZTlLQkRZbHZmWHZTUTcrbC9z?=
 =?utf-8?B?c1YxOGtoeHZybWFRT1N3dTNub1hjR3dNcUgvM0tVRThZdU94aWZuMWZLeVRF?=
 =?utf-8?B?QXJkS2o3Y0Q2RjNrZi9hd251MkUrcnRNOVhRL1pPZmZKc2JyR0N5c2szUjRC?=
 =?utf-8?B?REkvUGwwaVc2b0hZUkZTZFBRandMTXk2dlRqVnRiUFJ5R3ZzbFNaekJ1OUYw?=
 =?utf-8?B?Wk1BTVUyWlN5aW12RW9pU1FvRThoQkNMWTdPWkliU20zMHB3SWFxeG1RR2NF?=
 =?utf-8?B?QVBoWXdHL0I3czVBZG1Ta1NEVnhiMitvSUdVbGpxb3BFd1pQbDhUV0FhRGVT?=
 =?utf-8?B?TEcrR042RzFMV2FFc3JSV1ZIWWU0NlVpQk9WL2Q4SVkvSHZMcFZjV2pIZk1O?=
 =?utf-8?B?UUNXU0V6bzJTUHRZeGV1RTVmZ28vd2NYYktnTzdRV3FDVHdHMGZHcGM5NHU4?=
 =?utf-8?B?OWcrMC83dy9rSzFLT0xvTEpVK1lsRVRFQ25HRWhoYmNkR3RVK1hBa3o3VEdn?=
 =?utf-8?B?UEpISDNnS3FraEtGQVFQVkdqTFE0a1haVjVpUS9NdDRJdFpTOFVVYjBCWTRV?=
 =?utf-8?B?d3ROT1JlZVBTK3hSMjE2eXN4WVFZZllzQ1hnbjhmOXRCc285dENSUlVGVTBh?=
 =?utf-8?B?K0tsL1RoOUhwWDNGd3k0eHdlNXgrUnBpMWIxY3U4bnN0VzhlNmN3VHJHU1Ri?=
 =?utf-8?B?R1dUKzF2L0xCbk5HeXV1NXYrNTBWQldERUNxS1RVZlEwZkFvRmNTMmdyQnp2?=
 =?utf-8?B?R0pkN01HaGlYRDk1b1FkNzQ2MFYzaXZuUlZwR0FOd2tWdWtFU1Q0RXdBQnhR?=
 =?utf-8?B?bmhCN1ZWdHh3eGhCK1dkR3pNckxmemxxVXhBUytPM1dOMFV1VFhVNmZBUWUw?=
 =?utf-8?B?ZE9sUTVUZFl6enh6UkttbEM0ajRFVHBnb3pOdG8rZERsUmVPbDZ6RThMTENC?=
 =?utf-8?B?T1hjYnVHU2RDdHg3WkE5eUYrdG1LV0xLZGE5MXM3R2lnVmxuajZKTXQySnJu?=
 =?utf-8?B?Y1ZhWFhxUWNmRTRMU3A1cFkwRHh5eWtMTXN3Snp6Yjg3V1hhcS9JeURXNVpI?=
 =?utf-8?B?OGpCUWFkOSthcDNIVXJ5YlZ5dEpxNGFwUE9kR3Z0ZXluNTVGMjczbkFFQUhm?=
 =?utf-8?B?dWVVQjJzaURFeHNBMWcrT21NblZ1d1hkTzZKc01UbXZmRDQyNEhWZEtqWURv?=
 =?utf-8?B?WUNGZ3o0RHQ3TlpWMWRIemNnMVcxOU5jNk5qbFdmTERsQ1VwVGRIckNld29C?=
 =?utf-8?B?b25sbDB6TGREWm92RnJidHJOaU93d1RVNDl3ajFxQ3RUQ3ozRWcvc3FmVlFs?=
 =?utf-8?B?cVMzdXZVRFNOSnZmaFZSYlQ2RitOMCtFVzdPV0pjWkduV2Q2TDhjS1I5SUtL?=
 =?utf-8?B?R1dxYWtsYXpLd2l3OHdnOENxTDEzN01wQXVCL3JWZW4yMEZRU09UeXloS2l5?=
 =?utf-8?B?bDNvVWloR1E5cGV2MWF6VDI4ZStBTDVnRHZ5TDhtYS8xb3hLZitrRHg3Z3hs?=
 =?utf-8?Q?tFNeR+oVzZum6?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eWdlMk95SzBKZlBRcFd2ZW5ueHBWRW5INEVoSUdGRWk5VWRYYVpSWnlzZGRO?=
 =?utf-8?B?TWxyN0VtbjQxT0FZMHAzWHEwRlJIbjNiVWVyN01IMStJS1hDSi94cWFvTUwr?=
 =?utf-8?B?Rno0eXhrRHAyZTVBQUlLdkc4T3NxTVZYcDFtVjI2NWVwc0gxcEtRUlFJMkpi?=
 =?utf-8?B?NXFKRGtVa0VUNUJMZitqNHNtUTdHMDhJa0IyT3dLNU5qZXF5a05vaWxEWlky?=
 =?utf-8?B?YVdOS05EeWpiUHA5VlBJWHY4V0xuaFVjbkJjUFFyb285V1pBeS9Ha2N1eCt2?=
 =?utf-8?B?U1Y4ZjhwMWF4dUt1N0ExaXQybGpoTVl4TjRsSWxJNjdMM21tNzNRNTRIZTl3?=
 =?utf-8?B?R0R6SDVmUXJJcFIwbmp2OUZjTGVjOThYQTdHN1NzakovZzlOSFA1T0k3dWdk?=
 =?utf-8?B?WkU0VWpDUVNmbnhxUHErUm5qVUwrT25hRTlZZzQwelBVaUQ5aFVBMEpNL1Rp?=
 =?utf-8?B?TVJ6YlBRbDN2c3pJZXl5VVBOOVZkU2Z0LzZ2aVZ3WXBWQVUrMDJwRnMvV1NH?=
 =?utf-8?B?ZjI3Ui8vaTB6Q2FIanB1Znd5bWsrS2tsM2VOb0srMXpGU2gyRENyNjJ1NHFK?=
 =?utf-8?B?NXlzK3Q3TUgwSUs3WVBZTUpXZzdYVVU3VWNqdmZaWXdrOE5qVmM4cHdVNG1C?=
 =?utf-8?B?ellmNGZiVngvVFdKaFo1ZWNmSlJYQXJGd1g5OUkxbCswOWFobTJab0p3cGcv?=
 =?utf-8?B?ZGRUZ1N2OTgwYjIzazNkMlNobXJ1elQ3WFBTU1AvUmRoSGtTM3ZtQktxQ0JX?=
 =?utf-8?B?K3NLQXZQdThaSFR1Y0YvbHdyWkgwdnNGSGRzMm5Yb3Mxb0JGbSsySmJNcnZm?=
 =?utf-8?B?RnoyZHJRUHlxRXNNdVc3NDlvKzJuSjVBSWlsNUVBU05INFNxc1ZTdDNGSUU2?=
 =?utf-8?B?ZjdBVFdVVzJFS0tVUWlTcUFqQndwOFhqOFBZUS9UL0thdFp4L0FKMUxyY0JK?=
 =?utf-8?B?VUxENE5JQUwzK0hpcVZ0QjBzcDk5Q29rWlA5TDc1Y1puaXY5TmUwWjR6Lzl6?=
 =?utf-8?B?UjJtTFRncmhjRU9Edzl2QXRWbVVzWE1lOHpQdGx4YWxySG5VWXl6OFdtZFF2?=
 =?utf-8?B?d0o3cHd3ck4yN2ZHd0Fzd0ljbnpxRWNaUVdrM3lMd0srYm1QSXNqaGNkVFZ2?=
 =?utf-8?B?djdwcERBaGlSTlV5REFVc0VrNHNBdW41a2lzK0d4eEErNi8zODAyMTJLdmlY?=
 =?utf-8?B?UCtnL1pkSTdoOERPYXQvT3VDOTk0R3BSVDVaSER1eE1nWUwveldmMnRwaXJi?=
 =?utf-8?B?ZmV6eFVNRWltZm5wbVFTVXlaRUJ5U2dXaEM5cXh6VDNIb0w3c3ErK3pDTFFt?=
 =?utf-8?B?N2ZnVGtzMUlidkxYbWI2ZkN0OGFseVoxZXRjQWpDZHA4bXZtQ2RQNXZMbFZ1?=
 =?utf-8?B?b1lYek1TNmZWdzZ3Q2J0M0cxRDE1SVcycElwd25Fb2ZrQWFtK0wrbnl3QlV0?=
 =?utf-8?B?MjRDSjROOEF5RVV5dHI4aW5PWXVNWUd6d1k4SS92SUxRTnI5WUlGSWpVWWMy?=
 =?utf-8?B?Q0pDanU5MElQZjd0MkY0MkdLc2JleWFuUWR6eHdKZkFiRmVQMDZwTk15THpm?=
 =?utf-8?B?aWt6b01oL0wveVN1Wm1IZFU2WTZmblVVTGs5VnJqT0VkbEdVQWNRM1FUeTE1?=
 =?utf-8?B?RlFER3lLMlpzajR2Wm1DOVh6UEZpcm5xMmtkYVUybUlpZ2dkaUFmbDBmK2NT?=
 =?utf-8?B?c0I3NVFSVzlLN0lRYm50M2dzMUxWYTNYSSs5dXREcnBENFJ0U0pXeWlKT2tn?=
 =?utf-8?B?ZU8yUGtGQjhUeVd0ZHJCY2NNdGpHTENzczhUNUhzdllLbkFYYkNuUUlheTBI?=
 =?utf-8?B?OXk0QVFzc3RYM2htTk1Ud2I2d3dLU0pySjRMa0FNczhlRU5TcHlsMzN5eDZ3?=
 =?utf-8?B?VnlZaktwSTlFNlJTcU80YU1teXhKdS9nRTlvTTZJVDd1cGpyRUE3S28yM2I0?=
 =?utf-8?B?ZDUvcWlJSy9JbVp1bFgvbFhJTlBIbVJCNjhESkFmL3Y5RnRUQ1JyNUdmTzBt?=
 =?utf-8?B?OUlXa09vYkQzdkkzZkJjQUl6c0lGKzNiWlpra3hzWTczRG0zcTlYeXk1T0M3?=
 =?utf-8?B?VnJyMGZ2ZEtWT3hBVVp5Sm1IcGNKNzM5WGhPYXF6ZzRVcTFmSWZPMVNwWWhh?=
 =?utf-8?Q?pTh0=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d775f67-81f0-4d89-3c89-08dd621897c7
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2025 10:19:52.3906
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: faW0arixchK9/ey8Jxoez6icqcpZPQUI0cePmBpDbPreR7D8tCS0lGHptnDb6ypr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9566



On 12/03/2025 14:52, Luca Fancellu wrote:
> 
> 
> Rename the setup_pagetables function to setup_mappings in
> order to be implemented also for MPU system that does not
> have page tables.

mappings is better than pagetables, so:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

but I'd like to understand what will be implementation of setup_mappings for
MPU. I suppose regions setup such that the following call to early_fdt_map can
succeed and doing this in setup_mm is already too late?

~Michal


