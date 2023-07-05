Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6A5748A0A
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jul 2023 19:21:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559469.874478 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH6BN-0004gH-3s; Wed, 05 Jul 2023 17:20:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559469.874478; Wed, 05 Jul 2023 17:20:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH6BN-0004dM-19; Wed, 05 Jul 2023 17:20:49 +0000
Received: by outflank-mailman (input) for mailman id 559469;
 Wed, 05 Jul 2023 17:20:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gl5h=CX=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1qH6BL-0004dC-A6
 for xen-devel@lists.xenproject.org; Wed, 05 Jul 2023 17:20:47 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20622.outbound.protection.outlook.com
 [2a01:111:f400:7e8b::622])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 44bd7c04-1b58-11ee-8611-37d641c3527e;
 Wed, 05 Jul 2023 19:20:43 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by DM6PR12MB5519.namprd12.prod.outlook.com (2603:10b6:5:1b5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Wed, 5 Jul
 2023 17:20:39 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::8018:78f7:1b08:7a54]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::8018:78f7:1b08:7a54%2]) with mapi id 15.20.6544.024; Wed, 5 Jul 2023
 17:20:39 +0000
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
X-Inumbo-ID: 44bd7c04-1b58-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C4mfbyeNN2cuVaaWgGOJ2rSlvgDVAL5rfzwy7CkZUFaw/NGYj1rwK50+aaYhVCOBdr4BY3Zup5WEpSxy/oZWXS58VWGDTkAXFo82DIw/Ru4Cm0uqjqFE135Op5v8xMXRSQZtET36Lui2e0875wT6bcM6DvUCcso+a3fGgm1WIW/TkNv2vAxGNfiSP+oVYR/5LKyd6JtuL5tj7tkAHclkBdmU5TpTg1wF2XcArcMMzRayAHKG9dP7JyVHj3Ix1RLvzHGFjHxi5DYSvo0KqcLngrPiNTViFC+WX/OH4y2Fw5lmbj2d3mT/IbDl1MObobe2Fzw8ieENrh/QCMl1diLK3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JKgoBxJu6agzDjVMWOWJwdJ1oYzgFy9V/XL4tulXSys=;
 b=ffTPtwUemzn9OAAZfI3CAJr5teNn3iFbUnpKC8Cz+ESMT0v50Ex5C7pTcya3rAWwl2W7+/+qv7eczV6vohM6ngILRkhl/iSTQeaxgzedydrZgeCKzs5yt8V0iaGX8QHqb/KyDJIWXd/v+vGIgY2/QifbmpRIiZukAzYtlPD676Gb0fTY2/gBDv/pcA+wwoQPyK/NVKgdNLx+hbb/+Npy3yeKN72DbkiOws4IYEBKB391VcnVpwvQT3E+KFZqtGWxHTdcBgM5dVZHzGvdhE0yWjM2w31CEoSTPafQ+D4XQ4kNtTon+iauS4xDOHxpEB0Ux5P12us5FE54WEmMSzvZvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JKgoBxJu6agzDjVMWOWJwdJ1oYzgFy9V/XL4tulXSys=;
 b=oJcHHsTg7539cTv+fUDfDnySHnCwOzWEuYLYQZZAkBjSm1H7ly/5AWRwnOJQve4BJkx5RspQPYDa0PUjiEjmd8ziROX9FVK6TU8KDI7NfAei3IKQ6wtcKFaMq/5JBzfWhYk1YIvUt5TkauRRBCGlnVG7hBSj0Y2rT/tuoFt5tpI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <e88e1685-0ba1-8c2a-9a9a-d9fad631018d@amd.com>
Date: Wed, 5 Jul 2023 18:20:33 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 52/52] xen/arm: add Kconfig option CONFIG_HAS_MPU to
 enable MPU system support
To: Penny Zheng <Penny.Zheng@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Chen <wei.chen@arm.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
 <20230626033443.2943270-53-Penny.Zheng@arm.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <20230626033443.2943270-53-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0129.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9f::21) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|DM6PR12MB5519:EE_
X-MS-Office365-Filtering-Correlation-Id: b1d37988-512f-46ab-48ee-08db7d7c2769
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RukKHwSQ+caOCQK5jQqpkwB2jGj2+LVDDluyJZNUhSBohH8Jq9FIxN5JurkzaAzY/IN0wCQCm0I6gyQIClCXsIJT1w8p+nt+fab592JszL7GBVoesRcqz1JymHSw/w2F42+1MZxCCw1Q3ZCYP+delcQcZoG5G9AZwxSJUbeW/qjGIK5rr2J4ZRTrWlsAOiH8VZP5LREAl2OnfPPBGph9DCxqZrfJ+BC7IryKAqLibQunLUJPb1o1mjTT3tvkLNcDfiQSP2f+yDm2zJdsYxOMu2efrbOs19vblD7tXk3NRIo/1DdGjJjcdC0sfsirLNGhns/pq7mdjiOK3deGCr8Td9OlIUmm57Hc7dxMsgA7QbRO7E5hN3X4kPIME5ko2igLq8yBZIUJvxC7zPD8hwqctXlvJJ1WgpLGeJUcG46syx7Fw4Hr/5z8dudbFwpUHPCjgGz19QKq7/nVYzhQEjYxF+rtITyVEd8FmTff8RyPR5tLaw7Op47R3a6MKVkruxKZnM53hGjOJEM+UsN6W+l12oRArjS2odoYCic9fjhZNeQY7z2eVR7uJq5MlyMQNErNGWsGzVS0/73kQ9/3lng/4EoJt4bmFCxZDKXvvjRJlgH7W7McY05zXVRGZboqeFYsibJ0lEWFyBjJ4a2QwY/9NA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(136003)(39860400002)(366004)(396003)(451199021)(26005)(6506007)(31686004)(478600001)(6666004)(6512007)(2616005)(31696002)(186003)(66556008)(38100700002)(54906003)(66476007)(53546011)(4326008)(66946007)(83380400001)(316002)(6486002)(5660300002)(8676002)(8936002)(41300700001)(2906002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MjB5Nm8rdko0ZXJlRjR3dnppSXhFOE5DN3cyUklJbG5nSnNRMWdtTTdsM3dJ?=
 =?utf-8?B?ZVBYNjkvL2s0ajhpTU9NZElWTVJCeHZoWG1ObWFGTzRjb3pXd2lpSVpERmE3?=
 =?utf-8?B?a0tIUmhnYWppZTBTd210eFRJcjRmVWU1OG5hbGVPM2VYNWg2VUQvcmo2QmRv?=
 =?utf-8?B?b3hsbU1DKzRyL1k5WFRqN0J2YjRhbFZzOXFEeUp5bE9reHJ6MFM2RGJ4eXdi?=
 =?utf-8?B?dGJnL3RVM0h0bG1yMjlCeGZrLzVELzVzS0pBdWZvRDVVRTU3dStNaVZNOFp4?=
 =?utf-8?B?bUVvRDFwRk5wSWJlUUFvNyt6WkRLbERRQUE3blhtdFE0Vnh2Q1ZOaXdaRzlh?=
 =?utf-8?B?bzVMeGthbHlBZjNtanZWdXpwQW9rOVhNQ3pnQnZYdzN2Zk1WazVYVi93clpS?=
 =?utf-8?B?TXVsQzNDbFVDekdPaThOcXVJbzI3NDJrbk5rd1c1bWZIT0QxNVRuSzVhVS9G?=
 =?utf-8?B?SWxEOWZUOXlPRlVidDMvbTAxVVBEbGxMNGljZ0ZqVStOeW8zeXdXcTJvbnV2?=
 =?utf-8?B?RGNXYWpZVzdGRHEwTVRjSVd1Z3FoRXdld0dvMHZrUkdTdzJ1QmsySGxJQkVI?=
 =?utf-8?B?Vlh0bXRKbDdKRXpuRzc5R2tROWVhU2g5blM2NWJ0cEpkVDFkaGZYbUp5aWlJ?=
 =?utf-8?B?Zmw0K2FBZXdCNm5GSTlMNitTWHVZWDNPdUM2aUNkUVNyQnMvcXJFM0dQL2Zj?=
 =?utf-8?B?L0tuR0N6Qm1tMU9wazdydFoxMEFWZHFBMUhQZUVQSHBZS2lTVVRiYWZrWlQw?=
 =?utf-8?B?Ulg3ZmFiZXV1dzBvcmM4NGNsS2NFS2ROMGd6c0dsSGEvVHY5SU4xdmFrTkhO?=
 =?utf-8?B?V3Y5L3dQQktKdDZhd3FBSE9LSFNPRUJwVXRqekZZRm9NVnhKY0hFV1dJbDUv?=
 =?utf-8?B?TVBzbUIxSVVLTWd0VW10VHNrdXMyanNYZG1ISzR2WFd5RElZZEV2aFVSVEV3?=
 =?utf-8?B?SnpXNGlSZGRNZ2hwbGJzQkZiV3BBdU82TllYVXhYQzBtK01TQnRBVzFnTW84?=
 =?utf-8?B?Q1lLSTBYZmZzKzZWWmwwZFJCc2tzWkV5aUt4SWd1clcrR0FSNlRaZHVKQTVC?=
 =?utf-8?B?VjdPeWpsSGdnQmZXemxiWDlqNUVqeFI3OFhVZ0VEN2ZxQ1l6Sm1SVkhIUXpU?=
 =?utf-8?B?SllVejEzd1RFTTB2UEpCMXpFT1ZOMEpLQ1dyeU9qTkprbXppK2kwT0krNFll?=
 =?utf-8?B?TTIyRWFia3ZZZytkeVFGeUFpN3Jpb2tabC94bFFYTGxQcGFiL3V3QzhwalhU?=
 =?utf-8?B?ZVJqT2FKcm12V3locXZtSWVwQmR2cjBpa3B3WGUrc0NMZUNGa0ZQdXdWaGZ6?=
 =?utf-8?B?UUg4RnpxM2ZjOTVGYkEvd2ZtSFI0UFA5ZEtYNUc1NkdHMTNRWjBIT0R1Sllu?=
 =?utf-8?B?QStZeVI1ZysxUkFBTFhaS1I0SWV2QU04a0lTdFBneTRNRlZ6K3k3ZEwyaEJ0?=
 =?utf-8?B?ZVF0R083amc2aFBJNHNzeW9XaG4wdHc0QWs3RkpHY3BMWVRaZTZEWC8raGht?=
 =?utf-8?B?TWdPTjZhU1M0ckJlMS92Uk94aTNKRFFCMklvWFF0OXRvVzlDMjBpNzdjNlVU?=
 =?utf-8?B?ME1MVmRVNWcxelY3V2R1Rnd6RldWdFlQeGx2VjEwNWppdkFSNnVkZnBKMzJY?=
 =?utf-8?B?dXBiQjRON1oyalNKSTc4Vzl0NEg4eGxubnNTNVEzTmN2ZE0rSm9vbmFEbmFF?=
 =?utf-8?B?aExvYlNUektjOElhaG1SR1hFSEZzSTVzSkEvWWlFWlIwa05CRFNLcWhUN2RD?=
 =?utf-8?B?eW5RQ0dOcVQ5aW5jR09nN0lRUEZQRm04bjdhVjEvcDQ1VDVwWllORnByT29K?=
 =?utf-8?B?aHZvVXJkSEZyYnk4Ty96cjBFZklWcldMcXFySWJpWU9rNFIzVlVRUjRJNExM?=
 =?utf-8?B?V0hUcHZuSkgvV0EvNm9Td3NvTnZYQ2xIaHFhOTU1ejhXdzdySklDeXZHR1cw?=
 =?utf-8?B?YlNmbXJMelJodmFpb1JIUHQwT1VqcUN2ZmoxL3gvQlk1K2xuVmVNeWdsUmlx?=
 =?utf-8?B?bTJlanduR002bDR5S3pJaG9PTmMyejFXQ09aZ0svUXEvczhGUzBkbWk4R3ZJ?=
 =?utf-8?B?bXFqTXZ0SG9iSDExQ2dZNWZaWXJsQ0cyVDJtK0tFd01LWmpXbzJpbkFiTFBr?=
 =?utf-8?Q?ZRuLIG9TsQpstGvuyggvQUQXC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1d37988-512f-46ab-48ee-08db7d7c2769
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2023 17:20:39.7100
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MVV0HxsIu3+6cwOhf6b6s+3D1qHN9b3UoH8paCxfvKshve0ol8GrkmaqyI57rtWTHFzJwH3dUimBD9jbBCOsIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB5519


On 26/06/2023 04:34, Penny Zheng wrote:
> CAUTION: This message has originated from an External Source. Please use proper judgment and caution when opening attachments, clicking links, or responding to this email.
>
>
> Introduce a Kconfig option CONFIG_HAS_MPU to enable MPU architecture
> support. STATIC_MEMORY, ARCH_MAP_DOMAIN_PAGE and ARM_SECURE_STATE will
> be selected by MPU system by default. Also, features like, ARM_EFI, are
> not supported right now.
>
> Current MPU system design is only for ARM 64-bit platform.
>
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> ---
> v3:
> - select ARCH_MAP_DOMAIN_PAGE and ARM_SECURE_STATE
> - remove platform-specific config: CONFIG_ARM_V8R
> ---
>   xen/arch/arm/Kconfig | 14 +++++++++++++-
>   1 file changed, 13 insertions(+), 1 deletion(-)
>
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index 3f67aacbbf..2acdf39ec8 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -62,6 +62,7 @@ source "arch/Kconfig"
>   config HAS_MMU
>          bool "Memory Management Unit support in a VMSA system"
>          default y
> +       depends on !HAS_MPU
>          select HAS_PAGING_MEMPOOL
>          select HAS_PMAP
>          select HAS_VMAP
> @@ -70,6 +71,17 @@ config HAS_MMU
>            a memory system through a set of virtual to physical address mappings and associated memory
>            properties held in memory-mapped tables known as translation tables.
>
> +config HAS_MPU
> +       bool "Memory Protection Unit support in a PMSA system"
> +       default n
> +       depends on ARM_64
This will not be true as R52 will support MPU
> +       select ARCH_MAP_DOMAIN_PAGE
> +       select ARM_SECURE_STATE
Also, R52 does not support secure state.
> +       select STATIC_MEMORY
> +       help
> +         The PMSA is based on a Memory Protection Unit (MPU), which provides a much simpler
> +         memory protection scheme than the MMU based VMSA.
> +

Instead, I will suggest something like this :-

config ARM_V8R
     bool "ARMv8-R AArch64 architecture support (UNSUPPORTED)" if 
UNSUPPORTED
     default n
     select HAS_MPU
     select ARM_SECURE_STATE
     select STATIC_MEMORY
     depends on ARM_64
     help
       This option enables Armv8-R profile for Arm64. Enabling this option
       results in selecting MPU.


So, that later on we can add :-

config AARCH32_V8R
     bool "AArch32 Arm V8R Support (UNSUPPORTED)" if UNSUPPORTED
     default n
     select HAS_MPU
     select STATIC_MEMORY
     depends on ARM_32
     help
       This option enables Armv8-R profile for Arm32.

- Ayan

>   config HAS_FIXMAP
>          bool "Provide special-purpose 4K mapping slots in a VMSA"
>          depends on HAS_MMU
> @@ -85,7 +97,7 @@ config ACPI
>
>   config ARM_EFI
>          bool "UEFI boot service support"
> -       depends on ARM_64
> +       depends on ARM_64 && !HAS_MPU
>          default y
>          help
>            This option provides support for boot services through
> --
> 2.25.1
>
>

