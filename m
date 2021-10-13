Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 114A342C4CE
	for <lists+xen-devel@lfdr.de>; Wed, 13 Oct 2021 17:31:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.208655.364863 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1magDG-0004it-BB; Wed, 13 Oct 2021 15:30:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 208655.364863; Wed, 13 Oct 2021 15:30:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1magDG-0004fu-7y; Wed, 13 Oct 2021 15:30:38 +0000
Received: by outflank-mailman (input) for mailman id 208655;
 Wed, 13 Oct 2021 15:30:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1magDE-0004fo-Me
 for xen-devel@lists.xenproject.org; Wed, 13 Oct 2021 15:30:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1magDD-0007uo-Pu; Wed, 13 Oct 2021 15:30:35 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.17.188]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1magDD-0002Lq-It; Wed, 13 Oct 2021 15:30:35 +0000
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
	bh=wfrUX3y0MWqfEcm8fsOYiMydNXVmNJpktqj374DVFf4=; b=KXv2+XvsfqUXRHBrem0jZ+JlZ4
	u7iENoBVd5hnbwYIfxAkCM8FuCSia9KFkqekKr0MM1BNA9OHLHiXh76KV0/WbW2B7wTmDToUNY1ec
	MpEEY7zIqmUX0jbfynzg0d9wdet3jsxtL2lWn93E2fyoyMEPHfJz8VMevWZb5nNJA5BE=;
Message-ID: <35cd8909-1d9b-842f-62e6-7544dcd3da4b@xen.org>
Date: Wed, 13 Oct 2021 16:30:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.0
Subject: Re: [PATCH v5 10/10] xen/arm: Process pending vPCI map/unmap
 operations
To: Oleksandr Andrushchenko <andr2000@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 volodymyr_babchuk@epam.com, Artem_Mygaiev@epam.com, roger.pau@citrix.com,
 jbeulich@suse.com, andrew.cooper3@citrix.com, george.dunlap@citrix.com,
 paul@xen.org, bertrand.marquis@arm.com, rahul.singh@arm.com,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
References: <20211008055535.337436-1-andr2000@gmail.com>
 <20211008055535.337436-11-andr2000@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20211008055535.337436-11-andr2000@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Oleksandr,

On 08/10/2021 06:55, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> vPCI may map and unmap PCI device memory (BARs) being passed through which
> may take a lot of time. For this those operations may be deferred to be
> performed later, so that they can be safely preempted.
> 
> Currently this deferred processing is happening in common IOREQ code
> which doesn't seem to be the right place for x86 and is even more
> doubtful because IOREQ may not be enabled for Arm at all.
> So, for Arm the pending vPCI work may have no chance to be executed
> if the processing is left as is in the common IOREQ code only.
> For that reason make vPCI processing happen in arch specific code.
> 
> Please be aware that there are a few outstanding TODOs affecting this
> code path, see xen/drivers/vpci/header.c:map_range and
> xen/drivers/vpci/header.c:vpci_process_pending.
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> [x86 changes]
> Acked-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> Reviewed-by: Rahul Singh <rahul.singh@arm.com>
> Tested-by: Rahul Singh <rahul.singh@arm.com>
> ---
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>
> Cc: Paul Durrant <paul@xen.org>
> 
> Since v2:
>   - update commit message with more insight on x86, IOREQ and Arm
>   - restored order of invocation for IOREQ and vPCI processing (Jan)
> Since v1:
>   - Moved the check for pending vpci work from the common IOREQ code
>     to hvm_do_resume on x86
>   - Re-worked the code for Arm to ensure we don't miss pending vPCI work
> ---
>   xen/arch/arm/traps.c   | 13 +++++++++++++
>   xen/arch/x86/hvm/hvm.c |  6 ++++++
>   xen/common/ioreq.c     |  9 ---------
>   3 files changed, 19 insertions(+), 9 deletions(-)
> 
> diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
> index 219ab3c3fbde..b246f51086e3 100644
> --- a/xen/arch/arm/traps.c
> +++ b/xen/arch/arm/traps.c
> @@ -34,6 +34,7 @@
>   #include <xen/symbols.h>
>   #include <xen/version.h>
>   #include <xen/virtual_region.h>
> +#include <xen/vpci.h>
>   
>   #include <public/sched.h>
>   #include <public/xen.h>
> @@ -2304,6 +2305,18 @@ static bool check_for_vcpu_work(void)
>       }
>   #endif
>   
> +    if ( has_vpci(v->domain) )
> +    {
> +        bool pending;
> +
> +        local_irq_enable();
> +        pending = vpci_process_pending(v);
> +        local_irq_disable();
> +
> +        if ( pending )
> +            return true;
> +    }
> +

I would prefer if this addition is moved before the 
vcpu_ioreq__handle_completion(v). This is to avoid differences with the 
x86 version.

>       if ( likely(!v->arch.need_flush_to_ram) )
>           return false;
>   
> diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
> index aa418a3ca1b7..c491242e4b8b 100644
> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -546,6 +546,12 @@ void hvm_do_resume(struct vcpu *v)
>   
>       pt_restore_timer(v);
>   
> +    if ( has_vpci(v->domain) && vpci_process_pending(v) )
> +    {
> +        raise_softirq(SCHEDULE_SOFTIRQ);
> +        return;
> +    }
> +
>       if ( !vcpu_ioreq_handle_completion(v) )
>           return;
>   
> diff --git a/xen/common/ioreq.c b/xen/common/ioreq.c
> index d732dc045df9..689d256544c8 100644
> --- a/xen/common/ioreq.c
> +++ b/xen/common/ioreq.c
> @@ -25,9 +25,7 @@
>   #include <xen/lib.h>
>   #include <xen/paging.h>
>   #include <xen/sched.h>
> -#include <xen/softirq.h>
>   #include <xen/trace.h>
> -#include <xen/vpci.h>
>   
>   #include <asm/guest_atomics.h>
>   #include <asm/ioreq.h>
> @@ -212,19 +210,12 @@ static bool wait_for_io(struct ioreq_vcpu *sv, ioreq_t *p)
>   
>   bool vcpu_ioreq_handle_completion(struct vcpu *v)
>   {
> -    struct domain *d = v->domain;
>       struct vcpu_io *vio = &v->io;
>       struct ioreq_server *s;
>       struct ioreq_vcpu *sv;
>       enum vio_completion completion;
>       bool res = true;
>   
> -    if ( has_vpci(d) && vpci_process_pending(v) )
> -    {
> -        raise_softirq(SCHEDULE_SOFTIRQ);
> -        return false;
> -    }
> -
>       while ( (sv = get_pending_vcpu(v, &s)) != NULL )
>           if ( !wait_for_io(sv, get_ioreq(s, v)) )
>               return false;
> 

Cheers,

-- 
Julien Grall

