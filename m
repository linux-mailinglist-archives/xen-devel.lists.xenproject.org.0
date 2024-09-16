Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB4697A8BB
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2024 23:28:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.799718.1209710 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqJG1-0007KS-Qr; Mon, 16 Sep 2024 21:27:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 799718.1209710; Mon, 16 Sep 2024 21:27:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqJG1-0007Ho-NR; Mon, 16 Sep 2024 21:27:41 +0000
Received: by outflank-mailman (input) for mailman id 799718;
 Mon, 16 Sep 2024 21:27:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sqJG0-0007Hi-Nu
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2024 21:27:40 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sqJG0-0004xX-7w; Mon, 16 Sep 2024 21:27:40 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.244])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sqJG0-0007T9-0W; Mon, 16 Sep 2024 21:27:40 +0000
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
	bh=SDjPW1eq2lMOQYV1w09/zNdhuvz9Wk7PoNjE5SF5128=; b=rMrgX3gVKzKcbzZdpFKs/Ujn2Y
	fCahXZZKk4b9y4qTxwI60fLYs4AzXGjAdMFNJFlVk+85fAB9qK982Cs/bOHSTFb8BqFbc+8jc9Mnh
	16cL429g2k1vWnZ7rnd5YQUq0NeYfrl6942s+fRu2NsqSbCBPKcQ5sB4T19aGAc8XlXQ=;
Message-ID: <c80dd525-7fb6-4e2f-99f2-5d96d3f7ec52@xen.org>
Date: Mon, 16 Sep 2024 22:27:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ioreq: don't wrongly claim "success" in
 ioreq_send_buffered()
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <f0cd7c48-6816-4050-a505-693c4a470506@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <f0cd7c48-6816-4050-a505-693c4a470506@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 11/09/2024 13:19, Jan Beulich wrote:
> Returning a literal number is a bad idea anyway when all other returns
> use IOREQ_STATUS_* values. While that's maybe intended on Arm (mapping
> to IO_ABORT), 

Arm doesn't support buffered ioreq (see ioreq_server_create()) and 
AFAICT the "0" was already there before the code was moved.

 > mapping to X86EMUL_OKAY is surely wrong on x86.

The code has been for nearly 10 years. So I would like to understand why 
the change now. Did you see any issue? The unclear part for me is the 
behavior change. Below...

> 
> Fixes: f6bf39f84f82 ("x86/hvm: add support for broadcast of buffered ioreqs...")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Judging from history, it may want to be IOREQ_STATUS_UNHANDLED instead,
> eliminating the need for IOREQ_STATUS_BAD. That'll be a behavioral
> change on Arm then too, though.

... you mention Arm. But not x86. This would imply there are no behavior 
change but I don't understand why.

For the Arm behavior change, per above, I don't think we can reach the 
code on Arm so it should not be a problem to change it.

> 
> Shouldn't IOREQ_READ requests also be rejected here, for the result of
> a read not possibly coming from anywhere, yet a (bogus) caller then
> assuming some data was actually returned?

I am not sure. I understand from an hardened PoV. But this would add an 
extra check to something the caller should be aware of. This is 
different from the address check because this is more of an 
implementation details.

So maybe it should be an ASSERT()?

> 
> --- a/xen/arch/arm/include/asm/ioreq.h
> +++ b/xen/arch/arm/include/asm/ioreq.h
> @@ -56,6 +56,7 @@ static inline void msix_write_completion
>   #define IOREQ_STATUS_HANDLED     IO_HANDLED
>   #define IOREQ_STATUS_UNHANDLED   IO_UNHANDLED
>   #define IOREQ_STATUS_RETRY       IO_RETRY
> +#define IOREQ_STATUS_BAD         IO_ABORT
>   
>   #endif /* __ASM_ARM_IOREQ_H__ */
>   
> --- a/xen/arch/x86/include/asm/hvm/ioreq.h
> +++ b/xen/arch/x86/include/asm/hvm/ioreq.h
> @@ -12,6 +12,7 @@
>   #define IOREQ_STATUS_HANDLED     X86EMUL_OKAY
>   #define IOREQ_STATUS_UNHANDLED   X86EMUL_UNHANDLEABLE
>   #define IOREQ_STATUS_RETRY       X86EMUL_RETRY
> +#define IOREQ_STATUS_BAD         X86EMUL_UNRECOGNIZED
>   
>   #endif /* __ASM_X86_HVM_IOREQ_H__ */
>   
> --- a/xen/common/ioreq.c
> +++ b/xen/common/ioreq.c
> @@ -1175,7 +1175,7 @@ static int ioreq_send_buffered(struct io
>           return IOREQ_STATUS_UNHANDLED;
>   
>       /*
> -     * Return 0 for the cases we can't deal with:
> +     * Return BAD for the cases we can't deal with:
>        *  - 'addr' is only a 20-bit field, so we cannot address beyond 1MB
>        *  - we cannot buffer accesses to guest memory buffers, as the guest
>        *    may expect the memory buffer to be synchronously accessed
> @@ -1183,7 +1183,7 @@ static int ioreq_send_buffered(struct io
>        *    support data_is_ptr we do not waste space for the count field either
>        */
>       if ( (p->addr > 0xfffffUL) || p->data_is_ptr || (p->count != 1) )
> -        return 0;
> +        return IOREQ_STATUS_BAD;
>   
>       switch ( p->size )
>       {

Cheers,

-- 
Julien Grall

