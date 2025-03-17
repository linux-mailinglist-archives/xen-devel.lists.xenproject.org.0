Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 798F2A64675
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 10:01:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.916326.1321432 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tu6L9-0002QM-US; Mon, 17 Mar 2025 09:00:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 916326.1321432; Mon, 17 Mar 2025 09:00:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tu6L9-0002Ne-R1; Mon, 17 Mar 2025 09:00:55 +0000
Received: by outflank-mailman (input) for mailman id 916326;
 Mon, 17 Mar 2025 09:00:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WXuz=WE=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tu6L7-0002NY-VX
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 09:00:54 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2060d.outbound.protection.outlook.com
 [2a01:111:f403:2415::60d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 530d3d55-030e-11f0-9aba-95dc52dad729;
 Mon, 17 Mar 2025 10:00:52 +0100 (CET)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by SJ2PR12MB7800.namprd12.prod.outlook.com (2603:10b6:a03:4c1::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Mon, 17 Mar
 2025 09:00:48 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%6]) with mapi id 15.20.8534.031; Mon, 17 Mar 2025
 09:00:48 +0000
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
X-Inumbo-ID: 530d3d55-030e-11f0-9aba-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ciq4r/a/Y2QLGG2tzlMHjo3GgMqxjxJb+Q0wGvL82zUWwrMFtUHciZDUXhil+qk0yHG1CMy/pAsbeU4H8NlF5t4k75ZqPqfo+QR5+c2QV/KVSWcF3UqDHIIduEG9QVuMaiN0x6SnaomSvJFo9BEGXo4Z7k0xZNIkknCOw/hHexWku2zwYM2xLcAS68l/zewtrWfjvRxaeBCNoCOCI2CnTiBqRSqu255S0OZ1vv6tDRNnQOR3hMrCvfPjHY09yiFNg0QFQBjg30dNRHqe2PV0ftnnQ60bPHAzCDejBSSZgRvDPKk0axHkeo1iu8qkL1X/Zz8Zv1C4sydx/qC8dgImGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+VGNUOtZRvYa/vWVos/U9WZaX0EGPke5R4b+qR13hjQ=;
 b=Ek7RUM30fvSVIOJGrWit/uWooCI04q1pHY/oK0mQhzV1cpqYz3O2/aQ7uVtLkT0u8gal+czzfkJWFcw0SkDkAM4u2TSSwLWmXphTJkXrfvc2ne9tdegu/pIxlSlQ55MrgJyNylQRpGccGHhLahhqWcEwAV56lP0HysHkk1Evcoc2P7rBiJMtmGArfOqK/VNH0+3pfN+SC6AoVTtxabFjNy7BE17saHtJxyId2tsX06Wj6KujWjwhLJXtgsYYeNJZavmxJcLEgkRh1QzbKGW+Kq4thDFL/KdFJwrOzjP5PyHpFaO+hpdjFmaBuX0RvxzoSNI5/uNoic45d9kPXJAJnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+VGNUOtZRvYa/vWVos/U9WZaX0EGPke5R4b+qR13hjQ=;
 b=d3LT+BKPXbOJeiYFEtz2l5RPgdaZsZReX2/y7O2g8TBgnXWiz2Zg+OFE54AGmfk1+qz/6SPOvz6QAB+BrSPT8rYak72J3vBSxUJy/PEM5RrweDwdP9RyQcU00NVge0cRdwJe14L76CYFTT1ntupZwfU8uEiv78nIxpIN4I0Nc/Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <0cb850b8-a2c4-48df-8a99-6b8fd0b4bd69@amd.com>
Date: Mon, 17 Mar 2025 10:00:44 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] xen/arm: Implement virt/maddr conversion in MPU
 system
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: Penny Zheng <Penny.Zheng@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Chen <wei.chen@arm.com>
References: <20250316192445.2376484-1-luca.fancellu@arm.com>
 <20250316192445.2376484-3-luca.fancellu@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20250316192445.2376484-3-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0076.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::6) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|SJ2PR12MB7800:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a21c367-0edb-4be6-c070-08dd653235c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aXhZUmxYcEFYMWoweXNVYlUxWkIra0RydUJ4VFh3Z0I3SHBXRmV6VVVIYnhP?=
 =?utf-8?B?MndNM25oMi9LdUl6aytxSEV3TDV6OUpDK1B0T01OcnFMc0dMUEpmSHBNaVRK?=
 =?utf-8?B?Q2RNaklYYkE4NDQ1eDdrU3JXRHRtYzlBK3JDcmM0aDZsRnhIalZncWRhYU5y?=
 =?utf-8?B?RHdmdEl0VDVHTWU1MTdESFF0UVZ2eEI4elZRcWtWa2VrbWZ6TzRkN0g2ZnFo?=
 =?utf-8?B?bUF0VTkxV1N4N3hFNmU4VWQyOXJmNEh3SS9UdUt3emRubFRPbnptNzJNMGlB?=
 =?utf-8?B?azF2ZllXaFBFdHNrcXFaNS93QnM5RGN5S2wrclRubmMyNDI5Q3RJTEZvUDZu?=
 =?utf-8?B?WEozUGVmQ0REWFlkekFRNnNxUGVCR1FldWovYnZLbHFMSXFHbFNTVzRacUtQ?=
 =?utf-8?B?Yjg2V014RDJCNng3YzJ5YW1WTXNYa1ZzUXM5VWRtUUZ1OXFxdTllYkRKa1I0?=
 =?utf-8?B?QkJJb1dvdjdlSzdpOUk2OW9WZkFOTFRRcHdXRkd4RHhQemJOVkxVTWZ2clV2?=
 =?utf-8?B?THdhdHVGM2N5QnVhZDRYbjAvT1dlVWkrNGs0N3M5LzQxRG56ZldxdHZjZHBG?=
 =?utf-8?B?Zk9iYTNnOU1OQWR6a1FNYmptQlVIWU1iRjROSXZ1WStQL2hHVS93anZwR2Iz?=
 =?utf-8?B?T3dsNUcwVTZLa3F4QnhON2R1WEtPQ1ZPSnhYbDZyOVZaME5sSnpCNDdnSHBw?=
 =?utf-8?B?VzNVS2d1SDgvUTJjeHpqYlRCK0wwb1ZGZFhXcGVQVVN4RVpiMmQ4TVpjSjAx?=
 =?utf-8?B?ZzhPTks3NXEwT29idkZpTHpyVXU2dFk4RktXeGhLUnd3NXNUMkN6aTRaWG40?=
 =?utf-8?B?RklyRzNuMkI2Y2RSdDVRM0U1STZDOXFncjRjbVRySEU5R01tLzRNTWYyUHB3?=
 =?utf-8?B?SFFtMnRCMHdZbmtIT3gxUjhTZ3pndVgzSU8zOHdBems1alp3VldsM1o3RjRV?=
 =?utf-8?B?NUExSWh0QmRYYm5LZkhKTWtmNy90NENyOHVKb0tQeFNKcjc1U0hDalZSVUM0?=
 =?utf-8?B?VHdEd2VUTkVtdVR2UkwrWlhpeEQwUGsxQUtwaTcrbnh6dEcvdzBiamwwSVl4?=
 =?utf-8?B?VkhwaWo0aWEvbmxoWTlIT05IUFU3elVXYmRVSzF1TkV5K290bHF6d3lVSmhx?=
 =?utf-8?B?ZXVPZGI0VHRjUXVsVGRldURuTGxsMmMyano0YTNrNUdpbG50QnNZdnY5a25i?=
 =?utf-8?B?bnNCS3JwcnJlWXhBVUs0Qk9NSmpsM1RPd3lpVHI3YktZbzM0Y0FNbVBXUFNK?=
 =?utf-8?B?YytkaFBsbjNMNElnVzNMZ3I5UVZnd2oyUWVYbUNhRjFSMnBEOTFiSStkbEVz?=
 =?utf-8?B?ejdWQWw2RXVQZWl1Mld3Yi9QbUo2VDBxazVnbTQrSW1CcnpyZSs4TTNyZDUw?=
 =?utf-8?B?d0JYUDZ4NWxQdGp2Nm5oLzJSNzQxSmxpUXRUR2dTTXBIVUpLdGpTdCtiajN4?=
 =?utf-8?B?anpsaEd3L1k5YkROOVNraEJSY3RZSDRnQ3pJNFo2L2RmVG1mUnlLb0VXSm5C?=
 =?utf-8?B?VlJjRjFSem1vR0tDR3B5NnZPU3ZLNDBMZCtNWWpCTDlJaEw5TlY0SEtYZnRC?=
 =?utf-8?B?eVk2cERuamwwYklmNG1FVGNqMHJzYXpIRnFLTDltcnpYRFN6cm5mZElBdkNI?=
 =?utf-8?B?WGl3TEdvWEtrMW01TDJ5dE85d1FmMXU1aitrWUhCaTdrOWpvR01Ed2tyWnNP?=
 =?utf-8?B?eTJOclc2MVRnZ1F0SDJmR0dSOHNqYzgwWXA0RFBxZFI4Y0RuTWJsL2t1SitZ?=
 =?utf-8?B?clVnR3FodFNOTTg2UzkxK05lcitWcXh6eEFaUkUwTkt2ZU5WQzRaMU1zTnZi?=
 =?utf-8?B?MjlLdG5qemRtS3pUYVdWSVEwMS9LNndpQVYyazZ4T0c2Q1R2dnZtVGh6My9j?=
 =?utf-8?Q?ozaL5X+w67pTF?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aW5mSFpCR2ZzYXhsOU9vL1diNFdqandDdklnU2VxdVhtWVNzTkZ4YXFMaWVS?=
 =?utf-8?B?RWFnbzI2NHRjS2dwVHJaUlpUQjFFdGwra2NXNGFiQW9OOG4zNmRXQVFmU2hL?=
 =?utf-8?B?TDhBS0JZVE1hejZ2d0h0dVFocjB0RFZMZ0VhT2NXd1FRV2hoK3cydWhzUkxr?=
 =?utf-8?B?TDBkUjFFMStjai9objB2MnpSNUtrVEJLOC9ZT3Z4YXJJNXg3TzJZbDdzaGEw?=
 =?utf-8?B?UW9CZlBZM3ZleXhMb21XQUtvemk2Vy94N1ZMNzVKM1pNZEozcnJGZnpnV3l2?=
 =?utf-8?B?V1BmZW1mQUhydnNCOU55ZzJKQVVmUHhtc0M0ZUdEZy8rd3ZjbENNT2FKd0x4?=
 =?utf-8?B?dmJyUWFmTEZWTlZyVnlXY1UzUUU1L1RTSTZyblFOc2t1SEJRNW1ZeGd3STZE?=
 =?utf-8?B?djhYdW0wUkpBanJaV1NMY0lsc0ZZRU5WQjl5Z2ptalZMZ3ZDZTBrNE5FQmNI?=
 =?utf-8?B?aVVIUmw4WHkyVkpYVmRkbGI1QlBXbDlNWVlxUzhtOGlrUUgxNlkveXRsY1NV?=
 =?utf-8?B?bGVxdnZPNllRZUNQUk5jMVFqZ2FBU3dxL0RvK2cwT24xNUlBenBBNkdrUklE?=
 =?utf-8?B?TFd1ajJXOUNLcnVqaEQzRjQxSUZsU1JvN2c0ZmxFZUtQV3diQlg2cHBRd2Zo?=
 =?utf-8?B?QWR3Syt4M1hNVkhSMDBPRTkzMDA3c2hvSTA2RHROaStmSEx2NmxxS2lLU0dE?=
 =?utf-8?B?R21JSnJrc1B2eTN1ZjRJSklCVzNSblEveExYd2pOYjBmYTY5VnBVRkN0U0Jk?=
 =?utf-8?B?UG9QdzR1Z2NsRHJBREZBY3VVNGVaUXJDMko2RW9FdGJuSTBPQUlQY3N4bXBt?=
 =?utf-8?B?Mnh0VW1RZGQ1cVlFRER6bWdrTzd0bytXS0FhTUw0ZkpQS2dUOHpZVXpicHdY?=
 =?utf-8?B?TWg0d09PWXVhdUlKSGd4aG5ZOGdiL2lWSjNGL3hyWEpMNDdmMzRMZlVSTXVk?=
 =?utf-8?B?azRtYkliQjNzcUtqMk9UYVVrRHk2b2V1L05HS05qbUFaWnRDa2J1TFlaZ1Fv?=
 =?utf-8?B?aU5IeGxCWVlPVUJyd2g0RHA5NHNrdUlCdnoxWkJnZ0ZaeVV0KzhoZEVHU1Bv?=
 =?utf-8?B?NHBXc1cwSTFIWGFYOUNjZ1c1RmtkK0Njc3ZWTkRRbUxvd0ZiTlJjdzFXMFJT?=
 =?utf-8?B?ajBiYzVmbjQyMU1FZ3pKOFp6SlQzaTI0aXpVZ1l1ME5LZlBQYTM5YlRreERi?=
 =?utf-8?B?WmR1eTlBc29pWlhHYTdqdjVwNUFUeHpwckFyTjVkN3Z2bVQ1U1pKNTkrVjJJ?=
 =?utf-8?B?N01uTzdYeFAzcXZnc2lPUjdRMEFSeEp1WGQwamVMcHlLR1V0aDRwcmZ0N045?=
 =?utf-8?B?MGUrQlNSR1krY1o1d2VhNmtOYXg2MDY3V3JTM0REWThvdC9uQ1RoZCtiR1Vm?=
 =?utf-8?B?aHlBQ0RpOGxUdVgyeXQybU1uL1I2Yyttemkxb2UwZDNDS3hKYWR6YUdBNDd4?=
 =?utf-8?B?OUNRKy9FaGZmOHdKR1FiNnBmRnNPdjduT3JQeFgvcGxQMmJ5d3RNTDRvM3Iw?=
 =?utf-8?B?b3VTTEYrc0YwWHpzQXVibmtNMTNLMXhNM1NScnQyc3RyeXNVR3lvRFlrN1V6?=
 =?utf-8?B?dWJrcCtqSUk1ZHNlQUtBMG5xcnRnOFcxajdlU3UwcnMrcDBydUFXaklBcTVn?=
 =?utf-8?B?NjRMVGxKS0QxbjhvMG1YRnR3b3U0RjBjeloxUVhVaGZtcTk1Ukt3TnBjYVpR?=
 =?utf-8?B?S3luVGNUNmdjNW9vMDQ2cnUrVWpyZTdjWTQxMVhIcDRpdG1LVyszVUI2Mlcz?=
 =?utf-8?B?RFNhVUdQZlcySklrdVcxL3FWejl4ZUdNaXNkRW9mTjVETlQxZzhWRlZ4N0V1?=
 =?utf-8?B?NkhRdDZDREE2cnd5TnJTVWxsTEtRK1BLcUZoaitTRU5kR2M5UWY1WGJnYUZ0?=
 =?utf-8?B?eVdKZThxd21Tc3BySzlSMUN4cDhKdFZ0Q3BCZndXNVloaDN0QUZFalBpMjFz?=
 =?utf-8?B?eE1KdXQ1K09kMUp1dzdJaHNqYTRiZHZSKyt6NkJwUlF3M2VzN1J0cXlodVcv?=
 =?utf-8?B?THJRUDZKcGVvV1ZVTDV0OTZ4bTQ2cGtabHlRRjlRT05aNlE2cVZGcEF3WUJY?=
 =?utf-8?B?eGNUSzRqUGxLRndYYjFmT0licXpFMjYyOW1qdlRuUjhnVTV3YS9jWjFXZUsy?=
 =?utf-8?Q?rBQI=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a21c367-0edb-4be6-c070-08dd653235c9
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2025 09:00:48.3717
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mVxwB8q3j2UyFLfF7lLVI+1wqRRGouOO8mRUgLg2U7jdJHWIts5jGm+fZllYMS+C
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7800



On 16/03/2025 20:24, Luca Fancellu wrote:
> 
> 
> From: Penny Zheng <Penny.Zheng@arm.com>
> 
> virt_to_maddr and maddr_to_virt are used widely in Xen code. So
> even there is no VMSA in MPU system, we keep the interface in MPU to
> to avoid changing the existing common code.
> 
> In order to do that, move the virt_to_maddr() and maddr_to_virt()
> definitions to mmu/mm.h, move the include of memory management
> subsystems (MMU/MPU) on a different place because the mentioned
> helpers needs visibility of some macro in asm/mm.h.
> 
> Finally implement virt_to_maddr() and maddr_to_virt() for MPU systems
> under mpu/mm.h, the MPU version of virt/maddr conversion is simple since
> VA==PA.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>

Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal



