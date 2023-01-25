Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E67FA67B125
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jan 2023 12:26:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.484259.750800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKduu-0004z5-OX; Wed, 25 Jan 2023 11:26:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 484259.750800; Wed, 25 Jan 2023 11:26:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKduu-0004xO-KW; Wed, 25 Jan 2023 11:26:12 +0000
Received: by outflank-mailman (input) for mailman id 484259;
 Wed, 25 Jan 2023 11:26:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=prA8=5W=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1pKdut-0004xI-0a
 for xen-devel@lists.xenproject.org; Wed, 25 Jan 2023 11:26:11 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2051.outbound.protection.outlook.com [40.107.102.51])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 10223aa6-9ca3-11ed-91b6-6bf2151ebd3b;
 Wed, 25 Jan 2023 12:26:09 +0100 (CET)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by IA0PR12MB8225.namprd12.prod.outlook.com (2603:10b6:208:408::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Wed, 25 Jan
 2023 11:25:50 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::a3a7:87d9:60f1:7eb1]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::a3a7:87d9:60f1:7eb1%6]) with mapi id 15.20.6002.033; Wed, 25 Jan 2023
 11:25:50 +0000
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
X-Inumbo-ID: 10223aa6-9ca3-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OZz0WN8rKFrM4+nEJSrf8/FKGGAxWBE3+nzhc04muWJSoSxXKwMHCS399Nq9GmOpnsB1H/7WOK4y+vBzA7lLLStwN5F6vsvqRthdrtCcAbZ0AoKueWwm/Co5HqUzjLASe3l8g9QxcL4/hKtYGuiCOEDTRpfbdX9OePsZ+VibIgUxwSVhh9CUGPXfA77w/M12eHhb9KVSxdDyJrRclF0s2TMEoxoRY4vC1IFqEnkuRZrra4UFi9bxejh2I1IxwChcXUN1D5CS9TFm9ShHZFGglQA8JHDLgcDzrv+J3lUWLHcXAs9FBi0CfSiYMYtQI/2efrL+R+k5yupKTvSmiPfYKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RtVUccqFBaLhf5fYO8s/Y/UvUi5J2vimD0Ele7c/Ni0=;
 b=AeEtgJTxkISAhccpFpmtdjNA6KtIDVgxCntLsZCO+uDDizGDBwtrECko2l4ozTjYg4d4aep2X/HMkDi26GOu5CUrW4zWFBWaunerRPj4L71tHxqlUAEkGms+T4i4nKyX0uaXXe+HpphInHBHupwSPv9wZfxqR1SDY8n9eo6Qxh8JQRaMmRs8ZipPPy+kIR72pYpFP0SkocYx0cBSB9nr39JxF48w9G32ydTZcfVFZ2PmKAQyBNquxbWbUgZkXdgifC9S9jc7kinQ+ZYPR7qZphlZB2CxO9eQO8bBJld8s7VP8Kf0ZsBq9HOuA6DVnFE7LnnBoPXFG6Wm0rpmJFaT+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RtVUccqFBaLhf5fYO8s/Y/UvUi5J2vimD0Ele7c/Ni0=;
 b=eaO9gc5dEjxFvCPoWv7pjved4IqJngpF+nCcDllr2oBfJO963w9VWsDzpfL4txpK/8G1KjfELI9u365FsdQxmvJ8dE8BLraQ9wtcswR/SBNJtqt4xDT6us7HyrBlDgZwWYg0qsvQWVPEZ1yk8SnpqkJowdBup1EvnPKBCWJNyDM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <4bc7437d-3052-508a-6eba-5f2fb96fc0ab@amd.com>
Date: Wed, 25 Jan 2023 11:25:44 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [XEN v5] xen/arm: Probe the load/entry point address of an uImage
 correctly
To: Stefano Stabellini <sstabellini@kernel.org>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: xen-devel@lists.xenproject.org, stefano.stabellini@amd.com,
 julien@xen.org, Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com,
 michal.orzel@amd.com
References: <20230113122423.22902-1-ayan.kumar.halder@amd.com>
 <alpine.DEB.2.22.394.2301201422410.731018@ubuntu-linux-20-04-desktop>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <alpine.DEB.2.22.394.2301201422410.731018@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO3P265CA0032.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:387::15) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|IA0PR12MB8225:EE_
X-MS-Office365-Filtering-Correlation-Id: ca59cbba-2235-4c68-177b-08dafec6e992
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZkP+c9+2rbP8mXE8J3E1AByuuewN90HmdShX3yk+70dfBkiuTz3frz3F0nacnfBXT7iFmLsV+CNs/8TFc9z0zk7hnJMBxB0eOZx2L17F5ywBsC+02/dkVZhzIHCeo+mzNe1N3AY5zbJg3ZelZX+GlQbqen73MSnFnqT+3gy2aD3bk00uS5mOV//g8m/LuR40PNv7ZdwZnzouwMt7rxEU745IDwWOsRv7nclqEqCF2yeg5bxi3CyiOVsdXo6zxxNcpQn2/Bu65MrVRCuXqiIOp0ZpXV1tX2idM7OA0Zn1PKmdBpNhmHt4vaUUtfl5iHte5ncK0pf6x+OMflvBFiZlq7Ad0EqXZ4BB2b4vdbxYwtOHhrkUqS7G2XsQBUAHFSPE/+4pu5yIxN/E5iAugW1DGnpGI0SULWLqlx2Bg0z/5icChY27r297gMDHKLOA4UJX7x/OJJGVnMd9yuWEzVMiejm/dO3k8PkuG3XTkojVOxbgWi0WfuWdSalL9KwgbCNxQocBMSUH1lYSwP9NVb/Ty3q0VVtY9/XX0/5P+lvxQ1tWVGE+VgD0u4L/+K8OWE63YfsSeoMl1GW9ImK0MqKPCKV7SmH+LJdIxunyrZPRB0kjGHKjB0sJunC6ojc+e3suDZ4KqZDpmsa9GtgOJizHtKTKPFud3kHLgXx7/otIFs8bMGxKvIPAFTMoCXoAR15LEJ6UFBVIavgzCrD5z2t4fqgQFF2aC8G/kU6VLaWvCttl3MSuzxVXDd571Ku4oKvOchmCPmspsOVaJmsjsxsz9c8Bx/LPHpNeNzsRgL1PPC9T4S58JYPOjuBMOXhUyE5X
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(39860400002)(136003)(346002)(366004)(396003)(451199018)(38100700002)(83380400001)(66556008)(2616005)(478600001)(8676002)(186003)(66476007)(53546011)(31686004)(6486002)(36756003)(31696002)(6636002)(110136005)(66946007)(966005)(2906002)(41300700001)(26005)(5660300002)(316002)(6506007)(6666004)(6512007)(4326008)(8936002)(21314003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eGJmV3M1M1UrbU1weEFxemc3RUF0Y0ppWTVQaHUzYVpRL05Lano0ekUzcXZB?=
 =?utf-8?B?MnFTdjlBVS93Ny84UTNsYlRXVHlFQkdxU3RIc1dnTEEzVkR0VE5oSWNaVVV6?=
 =?utf-8?B?cUxYVm43QzJSeTEvRG1ZZHYzbHhENUQrdEcyRi93YVhEVzdqU1pMK0NZMUt0?=
 =?utf-8?B?bk9QU3RyYy8xSVpFcUZIVTVvZlNPV2lEMzdWNVJERUJOdHFOd3BqS3lVd2Zi?=
 =?utf-8?B?NkN0aFFjWENoUXpuTUFGV1Q4OURkYUpPM3Y3MEhPMW9INTMyRVArTnFGNGU5?=
 =?utf-8?B?aExUMEZxdmltc1h2Y0FTZUxzYXVsVVRGaEFkYVhabThYQ0R4cG1pdC8rcXhL?=
 =?utf-8?B?L3JzcHNIRUliTG5VeFpqVCt2M3lPSlVET3Y2VmEyQmlxZEd5bk53VXFJUSsw?=
 =?utf-8?B?MDlvTERWZHZuVU9wT3BHVUZyUnpoTTNDMUhoWDMrWjYzbXROL1pYMGVWL0Q0?=
 =?utf-8?B?NW9oUERTSGVxM0ordVFZTTByZFVrdjkvZDJaUk95UnVCTU94b3lWVE5sREdT?=
 =?utf-8?B?eFJkVGxERDRVck9zQnFlaHdTVkhCeUJlRlpoVGI5K0psRzhrYWhHZ200Vk9o?=
 =?utf-8?B?NlYvWlI0dklHZFJyQS9Hc1U4QkNTRmptaWZHU1hNRWk4NnhxOFNSS2J0NjVJ?=
 =?utf-8?B?Z29ET2tldmozRHNpMU1uR29NT3BXY0piMzRsVm1adk1Wc0VlSzdsbUVrZWtX?=
 =?utf-8?B?cVRiMEEyWi9CTjl3dEZwUjVpTWczcXpzL2lPeEN6TUM4dWQ1Zmorellpdy9S?=
 =?utf-8?B?TmVLWW80Q1ZFdFErQkVGQWRuN2ZtQzZwL3hkbHQ5MVRDS1FuQ2lBTVJiaVhn?=
 =?utf-8?B?Z201a2lqN1phbHNaRUtjS0VSWHBMbnN2UGJZeGszSjRBeGtzSmk0WFlFYzBn?=
 =?utf-8?B?U2QybmFMOUVxcEJJa1VFQ3lqb3ovem9yeHhXQVhaWjdvbjRWTk9YcGVUaW5v?=
 =?utf-8?B?VHkwL0tkeTNGYnY2akRkRnZsM1BTeTNybjNValZGN0pJNDZxSUZLeW9YSXpM?=
 =?utf-8?B?aHFPKzU0R3pJK2oxNkJzRTJtMEtWZkR0OHFiVkVPbFlUN2c1SmFvVDMxdWFC?=
 =?utf-8?B?aDFUSUtYbmxRWmlaWjZYVkZoL2FOQUF1VlVLM3BkMTQ0QVdMaFc4QmJtV2Nm?=
 =?utf-8?B?K3RRTWFaYkU5RC9nSXZPRTI5Z29QUDE3VElGdFE3NUliaUhBN0s3cHZrSmhD?=
 =?utf-8?B?cm1aN1V3VGRwR0E4T1Vjc1V1WE5RbUxPazRKUG4vZkxVandJTHZ3TTZqM2Q5?=
 =?utf-8?B?U3NHbHVMSktrMHZQMTBtSzVETzdMdFJsMVZuNmpEVGFjNmhTVVUxMm9ERytH?=
 =?utf-8?B?ZmEvK2YxOVZjSlZUZnkrNUxFdldtbHRqMFZUR1QyNXAvL2dRTWRVREduYnpq?=
 =?utf-8?B?czZhNnJPSG02VVpWV2RIYWRRUU1uMVZzZG1oN0F0WWtacHlQM3FXNTNtNVJB?=
 =?utf-8?B?ZjEyMm9XTkJJU1JwbXNpWFVuamZlQTU0UEhMbVFmMXdTb1JwWHdYMUU3djUz?=
 =?utf-8?B?VW5XOGNuNHFJenhHczNiV1E4cUkydit1LzBTYSs5WUtIc3kxZm9SUkVwSm5I?=
 =?utf-8?B?T1hwcmJqRHlMVmhQZXM5enhPYUZsdnFXa1ZESDdSUFVsMTZVU1MrT1R6T0VK?=
 =?utf-8?B?UGY0Q3dUcnNNK3VCcWJjeER0NThXR1RQWnM3SFZMVCtWLzZ1WVk5YjBVQ1ZH?=
 =?utf-8?B?ZFFKTmZLc3kvOW91SmR2RnBJbldUNDc1ckF0TnJNZlNZMWVBWURHd3JTNm9V?=
 =?utf-8?B?dkYvVDMrQklzWnZYa0NhYnF3aGRHOFdTZnZuZ1dpdFpGbUpkSm5QY0RsV1VO?=
 =?utf-8?B?bCtEQVZXbGpIMTZCbzN0aVB1ZUIzOWpQbHVMRk51dFA3aVFGWER4ODU0TW5C?=
 =?utf-8?B?bUZoTWQrWjFheDNwZkxyVGhsNndBbnRtald6V3RGSnEyNHhHeWZDVTdIY2xJ?=
 =?utf-8?B?RUF5bDdZeFZ3bTBPeFRFTjJtVXJCUmFSWVh4ZHZaR0hiZTlyYmR1b0hsUDI2?=
 =?utf-8?B?U3h5NCswS2lBWWU1VmVQMndPWU5Nek9aek5UelhOY29ETnBWckh0RHk0US9Q?=
 =?utf-8?B?c0tQUHUwNVpnV1poVGJsUnU2YlFEU0w5czEyYXlRbm1Pa1o3SEplbVRFMGh6?=
 =?utf-8?Q?/tpnEDrneizRzD/I8wJ+NCRpG?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca59cbba-2235-4c68-177b-08dafec6e992
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 11:25:50.4491
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wYiivXZ35YlPYO6iP2AU+fnLmrFHGIMBkVsvYJzPRB2xESpT+YQERjE1TTU1XB2YiPyQXS0k6nVQBzsQ+YwzUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8225

Hi Stefano,

On 20/01/2023 22:28, Stefano Stabellini wrote:
> On Fri, 13 Jan 2023, Ayan Kumar Halder wrote:
>> Currently, kernel_uimage_probe() does not read the load/entry point address
>> set in the uImge header. Thus, info->zimage.start is 0 (default value). This
>> causes, kernel_zimage_place() to treat the binary (contained within uImage)
>> as position independent executable. Thus, it loads it at an incorrect
>> address.
>>
>> The correct approach would be to read "uimage.load" and set
>> info->zimage.start. This will ensure that the binary is loaded at the
>> correct address. Also, read "uimage.ep" and set info->entry (ie kernel entry
>> address).
>>
>> If user provides load address (ie "uimage.load") as 0x0, then the image is
>> treated as position independent executable. Xen can load such an image at
>> any address it considers appropriate. A position independent executable
>> cannot have a fixed entry point address.
>>
>> This behavior is applicable for both arm32 and arm64 platforms.
>>
>> Earlier for arm32 and arm64 platforms, Xen was ignoring the load and entry
>> point address set in the uImage header. With this commit, Xen will use them.
>> This makes the behavior of Xen consistent with uboot for uimage headers.
>>
>> Users who want to use Xen with statically partitioned domains, can provide
>> non zero load address and entry address for the dom0/domU kernel. It is
>> required that the load and entry address provided must be within the memory
>> region allocated by Xen.
>>
>> A deviation from uboot behaviour is that we consider load address == 0x0,
>> to denote that the image supports position independent execution. This
>> is to make the behavior consistent across uImage and zImage.
>>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>> ---
>>
>> Changes from v1 :-
>> 1. Added a check to ensure load address and entry address are the same.
>> 2. Considered load address == 0x0 as position independent execution.
>> 3. Ensured that the uImage header interpretation is consistent across
>> arm32 and arm64.
>>
>> v2 :-
>> 1. Mentioned the change in existing behavior in booting.txt.
>> 2. Updated booting.txt with a new section to document "Booting Guests".
>>
>> v3 :-
>> 1. Removed the constraint that the entry point should be same as the load
>> address. Thus, Xen uses both the load address and entry point to determine
>> where the image is to be copied and the start address.
>> 2. Updated documentation to denote that load address and start address
>> should be within the memory region allocated by Xen.
>> 3. Added constraint that user cannot provide entry point for a position
>> independent executable (PIE) image.
>>
>> v4 :-
>> 1. Explicitly mentioned the version in booting.txt from when the uImage
>> probing behavior has changed.
>> 2. Logged the requested load address and entry point parsed from the uImage
>> header.
>> 3. Some style issues.
>>
>>   docs/misc/arm/booting.txt         | 26 ++++++++++++++++
>>   xen/arch/arm/include/asm/kernel.h |  2 +-
>>   xen/arch/arm/kernel.c             | 49 +++++++++++++++++++++++++++++--
>>   3 files changed, 73 insertions(+), 4 deletions(-)
>>
>> diff --git a/docs/misc/arm/booting.txt b/docs/misc/arm/booting.txt
>> index 3e0c03e065..aeb0123e8d 100644
>> --- a/docs/misc/arm/booting.txt
>> +++ b/docs/misc/arm/booting.txt
>> @@ -23,6 +23,28 @@ The exceptions to this on 32-bit ARM are as follows:
>>   
>>   There are no exception on 64-bit ARM.
>>   
>> +Booting Guests
>> +--------------
>> +
>> +Xen supports the legacy image header[3], zImage protocol for 32-bit
>> +ARM Linux[1] and Image protocol defined for ARM64[2].
>> +
>> +Until Xen 4.17, in case of legacy image protocol, Xen ignored the load
>> +address and entry point specified in the header. This has now changed.
>> +
>> +Now, it loads the image at the load address provided in the header.
>> +And the entry point is used as the kernel start address.
>> +
>> +A deviation from uboot is that, Xen treats "load address == 0x0" as
>> +position independent execution (PIE). Thus, Xen will load such an image
>> +at an address it considers appropriate. Also, user cannot specify the
>> +entry point of a PIE image since the start address cennot be
>> +predetermined.
>> +
>> +Users who want to use Xen with statically partitioned domains, can provide
>> +the fixed non zero load address and start address for the dom0/domU kernel.
>> +The load address and start address specified by the user in the header must
>> +be within the memory region allocated by Xen.
>>   
>>   Firmware/bootloader requirements
>>   --------------------------------
>> @@ -39,3 +61,7 @@ Latest version: http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/t
>>   
>>   [2] linux/Documentation/arm64/booting.rst
>>   Latest version: http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Documentation/arm64/booting.rst
>> +
>> +[3] legacy format header
>> +Latest version: https://source.denx.de/u-boot/u-boot/-/blob/master/include/image.h#L315
>> +https://linux.die.net/man/1/mkimage
>> diff --git a/xen/arch/arm/include/asm/kernel.h b/xen/arch/arm/include/asm/kernel.h
>> index 5bb30c3f2f..4617cdc83b 100644
>> --- a/xen/arch/arm/include/asm/kernel.h
>> +++ b/xen/arch/arm/include/asm/kernel.h
>> @@ -72,7 +72,7 @@ struct kernel_info {
>>   #ifdef CONFIG_ARM_64
>>               paddr_t text_offset; /* 64-bit Image only */
>>   #endif
>> -            paddr_t start; /* 32-bit zImage only */
>> +            paddr_t start; /* Must be 0 for 64-bit Image */
>>           } zimage;
>>       };
>>   };
>> diff --git a/xen/arch/arm/kernel.c b/xen/arch/arm/kernel.c
>> index 23b840ea9e..0b7f591857 100644
>> --- a/xen/arch/arm/kernel.c
>> +++ b/xen/arch/arm/kernel.c
>> @@ -127,7 +127,7 @@ static paddr_t __init kernel_zimage_place(struct kernel_info *info)
>>       paddr_t load_addr;
>>   
>>   #ifdef CONFIG_ARM_64
>> -    if ( info->type == DOMAIN_64BIT )
>> +    if ( (info->type == DOMAIN_64BIT) && (info->zimage.start == 0) )
>>           return info->mem.bank[0].start + info->zimage.text_offset;
> This is an issue because if we have a zImage64 kernel binary with a
> uimage header, we are not setting zimage.text_offset appropriately, if I
> am not mistaken.
>
> The way booting.txt is written in this patch, I think the matching
> behavior would be that if there is a uimage header, then the zImage64
> header is ignored.

I have followed this approach in

"[XEN v6] xen/arm: Probe the load/entry point address of an uImage 
correctly"

- Ayan

> If the uimage header has uimage.load == zero, then
> we should allocate the load_addr for the kernel (PIE case).
>
> I think it would also be OK if we choose the different behavior that if
> there is a uimage header but uimage.load == zero, then we look at
> zImage64.text_offset next.
>
> Either way is OK for me as long as it is clearly specified in
> booting.txt.
>
>
>
>
>>   #endif
>>   
>> @@ -162,7 +162,12 @@ static void __init kernel_zimage_load(struct kernel_info *info)
>>       void *kernel;
>>       int rc;
>>   
>> -    info->entry = load_addr;
>> +    /*
>> +     * If the image does not have a fixed entry point, then use the load
>> +     * address as the entry point.
>> +     */
>> +    if ( info->entry == 0 )
>> +        info->entry = load_addr;
>>   
>>       place_modules(info, load_addr, load_addr + len);
>>   
>> @@ -223,10 +228,38 @@ static int __init kernel_uimage_probe(struct kernel_info *info,
>>       if ( len > size - sizeof(uimage) )
>>           return -EINVAL;
>>   
>> +    info->zimage.start = be32_to_cpu(uimage.load);
>> +    info->entry = be32_to_cpu(uimage.ep);
>> +
>> +    /*
>> +     * While uboot considers 0x0 to be a valid load/start address, for Xen
>> +     * to maintain parity with zImage, we consider 0x0 to denote position
>> +     * independent image. That means Xen is free to load such an image at
>> +     * any valid address.
>> +     */
>> +    if ( info->zimage.start == 0 )
>> +        printk(XENLOG_INFO
>> +               "No load address provided. Xen will decide where to load it.\n");
>> +    else
>> +        printk(XENLOG_INFO
>> +               "Provided load address: %"PRIpaddr" and entry address: %"PRIpaddr"\n",
>> +               info->zimage.start, info->entry);
>> +
>> +    /*
>> +     * If the image supports position independent execution, then user cannot
>> +     * provide an entry point as Xen will load such an image at any appropriate
>> +     * memory address. Thus, we need to return error.
>> +     */
>> +    if ( (info->zimage.start == 0) && (info->entry != 0) )
>> +    {
>> +        printk(XENLOG_ERR
>> +               "Entry point cannot be non zero for PIE image.\n");
>> +        return -EINVAL;
>> +    }
>> +
>>       info->zimage.kernel_addr = addr + sizeof(uimage);
>>       info->zimage.len = len;
>>   
>> -    info->entry = info->zimage.start;
>>       info->load = kernel_zimage_load;
>>   
>>   #ifdef CONFIG_ARM_64
>> @@ -366,6 +399,7 @@ static int __init kernel_zimage64_probe(struct kernel_info *info,
>>       info->zimage.kernel_addr = addr;
>>       info->zimage.len = end - start;
>>       info->zimage.text_offset = zimage.text_offset;
>> +    info->zimage.start = 0;
>>   
>>       info->load = kernel_zimage_load;
>>   
>> @@ -436,6 +470,15 @@ int __init kernel_probe(struct kernel_info *info,
>>       u64 kernel_addr, initrd_addr, dtb_addr, size;
>>       int rc;
>>   
>> +    /*
>> +     * We need to initialize start to 0. This field may be populated during
>> +     * kernel_xxx_probe() if the image has a fixed entry point (for e.g.
>> +     * uimage.ep).
>> +     * We will use this to determine if the image has a fixed entry point or
>> +     * the load address should be used as the start address.
>> +     */
>> +    info->entry = 0;
>> +
>>       /* domain is NULL only for the hardware domain */
>>       if ( domain == NULL )
>>       {
>> -- 
>> 2.17.1
>>
>>

