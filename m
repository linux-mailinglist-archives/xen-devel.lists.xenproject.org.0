Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B54E441E5AC
	for <lists+xen-devel@lfdr.de>; Fri,  1 Oct 2021 03:14:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.200359.354864 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mW789-0006DC-1e; Fri, 01 Oct 2021 01:14:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 200359.354864; Fri, 01 Oct 2021 01:14:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mW788-0006BO-Ux; Fri, 01 Oct 2021 01:14:28 +0000
Received: by outflank-mailman (input) for mailman id 200359;
 Fri, 01 Oct 2021 01:14:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cSXX=OV=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mW787-0006BD-0a
 for xen-devel@lists.xenproject.org; Fri, 01 Oct 2021 01:14:27 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dda81101-ccd0-4ccb-a91a-2979da8fd426;
 Fri, 01 Oct 2021 01:14:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D64F1611C1;
 Fri,  1 Oct 2021 01:14:24 +0000 (UTC)
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
X-Inumbo-ID: dda81101-ccd0-4ccb-a91a-2979da8fd426
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633050865;
	bh=0bahfwyBvoWRAssg3uo2NSnESAJF5lSFaD5tiCAaUmc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Zy+RR4x/Oi6DTLp2RUFNmsay78WjDRgzWtxBrorCOlaEQW324QN0iAeJL4YXqKaCz
	 tj1fllcRx2EMV/hV6gR9HrzVNXZsC7bPO0PqL9tNBgQl+uSN7W4w7bL0dnlZ55MkEP
	 So/DqhTaGXTcxh9VRuXpwgWQsQRo7atgPnSFLXE7D4ZVyIKFVLFy1bJHEQz5EKKGFC
	 DTEP/Hl78vFiaXDnmFWJeYCyMx2kD42xkzv8ljj2/4W1gEx4+fJ0J5slF0cFM17Kr8
	 GOSJYh4HoMHVziY5sLk0PclMtjWvMf0izbJhRXWI2LqtaCpiIowMdO0x4D5lb1BAHb
	 bwnnISO7/GltQ==
Date: Thu, 30 Sep 2021 18:14:24 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Oleksandr Andrushchenko <andr2000@gmail.com>
cc: xen-devel@lists.xenproject.org, julien@xen.org, sstabellini@kernel.org, 
    oleksandr_tyshchenko@epam.com, volodymyr_babchuk@epam.com, 
    Artem_Mygaiev@epam.com, roger.pau@citrix.com, bertrand.marquis@arm.com, 
    rahul.singh@arm.com, 
    Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: Re: [PATCH v3 11/11] xen/arm: Process pending vPCI map/unmap
 operations
In-Reply-To: <20210930071326.857390-12-andr2000@gmail.com>
Message-ID: <alpine.DEB.2.21.2109301814170.3209@sstabellini-ThinkPad-T480s>
References: <20210930071326.857390-1-andr2000@gmail.com> <20210930071326.857390-12-andr2000@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 30 Sep 2021, Oleksandr Andrushchenko wrote:
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

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Since v2:
>  - update commit message with more insight on x86, IOREQ and Arm
>  - restored order of invocation for IOREQ and vPCI processing (Jan)
> Since v1:
>  - Moved the check for pending vpci work from the common IOREQ code
>    to hvm_do_resume on x86
>  - Re-worked the code for Arm to ensure we don't miss pending vPCI work
> ---
>  xen/arch/arm/traps.c   | 13 +++++++++++++
>  xen/arch/x86/hvm/hvm.c |  6 ++++++
>  xen/common/ioreq.c     |  9 ---------
>  3 files changed, 19 insertions(+), 9 deletions(-)
> 
> diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
> index 219ab3c3fbde..b246f51086e3 100644
> --- a/xen/arch/arm/traps.c
> +++ b/xen/arch/arm/traps.c
> @@ -34,6 +34,7 @@
>  #include <xen/symbols.h>
>  #include <xen/version.h>
>  #include <xen/virtual_region.h>
> +#include <xen/vpci.h>
>  
>  #include <public/sched.h>
>  #include <public/xen.h>
> @@ -2304,6 +2305,18 @@ static bool check_for_vcpu_work(void)
>      }
>  #endif
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
>      if ( likely(!v->arch.need_flush_to_ram) )
>          return false;
>  
> diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
> index 7b48a1b925bb..38bf697c5b04 100644
> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -546,6 +546,12 @@ void hvm_do_resume(struct vcpu *v)
>  
>      pt_restore_timer(v);
>  
> +    if ( has_vpci(v->domain) && vpci_process_pending(v) )
> +    {
> +        raise_softirq(SCHEDULE_SOFTIRQ);
> +        return;
> +    }
> +
>      if ( !vcpu_ioreq_handle_completion(v) )
>          return;
>  
> diff --git a/xen/common/ioreq.c b/xen/common/ioreq.c
> index d732dc045df9..689d256544c8 100644
> --- a/xen/common/ioreq.c
> +++ b/xen/common/ioreq.c
> @@ -25,9 +25,7 @@
>  #include <xen/lib.h>
>  #include <xen/paging.h>
>  #include <xen/sched.h>
> -#include <xen/softirq.h>
>  #include <xen/trace.h>
> -#include <xen/vpci.h>
>  
>  #include <asm/guest_atomics.h>
>  #include <asm/ioreq.h>
> @@ -212,19 +210,12 @@ static bool wait_for_io(struct ioreq_vcpu *sv, ioreq_t *p)
>  
>  bool vcpu_ioreq_handle_completion(struct vcpu *v)
>  {
> -    struct domain *d = v->domain;
>      struct vcpu_io *vio = &v->io;
>      struct ioreq_server *s;
>      struct ioreq_vcpu *sv;
>      enum vio_completion completion;
>      bool res = true;
>  
> -    if ( has_vpci(d) && vpci_process_pending(v) )
> -    {
> -        raise_softirq(SCHEDULE_SOFTIRQ);
> -        return false;
> -    }
> -
>      while ( (sv = get_pending_vcpu(v, &s)) != NULL )
>          if ( !wait_for_io(sv, get_ioreq(s, v)) )
>              return false;
> -- 
> 2.25.1
> 

