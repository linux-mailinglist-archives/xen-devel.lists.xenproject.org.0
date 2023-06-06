Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F44724CA0
	for <lists+xen-devel@lfdr.de>; Tue,  6 Jun 2023 21:12:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.544179.849754 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6c5Z-0006mZ-7d; Tue, 06 Jun 2023 19:11:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 544179.849754; Tue, 06 Jun 2023 19:11:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6c5Z-0006jE-53; Tue, 06 Jun 2023 19:11:29 +0000
Received: by outflank-mailman (input) for mailman id 544179;
 Tue, 06 Jun 2023 19:11:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nNFn=B2=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1q6c5X-0006j0-5Z
 for xen-devel@lists.xenproject.org; Tue, 06 Jun 2023 19:11:27 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2061e.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::61e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ec6a4962-049d-11ee-8611-37d641c3527e;
 Tue, 06 Jun 2023 21:11:23 +0200 (CEST)
Received: from MN2PR12MB4408.namprd12.prod.outlook.com (2603:10b6:208:26c::14)
 by CY8PR12MB7145.namprd12.prod.outlook.com (2603:10b6:930:5f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Tue, 6 Jun
 2023 19:11:19 +0000
Received: from MN2PR12MB4408.namprd12.prod.outlook.com
 ([fe80::61d6:7feb:e8e8:bc4]) by MN2PR12MB4408.namprd12.prod.outlook.com
 ([fe80::61d6:7feb:e8e8:bc4%6]) with mapi id 15.20.6455.030; Tue, 6 Jun 2023
 19:11:19 +0000
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
X-Inumbo-ID: ec6a4962-049d-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E4WFsOFZYvOLKD/GBPap0Evp4AW33Z2MehM0pFPSYWGw5cS5DiutVUcqwojRd4GSZBN0So12k9WIqIiizoDOAFPTwxlza/jXVcXxxP8IjApY0Y5cCNPrcN1IVWB/VEZbLceHKKc3jOUbI2tFLckQftulnq3CPnzQr/rWEc8Vw8sPlm48RKdHqZfLtIGGWWxZsj4UDgxznFnGfj3XZRip5jHjqnqMhDWAc/pfRYDJUN3ZnTf00HAn7LnibFxzB8zNE3VwqMSzAB5RzlMO0drkonbKApl1n+Iks/cLyviaqqLoT/OX32mKjABpHg9WhWLzoo41QZZWDVFqsQHQ4cJa0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pAavKR/JqEpfQuRicepUGQ1c2BecBcy5U2yV/p6fzRI=;
 b=TJp7y2Xfbp5IM0R4a1UY/B+EmKsiqSrJGzfZCpZO/CRw5vG/EUsKNjfvBahOqxb14lgl+YhE7y2HSpryIekqL/y02JbWcUHhIemNUz/g+2X+1mJdI/8o7IHEXtl065Bgd7amsI1BZlqEq3KxRO7Nhh7YNg6b0IN4cPsDVF9EJ9QGBV+hnL39MxeOJnxSHt/DfPSNh4qRufVuJ8hHQLyHrIksOESW63ow/FyNSFEY2tU9TBt+9kVfPbQsgQljt61zY9/pCrEy4eyndFk55ULq7c9p6V43cmFeRvJVF48zytGPDFGBmBS2QCCTO5fLn7lDhF7Xzir7z3YNAAD55rskIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pAavKR/JqEpfQuRicepUGQ1c2BecBcy5U2yV/p6fzRI=;
 b=3y1xPjQe3D12K8JYZWoN7WLUKy/XPz1cGUO31OfDJNDAE2u9X+Q84GSSzhmAeP9GcgBLpxNW4TfLyKFhFQQHmwiS6nH6TgCToD1kz4Eonno2qWANsgL4+VOcAM+YShKR4dMWpxpuujP5BfmKW+6TLv2My9ejD08U3J+9kwOvB2g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <9766a2a6-6205-498a-9a86-801f7602647e@amd.com>
Date: Tue, 6 Jun 2023 12:11:15 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.2
Subject: Re: [XEN][PATCH v7 05/19] xen/arm: Add CONFIG_OVERLAY_DTB
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>, Jan Beulich <jbeulich@suse.com>
Cc: "michal.orzel@amd.com" <michal.orzel@amd.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Community Manager <community.manager@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20230602004824.20731-1-vikram.garhwal@amd.com>
 <20230602004824.20731-6-vikram.garhwal@amd.com>
 <ad948249-2011-316d-f194-7d7f76667530@suse.com>
 <AS8PR08MB7991E16F64F1FF8B3EDF648E924EA@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Vikram Garhwal <vikram.garhwal@amd.com>
In-Reply-To: <AS8PR08MB7991E16F64F1FF8B3EDF648E924EA@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0050.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::25) To MN2PR12MB4408.namprd12.prod.outlook.com
 (2603:10b6:208:26c::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB4408:EE_|CY8PR12MB7145:EE_
X-MS-Office365-Filtering-Correlation-Id: a19033b2-8052-428f-2c62-08db66c1ceef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	L2Ai5B5ZXv0Wo5RaME+ZiL+I+5CXeyzJdlov1GOzioQb1YG4GijY+OoAWf3H7XYFjI4x9fzkRyV2vKoTZ2oq5Gim9FMMKVKr61Gc9ORogWANW005jt4k0u9l8Od8pFqyCV0lrd50zUVyy8YqQHIiXHP+mg8fnaJj8rmtsWg0DmQ9U9anI5Ob+/2ZsB06Lt3YpmDuYaiBWRH0tik8woul+Bjg+Rq8euQ5WoQfN4FGhmb0+MfEIsz89mr1ZsutVXv8SunPUvRnoKqOJWxUhtSZn9ceCKqywttyI0I4rNgOM8L4Jr7RZxgfLu8JOr6CrB+9lkSlsqYqMNXco4JlOrV0XBO71G4iECz+s8pjaIVKHB9i48o5x6Jm8Nm7zehi2RSsBgc1NQnmRfmBeCIzEBtjoV+9uHEl72MN2cNFa44n+hZkXgMptwNvKu7t+0Qu99IZCxCdlKaITpTtQeLZmzJNa7258AsSCqtpgWEeGQCElm1CgeG/6Ybnyr7OyDrUKBp8UOOIY03KIXzgi95kJ7E2vTwQEFht/lyVCIfrydnK30Q+Wpdt3azmdRXepJA4yb1PGyIJbfXc9pNHpiCnQ/wp2gEzcEy8SlcwN7ogdwil0Zhnj1pQYgCFBj0+D/0LjnaoftJB3gaKp+LM7A8scTWOpg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB4408.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(346002)(136003)(39860400002)(366004)(451199021)(66556008)(8936002)(66476007)(4326008)(66946007)(8676002)(7416002)(316002)(54906003)(110136005)(41300700001)(2906002)(478600001)(31686004)(5660300002)(44832011)(6486002)(6512007)(6506007)(53546011)(26005)(186003)(83380400001)(6666004)(31696002)(86362001)(36756003)(2616005)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M014cVRSa1JuMk1Db3ptbk8rMXg1bCt1bWNSQS9ETGc0WmtpcW0zRGx5eFZ6?=
 =?utf-8?B?Qk1UaUU4NDN0MndYdWdQUFZSclA3QllnZXRSSWFxTzU3YWtYR1l3TE1Xc1U1?=
 =?utf-8?B?YXZKYU1SM2RiR2ZCKzltQStTWVhucDZiZ1pjdlJNK3FOVnZuVExJdm5LZXNS?=
 =?utf-8?B?RnM5TUlLbnI4KzdiNDFTcEVyOGxuNHZ4OTBjM0pvZlRWZlI3YXJ5YWFaa2Jl?=
 =?utf-8?B?Tk9qeUVDTjN3b2NUb2ZpcVRHWG9hU012UjJKNFBJZ3dEUlNpenZkNkcyajZF?=
 =?utf-8?B?cGNVcEdLUVAzcHZQMEFoRG9ReEFKRnQ4bWhEd2N1VG5lNGtVMjk2R1ZCWFkw?=
 =?utf-8?B?UitKQWdEYnFxU0ZDQ2RJcFdRemVsdEUzRzIzVDFtK2lzZVAvVHhhR3hHVWFv?=
 =?utf-8?B?WTNtUDB6Um9jRDBOYzFWWDFyNFAxZUVjY0Z1dVlmNFlpZktZQjJuc2xVc1pa?=
 =?utf-8?B?U2Q0VVBBQkR3YVlZVG5PTWgwK2ZKTFRHVlZodEZMQWZlWEpCdVNVQmc2MUJX?=
 =?utf-8?B?bE91QVlLSmlOa1ZzR2N6dVRKa3VrSWV4L2k4SWZvVmRUR2pCdGZqN2YwMmZr?=
 =?utf-8?B?cTVzZGg0K2J6MWxrUkF3MTFBZ3ptYy9YaSsvdlBoUUkwZ05pb2tQY3RWRHZF?=
 =?utf-8?B?Qnoxc09mRGUrc1JxRWEyWjgxazVhUjdPcWxDaWg1UUtOcGZWSkZySGJUYm5G?=
 =?utf-8?B?Nkt4NW1lK1I1Y0NoQXMyL2NXU2NhbzNhY1VZWklOQTV6MnBNc2cwL0NHWUF1?=
 =?utf-8?B?bmI2cFdFN3hxL2ttaWoySWFrbXJKNGpsdUkzSkxNL1hibWdwbWFyRTJrSGF1?=
 =?utf-8?B?cTVmcmFPbHJuVkIvY3NGYkQ3QjA0TFVheGQxalFDdVZwQnphUHJOTENrN3Y5?=
 =?utf-8?B?M2Q1UWVHQmNyVXhHNUN0dUFmQTRnRFNndGZrQ3VJYmtDNTJkWkdVbVVLaU94?=
 =?utf-8?B?d2JlODl5d0g5TGdqSHpMdlpiMEc2ZDVuMUMzUWZuaUtmQTg3Y053b3VxZUQ4?=
 =?utf-8?B?QkpxR0xBdCtXTGxRMDVVd2tmQ1JVTGI1WGt5K29LZkx1YkxZNlFHaFFsQnZQ?=
 =?utf-8?B?UkZKWktPdFM0OURoWXkveVpKVWZxckVGbzRYck5RQjlqeTJCVk12NGIvNmMw?=
 =?utf-8?B?NmVCQ3R4TGJkWlRNNnhNb045dmtrUjBaZDJtWElFQ3g3Zi82Uk1ZZUFMZ0Vw?=
 =?utf-8?B?aWJnYi9GN2ZSQ0VDemQ2UmZ2Z3lhM2llTVdnS29VRGt6Slc3NjlBcDNFa1cr?=
 =?utf-8?B?Y0F5eWZpNTlSSHBSSUZ4ZC95TERjWVh3NklvR0dOcVoyQXRRQ3VsU3ArL0gr?=
 =?utf-8?B?RTB5S2Fub3M1MG9YL0dWejdpVjEyeUQ5Yk01SzVZOTIyTlcwblh6ZVJmeGN3?=
 =?utf-8?B?MW44RlNiaHhqSEtSVWN4b1g0b0Jadm9XZE9FdWZvV2NPaU9YVmNZMGpwdjEy?=
 =?utf-8?B?U0ZITVpkSGdVUzMzOWpwSnltM2dmbXlnN2t0NlIwdnNka293bjNFTGd6TSto?=
 =?utf-8?B?QmVQRDZveHZlbGtvaURyZHFLZXdlM0NlejQwc0VxZFhYTmNFWWxVcTlhMDRl?=
 =?utf-8?B?NVBtZldKdkNQSHdhYUkwNGNRb0o3eXlVUTZsekxyMUgxUmRuNGFzTE1ZS3Jy?=
 =?utf-8?B?QzFHVlBqVUhkSEZLMG9TdDZkaVR1SHhoSWNXcmhxUVRUcVBBZXRTTTRQai96?=
 =?utf-8?B?blJOUm00OFRxbXVrM1l4eXIwc1cyMndmNkFjMVRMRHhad3M2SmR4Ri9acHcz?=
 =?utf-8?B?QUo2cGNPTHhJUWs5MmFtMy83aGovSWFRUjFyK25kQ21jcSt1aHlUdW9FSld3?=
 =?utf-8?B?ODBpdkMyOERXbmFUUzdlamU1ZG9aQlVxN2IyY1ZKL0w4eVRWZXBwbjYwbE9p?=
 =?utf-8?B?NjNBeERIeGhhaEx6UGZBaFFHWkF6S1pnR2x5MmtUa3MyaUh1ZEtYMWgxSUIv?=
 =?utf-8?B?Z0ZUeTJRYnlsdGNJMVlIWFVhY01pbTkwODF2Um9ORDVCM001VUFob1hYS0pt?=
 =?utf-8?B?N0lvazl5aVVPb3poT2RlOEQzcTQzd0lBQTJLekpuQjlrTlZTOHhPZ2RURjBN?=
 =?utf-8?B?Y3UzZnFOUUl6bnBMTHRUR2pZKzdsbXRvSm1PMFdxMDhvdzgvdnNDKzAzOEc2?=
 =?utf-8?Q?kmUEweM2SoZYS4GsJPTXsqpFq?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a19033b2-8052-428f-2c62-08db66c1ceef
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4408.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2023 19:11:19.0731
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cUOFO9mdrxFUtrL+DOiOvyzExLw+scMEuxqQDCMb9eLM/z+zyop2ItZtgTSy02A3lKq90Z44oma0FZxvv84EFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7145

Thanks, will update the Changelog.md with Jan's suggestions.

On 6/2/23 2:22 AM, Henry Wang wrote:
> Hi Jan and Vikram,
>
>> -----Original Message-----
>> Subject: Re: [XEN][PATCH v7 05/19] xen/arm: Add CONFIG_OVERLAY_DTB
>>
>>> diff --git a/CHANGELOG.md b/CHANGELOG.md
>>> index 5bfd3aa5c0..a137fce576 100644
>>> --- a/CHANGELOG.md
>>> +++ b/CHANGELOG.md
>>> @@ -20,6 +20,8 @@ The format is based on [Keep a
>> Changelog](https://keepachangelog.com/en/1.0.0/)
>>>      - Bus-lock detection, used by Xen to mitigate (by rate-limiting) the system
>>>        wide impact of a guest misusing atomic instructions.
>>>    - xl/libxl can customize SMBIOS strings for HVM guests.
>>> + - On Arm, support for dynamic addition/removal of Xen device tree nodes
>> using
>>> +   a device tree overlay binary(.dtbo).
>> May I suggest "..., experimental support ..." here?
> Great point! I agree using "experimental support" is better here.
>
> @Vikram: Just to be clear, if you agree and change the wording following Jan's
> suggestion, you can keep my acked-by tag for the changelog :))
>
> Kind regards,
> Henry
>
>> Jan


