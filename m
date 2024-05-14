Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B4348C5411
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2024 13:49:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721432.1124825 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6qeG-0001Sm-Bn; Tue, 14 May 2024 11:48:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721432.1124825; Tue, 14 May 2024 11:48:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6qeG-0001Q8-8p; Tue, 14 May 2024 11:48:48 +0000
Received: by outflank-mailman (input) for mailman id 721432;
 Tue, 14 May 2024 11:48:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PE3g=MR=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s6qeE-0001Q0-RQ
 for xen-devel@lists.xenproject.org; Tue, 14 May 2024 11:48:46 +0000
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com
 [2607:f8b0:4864:20::82e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ea52c0b6-11e7-11ef-b4bb-af5377834399;
 Tue, 14 May 2024 13:48:44 +0200 (CEST)
Received: by mail-qt1-x82e.google.com with SMTP id
 d75a77b69052e-43dfcbc4893so23429181cf.2
 for <xen-devel@lists.xenproject.org>; Tue, 14 May 2024 04:48:44 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-43df54d6afasm67604621cf.24.2024.05.14.04.48.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 May 2024 04:48:42 -0700 (PDT)
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
X-Inumbo-ID: ea52c0b6-11e7-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715687323; x=1716292123; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Pdda6HZ6WUFsRUqYthgzkS5mAoIrF4iyAT4V8GimXJ8=;
        b=QJi3dQXcoKTQVB+kQgW0/sbYA56CeQz3SwoiQqBXGtUmBlaWIGd4fq8ukCgcWideh5
         +GCGAHcHw7Ba2zxixeA9jSKGq8HUAyTZa2OQYAKD+8s77S6J561H5+/p4ihdrSzkPr59
         6c0neaTSuZFVzDOieuqIRPX32TLX9zNtJJXAY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715687323; x=1716292123;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pdda6HZ6WUFsRUqYthgzkS5mAoIrF4iyAT4V8GimXJ8=;
        b=KsUci26449NXizvOqHOxtTb2PGvWLDIUKpU5EQokcF8WM1nYJQZigYOQaafU55BSjA
         eqscp7dJgJi86MZGrynG0QYWu/j6PUdn9F3qTdlGb2GhMWuSvkVKPReF0Bzy0Yot903C
         xKy7xYWrxS1bpS/gt1/GoXa4y+AOnv9FKsgQMO32ehYMgZpI6We9VnIlddtaJzesbFp1
         e3b7pRpi8GT4EsXwtvrEwbe/gPxzg7WPz1tEKGpzkDEvzhkFlG1/FxAJfcXYa6MOQCci
         o5JyzeZWQXYnwwNxWNjcgKMWPT7l5hYskkw5NcnZ3i8zUfxsDCMLluVXOHbJWKUJG+dx
         +oNA==
X-Gm-Message-State: AOJu0Ywp5G126v1NF7PQW636OQIo2M3HH+iw8eppSaDNvLeDZQTdy9Sr
	HfxzZYz7OVhiaHBate9iVS3dFKPyVQCGfj8Kd66jPGfvVelHo2xVqribpAo4AFA=
X-Google-Smtp-Source: AGHT+IHMTLnsnmlLZMOjjuADMCd7cRwgAl3+97UqinJIqCLyTWFWB8ihTWVY1x/atOEhmyXBZVlJfw==
X-Received: by 2002:a05:622a:8b:b0:43a:dd9f:7aa8 with SMTP id d75a77b69052e-43dfdb1ea7bmr135540141cf.9.1715687323231;
        Tue, 14 May 2024 04:48:43 -0700 (PDT)
Date: Tue, 14 May 2024 13:48:40 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Elias El Yandouzi <eliasely@amazon.com>
Cc: xen-devel@lists.xenproject.org, julien@xen.org, pdurrant@amazon.com,
	dwmw@amazon.com, Hongyan Xia <hongyxia@amazon.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <jgrall@amazon.com>
Subject: Re: [PATCH V3 (resend) 09/19] x86/domain_page: Remove the fast paths
 when mfn is not in the directmap
Message-ID: <ZkNPmARt2EgLCBwk@macbook>
References: <20240513134046.82605-1-eliasely@amazon.com>
 <20240513134046.82605-10-eliasely@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240513134046.82605-10-eliasely@amazon.com>

On Mon, May 13, 2024 at 01:40:36PM +0000, Elias El Yandouzi wrote:
> From: Hongyan Xia <hongyxia@amazon.com>
> 
> When mfn is not in direct map, never use mfn_to_virt for any mappings.
> 
> We replace mfn_x(mfn) <= PFN_DOWN(__pa(HYPERVISOR_VIRT_END - 1)) with
> arch_mfns_in_direct_map(mfn, 1) because these two are equivalent. The
> extra comparison in arch_mfns_in_direct_map() looks different but because
> DIRECTMAP_VIRT_END is always higher, it does not make any difference.
> 
> Lastly, domain_page_map_to_mfn() needs to gain to a special case for
> the PMAP.
> 
> Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> ----
> 
>     Changes since Hongyan's version:
>         * arch_mfn_in_direct_map() was renamed to arch_mfns_in_directmap()
>         * add a special case for the PMAP in domain_page_map_to_mfn()
> 
> diff --git a/xen/arch/x86/domain_page.c b/xen/arch/x86/domain_page.c
> index 55e337aaf7..89caefc8a2 100644
> --- a/xen/arch/x86/domain_page.c
> +++ b/xen/arch/x86/domain_page.c
> @@ -14,8 +14,10 @@
>  #include <xen/sched.h>
>  #include <xen/vmap.h>
>  #include <asm/current.h>
> +#include <asm/fixmap.h>
>  #include <asm/flushtlb.h>
>  #include <asm/hardirq.h>
> +#include <asm/pmap.h>
>  #include <asm/setup.h>
>  
>  static DEFINE_PER_CPU(struct vcpu *, override);
> @@ -35,10 +37,11 @@ static inline struct vcpu *mapcache_current_vcpu(void)
>      /*
>       * When using efi runtime page tables, we have the equivalent of the idle
>       * domain's page tables but current may point at another domain's VCPU.
> -     * Return NULL as though current is not properly set up yet.
> +     * Return the idle domains's vcpu on that core because the efi per-domain
> +     * region (where the mapcache is) is in-sync with the idle domain.
>       */
>      if ( efi_rs_using_pgtables() )
> -        return NULL;
> +        return idle_vcpu[smp_processor_id()];

There's already an existing instance of idle_vcpu[smp_processor_id()]
down in the function, it might make sense to put this in a local
variable.

>  
>      /*
>       * If guest_table is NULL, and we are running a paravirtualised guest,
> @@ -77,18 +80,24 @@ void *map_domain_page(mfn_t mfn)
>      struct vcpu_maphash_entry *hashent;
>  
>  #ifdef NDEBUG
> -    if ( mfn_x(mfn) <= PFN_DOWN(__pa(HYPERVISOR_VIRT_END - 1)) )
> +    if ( arch_mfns_in_directmap(mfn_x(mfn), 1) )
>          return mfn_to_virt(mfn_x(mfn));
>  #endif
>  
>      v = mapcache_current_vcpu();
> -    if ( !v )
> -        return mfn_to_virt(mfn_x(mfn));
> +    if ( !v || !v->domain->arch.mapcache.inuse )
> +    {
> +        if ( arch_mfns_in_directmap(mfn_x(mfn), 1) )
> +            return mfn_to_virt(mfn_x(mfn));
> +        else
> +        {
> +            BUG_ON(system_state >= SYS_STATE_smp_boot);
> +            return pmap_map(mfn);
> +        }
> +    }
>  
>      dcache = &v->domain->arch.mapcache;
>      vcache = &v->arch.mapcache;
> -    if ( !dcache->inuse )
> -        return mfn_to_virt(mfn_x(mfn));
>  
>      perfc_incr(map_domain_page_count);
>  
> @@ -184,6 +193,12 @@ void unmap_domain_page(const void *ptr)
>      if ( !va || va >= DIRECTMAP_VIRT_START )
>          return;
>  
> +    if ( va >= FIXADDR_START && va < FIXADDR_TOP )

This should be a fixmap helper IMO. virt_is_fixmap(addr) or similar.
There's already an existing instance in virt_to_fix().

> +    {
> +        pmap_unmap((void *)ptr);
> +        return;
> +    }
> +
>      ASSERT(va >= MAPCACHE_VIRT_START && va < MAPCACHE_VIRT_END);
>  
>      v = mapcache_current_vcpu();
> @@ -237,7 +252,7 @@ int mapcache_domain_init(struct domain *d)
>      unsigned int bitmap_pages;
>  
>  #ifdef NDEBUG
> -    if ( !mem_hotplug && max_page <= PFN_DOWN(__pa(HYPERVISOR_VIRT_END - 1)) )
> +    if ( !mem_hotplug && arch_mfn_in_directmap(0, max_page) )
>          return 0;
>  #endif
>  
> @@ -308,7 +323,7 @@ void *map_domain_page_global(mfn_t mfn)
>              local_irq_is_enabled()));
>  
>  #ifdef NDEBUG
> -    if ( mfn_x(mfn) <= PFN_DOWN(__pa(HYPERVISOR_VIRT_END - 1)) )
> +    if ( arch_mfn_in_directmap(mfn_x(mfn, 1)) )
>          return mfn_to_virt(mfn_x(mfn));
>  #endif
>  
> @@ -335,6 +350,23 @@ mfn_t domain_page_map_to_mfn(const void *ptr)
>      if ( va >= DIRECTMAP_VIRT_START )
>          return _mfn(virt_to_mfn(ptr));
>  
> +    /*
> +     * The fixmap is stealing the top-end of the VMAP. So the check for
> +     * the PMAP *must* happen first.
> +     *
> +     * Also, the fixmap translate a slot to an address backwards. The
> +     * logic will rely on it to avoid any complexity. So check at
> +     * compile time this will always hold.
> +    */
> +    BUILD_BUG_ON(fix_to_virt(FIX_PMAP_BEGIN) < fix_to_virt(FIX_PMAP_END));
> +
> +    if ( ((unsigned long)fix_to_virt(FIX_PMAP_END) <= va) &&
> +         ((va & PAGE_MASK) <= (unsigned long)fix_to_virt(FIX_PMAP_BEGIN)) )
> +    {

Can we place this as some kind of helper in fixmap.h?

It's already quite ugly, and could be useful in other places.

bool virt_in_fixmap_range(addr, start idx, end idx)

Or something similar.

Thanks, Roger.

