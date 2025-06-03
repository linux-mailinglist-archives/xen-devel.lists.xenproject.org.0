Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDFB3ACC0C2
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jun 2025 09:06:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1004042.1383697 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMLjH-00077y-65; Tue, 03 Jun 2025 07:06:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1004042.1383697; Tue, 03 Jun 2025 07:06:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMLjH-00076U-3E; Tue, 03 Jun 2025 07:06:35 +0000
Received: by outflank-mailman (input) for mailman id 1004042;
 Tue, 03 Jun 2025 07:06:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Vtc=YS=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uMLjF-00076O-NK
 for xen-devel@lists.xenproject.org; Tue, 03 Jun 2025 07:06:33 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20616.outbound.protection.outlook.com
 [2a01:111:f403:2414::616])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 46dbc051-4049-11f0-a300-13f23c93f187;
 Tue, 03 Jun 2025 09:06:32 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by BL4PR12MB9721.namprd12.prod.outlook.com (2603:10b6:208:4ed::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Tue, 3 Jun
 2025 07:06:28 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8792.034; Tue, 3 Jun 2025
 07:06:28 +0000
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
X-Inumbo-ID: 46dbc051-4049-11f0-a300-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rf4+LKM2BnWbpHaZZaAL5oqreUIz0hHy817vCK3T5TYMP0y6SCJtWqLd6n4dQ3BWclX9hC/Nv9WpdIxBNmYSOzXJ501KXvnE+4EHt/7/pzUAuXrvGwLWpTYFIeFy3EpnwHinnCWwwkTbz3IpQlTvQqoiJQGSf9Hsg9ht5EdpQQ0NNK8wjm1A0aTuKkxwMkwiP4pnXlYN/YOWlkKcUW6h6F02iKqM1TmxdvcAjyOSS1X9yWxuhinKKr3Lo1008+M7fJ7aP2tnspEsn0L6r09WzKhMBM4oL4idVYDjm0lkkDbQNFBivtFszF6WBGP0rozHu+KmUExF/80pMz4rG+dQJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KzHA8aNUoQ51r6qgLWtnZ4Rk2D5NHDuVcoTBZjKWNL4=;
 b=lyIutpzVHorVYH3XKKxU8gcSHFy3kGqFOfEjem19Mz5ZQThHt67uYTjUgoOQPEkAXe+8VRBWwxUT2bbS7LBKX2ox+bhMn30MZ1K/88tc1dkGwc0MDykNLq/6o1lFrkpbPUzLahN4bfkFOPmP2xtd7a5JWweqJdcc/3FgAUtJ7IUBE55NNcIU7wQr70BJ9wKYL4sKnAfF9WnHfhteQfpXzaD8boIPp5Jwwd8/Ni3YUhxtXFounFmU0ch17Bb/CRhWR/cH33To4KDxsW25sKwfjRcKgIkQYJtpJsMkxM+EsOZTU7ljjxZqLmw0BnpegqtNJWgsSGBqz1hLZzQmNHDczw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KzHA8aNUoQ51r6qgLWtnZ4Rk2D5NHDuVcoTBZjKWNL4=;
 b=I8viwF++U20hS+DfeMZSS0i8EEr7BETAIXNySBn2HzboNhQ+evtfU8bg7ZiUWquwalVu5TpsqmMCy7+zs4qaxSGDzunWp3KtsXjOrz7ycKy6Q0LXe9IFzC4toe2+wQkgQs/F0OfIsUARuBpsHKIQNtGcyeJntGtX2IS1FTiEotM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <4a806a75-0a2a-45b9-8811-caa51321a6b8@amd.com>
Date: Tue, 3 Jun 2025 09:06:24 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] device-tree: Move Arm's static-evtchn feature to common
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250527082117.120214-1-michal.orzel@amd.com>
 <344823d0-eb05-48e5-80c5-9598104f3a3b@suse.com>
 <28a9f398-d206-4e42-b627-bea71f038b4d@amd.com>
 <ba63d358-2fb6-4469-9653-e672e507f24b@suse.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <ba63d358-2fb6-4469-9653-e672e507f24b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PA7P264CA0245.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:371::6) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|BL4PR12MB9721:EE_
X-MS-Office365-Filtering-Correlation-Id: 514a0087-70c1-4de0-199a-08dda26d28e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V0tsUUlPYksrOVZGS2VpQ0dwMlNVYStJU2U4SlJFbHpuYVlzN2JXRVhFdFVr?=
 =?utf-8?B?NEp4NEVEQWtxRkpOUHVtSjA4SmpxbDh3Tmk0Q1hQTkNmNVhuWkhobnRYL0VW?=
 =?utf-8?B?YmlSOEVyNmxiMUtHUm95VXBCbitCWnFqVlpRcWFSMGwrVHA5a09KdUFoYThK?=
 =?utf-8?B?VXRVa3I0U3NxZEJRdWx0d2dRT3I4Ylo0b3VpR2F4MVZwNGlDN1FuUWdNd1hy?=
 =?utf-8?B?emhYb0IvRGhMYTAzZTJvcmIzNXNkcUpXTTJOMHlUNTlZT3RzZUJYOUM4eS9X?=
 =?utf-8?B?Y1lQNUo5dHdWcEQrQjM3VHdZTEcxVTM4VFJLbmVRa1Q4UFQzZUJ6S1hPNnJU?=
 =?utf-8?B?K0hFWEdkQzlGdy9vMk93ZHdZd0pXbHE3YjB1K0JNZUxNNFJobk1PTk5CdG56?=
 =?utf-8?B?ZXhPRzNjMVJVWnJlOGJuS1M0NXlWV1plVEhWczZpbi9ES096Tmp5MmdaTG53?=
 =?utf-8?B?SnAxazlnSXZYRlNpU1pLQy96WGFPb0FzaG5jSzd6blB0b1l2SXAyRFpuTy81?=
 =?utf-8?B?enI3M05GZWljNFRQTkx3b0JhSlQzR1FOeGxDVEppcmowMzl1emY0Y21qMSta?=
 =?utf-8?B?Q0J2VlRpK09hVGNxWkdGUmpnTEhxKzY3WGNhNHoyTHcrczZ2Sms2dWJadC84?=
 =?utf-8?B?R0FrZWRwMGdLMjhTRGN4YVNZOVBhN3ZIc3QxMHVvL1g2aFV2TDgvSkxCdFRp?=
 =?utf-8?B?cUdLbFRyRHAzM0YvVEZyd0dpeTNXRnM3dVVvM2dEenJ0NGQzdTJyc1UwM3Fo?=
 =?utf-8?B?ZGpJT29GaUxQWVFnRkNDZjREMllQeGdXWnNFWGVmanNIR1g3bnd3ZUlCb2Fj?=
 =?utf-8?B?R3NzR28vcXkxT1VHN2VhTFJVa3cwc1VqV20ySHhROHM4aWZabEJqY2tHQWh1?=
 =?utf-8?B?RDhGT01nZlBBbzhubzlFNEo2S3owSlFsbU85aXc2bHZpQUJxU2NwZzFaL2F2?=
 =?utf-8?B?YjRsWDErWnNrT2ZYbzg4RGdRdkVkZysrZUJ1dmRUWHNVbm1mT2h3YnVPRlZC?=
 =?utf-8?B?SzdiNXFjVXBSU0RlZ0dnVGp6SUhGY2d3SHdqUVRLejVpMjJpOEdDMStLcFRU?=
 =?utf-8?B?MHVIOXBEc2NQbVp1LzJlb0ZHV1ZoWFUrUUJnOFVYd3lyamN3Q3ZXQ3ZDM3Z6?=
 =?utf-8?B?QlMvZURMZERtbzZPc2RsK3BtbXF0MnRBSDAvNldkdzdlOU91U0drZ2I3SGRX?=
 =?utf-8?B?bmx2VzZuOHdjK3J0OGt4Tm5GVDh3ajlLbHpWbkJoelgzOTNZdjlvc3dvWW1U?=
 =?utf-8?B?K3VLNW15R1NvbStjM01nZlRZbGFWdzB4eUdjU2VJckxOQlZFQTNlVmhINTht?=
 =?utf-8?B?V05rKzlZVFRlREh1bnFPWGNGKzJzZUJMdUdubVkwZ3pBNG9vbHVxU2h3UDRt?=
 =?utf-8?B?L1kvb1NVOXRBNyswTTBvTkRiWUVoS3BJT0lJZzJNQ3FZUlZVbXY5UWdtSlVH?=
 =?utf-8?B?Nm1TbFlVemc1Y1ZOU0VBSFUxU0xPMUlNb2pOTGFJMmNKVFdhcXQxckNLMGZN?=
 =?utf-8?B?TjlaaW5LSVkwOGpTSDZpZ01lNUJXcmRZRjcweUJBL2FESnQ4OUpjbkMwM2pS?=
 =?utf-8?B?dGNiL1BmNXEzNitJUHZuN0FCVVBDNVM4UlBtQTlPZkZKcm1wQ3FzZC91RmFQ?=
 =?utf-8?B?M21YZjluK3VoQ2RlVWRoNlJzZmdrQkUwb04rVkE1WWUvVWxCS01CSjBnVjc1?=
 =?utf-8?B?blN3NThDWkN4ZUNlK0dsMVR6Ny9ndHZQek85OHUvdWo0ZTRaZk41bHdNeGlz?=
 =?utf-8?B?MEF4ZWdZVWZueFVXZTJVcjEwV3h6VkhPckVoeUV3LzZDK2FEVjRCeGN4cTZV?=
 =?utf-8?B?QWFiVlBlZ2NPWHN4dzh3WlM3cmJ1Y2t2WW9NeWpaYkF0R05nQ1JEYnNiUUQy?=
 =?utf-8?B?VmxvMk5qKytPdURZZW13d2o5MVVDRzEyRU4rL1c3bHlSSi9ZbDRZYmJwdnUy?=
 =?utf-8?Q?l8EnlOttkLI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q0JGYjltUDdHdnIzd0x2RWZWajBxRmtaTGZKMWhGRnNDRlhqREZwcm9WdFdn?=
 =?utf-8?B?UkRVbWZUaVlkZ3Z3OXpncFJvUnNqekF4QUd0UlpYNjRsWldZVUtaV1hpNkdW?=
 =?utf-8?B?eEdCTXljZ0R5d1JLVkFlTWhDdWdjNlVMaTdzYVhneDVySW4xN1ptOUl3M1Jy?=
 =?utf-8?B?Zk9McG81VDU2T2R5Q0x2MlBZaVo2QmsxZm1xTDcrSmFqV1lhSktpbTQ2V0JV?=
 =?utf-8?B?WnlaV3VIYmJWdm5RUWxVZldrcDhLUEdjTHIrdXNNb3ZpWmZUQ1gyZ05JWEJo?=
 =?utf-8?B?LzlEVXc3T0UzNzJHVlVWdi9XaDNCL1RicGVhUjBnRUNUM3VwbDJWcTZoa0Yz?=
 =?utf-8?B?NnNtei8xU0poZmw2YUU1WmdwNHpkVmdyKzRReHNETjVleHNVdWpJaUp3SGE1?=
 =?utf-8?B?aUJXWk5RZGJDQXVRSFhpTDl0NE5NMmNubGM3ZSt1OXBKcGlVblFaaWdnWURP?=
 =?utf-8?B?cGx6UFlKZ21vNXZnUG94bHRuQWZyV1NmUTZMdmZuQ2FOTFRMWnFlV0NnY3E3?=
 =?utf-8?B?Tkg4N3htcFhGT0U5ZHFaUlFjU3NIZEJJYndMZndjY1ZqaHZQbDAzUndyb2NQ?=
 =?utf-8?B?UWcwdVd3c3pkeEgzMUZOazR3V3djNWhxVTBtVmRTWTJ1N0srMm4rK0dUSmRK?=
 =?utf-8?B?c1pUVkIxYUk5aURjMjAwcVhRQzNjQlM1d0JCK2U2TXlSZlVFVjJoU1pzWkps?=
 =?utf-8?B?UXB6SEZJdGlhd3AwaVpzbmx5M0tvMmk5dEExcTg1QmxUOWZCa3JNMlVudnFS?=
 =?utf-8?B?M2lQNjlBQWZqT3RtVkJoRHpkbDdPb2IzOWJDRkVzVjZJV2RqQ1ZoVkRVUkNi?=
 =?utf-8?B?VGNxeTFjT2x4NGpTYUtmU0REdS9PMmY2ZTh1WGZhZVUra3BROURpYzk1K0RJ?=
 =?utf-8?B?cmlmQ1FRdnFLVWpRQkNUYjNPbUsxeVBMMmFpWjFHV1dFNVQyd2J2SVZzTWxL?=
 =?utf-8?B?NEN6ZmE1eTBvVFVTa2U2NWJPVWdTVmVkR3pwUU0zRlJXcnVKUEcwNGEyeWNT?=
 =?utf-8?B?SDloOFJ6WW5SQmxpOGdYYnBPOHArNWRnbkhJL3Y5WHRiZFZsbjc4blFQVUNI?=
 =?utf-8?B?b3hFUVhqSEtUVEk2WVF2NGdRSDVsWld2UUtlbGhaZUFIOWRpMHgvWUs5MW9v?=
 =?utf-8?B?Y3pWZkdOYUdGVjc4RDNFRmJCeFN0WDlFY0c1SVJ1ZkZLMzNtd0dyb1B6dmhm?=
 =?utf-8?B?ekdGRjRjcGVoK3RTY0lmVjVyNVBGdUhQOWxvSkwwNTRPc25Qbk10NnlSUjJ2?=
 =?utf-8?B?QktOUTNPMjBXVERMdFBTTjg1alVpRHRFK3M3OXdPUXJIeVlZUVdEeHBsdFl3?=
 =?utf-8?B?QmF3UUVJdzJvUDBXaHVjdUtyejR2T1BhcFRvVXIzMmFNdFlKSEIwTk5WblRu?=
 =?utf-8?B?OUJudVlTRVN1eUUvVm1PSnlGWnlUNWRqY05wYkVZQVQ1VzhyU3I3T2w2Z0Rk?=
 =?utf-8?B?ZGM2Zll2NTRuZVMxajJPeEVuOG8wTmUxalAzV0oyZkFPYVc0dHphVFExMzdM?=
 =?utf-8?B?MnVzSWx2VURaU3ZEbGZ2OFEzTmhibWJQa1VqR0dUcWVteGZGSDg2QkxuaXNu?=
 =?utf-8?B?SHFQNVNtUnZ2Q291Y000TjlPVkxKTU5rYW9JblFrbGU1ak5UWUh5TElCNzJl?=
 =?utf-8?B?MStMbW0reXFnYVltVlhEMmRVU0hYdVRZQ0VmTndORmpHd2R4c0ZZRVpmTkNG?=
 =?utf-8?B?bWNuQWJ0ZnZXNlQ3cElYUUo2K0xHb08wQWhCZjhTY2p4Vkp4OHNRMWpydzBk?=
 =?utf-8?B?OWhtTGJKQjltcFNVQ3cySEFJRllLTnlFMkhiNklCbmZLOTErSDdlNC8ya1I4?=
 =?utf-8?B?eW94cGtPVi9qbkdjMHhkUUJqYXNrWnFVWG9BRUpITDhPblcybXREcG5GNW9x?=
 =?utf-8?B?UmtKUHRacUJYSGN1TW1qM0loL0V5Rkh2UFB5VjZMU2NZdDRLMllIRk5BWVRZ?=
 =?utf-8?B?RHNIUG9qdTZwZjRpaVhDWnFXaXlQcit3ZHI0TmRpczkydkhaL0pnbWdNbjdi?=
 =?utf-8?B?bnF1MGRkWG9BUHBFcU9YSXFMNm5nbXVkV2pmdFFOQURtSkd6QmY5QnBlWWxF?=
 =?utf-8?B?MnQrWkNadWsxaVAweE9LdGFkK0Y2dzRUN3R1VndRWkMxQ1lndGozblZ4QnVq?=
 =?utf-8?Q?CAmZY9Zz76lBJQUfifMFUzdj3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 514a0087-70c1-4de0-199a-08dda26d28e7
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 07:06:27.9622
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cR/+b2fWcOG0aZWxbwFBJDHl448lK5XXdFYs2IVwFe/KMIMucliyHCLwCVSiPoi7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR12MB9721



On 03/06/2025 09:02, Jan Beulich wrote:
> On 03.06.2025 08:54, Orzel, Michal wrote:
>>
>>
>> On 02/06/2025 10:37, Jan Beulich wrote:
>>> On 27.05.2025 10:21, Michal Orzel wrote:
>>>> There's nothing Arm specific about this feature. Move it to common as
>>>> part of a larger activity to commonalize device tree related features.
>>>> For now, select it only for ARM until others (e.g. RISC-V) verify it
>>>> works for them too.
>>>>
>>>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>>>
>>> I realize this was already committed, but ...
>>>
>>>> --- a/xen/common/Kconfig
>>>> +++ b/xen/common/Kconfig
>>>> @@ -162,6 +162,14 @@ config STATIC_MEMORY
>>>>  
>>>>  	  If unsure, say N.
>>>>  
>>>> +config STATIC_EVTCHN
>>>> +	bool "Static event channel support on a dom0less system"
>>>> +	depends on DOM0LESS_BOOT && ARM
>>>
>>> ... I think we should strive to avoid such arch dependencies; they simply
>>> don't scale very well. Instead (if needed) HAS_* should be introduced, which
>>> each interested arch can select. In the case here, however, perhaps
>>> DOM0LESS_BOOT alone would have been sufficient as a dependency?
>> What if e.g. RISC-V wants to enable dom0less but not static evtchn/memory/shmem
>> because there are some functions to be implemented and they don't want to do it
>> now? Protecting with just DOM0LESS_BOOT would not be sufficient here.
> 
> Imo a transient(!) "depends on !RISCV" would in principle be fine, if ...
In this case, how can I know that upfront? When moving a feature I need to put
some dependencies. At that point I don't know RISCV, PPC plans. The only thing I
know is that I tested this feature on Arm. So the only meaningful dependency is
& ARM.

~Michal


