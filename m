Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD9C669319
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jan 2023 10:40:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.476968.739446 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGGXU-0002KZ-HZ; Fri, 13 Jan 2023 09:39:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 476968.739446; Fri, 13 Jan 2023 09:39:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGGXU-0002H9-Em; Fri, 13 Jan 2023 09:39:56 +0000
Received: by outflank-mailman (input) for mailman id 476968;
 Fri, 13 Jan 2023 09:39:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=grKZ=5K=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pGGXS-0002H3-Ak
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 09:39:54 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2068.outbound.protection.outlook.com [40.107.22.68])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3a84e663-9326-11ed-b8d0-410ff93cb8f0;
 Fri, 13 Jan 2023 10:39:52 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB6836.eurprd04.prod.outlook.com (2603:10a6:208:187::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Fri, 13 Jan
 2023 09:39:50 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.012; Fri, 13 Jan 2023
 09:39:50 +0000
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
X-Inumbo-ID: 3a84e663-9326-11ed-b8d0-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y8VLkJpbQS5VMt4rLubAdEWvi8g2Q8uTMdKyQM6UiFi4t9wO83JUowhX145in+cXWfSek1snOzvCGJi0tgMRqaJajlOQZLj0jcjynbVgZm1e+dtTE/GtlT2UHndqiinB+bqtQdezd8Dc1QznUsUvEPdCrvsdNWU1mLY7ZteqAmDTQmLkD5rJIuRemHBSza8/ExEzZz2OazmiCOKoufp1QjaWP6Niz0U6lqpjeXppMNYsddSIiSKf/fajz4aVadIYUuTDy3Ouf6SvCnL1Yp1c2wXXXLhTqbXQeYwERYfZpcaD8st25oecp/9p6ncpQsNLFI754OIRwjmfqeN8tHK3sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0PvwRsuGbDTMrLZH4ThkVMgO5KX/PDF4NeJItln5ucw=;
 b=TkDkZWfRnGk4ncp5zGaIfZEgivl/XS3FyxTc8EWwfydlSgDS1XGKLUTEcOEY7aH6YaCV7LpH+xTd7ACitY9ClkrFVN8naqJi2aGO4KMfVxlGFmvqBRD19blH2dGsqIcypmSevalarhf/VAx9i2y0J4zuT5SG7hWTznLMHpy78LNF4czCRSnXbDPReVkRsnTmcOfxHEYHszrLjfnLhyn2H3SnkoxDIUkSg5wMSw0GxuTuGIF3i1uVOHyL+piJ1u24pDLdWPMK0MhVWl43bffESMwFGl/Usxl3kYAvhzBV0mc58R+lt4w8GoFwSYkH2wzOYQwgfUwWY5dT76byJEdsxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0PvwRsuGbDTMrLZH4ThkVMgO5KX/PDF4NeJItln5ucw=;
 b=O7vLUuSIFbMCUQm6CKj6SrpF/p4OYbnnlYgKbPha3xZU0vw8muyK4l1BbpV+0+RvJHWWVq/9dx6fo5hp7zM1MkNkGl1JtHz63jRhN0MfMAcrjYjO4mWN1qsRLrvC+9Y64zGq0Mx4lWJYuPeigXy8wfO5VAftU5lVPaUh676qruZ1yroKwTeq8vDwc3pyjDd1kWjyLNhiKbYD3g4debn8Dsx5Sad9ZR9PFzZpGP7IStD+k8NbEthIamgwF2v+fTkW3UFU5yFBqXKh3SAiw/9i8saJD0dxA4EG2zB0M869HC3t/kzzEkI3OMr2GMSrn9PQcbq4Pw2I+CVkJ7iBH4Xh3w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <07e1099b-8ef8-d28d-f46d-561ec27cab02@suse.com>
Date: Fri, 13 Jan 2023 10:39:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 30/40] xen/mpu: disable VMAP sub-system for MPU systems
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>
Cc: wei.chen@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20230113052914.3845596-1-Penny.Zheng@arm.com>
 <20230113052914.3845596-31-Penny.Zheng@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230113052914.3845596-31-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0138.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM0PR04MB6836:EE_
X-MS-Office365-Filtering-Correlation-Id: 19b8f678-3657-42b9-90c6-08daf54a1dce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QVaQOVkS+ZCqDJ20XBfdhWTSjWCZKId51T2mVxZ0XGJfxVZ0paSTLwe1rKmuI3+xKSz4WTqGQiC+R8EP8c1f2IgIOniE9IdnkhHZAAL11+DaEeKWcAcWex+UVuI2OJ2YFU1+9d8o2tOu3GJy75ZuBIkvY/T/iuxrPHDw3KA1adJ4UFqhanT1ghJ+JOOItE37+ErTjDQD0JpPbaL58oMwh8VKBKkUfDnwMFOcL9w2T/6shNC/0vDB3Fnb0mHp3MbkVISHTVcdVDLIyfS1YeIfON3yBXfOigc6rjl5GQ+qxn+j77XJ4S8u4jdZLJPYyDJCP9YEkVrwq7fXb2ORz3hp/4awqkEVti5Y36kJe7MAXUmLe2a214NNDjEzuMWP4LXGBhi5FPA/ICeVzRNbSnGJ5usP4Y4EfetGZOnlG897eKGgweTiKUNFuWRCT5mS+nTS/GyXwlbZleRGOPF/HUI8JRvDxp3pjF2J76AV4xMuWEomD5dxMU2VN9rFJhX7YZ1upcsYd+zbqjeBjVy1bUjXltkg9jkJyiiMOowXiXw2KVoOEhGs3PyWWwhIiEs6xAAABFgrpdFiMvDfZIdkZU+rsB5v2FcwTJ8VswYVDcAqPhosp8UYJeAZSvkI3auQP3v7/CTI6alwIT6QAae9antItGyFqXEWYZDnS7bfzK2N+R+cjDZ+6wX+pE7MVvcB83q7J8qqHV4ODA8qtudXXWYSCX1+7fCVvW9QUH4EJA7DXmA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(346002)(39860400002)(366004)(136003)(396003)(451199015)(26005)(2616005)(83380400001)(86362001)(38100700002)(36756003)(31696002)(31686004)(66556008)(54906003)(6916009)(2906002)(8936002)(4326008)(8676002)(5660300002)(7416002)(53546011)(66476007)(66946007)(316002)(6512007)(478600001)(41300700001)(6486002)(186003)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YlpnVEx3SHFuYWZNcFBSejJsSyszcUxkRmZwbENubEJLYytHek5yVDkzb3pR?=
 =?utf-8?B?Qk5WU0p3cmFkUElkelR1T1g2SW95NzhybTR5YitvMEpCR1o1MmZnR3NnMUQ2?=
 =?utf-8?B?ZkVTRXl3dWtKNG53RlBNeGRubHV6bWlvd3g4U1JHV0ZDZjU5V0JHelpTenRU?=
 =?utf-8?B?b21MSEdpWXhvMm5DVFVCd2VBRkt2U0taQXpCRHRQUk9wK0FCbHdSSFB2WXh2?=
 =?utf-8?B?Y3cwSjFqTTZkenlXV3BRdjlVMVhMQ2xmbzRRZ25QRWlIaDh1bnUwbFNobG1x?=
 =?utf-8?B?dEZDcWxjM1FwcUNpTUd2c0pLUitpenZwTDVHVnFWUjJPRUk3UHVsOWZ6eUto?=
 =?utf-8?B?ODFVYTFQOTZmazJrN1VuOFVES3ZGQlUra0UrdHJ2VitnTzZKclRBc1IxOC83?=
 =?utf-8?B?MVI1U2c2OWw2cGR6QVBuRy9nSG5uV0Z4NjZST3pwMTVYQ1pFUWQ2Ri9lMXFv?=
 =?utf-8?B?aXgyQ2pKNDUvWGxXMWxXZ1VoTXNUY0JSdlAxZDBJY2UyVVpiOUVPTVBQVGJn?=
 =?utf-8?B?bkYxZ1pDenpCVERjc25EVm9qUlVyU0Iwem1sdHNMTURyRVdWd3M5SE83d0ZK?=
 =?utf-8?B?SDVyUnRuNkRubjgvMVdEczNrZitkUUJqT3FiL2sxbldrc29aTHpmRi9yeWlR?=
 =?utf-8?B?c0hLbm1hMTk4dE4wekw2OUxjeWxMcEJvR2VSZlpjY1pHNDFhT0dPdlZnVmYx?=
 =?utf-8?B?RjdRVHltVC9vanNTdmFGTzRSNzhLYXFleU40WEttS0t3VGY4dWZwQVhOV2xN?=
 =?utf-8?B?WGIwcFljQVFpb2o4b0FmaElGMW1zb3YrVmZNemluZXZST0hhZ2xVbUdITUs1?=
 =?utf-8?B?WWlLYlNXcnV5ZzNpOHA2NVZudXJGY3JFd05obXpaZUVFbG9yV1dldWJCNEdp?=
 =?utf-8?B?SW1ORE1nZHUzVnVtR2lEZkdseTRiTGlRWDVSTUpvWk91aForaTRyVHhma2lD?=
 =?utf-8?B?VjhtTW42Ymo0WlR1Yzl1ZTVFOG9RRjBxZ3B5Yk9NOWwzN3B2WjJydGR1N29n?=
 =?utf-8?B?RUlBRFhVakliaXZyam5MWTJoc0dOcW9NY05YeWsvUW9oNDVaQUFaV3M0MTFV?=
 =?utf-8?B?a2pkT1gzVERSOXQ2Wi9GWFRBYmZ1ZlJTZWp1Rmg2TDJxeFlVaFdiZVgrVFAx?=
 =?utf-8?B?WjBoQXFWQllxcmszbUx4QVRGYm9McUpOektQZTJBK3BtWGM0NERvQzd1U0dj?=
 =?utf-8?B?RU0yb2dkK1lBZjk3bjRNdUsrcVE5OU9JSE1YamJEUXFuUC9pSXpFTG9yU2wv?=
 =?utf-8?B?S0pDU3FiOStyZ3F6WE9kM3NxZ0JaWnNKUU1OL2Y5d0V1VWN3S2daVXpWK1dS?=
 =?utf-8?B?VFNlYnhCQXA1MFdFU0xLZHF6VDU4ME4vemRQS29ZN2MybXl3OWRhKy9kVmZ6?=
 =?utf-8?B?dGVTSUVPUDgxY2R1b05OcEFNYjM0dE16N01sYVVLdWVqcEJZelNwKyt6ekZx?=
 =?utf-8?B?MjJUNitGT1E2UStaK282V1VTZHlVejlabHVJb2dhRnFlU2dxQ2phMzJZS0ow?=
 =?utf-8?B?VmVHa0U2T0x4Q3hMbDB3S2x6MVFuVlYxS2hIYnNPckh6TWJBemt6NCt4RXZi?=
 =?utf-8?B?aG5DbFM2WHlUS3F4RFlQcTZPQlAxVGUxaWYvbHZ3c2oyb3ZmYXZuaTBoOWw1?=
 =?utf-8?B?NVZRaU5XcFl4dkJreVhCRmd0NXgzQWV3NTB2cHQyeHgrUnQ5Tk5mS0JUbUhn?=
 =?utf-8?B?L04ydzdsNG1ldkNpZ2pZbkFHYzhmaFc2MVowazlFSG5SY2NjL3ZIV1BjZFdv?=
 =?utf-8?B?aENuMlI3YWd5VnNmUm5KSXFqNjBhR0R3NllhbnFzQVp0T0N1R3FLMGZnUDg1?=
 =?utf-8?B?U0p4QkpjZ1BOQjlJblpmWUVJeFhua3lSSHZZSWp2MzVtU2NHOEQvKzV6VXNl?=
 =?utf-8?B?QllabGdZN2M3czB5V3E5eTd0VHFLdklOdTJBOHh2UktMRXF5Wmhmd1ZOeDVw?=
 =?utf-8?B?R1F5aWMybFBMaThlWmF3d1VpUHlNWEF3ek90bHdkZTAwNUYrSEtGN3ZiV2Qr?=
 =?utf-8?B?dlp4Y2IzOXNNTEVJMnhQa0tzeG9HWHhPM3l1TGVtL3FxWVBhRVgzWmJIVkFz?=
 =?utf-8?B?UWlxdkcyYTl6V0l3VVhPeU55dXV2Qm1BdXc1Q3hOQVNTLzRIUTZpSTBxdVdG?=
 =?utf-8?Q?KAfW7SFvVd2bbDDBLtidBe1Jb?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19b8f678-3657-42b9-90c6-08daf54a1dce
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2023 09:39:50.4683
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eKIfxsw6I/3a6tjRrPFxexoLZ6sfwMRc6fxanfBt2aDpJhR2QbhCCizFWcqAcv/i6Gjczh8JZTbtXEMD79yLdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6836

On 13.01.2023 06:29, Penny Zheng wrote:
> VMAP in MMU system, is used to remap a range of normal memory
> or device memory to another virtual address with new attributes
> for specific purpose, like ALTERNATIVE feature. Since there is
> no virtual address translation support in MPU system, we can
> not support VMAP in MPU system.
> 
> So in this patch, we disable VMAP for MPU systems, and some
> features depending on VMAP also need to be disabled at the same
> time, Like ALTERNATIVE, CPU ERRATA.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> ---
>  xen/arch/arm/Kconfig                   |  3 +-
>  xen/arch/arm/Makefile                  |  2 +-
>  xen/arch/arm/include/asm/alternative.h | 15 +++++
>  xen/arch/arm/include/asm/cpuerrata.h   | 12 ++++
>  xen/arch/arm/setup.c                   |  7 +++
>  xen/arch/x86/Kconfig                   |  1 +
>  xen/common/Kconfig                     |  3 +
>  xen/common/Makefile                    |  2 +-
>  xen/include/xen/vmap.h                 | 81 ++++++++++++++++++++++++--
>  9 files changed, 119 insertions(+), 7 deletions(-)
> 
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index c6b6b612d1..9230c8b885 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -11,12 +11,13 @@ config ARM_64
>  
>  config ARM
>  	def_bool y
> -	select HAS_ALTERNATIVE
> +	select HAS_ALTERNATIVE if !ARM_V8R

Judging from the connection you make in the description, I think this
wants to be "if HAS_VMAP".

>  	select HAS_DEVICE_TREE
>  	select HAS_PASSTHROUGH
>  	select HAS_PDX
>  	select HAS_PMAP
>  	select IOMMU_FORCE_PT_SHARE
> +	select HAS_VMAP if !ARM_V8R

I think entries here are intended to be sorted alphabetically.

> --- a/xen/arch/x86/Kconfig
> +++ b/xen/arch/x86/Kconfig
> @@ -28,6 +28,7 @@ config X86
>  	select HAS_UBSAN
>  	select HAS_VPCI if HVM
>  	select NEEDS_LIBELF
> +	select HAS_VMAP

Here they are certainly meant to be.

> --- a/xen/include/xen/vmap.h
> +++ b/xen/include/xen/vmap.h
> @@ -1,15 +1,17 @@
> -#if !defined(__XEN_VMAP_H__) && defined(VMAP_VIRT_START)
> +#if !defined(__XEN_VMAP_H__) && (defined(VMAP_VIRT_START) || !defined(CONFIG_HAS_VMAP))
>  #define __XEN_VMAP_H__
>  
> -#include <xen/mm-frame.h>
> -#include <xen/page-size.h>
> -
>  enum vmap_region {
>      VMAP_DEFAULT,
>      VMAP_XEN,
>      VMAP_REGION_NR,
>  };
>  
> +#ifdef CONFIG_HAS_VMAP
> +
> +#include <xen/mm-frame.h>
> +#include <xen/page-size.h>
> +
>  void vm_init_type(enum vmap_region type, void *start, void *end);
>  
>  void *__vmap(const mfn_t *mfn, unsigned int granularity, unsigned int nr,
> @@ -38,4 +40,75 @@ static inline void vm_init(void)
>      vm_init_type(VMAP_DEFAULT, (void *)VMAP_VIRT_START, arch_vmap_virt_end());
>  }
>  
> +#else /* !CONFIG_HAS_VMAP */
> +
> +static inline void vm_init_type(enum vmap_region type, void *start, void *end)
> +{
> +    ASSERT_UNREACHABLE();
> +}

Do you really need this and all other inline stubs? Imo the goal ought
to be to have as few of them as possible: The one above won't be
referenced if you further make LIVEPATCH depend on HAS_VMAP (which I
think you need to do anyway), and the only other call to the function
is visible in context above (i.e. won't be used either when !HAS_VMAP).
In other cases merely having a declaration (but no definition) may be
sufficient, as the compiler may be able to eliminate calls.

Jan

