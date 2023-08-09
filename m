Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A33D7758E1
	for <lists+xen-devel@lfdr.de>; Wed,  9 Aug 2023 12:55:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.580866.909321 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTgql-0003Zq-7N; Wed, 09 Aug 2023 10:55:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 580866.909321; Wed, 09 Aug 2023 10:55:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTgql-0003Xa-3z; Wed, 09 Aug 2023 10:55:35 +0000
Received: by outflank-mailman (input) for mailman id 580866;
 Wed, 09 Aug 2023 10:55:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qTgqk-0003XU-BO
 for xen-devel@lists.xenproject.org; Wed, 09 Aug 2023 10:55:34 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qTgqi-0005qB-MK; Wed, 09 Aug 2023 10:55:32 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=[192.168.16.102]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qTgqi-0002Db-FB; Wed, 09 Aug 2023 10:55:32 +0000
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
	bh=uGxsdS7rY7GvnSEbPsH4bZeQXPNOc0MWLGxxwo9QX0k=; b=EPM+q+GPBv9NgQ9eEkX2NyBbsa
	87uI1MA958g1f2LGpU8LvXU+A3iPbipMeM1WIDYRWNhEW94H6G2WFdnGzn5TsMtIo6E4I1v89MLEp
	jp5lWQe7/aYYYcv6Z+THkq2vD/D9Z1QmvB8MK/mdj3ESmAS0cBvNiiTU0irAYAs51VvI=;
Message-ID: <c7719a71-15fa-4c55-b02b-e8cf1a828cc2@xen.org>
Date: Wed, 9 Aug 2023 11:55:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] move PAGE_ALIGN() to common header
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>
References: <a62ca6f0-765d-16bc-a5d4-e1ca9303de6a@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <a62ca6f0-765d-16bc-a5d4-e1ca9303de6a@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 09/08/2023 11:50, Jan Beulich wrote:
> Much like we have PAGE_OFFSET() there already, there's also no reason
> for each arch to define identical PAGE_ALIGN().
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/arch/arm/include/asm/page.h
> +++ b/xen/arch/arm/include/asm/page.h
> @@ -303,8 +303,6 @@ static inline int gva_to_ipa(vaddr_t va,
>   
>   #endif /* __ASSEMBLY__ */
>   
> -#define PAGE_ALIGN(x) (((x) + PAGE_SIZE - 1) & PAGE_MASK)
> -
>   #endif /* __ARM_PAGE_H__ */
>   
>   /*
> --- a/xen/arch/x86/include/asm/page.h
> +++ b/xen/arch/x86/include/asm/page.h
> @@ -404,8 +404,6 @@ static inline void invalidate_icache(voi
>   
>   #endif /* !__ASSEMBLY__ */
>   
> -#define PAGE_ALIGN(x) (((x) + PAGE_SIZE - 1) & PAGE_MASK)
> -
>   #endif /* __X86_PAGE_H__ */
>   
>   /*
> --- a/xen/include/xen/page-size.h
> +++ b/xen/include/xen/page-size.h
> @@ -10,7 +10,8 @@
>    */
>   #define PAGE_SIZE           (_AC(1,L) << PAGE_SHIFT)
>   #define PAGE_MASK           (~(PAGE_SIZE-1))
> -#define PAGE_OFFSET(ptr)   ((unsigned long)(ptr) & ~PAGE_MASK)
> +#define PAGE_OFFSET(ptr)    ((unsigned long)(ptr) & ~PAGE_MASK)

Please mention in the commit message that you took the opportunity to 
re-indent PAGE_OFFSET(). With that:

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

