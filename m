Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A1477A6452
	for <lists+xen-devel@lfdr.de>; Tue, 19 Sep 2023 15:05:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.604679.942185 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiaPN-00016h-Jl; Tue, 19 Sep 2023 13:04:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 604679.942185; Tue, 19 Sep 2023 13:04:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiaPN-00014T-GW; Tue, 19 Sep 2023 13:04:53 +0000
Received: by outflank-mailman (input) for mailman id 604679;
 Tue, 19 Sep 2023 13:04:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Lmoc=FD=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qiaPL-00014N-Vb
 for xen-devel@lists.xenproject.org; Tue, 19 Sep 2023 13:04:52 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0615.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::615])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1d5c84df-56ed-11ee-9b0d-b553b5be7939;
 Tue, 19 Sep 2023 15:04:49 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM8PR04MB7811.eurprd04.prod.outlook.com (2603:10a6:20b:236::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Tue, 19 Sep
 2023 13:04:46 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6792.026; Tue, 19 Sep 2023
 13:04:46 +0000
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
X-Inumbo-ID: 1d5c84df-56ed-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L2RXRpgwO3xH7GAsdjLkGE0Jp6UwDqGZy7UeEcCoB9N7Y62IlAGyZr6I0xIfGZqnMDJsRbU7X3DNGnYfxJslxrzNSNw0nDrLSTE1CTIX/Y3BGiZ3ORW20rVdEcpPDGXAdAOhSGcR5JM+7+G/pwHo9Z0rn/A/VaM4dhbp1YfRnBGW05q9ZDk8vijc5Y4Qu/kgi5pOFez3HniHaxA6b2k5ffOFaqRwI1NGRRrvMQTXWErllvVG8ojKXZ8Zg1Ace6RjQQrImb6kZ3eNK+56hiKorqP5qAG05ZwKD1pKJWbeveArf3ZFSGUgQ6qvX8NRYotAT3SdbVsJqAqPNdjHFWsvww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/7RCBPrjpI2PF4mb5ps927YTihFgxB3Uj3x1a7Cw/F4=;
 b=Eiy8KDIEfKlzcXIrPmhe4RWhaGlqvmlp7aFUv4Bq4HRyqNjoW071AFtLWtdpZsVu2v2qB2cq7a1YGUbPaMKUvxv1C5knX1ViXffERy8NW2IMDI8mmM8Xmh6BCybOW57WJRnGfgweKQHormFm1zBODyXWgTXxj/tSzvbVKZuE+rieEK3VyfVc6+Us7TOjt7+jR807yYw+PkmIMIPks/JJ4Rxxydiw3zNHALXl/zrq9o3f+ONEtYVzSlXuVcEhcez5Gq3fFu0qt31sheO/Xl+dI9dB/36KZlTbIT1b2ws7B1Hewplom7uRVcaySlRnHYaJVJWv1ArfIMxlQUqH0ttJRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/7RCBPrjpI2PF4mb5ps927YTihFgxB3Uj3x1a7Cw/F4=;
 b=tYVQFSd3wGd7ZwdoBsRn4PLnPYuuV+gFE96XYxJ/vsUUn535q0ek1qlfYhOBZcFdde3Bau8+wOOuZACx6AHsE09PdhjofcfJRPC3GbaBybkpPxeeNlNqp0Tq0dyGaaVSBZBbD5gRvLXCjfpg4qRiTXdeFCY23mCnX98n1cCMmbuxQKg/V+tDXOIZFrKdD8X+yc/Cclv/gtF6uJuyQggZUYKhOmuW0PS3s6ygvWbxVlQECt0ZZw5fgJnHqnOUQoDdRox5iDMqcJbFikoMdDXrydwyTmRQ0uot3oOqygmUZ6bdzPvzWNFixQAwgDL8Z7Raq40JKiGQggA3yM4RxqGfxA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <891b7e62-c801-4dc8-ac23-7c0aa1666b35@suse.com>
Date: Tue, 19 Sep 2023 15:04:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 01/10] x86 setup: move x86 boot module counting into a new
 boot_info struct
Content-Language: en-US
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: Daniel Smith <dpsmith@apertussolutions.com>, stefano.stabellini@amd.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Luca Fancellu <luca.fancellu@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Rich Persaud <persaur@gmail.com>, xen-devel@lists.xenproject.org
References: <20230701071835.41599-1-christopher.w.clark@gmail.com>
 <20230701071835.41599-2-christopher.w.clark@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230701071835.41599-2-christopher.w.clark@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0191.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ca::11) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM8PR04MB7811:EE_
X-MS-Office365-Filtering-Correlation-Id: d1d3c7d1-ec41-4b91-a03a-08dbb910ffaf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	r5304Mis1tm+Ma64S5ujiyiPI8kXG9cJ1kVYt6fEQ85AC6a3T6LcwG4j59BZ1EnG4M3AoUVe8khDKOhSvTd/lfyBEY5OYlzmf1pnST1cYJ5tzxs9nxVhuweGvznqiPKWkGjKAdETVo/xLRp6Q67M11g77D+mSWhdiXz81FftNfPXChwjpI5l9JZWeIEZLU9iN3isJUPlsu5Fxm5gQuWGha6gApstTqIypETun4Nd3j01IuOecmUxxKwoF3+Iti8abnXM408ZMngks69JXslzMK5ZF1AaIPpoRCBwLfxm9evpD/zb8ldETlKiYj3kolFJ3sFwaP+ZGgcElYyUyHNL739phMDOw3tIwCnMABayt0pbmK277tE01QzTv6cy8ePNvILKIiPuRgWbwMimwrj5E/nLV8jmb8PZKjcAzERyBEqWvsxmMsSBJ7wFa/ZiUQO32cpgTiRB/qOjGzaVJcbNSly568bhrYr/7PKiDwPEgF2bHCNyXp9uoHeFOfDnu18ygIfF40LwEnYbhmKHcXZEwh00ux2+zcpRP8FbPxixOpTVdJFpa4j3ufNAh/2SEBswGhHOK6k1+TYqIftd+FXmHqey1iiX0NF2XyQ8Sr/GlS6V/65vcQHBIUbRRJN68t9wuigG5s/kr1ECHvdQ2yQ4mw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(366004)(376002)(396003)(136003)(1800799009)(451199024)(186009)(2616005)(6512007)(54906003)(66476007)(66556008)(66946007)(316002)(6916009)(6506007)(41300700001)(31686004)(6486002)(5660300002)(8936002)(31696002)(4326008)(8676002)(53546011)(86362001)(478600001)(26005)(36756003)(83380400001)(7416002)(38100700002)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dXFZUE1jb0ExWXVRMVg4bzBYUFFtamY1MTI5YThWanlLOGlYRC9wWVAzMi9R?=
 =?utf-8?B?ZHJUMGpHN1lLamJsMTdZT2xMdEE5aUV5WUEreURYYWgvQXpyNHZvaFByRHhT?=
 =?utf-8?B?RTQzQndFeXE0bDZqQmRkNktmSEU1Ny9laXgwQTVXWGRVUUhtZWJaZk9HaThy?=
 =?utf-8?B?REtwV21zYjM3SFNTQnRBV0l5cFhMdnZEclk4M2VuYi9RUzBSY2lRMTJTNitX?=
 =?utf-8?B?aUkrNE9FU3pKUEJGeFdXZnk1Rzhsc0VBMlN5c1BodjlGYk50NDVKd3pFclRB?=
 =?utf-8?B?ZE1lNUxjTmhWLzB5bWRNcUFtemxiNlZ0d2Z3bDJ2VURaODBCUXJBcDR0QlNT?=
 =?utf-8?B?OWN6Z1k0ZHFqZU9hdVV0MFVCWFdManZ3ZnZmRWF3RHlJRk94NG90ZWdGaUQy?=
 =?utf-8?B?K1dTMkJjTEJpc2I2UlQ3UExnUHFxVi96QVp1VUdPUVQ0dWdWZGlDN0tDcVBt?=
 =?utf-8?B?NGJWVCt3MWl0SXFyNnRSVURXNEVLdjh3a0JGSkR6NjVaU0xCNmc4RWtXVzM0?=
 =?utf-8?B?K0dMR0FFLzhHbHVNbkRUN0VEZWp2dzloSnhTV1VJMktmd3AxSVZGVStNNkFq?=
 =?utf-8?B?dGZub1dOUzcya1N4Vlgwb25BWDJPM3pUanZKb3ZVZ1hZNUhtemlrYTYwMVBU?=
 =?utf-8?B?Ukh3MGtITVpoMmNnVEJ3N1piNlovN0lqVmN6K3dPeVoxNlJoK3lobncySGd3?=
 =?utf-8?B?Mlp4MXFtUTdYbEk2RmtXdDNNOTlaR1FMUy8wSEl5a1NETTRWNk1nSVpYeUJo?=
 =?utf-8?B?WHRtRHhSRjBTb1JrMmpaNjg4c09mZTZXNVluaENtWWkyRmc3YlRaSi91ZHc5?=
 =?utf-8?B?YnNuZGVNSnJldVRHSzdJQ1RUYmhPU3JJbC9SZE9jRXVHdWc2QTBpalJCTmlx?=
 =?utf-8?B?UXhQc3lGbWUyR05ld0RDQW93VXNiMHpQdzBUYjE0RWE4NFFFajVBTnJ5cUhu?=
 =?utf-8?B?NUN5WVY0SEhzWk41M212SEowejlGajNIK2V1cWpkTEJnUGVMT1Fwc0xHVFFl?=
 =?utf-8?B?UVZ3S0RRa1FXM1pHR0xUQm9Kbkk4Y1pjVkRNc3EyRjI4b2ZsSlpqMmcwZ0tk?=
 =?utf-8?B?MXplV1FvNXZaenJTTDYzNVIxS21xL0traDQ4RENYbms1Q2JZSG9TSGVybkMy?=
 =?utf-8?B?U3Z2WjQwUVd1WTBpRk0yNXlmUDh1TDVRUm13azFCV2hmUnpEcXRHYWZ3dUtY?=
 =?utf-8?B?NXpZeTZIRFRvSS9YYjBMTXlIRkh1SDVOeHJGbUI2MlExM3IyalIzTmJuZWlB?=
 =?utf-8?B?V3ZoZFBSanVUTmxLSDJDR1hqZ0VxN2xsV2Y3UmtESDBNR2FDVmhxN0dlNExs?=
 =?utf-8?B?S3Vic2FIUmRhcFJCN0JXOE9YcDgxbm83dVFXZU4zNElwV3RxdFoyRjQrSEp3?=
 =?utf-8?B?RXRjZ3JsMXNPVkpNMFFpVlJSZk1HQ2xGM3hjcnhGRHlIOGpYMUlQS25ObCs5?=
 =?utf-8?B?R3BWU01IRitFc1U5clllZkhJc3dMeWNXWllOVWNSUXU5UFFGeVI3dHBzamhU?=
 =?utf-8?B?M1RpYTBZdVMzdkdQbjJTMFFRbDBLc0JtUkYxQWJBMzdpbVkzNnNKVnNCYjFl?=
 =?utf-8?B?SGJzOEtBR2VaaGVDVngySFUxR3p6eUZjeVpabGErYWl1TFVTN1B2UlJIRkNw?=
 =?utf-8?B?cEx0c2g5dzNld1QzOU5mWSt4VjlUZlBwZzdnSnhtRXYwUFRUMkdyOEJmaHVC?=
 =?utf-8?B?RUY1eDhGRHV2eSt3ZzRZM1VVcWdRYmduKzFLNUFsek4wUGNvbDlTb2JZbVlv?=
 =?utf-8?B?ajNFcHdGVlFxL1BNYmx1bFdqeW1FUjhOT2NjbHhVdTFFLytVUWVLdE55T1Ex?=
 =?utf-8?B?KzlteFB3T21aTXZIYSsvNk1sK1NMNFd4dVc0Zm5sMEVhaEJJaHFHVHlvN2pL?=
 =?utf-8?B?UHNkOVB1VTkvZmt5TWZDVkhjOFZKempCSDRMOTZKdVE1bmZvdnV2eG9iTVdn?=
 =?utf-8?B?THpPbXNsUE5ZamxQM0dQai9IT3QxSStVVUdHd2pyN3hVdkNjRzFFTWJmSWRZ?=
 =?utf-8?B?cVZuL0srMlB6UHRxYzZFUGt4cTJQRiswc0FibS83bFV0Q1B4YnZCOVBRa0RV?=
 =?utf-8?B?TnVnU3ptOUFUUnhsbHhZWi9jamdyQ1RuKysyZXdoakFCTmpGVjV2OUh1cm1J?=
 =?utf-8?Q?scrzaJJ2fXMq65ZQhQYNdG0bP?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1d3c7d1-ec41-4b91-a03a-08dbb910ffaf
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2023 13:04:46.5169
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IHF+6O4MlKadX+Qz+8wBBZYrLyfH3b72BfFVRSif3NxM1MQ3T7c0O7VBQ7/OrlP/snFrKgL6MA0/mzVCIlHAmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7811

On 01.07.2023 09:18, Christopher Clark wrote:
> @@ -1127,18 +1139,18 @@ void __init noreturn __start_xen(unsigned long mbi_p)
>             bootsym(boot_edd_info_nr));
>  
>      /* Check that we have at least one Multiboot module. */
> -    if ( !(mbi->flags & MBI_MODULES) || (mbi->mods_count == 0) )
> +    if ( !(mbi->flags & MBI_MODULES) || (boot_info->nr_mods == 0) )
>          panic("dom0 kernel not specified. Check bootloader configuration\n");
>  
>      /* Check that we don't have a silly number of modules. */
> -    if ( mbi->mods_count > sizeof(module_map) * 8 )
> +    if ( boot_info->nr_mods > sizeof(module_map) * 8 )
>      {
> -        mbi->mods_count = sizeof(module_map) * 8;
> +        boot_info->nr_mods = sizeof(module_map) * 8;

As long as you don't replace all consumers of mbi->mods_count (see in
particular the call trees down from early_microcode_init() and down from
xsm_multiboot_init()), I don't think you can drop the original assignment.

>          printk("Excessive multiboot modules - using the first %u only\n",
> -               mbi->mods_count);
> +               boot_info->nr_mods);
>      }
>  
> -    bitmap_fill(module_map, mbi->mods_count);
> +    bitmap_fill(module_map, boot_info->nr_mods);
>      __clear_bit(0, module_map); /* Dom0 kernel is always first */
>  
>      if ( pvh_boot )
> @@ -1311,9 +1323,9 @@ void __init noreturn __start_xen(unsigned long mbi_p)
>      kexec_reserve_area(&boot_e820);
>  
>      initial_images = mod;
> -    nr_initial_images = mbi->mods_count;
> +    boot_info->nr_mods = boot_info->nr_mods;

Overly mechanical change? To prevent such going unnoticed, maybe
boot_info should be pointer-to-const? Would of course require the
bounding to occur earlier, so you truly don't need to write the struct
after filling it in multiboot_to_bootinfo(). Or you move the call to
that function down a little. Yet other options also exist.

> -    for ( i = 0; !efi_enabled(EFI_LOADER) && i < mbi->mods_count; i++ )
> +    for ( i = 0; !efi_enabled(EFI_LOADER) && i < boot_info->nr_mods; i++ )

Seeing all sorts of changes of this kind - did you consider naming the
pointer variable (which will become a function parameter as to what I
understood from your reply to Stefano) just "bi"? (I wouldn't suggest
this if the variable was to remain file-scope.)

Jan

