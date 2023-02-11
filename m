Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BEB1692FC6
	for <lists+xen-devel@lfdr.de>; Sat, 11 Feb 2023 10:26:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.493840.763876 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQm8X-0001xV-9s; Sat, 11 Feb 2023 09:25:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 493840.763876; Sat, 11 Feb 2023 09:25:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQm8X-0001u8-6k; Sat, 11 Feb 2023 09:25:37 +0000
Received: by outflank-mailman (input) for mailman id 493840;
 Sat, 11 Feb 2023 09:25:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pQm8V-0001u2-A8
 for xen-devel@lists.xenproject.org; Sat, 11 Feb 2023 09:25:35 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pQm8U-0002d0-Mc; Sat, 11 Feb 2023 09:25:34 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pQm8U-0002az-Fm; Sat, 11 Feb 2023 09:25:34 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=hWMoGp/KYd7Hdn/gM32Fqd7HnigzVj93ec2z1aEYW8Y=; b=gXIAl5iX51WXRSmQ2f6JRz9e1w
	0hC3ulFwd0ghTEMVYc4dy+rVG/vku3+3UVmltHXKM+9a/qJvYLSmqvlx5FfQ2XaGQIYJu1Z82AxyB
	xFJkbFZ8UpaOIjwNY2MAfzEZRCCiIrSbUbMZr2CAfvbaDt0AiJRLUVsgHO3M/tfS+3Qo=;
Message-ID: <6ffc8be8-def5-1f55-7468-306bf758e9d1@xen.org>
Date: Sat, 11 Feb 2023 09:25:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, jbeulich@suse.com,
 wl@xen.org, rahul.singh@arm.com
References: <20230208120529.22313-1-ayan.kumar.halder@amd.com>
 <20230208120529.22313-5-ayan.kumar.halder@amd.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [XEN v3 4/9] xen/arm: Introduce a wrapper for
 dt_device_get_address() to handle paddr_t
In-Reply-To: <20230208120529.22313-5-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ayan,

On 08/02/2023 12:05, Ayan Kumar Halder wrote:
> diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
> index 6c9712ab7b..d0f19d5cfc 100644
> --- a/xen/common/device_tree.c
> +++ b/xen/common/device_tree.c
> @@ -934,8 +934,9 @@ bail:
>   }
>   
>   /* dt_device_address - Translate device tree address and return it */
> -int dt_device_get_address(const struct dt_device_node *dev, unsigned int index,
> -                          u64 *addr, u64 *size)
> +static int dt_device_get_address(const struct dt_device_node *dev,
> +                                 unsigned int index,
> +                                 u64 *addr, u64 *size)
>   {
>       const __be32 *addrp;
>       unsigned int flags;
> @@ -955,6 +956,37 @@ int dt_device_get_address(const struct dt_device_node *dev, unsigned int index,
>       return 0;
>   }
>   
> +int dt_device_get_paddr(const struct dt_device_node *dev, unsigned int index,
> +                        paddr_t *addr, paddr_t *size)
> +{
> +    u64 dt_addr = 0, dt_size = 0;

Please use uint64_t for new code.

> +    int ret;
> +
> +    ret = dt_device_get_address(dev, index, &dt_addr, &dt_size);
> +
> +    if ( addr )
> +    {
> +        if ( (dt_addr >> (PADDR_SHIFT - 1)) > 1 )
> +        {
> +            printk("Error: Physical address greater than max width supported\n");

I would print the width, address and the node name to help debugging.

> +            return -EINVAL;

NIT: -EINVAL tends to be quite overloaded. How about using -ERANGE?

> +        }
> +
> +        *addr = dt_addr;
> +    }
> +
> +    if ( size )
> +    {
> +        if ( (dt_size >> (PADDR_SHIFT - 1)) > 1 )
> +        {
> +            printk("Error: Physical size greater than max width supported\n");

Same here for the message but with s/address/size/.


> +            return -EINVAL;

Same here for the errno.

The rest looks fine so long Stefano's comment are addressed.

> +        }
> +        *size = dt_size;
> +    }
> +
> +    return ret;
> +}

Cheers,

-- 
Julien Grall

