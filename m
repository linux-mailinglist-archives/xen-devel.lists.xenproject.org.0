Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B28C16FF5CE
	for <lists+xen-devel@lfdr.de>; Thu, 11 May 2023 17:23:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533468.830183 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px88W-0005Go-PE; Thu, 11 May 2023 15:23:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533468.830183; Thu, 11 May 2023 15:23:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px88W-0005Ew-Kc; Thu, 11 May 2023 15:23:20 +0000
Received: by outflank-mailman (input) for mailman id 533468;
 Thu, 11 May 2023 15:23:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DXxA=BA=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1px88V-0004zW-48
 for xen-devel@lists.xenproject.org; Thu, 11 May 2023 15:23:19 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20622.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::622])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bd62b603-f00f-11ed-8611-37d641c3527e;
 Thu, 11 May 2023 17:23:12 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by IA1PR12MB7565.namprd12.prod.outlook.com (2603:10b6:208:42f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.22; Thu, 11 May
 2023 15:23:07 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::ef8d:bf8a:d296:ec2c]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::ef8d:bf8a:d296:ec2c%7]) with mapi id 15.20.6363.033; Thu, 11 May 2023
 15:23:07 +0000
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
X-Inumbo-ID: bd62b603-f00f-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LhrK0B/tnLPFUPbz/tQI8DlAnZf3BXQ1/8o++fGxUmZhJtcwGPpw792Kw6lDEJrl5caFsZTGPprHYZirZ38NxX+rtaOOD7bJEO5y5nhEnD/UBCiZZHwPoPdapBJT3nprBGeLtKC8KknsW6LOX5vo3XwN3qhhXlSTuaxmrfdUJctN1/cZ2fRJJpfm2a4KGbK82c/c+bGhLc1+bwD1Qu73VRlSWJ1DI+tVjCt+MmKW0s3cls+UwwXrBfebyjOCAsv9dJy58lJlizDd2mKfS+A4GEWNRwuQHmEaQxq83DWIvpFLFxngNouQL3K3sGeCjLPuzEsuoChhQq6bKlI+Tn8MkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9EIhEWeo7uRyaVVlo82soj0URdLOT8LPVKCRwaKMklo=;
 b=EgZcdTlKY2ibo4dHYo6tVFUncwNNbTcsQXMvMddSP7xN40DP0qx9e5ToYXA9QzDQOwuZN+iDa7Fy1OjtJVyT56avVAXqsib945KSjmQ318mVfBn4IiK3Dyxz+9U7qXFZYgsAX4/lAWXFp2qpJGkzEi6TByqeODl1RN2db5zBW820ZvIJWSPXsC4/pi38ATjXKmviIJm22XOPYdQrHDHvxjnK81J50QgkzYKIr2LqSv35b1qKd7Stu1V6cyORm8HQ+ZhL8IvgXoFFLwHDtW/Y87e0YnPbCby2ZgAuxKgb8TlBgcPVJ8M9iunD4DDFvPsIdVqepiwjuE7h7vLATAH8bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9EIhEWeo7uRyaVVlo82soj0URdLOT8LPVKCRwaKMklo=;
 b=IbfP5jrF1z5BPAQy5w+I7+7cvUVTbEV7ybo/GcODVa9s1fVp85PQ7nN37jcfXFuw1xOa+jaZIvNFbZzhO6aarRYQ/GzmIypW9B08WzhabHzjsOgGQurSpkK9gEh/0Op3FrECZD0ZjzNUp/Qr/nkd2FAA7FBqMf9JudCe8dHvkzk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <c6e5fde1-6206-adce-65e8-fc651e954d1e@amd.com>
Date: Thu, 11 May 2023 16:23:01 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.1
Subject: Re: [PATCH v2 2/2] xen/arm: domain_build: Fix format specifiers in
 map_{dt_}irq_to_domain()
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230511130218.22606-1-michal.orzel@amd.com>
 <20230511130218.22606-3-michal.orzel@amd.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <20230511130218.22606-3-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0480.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a2::36) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|IA1PR12MB7565:EE_
X-MS-Office365-Filtering-Correlation-Id: c281c288-6525-4ceb-1ef8-08db52339f7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YwNpqX2VeMsHj/8BEKyjEZ17TRArPGeqfWIUm4+MLi6MxWRTmoyyZ+lfVbYJP0RSr8W9IYLVZxUH50zAbFMV/GzyowfiqWDJbd13DNywMNWUDvW56NZGnKpqO/xuIoP0Jmu9uc8HbwTaYEMt/V2VI0gelKH+SNjFqjaVs/Ys+yka2wYTz5wYkQa7JbwMESqagrODkX3JarcNE0FywCbbdWDScF0ChDeTCeZJtVTSC4GzzTyrNINmx0ikwT6nxMGt3Ybn5a1PagTMY7/sVRRrT0txT838WlAi5ZIKxLLo2fwZJLopMPWYQOvC6kZq1JCWSz4bIQWY4nDvkSSuqxNEu/Y+BDz6cZubhtiLt4R0XWoNk66ORG7bDXn9MXu6PeeEr6qCKR9pvVV5bCbSQzbM5ybqXK4qrEpiUwyVehDbYOLczYITfhhDkkgsLoPqHBFM0Di0rcsHcUJ0Glix/PNUfdCqQqUzNHgYUI/0hH1BGQGgYXWtFbrqmt8ETngLgm1DI0R4MvMdg4CgL7GIJS8gE4QrdR2bKtafo2XElnvHP7u3pLKbasCYaPNMBImiR0IXSK9AHH18OEVfpb6EZuRl39brOVOLTeLSin2zQOHLSdj8KPUAFPwpVvKzUFfjGPZlIk1fV7ah97Yl1uXbXWBVYQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(366004)(39860400002)(376002)(396003)(451199021)(31686004)(38100700002)(41300700001)(6486002)(53546011)(83380400001)(6506007)(26005)(2616005)(6512007)(6666004)(186003)(478600001)(54906003)(66556008)(66476007)(4326008)(66946007)(316002)(5660300002)(2906002)(36756003)(31696002)(8936002)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Nk1ENkJvSURsNnVEcWI4Mm9TMEJ6UHpmNHB6VCtWRzAxcXdRcVNxdENCaGhM?=
 =?utf-8?B?SmhlVVdTYWpKa3l1b1pZU0NNaDZvZG5TYS81aU55RjNpMk9BTHE2elQyTzh2?=
 =?utf-8?B?anJuNFJ1V0dHeUZpMzdSaHRjNkkrejNiQldES0RlNFlCSjhnY0tYbzRwc3VN?=
 =?utf-8?B?MkdFV3ExWHZwTDNNQlJvSGF5RU5qK3hNNTFnV2JGMW93K1d5bDE4SXhidERs?=
 =?utf-8?B?eG5oaGFWdlBSNjZFUDArajVTOTRySVozd0hqeVlKM2srUFA3ZllMVFlsTUZ3?=
 =?utf-8?B?TnFzaFFsMGFuR0Z5d3J5UDE4R3lERll0WXdaNHVQNm41MitucXZTbWNTL2tV?=
 =?utf-8?B?eXNFWStvMzZUL3E2Rys1NndDN05rSE1QNFQwaVlqUXZLbm5HZk9lV2ZiSkVn?=
 =?utf-8?B?SG9XSTVXR05lRW5zSzRQV3AvTGx4cUQvamZyOW9OTllqQ2VOcDBKOGozemdo?=
 =?utf-8?B?Wmtsd082K293NDFoNFhYUEFIZXU5cEcycnhUS2RIQ0JMYlBreHFwZnorZlhL?=
 =?utf-8?B?dkhYVFdQMXFOY2NjWk45Mkh1VE5jUEp0YlI4eDRDQnVGMjRWOTNtcE42SmlG?=
 =?utf-8?B?NUF3YU8vUEdMdGdqUVNnTXZPSWdOL0oyRFQ4N2ZUSjVVWHZuUktldldVOWxZ?=
 =?utf-8?B?QmxuL1N5emtremFCSW1obzBHZkRRc093MGpoNzgxcDhBSkVIY0c0cThaR2Jh?=
 =?utf-8?B?RldtV3BGRXNKUmcvczdNVXU4MWorL28vbks3SjBFQWRXTG5oakFSYzV3eXA4?=
 =?utf-8?B?Ymg2S1N6TzFiQlJUeGJMUWZXWGZvTTNqQXlRR2JneGF2bUhBUDRUWHVRL0Rj?=
 =?utf-8?B?cmNXWER0QytCOCtlZ1cyU2hxUjhHbWJDV25jK0RPRjdMK3dLOU9DaUZoK0JT?=
 =?utf-8?B?dFBHNmsvSk42bmtyR09sN1RDa0pIaDhkaVZaemRSeCs5dkUxd28vWG9JcnVE?=
 =?utf-8?B?aENiektnRC9XeUY5UGNBRktSWHNrdnpvc3RoU0tGTmpycjBjdFpCb2xHeXZU?=
 =?utf-8?B?ZnZBa0Y3dGxLTWxEQXhQS1pKQWZSWUc4Z1ZpelJ2V2RiNnMyK0lhVjEyVWxU?=
 =?utf-8?B?djFaNnlNTTBSM0t1TUVKM3h6blYwSGZHWkdTSFE4b3hPZW9LRTRKVGFvMkdj?=
 =?utf-8?B?Z25PVzA3Q2hXbmVvZEo5RjkySHdzS3g0WFRGRU5oKzRqQ1JadFZudUxuTTky?=
 =?utf-8?B?UHVlOUlvYnBXTWI5eWxBZjAyM1RvQUFObER3VUl3aElrU0pPSW1qSUdJVGhp?=
 =?utf-8?B?WlQvTE5RWDZlQzJHWGV0SHR4TWhoWmdZdEhtQkFpNU0ramJjV0RwSlFHcytE?=
 =?utf-8?B?Vnd6ZDNXQktyNzJFd3dMbkN5c09vWjN3ekJuYnlKL2VjRHBXNmhyMzR0d1lD?=
 =?utf-8?B?MmNkajc1Q29kS3ZDU3gyTXFPZVFTWkxKcWg1WWIvMEVoTXpLRkI1djB5RS93?=
 =?utf-8?B?M2RHR0V4dHVta3VSVWp2aUJ1Tzdic3lZVHlCaHd5Z25yM1VlKzRTTU9MVVBG?=
 =?utf-8?B?T25pa2RyczVFMlZVMGZVTmVUdkh6NVpnRnVnS0l2amh6UDhLTXJTcTNIa1F4?=
 =?utf-8?B?Zkltc2xXTHBlcHVycU9jTnRLZUR1cy9peDFabnVwUXlTVElJTFdQTUhFeWV1?=
 =?utf-8?B?OGpBVlA3NGRCZzRqQkZPOG92ZjVJam5JL01Zend1ZHp4Lzg1clowcGYwekx6?=
 =?utf-8?B?aSs5WWp1NTFXVlZydXhjNTFHZW9YdDJzczMzelpFeDJ3K29EU1djQmhBaVZt?=
 =?utf-8?B?ZlR5MGNvYW9ZRkd0YUFic1JJWUFjWFFVdEpVazB2WlpETDl5YUNCV2JKYnhL?=
 =?utf-8?B?ZFFPdmdCcUw2bGd2OHRIaHR3OFVTU3dteFJKS0JKRGJyb2dFcTVVTms4S215?=
 =?utf-8?B?bkc3cEo2RGZtOEdzNkhZaDlxQy9jSHFrd1dzelRIYzhBZnl0Y2VjbmRGNWo2?=
 =?utf-8?B?eEIwR0NBMkx1NnhYdTBHTGR3YUhpZzBBM0lOdEpKalludTNRUXVFUUFqczBO?=
 =?utf-8?B?d3pWTmllbHZtQmRTVG5sNk9PbmwvcmRyWGpwc2xRNW41YWZnOG0zQWs0NCti?=
 =?utf-8?B?dkFnUzhiVldFRHRuQ1NTV1d0aSt5V0ZqR3FsZFgreGFmejNDOEd2ajF4czBE?=
 =?utf-8?Q?77pB10Y7PtJCGHxcEXypstHK3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c281c288-6525-4ceb-1ef8-08db52339f7a
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2023 15:23:07.8023
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dq3QyEqeZm+f6vFvDRFQmQz48ZapuO8+1sT9PNsccL9koK0myaG7e5IGrLj2Gyore9NCMwpG8hTqqPDeofLJRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7565


On 11/05/2023 14:02, Michal Orzel wrote:
> IRQ is of unsigned type so %u should be used. When printing domain id,
> %pd should be the correct format to maintain the consistency.
>
> Also, wherever possible, reduce the number of splitted lines for printk().
>
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
Reviewed-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
> Changes in v2:
>   - split the v1 patch so that the format specifiers are handled separately
>   - also fix map_irq_to_domain()
> ---
>   xen/arch/arm/domain_build.c | 14 +++++---------
>   1 file changed, 5 insertions(+), 9 deletions(-)
>
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 9dee1bb8f21c..71f307a572e9 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -2265,8 +2265,7 @@ int __init map_irq_to_domain(struct domain *d, unsigned int irq,
>       res = irq_permit_access(d, irq);
>       if ( res )
>       {
> -        printk(XENLOG_ERR "Unable to permit to dom%u access to IRQ %u\n",
> -               d->domain_id, irq);
> +        printk(XENLOG_ERR "Unable to permit to %pd access to IRQ %u\n", d, irq);
>           return res;
>       }
>   
> @@ -2282,8 +2281,7 @@ int __init map_irq_to_domain(struct domain *d, unsigned int irq,
>           res = route_irq_to_guest(d, irq, irq, devname);
>           if ( res < 0 )
>           {
> -            printk(XENLOG_ERR "Unable to map IRQ%"PRId32" to dom%d\n",
> -                   irq, d->domain_id);
> +            printk(XENLOG_ERR "Unable to map IRQ%u to %pd\n", irq, d);
>               return res;
>           }
>       }
> @@ -2303,8 +2301,7 @@ static int __init map_dt_irq_to_domain(const struct dt_device_node *dev,
>   
>       if ( irq < NR_LOCAL_IRQS )
>       {
> -        printk(XENLOG_ERR "%s: IRQ%"PRId32" is not a SPI\n",
> -               dt_node_name(dev), irq);
> +        printk(XENLOG_ERR "%s: IRQ%u is not a SPI\n", dt_node_name(dev), irq);
>           return -EINVAL;
>       }
>   
> @@ -2312,9 +2309,8 @@ static int __init map_dt_irq_to_domain(const struct dt_device_node *dev,
>       res = irq_set_spi_type(irq, dt_irq->type);
>       if ( res )
>       {
> -        printk(XENLOG_ERR
> -               "%s: Unable to setup IRQ%"PRId32" to dom%d\n",
> -               dt_node_name(dev), irq, d->domain_id);
> +        printk(XENLOG_ERR "%s: Unable to setup IRQ%u to %pd\n",
> +               dt_node_name(dev), irq, d);
>           return res;
>       }
>   

