Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E3B872783
	for <lists+xen-devel@lfdr.de>; Tue,  5 Mar 2024 20:24:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688899.1073650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhaOg-0007gP-Ic; Tue, 05 Mar 2024 19:24:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688899.1073650; Tue, 05 Mar 2024 19:24:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhaOg-0007e8-Fi; Tue, 05 Mar 2024 19:24:18 +0000
Received: by outflank-mailman (input) for mailman id 688899;
 Tue, 05 Mar 2024 19:24:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rhaOf-0007e2-Ek
 for xen-devel@lists.xenproject.org; Tue, 05 Mar 2024 19:24:17 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rhaOe-0003Tj-9I; Tue, 05 Mar 2024 19:24:16 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rhaOe-00069c-0h; Tue, 05 Mar 2024 19:24:16 +0000
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
	bh=irgT0X8ufDLqbfEm8C0PZ2axnNEspdMiy57IUXO93jo=; b=LLFHfaV8z+usb+Q41JVUWAI+nV
	7PiUPKiiTiUhHeFWO6BAYwBCyfRahZEZBh1qALCzjfTP2SZVF9j9Jre/67ZnlSf76iAs/O4y9tTif
	paidkOZBe8d2zAiUfX1x8Y1YPyyQeQtVc2uaKhfvHea0wTlgA397V3YUuPOCbbF0Dz+k=;
Message-ID: <ce705871-bda9-4518-96da-010f24c98512@xen.org>
Date: Tue, 5 Mar 2024 19:24:14 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86+Arm: drop (rename) __virt_to_maddr() /
 __maddr_to_virt()
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <b837e02d-fd65-458f-a946-ea36a52ddd3e@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <b837e02d-fd65-458f-a946-ea36a52ddd3e@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

The title is quite confusing. I would have expected the macro...

On 05/03/2024 08:33, Jan Beulich wrote:
> There's no use of them anymore except in the definitions of the non-
> underscore-prefixed aliases. Rename the inline functions, adjust the
> virt_to_maddr() #define-e, and purge the (x86-only) maddr_to_virt() one,
> thus eliminating a bogus cast which would have allowed the passing of a
> pointer type variable into maddr_to_virt() to go silently.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/arch/arm/include/asm/mm.h
> +++ b/xen/arch/arm/include/asm/mm.h
> @@ -256,12 +256,12 @@ static inline void __iomem *ioremap_wc(p
>   /* Page-align address and convert to frame number format */
>   #define paddr_to_pfn_aligned(paddr)    paddr_to_pfn(PAGE_ALIGN(paddr))
>   
> -static inline paddr_t __virt_to_maddr(vaddr_t va)
> +static inline paddr_t virt_to_maddr(vaddr_t va)
>   {
>       uint64_t par = va_to_par(va);
>       return (par & PADDR_MASK & PAGE_MASK) | (va & ~PAGE_MASK);
>   }
> -#define virt_to_maddr(va)   __virt_to_maddr((vaddr_t)(va))
> +#define virt_to_maddr(va) virt_to_maddr((vaddr_t)(va))

... to be removed. But you keep it and just overload the name. I know it 
is not possible to remove the macro because some callers are using 
pointers (?). So I would rather prefer if we keep the name distinct on Arm.

Let see what the other Arm maintainers think.

Cheers,

-- 
Julien Grall

