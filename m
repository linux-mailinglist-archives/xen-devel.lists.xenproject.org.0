Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD8A51B8BE
	for <lists+xen-devel@lfdr.de>; Thu,  5 May 2022 09:25:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.321509.542497 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmVrF-0002Ah-KU; Thu, 05 May 2022 07:25:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 321509.542497; Thu, 05 May 2022 07:25:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmVrF-00028h-Ha; Thu, 05 May 2022 07:25:05 +0000
Received: by outflank-mailman (input) for mailman id 321509;
 Thu, 05 May 2022 07:25:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nmVrE-00028b-Gq
 for xen-devel@lists.xenproject.org; Thu, 05 May 2022 07:25:04 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nmVrE-0007IQ-9F; Thu, 05 May 2022 07:25:04 +0000
Received: from home.octic.net ([81.187.162.82] helo=[10.0.1.193])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nmVrE-0003ir-3b; Thu, 05 May 2022 07:25:04 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Cc:From:
	References:To:Subject:MIME-Version:Date:Message-ID;
	bh=rswWiS6EWY9ocAYetmOTtZ6L0xXY+2ny9cCO8dMRdjQ=; b=Jx2a1uaFQZajXKRsUI78YU4O1r
	dCx0In7YAzSVyz3zKMUzVI6Z/xh08H8GHn4IacJIxBsYru2yKbMKtbPgJm7kgdNCX7jRmoo6dhDjm
	pXB6ysZbT6lvH5r4kVadbtXfoFF7GLJAYcpug55ZjvRgRj1U1hVNW0wngOJlQP/WDTfk=;
Message-ID: <9b082ec7-c9a1-18ac-5d7e-59922480ea65@xen.org>
Date: Thu, 5 May 2022 08:25:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.1
Subject: Re: [PATCH 1/2] xen/arm: Defer request_irq on secondary CPUs after
 local_irq_enable
To: Henry Wang <Henry.Wang@arm.com>, xen-devel@lists.xenproject.org,
 Wei Chen <Wei.Chen@arm.com>
References: <20220505025407.919988-1-Henry.Wang@arm.com>
 <20220505025407.919988-2-Henry.Wang@arm.com>
From: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>
In-Reply-To: <20220505025407.919988-2-Henry.Wang@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Henry,

The CC list doesn't seem to contain the other maintainers. Please use 
the scripts provided in the repo (such scripts/add_maintainers.pl) to 
generate the CC.

On 05/05/2022 03:54, Henry Wang wrote:
> With the enhanced ASSERT_ALLOC_CONTEXT, calling request_irq before
> local_irq_enable on secondary cores will lead to
> 
> (XEN) Xen call trace:
> (XEN) [<000000000021d86c>] alloc_xenheap_pages+0x74/0x194 (PC)
> (XEN) [<000000000021d864>] alloc_xenheap_pages+0x6c/0x194 (LR)
> (XEN) [<0000000000229e90>] xmalloc_tlsf.c#xmalloc_pool_get+0x1c/0x28
> (XEN) [<000000000022a270>] xmem_pool_alloc+0x21c/0x448
> (XEN) [<000000000022a8dc>] _xmalloc+0x8c/0x290
> (XEN) [<000000000026b57c>] request_irq+0x40/0xb8
> (XEN) [<0000000000272780>] init_timer_interrupt+0x74/0xcc
> (XEN) [<000000000027212c>] start_secondary+0x1b4/0x238
> (XEN) [<0000000084000200>] 0000000084000200
> (XEN)
> (XEN)
> (XEN) ****************************************
> (XEN) Panic on CPU 4:
> (XEN) Assertion '!in_irq() && (local_irq_is_enabled() ||
> num_online_cpus() <= 1)' failed at common/page_alloc.c:2212
> (XEN) ****************************************
> 
> on systems without a big enough pool for xmalloc() to cater the
> requested size.

Can you explain in the commit message, why this is OK to move the code 
after enabling interrupts?

> 
> Reported-by: Wei Chen <Wei.Chen@arm.com>
> Suggested-by: Julien Grall <jgrall@amazon.com>
> Signed-off-by: Henry Wang <Henry.Wang@arm.com>
> Change-Id: Iebdde81f52785b0c6e037c981ff68922db016d08
> ---
>   xen/arch/arm/smpboot.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
> index 7bfd0a73a7..a057e85ac1 100644
> --- a/xen/arch/arm/smpboot.c
> +++ b/xen/arch/arm/smpboot.c
> @@ -361,9 +361,6 @@ void start_secondary(void)
>   
>       init_secondary_IRQ();
>   
> -    init_maintenance_interrupt();
> -    init_timer_interrupt();
> -
>       set_current(idle_vcpu[cpuid]);
>   
>       setup_cpu_sibling_map(cpuid);
> @@ -380,6 +377,10 @@ void start_secondary(void)
>       cpumask_set_cpu(cpuid, &cpu_online_map);
>   
>       local_irq_enable();
> +
> +    init_maintenance_interrupt();
> +    init_timer_interrupt();
> +
>       local_abort_enable();
>   
>       check_local_cpu_errata();

Cheers,

-- 
Julien Grall

