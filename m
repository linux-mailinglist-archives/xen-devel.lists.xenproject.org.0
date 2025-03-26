Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9491CA713E6
	for <lists+xen-devel@lfdr.de>; Wed, 26 Mar 2025 10:39:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.927391.1330139 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txNED-0004HL-44; Wed, 26 Mar 2025 09:39:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 927391.1330139; Wed, 26 Mar 2025 09:39:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txNED-0004Fs-0b; Wed, 26 Mar 2025 09:39:17 +0000
Received: by outflank-mailman (input) for mailman id 927391;
 Wed, 26 Mar 2025 09:39:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a+/s=WN=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1txNEC-0004Fm-6S
 for xen-devel@lists.xenproject.org; Wed, 26 Mar 2025 09:39:16 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2062e.outbound.protection.outlook.com
 [2a01:111:f403:2415::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2a611d94-0a26-11f0-9ffa-bf95429c2676;
 Wed, 26 Mar 2025 10:39:09 +0100 (CET)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by SA1PR12MB8163.namprd12.prod.outlook.com (2603:10b6:806:332::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Wed, 26 Mar
 2025 09:39:06 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8534.043; Wed, 26 Mar 2025
 09:39:06 +0000
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
X-Inumbo-ID: 2a611d94-0a26-11f0-9ffa-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XQLqiFx0cFtP6ur5HPuV8x6VtrxdIPo21+QdE2IdiQTHJsNEcXYy0xnXk/MxDSiluFc8uer29ejX1t2e9xB1g0xM51tek1OR1uhzIVXL2fc1uvDZJ3uvoB8M2b9SxOeJUmbA/Cq8q2IOLKGsO4KsOH2r6Yeo8sUPVQbsTLp83qOMFPcxIQS7MQ6G9fHCOrxu7XSpMCKNGddhsIReQkg+9bp9vBbpb4N2qD3i7+ViyQ9IuaNG3uU9mCf5Lfw8uRLv5BoxKDWOJWvZR3UyKvGx0K02ceTsT0XCJmQTO1i/+FjXtugil3WiTkFc6CO0SOrW+dCGUPLSznrc1us+izCr+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7DstXOYdcYX0FnEIar3Xz4RK1/wuv11/KK9CpY6UzZ8=;
 b=wcSWtjFhy37yg9IT2V44PS0PTW7oGUPUwymZEYsQgRijuJStAcNAdma7Kj/i/RZr/rebP+zirSfV410myCbA9OMA2peoJ6RYGWj26BCl9HbdCSlqKFQ47a1Plsk7ASL+opXa/tjxB4d5m+nixGiGbJqpA5zksUPB4g7/d8s8IMK+lJtWyYAGqd1sheqXTX5ioWxtlZdlLHduc4ykICFjbyjgb5RFxNAK8KnV1hWIicPByG9zQ05709KGqNZyB/oY/5gjj0LXT/8zP5mPvZG57G5qTh6zPDENWjrTZPvj9c9uU1Cl8wUS94m7yy3Vctw19/7QMwBiPFLWP9BA33N4qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7DstXOYdcYX0FnEIar3Xz4RK1/wuv11/KK9CpY6UzZ8=;
 b=woq9Z2WQpNr78DK4g7uW6UuylOUDImmWkpgwgCw2qfm6nzKvNGQyP7I0dw3n+pYG0O97+rTfQ6vPp7IEZ9lXhrczQnEkn7Av/t9bSCxyTlbVJ+xlIZlvtdruy+Ez/jM2ZiM5KJeNQxeSTQ50XMqJbP2O/RNed9rgwDa60LE/KzI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <0957c74f-a53d-4107-bc8d-e13d7c308d39@amd.com>
Date: Wed, 26 Mar 2025 10:39:01 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/7] xen: introduce Kconfig ARCH_PAGING_MEMPOOL
To: Jan Beulich <jbeulich@suse.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Luca Fancellu <luca.fancellu@arm.com>
Cc: Penny Zheng <Penny.Zheng@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Wei Chen <wei.chen@arm.com>,
 xen-devel@lists.xenproject.org
References: <20250317200727.798696-1-luca.fancellu@arm.com>
 <20250317200727.798696-7-luca.fancellu@arm.com>
 <85ba02a9-f9f9-4141-85be-a9a2d431e450@gmail.com>
 <26583ecf-4057-46b1-8f87-f4589d7bec17@suse.com>
 <136cf1c5-d1e5-471d-b560-51632b444e41@gmail.com>
 <94865aea-043b-4f52-adb8-d2d78dba293b@suse.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <94865aea-043b-4f52-adb8-d2d78dba293b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0396.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cf::10) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|SA1PR12MB8163:EE_
X-MS-Office365-Filtering-Correlation-Id: a9279b46-997e-49df-1a2d-08dd6c4a0d30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UHQ2dGxRNkFwaHJ4Uy9BVHVldEhCb3Bud3Q0T3JzQU53cDNiclVIZWI1dFMw?=
 =?utf-8?B?WXcvdGFFTTlia1gybTZjeFEwc3RITnFneUhoNFlESG05MjBLOFd5V3l2OWRw?=
 =?utf-8?B?Mldac1hndTJVSWszNU05YW02aE5pYmNhYUpLZnZxOXBQMERNdjY1bHhsWGpC?=
 =?utf-8?B?ZHM3c1JmbFBJMEJvOW43dTBkRzJrOUxXb1FhK2FZZHN3QzVDcFEyZUk3M21j?=
 =?utf-8?B?Rk43WHlrRFJuZ2s5LzZlMkJuY0IvMDRPZy91OWtJU1RScCtYZFhuRnc1dk9E?=
 =?utf-8?B?Kys0MGdLOHBON0g0ZHBOSi9SSW1vMDF5M3RQN21Oem1ITGdJdlFzQjZyT1N6?=
 =?utf-8?B?a2JLODZMTUZJaURHanJNckZEelQ0SEtEclBpUThDY0ZLVDJDYXp6NFZXdnBr?=
 =?utf-8?B?ZE02bjNNbUE5SjZPSXJhdndIVVBBR3dtanNndWhNZTNUbDMrZ1lnWWh2dHJ0?=
 =?utf-8?B?dEVyeUZLMS90UnVjQ2owcVl6MnZGclhMR0JIdHkzSDRnMEs5RDg4b25PNFJK?=
 =?utf-8?B?Y0N1MHduZEZpSHRlakkybHhjTkJZQm50Y083MldESFNQM0puUDZOc0o5dUVx?=
 =?utf-8?B?SWtTaEptRWJDN1NyejljRGY4TnJ5TWdDSU5UMFh0VUtMakx4dHl3Q1VwNWJZ?=
 =?utf-8?B?RFB0eFlpZlBvRWlaYWtNbEhzY1h1Y3hJUzFSZUd0dEV6TnhCY29KajY3bWdQ?=
 =?utf-8?B?blk3Mi9LYUN0dWRHQkhrb1BpVnk2TzIzOXpxU0xkbGQ3djdmYmZ3WVRMbnNQ?=
 =?utf-8?B?WmttTjBHZmh6aXRTY3RLMTk0ejZKaktjK2l1NjhmMC9UY3FZdEpTK1ZBQU00?=
 =?utf-8?B?UStCTHlhc2FTdWRnMFpNajdzTVlrMU8ySUJrTXhnU2VKSE5aVlU2TVdxKy9E?=
 =?utf-8?B?L1UwRDEzQW1oR1NEMnRDZTE4VmtEdE9uYzNDOHBuR01POEtjT1RvZnFUTWl6?=
 =?utf-8?B?aS9zcG02Zml0TE1RWVBBbXlQZ0lqSnNxdVMvRzRWcTBtS3dqNW5OSS9qbTdE?=
 =?utf-8?B?MmtkV2xXRm01SjA0bXQzb0FSUnBJN3RIYkptS0lpMU9JM3BvR21HR0JmSWNR?=
 =?utf-8?B?dGxaN2NHUW93UUpldFpCdzJJelFhc3h3R1dySkV3SE5kYlpiRE02ZisxejhM?=
 =?utf-8?B?YVlLejVRcmpqLytPZmM1NVNkMVczckRNMEpIQTlybkRVSC8yMTUxVE5OOVZn?=
 =?utf-8?B?SnZFYklNZHBrZWw4WTJ2azNwNDN6Q01VQkY0cmZTbkZEdHQwaEN1V0VUT2Nj?=
 =?utf-8?B?c1FidVJoSUpvelExK3FpcFoyTjNWRjFvU2pOaGYvSDlPVU94MCt0Q1F5MUV0?=
 =?utf-8?B?KzFhaDI4dEgxSG9SbGIyUEwwajNSM1djZmJ5Sit1cDFLRW9zZnI4VTRPQUI1?=
 =?utf-8?B?bzdGODc4VUNZQnFvYkZ4RXpxMW94SGRObVh2enl3WWhCTU16Qmk0VDc1OENG?=
 =?utf-8?B?MERtYkZja0diMFJyVlVaV2xMSm4rQjFGWHNMS0w2eDVRWHpRaUEyT25IU1oy?=
 =?utf-8?B?Rm04Y1JMZEFVVjR5dEpNUWw1Z1ZkM2ZxdnNLK3FyTHZaMkVqODhWSUVDU0xM?=
 =?utf-8?B?YzBSd3FQZ1NxQjdvZjY3VE8wMU1aV0EvbEJ5VXp2R25XVXZ0UHVEQ3JKaHBW?=
 =?utf-8?B?QThYWCszMXFoZTV3Q3ZrcjB1a2l2SzRRamt1Snl3bXBHNXdQdC9uMHczN2xI?=
 =?utf-8?B?N2pmclc4VnpoWDB0RTNONEFCT0lyUU40bExHSWJIU1ZndCtzRWF2eTRuYTY2?=
 =?utf-8?B?SUxjSDZtMXo1dUdLanZReXRlbmlBWDlYTlVzMDBhVGRuZjQxenFYbGdYaCty?=
 =?utf-8?B?L3l4VzRzUmxMaVVjMk9TVHQ5MnFXYWlZTW41RlV4c1dYL2FJeG5NN2xDZklw?=
 =?utf-8?Q?XhzJqPIWcL022?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UjlIOXlKRWRHakR3MlkxTi9aYW9MMTYzOXR4U2U4ZUQzNjZ3Y01Majh6K0Yw?=
 =?utf-8?B?VGpXK2o4UmhFZE9oejBlVHJSN2N0ZEZ2aDJmVFQrVXUySFpOdDE1M21IWlIv?=
 =?utf-8?B?dEdvZ0xLOTJmakJpZkNhbmRuV210eHVoTW1Hc2Rzbm5yelJHelNSK2NPdmwz?=
 =?utf-8?B?ZUNYN0Y3NXhEK0tsUXljS25UbGgrcHFnUmxEUk1IVXJXZks3QkNtYXVYZExX?=
 =?utf-8?B?RGpNUnhvWitCdkxBQTNBNmVLOXAvam0xaFNOYUFodXpZRVcxS1QwUnRvNTJ6?=
 =?utf-8?B?Tkx6V25tUVhyeGc3ejE5WGxER2Q1aGU2UFA4dnlPVWRqTWdac3F2Q0pkUUEv?=
 =?utf-8?B?QzRIYzVCUStwOFJmR1hxZFNreHdiUVJ0eVg4ei9OSnNnWXBTTW5HZE11TFZK?=
 =?utf-8?B?c2hUeldtSUczUm9MNlFUREZOQ3Y2c3RrQ3Q0eDdYeENCcFVJQXpQdmp1RXQ3?=
 =?utf-8?B?blVrbGhVVGpDbkxLMzNEdk0wTktUT1QzNndGbkNzRlVXak1FcFVtaFUveEp5?=
 =?utf-8?B?bVBkcDk5MnN0VFBSUm9ubHlqL3oyQjFTckxPT09zdTRkOEk5Nk1PbWdXU0Q5?=
 =?utf-8?B?NDN2Vk9UTVFqTTZvWDVES2pHUnA0R3ljVHZsSGdITUJaTGp4RFVtMGNoSmZj?=
 =?utf-8?B?cTRpYWVpUWFQL1Z5YmJtUjgyTDJLdFVsbzRjd1h3aVl3Zk5oLzR3QW92Zk1w?=
 =?utf-8?B?eVdwNkttMjZzYTRXeG5MK0FublhITzhVR3ZuOFBQUWdSbzRzYzk1UTA4TFdv?=
 =?utf-8?B?d2EzS1crUmRFRUUwSnhmME5sbFRjTjZaQU1zeEFLbGlqSDlrSERtSlA2R0k1?=
 =?utf-8?B?VHZYMk9DUnJvMDZDL2ErUkEvSWNoeDJVZmdTQmZ5cFF1TERLVURxbU9aZi9u?=
 =?utf-8?B?UHVhYjBqa0huNGxDOW83bjM1WklsdG9hNFZlU2h6S243bVBjT2V5TWZLcGoy?=
 =?utf-8?B?NTUvY1NZMERhNSthVjIvb2UrWk9CMGhINEozWDZZT09Nem9nMm5ROUtYa25Y?=
 =?utf-8?B?dG5pZ3lpcFNUZ2JJcFI4KzJHL0dKUmVqdCt2VUo3K2lkNUVZRXMzUTVYTGg5?=
 =?utf-8?B?NFVQUjU4MzdOSlg1K3cyTXE5RmRmcnk0SXBDdldvSUh1V3hHajBwaXQrOC9L?=
 =?utf-8?B?TWNUMTgzVzE5Qjh4QTlZVkdOQVQzUWQyTEdzb01uOTZKa29HM0JRM2R1YlVY?=
 =?utf-8?B?em05Vkt1a3pKdnhGV3ZHN3I3YldIMUdTN0xGS2xVZ1p4STRwYmtmRUpsVjcx?=
 =?utf-8?B?cDhGeHRhT3M3TFNkVXNjOStBeUdQbWJuYzM2c0ttalNWZmlNUFlvMzFKVWt6?=
 =?utf-8?B?MkJhcEZQREk4MHVHNmpBY29MMk9rZFJkNXVKamJPQmJsdWFZUkdCSVM0Umxy?=
 =?utf-8?B?bVF3eEpiVXkrYkExSjI3dUlMaFVqMWg1N3ZQWEpnK2Y5OHVFbEU0dWw4K3gr?=
 =?utf-8?B?VnBxeEFHRGlRQ3QwamJHcU9id3dxT1Zid2dTZ0VPSDlqeW96VnpwdmdOMU9C?=
 =?utf-8?B?d3IvY1loQzdSeWxlQWEvOHI1eEVPRC9UN0RrUmdhbldxTkpvNHFHUEZqNjdi?=
 =?utf-8?B?N1ovdERiT280cU56dDZQUlh0R1Q3Q0JTaXdVMEt6eUxXRmdnWjBENmNtbGdy?=
 =?utf-8?B?THM1cjJTRlZDZmdrbmdWWHJ0ZkkrTUFwY2FVT1VCV2ZsRFprbWJsckYxYWxs?=
 =?utf-8?B?RDZnbGdmL09LcjhTZkVYSEFNT3BreTlRMW9qb0NXRXA3Nm5CeFBUanF4R1dI?=
 =?utf-8?B?bENOdDllVTgxSnNrZklGU2VEUCtzQ09SQU5QcEJLSGRrS2pLZ2ZGTXdPU3kz?=
 =?utf-8?B?UWNCbFdPMS9pM3N6YmQvYm5WNUNWb0NWQSt4eXNOd1lTcjZnQkQrNk45RmdT?=
 =?utf-8?B?RC8yZDlYQjBFTklGMWp6SWNPYW5QTG01YUVYbVphS3E5UXh6YUU4QnV2QktL?=
 =?utf-8?B?YXhuYmYxYXpjZFNZbXhzSXVIa1VWMDJDUzBQa1V2WjJadjBWQ05nR29hZWNh?=
 =?utf-8?B?T2lvdFpGYWNiVTNqcVloSmhTL1lnd3A3UlJKVnYwdmVVVTUyUkZaek04RHRm?=
 =?utf-8?B?Szk0dDEyL0dQVDRsWThQVFdMT0ttSEdTbXJ1emdrZFl0U2RjOGhuOC9MN0xx?=
 =?utf-8?Q?O7B+/QcgU5/PdbLQNM9plYdrH?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9279b46-997e-49df-1a2d-08dd6c4a0d30
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 09:39:06.3560
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W/E8avTuCtT7amZLnpluehUWYu/rEwhyIcPAtCegiKdDvOIYCY8jDI5cW73o6nmb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8163



On 20/03/2025 08:32, Jan Beulich wrote:
> 
> 
> On 19.03.2025 17:31, Oleksii Kurochko wrote:
>>
>> On 3/19/25 12:35 PM, Jan Beulich wrote:
>>> On 18.03.2025 14:05, Oleksii Kurochko wrote:
>>>> On 3/17/25 9:07 PM, Luca Fancellu wrote:
>>>>> From: Penny Zheng<Penny.Zheng@arm.com>
>>>>>
>>>>> ARM MPU system doesn't need to use paging memory pool, as MPU memory
>>>>> mapping table at most takes only one 4KB page, which is enough to
>>>>> manage the maximum 255 MPU memory regions, for all EL2 stage 1
>>>>> translation and EL1 stage 2 translation.
>>>>>
>>>>> Introduce ARCH_PAGING_MEMPOOL Kconfig common symbol, selected for Arm
>>>>> MMU systems, x86 and RISC-V.
>>>>>
>>>>> Wrap the code inside 'construct_domU' that deal with p2m paging
>>>>> allocation in a new function 'domain_p2m_set_allocation', protected
>>>>> by ARCH_PAGING_MEMPOOL, this is done in this way to prevent polluting
>>>>> the former function with #ifdefs and improve readability
>>>>>
>>>>> Introduce arch_{get,set}_paging_mempool_size stubs for architecture
>>>>> with !ARCH_PAGING_MEMPOOL.
>>>>>
>>>>> Remove 'struct paging_domain' from Arm 'struct arch_domain' when the
>>>>> field is not required.
>>>>>
>>>>> Signed-off-by: Penny Zheng<penny.zheng@arm.com>
>>>>> Signed-off-by: Wei Chen<wei.chen@arm.com>
>>>>> Signed-off-by: Luca Fancellu<luca.fancellu@arm.com>
>>>>> ---
>>>>> v3 changes:
>>>>>    - Introduced ARCH_PAGING_MEMPOOL instead of HAS_PAGING_MEMPOOL
>>>>> v2 changes:
>>>>>    - make Kconfig HAS_PAGING_MEMPOOL common
>>>>>    - protect also "xen,domain-p2m-mem-mb" reading with HAS_PAGING_MEMPOOL
>>>>>    - do not define p2m_teardown{_allocation} in this patch
>>>>>    - change commit message
>>>>> ---
>>>>>    xen/arch/arm/Kconfig              |  1 +
>>>>>    xen/arch/arm/dom0less-build.c     | 74 ++++++++++++++++++++-----------
>>>>>    xen/arch/arm/include/asm/domain.h |  2 +
>>>>>    xen/arch/riscv/Kconfig            |  1 +
>>>>>    xen/arch/x86/Kconfig              |  1 +
>>>>>    xen/common/Kconfig                |  3 ++
>>>>>    xen/include/xen/domain.h          | 17 +++++++
>>>>>    7 files changed, 73 insertions(+), 26 deletions(-)
>>>> For RISC-V:
>>>>    Reviewed-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>
>>> Mind me asking then why RISC-V needs this at this point? The stubs surely
>>> were added to address some build issue, not because they are actively
>>> meaningful?
>>
>> Only because we have stubs and not to have redefinition compilation
>> error. And, yes, they are not actively meaningful now, at least. I am
>> okay with not enabling of this config for RISC-V but then seems to me we
>> have to drop stubs in riscv/stubs.c. ~ Oleksii
> 
> Well, I don't think it's "have to", but I agree that dropping them would
> make sense then (and be desirable).
@Jan, @Oleksii, is there anything blocking this patch to be committed (Luca
question does not seem to be answered)? Other patches in the series are ready to
be merged.

~Michal


