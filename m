Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC85A417F09
	for <lists+xen-devel@lfdr.de>; Sat, 25 Sep 2021 03:21:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.195773.348642 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTwN3-0004lX-Ei; Sat, 25 Sep 2021 01:20:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 195773.348642; Sat, 25 Sep 2021 01:20:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTwN3-0004j3-B3; Sat, 25 Sep 2021 01:20:53 +0000
Received: by outflank-mailman (input) for mailman id 195773;
 Sat, 25 Sep 2021 01:20:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ba80=OP=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mTwN1-0004iv-OY
 for xen-devel@lists.xenproject.org; Sat, 25 Sep 2021 01:20:51 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e753d7f2-4f2f-4fc8-8d66-7dc340e4fd90;
 Sat, 25 Sep 2021 01:20:50 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7F38260F41;
 Sat, 25 Sep 2021 01:20:49 +0000 (UTC)
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
X-Inumbo-ID: e753d7f2-4f2f-4fc8-8d66-7dc340e4fd90
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632532849;
	bh=KsxaLz/v5KTZhH/PmH9Oaxq7suytbzRWHf6TANu2sak=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=euZvsQVzwDkoOxTSzw48e762D/4UBW7JpziXpkTCX8VpxZkSSkQ28NGT+nCrX5bA5
	 +OT87RwWZ1YbmQahPp4/28le+3ejgrIEopoZni0YesU3iOkamkmfRC3ms5iDArOTo6
	 xj5uLZb8JMpGwbJHF4Ax8WHuEP9OlTOi/jaLwfwP9utXsNwGMvlpleA6y1dCQB1sgc
	 M879mLioWeZcrBPzrZykmTsgS4QkFKMPFf97iAqvDx0wIxH1fgEVD9R6/t4nkQhmqg
	 QwA85qwn8p+BOy3Om6ZQlEpFW04tcAQ1WGi2J/SL8zsf6Vb0dw0Bzy9nEq9UCYDIlQ
	 mHdbZa++/Lg9w==
Date: Fri, 24 Sep 2021 18:20:48 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Oleksandr Andrushchenko <andr2000@gmail.com>
cc: xen-devel@lists.xenproject.org, julien@xen.org, sstabellini@kernel.org, 
    oleksandr_tyshchenko@epam.com, volodymyr_babchuk@epam.com, 
    Artem_Mygaiev@epam.com, roger.pau@citrix.com, bertrand.marquis@arm.com, 
    rahul.singh@arm.com, 
    Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, 
    jbeulich@suse.com, andrew.cooper3@citrix.com
Subject: Re: [PATCH v2 11/11] xen/arm: Process pending vPCI map/unmap
 operations
In-Reply-To: <20210923125438.234162-12-andr2000@gmail.com>
Message-ID: <alpine.DEB.2.21.2109241816370.17979@sstabellini-ThinkPad-T480s>
References: <20210923125438.234162-1-andr2000@gmail.com> <20210923125438.234162-12-andr2000@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

+ x86 maintainers

On Thu, 23 Sep 2021, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> vPCI may map and unmap PCI device memory (BARs) being passed through which
> may take a lot of time. For this those operations may be deferred to be
> performed later, so that they can be safely preempted.
> Run the corresponding vPCI code while switching a vCPU.
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

From an ARM point of view, I think the code change is OK.

Only one note: it would be good to add to the commit message a short
list of relevant TODOs which in particular affect this patch.

Something like:

Please be aware that there are a few outstanding TODOs affecting this
code path, see xen/drivers/vpci/header.c:map_range and
xen/drivers/vpci/header.c:vpci_process_pending.


> ---
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
> index 7b48a1b925bb..d32f5d572941 100644
> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -549,6 +549,12 @@ void hvm_do_resume(struct vcpu *v)
>      if ( !vcpu_ioreq_handle_completion(v) )
>          return;
>  
> +    if ( has_vpci(v->domain) && vpci_process_pending(v) )
> +    {
> +        raise_softirq(SCHEDULE_SOFTIRQ);
> +        return;
> +    }
> +
>      if ( unlikely(v->arch.vm_event) )
>          hvm_vm_event_do_resume(v);
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

