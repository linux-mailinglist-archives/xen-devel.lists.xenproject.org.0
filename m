Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0A2683615
	for <lists+xen-devel@lfdr.de>; Tue, 31 Jan 2023 20:07:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.487805.755505 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMvyp-0006Cq-V8; Tue, 31 Jan 2023 19:07:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 487805.755505; Tue, 31 Jan 2023 19:07:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMvyp-0006AH-SA; Tue, 31 Jan 2023 19:07:43 +0000
Received: by outflank-mailman (input) for mailman id 487805;
 Tue, 31 Jan 2023 19:07:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dLqc=54=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1pMvyo-0006A0-Mt
 for xen-devel@lists.xenproject.org; Tue, 31 Jan 2023 19:07:42 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20607.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::607])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 87d04f31-a19a-11ed-b63b-5f92e7d2e73a;
 Tue, 31 Jan 2023 20:07:41 +0100 (CET)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by MW3PR12MB4361.namprd12.prod.outlook.com (2603:10b6:303:5a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Tue, 31 Jan
 2023 19:07:35 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::a3a7:87d9:60f1:7eb1]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::a3a7:87d9:60f1:7eb1%4]) with mapi id 15.20.6043.033; Tue, 31 Jan 2023
 19:07:35 +0000
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
X-Inumbo-ID: 87d04f31-a19a-11ed-b63b-5f92e7d2e73a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AFkRJ7A/4sOx5/cISYJZw2B1F0JMDQ5ppYdyRDp3dwVhBkcjycUgbmVIeeiIDIX3F1qGrsIpzUzb+6rjaSqWC46ggrReqQTEF4Ag/OG0w6gpgsm4AjsZzor9/mmKY1BrMXIMp/lxYjuQFoPZBZrXGuT5t1xXrOHQoOJbVo2rjpQlGnjdatH4e2sdWBeO6zmB6fJi3Un762FzJChbQyHgu1rEQMRVhz452VavF3nfeowJPoshnYDQYAdlrNdX0UM9iV9Jn+ValasZc4vwFLO4L5z70ooUhvNDaTFSjZ1/vojdRnp68Mh6XT6vzzYvMKwjQt9iJYHB0pXlL2yeIzZz+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VQ38XZ67DqkmuNThReZZZu5DL/yy5JoGlHgaUWuf8GU=;
 b=Aukr6ZqDUXQ7diRULpcPPcIfKhKkzG47KfHo1nIIWCgD8SatiZRtxw1+ul3JMzNNkVNyaxiqBp7fCn8nqWimKZu4r/KQJCXoJRcv+L+lhr/0Jn2RUI0eUAaQAplyQvrucd1g68NyVtuBRHM9yvKz+XbQQVYdMdDkRnvPqiom6LgVlKrAwvHXWF2y8iBEhnd83nRbPwlM6RNZio2LupTrWycq+zBAUFrmCj6oKjkGaPCSDzr1L7cfmcpySE+cmur4w7Z/s0tUdXVUvCByKQk6ZRZdk0GqRAFCUq/a8sWks6iNExfRtinAlWaQUl/ENjFwwPcndosZe7MGLSBS4DuAMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VQ38XZ67DqkmuNThReZZZu5DL/yy5JoGlHgaUWuf8GU=;
 b=Ze9veedk8k/Sn89WfOS/X3bsNxVtIlHOg4P30CDVvVG9PNMNFadAvnlbha2cpPFbtHYttbI4vN7H93hC0BR00B9a/j5fGJKATNehs8dils+lMzpN72NjIiWNdutMA8UHZ+xW04+SSM/kZXJv2EmM26GgodG9xIED92wj5aHy2tY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <d5797a3a-b616-e034-1320-bf483f82fe07@amd.com>
Date: Tue, 31 Jan 2023 19:07:29 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 1/2] xen/arm: Move kernel_uimage_probe definition after
 kernel_decompress
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230131151354.25943-1-michal.orzel@amd.com>
 <20230131151354.25943-2-michal.orzel@amd.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <20230131151354.25943-2-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0494.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::19) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|MW3PR12MB4361:EE_
X-MS-Office365-Filtering-Correlation-Id: 84debc48-0ea8-43e5-4bae-08db03be69c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	a8OPZvaXdDxekGoO+vvLpEbN7YM4c3T5FfaH6giWNJMHFT/OOpuKXTb3J6p2ypesDxJRfu8lsutYe8TdYuPL8PuWKpyxe5TTO4RN50NnEkDK6NvXiJk404ScjHMdaMVAHG+1btT4KA1sipFQBZ5ymEAzsJnI9bKX9Iw8IquMNU5heFexzpijU6dhzEOdItN9swezfo01O7LVsgdOpHHZ2qpDVPKk9EimGGqs1vnNbIwAvJu/VCjp+rkb0ups4qIVQHFtDhEXf6c9+WyPz/IrcRQSJp1R/8yjigT68y7FBwCiLmCsujPUkhD4splmojSRsLRj12yrjync9c/gAMFpsV+Wqklw8gRta4vzoXDwWQnHBoImneGFzhTq9xXFLvdGzPlpS7NL8MIt2IPhbn46YKiE5HdDiuhcSGdYX5AR+STAW26JSzvr/42lVDyRT5xLqPV+eoewaahmKSWZ12inJ+y3Q47owcbSyOGrkJDPqKBUocn03swkH+8ssMHPhHSkAZlRfmSl4rglVoWLkivUJbb5rJNHgu1DR60BD7nVtALcZDrup7QsMvXE6pM1oQfDeU2xONZa96RI9SpH2CGhw9wEMoh8kFsOW3Ld2fLvV6J3p+/FYPAhf/ksPg+bUZr+o6bkZZq+V3x94hhONOtbqHH2tCtjdOe51rZXeYKdkxcXHLD4wZcnqmBoymPTxQdALBoqTsf/uqpvyplrej+ACy77oRmo6aOXMtnL8jDfM7k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(39860400002)(136003)(396003)(376002)(346002)(451199018)(31686004)(2906002)(6512007)(5660300002)(8936002)(83380400001)(41300700001)(66946007)(6666004)(6506007)(53546011)(54906003)(36756003)(66556008)(8676002)(4326008)(66476007)(478600001)(186003)(26005)(6486002)(38100700002)(2616005)(31696002)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UU03ODZwVXVJUVRxcjc0NjNTaDBtTDVMUU4wOEgzYXVsTTExSkpxdllESWtv?=
 =?utf-8?B?OGpFSDVxcG1VVDNaMHdwK3hCR1lGM2dGZGJ5VWw3L2NBZm1TOEF0MTA5Wnc4?=
 =?utf-8?B?K3hhc0NPOHg1WFh4V3djZHRkZUJCSDg5SkFRK0YyTXlseG1obTZXWGhUTFcz?=
 =?utf-8?B?MWlTMEIzTVBjQ2lxV21LcHNDSmJnRVJkYzJBRVY0NjhrU3VjUXh5ckR0d0JJ?=
 =?utf-8?B?MHdaYm9kcWMvejUySUY0VTZVWUxmL3F5dVVkc0sxaFFHNUxEa2hOblpqd0Jz?=
 =?utf-8?B?Nzd3c3NYbGtyWWJHQ2RrTC9EZnpOZGZlZTVPM2RTL00ydGdzWElmOEpGcHQ4?=
 =?utf-8?B?L3JhRHNialZtNUJCSTJ0SHZJK3RGalcvRnMyaCszVmdubWpDYnZBMk5XZm9Z?=
 =?utf-8?B?M20vWWdHdksydDBKN2RYRWlhcVFOVmQvM1BnTktaWmRxYkFVeWFwS2VIdFB0?=
 =?utf-8?B?eE81Qm0xUyt5ekRPS1NFelFGcTdwc2U3c1VVVk85TTFpSGU5SVZ4MU5NeGN1?=
 =?utf-8?B?WWpOVXJzZWd1Njd6WUE3UENHN3BkVmlKK3ZmWkRkSUFmVlJhTlp5N3FXRHRK?=
 =?utf-8?B?THAwVkJSWENUNUVsWXhjUFBCNlpaRXdKNkU0UjIvMm53RTZtQlZNS1ladGYx?=
 =?utf-8?B?eEZMcVFva1I1bWFNZUdNTkdCblJKT1RmZkppZ2xkeEphQnhObkJJbnNzQXVx?=
 =?utf-8?B?bmJIa25LaWNXQk1Rc3BIQU1mTnJxcnFwUysrT3dOK3J1TkFCSEV3TmFMdnNI?=
 =?utf-8?B?dXJjQjdGckRXK0JGdUNqRVdpRCtKY0dDVStUZUdXTWY0NktFbE84c0QyTWVF?=
 =?utf-8?B?OHpuRnArYUJNOEZ6WGw2U3lreitIdjg5TDBxY0lsVjk1VlJhVXVaV0tyeUFh?=
 =?utf-8?B?Yk9GYysvWlZlK0Vkbk5QNnl1TTZkWXVlR0pMbHRrRGwyMkxFOUw4ekpKWUM0?=
 =?utf-8?B?enpLckZpVTJjNzRTTi90d3BJdzBXTVhib3paSkNBYnM0NHVOTWRQOXlTdkxQ?=
 =?utf-8?B?VlpRcGk5K3dXSk50T2F1UjFuQ3pGVnV2M21SNXdVVVRtbUMrenBwZEppSHAz?=
 =?utf-8?B?ZFFFNkV0M0prRUVLcFBibVNtU05kRXg2ZFUydzRTcDYyS3pYc3VURWVyeURO?=
 =?utf-8?B?V3E4UkxKM0UzMmxocEk4NE1KcW12T2QvUU5lYVBYSmhRYk1kYWxVUFJ3Nmdw?=
 =?utf-8?B?UzNodm9pMU9hTnlBbzJSM1BPT3BpaDgrM1paTklOb1ZrMEZWV1E1YzFaenlj?=
 =?utf-8?B?ZlIrYUoxVCsxY3FLUERrVHNQN25GN0g1RHRhMEppRmcySCsrMUgxL3RHWDhJ?=
 =?utf-8?B?aUYyWHdXTDJHT2FFNXdDcDJyMUtjdzNoRDZKOGRtZXQwMEY1QkxCamRRNzJm?=
 =?utf-8?B?R0ZiYVIxVXp3c1BLeERHb2M2WSt1S0xmL0lPWkthNklMZFRIQnhDZFRxUDh2?=
 =?utf-8?B?NUNpc2dUV0NUWEZDV2ExOG03M2xoZHhCNFRpMlp3TUtwN3ZkOTdCcjZYS0Z0?=
 =?utf-8?B?S1BvamF2NW9nZHFHQ1ZVV041SnFDQ281THcvZG5uOWxPRWpveUEycDVsV0Nx?=
 =?utf-8?B?UkVySDRLR2dkYnRSdENYZnlLK08xYzdXUkx5WEl5cDFLc0ZYTzBRTDJGdzA1?=
 =?utf-8?B?N0cwRWg0ek9JZzl5NzM4UnJxdFo4TFEvVUQ4UlpiMWgvNWV3TnQ3c0JjNGpy?=
 =?utf-8?B?MnpQRDZuYXoxUE5qQTRZdlRsTHZ5RmxkTHVCUFd6UEhwV21aWmJlUXlDSE1o?=
 =?utf-8?B?ZGFnNlVVbVE1YXZ0UXJrSjBvV0NmRWMzeUNWQmxzREZzRjlYMFM4YnJBWE1q?=
 =?utf-8?B?dEk3MTd0bS9BaEJvRit6UlkzUVhBaSs5QS8vWkc1NDdHNmJOWVFsT1BMaWp2?=
 =?utf-8?B?a1lRTlk1UEovN0JlTDJmaVNJM2x0RWtmQ1BFQnZsNkxQOFI1NHZicGtML0gw?=
 =?utf-8?B?cTZXeVJsa0NKUDVwMVVPTHUvL3FpUHdFRy9hRFpsclU4WTYxV2Q0WTh1dGZY?=
 =?utf-8?B?bGlLY1J5aGQ4cmVCOW9hWjB4dGhHZ3dkRHdNTXd0SFFqNi8vTFBjZHk4OS9j?=
 =?utf-8?B?eTJwWDgyVHBaQUM5d0lyMFYrM2N4UzRmdWdzSUFnUmNHRFRCRjh2VWdSek5n?=
 =?utf-8?Q?R++jTH7WJwaxz3KY5vtfJQmSk?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84debc48-0ea8-43e5-4bae-08db03be69c1
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 19:07:35.8033
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GuenIn7wgk4yczIl+gxj7D2e/sG9yjcMOybIOds1Da64RAk1RSM/YkiOpKYW/Lr2R7Ex9AYPmMlwyBgNWy9iCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4361


On 31/01/2023 15:13, Michal Orzel wrote:
> In a follow-up patch, we will be calling kernel_decompress function from
> within kernel_uimage_probe to support booting compressed images with
> u-boot header. Therefore, move the kernel_uimage_probe definition after
> kernel_decompress so that the latter is visible to the former.
>
> No functional change intended.
>
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
Reviewed-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
>   xen/arch/arm/kernel.c | 146 +++++++++++++++++++++---------------------
>   1 file changed, 73 insertions(+), 73 deletions(-)
>
> diff --git a/xen/arch/arm/kernel.c b/xen/arch/arm/kernel.c
> index 36081e73f140..068fbf88e492 100644
> --- a/xen/arch/arm/kernel.c
> +++ b/xen/arch/arm/kernel.c
> @@ -186,6 +186,79 @@ static void __init kernel_zimage_load(struct kernel_info *info)
>       iounmap(kernel);
>   }
>   
> +static __init uint32_t output_length(char *image, unsigned long image_len)
> +{
> +    return *(uint32_t *)&image[image_len - 4];
> +}
> +
> +static __init int kernel_decompress(struct bootmodule *mod)
> +{
> +    char *output, *input;
> +    char magic[2];
> +    int rc;
> +    unsigned int kernel_order_out;
> +    paddr_t output_size;
> +    struct page_info *pages;
> +    mfn_t mfn;
> +    int i;
> +    paddr_t addr = mod->start;
> +    paddr_t size = mod->size;
> +
> +    if ( size < 2 )
> +        return -EINVAL;
> +
> +    copy_from_paddr(magic, addr, sizeof(magic));
> +
> +    /* only gzip is supported */
> +    if ( !gzip_check(magic, size) )
> +        return -EINVAL;
> +
> +    input = ioremap_cache(addr, size);
> +    if ( input == NULL )
> +        return -EFAULT;
> +
> +    output_size = output_length(input, size);
> +    kernel_order_out = get_order_from_bytes(output_size);
> +    pages = alloc_domheap_pages(NULL, kernel_order_out, 0);
> +    if ( pages == NULL )
> +    {
> +        iounmap(input);
> +        return -ENOMEM;
> +    }
> +    mfn = page_to_mfn(pages);
> +    output = __vmap(&mfn, 1 << kernel_order_out, 1, 1, PAGE_HYPERVISOR, VMAP_DEFAULT);
> +
> +    rc = perform_gunzip(output, input, size);
> +    clean_dcache_va_range(output, output_size);
> +    iounmap(input);
> +    vunmap(output);
> +
> +    if ( rc )
> +    {
> +        free_domheap_pages(pages, kernel_order_out);
> +        return rc;
> +    }
> +
> +    mod->start = page_to_maddr(pages);
> +    mod->size = output_size;
> +
> +    /*
> +     * Need to free pages after output_size here because they won't be
> +     * freed by discard_initial_modules
> +     */
> +    i = PFN_UP(output_size);
> +    for ( ; i < (1 << kernel_order_out); i++ )
> +        free_domheap_page(pages + i);
> +
> +    /*
> +     * Free the original kernel, update the pointers to the
> +     * decompressed kernel
> +     */
> +    fw_unreserved_regions(addr, addr + size, init_domheap_pages, 0);
> +
> +    return 0;
> +}
> +
>   /*
>    * Uimage CPU Architecture Codes
>    */
> @@ -289,79 +362,6 @@ static int __init kernel_uimage_probe(struct kernel_info *info,
>       return 0;
>   }
>   
> -static __init uint32_t output_length(char *image, unsigned long image_len)
> -{
> -    return *(uint32_t *)&image[image_len - 4];
> -}
> -
> -static __init int kernel_decompress(struct bootmodule *mod)
> -{
> -    char *output, *input;
> -    char magic[2];
> -    int rc;
> -    unsigned int kernel_order_out;
> -    paddr_t output_size;
> -    struct page_info *pages;
> -    mfn_t mfn;
> -    int i;
> -    paddr_t addr = mod->start;
> -    paddr_t size = mod->size;
> -
> -    if ( size < 2 )
> -        return -EINVAL;
> -
> -    copy_from_paddr(magic, addr, sizeof(magic));
> -
> -    /* only gzip is supported */
> -    if ( !gzip_check(magic, size) )
> -        return -EINVAL;
> -
> -    input = ioremap_cache(addr, size);
> -    if ( input == NULL )
> -        return -EFAULT;
> -
> -    output_size = output_length(input, size);
> -    kernel_order_out = get_order_from_bytes(output_size);
> -    pages = alloc_domheap_pages(NULL, kernel_order_out, 0);
> -    if ( pages == NULL )
> -    {
> -        iounmap(input);
> -        return -ENOMEM;
> -    }
> -    mfn = page_to_mfn(pages);
> -    output = __vmap(&mfn, 1 << kernel_order_out, 1, 1, PAGE_HYPERVISOR, VMAP_DEFAULT);
> -
> -    rc = perform_gunzip(output, input, size);
> -    clean_dcache_va_range(output, output_size);
> -    iounmap(input);
> -    vunmap(output);
> -
> -    if ( rc )
> -    {
> -        free_domheap_pages(pages, kernel_order_out);
> -        return rc;
> -    }
> -
> -    mod->start = page_to_maddr(pages);
> -    mod->size = output_size;
> -
> -    /*
> -     * Need to free pages after output_size here because they won't be
> -     * freed by discard_initial_modules
> -     */
> -    i = PFN_UP(output_size);
> -    for ( ; i < (1 << kernel_order_out); i++ )
> -        free_domheap_page(pages + i);
> -
> -    /*
> -     * Free the original kernel, update the pointers to the
> -     * decompressed kernel
> -     */
> -    fw_unreserved_regions(addr, addr + size, init_domheap_pages, 0);
> -
> -    return 0;
> -}
> -
>   #ifdef CONFIG_ARM_64
>   /*
>    * Check if the image is a 64-bit Image.

