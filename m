Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9FB21F7199
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2020 03:10:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjYDP-0004i6-Sc; Fri, 12 Jun 2020 01:10:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wpuV=7Z=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jjYDO-0004i0-DH
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2020 01:10:38 +0000
X-Inumbo-ID: 8676779a-ac49-11ea-bb8b-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8676779a-ac49-11ea-bb8b-bc764e2007e4;
 Fri, 12 Jun 2020 01:10:38 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3ACA020878;
 Fri, 12 Jun 2020 01:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591924237;
 bh=n6hU2K/5uQFfgCcm/g3/2mm3MX9HhuqIPRYefrZl9iE=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=n1PlB6+Sm9020NaQduzsMRwQpF2TZTclba8m6SVB416ThkMTg1Z63wgrjZ6XotJvU
 i2draRe4vSL7hHi26rJFwax0JCGeiLv5uUBSE0A7G132aNb52IOzdKmVHdHNiRvhpP
 hi0m/TWGLnj/WWDcmn6ANffHbeya0aftF+k1scdU=
Date: Thu, 11 Jun 2020 18:10:36 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [PATCH 2/2] xen/arm: Support runstate crossing pages
In-Reply-To: <b4843bd234d4ece4f843bc636071106746abb3b5.1591806713.git.bertrand.marquis@arm.com>
Message-ID: <alpine.DEB.2.21.2006111117310.2815@sstabellini-ThinkPad-T480s>
References: <cover.1591806713.git.bertrand.marquis@arm.com>
 <b4843bd234d4ece4f843bc636071106746abb3b5.1591806713.git.bertrand.marquis@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org, nd@arm.com, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, 11 Jun 2020, Bertrand Marquis wrote:
> Add support for runstate area register with the structure crossing pages
> The code is storing up to 2 pages reference during the hypercall.
> During a context switch, the code is computing where the
> state_entry_time is and is breaking the memcpy in 2 parts when it is
> required.
> 
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>

Clearly a lot of efforts went into this patch, thanks you Bertrand.

The change is complex for the feature it adds. I wonder if we could use
ioremap (or maybe something similar but using a different virtual space)
to simplify it. Julien, do you have good ideas?

Otherwise I don't think there is much we can do to make this patch
simpler.

As ugly as it is (sorry Bertrand, it is not your fault!) the patch looks
correct.


> ---
>  xen/arch/arm/domain.c        | 101 +++++++++++++++++++++++++----------
>  xen/include/asm-arm/domain.h |   5 +-
>  2 files changed, 76 insertions(+), 30 deletions(-)
> 
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index 739059234f..d847cb00f2 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -280,11 +280,16 @@ void arch_cleanup_runstate_guest(struct vcpu *v)
>  {
>      spin_lock(&v->arch.runstate_guest.lock);
>  
> -    /* cleanup previous page if any */
> -    if ( v->arch.runstate_guest.page )
> +    /* cleanup previous pages if any */
> +    if ( v->arch.runstate_guest.page[0] )
>      {
> -        put_page_and_type(v->arch.runstate_guest.page);
> -        v->arch.runstate_guest.page = NULL;
> +        put_page_and_type(v->arch.runstate_guest.page[0]);
> +        v->arch.runstate_guest.page[0] = NULL;
> +        if ( v->arch.runstate_guest.page[1] )
> +        {
> +            put_page_and_type(v->arch.runstate_guest.page[1]);
> +            v->arch.runstate_guest.page[1] = NULL;
> +        }
>          v->arch.runstate_guest.offset = 0;
>      }
>  
> @@ -294,26 +299,25 @@ void arch_cleanup_runstate_guest(struct vcpu *v)
>  int arch_setup_runstate_guest(struct vcpu *v,
>                              struct vcpu_register_runstate_memory_area area)
>  {
> -    struct page_info *page;
> +    struct page_info *page[2] = {NULL,NULL};
>      unsigned offset;
>  
>      spin_lock(&v->arch.runstate_guest.lock);
>  
> -    /* cleanup previous page if any */
> -    if ( v->arch.runstate_guest.page )
> +    /* cleanup previous pages if any */
> +    if ( v->arch.runstate_guest.page[0] )
>      {
> -        put_page_and_type(v->arch.runstate_guest.page);
> -        v->arch.runstate_guest.page = NULL;
> +        put_page_and_type(v->arch.runstate_guest.page[0]);
> +        v->arch.runstate_guest.page[0] = NULL;
> +        if ( v->arch.runstate_guest.page[1] )
> +        {
> +            put_page_and_type(v->arch.runstate_guest.page[1]);
> +            v->arch.runstate_guest.page[1] = NULL;
> +        }
>          v->arch.runstate_guest.offset = 0;
>      }
>  
>      offset = ((vaddr_t)area.addr.v) & ~PAGE_MASK;
> -    if ( offset > (PAGE_SIZE - sizeof(struct vcpu_runstate_info)) )
> -    {
> -        spin_unlock(&v->arch.runstate_guest.lock);
> -        gprintk(XENLOG_DEBUG, "Runstate is crossing pages\n");
> -        return -EINVAL;
> -    }
>  
>      /* provided address must be aligned to a 64bit */
>      if ( offset % alignof(struct vcpu_runstate_info) )
> @@ -323,15 +327,30 @@ int arch_setup_runstate_guest(struct vcpu *v,
>          return -EINVAL;
>      }
>  
> -    page = get_page_from_gva(v, (vaddr_t)area.addr.v, GV2M_WRITE);
> -    if ( !page )
> +    page[0] = get_page_from_gva(v, (vaddr_t)area.addr.v, GV2M_WRITE);
> +    if ( !page[0] )
>      {
>          spin_unlock(&v->arch.runstate_guest.lock);
>          gprintk(XENLOG_DEBUG, "Runstate pointer is not mapped\n");
>          return -EINVAL;
>      }
>  
> -    v->arch.runstate_guest.page = page;
> +    if ( offset > (PAGE_SIZE - sizeof(struct vcpu_runstate_info)) )
> +    {
> +        /* guest area is crossing pages */
> +        page[1] = get_page_from_gva(v, (vaddr_t)area.addr.v + PAGE_SIZE,
> +                                        GV2M_WRITE);
> +        if ( !page[1] )
> +        {
> +            put_page_and_type(v->arch.runstate_guest.page[0]);
> +            spin_unlock(&v->arch.runstate_guest.lock);
> +            gprintk(XENLOG_DEBUG, "Runstate pointer is not fully mapped\n");
> +            return -EINVAL;
> +        }
> +    }
> +
> +    v->arch.runstate_guest.page[0] = page[0];
> +    v->arch.runstate_guest.page[1] = page[1];
>      v->arch.runstate_guest.offset = offset;
>  
>      spin_unlock(&v->arch.runstate_guest.lock);
> @@ -343,34 +362,60 @@ int arch_setup_runstate_guest(struct vcpu *v,
>  /* Update per-VCPU guest runstate shared memory area (if registered). */
>  static void update_runstate_area(struct vcpu *v)
>  {
> -    struct vcpu_runstate_info *guest_runstate;
> -    void *p;
> +    void *p[2];
> +    unsigned offset, time_offset;
> +    uint64_t *state_entry_time;
>  
>      spin_lock(&v->arch.runstate_guest.lock);
>  
> -    if ( v->arch.runstate_guest.page )
> +    if ( v->arch.runstate_guest.page[0] )
>      {
> -        p = __map_domain_page(v->arch.runstate_guest.page);
> -        guest_runstate = p + v->arch.runstate_guest.offset;
> +        p[0] = __map_domain_page(v->arch.runstate_guest.page[0]);
> +        if ( v->arch.runstate_guest.page[1] )
> +            p[1] = __map_domain_page(v->arch.runstate_guest.page[1]);
> +        else
> +            p[1] = NULL;
> +        offset = v->arch.runstate_guest.offset;
>  
>          if ( VM_ASSIST(v->domain, runstate_update_flag) )
>          {
> +            time_offset = offset +
> +                    offsetof(struct vcpu_runstate_info, state_entry_time);
> +
> +            if ( time_offset < PAGE_SIZE )
> +                state_entry_time = p[0] + time_offset;
> +            else
> +                state_entry_time = p[1] + (time_offset - PAGE_SIZE);
> +
>              v->runstate.state_entry_time |= XEN_RUNSTATE_UPDATE;
> -            guest_runstate->state_entry_time |= XEN_RUNSTATE_UPDATE;
> +            *state_entry_time |= XEN_RUNSTATE_UPDATE;
>              smp_wmb();
>          }
> +        else
> +            state_entry_time = NULL;
> +
> +        if ( p[1] )
> +        {
> +            memcpy(p[0] + offset, &v->runstate, PAGE_SIZE - offset);
> +            memcpy(p[1], &v->runstate + (PAGE_SIZE - offset),
> +                    sizeof(v->runstate) - (PAGE_SIZE - offset));
> +        }
> +        else
> +            memcpy(p[0] + offset, &v->runstate, sizeof(v->runstate));
>  
> -        memcpy(guest_runstate, &v->runstate, sizeof(v->runstate));
> +        /* copy must be done before switching the bit */
>          smp_wmb();
>  
> -        if ( VM_ASSIST(v->domain, runstate_update_flag) )
> +        if ( state_entry_time )
>          {
>              v->runstate.state_entry_time &= ~XEN_RUNSTATE_UPDATE;
> -            guest_runstate->state_entry_time &= ~XEN_RUNSTATE_UPDATE;
> +            *state_entry_time &= ~XEN_RUNSTATE_UPDATE;
>              smp_wmb();
>          }
>  
> -        unmap_domain_page(p);
> +        unmap_domain_page(p[0]);
> +        if ( p[1] )
> +            unmap_domain_page(p[1]);
>      }
>  
>      spin_unlock(&v->arch.runstate_guest.lock);
> diff --git a/xen/include/asm-arm/domain.h b/xen/include/asm-arm/domain.h
> index 3a7f53e13d..61e32f1ed5 100644
> --- a/xen/include/asm-arm/domain.h
> +++ b/xen/include/asm-arm/domain.h
> @@ -209,8 +209,9 @@ struct arch_vcpu
>  
>      /* runstate guest info */
>      struct {
> -        struct page_info *page;  /* guest page */
> -        unsigned         offset; /* offset in page */
> +        /* we need 2 pages in case the guest area is crossing pages */
> +        struct page_info *page[2];  /* guest pages */
> +        unsigned         offset; /* offset in first page */
>          spinlock_t       lock;   /* lock to access page */
>      } runstate_guest;

