Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E9B958609
	for <lists+xen-devel@lfdr.de>; Tue, 20 Aug 2024 13:49:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.780310.1189931 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgNLg-0004ng-6E; Tue, 20 Aug 2024 11:48:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 780310.1189931; Tue, 20 Aug 2024 11:48:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgNLg-0004lK-3E; Tue, 20 Aug 2024 11:48:28 +0000
Received: by outflank-mailman (input) for mailman id 780310;
 Tue, 20 Aug 2024 11:48:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WGdy=PT=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1sgNLe-0004lE-Pc
 for xen-devel@lists.xenproject.org; Tue, 20 Aug 2024 11:48:26 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20624.outbound.protection.outlook.com
 [2a01:111:f403:2417::624])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1a1590de-5eea-11ef-8776-851b0ebba9a2;
 Tue, 20 Aug 2024 13:48:24 +0200 (CEST)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Tue, 20 Aug
 2024 11:48:18 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%4]) with mapi id 15.20.7875.023; Tue, 20 Aug 2024
 11:48:18 +0000
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
X-Inumbo-ID: 1a1590de-5eea-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Af8gA0DHolEHp/ighUYdHIIYgR/FW7T/sa4GgrI6GCNOBtgicSsvX7DhoV2L4NhkyRR+UOU2Vt/A20ftSw38eIQJoHbrzPLBHDGfHj1k7D05dEbzWJ7TaYrSJVLI1j20f1kkpzzzmLoFGXqilyJInMzJVJEWLlbsQwx1ldMqngeqrgtrXZn85Pl5wxVGEPCoBFusweEj9X2rlMVug6qdNjolG9Lgq6i4o6L3z25CIFV/L+sRQX5msVe5B7ZLKG0jOZaOAK0INQK0TD2+wgVoOR1Ef9JGWRgjPE/cv7MJnzh2uZGoKIVSy+BfTB3/TP/pEd2DoofzeuWjnmKatzbv9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xnjWSxH+BV3jaBfhBiZBgKzEHYqQ6mDPDgE62TaengM=;
 b=NrC67s1OnWDZ6HUcuX6zkktH9lIJ+vP0nRKLOlsKOEpFPtIDf0EH2koCNGefILWj82qsbwpHZFoQwIbpGEmPuJx3sLJV8Fa5UQr+lHZ34avOxtkxpkukSptBY1AP8leSt/WJxle8a5QEfqJAnjg6cC/QtrtJc5D+4jWURoFWA6hHzBK30HYEaIy6rNho+zpNd6LUbyofgpr76ECZZoZia8/F3jcx/ShYy9Hu2liT9ZuMaZBbT/W3icblD1XmroH0Oe1Il7cKwIgE8mzZT3BjddWtC+dltOdq6z1nnqv3BLNTv0Gp00Q3hLLYpxY6w7eMOWIGCJ6/i3yvtBZVFCzoRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xnjWSxH+BV3jaBfhBiZBgKzEHYqQ6mDPDgE62TaengM=;
 b=yD80Rp640dd38cKvIiNhzhPt9QIw+uUW1DoUnBnFN6++dK9lOiX/ZLwYrm7YTLVM6rXQvlfiSJl0h3omH9OF0472n8k35/OHxfA/JWMjYSZ4Awum8LoDUmvRHBc906WRfMzc4jgJwl+CTqBjPf4Cm/R0LyQX5R8XMc1bDReFiHo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <e7882491-e916-43c6-ac61-12da83e9c086@amd.com>
Date: Tue, 20 Aug 2024 12:48:13 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] xen: make VMAP only support in MMU system
Content-Language: en-GB
To: Julien Grall <julien@xen.org>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: xen-devel@lists.xenproject.org, Penny Zheng <penny.zheng@arm.com>,
 Wei Chen <wei.chen@arm.com>, sstabellini@kernel.org,
 bertrand.marquis@arm.com, michal.orzel@amd.com,
 Jan Beulich <jbeulich@suse.com>, Volodymyr_Babchuk@epam.com
References: <20240813171356.46760-1-ayan.kumar.halder@amd.com>
 <20240813171356.46760-3-ayan.kumar.halder@amd.com>
 <6d333d94-80ad-485c-b024-a45a388b96a4@suse.com>
 <ef789757-8c03-4f97-9bfb-8ec2fd2f4ca2@amd.com>
 <dad27ab7-3cbd-4a8e-8200-adea52b26e55@suse.com>
 <597b358e-3b45-4fba-922d-31208b55d15a@amd.com>
 <9fd1801c-1460-44e5-b066-f6da1167543b@xen.org>
 <1a328f00-3b0d-4e9c-856c-97c3a80dfdef@amd.com>
 <febbaf82-5d9a-4bcd-8be9-93ac86b2c1bb@xen.org>
 <55a91ace-a76f-40b9-bdb2-49f816006612@xen.org>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <55a91ace-a76f-40b9-bdb2-49f816006612@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0112.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:c::28) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|DS0PR12MB7726:EE_
X-MS-Office365-Filtering-Correlation-Id: 675598e4-811f-40a2-32d6-08dcc10dfbf8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?K2xMNVVKTlVxSzcyYk5uSGlIb0VwNDBxN0tUVDdVTjdvdXZIRkV6WHIyNDhK?=
 =?utf-8?B?MUdERzVZcE8zWFVUZGVKdXQvMWtJL1Zob2VXYW51blU2WjYwNHN2TCtlRnNn?=
 =?utf-8?B?VkplbE1zVmlJZDJrN0pia0dDejFNbzBHVGYxeXFwckVRMlJRL2FuYitCaWlo?=
 =?utf-8?B?WjNzKzNmcGo5OE41MjZQaWVkcHNnelpxVDBSMG45Q3VIS0k2bVNXQ1llRWpY?=
 =?utf-8?B?L3p1eE0xWms4YlNBcFUzYzJyM09ISnVUbDFDL2VIU2E0SDZZUm1pRGd5Vlhl?=
 =?utf-8?B?SHdBejBHUnhBUG5xMlZIb3dsVVpkWC8xZHpGU0YzMGpPRGY5NDQzK0ZNbTBn?=
 =?utf-8?B?V1RHZkJTWW80VVdFNG81MTFZa0J6eitXNEtqZXdoRzdxcWhraVduQ2ZqVE5w?=
 =?utf-8?B?c0tyWkxQUWg3MG5kRUVoVWM1Z3hLSDNWUlZvN2ZwYUd2ZGV5c1I3OFhNK1FT?=
 =?utf-8?B?dXZ4NVZXdzFvRG5OMGZ5NzIxamxNNngxZnhkT3pjOFpsYjdSTkFsMDBnZ244?=
 =?utf-8?B?N3U5ajdPQU1tT2FYL2NPZWJhMEUwZlNZMDA5TzU4MVVncDNnZ05IbHlhMTFu?=
 =?utf-8?B?THROYi9mSHM0VWxCRS9Xd01IeEc4dFcrWTRGZzgwMzkvQUdyVHUzSUgwK1N6?=
 =?utf-8?B?UVlCTndYQnAvSW81emRWdGk0SGM4UVFIRG9NeXR1RWc0RjlBa3Y0eWJxRytR?=
 =?utf-8?B?OVFJMVduSDg3a3ZJMGptOTZQdjJGODdFN1J6SENXUGRNZ21lcS9sVktZUzlu?=
 =?utf-8?B?YlM4ckFxT1dFZjNXaFYxam4zOTQ4SG9ORHFRcVBPaWhaSU5YMXlLS2R0L1JY?=
 =?utf-8?B?RzQrSVVqcVpuTXRnTVZ0bmdmMzZyWVB6SUdESzFObXkzRys2K3FFOGJQRW13?=
 =?utf-8?B?dVVWd3NMTjlERTBuM3BKdWttSEFzWHhtUjZ4TVBHNnYrMW5IQnk2YmdUUnN6?=
 =?utf-8?B?V3YxdnFKaXMxaVBOVUpFbDlKWTlkVHlkTVl5TTVudldpdmtocDluKytENlow?=
 =?utf-8?B?OU9TVWl1YmhBZ1FSaXVSTTZ0dll6VGFTdWFlbU1qaUEwK1dNeTkwa1NkVkxa?=
 =?utf-8?B?TGNBam5Bd0JNNDQ2aFpRYU50QXI2RGVWRk8zSVBGUE9CVHdEOU9zMzlKOFRK?=
 =?utf-8?B?dEc3ZGNxUnlHVnhIcG9HREFGcmI3S2x5eWlKSVh3WXhlWk5pRms1M0FXb0sz?=
 =?utf-8?B?VExQdmdJRnZaUThGdEFLT0lvcGUxUnpLRWkwdS9kN2REL0lKT09ZSm10UkMr?=
 =?utf-8?B?SnZuakVoNkRQWHRCc01wR0hOVTkyNmZERFlyNmdlcnNJU1BlYnV3dXVFRllx?=
 =?utf-8?B?QTRLWjNDMmx4QmJxSmd3RFV4WTk0MnhneDhCYlQxTmZyVlVsUkJ4S3A1SHhF?=
 =?utf-8?B?enlqcFhlVmdCd1BQOURRZXp1b09rTXJkWEVPVkhpT1VBR3Robkw4Mm9EZGIr?=
 =?utf-8?B?QmtWaWdsQTJ3b0w4aUZTcGZIVXNvaVAxLzBpQTlmakx1OGZFU0pZSTBFL0NB?=
 =?utf-8?B?SVh2akMyamIxenBPcWtjWWd2a2pEQjVjekk1V0c3d2tuSHBkZWkyRENIVmpq?=
 =?utf-8?B?M05NNDRoMUJtRkE0UEJqQnZFb2J5MklPdTh2VGlCdG9KK0lLY1R4bmFtMyt5?=
 =?utf-8?B?dis1akhES3RpRytrenJFcTdxZklBaG53NHZHdjR0QVBPZEQ1TUpobHJHakJL?=
 =?utf-8?B?Zit2c3RGS0d2UmEzQnRSL3VpVWZVK1BibDFHUUM2RkhEQW1BL0xjZWNTSWMw?=
 =?utf-8?B?UUkxakd3NTYrNTdXc00wUmRSdEJxSTkvT0QwcEUydG5hWXRpWHhiOUgrS1VI?=
 =?utf-8?B?Nk5RSmNGZjIvbDRBZ2Zydz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TXdwNFZicU1hUUJvTUZjT0FtMHZQaUVsNE1qVTlqaWYrZG5UWXIxeGwrNkJv?=
 =?utf-8?B?SWVmV2Q4T1gzZUVJSHBiZFlMSTgyUzlhTllpWnF2dlQ3eno0ZUdCQ21yYnRq?=
 =?utf-8?B?b0dzZlpQNXlzYlMrSFZCdm5xU1o4eXM4d213QW5GZVF6Qmd0YVlnaW9BTnYr?=
 =?utf-8?B?UDFXUXliblhmT3ZwKzdVZWhZY1V1QzdrRWk4TlliWG95KzFOVUlpUVZid0Vy?=
 =?utf-8?B?Q2paZ01wSkVVRnZ6U2NScWJyMmtWN0Ewd3JaLzQzRHBoOW04T2I0TDdBTnR4?=
 =?utf-8?B?QjQ4c0ErdmdXdWwzaEhmUmFCWVl2ajhBVi91WFZFMGlnejdiTVllYm1JejBs?=
 =?utf-8?B?T3I2VTMxMmRuTjRCOURUVTZzUzVTejBoaGJ3SER0ODkzaStMTjRVdTlzaW9k?=
 =?utf-8?B?RnUvaUcyeFd6bXY2VUhma2phR3Zaa25sTzhaeHpLYW11RjBkd09ka1p2a1Fy?=
 =?utf-8?B?Szdid21JVGlPRWlVVEFMbTMxOUFtLzBXeTZwWUY3MTJpUms1Z1ZoblQ3Q01Z?=
 =?utf-8?B?WFV6Q1Nmc3diTW0zcy93SlI0RjNmd2hPNnZiVGN6bEx5RkxWMkFSdGFzeGVK?=
 =?utf-8?B?VVhHYi9tcHExVE9NMkRWUjdQTmZmb1VzaGZQTk9DdnBOY1VTYmtXcXBpUGcv?=
 =?utf-8?B?UUxUN2J1d2NQZXhzTHJXeXNsWnRTdUpPSDkvODRhdEROTlVxbld0dFpXUTMv?=
 =?utf-8?B?d2hvdHNnTk0wekg5WnRXUS9JclBwVTBTMFYweSt6eGduREdicDlvWkp1b3NY?=
 =?utf-8?B?bUp3NmprZFJCR3MvVjVYV0FUaFFJeWRRd0VhdVhYMWJRM25sQnNzdCtYQkZN?=
 =?utf-8?B?UGFINkN3NllMOXcxSGxqMXAzbVN1WmJaWWNzemFSOVdIMDJacG9tcXRIeWZr?=
 =?utf-8?B?Y1ZEUkpNOWxOQWF4dEk5QVlCL1BoK1JjdmlPTjg2eXZRUk1iaDVaSjhkbXEx?=
 =?utf-8?B?VVltbS9RQVpMaS8rT2pMM2ZtOE91VGwzOFdVa0tlYUVIOUZWUnJWM0lBUkgr?=
 =?utf-8?B?dFNQdHVoaEJOeWtJNENYSlJKSHRBbVZXY1hvZENsbHhRYjdnY25KbHI3c0xz?=
 =?utf-8?B?Q1dmVzRuODlkRGE1M05FUVk4eUZXWmIrMnBsd1FUcVBXbFV3RFl4ZmZoSEdI?=
 =?utf-8?B?a0pTMWRBVlFtNDRnRHVuSWpYUGZ2OVYyTWxISDdiUGRBdnBINzVFaWl0VXR0?=
 =?utf-8?B?bml2MlNublNiQkg0YVNCejlvZUNsTzRHU1pLUDlmb3dCRHh0c25nL2I1a3BY?=
 =?utf-8?B?YUk2TXBmMzZIOExHWlZxYW5ka0tJb2thUURwSGFWTkNNbW9UT0JkTktVRWw4?=
 =?utf-8?B?Nm5WZXorc0NxZUsrbmxlZERGR0V0dEFuaG5FbHE5NFM3U3QySnhtT0U5SGM2?=
 =?utf-8?B?NGFIZ2Q4aHZWcHdrVGpWcTR4c1I0LzRNVmpGenBENUp0YW1jRGNXdExTOThH?=
 =?utf-8?B?QnByOGh0ZElBTEsxaEdudnYxeG5mNHlPMUswZXhML3JqQzB6OS9pYXFjaHBD?=
 =?utf-8?B?K09BVzNNdnF6ZkxwZHVnOE1zbzMxTkx3b0VrL1krcEF4TU1COEJCOFBlcW5q?=
 =?utf-8?B?T215Q01sbEhSZ3NObmU0ZjVYM2JMZE52a21LcTFiWjE2YzUyV2JBUjFSR2p2?=
 =?utf-8?B?R05hdGxJUjBjMm5kN0tQdVU4b29Tc0UrUjRJUHVqcm9YQjg2alo4bUFnZ25o?=
 =?utf-8?B?anN2UEFtOWZxS3NPb0RNVWRFdVlsVDlwdzYvcjVobmhwNkJxOE9MMllJUTdq?=
 =?utf-8?B?d2xtbVhvM0YxbE5zc2ZuM0lJMWUraGFGcGYrU2ZRQkRocjduUGVDb2NXTmV1?=
 =?utf-8?B?OGxzK3dNOUt4N1RmbnFnZTZUTXhoR0VmUjhaNGlzdHAwT0E2U0Y3UWpFMis4?=
 =?utf-8?B?K2I1VHU3WVU5V2UzdFkweElnWGVxSkE4bHIrVzV5SzIrNEVmSnV2Q0NRaDcx?=
 =?utf-8?B?OXczWUFJOXJ4SXY4ZGZWSHNCRUpEODJ3R1lUMUF6YytmaHJzTkt4TVBONkFW?=
 =?utf-8?B?dGZOMVVsRTJNZmV6NHFOTkIzU09QeUlidmh0VDFYTkJMQkR5ekF5bnVFN0lD?=
 =?utf-8?B?cnh4eDErVk5VelhmaTByY2dYZmdLdkdqbEc2dzBTRWs0R0Nob2NhUlBZWkda?=
 =?utf-8?Q?u6Htv1V7J/f9Zkl617Hj836FF?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 675598e4-811f-40a2-32d6-08dcc10dfbf8
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2024 11:48:18.8164
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PxQx3Grp52zht/cyt11wFnLdEmiCSzz/S1bWoQ8+tcJKnY3klFOnVTU2Uv0uTcplTVbzRBRbpUQTpqdx9MWibw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7726

Hi Julien/Jan,

On 19/08/2024 10:58, Julien Grall wrote:
>
>
> On 19/08/2024 10:55, Julien Grall wrote:
>> Hi Ayan,
>>
>> On 19/08/2024 10:45, Ayan Kumar Halder wrote:
>>> I am ok with this. This has the benefit that the change can be 
>>> contained within arch/arm if we do the following :-
>>>
>>> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
>>> index cb2c0a16b8..26f7406278 100644
>>> --- a/xen/arch/arm/setup.c
>>> +++ b/xen/arch/arm/setup.c
>>> @@ -329,7 +329,9 @@ void asmlinkage __init start_xen(unsigned long 
>>> boot_phys_offset,
>>>
>>>       setup_mm();
>>>
>>> +#ifdef CONFIG_MMU
>>>       vm_init();
>>> +#endif
>>>
>>>       /* Parse the ACPI tables for possible boot-time configuration */
>>>       acpi_boot_table_init();
>>>
>>> Are we ok with this ?
>>>
>>> The definition of vm_init() is in xen/include/xen/vmap.h. If I 
>>> enclose it using any CONFIG_XXX (like I have done in the current 
>>> patch), then I need to introduce it in common/Kconfig and define it 
>>> for x86 and PPC. I would prefer to contain the change within 
>>> arch/arm only if possible.
>>
>> Just to clarify, are you suggesting to just protect the call 
>> vm_init(). In other word, common/vmap.c would still be included in 
>> the final binary for the MPU?
>>
>> If yes, then I think it would be a bit odd... Someone could still 
>> call vmap() and this would not break until runtime.
>>
>> So I don't see how we could get away from modifying the common code.
>
> Readying my previous reply again. I think the confusion comes from:
>
> > But maybe ARCH_VMAP was an incorrect suggestion. It might be better 
> to gate with the !MMU (IIRC this would imply MPU).
>
> This was specifically referring to the branch predictor Kconfig. This 
> was not a suggestion to avoid introducing ARCH_VMAP.

Thanks for clarifying this. Yes, I misunderstood your previous comment. 
So I will do :-

1. HARDEN_BRANCH_PREDICTOR will depend on MMU.

2. ARCH_VMAP will be selected by PPC and RISCV. The reason is below.

3. xen/common/vmap.c will be conditionally compiled on ARCH_VMAP and the 
"#ifdef VMAP_VIRT_START .. endif" will be from removed within the file. 
As VMAP_VIRT_START is defined by RISCV and PPC, thus #2 is needed.

Julien, Jan :- Please let me know if you are ok with #3. This was in 
response to Michal's comment. While his suggestion makes sense, I am not 
sure if extending the changes to other architectures is the correct 
approach. Or do you prefer keeping xen/common/vmap.c unchanged.

Kind regards,

Ayan


>
> Cheers,
>

