Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D887C75B87F
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jul 2023 22:06:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.566719.885923 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMZuR-0002Vv-Eb; Thu, 20 Jul 2023 20:05:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 566719.885923; Thu, 20 Jul 2023 20:05:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMZuR-0002UD-Ar; Thu, 20 Jul 2023 20:05:59 +0000
Received: by outflank-mailman (input) for mailman id 566719;
 Thu, 20 Jul 2023 20:05:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qMZuP-0002U5-Vb
 for xen-devel@lists.xenproject.org; Thu, 20 Jul 2023 20:05:58 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qMZuP-0006ls-9d; Thu, 20 Jul 2023 20:05:57 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231]
 helo=[192.168.24.131]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qMZuP-0004GX-2C; Thu, 20 Jul 2023 20:05:57 +0000
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
	bh=UYGuI15Lya02fnmoYf9gYL6zksmKOkbyLzT8PTEDDC8=; b=l/XJypQmc1PS7MFiAyBE1k3caY
	ez1yET+zkBF6xq1C4lxbgpNaHSq5hhEUMyIm0wFKVgHMgW9QO1k3lfQ3nkE65BFZFR56PKb+LgIi3
	CNmwdGKMYZ3dS0bw8mBZkJx95kZ7a+qVJOmK/jwT5JpEV9BOb8e/vEA0pCga8asdKlcE=;
Message-ID: <437849e6-08a3-8fac-a594-2003d5b94b41@xen.org>
Date: Thu, 20 Jul 2023 21:05:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [PATCH 2/8] arm/mm: Document the differences between arm32 and
 arm64 directmaps
Content-Language: en-US
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230717160318.2113-1-alejandro.vallejo@cloud.com>
 <20230717160318.2113-3-alejandro.vallejo@cloud.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230717160318.2113-3-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Alejandro,

On 17/07/2023 17:03, Alejandro Vallejo wrote:
> arm32 merely covers the XENHEAP, whereas arm64 currently covers anything in
> the frame table. These comments highlight why arm32 doesn't need to account for PDX
> compression in its __va() implementation while arm64 does.
> 
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> ---
>   xen/arch/arm/include/asm/mm.h | 27 +++++++++++++++++++++++++++
>   1 file changed, 27 insertions(+)
> 
> diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
> index 4262165ce2..1a83f41879 100644
> --- a/xen/arch/arm/include/asm/mm.h
> +++ b/xen/arch/arm/include/asm/mm.h
> @@ -280,6 +280,19 @@ static inline paddr_t __virt_to_maddr(vaddr_t va)
>   #define virt_to_maddr(va)   __virt_to_maddr((vaddr_t)(va))
>   
>   #ifdef CONFIG_ARM_32
> +/**
> + * Find the virtual address corresponding to a machine address
> + *
> + * Only memory backing the XENHEAP has a corresponding virtual address to
> + * be found. This is so we can save precious virtual space, as it's in
> + * short supply on arm32. This mapping is not subject to PDX compression
> + * because XENHEAP is known to be physically contiguous and can't hence
> + * jump over the PDX hole. This means we can avoid the roundtrips
> + * converting to/from pdx.
> + *
> + * @param ma Machine address
> + * @return Virtual address mapped to `ma`
> + */
>   static inline void *maddr_to_virt(paddr_t ma)
>   {
>       ASSERT(is_xen_heap_mfn(maddr_to_mfn(ma)));
> @@ -287,6 +300,20 @@ static inline void *maddr_to_virt(paddr_t ma)
>       return (void *)(unsigned long) ma + XENHEAP_VIRT_START;
>   }
>   #else
> +/**
> + * Find the virtual address corresponding to a machine address
> + *
> + * The directmap covers all conventional memory accesible by the
> + * hypervisor. This means it's subject to PDX compression.
> + *
> + * More specifically to arm64, the directmap mappings start at the first
> + * GiB boundary containing valid RAM. This means there's an extra offset
> + * applied (directmap_base_pdx) on top of the regular PDX compression
> + * logic.

I find this paragraph a bit confusing to read because it leads to think 
that pdx_to_maddr(directmap_base_pdx) will return a GiB aligned address.

The base PDX corresponds to the start of the first region and the only 
requirement is it should be page-aligned. However, when mapping in the 
virtual address space we also offset the start to ensure that superpage 
can be used (this is where the GiB alignment is used).

That's why XENHEAP_VIRT_START points to directmap_virt_start rather than 
DIRECTMAP_VIRT_START. I think it would make sense to have the logic 
following what you suggest as it would remove a memory read. But I would 
understand if you don't want to take that extra work. :)

So for now, I would suggest to remove "GiB boundary containing".

Cheers,

-- 
Julien Grall

