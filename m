Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4238A5B5E13
	for <lists+xen-devel@lfdr.de>; Mon, 12 Sep 2022 18:22:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.405917.648334 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oXmAp-0008AT-Il; Mon, 12 Sep 2022 16:20:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 405917.648334; Mon, 12 Sep 2022 16:20:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oXmAp-00087s-F5; Mon, 12 Sep 2022 16:20:39 +0000
Received: by outflank-mailman (input) for mailman id 405917;
 Mon, 12 Sep 2022 16:20:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sUhb=ZP=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1oXmAn-00087m-Ty
 for xen-devel@lists.xenproject.org; Mon, 12 Sep 2022 16:20:38 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2103.outbound.protection.outlook.com [104.47.55.103])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d3ca2521-32b6-11ed-a31c-8f8a9ae3403f;
 Mon, 12 Sep 2022 18:20:35 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by MN2PR12MB4438.namprd12.prod.outlook.com (2603:10b6:208:267::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Mon, 12 Sep
 2022 16:20:31 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::d085:e792:380d:ca4f]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::d085:e792:380d:ca4f%7]) with mapi id 15.20.5612.022; Mon, 12 Sep 2022
 16:20:31 +0000
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
X-Inumbo-ID: d3ca2521-32b6-11ed-a31c-8f8a9ae3403f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gLHiz+K/7vdz8eBmmdICKKYl1HsdsQyj+WkEocLBLjhgt2UJr6QEgtJ0+h9Z6MRVsptbUPHIQfovycnDv4g1cCeK/qYwZ4ipKUgK7DvpO/2iENB2l6HeKYeHrjIMf5XrmPB7zoJRqnfbd1CaffFbM58DH5N/B8GVGicM79n+ACiU/n/xrT1Q+Njgk6YGYQh3adBXOyAlbFHIiDo04y+AagzndVJfUJwbkQafFqDDY3rssDzi20TErwsSL5Ry1yNpSYmHbAIGxWgR3ETWgggKmUB9g0f8SoAxZLIIHZvOiUU7suZKr5hU9HqCzQuOdV1lZrmKMYB5jQCLRE/Vz3Sf8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bA5j1ZJQf430YHTgcSreno3hXqKp6h4c7pse66j4lXI=;
 b=Bu3i3GZRnhk6nr6m7ST28D8R5Ozlj65v1r1md7p8SsvpZfY0ANxnUszYpNA3EWV595nWA5Qs7Rp7L65meJnNxrPN9qzbjaStkKZ2YaDLPwwBdBKb0gBc+py5pnwabnZhzQTl0CTj6ijGTJraCwitnBtJ0/BYDBWPA3oGsYrNr5LS/dcqDDR23b0hAFNm6g0wEN4G0/lYS5spsJLAb/Eveq8ex2EvrB059GDBRf9LGqwVhIPiBJECwXmSfq38qHDTn7m/V9IpF93L5hqKGGP2iJ3pPp1rLdypd/OZn9ORggpo998jWE9Mz8mX14KJeg6db4XFj6X7Ru94OVLMqZG75g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bA5j1ZJQf430YHTgcSreno3hXqKp6h4c7pse66j4lXI=;
 b=ST6naAQAFGHzn11wG5cczePQvXe51XcwdkP3315pWeMKx3liZg4JTWnn+DzxNYkM/i28PEyOGl8xqdsdL0GcyKlIFQu34+7wRk8EI1DmlBngcr9cungvs3ox2EJan9GmZcqPRBL16dBwAPTyBWKctn6ezlvKFgCMBxz+UWr6iBs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <e2a9619b-5334-59ff-a060-459a2d6b6216@amd.com>
Date: Mon, 12 Sep 2022 17:20:26 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [ImageBuilder] Update README.md
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org
References: <20220912115918.19496-1-michal.orzel@amd.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <20220912115918.19496-1-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0548.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:319::11) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|MN2PR12MB4438:EE_
X-MS-Office365-Filtering-Correlation-Id: 53216402-c914-40a1-0703-08da94dab65a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Adv80JEgubVZJWi7fmD6EfPOhMTN3KxyG2jCLGp2fRQ0hg1KPVEJNIAzxpt5dGJItQ13e1xOtwp1u79SHf1ioiKPFXPlzWHxSY/PaTgNd7Mr9feLgF/+AP5TyLzutRaFhcyeVzeu+JGi7YajY8T3bKNa1xIJpSn4+kXgNBc8rFpD7VZc+mq/UQddTHRM0oZoQg0uuACugbKbMlI3Z6IwpwNMSUvqmIsfQML9/EGhdqW8nuhzzqfXBPE71B8LUgz1/FFQkFqP85BhgBQ+BjYzlIxe/lv59eTIxGder2Ne1NFxKtFxjpWG8HpdlFdBvYZLHh5IC4nv9LMSgCrdFHn8mxbLm9OjS9UjBSWBOhYG75lwF1o58lqJSqs3JKwYy6sJiOA3yFBrqHlCb0MwAKIo/rnFqFZ+c4tOxYgsCgeTvCr9LAFhwo3AqqNQCbf9czEKLuZvQxum2LOk3iXUmaBzntE2PyaPGiLYzXBc0YqT6HB6/L6t3xyVGzPSXDxItBk55olLLVq79RHlJ3R/yLiUS+GfohPbObxdkR9AvxBtnWB1YxWlg+kCVcEf0i7hIXw0/lYn5N2n/2nIV2xtlFJJ36Mr5JZlK0NbDKeNyfiQO7qc7yj0g8TiNZMxxw1JXARf9djPRTnEpj9oe6/0vFNjUUKSGkmoC8Vn2MI0cSIgKjw4EXhVhZcKdh6/Ep/q4gzcULy8h3+V/kdghevCVq6gr9KolsadDBWxN48xnntK9G/sgNj/P1bUluwIZl1ToaBbSmsskTWlmwwCHFxs5NyGjtdnaV/q8NxZ+im06cQMpdg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230017)(4636009)(346002)(396003)(39860400002)(376002)(366004)(136003)(8676002)(41300700001)(6666004)(38100700002)(53546011)(6512007)(186003)(478600001)(31686004)(5660300002)(6506007)(15650500001)(2616005)(83380400001)(6486002)(8936002)(36756003)(2906002)(66556008)(66946007)(26005)(4326008)(66476007)(316002)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WmgwT1NoSkNia0JlTCthV3NKQzZVbS8xemJmNlNVMU42dnhGVEVXT0c1bnhL?=
 =?utf-8?B?QSt5eWw1d25qWHVVcTJsc2Z1V1hNVEtMQ0xLVnA5ZzJpQjF0U0IrWDJFc2l1?=
 =?utf-8?B?ck9IcHpkeFc3MWo5ZHdEMVVtMVpoSnJ0aGgrRytTclNWdEJueGhiaUx6NHFX?=
 =?utf-8?B?M2NtS0ZjZmtWeHVQdk0zSkFNQ1IzNlc2dVhQYlJxZE1oUnVEYzZ4cy9iaDJw?=
 =?utf-8?B?NDVqZDFJZjMxYnlKTmRmc3VzMTdvNTN6ODV3V3dqOFZKZ09uUTBXN2EyaFlJ?=
 =?utf-8?B?bWNxNmFrS0hEVE9HWFk5OUw4TkFOR0lLbTNCMVBDNW1Na0hUa1FNRWZ2LzNZ?=
 =?utf-8?B?Tm1HTk95VEJta2gxMDdFQXBxbCt2UDlvQ0lsV0hMTGhtT0xkbUN6S2Fqbk5C?=
 =?utf-8?B?QjdYdy9FdFVkVTllNDJMUy9XeDByWUhYUlIxVEM4WjJ0c3dpcVdQR2dqZWZM?=
 =?utf-8?B?QWhYYkl0dmZLb2UxbkhuNjVRVmtnZUZ1ekY4OEMrSFZmRXdVeWVTUDhobi9Y?=
 =?utf-8?B?SzFBWEJPZmh4NFVJTFVOSGdFMkVobkozNlRITWY0V1BiRjBQVlBzWUNiSW9T?=
 =?utf-8?B?dnl6VDNRMm10Z0xvN3duNjB2dHdTNWlORktCUkU3R2wvU1pIQUFGeWRkUEpU?=
 =?utf-8?B?VDM0Z214UGRDUFJ1eDgvb2s1bDZwYlQ0elF6MUdHajd4NHdqeERvcXVXcVNw?=
 =?utf-8?B?bmhwM3dGQnovWGZyYWs5MmgxTWJORlh6TzdML20wQmJKVXdyTnN3a1RxYzJs?=
 =?utf-8?B?cXF2bHJqTUlyd0t3TkNxaDg4TGN2bExqT3M3a1lBaWNUWDVGOFNDeVF4cUlz?=
 =?utf-8?B?NnFvSWJwc0pETUJJcTNUOTNIL0NYNEFuOVZJUms4RzNraEV5SmVJV3VDczRt?=
 =?utf-8?B?VlRUZlczU1FseTJwYlh6WmJXVEQ4Yi9XWnF1V1FwTWtSR0x1WFNTUEU3VTBX?=
 =?utf-8?B?ajlUSk5QdlU0dDZacXRTbmsycE53c0trYTlFaVpoWUNOYnFwQUNpcGpZdmlI?=
 =?utf-8?B?NjkvRmUxNTBLZVRzRW4yem5UOUE4WmNJV1RjTUdTWkFsQ2EyT2dWaSt3QzRV?=
 =?utf-8?B?VE9Va1ZmWi8xcjdPRC9zTzZ3UWtyREZpWnE2Z0haMnV0cUxYQWEwQllKSTJD?=
 =?utf-8?B?SllJbmxqRzAxR2ZQdzU4aWxOazdhaEo1ak9Wa3ZFYlhveDQ2L1Y2dkx2Wkdn?=
 =?utf-8?B?SkdXcjJGYUF5SEs5ZHVSeW80SC9RSnNwelRmSjhRMkVTQ3VzOWs5VWZlaThS?=
 =?utf-8?B?Zkh6b1c0Y3dVcjZVNHUveW4rZXkxVGRhWEpDSkt4blB1S0t3SE9rVzZVcG9B?=
 =?utf-8?B?SFlSWWxFNThQdzV2bFRpRnQ3eDJmaVdDWm8xc1VRRTVBYjZFRDdtYjVFUHVi?=
 =?utf-8?B?cWluZUhiQ0ZzS2VSVEZrQXFlU3FsY2sxTzNkcDhMYUV5b0NBa2dhaGNOTDha?=
 =?utf-8?B?VndkS25ZWHVnUDZ0MGJ6VmtSR0JnOGZGcjF1RnByZ2x6cG4wZnljR0ZIeFpM?=
 =?utf-8?B?K1Z3NjlPK3dBdkEzeWRLL1VmR25vRm1YVi9yekhpL1Awb3VwcmhHUjFaRWNT?=
 =?utf-8?B?YWp0RnI4UkcyM0hhSWdIRHpHaDJTYmZoRS80emNGblhBZi85dTdGd3U0VVhs?=
 =?utf-8?B?ZDNYSmlVcFZ3a0YzY011eGZXa1N0bDZZMGk0WTRSeUpLSVQyK2NvZVpud1Jn?=
 =?utf-8?B?YzJsUjJQcHVWVEFCV3diN3JTeERxZzh5Z0ZjdGJTeFkvQmlSMGEzeks5VEdN?=
 =?utf-8?B?N0RrVzg3d1ZnQzU0aDJPQ1F0aEo0dEcvVlJBL0JSaWZCc0VXS21zRU5ZZkxk?=
 =?utf-8?B?MTZNRmZQZktvbnA3dEhGVU9FZXp5K1NGaWRMK0RxT1cwU09TbHozOCtKT0NL?=
 =?utf-8?B?clZlVHNMMnh0WUkzYUtDOEJYRFUxNGR2UlNRanhvbXZ3WkxaQzI3M0xqcHNT?=
 =?utf-8?B?NGUrZGx6K0hDSFJLUWp3a0U1VW9QY1BEamV2ZW1ZTE1uWnUxOVNRcFhrZytr?=
 =?utf-8?B?WmxQOWRvcnhoUzUwQzJVUFc5dGFqS2dtTzJYTjlRRFJVdUwwRlpobWMzOG9s?=
 =?utf-8?B?MUNTajdyL3BEb2U0ZXhZYXI3WUpIL0ZJcnYxbGFuMWh3TmhQUEZ6MTlNV09F?=
 =?utf-8?Q?ririhkY3nFClIVZwT7hhVupwC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53216402-c914-40a1-0703-08da94dab65a
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2022 16:20:31.1668
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lGE+3mbyF3Bkoj42cjucWahUTSDpQ3qlmQRygLsmCkVR4mqGbEPWbE8+DFjBwpcAdeP3URfWdbpNJJgwMp5Ebg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4438


On 12/09/2022 12:59, Michal Orzel wrote:
> Get rid of references to XEN_PASSTHROUGH_PATHS, as there is no such option
> and it should be replaced with DOMU_PASSTHROUGH_PATHS[number].
>
> Update PASSTHROUGH_DTS_REPO example. The directory storing partial device
> trees is now device-trees-2021.2/zcu102 instead of device-trees-2021.2.
>
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
Reviewed-by: Ayan Kumar Halder <ayankuma@amd.com>
> ---
>   README.md | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/README.md b/README.md
> index 041818349954..da9ba788a3bf 100644
> --- a/README.md
> +++ b/README.md
> @@ -34,7 +34,7 @@ BOOT_CMD="booti"
>   DEVICE_TREE="mpsoc.dtb"
>   XEN="xen"
>   XEN_CMD="console=dtuart dtuart=serial0 dom0_mem=1G dom0_max_vcpus=1 bootscrub=0 vwfi=native sched=null"
> -PASSTHROUGH_DTS_REPO="git@github.com:Xilinx/xen-passthrough-device-trees.git device-trees-2021.2"
> +PASSTHROUGH_DTS_REPO="git@github.com:Xilinx/xen-passthrough-device-trees.git device-trees-2021.2/zcu102"
>   DOM0_KERNEL="Image-dom0"
>   DOM0_CMD="console=hvc0 earlycon=xen earlyprintk=xen clk_ignore_unused"
>   DOM0_RAMDISK="dom0-ramdisk.cpio"
> @@ -99,9 +99,9 @@ Where:
>   
>   - PASSTHROUGH_DTS_REPO specifies the git repository and/or the directory
>     which contains the partial device trees. This is optional. However, if
> -  this is specified, then XEN_PASSTHROUGH_PATHS need to be specified.
> +  this is specified, then DOMU_PASSTHROUGH_PATHS[number] need to be specified.
>     uboot-script-gen will compile the partial device trees which have
> -  been specified in XEN_PASSTHROUGH_PATHS.
> +  been specified in DOMU_PASSTHROUGH_PATHS[number].
>   
>   - DOM0_KERNEL specifies the Dom0 kernel file to load.
>     For dom0less configurations, the parameter is optional.

