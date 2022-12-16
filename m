Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7DF664E8E2
	for <lists+xen-devel@lfdr.de>; Fri, 16 Dec 2022 10:52:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.464312.722664 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p67N6-0002Y4-Vi; Fri, 16 Dec 2022 09:51:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 464312.722664; Fri, 16 Dec 2022 09:51:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p67N6-0002VU-Sd; Fri, 16 Dec 2022 09:51:16 +0000
Received: by outflank-mailman (input) for mailman id 464312;
 Fri, 16 Dec 2022 09:51:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p67N6-0002VO-3A
 for xen-devel@lists.xenproject.org; Fri, 16 Dec 2022 09:51:16 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p67N5-0007a8-MM; Fri, 16 Dec 2022 09:51:15 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.4.243]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p67N5-0008Ta-G7; Fri, 16 Dec 2022 09:51:15 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=mMSYE1uYUD3J8z5fG6VvvgZuCDUbPcKxQpJr1dqT1+s=; b=Ogx7gFx1yJgiFItsfVplUgQwgC
	9qdEV6hw3KtWVMempHade6deCQFdOJLSu6y78OFSM3iFnd+P6NSyAIDfcYuTM8liIEnofo26bZk0L
	cgchiWjqAzC7VIiECgfC1VWsM6rykGmArdnQr8Np5IH+fNKTpiPpwZdTgYfy0Do3s1uo=;
Message-ID: <b58c6548-9e70-0ed9-07a9-e35084620c36@xen.org>
Date: Fri, 16 Dec 2022 09:51:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [XEN v1 2/9] xen/arm: Define translate_dt_address_size() for the
 translation between u64 and paddr_t
Content-Language: en-US
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com
References: <20221215193245.48314-1-ayan.kumar.halder@amd.com>
 <20221215193245.48314-3-ayan.kumar.halder@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20221215193245.48314-3-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ayan,

On 15/12/2022 19:32, Ayan Kumar Halder wrote:
> paddr_t may be u64 or u32 depending of the type of architecture.
> Thus, while translating between u64 and paddr_t, one should check that the
> truncated bits are 0. If not, then raise an appropriate error.

I am not entirely convinced this extra helper is worth it. If the user 
can't provide 32-bit address in the DT, then there are also a lot of 
other part that can go wrong.

Bertrand, Stefano, what do you think?

> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
>   xen/arch/arm/include/asm/platform.h | 26 ++++++++++++++++++++++++++
>   1 file changed, 26 insertions(+)
> 
> diff --git a/xen/arch/arm/include/asm/platform.h b/xen/arch/arm/include/asm/platform.h
> index 997eb25216..6be1549f09 100644
> --- a/xen/arch/arm/include/asm/platform.h
> +++ b/xen/arch/arm/include/asm/platform.h
> @@ -42,6 +42,32 @@ struct platform_desc {
>       unsigned int dma_bitsize;
>   };
>   
> +static inline int translate_dt_address_size(u64 *dt_addr, u64 *dt_size,
> +                                            paddr_t *addr, paddr_t *size)
> +{
> +#ifdef CONFIG_ARM_PA_32

This is not yet defined. So you want to mention it in the commit message.

> +    if ( dt_addr && (*dt_addr >> PADDR_SHIFT) )
> +    {
> +        dprintk(XENLOG_ERR, "Error in DT. Invalid address\n");
> +        return -ENXIO;
> +    }
> +
> +    if ( dt_size && (*dt_size >> PADDR_SHIFT) )
> +    {
> +        dprintk(XENLOG_ERR, "Error in DT. Invalid size\n");
> +        return -ENXIO;
> +    }
> +#endif
> +
> +    if ( dt_addr && addr )
> +        *addr = (paddr_t) (*dt_addr);
> +
> +    if ( dt_size && size )
> +        *size = (paddr_t) (*dt_size);
> +
> +    return 0;
> +}
> +
>   /*
>    * Quirk for platforms where device tree incorrectly reports 4K GICC
>    * size, but actually the two GICC register ranges are placed at 64K

Cheers,

-- 
Julien Grall

