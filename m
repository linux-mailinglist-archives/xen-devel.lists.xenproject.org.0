Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3384F7E9F0B
	for <lists+xen-devel@lfdr.de>; Mon, 13 Nov 2023 15:45:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.631629.985192 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2YBJ-0006oi-L8; Mon, 13 Nov 2023 14:44:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 631629.985192; Mon, 13 Nov 2023 14:44:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2YBJ-0006mm-Hg; Mon, 13 Nov 2023 14:44:53 +0000
Received: by outflank-mailman (input) for mailman id 631629;
 Mon, 13 Nov 2023 14:44:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OC0U=G2=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r2YBI-0006UO-7N
 for xen-devel@lists.xenproject.org; Mon, 13 Nov 2023 14:44:52 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2073.outbound.protection.outlook.com [40.107.7.73])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 32ab5c4c-8233-11ee-9b0e-b553b5be7939;
 Mon, 13 Nov 2023 15:44:50 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DBBPR04MB7980.eurprd04.prod.outlook.com (2603:10a6:10:1f0::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.15; Mon, 13 Nov
 2023 14:44:21 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7002.015; Mon, 13 Nov 2023
 14:44:21 +0000
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
X-Inumbo-ID: 32ab5c4c-8233-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EriYRkMUwCrOOqAeIE0amnrNC73M2zSxFnUjRGVbQx4Cho0MJfrKwRZQJ58qsStJOe3bUoMmxMogG8yejj5Bs3oRy0LDqf+Z+2X6SD2XJcI7fzF4tS8IN40gGOp/TjNEvznEgglcoCF057URRK0L2OQ8HHg8doQj1FzNz+kMeGEZeYvH6i4QLdqsnMt47GInO6jHXVg+rTtInGec2+mGuWGKbJvwBEjDa5W0mP+n8t7H6tekUDey7NkqHwxVtbnEtVuYbSpZolJc49YFTCLf6/x2j50JHVhQaQ4nzIptAWseiIn/zbWrd4HXMtgaT5f2FR6T+l2GDSLIOGFHXIizBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yFbIDf4Fi1lVrj6TYbXaiX448zPYCHxPJVBn/H9xL7A=;
 b=AtPJhy0TyyZouEJduMKnB0xq3bAnQrCwclKNeuTLTTk5JTbF8sPWv8FzAxxaI7T5QNzAgj4tKvvXuxNVnfoLXfzeiwifEOUWDj9wFdETZeArUs4EQfl5/E4zdWyuzk/LgWTJqp8qohPDtIJgTZ4d9Hq89AH3uUaikzIAhx3PV0fZ5PpfrCxRyX+KPwlj6UNaNfvnDBQ/pp/T8NUnvDnkCJizcIym6VEBzEDsu69qCbUpofVV/54ulvlXqAxRXEaw8BK/K+FMzLexqhitGtB9B5ddTAZ9YJl0idMCA2ww1IJRhinGr0pJg0bUA1NwRvde8FLAp7rQ29UFPBcheOXrVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yFbIDf4Fi1lVrj6TYbXaiX448zPYCHxPJVBn/H9xL7A=;
 b=j8Jlq6IQjXRHVR0fNvyLAzBJi0UyASrASR8bbsNDp4n/k1+IYlEYsQcEBeWjJ9+11GFOg1aY1+ypOq9yY4PjOL7S3dkSI18G5WZ2oLlN2Pe6OiiwsApM4vG/6qbhgOOCedV2P54amSnJ33rT+06BCzACtbVHjjw0CIbhqAmD0Oe6UnwckMuyL2iex4GVtm8JIGEf3bxRUe/T4W+eCMDoGy31djF8+oD23S4ydhl5PgXyiAIYVZ4UGz+UoUGRQMzQ4cjUGdKM1Glxo+MUPmZknyIcf3hx6zdBnh/flHxxyLDxxybGv2t1to9WPqEWDsv40jzSZSHTYc+i8p0n9jCoWg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <18c366e0-0870-3a17-69a9-2bfb1fb3b25d@suse.com>
Date: Mon, 13 Nov 2023 15:44:19 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH][for-4.19 v2] xen: replace occurrences of SAF-1-safe
 with asmlinkage attribute
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <aa7fa9b8cd40adb4eb5242deeff138cbe8b658f9.1699352946.git.nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <aa7fa9b8cd40adb4eb5242deeff138cbe8b658f9.1699352946.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0086.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cd::13) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DBBPR04MB7980:EE_
X-MS-Office365-Filtering-Correlation-Id: fbfa6794-6c14-493d-a70a-08dbe45705a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DJ4S7u1MCwfTiKaOTn0/Tle2Ne9bsjg4GHWeIrcKjXZLiO38tO9rg3p8oLmyo+En4Mim0VrDShbyJ/LkzhfkYwVXbaHWb7z3ssbaph1/8UVQWALKUVSPROBav2gorAmcFJ5RuMiOWFifMTuljajX1UAKKHzIE9fgTuOc2YQPkb/iDX6fXPugrdQDARrEYYBnzWJRy39r6jbJC0efkd2+Ijop0cNM5FnECv0mj7GljExL7krnUkovzWoHTMDithxbvzegeZBlmmeJKpib5/YFk/1XE6vSa7hfja66svIiyZAgtj6L6StTeZBJ6nEXbQACm+ZPCeHyrh76UU6RA7d16wsJN4ZxNLdsL69dvB80kDRkjtyNUtWUImdP8EbbRGn7gpUMFd07Kk+yZRS0r7JOfnnh3Fwa1Mu8GUojkkYPArDb+LN2FCOIiNMse/uWCvYO2FoGrqUd1TcR6RZf6lDgj6vBrk/TNlEaQkss5g1N+Eb4s6MPLA5gLfJ38v3o5aUhOiMkJseFQfX7tZY8ETkMMEoA+agc/3UDfmuqfxKmAx7YFjy7iucl3EP3rWBCxkfMSKika1COTueURVAb1C5LPEn3Of1VB042L3btruNq7D6O6uyT+RdmQYsTTvt0olg8GCTAS2s8R+hotxwq7Q+zPw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(346002)(376002)(366004)(396003)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(54906003)(66476007)(66556008)(66946007)(316002)(6916009)(478600001)(6486002)(7416002)(86362001)(5660300002)(31696002)(41300700001)(36756003)(2906002)(4326008)(8936002)(8676002)(26005)(31686004)(2616005)(38100700002)(83380400001)(6512007)(53546011)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S1hsR1Zsa1ZHRE5Ib3NrU3U5ZWhnWDZjN1p0aUdndHRucWMyZFVaSlFYQm9N?=
 =?utf-8?B?b0xQU053L2JwYmtnTUhTeUFyTXJ1ZlhwSU0wYWd2SW1ZcllWQmdzQ0NrMDc0?=
 =?utf-8?B?d2ZOdGlGS0pnN3VIUGI0SWZ0MDBUcFc3RVpJeDk1ZXNpRFpqZXNBN0JXOEpj?=
 =?utf-8?B?bjUrd1VodVIxVU9iS1BkdVArV1NMdzZxTjB2K0dXYUhuTVlsSVppWmpibFBO?=
 =?utf-8?B?dXlPb1ZRVVZjbzFrV0FGL0NKMEVvNWtZU2h0cjFrcEpsejNrVnZ4SDdwdnAw?=
 =?utf-8?B?TDlSN01VZGd3NEJnYk1BNVpOVlhCRDBRVVM0S1NtK3lDa1Jqd2xzQUhiR0k2?=
 =?utf-8?B?Q2VhdCtpcDgyNE53d05BTHd3Njhyd2gwWVFwQlZTeEFUQ0wwMElvbXErVndj?=
 =?utf-8?B?R1pxNDB5WlFPL3Uwc3libVdibVNSR0xkQzNnc1BoZjFQY0hkQ2dJK3BuWWNu?=
 =?utf-8?B?b0tWUEVKbWZod2dhc3VIV21FSjMyclQyQWZDaWhIamswN0VWb1BzNERad2t4?=
 =?utf-8?B?SjhxL3crSVB1S0gzeFI0Q2w2bjJURkJ2OS9MZ3VMUW9wcFNFU003eEZLa2U4?=
 =?utf-8?B?ZUFnNWJndXZ1Znd2dWlGRGRRNGZNNGhnbysxTUhUbHBFUmROM3RQMnVSd0V1?=
 =?utf-8?B?aVRVUlJNVW1MYUIrSk95MHAyaVRaUzJzK3FOWmgxWGpuUndnZU5QcEtHVVY2?=
 =?utf-8?B?YnhtZXRGcm51NmZLaGQxLzdQdlg4eXNuNzdlQjY3eWRwUEl6Q0s4S0dKZ1NC?=
 =?utf-8?B?WDFaWHBSajJ1bUNBMXh4OEczUVpmNmRib0k0cTQ0dHluMy9xWW05YWlTZGF3?=
 =?utf-8?B?bzMvb0EzOEdtRUtFT0YzWDR0d1NvZGVSdThUdGZtM21lK21RZFVLdzlVV2Zt?=
 =?utf-8?B?aVcxVXVWT0wyMTg2VFV6ZmlWUFJRaVBXWDh2aDdUTGZ6VktNNDQzSThzUWd0?=
 =?utf-8?B?Z0VUSWZXR0FqbFFza3hmRithbzJrREJuOFMyS2hNYWE2YU0yeUJyWXdPNVEy?=
 =?utf-8?B?QTJaY0dFcFc5TzN1MnVZUHI4TkVkS0pvM2dMM3pOTVBIajFFT1NUeWtKWDYv?=
 =?utf-8?B?bWNDR1BZQS9tdm5WdjZYRS9DZExJUmpPZGYzaXY3L0RSclVIb3ZSN1F0Z2dr?=
 =?utf-8?B?ckxjWnI1THJ4enV5QVVubzdPYmtZVWh2b1k0YVlIV29ESFgybUlwRUtaYUpa?=
 =?utf-8?B?SVJaSWxucVp4TGRHa3dyb1VXMnBaRjJLWlFvVm01QWcvWFlZeDJJSUlvYWdi?=
 =?utf-8?B?aVl1NzFqM2tnVTJBVDQveEZDS1I4NEUxaXZrS3M2UTI4YU8xeis3NmhVNFdB?=
 =?utf-8?B?WHhNanlaekxVQTBpZGJTbmJ2T2ZEQVdpaEtmLzFIR3RmV2ZvcFdCN3c2UzV4?=
 =?utf-8?B?cWZqN0NSbUlZWHJYNVFGeFhyWHhFZFEyb0srTzh4Z2JTZHllRUx4RjFnQ2l0?=
 =?utf-8?B?MFJGNVBlUFZrb25leXdwTHc0UUVyWElLM3Q5ZFlIdys4VkJQS2o5YXBlTkVT?=
 =?utf-8?B?MU1NOC9HUHBGMUszYzBLeWlodEtPSmNWODdpSDVMelVWUmRWYTBWbVk4eVhl?=
 =?utf-8?B?S0htRFJycDRZUy9rZ0ppbm5jRDFVajZIQVJFdDRmSHlZRWQ4b0dscy9aMksy?=
 =?utf-8?B?N0tWSWxoYnU0NXlCODhyZXI2M3dCbG5ZK3ZheVFsUTVZM21YR04vZ2FmY1da?=
 =?utf-8?B?b0JwNzdDS3c4SEFPYzF6d1drbVZNWi9mMjFRbWZnRWNCVFNkZzUrMEl4MEd5?=
 =?utf-8?B?dUVURWc0T2FSU0hIQ0Fac2IvSFUzeStXUlppclBtbFhUWTVVK1NoVStwVHkv?=
 =?utf-8?B?UFV4bWZ4U2JtY3U2a211eHZSY1l6SWl4SFF0MFhWbGRuSFdGelE1NFlyRmNo?=
 =?utf-8?B?anZtQzdyak8rWlhFNFk5STVydG92cGlRNDljeXZ2N3JRa1lqTm9KOW5sR1B6?=
 =?utf-8?B?S1luOEpyemdnTXRHS2c3anU0cmM5MDFGUi9QUkx0SWV1WFlDV3VacEdlWGNz?=
 =?utf-8?B?Q2pVTzFZemhyN2JRLy81UUtRNmptVk9JcmZ2Ym16VXQ5NzVKckdwdHlmcERs?=
 =?utf-8?B?UENYVy9mMlFXcmFxakR3MGdmWEtuZC9YajFvbkswSmpuMFhEZmRXeUM5UjFx?=
 =?utf-8?Q?9gMiFagDuaM5bcSpHwzHLEmzr?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbfa6794-6c14-493d-a70a-08dbe45705a2
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2023 14:44:21.2092
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IAUOydmmRz0atMbNLCnjWl5gTleyQH97qIRgzoXIEXN5v+ERZtpGmGhJxsY69FbimeUNqSaDkmi6x8Lv6xB+tQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7980

On 07.11.2023 11:30, Nicola Vetrini wrote:
> --- a/xen/arch/x86/boot/cmdline.c
> +++ b/xen/arch/x86/boot/cmdline.c
> @@ -31,6 +31,7 @@ asm (
>      );
>  
>  #include <xen/kconfig.h>
> +#include <xen/compiler.h>
>  #include "defs.h"
>  #include "video.h"

Please respect the goal of alphabetically sorted groups of #include-s.

> --- a/xen/arch/x86/boot/reloc.c
> +++ b/xen/arch/x86/boot/reloc.c
> @@ -33,6 +33,8 @@ asm (
>  #include "../../../include/xen/kconfig.h"
>  #include <public/arch-x86/hvm/start_info.h>
>  
> +#include <xen/compiler.h>

Same here, put on top of the tidying patch I just sent.

> --- a/xen/common/efi/boot.c
> +++ b/xen/common/efi/boot.c
> @@ -1254,9 +1254,8 @@ static void __init efi_exit_boot(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *Syste
>      efi_fw_vendor = (void *)efi_fw_vendor + DIRECTMAP_VIRT_START;
>  }
>  
> -/* SAF-1-safe */
> -void EFIAPI __init noreturn efi_start(EFI_HANDLE ImageHandle,
> -                                      EFI_SYSTEM_TABLE *SystemTable)
> +void asmlinkage EFIAPI __init noreturn efi_start(EFI_HANDLE ImageHandle,
> +                                                 EFI_SYSTEM_TABLE *SystemTable)
>  {
>      static EFI_GUID __initdata loaded_image_guid = LOADED_IMAGE_PROTOCOL;
>      static EFI_GUID __initdata shim_lock_guid = SHIM_LOCK_PROTOCOL_GUID;

Besides this patch not working on its own (as already said by Julien,
you want to explicitly state dependencies), the change above makes me
wonder about efi_multiboot2(): Neither the earlier series nor the
change here are touching either of the two instances of the function.
Was that merely an oversight, or is there another reason?

Jan

