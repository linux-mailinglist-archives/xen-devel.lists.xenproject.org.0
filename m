Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB03B746ED4
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jul 2023 12:38:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558240.872147 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGdPA-0003px-9F; Tue, 04 Jul 2023 10:37:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558240.872147; Tue, 04 Jul 2023 10:37:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGdPA-0003nw-4S; Tue, 04 Jul 2023 10:37:08 +0000
Received: by outflank-mailman (input) for mailman id 558240;
 Tue, 04 Jul 2023 10:37:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gy6C=CW=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1qGdP8-0003nq-1r
 for xen-devel@lists.xenproject.org; Tue, 04 Jul 2023 10:37:06 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20602.outbound.protection.outlook.com
 [2a01:111:f400:7e8d::602])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b61b1842-1a56-11ee-8611-37d641c3527e;
 Tue, 04 Jul 2023 12:37:03 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by PH7PR12MB8015.namprd12.prod.outlook.com (2603:10b6:510:26a::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Tue, 4 Jul
 2023 10:36:57 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::8018:78f7:1b08:7a54]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::8018:78f7:1b08:7a54%2]) with mapi id 15.20.6544.024; Tue, 4 Jul 2023
 10:36:57 +0000
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
X-Inumbo-ID: b61b1842-1a56-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YV/ULC8jdRav2Z/oiP2bCUuzmVFplGVxOLROBKw880zctX5NjsbUou/j+9gml0E0hCK4fjQdt51PcLoaXrrwK13iFgADQWDWLeaUTsM9X1KzyAJHzIMFWHSTmN3W6ZLPaMyR72jJYE5wTGliiI/gfuN+xGJ0TqZGRrzwoQ7SiyZQKrBogqGWnTk9ejXDca0vy/lX4Ids27r4h3VLV/IpQ+DYNF0Tr62MkoDQn87akI0yt/ql6D4BVmOCdKUpdEGDa0er7zYHzWGlriOAdEIl+p7h4lG2eChciptSFL6H6MGuPYC6DZZfsNuDHE5T3IsmBVQtE4TUCqOelk9HdfNnEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PJUjuyEd1TRdKKm1b4FR9xxd+vZ5JueFE4Et58xUmqs=;
 b=KO2EHMN4+p6ou6ixrO/7ShOmkHKmk83tlC9uUz6gJKdaLiWCD/21hK7rGYU+CjX6z18pFQQledpWOg8eYeSYUUS40smowrKwwS76AEvGL9aaiGWleL81+QxXmnUVY6WPZ/aG9O6H+rPiZHMO798Rrd0t3Bgj6i4dvQNLWttHnc4d1bfeaLJdYxg061EC/kG+eIGbTDlizIAY6TeGck2PiF51PyCiDHwbIFt6FVg+HGFVbgzyDFOW/QtyHm2XC2a2KowYMbEWEHum/TVyQiT0XIzRqR6ZH3cdp3d9e7YEOZ8V6j+/Z17FCa1oARUgY8IbUArx3YUSP6miXwkYNsMwkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PJUjuyEd1TRdKKm1b4FR9xxd+vZ5JueFE4Et58xUmqs=;
 b=ECTbz6dR+/qsrqBThMeoivFiUnKwHyrFp867EqfPRPYO2jkVuS+5tO34EL4N8UfJjKutmLAQaIY5c/kTSYvllCN4ZXSC3g2H+RMIOIfIepD5I7RMP/ri1RxuW4iBwRkjXotR7y+lYa2W1AvcEQEiX0XPwmxmUwVOBbK3dt7Oa24=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <cb7e3d34-bbb8-e5df-f87b-0fcac4b65378@amd.com>
Date: Tue, 4 Jul 2023 11:36:51 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 03/52] xen/arm: add an option to define Xen start
 address for Armv8-R
To: Penny Zheng <Penny.Zheng@arm.com>, xen-devel@lists.xenproject.org
Cc: Wei Chen <wei.chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
 <20230626033443.2943270-4-Penny.Zheng@arm.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <20230626033443.2943270-4-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0191.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:311::19) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|PH7PR12MB8015:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a612fa2-c3dc-44ad-4725-08db7c7a9737
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UH+QxOw97lKT1oXpCfTK+NosbhFF0Ms+e90DeSrSt3DqJJO2WCDATTJEnuS9RdHsG8ngC7IxIy2wSSB41JUbdWv5suBpf0gG+5oZWFfaVL9/NVGjcdfbXZx1CwlarP3go4eIpbI0OkUH0b1Z3oIkIOv3t9pQNMbxwZok1SnY5O5H5HVsi0m5mJcalEqtcIwTa9NeXWwV9R76UGJCn/+jMxwFOFocGScnC/1Jdq8mE7pqT1B+oLY0CT4QHHKG9z0NhO1/26KsAYoQp8GQpXlmBemfBuCh7WwKMxlZrdHmz202hXBzwxYzw49wz3JmAGMl3ZIfcW+UfNSvj99w8GWAw69gFtrXAyX+nbIgujLzhk46CT1U9iorx4jmKrph0ESs0BoN9Fd6ecWndNb5DRintrlLHWN6grTqMvvWfy4txxNaKtpzFm/obugt8wvbd8R3A6MKWmlxhErXpH/Uug1kTOFn1FVqJMBa9kjvOEFj3F7Kk0KN5n5QbuQEXjr4Ldlr18ldpFdcgHoMzlqAOz6XztyAagSidKC9de7HPVe/RJY2JGpl0xa5f4IZKNeBlrwALD7u+XoYfN2JSTpuzf7NjmURW6YNVSjjsgUZ7WLCLRUd3h4L97i3VhNMQ/M5i/4+DtelwgaFYumrxn0JdzSASA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(136003)(346002)(39860400002)(366004)(451199021)(6666004)(38100700002)(2906002)(6486002)(54906003)(8936002)(8676002)(36756003)(41300700001)(5660300002)(478600001)(31696002)(66946007)(66556008)(66476007)(53546011)(186003)(6506007)(26005)(6512007)(4326008)(316002)(31686004)(2616005)(966005)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RDVlTzFRc1BjcHhrenhpaDFVa2tFRURsdVh1Y1hoL3NnVEpWNjVnOTBxUjR0?=
 =?utf-8?B?ZENMcmEzbUh6bDAyR2lkWG9Rc0wrelNzaUZWZDlmckJrd2U2VkJabVQ3ZWFt?=
 =?utf-8?B?Wkh6RU9oWTdJakxXVFdzTktjb0toNjE0Mi9sREtEdkVFRFZobURDYzg0cS9j?=
 =?utf-8?B?aXVMbm1RRTNtaUhEREdURDd1NXFJd09kcjNML0c5bG1IVTVPdzQ3SXVJN1dF?=
 =?utf-8?B?TWh6OXcydmM4Z3VndGI4djZ3dW1VVmwvQ2w2dEpMQkN2UGNOOGVabDdpSDBt?=
 =?utf-8?B?SU5JemtqQ1V5aU5JL3FZQUJHNjNPOVRGanYzME05K2VmMXQrMHFoR1AwRVNC?=
 =?utf-8?B?TGdBNXBYV0hqOS81TTN6K21kWDhWZFo4Q092OHBuY3lGV0FOREo1VmdUcFYr?=
 =?utf-8?B?QnFRUUIvSG1hdUp5bFk4TXpOM3VCcTYwTCtUSzlMRFZORENOV1QvNG1JK2p0?=
 =?utf-8?B?NU9sRk1nN21NUlU0V1d6WGJaZ3BtUW0vL3dHb3ZDN0pxazV3bVpjVytEMUZF?=
 =?utf-8?B?djg5emJvZmx0SGJlYnpIRWtFTHA4QTdqWEx5ZERkTDVrTkVUMWZmS2lCZGxq?=
 =?utf-8?B?bGQveUFWaWx1ZUNvVVRUV0FEOCtTOW9EZ2lXd20xeUg4b1VzQjZNYjJDU016?=
 =?utf-8?B?b3dlQytIZWV0T2tPRGRsNk9VR3dxWVRVeWg0N3kxOWh5YjRzSEZOa0RZb3hu?=
 =?utf-8?B?KzIvaGtKN01KbThUWFZBaXpiL0FSU3lwUHI2Q2RiN1dTUFNZeFZpaUppRzM5?=
 =?utf-8?B?UDhRZDBQTUdRN1k5WmFvaFZMczJKYnFodkl4TUFreTVpUnNrbCtVSlc1eWpC?=
 =?utf-8?B?cG9zUWQzUDlGRTNrclcvcnZXRjllWFhob2tJZnRNSU8vT2dyRG1pOWoxNVhU?=
 =?utf-8?B?YTVUL1IvZUZ3RU55UWZPRkNNWXhId1o3a015OHRxU3YwdXdNcTFvSGQxdks5?=
 =?utf-8?B?Qnh4eXg4UFM3ajNibGVGOHF2Q3hpVUNRR3ZMR2pMdUNKdFZkWS9IYXhHWG1Q?=
 =?utf-8?B?aWYyaDBZcTBldDdTM2xxMjVPNDE5cG9kRGladmw0dE5pSVlZak01RlBVSGJS?=
 =?utf-8?B?dFQzc0NnMTRjNU5DdkV2Z2V3em9zeGZ3S2pFSDBxYjdjV0VHcTZLKzQxV2x5?=
 =?utf-8?B?eHlJYWtSb2ZYaEhkdGlBUTdZRmw2aTJmYWZqaVdIUWVMS2dRTEVJK2hnNWJZ?=
 =?utf-8?B?aEkwMjkvVHNIZVUrOWppMCsxYjZmaUhIL3hzRVcyUmxYSzhFVFlTaGFLNWl6?=
 =?utf-8?B?c01NM1Ztc0lCS3ppVkdmY1Rnc3NHZzd2UUg1ejBBNlBieDZwNEVZVGpydGRU?=
 =?utf-8?B?Y21LdFhhQVRMNzR1SmZiSXZvaGpJVkZaMC9TZ2x4OWJqV1JtTk1IZFdxRlpP?=
 =?utf-8?B?dWxkRG8vMDhFQVd1bE5zOVdhRUtWTldQdkU1WUtzK3lxdTdXMzJqM2pjUGN2?=
 =?utf-8?B?cFFvMS9Sc2tDZFFCYXZrVGtudGh1SThFQzgvcHYvRURwc0V0TEhpVjU4T2Vu?=
 =?utf-8?B?SmVKc2hkSzFoVWU2TnNwck85bGk0MGJKeWNCcWV6b05Fd0dBUSs1WjRYZG1x?=
 =?utf-8?B?R0lxMnZBMFphMGFvU2ZQRlh0TmdFSmlGM0Q0VytSNlQ5ZXFBdnZuaUhEaGhB?=
 =?utf-8?B?QUw2UzZxbFEyZFZTemxJOXFlY2tNdDNneFpnWUFScXVEc24rd01senVlV2xV?=
 =?utf-8?B?NTFNQ0xEMlN6ODNZcUFoNWxDZVB5TWJNK1hmcFhpOENjVGtRbm9BU1B3eW1X?=
 =?utf-8?B?SUswbDFlblZxRCt4bHB0SlJzZzlyb2RPRDhRWGZhVElXODRxaUg5d3pvaWw5?=
 =?utf-8?B?R3pRVTMzY283OXB6UXRkT1NsUEM0WitkWTYveE80elk3ekYydHhXUE5oYUpI?=
 =?utf-8?B?eVU0UEZuM29jaGRQUFZNdm9seGw2V0NjT1JEUThzOEYvVjB4SzN1TGFtMGNl?=
 =?utf-8?B?OHBWVHJPVDV5QWE0bTJLSllqVmRPcXUrU1BvTmFodkY2OEx5cWwvUmJYZlpW?=
 =?utf-8?B?c24wa2YxYjdrS011d05Zd2FySGJ6ZU5pM28wQ0RaS1Y1ckVhNlVjNHIwMi9J?=
 =?utf-8?B?eU5MTS9mNGVHUmNpOUR0bGd4MCtSZGUrc3ZwWnYrZ3RYQUJvWFp1SXZadWZ5?=
 =?utf-8?Q?0fcnfQrs5wX/XS4yUirmPRamp?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a612fa2-c3dc-44ad-4725-08db7c7a9737
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2023 10:36:56.9204
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OnTkVpegT3v/8yG1SZ34GxwAKvBqXcTV0aaPLcUe170xX/4rRzVkipoemdQxp5ZbFQqhj2H8mCLiRcL9hmV5Mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8015

Hi Penny,

On 26/06/2023 04:33, Penny Zheng wrote:
> CAUTION: This message has originated from an External Source. Please use proper judgment and caution when opening attachments, clicking links, or responding to this email.
>
>
> From: Wei Chen <wei.chen@arm.com>
>
> On Armv8-A, Xen has a fixed virtual start address (link address
> too) for all Armv8-A platforms. In an MMU based system, Xen can
> map its loaded address to this virtual start address. So, on
> Armv8-A platforms, the Xen start address does not need to be
> configurable. But on Armv8-R platforms, there is no MMU to map
> loaded address to a fixed virtual address and different platforms
> will have very different address space layout. So Xen cannot use
> a fixed physical address on MPU based system and need to have it
> configurable.
>
> In this patch we introduce one Kconfig option for users to define
> the default Xen start address for Armv8-R. Users can enter the
> address in config time, or select the tailored platform config
> file from arch/arm/configs.
>
> And as we introduced Armv8-R to Xen, that means the existed Arm64
> MMU based platforms should not be listed in Armv8-R platform
> list, so we add !HAS_MPU dependency for these platforms.
>
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> ---
> v1 -> v2:
> 1. Remove the platform header fvp_baser.h.
> 2. Remove the default start address for fvp_baser64.
> 3. Remove the description of default address from commit log.
> 4. Change HAS_MPU to ARM_V8R for Xen start address dependency.
>     No matter Arm-v8r board has MPU or not, it always need to
>     specify the start address.
> ---
> v3:
> 1. Remove unrelated change of "CONFIG_FVP_BASER"
> 2. Change ARM_V8R to HAS_MPU for Xen start address dependency
> ---
>   xen/arch/arm/Kconfig           | 8 ++++++++
>   xen/arch/arm/platforms/Kconfig | 8 +++++---
>   2 files changed, 13 insertions(+), 3 deletions(-)
>
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index 70fdc2ba63..ff17345cdb 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -181,6 +181,14 @@ config TEE
>            This option enables generic TEE mediators support. It allows guests
>            to access real TEE via one of TEE mediators implemented in XEN.
>
> +config XEN_START_ADDRESS
> +       hex "Xen start address: keep default to use platform defined address"
> +       default 0
> +       depends on HAS_MPU
> +       help
> +         This option allows to set the customized address at which Xen will be
> +         linked on MPU systems. This address must be aligned to a page size.
> +
>   source "arch/arm/tee/Kconfig"
>
>   config STATIC_SHM
> diff --git a/xen/arch/arm/platforms/Kconfig b/xen/arch/arm/platforms/Kconfig
> index c93a6b2756..75af48b5f9 100644
> --- a/xen/arch/arm/platforms/Kconfig
> +++ b/xen/arch/arm/platforms/Kconfig
> @@ -1,6 +1,7 @@
>   choice
>          prompt "Platform Support"
>          default ALL_PLAT
> +       default NO_PLAT if HAS_MPU

I am a bit concerned about this as we will be introducing R52 specific 
platform in xen/arch/arm/platforms/

(For eg 
https://github.com/Xilinx/xen/blob/xlnx_rebase_4.17/xen/arch/arm_mpu/platforms/amd-versal-net.c 
)

Thus, we will have to remove this line at that time.

Can you remove this line, please if it does not cause any issue ?

- Ayan

>          ---help---
>          Choose which hardware platform to enable in Xen.
>
> @@ -8,13 +9,14 @@ choice
>
>   config ALL_PLAT
>          bool "All Platforms"
> +       depends on !HAS_MPU
>          ---help---
>          Enable support for all available hardware platforms. It doesn't
>          automatically select any of the related drivers.
>
>   config QEMU
>          bool "QEMU aarch virt machine support"
> -       depends on ARM_64
> +       depends on ARM_64 && !HAS_MPU
>          select GICV3
>          select HAS_PL011
>          ---help---
> @@ -23,7 +25,7 @@ config QEMU
>
>   config RCAR3
>          bool "Renesas RCar3 support"
> -       depends on ARM_64
> +       depends on ARM_64 && !HAS_MPU
>          select HAS_SCIF
>          select IPMMU_VMSA
>          ---help---
> @@ -31,7 +33,7 @@ config RCAR3
>
>   config MPSOC
>          bool "Xilinx Ultrascale+ MPSoC support"
> -       depends on ARM_64
> +       depends on ARM_64 && !HAS_MPU
>          select HAS_CADENCE_UART
>          select ARM_SMMU
>          ---help---
> --
> 2.25.1
>
>

