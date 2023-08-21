Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19FE67834E8
	for <lists+xen-devel@lfdr.de>; Mon, 21 Aug 2023 23:31:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.587896.919301 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYCUO-00020r-A8; Mon, 21 Aug 2023 21:31:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 587896.919301; Mon, 21 Aug 2023 21:31:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYCUO-0001yI-6t; Mon, 21 Aug 2023 21:31:08 +0000
Received: by outflank-mailman (input) for mailman id 587896;
 Mon, 21 Aug 2023 21:31:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qYCUL-0001yC-So
 for xen-devel@lists.xenproject.org; Mon, 21 Aug 2023 21:31:05 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qYCUL-0002Yu-Cm; Mon, 21 Aug 2023 21:31:05 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qYCUL-0007Pw-4W; Mon, 21 Aug 2023 21:31:05 +0000
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
	bh=EI7sjwyUiL3xnfsPS51UK4EPcLqDIAcWWzXsAZTGZZk=; b=WDEfx5piIOqnAdMyM1SzfQzTGS
	IRmjESRJp941rPa0Ia93CqjEW//TuHGX1vexPiB9HE2ZFO41Ki9xea7WsO/qyVCd55fZLdqV/rUtF
	1EAvkkn+QPMedVe4/CXk8DBuk5iTrSe/IlNh2UhNuh5rf83mIhkbVms82PE8pWXGeoWQ=;
Message-ID: <b9476973-519b-210d-6ca2-ca614d1e1279@xen.org>
Date: Mon, 21 Aug 2023 22:31:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
To: Henry Wang <Henry.Wang@arm.com>, xen-devel@lists.xenproject.org
Cc: Penny Zheng <Penny.Zheng@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Chen <wei.chen@arm.com>
References: <20230814042536.878720-1-Henry.Wang@arm.com>
 <20230814042536.878720-13-Henry.Wang@arm.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH v5 12/13] xen/arm: mmu: relocate copy_from_paddr() to
 setup.c
In-Reply-To: <20230814042536.878720-13-Henry.Wang@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 14/08/2023 05:25, Henry Wang wrote:
> From: Penny Zheng <Penny.Zheng@arm.com>
> 
> Function copy_from_paddr() is defined in asm/setup.h, so it is better
> to be implemented in setup.c.

I don't agree with this reasoning. We used setup.h to declare prototype 
for function that are out of setup.c.

Looking at the overall of this series, it is unclear to me what is the 
difference between mmu/mm.c and mmu/setup.c. I know this is technically 
not a new problem but as we split the code, it would be a good 
opportunity to have a better split.

For instance, we have setup_mm() defined in setup.c but 
setup_pagetables() and mm.c. Both are technically related to the memory 
management. So having them in separate file is a bit odd.

I also don't like the idea of having again a massive mm.c files. So 
maybe we need a split like:
   * File 1: Boot CPU0 MM bringup (mmu/setup.c)
   * File 2: Secondary CPUs MM bringup (mmu/smpboot.c)
   * File 3: Page tables update. (mmu/pt.c)

Ideally file 1 should contain only init code/data so it can be marked as 
.init. So the static pagetables may want to be defined in mmu/pt.c.

Bertrand, Stefano, any thoughts?

[...]

> diff --git a/xen/arch/arm/mmu/setup.c b/xen/arch/arm/mmu/setup.c
> index e05cca3f86..889ada6b87 100644
> --- a/xen/arch/arm/mmu/setup.c
> +++ b/xen/arch/arm/mmu/setup.c
> @@ -329,6 +329,33 @@ void __init setup_mm(void)
>   }
>   #endif
>   
> +/*

Why did the second '*' disappear?

> + * copy_from_paddr - copy data from a physical address
> + * @dst: destination virtual address
> + * @paddr: source physical address
> + * @len: length to copy
> + */
> +void __init copy_from_paddr(void *dst, paddr_t paddr, unsigned long len)
> +{
> +    void *src = (void *)FIXMAP_ADDR(FIXMAP_MISC);
> +
> +    while (len) {
> +        unsigned long l, s;
> +
> +        s = paddr & (PAGE_SIZE-1);
> +        l = min(PAGE_SIZE - s, len);
> +
> +        set_fixmap(FIXMAP_MISC, maddr_to_mfn(paddr), PAGE_HYPERVISOR_WC);
> +        memcpy(dst, src + s, l);
> +        clean_dcache_va_range(dst, l);
> +        clear_fixmap(FIXMAP_MISC);
> +
> +        paddr += l;
> +        dst += l;
> +        len -= l;
> +    }
> +}
> +
>   /*
>    * Local variables:
>    * mode: C

Cheers,

-- 
Julien Grall

