Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA009746F67
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jul 2023 13:08:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558263.872186 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGdsj-0000ci-Ec; Tue, 04 Jul 2023 11:07:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558263.872186; Tue, 04 Jul 2023 11:07:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGdsj-0000aa-Ba; Tue, 04 Jul 2023 11:07:41 +0000
Received: by outflank-mailman (input) for mailman id 558263;
 Tue, 04 Jul 2023 11:07:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gy6C=CW=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1qGdsh-0000aS-6W
 for xen-devel@lists.xenproject.org; Tue, 04 Jul 2023 11:07:39 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20611.outbound.protection.outlook.com
 [2a01:111:f400:7eab::611])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fa932702-1a5a-11ee-8611-37d641c3527e;
 Tue, 04 Jul 2023 13:07:36 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by SA1PR12MB8920.namprd12.prod.outlook.com (2603:10b6:806:38e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Tue, 4 Jul
 2023 11:07:32 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::8018:78f7:1b08:7a54]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::8018:78f7:1b08:7a54%2]) with mapi id 15.20.6544.024; Tue, 4 Jul 2023
 11:07:32 +0000
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
X-Inumbo-ID: fa932702-1a5a-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F+XthAginLip73YFN46LqnsDbKC/cmYvz5kdx6cdD227qXDZgh1gFowlgMw2wBqAZ0YZM9//UWZl8LtYEIhj564Aodt0Ij3r4YkAqJsLOhgtv4p5XeGtAdNHA/SbwtDcRJ+OEX5IO3o+u/qpW+V+YNqCRx5i8mhH/klp3B289LlwDtRXjZ8A9WQmKU3YBZjQeZHodtasVnNrHybStE1TRjkdo78abK8036RhVtcAcl5zcUJ5VqVuCvwzu2/mOeJ3Dh2+jBAVedXYL08TZ12TO7tw+bpXBh3bFfsIHFFC7v06pBgLIY9hYVt1CFC89VAt2rUF+cPoNiAVmvYAG9wXLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ABLD5CfrQ/CoGwmoWpyJYZ3oFewgB4NwBVvtre4khZE=;
 b=Q+xvc4naTqeMeWF2x98Zmzq1y/HNeEIA8xCG+BxtXR2QQV36a9c193Ra2a2uX5i1BwM1BUx5XhtDhhzxpj3JhZQI42URsBiGLaJe2eB7B3ja1PtEw0tBn9O0JRLeQiLQVP1l4ST79ViirQn0Q1T6bdasLA37YOgKe46Fhld4/Hm493NBkQdKQPxSsxtvCGu4iKhSxw9Pg8CzoFtT2IyJy/jRRFeQwxI1Yn4v+8ALpSvd5l3nHBodda9ANr1Oo77dBhN3p+OQCzh9h7geGg8pk0rnigU8L4GhomDDzUjPCjaUYG86DaD5YDxzQiT/vrTMGjGFGUKQDEIAta/QYDFVfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ABLD5CfrQ/CoGwmoWpyJYZ3oFewgB4NwBVvtre4khZE=;
 b=YntzZdQ6YH4dgut0JTYh+8jKQprnQU8LpPpDYMnmlI8t+qRiFTVmg2tB44zLyDg7vBGsexgJ5AEWMlYPEPi3c0DJIFklnPqmxD1rFSJ0B137yiRnjabkHZ7cm/iBWgqf8hLt4kR3Kyl+/hhIzVOzJ7m51fnGkXQnHGT5lzIQ13w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <2d39d60d-f06d-50fc-6b9a-e3df227e80c0@amd.com>
Date: Tue, 4 Jul 2023 12:07:25 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 05/52] xen/arm64: head: Introduce enable_boot_mmu and
 enable_runtime_mmu
To: Penny Zheng <Penny.Zheng@arm.com>, xen-devel@lists.xenproject.org
Cc: Wei Chen <wei.chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
 <20230626033443.2943270-6-Penny.Zheng@arm.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <20230626033443.2943270-6-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0113.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:192::10) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|SA1PR12MB8920:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d4c7d0a-6f80-443f-ecf5-08db7c7edcf2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Dd0IHo+AzDZZ+ehSCssLUZKkRmxoL1ohn0sKVDiT38zYH31vQNz/29p6o3ygg16gH8PnVDvkwXOw0JVbfb3MRGyCpocEtVaGtbgDIJBoTtCRsOfRVahhgX+KBWJqIaOSmVj01P+UqO7WeDbas6uSk1gGAqZg9u9Jid1OxnKCi0HDo4A014E8jYKFcM1fQJZne1GzXFaexj1Jg3OhE9e9duo09LQY0/ZMzlo9Y51LeDphwMnbw0dcVLXAbpZOtimumejAGl28Iz1DmJJzI4MHYoSoMhsoHkYGaBllvRknKKKmOeJuHy0oc/USYB2Zqgzvn5FZmQN9YYERoFgJPAIzwh4h8feNiOQ2q9gyHZIkQphj9i9d0FJvbQISyQow3tQiVRd+ihXe/wMxn/qZ6cSuOQbHgOCiDP6Ml9/y27gDerfeWlEYf6Nvh9z77IANBfdJozYbGpK+W2Pfxu8X2XJf3k5Vco8fFon8cdu+8sL/khgI83UmmkpaKonsMBI690ubgJDMt229m4W/gA4eslf4e+1yuQR8Jdl2B09AIS17kCgvK+fKrq1TR1hWdmTDwhvJEdFUCiCL4wD6R3qsIgMC9LPLoECrDIkOAEZpWd+xZ7RWXgC/vibXdSFsQJyKfRZ0CEY8q/QuWSnZk9pjfj3kpg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(136003)(39860400002)(346002)(376002)(451199021)(2906002)(41300700001)(5660300002)(8676002)(8936002)(36756003)(31696002)(186003)(2616005)(478600001)(26005)(6506007)(6512007)(6666004)(31686004)(53546011)(6486002)(316002)(4326008)(66556008)(66946007)(38100700002)(54906003)(66476007)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N3l0QVBnNDU2ZE9vWFhjR2F1bzZ6aGtKL3hrbUNvS2JPNURFT2FGSDJWYkVN?=
 =?utf-8?B?SWE2T1kvVzY4bldGelArL1U3dkM3c1V5aDc4SEVCQzZ0RFIzalpVS3pHajYr?=
 =?utf-8?B?VVNmNk02UmNIaEpmMHlJRnpZd04wZlQxdzlNb0wxZUhxTHhxRjUyWS85NVNm?=
 =?utf-8?B?WllXQ2JVOEdEK0ZybXY4RE90d0c4WmZsckxXb3ZIV1N1NHpxUzhFWitEdDh2?=
 =?utf-8?B?eWlFM29sT1Y0a3NWTnhOMSsvbmhVTmpHbTdrb3RKNm1kNC9lQXdmT25EZU1K?=
 =?utf-8?B?QXIyeDZsUlpFeDBoc3F1L3daQ0FEbTZ0YkM3bXVvK2p6ZEZYbG9XeXo4Rlcx?=
 =?utf-8?B?cnVXcXpabml5d1BPODlESmU5MWxOd3JaS3NwejA4ckt0UVd2QUhwT2N0MDZh?=
 =?utf-8?B?cXU0SVhVSUxnOTF5WVRkU0IyVlRHQ0t1OEJMVDlSQ281K25OdVRkbFkvYWp0?=
 =?utf-8?B?dG55T0ppZHd2ZmVaU0FZRFoyUjNlRjlaVUdzaEFYdUd1bm5aNld3aTZSWGJH?=
 =?utf-8?B?OWZyM2lVWjdSTlQzNW5mVVI4VDlKRzBmdWJraWRKaWJpeU1XMERpSTFYR3M2?=
 =?utf-8?B?akxsWHp4azhobmROWW1nSnBOWEE2S3VnRVBucVZwaDR5MkRlN1puYVUzUENn?=
 =?utf-8?B?TTNrb2p5SnpaeXIvUzdZTVUzOGdSRERGc255Q1pWSVFvdXA5VWE4U014RUZs?=
 =?utf-8?B?UzR5aGxacmk0dkpVeFV2VjF0QjUwUFRtVHg0M0NPNWJ6MzFUUUE1RERIKzF2?=
 =?utf-8?B?b1hMdktRYVB6UmVRbXYwa0p1UndRNFJXTHZpZFIxbUxVcVQyeHA1R2ZOZVNa?=
 =?utf-8?B?Y3psZmpyRkZ5Z25MUlNMUWRDYitRZ3huZ0p6Y2RKK0NxaHFHZ3ZZcm85SEpB?=
 =?utf-8?B?STI2bmtTYW5RWGtaMnhVRXg4OWRKL00rVmxWWnBvWWFDaVRKWFZoTWNNeXU4?=
 =?utf-8?B?QTZxeHl2M3BEOFpVZk84Z3pCeXlQRzM4TEF6SGZBMVVoNFhNTVpqaU05QTJx?=
 =?utf-8?B?bWdkbGdPMnZrelVabGhhTEphNHk5SHVjRm9Kczh1NTBtaS84T0IwYk9nWFNB?=
 =?utf-8?B?Mm9NMlNHd3EraXl5eFVWd2dPWHVLRGtkZjVYckwyOTRxNUpGTHJXa2dQNGFx?=
 =?utf-8?B?dVRHMk9aWWw3eUFCQ2ZKaVM3VG9idkZSTWhiUUU0NU1jRGlQM3Z1SmZTVnFn?=
 =?utf-8?B?R2cwcitYVk9FU3dNT3dubXpjUGQzaFR6bTIycG5yQUM3YlNXVEJKcnBLOEl6?=
 =?utf-8?B?ck9pMDZTVHJlUnExRE15TTZiQkVHcVo5MWk0K2pzYmMvenVmOU0weU85WGxr?=
 =?utf-8?B?Q2hrcTFnQlNUcnJSRXlaV292T1k3bHlCVndvWEFxcFU0MjJLR3FlWExFTnpP?=
 =?utf-8?B?bGNYblV5UWYvYW9JVVpJb0VoTEI1QWxIWmFqcjJYZ1QwcVdlV3d5Y0JZaTNy?=
 =?utf-8?B?SGlPL2pnZ0tuYnAxMkJicm45WUZqMmtxbVlFZHUxa2VGck9QQ2tkK1BnUFVp?=
 =?utf-8?B?TVJlQ041Ymw2ZUJ2NHFhSjd3Q0NBUm1XY0VLY29kd1hsMitGWHc0eWlKWWU0?=
 =?utf-8?B?TVNld2N6MHNXR1hBMUVIaXltOTMvUW1UYTNXVTVDQzczT3I5S3BuaG14Vmhq?=
 =?utf-8?B?djkvcXdyR1FObm5lWFkwMnl1Nk9MeUZwK1FwQU92Rkd3UldMZko2U1NBemND?=
 =?utf-8?B?UGRRUS90aUt6QzVlY0hzWjVpMHZRYUpoVndHWjVQQ3NpaExHNG05aUNWTXpM?=
 =?utf-8?B?ZXJtNFBzNnFtNDFTYmdsL0kxOVZCMEJxQkh6OVVlbHBiUnFNQ1djRHJPS2Fu?=
 =?utf-8?B?MnhEZmE1dGlCWk4vTXlOU25xMDlGMWJINFcvSTRpUHpCUXpwY01Xd3V1RHFH?=
 =?utf-8?B?Z0lNUzJIZllpdkJVVW5lNVR6MWZielc2ZTV1RmI3R0U3U0pYZ1M2ZUlMN3Jq?=
 =?utf-8?B?bXA2b29LK09ud2VEOGRyN0YwZGpjdUs2SGlvRGJIREUrZFl3clJVNmZiM1M3?=
 =?utf-8?B?WVNBRERTOW1EOTRMdEVUbUxjd24xNnRIZVlpZFphWVQrWUx4UnVSUk45cCs2?=
 =?utf-8?B?S0Y4cUxJVWJUS2t4L2wvcDBkckZOckZYS2pJUEtRdEd3NFJQb291ZWt0c2x2?=
 =?utf-8?Q?rgfJ9A5/WSXFJsi4NFJgITYf0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d4c7d0a-6f80-443f-ecf5-08db7c7edcf2
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2023 11:07:31.9045
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Eh3tqLJVCVyeFVNmJSvS7DRvDmQrT3StaX8HEn2M0YFeV9d6n2m3YHeYBjqjnfgQwMyl4wMRRRTDiDUUDCAug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8920

Hi Penny,

On 26/06/2023 04:33, Penny Zheng wrote:
> CAUTION: This message has originated from an External Source. Please use proper judgment and caution when opening attachments, clicking links, or responding to this email.
>
>
> From: Wei Chen <wei.chen@arm.com>
>
> At the moment, on MMU system, enable_mmu() will return to an
> address in the 1:1 mapping, then each path is responsible to
> switch to virtual runtime mapping. Then remove_identity_mapping()
> is called to remove all 1:1 mapping.
>
> Since remove_identity_mapping() is not necessary on Non-MMU system,
> and we also avoid creating empty function for Non-MMU system, trying
> to keep only one codeflow in arm64/head.S, we move path switch and
> remove_identity_mapping() in enable_mmu() on MMU system.
>
> As the remove_identity_mapping should only be called for the boot
> CPU only, so we introduce enable_boot_mmu for boot CPU and
> enable_runtime_mmu for secondary CPUs in this patch.
>
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> ---
> v3:
> - new patch
> ---
>   xen/arch/arm/arm64/head.S | 87 +++++++++++++++++++++++++++++++--------
>   1 file changed, 70 insertions(+), 17 deletions(-)
>
> diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
> index 10a07db428..4dfbe0bc6f 100644
> --- a/xen/arch/arm/arm64/head.S
> +++ b/xen/arch/arm/arm64/head.S
> @@ -314,21 +314,12 @@ real_start_efi:
>
>           bl    check_cpu_mode
>           bl    cpu_init
> -        bl    create_page_tables
> -        load_paddr x0, boot_pgtable
> -        bl    enable_mmu
>
>           /* We are still in the 1:1 mapping. Jump to the runtime Virtual Address. */
> -        ldr   x0, =primary_switched
> -        br    x0
> +        ldr   lr, =primary_switched
> +        b     enable_boot_mmu
> +
>   primary_switched:
> -        /*
> -         * The 1:1 map may clash with other parts of the Xen virtual memory
> -         * layout. As it is not used anymore, remove it completely to
> -         * avoid having to worry about replacing existing mapping
> -         * afterwards.
> -         */
> -        bl    remove_identity_mapping
>           bl    setup_fixmap
>   #ifdef CONFIG_EARLY_PRINTK
>           /* Use a virtual address to access the UART. */
> @@ -373,13 +364,11 @@ GLOBAL(init_secondary)
>   #endif
>           bl    check_cpu_mode
>           bl    cpu_init
> -        load_paddr x0, init_ttbr
> -        ldr   x0, [x0]
> -        bl    enable_mmu
>
>           /* We are still in the 1:1 mapping. Jump to the runtime Virtual Address. */
> -        ldr   x0, =secondary_switched
> -        br    x0
> +        ldr   lr, =secondary_switched
> +        b     enable_runtime_mmu
> +
>   secondary_switched:
>   #ifdef CONFIG_EARLY_PRINTK
>           /* Use a virtual address to access the UART. */
> @@ -694,6 +683,70 @@ enable_mmu:
>           ret
>   ENDPROC(enable_mmu)
>
> +/*
> + * Turn on the Data Cache and the MMU. The function will return
> + * to the virtual address provided in LR (e.g. the runtime mapping).
> + *
> + * Inputs:
> + *   lr : Virtual address to return to.
> + *
> + * Clobbers x0 - x5
> + */
> +enable_runtime_mmu:
> +        mov   x5, lr
> +
> +        load_paddr x0, init_ttbr
> +        ldr   x0, [x0]
> +
> +        bl    enable_mmu
> +        mov   lr, x5
> +
> +        /* return to secondary_switched */
> +        ret
> +ENDPROC(enable_runtime_mmu)
You are renaming this in 08/52.
> +
> +/*
> + * Turn on the Data Cache and the MMU. The function will return
> + * to the virtual address provided in LR (e.g. the runtime mapping).
> + *
> + * Inputs:
> + *   lr : Virtual address to return to.
> + *
> + * Clobbers x0 - x5
> + */
> +enable_boot_mmu:
> +        mov   x5, lr
> +
> +        bl    create_page_tables
> +        load_paddr x0, boot_pgtable
> +
> +        bl    enable_mmu
> +        mov   lr, x5
> +
> +        /*
> +         * The MMU is turned on and we are in the 1:1 mapping. Switch
> +         * to the runtime mapping.
> +         */
> +        ldr   x0, =1f
> +        br    x0

Where are you switching to ?

> +1:
> +        /*
> +         * The 1:1 map may clash with other parts of the Xen virtual memory
> +         * layout. As it is not used anymore, remove it completely to
> +         * avoid having to worry about replacing existing mapping
> +         * afterwards. Function will return to primary_switched.
> +         */
> +        b     remove_identity_mapping
> +
> +        /*
> +         * Here might not be reached, as "ret" in remove_identity_mapping
> +         * will use the return address in LR in advance. But keep ret here
> +         * might be more safe if "ret" in remove_identity_mapping is removed
> +         * in future.
> +         */
> +        ret
> +ENDPROC(enable_boot_mmu)

You are renaming this function in 08/52.

May be you should rename and move the fuctions to the correct place, in 
this patch itself.

- Ayan

> +
>   /*
>    * Remove the 1:1 map from the page-tables. It is not easy to keep track
>    * where the 1:1 map was mapped, so we will look for the top-level entry
> --
> 2.25.1
>
>

