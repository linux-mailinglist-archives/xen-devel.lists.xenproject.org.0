Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B477C54C4FB
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jun 2022 11:48:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.349796.575958 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1PcT-0007QY-CW; Wed, 15 Jun 2022 09:47:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 349796.575958; Wed, 15 Jun 2022 09:47:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1PcT-0007Nt-8K; Wed, 15 Jun 2022 09:47:25 +0000
Received: by outflank-mailman (input) for mailman id 349796;
 Wed, 15 Jun 2022 09:47:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o1PcR-0007Nn-AZ
 for xen-devel@lists.xenproject.org; Wed, 15 Jun 2022 09:47:23 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o1PcQ-0005VT-Rw; Wed, 15 Jun 2022 09:47:22 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=[192.168.25.191]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o1PcQ-0008Ux-M2; Wed, 15 Jun 2022 09:47:22 +0000
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
	bh=bZ5iwt1Nbhmd9t3REb64DldQ4TAcAgDD8oDvwYim7zU=; b=v4XM4CuKC712eQd1ryEo4UrRth
	4SWqFxJz0wnpeXlYj6IH/FIdtPZrQ1IaGxkDK5vwZEhnqa1uPTp9+TVMOOdTmEfEGzQ5nOZ1eVKTZ
	fzfP5Zu9YYFL8O/I4NDJ1EQkgf5SygD8EeZv5bNzIjNIFdiDMs5kZYBVarQvAltHQwVU=;
Message-ID: <c48bb719-8cc6-ea8d-291d-4e09d42f93c2@xen.org>
Date: Wed, 15 Jun 2022 10:47:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH] xen/arm: avoid vtimer flip-flop transition in context
 switch
To: Wei Chen <wei.chen@arm.com>, xen-devel@lists.xenproject.org
Cc: nd@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220615013909.283887-1-wei.chen@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220615013909.283887-1-wei.chen@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Wei,

Title: I don't quite understand what you mean by "flip-flop transition".

On 15/06/2022 02:39, Wei Chen wrote:
> virt_vtimer_save is calculating the new time for the vtimer and
> has a potential risk of timer flip in:
> "v->arch.virt_timer.cval + v->domain->arch.virt_timer_base.offset
> - boot_count".
> In this formula, "cval + offset" could make uint64_t overflow.
> Generally speaking, this is difficult to trigger. 
> But unfortunately
> the problem was encountered with a platform where the timer started
> with a very huge initial value, like 0xF333899122223333. On this
> platform cval + offset is overflowing after running for a while.

I am not sure how this is a problem. Yes, uint64_t will overflow with 
"cval + offset", but AFAIK the overall result will still be correct and 
not undefined.

> 
> So in this patch, we adjust the formula to use "offset - boot_count"
> first, and then use the result to plus cval. This will avoid the
> uint64_t overflow.

Technically, the overflow is still present because the (offset - 
boot_count) is a non-zero value *and* cval is a 64-bit value.

So I think the equation below should be reworked to...

> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> ---
>   xen/arch/arm/vtimer.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/arm/vtimer.c b/xen/arch/arm/vtimer.c
> index 5bb5970f58..86e63303c8 100644
> --- a/xen/arch/arm/vtimer.c
> +++ b/xen/arch/arm/vtimer.c
> @@ -144,8 +144,9 @@ void virt_timer_save(struct vcpu *v)
>       if ( (v->arch.virt_timer.ctl & CNTx_CTL_ENABLE) &&
>            !(v->arch.virt_timer.ctl & CNTx_CTL_MASK))
>       {
> -        set_timer(&v->arch.virt_timer.timer, ticks_to_ns(v->arch.virt_timer.cval +
> -                  v->domain->arch.virt_timer_base.offset - boot_count));
> +        set_timer(&v->arch.virt_timer.timer,
> +                  ticks_to_ns(v->domain->arch.virt_timer_base.offset -
> +                              boot_count + v->arch.virt_timer.cval));

... something like:

ticks_to_ns(offset - boot_count) + ticks_to_ns(cval);

The first part of the equation should always be the same. So it could be 
stored in struct domain.

Cheers,

-- 
Julien Grall

