Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E790742B24
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jun 2023 19:23:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.557011.869974 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEvMF-0006yS-5w; Thu, 29 Jun 2023 17:23:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 557011.869974; Thu, 29 Jun 2023 17:23:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEvMF-0006wX-2u; Thu, 29 Jun 2023 17:23:03 +0000
Received: by outflank-mailman (input) for mailman id 557011;
 Thu, 29 Jun 2023 17:23:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1sCV=CR=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1qEvMD-0006wR-Hd
 for xen-devel@lists.xenproject.org; Thu, 29 Jun 2023 17:23:01 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20614.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::614])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 977acbc2-16a1-11ee-b237-6b7b168915f2;
 Thu, 29 Jun 2023 19:22:59 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by SJ0PR12MB6941.namprd12.prod.outlook.com (2603:10b6:a03:448::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Thu, 29 Jun
 2023 17:22:55 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::8018:78f7:1b08:7a54]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::8018:78f7:1b08:7a54%2]) with mapi id 15.20.6521.026; Thu, 29 Jun 2023
 17:22:55 +0000
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
X-Inumbo-ID: 977acbc2-16a1-11ee-b237-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xy+shZcEZwqjQDLrB/m9NchhbieZ0zTI0+rWtoyI+lR9MyJN6uddPKXeCt8nQEBmwjfFmG8SEEpJEhu1lBCGLJjKZEoFaKWrPqTdDD6piRUS7/2dLubNNSJv1GqTI4DSvNh4MiAOYeZfc4smIj+Q9c5Mo5MUgGR3k1KnPvasE8UkuaVik99pJ8w2K6EPAfOv29/JqXMGjH9kmu95r8nfuNoc0N76QG6fWF79F/MAh1V2pcyid89OB/888sbLxmnJj18JgZER0+YoM6o4YLwMJDDxv3IrLoVtmz7r1ubXx+lnO7p/npTLy6geKRitYewpQi3bLPWAlPEJNepGX/ETDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x//SMtxiLQmW+TUo8G2IlPO5+7qYtzFviKSiGBBguP4=;
 b=HNImHQSkV6EtWUmhtCeA1PbEFFgzoGA3Ce1GAYf1cYa37jG75HHR4ilPxbPpai2k3KN51bb6eamSz6wYTbPGcTmAI9tY8Mrd56Z8DMq8xnms6lH4nd7XNpWM8Mw4arneUj4Mi8ldnrskoa15A+BDuDoYDp4EEVt9jyKTSIr7UaOXJ/+qYZgysag9xqJ284jA81opfueKFLTa8auM7omBGHLENn1RwK4LwS7QLzsGsY7gcBARDfz57BAlNeOdkskNtDi95TNanG3a6ret9SkvzOsPbCdER/5E4m5A77k5Nt2HDPyG68rQvmXPK5LS4xgXX7v4braiUrwQOCrLj1atFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x//SMtxiLQmW+TUo8G2IlPO5+7qYtzFviKSiGBBguP4=;
 b=fI0uVg818U0UvRkOD4FjgNVp1yM02er7Tqs8265A98xKxY7PvVkOmFiqg3/NBNrl+vP21LALWNQ/QDi/R6wabHb4+4pCJJiA9EtR/4RVawZ29l4v87Ai+CbpIBqlGeSargepk/+r9Myqkqbp4iMy3iEILtKUA3Dx0OJiWDS7Dgo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <c2a779e5-51a9-f0c8-4c00-a568ff4bde83@amd.com>
Date: Thu, 29 Jun 2023 18:22:48 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 31/52] xen/mpu: make early_fdt_map support in MPU
 systems
To: xen-devel@lists.xenproject.org
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
 <20230626033443.2943270-32-Penny.Zheng@arm.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
Cc: Penny Zheng <Penny.Zheng@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <wei.chen@arm.com>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>
In-Reply-To: <20230626033443.2943270-32-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO3P265CA0010.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:bb::15) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|SJ0PR12MB6941:EE_
X-MS-Office365-Filtering-Correlation-Id: d5f13992-8750-4816-b350-08db78c579cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	acVJ4/cqLPEfe03TuUy/795ZhxZyyD3+i4W0Ae1FJmYKlP7ZsWTxkmNZq9hGrh3J97pJ5HRwn17oA0YXOmdJQrLJ9ZneyGIpUJfJjv2mA8J6fn0QrfpPw6+TEsFrMivstOssv+H67pui5LUiWtkXYhRxMNBaCnYxFDGjJXMEiyuyTMH/BzYmwo624kOH4MUCAdccrChuGjYIA2dPWYdrTaxaWDo5YeMpeA3l3vvLqv2ETbViGiyZ8mcKgVnfRKPkttIn+nAa5S7OH6oC5ZF0ERlZEZUVRrHof9Ys5GAfm19hIEpnUXi1IgdnukUAnwoeQqJdUMKUV7HYP+kfWvVhf3KVLOi5vEt2f71aAByqomLWU+g7IaR2xY8k08+uqOhGCfRERLZ4xwonb9u4e7ov/22EPFkfSspReFlqA89lncBKschpyvTH94EjkvqCvfMyWo++ijEFHQJFA3UwwUu1jktm9J3hT9JP2s24tAsPuBmkv4oaYIq9GP8rr7CAGR03pEjChXHc3eginOPGKxASLK2CzIlIvSZKKqHc0l02WdbHqk9giNKCDrEn/0A/emibWZrwTAaDX7CziEmoTFRs00yvzKzn93D2m+7YZYYegmIAAYegC3nW3jLVztYfu5SZeZdBt0DRegOfRY2Z3+sa9A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(136003)(376002)(39860400002)(366004)(451199021)(5660300002)(66946007)(31686004)(66556008)(4326008)(66476007)(6916009)(478600001)(36756003)(316002)(8936002)(8676002)(2906002)(6512007)(6666004)(41300700001)(54906003)(31696002)(6486002)(186003)(6506007)(53546011)(26005)(2616005)(83380400001)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YU5XS0ZHYzg1WGhLYzhLbDhlZzdBK2NsQVdvWk5GYjNld1hwNGdiTG9kbGlu?=
 =?utf-8?B?RmNPVG9kWDNZV3ZYc2F1U1phQmNPY2Z0aGhaanJ3TGNQWG00Q1lGUG9UckFZ?=
 =?utf-8?B?dUI4QnBtRkZ3WGNzb3Vhb2xFeWRoeHB6VVhNTXRodlRLQjcxTUJPZjhFMEFI?=
 =?utf-8?B?Ty93UVNuRUQwbXBLQjUxbHRJU0VtKzNLVHdqeHFMdktFcnA0anJ4UlhrdEFt?=
 =?utf-8?B?VjlwbzljU2x5TFN2RFZoYlBKV3gvclM4VWExMTA0QWJDc1ZhUCtnUWJxQ01q?=
 =?utf-8?B?MDZDUjhKVGpqSzJ5NUltbDVxUHh4U1M5VVM3V3gvTmhQZVVDaU83RCtwT1Qz?=
 =?utf-8?B?VUpUdTVCRzlQMlFpZ3RxR0lSR2hxWTlwUmZqZTVmLzZId1EvdlVHQkdFZmpF?=
 =?utf-8?B?WlRJTEpTWk9mWWE4Q3BkeEpVd0VGd0s0SXFWU3V4L21rb0haRnRLTWlIcUt6?=
 =?utf-8?B?Y25MUjhaTWJ6RHV4WHhHSnJOdDd5QWNTY1BDTmx3bDRqMVRqZ29mN01nb2pO?=
 =?utf-8?B?NDloMkFpNCt1UDRoT1hqeTR3TG4wM1k1L3B1b0JYWllqR3pMTFI4OENVa0Na?=
 =?utf-8?B?VXEvYkJPOXVJcmtvL0NnNlhPNVRQaHh4dGR0UGxObTdsa3U5cWNQS2NWWUo3?=
 =?utf-8?B?Wkl5eUlYMzhkZlV6QlJ6bFdacVZlMnB5aDNQZWRMa1QyZkw5SkpHSlliQ1Jj?=
 =?utf-8?B?R1VQOFBHVUNaTGxyZFV3ekVyTEVIci9RM0oxOVBnZ0Mwb0d3UEUvb3pjc3Vs?=
 =?utf-8?B?SWVoK21zbjNSRjNTZkpCbG9SYStSVXZnT1dIKzFBeXR0VVdmWWszYUpiTGVx?=
 =?utf-8?B?d0hYR2N6cENYYmUybGIyaVJhUCthSWJMZStDQ0FLUFZrM29xRVZvVEdsY1ZG?=
 =?utf-8?B?WVZYNHYwWFozNUVFYXVVNjJKN3ArWmEzWkFoTzV5OXpsQWN5OXJtWCtGZmhh?=
 =?utf-8?B?dDhscjYyWWlHLzdiK1FPd1U0K2FWdUxMTVQ1SUFtU0RJcnI4T05yREFTNGRY?=
 =?utf-8?B?T0ZDbi9YVHFKL08xeVRlN3c4OHcvc2dpVDNqN1VMUVVodzl2T050MHlKVXBI?=
 =?utf-8?B?QVpTWlQ5K2FhOTlzTUsxMG5YbE84RjN4VkdLdjc3RDNFOEFTdXVzQU1vcno1?=
 =?utf-8?B?a1VZbjZ1eGZUV3oxeHJnWTR3Q0tPMnBiOHFZeXFCdGYvVHdneGVDQ0F3TDZW?=
 =?utf-8?B?Rm9BY2VJWlVtdGw1RkZWM01wZFlJaFNKUTI4YUlON0NMcFBiNnEybUpGQThM?=
 =?utf-8?B?UFY5aFlmakcvR3Q0UFUrbFk3SnhIU2k3a1FaSWVKSHNJUHhTY2dzNERhbUFM?=
 =?utf-8?B?SmpKdjRZZ1RGZm5lOXYvK0NUYlFhM0FJOEd6TnNBSk1QZnZ6ZnFYR3k5eDFv?=
 =?utf-8?B?ZzJmU0hmbk50akFmZDMvb3ZPZFVlcjJ4VzVaZ1VGQllBczRZekVJUXFxWFBK?=
 =?utf-8?B?eXlROXhvK3V0T3pvMHgxWENucWYvanhNOCtsd0EzQjFxaDdzSWF3LzhNcXM1?=
 =?utf-8?B?aTc2STM3Mlg4VGZBZnJNeWloOW92Rk9heGVEa1ZkNFdOcG1sWXVPY1E1WUxN?=
 =?utf-8?B?S3hoMmhIMVpNLzVGeUJ4dUJlVjhuSTJGZDFlUnpYOElpcXBDZXVKbzZuSExq?=
 =?utf-8?B?cGxpMlVrRmVFdGRLa1BMVnB6Tkl5SUwvdjdTL00vdnRXc2dkR2JXbkV5NU9y?=
 =?utf-8?B?UmRmNWNCWUViS3VLUm9qd2tpa2kxVHlUNXhiOWcxOXJnd09kc01vTWp3cGlT?=
 =?utf-8?B?NXFFdkJ5NC9HaitoeUlkTHVmUExrOEpjSTRHKzh6bjFUSFVvMFBBaGFxd2tT?=
 =?utf-8?B?R3UyWm01TXc0eWhDbnpyQ3l4M0Q3dzBlYWZiQ2dieTVvTm1mMGhUQVVyLzRv?=
 =?utf-8?B?S1R6WGN5NndTWE9NWDRTWGFIOGMxSG1uaUxES3J3d0VkeHA1aW9qb2k0V0xw?=
 =?utf-8?B?VU9QeUhaV2tKS1JvOU5keXM0b1UyVVFNZndWVUZYbC9FY3BxcDI0c1Z1THNu?=
 =?utf-8?B?TkZ2L1EyenhoSWNoaXhTV3JxNGltckR3bGFIUVVtdUcvWEg1T1Q5OXNQTE9o?=
 =?utf-8?B?R2FpWExMUnRlSE4yaGt2USt5dDV0QUpNK1QzSVA1eExWQjZKYTNKMUpIS1Fl?=
 =?utf-8?Q?db+FdY1ZYxDd4HQYwBa3RM9RW?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5f13992-8750-4816-b350-08db78c579cc
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2023 17:22:55.2582
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fVupZ93VU5WAMJHx0O5dpz58JztMBBhDC1PheDKVPfiOk6OH1gGx7azgaR9ff5hpwT+x/N3SXi61+qrPyef/IQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6941


On 26/06/2023 04:34, Penny Zheng wrote:
> CAUTION: This message has originated from an External Source. Please use proper judgment and caution when opening attachments, clicking links, or responding to this email.
>
>
> In MPU system, MPU memory region is always mapped PAGE_ALIGN, so in order to
> not access unexpected memory area, dtb section in xen.lds.S should be made
> page-aligned too.
> We add . = ALIGN(PAGE_SIZE); in the head of dtb section to make it happen.
>
> In this commit, we map early FDT with a transient MPU memory region, as
> it will be relocated into heap and unmapped at the end of boot.
>
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> ---
> v3:
> - map the first 2MB. Check the size and then re-map with an extra 2MB if needed
> ---
>   xen/arch/arm/include/asm/arm64/mpu.h |  3 ++-
>   xen/arch/arm/include/asm/page.h      |  5 +++++
>   xen/arch/arm/mm.c                    | 26 ++++++++++++++++++++------
>   xen/arch/arm/mpu/mm.c                |  1 +
>   xen/arch/arm/xen.lds.S               |  5 ++++-
>   5 files changed, 32 insertions(+), 8 deletions(-)
>
> diff --git a/xen/arch/arm/include/asm/arm64/mpu.h b/xen/arch/arm/include/asm/arm64/mpu.h
> index a6b07bab02..715ea69884 100644
> --- a/xen/arch/arm/include/asm/arm64/mpu.h
> +++ b/xen/arch/arm/include/asm/arm64/mpu.h
> @@ -72,7 +72,8 @@ typedef union {
>           unsigned long ns:1;     /* Not-Secure */
>           unsigned long res:1;    /* Reserved 0 by hardware */
>           unsigned long limit:42; /* Limit Address */
> -        unsigned long pad:16;
> +        unsigned long pad:15;
> +        unsigned long tran:1;   /* Transient region */
>       } reg;
>       uint64_t bits;
>   } prlar_t;
> diff --git a/xen/arch/arm/include/asm/page.h b/xen/arch/arm/include/asm/page.h
> index 85ecd5e4de..a434e2205a 100644
> --- a/xen/arch/arm/include/asm/page.h
> +++ b/xen/arch/arm/include/asm/page.h
> @@ -97,19 +97,24 @@
>    * [3:4] Execute Never
>    * [5:6] Access Permission
>    * [7]   Region Present
> + * [8]   Transient Region, e.g. MPU memory region is temproraily
> + *                              mapped for a short time
>    */
>   #define _PAGE_AI_BIT            0
>   #define _PAGE_XN_BIT            3
>   #define _PAGE_AP_BIT            5
>   #define _PAGE_PRESENT_BIT       7
> +#define _PAGE_TRANSIENT_BIT     8
I don't think this is related to MPU. At least when I look at the bit 
representation of PRBAR_EL1/2,

bits [47:6] are for the base address.

If my understanding is correct, then please take it out of this patch 
and put it in a separate MMU related patch.

>   #define _PAGE_AI                (7U << _PAGE_AI_BIT)
>   #define _PAGE_XN                (2U << _PAGE_XN_BIT)
>   #define _PAGE_RO                (2U << _PAGE_AP_BIT)
>   #define _PAGE_PRESENT           (1U << _PAGE_PRESENT_BIT)
> +#define _PAGE_TRANSIENT         (1U << _PAGE_TRANSIENT_BIT)
>   #define PAGE_AI_MASK(x)         (((x) >> _PAGE_AI_BIT) & 0x7U)
>   #define PAGE_XN_MASK(x)         (((x) >> _PAGE_XN_BIT) & 0x3U)
>   #define PAGE_AP_MASK(x)         (((x) >> _PAGE_AP_BIT) & 0x3U)
>   #define PAGE_RO_MASK(x)         (((x) >> _PAGE_AP_BIT) & 0x2U)
> +#define PAGE_TRANSIENT_MASK(x)  (((x) >> _PAGE_TRANSIENT_BIT) & 0x1U)
>   #endif /* CONFIG_HAS_MPU */
>
>   /*
> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> index d35e7e280f..8625066256 100644
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -61,8 +61,17 @@ void flush_page_to_ram(unsigned long mfn, bool sync_icache)
>
>   void * __init early_fdt_map(paddr_t fdt_paddr)
>   {
> +#ifndef CONFIG_HAS_MPU
>       /* We are using 2MB superpage for mapping the FDT */
>       paddr_t base_paddr = fdt_paddr & SECOND_MASK;
> +    unsigned int flags = PAGE_HYPERVISOR_RO | _PAGE_BLOCK;
> +    unsigned long base_virt = BOOT_FDT_VIRT_START;
> +#else
> +    /* MPU region must be PAGE aligned */
> +    paddr_t base_paddr = fdt_paddr & PAGE_MASK;
> +    unsigned int flags = PAGE_HYPERVISOR_RO | _PAGE_TRANSIENT;
> +    unsigned long base_virt = ~0UL;
> +#endif
>       paddr_t offset;
>       void *fdt_virt;
>       uint32_t size;
> @@ -79,18 +88,24 @@ void * __init early_fdt_map(paddr_t fdt_paddr)
>       if ( !fdt_paddr || fdt_paddr % MIN_FDT_ALIGN )
>           return NULL;
>
> +#ifndef CONFIG_HAS_MPU
>       /* The FDT is mapped using 2MB superpage */
>       BUILD_BUG_ON(BOOT_FDT_VIRT_START % SZ_2M);
> +#endif
>
> -    rc = map_pages_to_xen(BOOT_FDT_VIRT_START, maddr_to_mfn(base_paddr),
> -                          SZ_2M >> PAGE_SHIFT,
> -                          PAGE_HYPERVISOR_RO | _PAGE_BLOCK);
> +    rc = map_pages_to_xen(base_virt, maddr_to_mfn(base_paddr),
> +                          SZ_2M >> PAGE_SHIFT, flags);
>       if ( rc )
>           panic("Unable to map the device-tree.\n");
>
>
> +#ifndef CONFIG_HAS_MPU
>       offset = fdt_paddr % SECOND_SIZE;
>       fdt_virt = (void *)BOOT_FDT_VIRT_START + offset;
> +#else
> +    offset = fdt_paddr % PAGE_SIZE;
> +    fdt_virt = (void *)fdt_paddr;
> +#endif
>
>       if ( fdt_magic(fdt_virt) != FDT_MAGIC )
>           return NULL;
> @@ -101,10 +116,9 @@ void * __init early_fdt_map(paddr_t fdt_paddr)
>
>       if ( (offset + size) > SZ_2M )
>       {
> -        rc = map_pages_to_xen(BOOT_FDT_VIRT_START + SZ_2M,
> +        rc = map_pages_to_xen(base_virt + SZ_2M,
>                                 maddr_to_mfn(base_paddr + SZ_2M),
> -                              SZ_2M >> PAGE_SHIFT,
> -                              PAGE_HYPERVISOR_RO | _PAGE_BLOCK);
> +                              SZ_2M >> PAGE_SHIFT, flags);
>           if ( rc )
>               panic("Unable to map the device-tree\n");
>       }
> diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
> index 14a1309ca1..f4ce19d36a 100644
> --- a/xen/arch/arm/mpu/mm.c
> +++ b/xen/arch/arm/mpu/mm.c
> @@ -448,6 +448,7 @@ static int xen_mpumap_update_entry(paddr_t base, paddr_t limit,
>           /* Set permission */
>           xen_mpumap[idx].prbar.reg.ap = PAGE_AP_MASK(flags);
>           xen_mpumap[idx].prbar.reg.xn = PAGE_XN_MASK(flags);
> +        xen_mpumap[idx].prlar.reg.tran = PAGE_TRANSIENT_MASK(flags);

ReferARM DDI 0600A.dID120821 , G1.3.23, PRLAR_EL2, Protection Region 
Limit Address Register (EL2), I don't seethis bit described anywhere. Do 
we really need this bit for MPU ?


- Ayan

>
>           write_protection_region((const pr_t*)(&xen_mpumap[idx]), idx);
>       }
> diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
> index 4f7daa7dca..f2715d7cb7 100644
> --- a/xen/arch/arm/xen.lds.S
> +++ b/xen/arch/arm/xen.lds.S
> @@ -216,7 +216,10 @@ SECTIONS
>     _end = . ;
>
>     /* Section for the device tree blob (if any). */
> -  .dtb : { *(.dtb) } :text
> +  .dtb : {
> +      . = ALIGN(PAGE_SIZE);
> +      *(.dtb)
> +  } :text
>
>     DWARF2_DEBUG_SECTIONS
>
> --
> 2.25.1
>
>

