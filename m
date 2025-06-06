Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE61ACFDD5
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jun 2025 09:57:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1008063.1387282 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNRww-0008FL-Tw; Fri, 06 Jun 2025 07:57:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1008063.1387282; Fri, 06 Jun 2025 07:57:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNRww-0008Di-RB; Fri, 06 Jun 2025 07:57:14 +0000
Received: by outflank-mailman (input) for mailman id 1008063;
 Fri, 06 Jun 2025 07:57:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DWpK=YV=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uNRwv-0008Da-VD
 for xen-devel@lists.xenproject.org; Fri, 06 Jun 2025 07:57:14 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dac4d464-42ab-11f0-a301-13f23c93f187;
 Fri, 06 Jun 2025 09:57:12 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3a510432236so1401273f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 06 Jun 2025 00:57:12 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a5324364c9sm1135469f8f.51.2025.06.06.00.57.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jun 2025 00:57:11 -0700 (PDT)
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
X-Inumbo-ID: dac4d464-42ab-11f0-a301-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1749196632; x=1749801432; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=x2qGQxHKxE0fltri3e56FljztxCxBXPQkvQrP4WGYKs=;
        b=SZfKFELz36g2N+eqobgaGmNJ+pSXTNleH4gQv2nKee3I7UiuXEVFp3vPTXdS4wuMEQ
         qQ8uxtxmHkpXYPgcJzwaUCpszwKeYAohX5glgx2i1wMKN8dmaaUpC1pV1D0HslToi+f6
         ZCrbRblx8X2sUAWHbXWtrgNzVQXlp+EI+Wvz0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749196632; x=1749801432;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x2qGQxHKxE0fltri3e56FljztxCxBXPQkvQrP4WGYKs=;
        b=NoCe2z0ncyL4NdgzOAHZTVVm3gFaq1dG/NXFRkWNA0kJgiznkKYn5INTQsTONHYBKJ
         DZLAfBRUS9IY32dc7ssfqgVKmHOom2Liy5UTstY/Hwhpccpgs+zHnguzvIGronIUrPtn
         33yfoL1rsRSdcUjKLidQFbTD96rH2CsIdt/I13bvDzf4CZeTaJTVrZ0FqmAG281WoGBD
         fEChK1fNPU5ggnrIEpguNgfkk3LFs4Do/lTEdVvIp8+E44bTxUsGIDyh78bmyHDRttHw
         owM/xo4rCEcw+vx8uEe0lUsxEUPLnwo3Fz975moWNQ6JKn11iSCFok6iiJyd+WnYbGm/
         tzSQ==
X-Gm-Message-State: AOJu0YxjlAedfxith8OmDa4402YlgxUW2xQf1MJhmN89IU+8+NxRia04
	bhPcjCt6gWLe94H1g3jFcxTKcCxMdZYU80+mwej9+eNN47nKZ+boZFbjqL0t3FK8R2w=
X-Gm-Gg: ASbGncvK9pASvjOzK+FMEazLcOdxe9n8H4aEwTEwQvhQ3P/OWR2RMUOw+htoXhc4JX6
	KkkqLVTj5hrGCihswZUCJ5k/e7dQvaf3U+UGXKpo+6Mzn2IiKDUVXzbnZQafMBjSJl46EllKiAn
	HfM5udQSzA8od8SW1SBwaKXQYxiELoX2HiwbTj+lpiPJtGVPuTaQnVn0nAw41cx/ayX4OpNZEeF
	9Edvp9mS/6nIEOD6rmkeTeV3/oSeDvIvq4h9wsn4WVHa/Hfgskus3hleiBOnmQC2aic6tHxEG8m
	i2wBilt2ZWrdcHGjqiEYVTkSFwIT55N06JAemgC0GZshSFIFoUBc8RgkQxrpdI7y2mBGRwwK6Nb
	XdVgn+xYVOmuV4Z5OwMdfku0Ymv55Xg==
X-Google-Smtp-Source: AGHT+IHQQHdAd5H92gMabdzfVxPQznKlbBnOg55WUIqgbYGdQ/KfGkqEFKOpZHpwxTUp7tnJLBF2rg==
X-Received: by 2002:a05:6000:250e:b0:3a5:2670:e220 with SMTP id ffacd0b85a97d-3a531cb01b7mr1892342f8f.32.1749196632070;
        Fri, 06 Jun 2025 00:57:12 -0700 (PDT)
Date: Fri, 6 Jun 2025 09:57:10 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: xen-devel@lists.xenproject.org,
	Bernhard Kaindl <bernhard.kaindl@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: [PATCH 04/11] xen: Add node argument to
 domain_{adjust_tot_pages,set_outstanding_pages}()
Message-ID: <aEKfVuoc4psv0ijg@macbook.local>
References: <20250314172502.53498-1-alejandro.vallejo@cloud.com>
 <20250314172502.53498-5-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250314172502.53498-5-alejandro.vallejo@cloud.com>

On Fri, Mar 14, 2025 at 05:24:55PM +0000, Alejandro Vallejo wrote:
> domain_adjust_tot_pages() decreases the outstanding claims of a domain
> as pages are allocated, so that'll need to take into account the node in
> which an allocation is done. Deallocations just pass NUMA_NO_NODE.
> 
> domain_set_outstanding_pages() takes the node on which to to stake an
> exact-node claim, or NUMA_NO_NODE if it's a non-exact claim.
> 
> Not a functional change, as neither function uses the arguments for
> anything yet. It's a prerequisite to simplify for the following patch
> that introduces per-node claim counts.
> 
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> ---
>  xen/arch/x86/mm.c             |  3 ++-
>  xen/arch/x86/mm/mem_sharing.c |  4 ++--
>  xen/common/domain.c           |  2 +-
>  xen/common/grant_table.c      |  4 ++--
>  xen/common/memory.c           |  6 ++++--
>  xen/common/page_alloc.c       | 17 ++++++++++++-----
>  xen/include/xen/mm.h          |  6 ++++--
>  7 files changed, 27 insertions(+), 15 deletions(-)
> 
> diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
> index bfdc8fb01949..89f87d013099 100644
> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -4458,7 +4458,8 @@ int steal_page(
>      page_list_del(page, &d->page_list);
>  
>      /* Unlink from original owner. */
> -    if ( !(memflags & MEMF_no_refcount) && !domain_adjust_tot_pages(d, -1) )
> +    if ( !(memflags & MEMF_no_refcount) &&
> +         !domain_adjust_tot_pages(d, NUMA_NO_NODE, -1) )
>          drop_dom_ref = true;
>  
>      nrspin_unlock(&d->page_alloc_lock);
> diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sharing.c
> index da28266ef076..2551c0d86e80 100644
> --- a/xen/arch/x86/mm/mem_sharing.c
> +++ b/xen/arch/x86/mm/mem_sharing.c
> @@ -720,7 +720,7 @@ static int page_make_sharable(struct domain *d,
>      if ( !validate_only )
>      {
>          page_set_owner(page, dom_cow);
> -        drop_dom_ref = !domain_adjust_tot_pages(d, -1);
> +        drop_dom_ref = !domain_adjust_tot_pages(d, NUMA_NO_NODE, -1);
>          page_list_del(page, &d->page_list);
>      }
>  
> @@ -766,7 +766,7 @@ static int page_make_private(struct domain *d, struct page_info *page)
>      ASSERT(page_get_owner(page) == dom_cow);
>      page_set_owner(page, d);
>  
> -    if ( domain_adjust_tot_pages(d, 1) == 1 )
> +    if ( domain_adjust_tot_pages(d, page_to_nid(page), 1) == 1 )
>          get_knownalive_domain(d);
>      page_list_add_tail(page, &d->page_list);
>      nrspin_unlock(&d->page_alloc_lock);
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index 585fd726a941..72d8d62bc1e8 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -1205,7 +1205,7 @@ int domain_kill(struct domain *d)
>          rspin_barrier(&d->domain_lock);
>          argo_destroy(d);
>          vnuma_destroy(d->vnuma);
> -        domain_set_outstanding_pages(d, 0);
> +        domain_set_outstanding_pages(d, NUMA_NO_NODE, 0);
>          /* fallthrough */
>      case DOMDYING_dying:
>          rc = domain_teardown(d);
> diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
> index 6c77867f8cdd..d8c5321185c6 100644
> --- a/xen/common/grant_table.c
> +++ b/xen/common/grant_table.c
> @@ -2403,7 +2403,7 @@ gnttab_transfer(
>          }
>  
>          /* Okay, add the page to 'e'. */
> -        if ( unlikely(domain_adjust_tot_pages(e, 1) == 1) )
> +        if ( unlikely(domain_adjust_tot_pages(e, page_to_nid(page), 1) == 1) )
>              get_knownalive_domain(e);
>  
>          /*
> @@ -2429,7 +2429,7 @@ gnttab_transfer(
>               * page in the page total
>               */
>              nrspin_lock(&e->page_alloc_lock);
> -            drop_dom_ref = !domain_adjust_tot_pages(e, -1);
> +            drop_dom_ref = !domain_adjust_tot_pages(e, NUMA_NO_NODE, -1);
>              nrspin_unlock(&e->page_alloc_lock);
>  
>              if ( okay /* i.e. e->is_dying due to the surrounding if() */ )
> diff --git a/xen/common/memory.c b/xen/common/memory.c
> index 8ca4e1a8425b..1ab0bac4e7da 100644
> --- a/xen/common/memory.c
> +++ b/xen/common/memory.c
> @@ -773,7 +773,8 @@ static long memory_exchange(XEN_GUEST_HANDLE_PARAM(xen_memory_exchange_t) arg)
>  
>                  nrspin_lock(&d->page_alloc_lock);
>                  drop_dom_ref = (dec_count &&
> -                                !domain_adjust_tot_pages(d, -dec_count));
> +                                !domain_adjust_tot_pages(d, NUMA_NO_NODE,
> +                                -dec_count));

Nit: it would be best if dec_count is aligned with the parenthesis:

                                !domain_adjust_tot_pages(d, NUMA_NO_NODE,
                                                         -dec_count));

Thanks, Roger.

