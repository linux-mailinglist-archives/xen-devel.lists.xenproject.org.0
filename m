Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43581608C8A
	for <lists+xen-devel@lfdr.de>; Sat, 22 Oct 2022 13:26:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.428237.678201 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omCd7-0006Mo-7Y; Sat, 22 Oct 2022 11:25:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 428237.678201; Sat, 22 Oct 2022 11:25:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omCd7-0006KO-4X; Sat, 22 Oct 2022 11:25:29 +0000
Received: by outflank-mailman (input) for mailman id 428237;
 Sat, 22 Oct 2022 11:25:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1omCd6-0006KI-Kq
 for xen-devel@lists.xenproject.org; Sat, 22 Oct 2022 11:25:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1omCd6-0001c2-A2; Sat, 22 Oct 2022 11:25:28 +0000
Received: from home.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1omCd6-0000pZ-2K; Sat, 22 Oct 2022 11:25:28 +0000
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
	bh=z+cwlXg6MdquqcivDRdP5k0NvZOBUUXiyGR0buOOG9Y=; b=XXP4T6cH2CACxJADmoAQUM0d1L
	C7Jk0IAAZARghEZuVkRWV0MMyA2MiYV8CXxhl7P4NOEzbfhpAmaKhJR2KCGL4N/VrmNKWLvBTM+Wz
	XQ4ngGM/NAkbqJc3uKSYYNR/afFNjz9FaLr1aJWe+PnDFRt+7oXOL2MTKUtvMWbDrwzU=;
Message-ID: <4fef02bd-80e7-f24a-5496-4f35d1e5060c@xen.org>
Date: Sat, 22 Oct 2022 12:25:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.3
To: Ayan Kumar Halder <ayankuma@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, Volodymyr_Babchuk@epam.com,
 bertrand.marquis@arm.com
References: <20221021153128.44226-1-ayankuma@amd.com>
 <20221021153128.44226-12-ayankuma@amd.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [RFC PATCH v1 11/12] Arm: GICv3: Define macros to read/write 64
 bit
In-Reply-To: <20221021153128.44226-12-ayankuma@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ayan,

On 21/10/2022 16:31, Ayan Kumar Halder wrote:
> Defined readq_relaxed()/writeq_relaxed() to read and write 64 bit regs.
> This in turn calls readl_relaxed()/writel_relaxed() twice for the lower
> and upper 32 bits.

This needs an explanation why we can't use "strd/ldrd". And the same 
would have to be duplicated in the code below.

> 
> Signed-off-by: Ayan Kumar Halder <ayankuma@amd.com>
> ---
>   xen/arch/arm/include/asm/arm32/io.h | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/xen/arch/arm/include/asm/arm32/io.h b/xen/arch/arm/include/asm/arm32/io.h
> index 73a879e9fb..6a5f563fbc 100644
> --- a/xen/arch/arm/include/asm/arm32/io.h
> +++ b/xen/arch/arm/include/asm/arm32/io.h
> @@ -80,10 +80,14 @@ static inline u32 __raw_readl(const volatile void __iomem *addr)
>                                           __raw_readw(c)); __r; })
>   #define readl_relaxed(c) ({ u32 __r = le32_to_cpu((__force __le32) \
>                                           __raw_readl(c)); __r; })
> +#define readq_relaxed(c) ({ u64 __r = (le64_to_cpu(readl_relaxed(c+4)) << 32) | \
> +                                        readl_relaxed(c); __r; })

All the read*_relaxed are provide atomic read. This is not guaranteed by 
your new helper. The name should be different (maybe 
readq_relaxed_non_atomic()) to make clear of the difference.

I also don't quite understand the implementation. The value returned by 
readl_relaxed() is already in the CPU endianess. So why do you call 
le64_to_cpu() on top?

>   
>   #define writeb_relaxed(v,c)     __raw_writeb(v,c)
>   #define writew_relaxed(v,c)     __raw_writew((__force u16) cpu_to_le16(v),c)
>   #define writel_relaxed(v,c)     __raw_writel((__force u32) cpu_to_le32(v),c)
> +#define writeq_relaxed(v,c)     writel_relaxed(((uint64_t)v&0xffffffff), c); \
> +                                    writel_relaxed((((uint64_t)v)>>32), (c+4));

This needs to be surrounded with do { } while (0), otherwise the 
following would not properly work:

if ( foo )
   writeq_relaxed(v, c);

Similarly, if 'v' is a call, then it will end up to be called twice.

>   
>   #define readb(c)                ({ u8  __v = readb_relaxed(c); __iormb(); __v; })
>   #define readw(c)                ({ u16 __v = readw_relaxed(c); __iormb(); __v; })

Cheers,

-- 
Julien Grall

