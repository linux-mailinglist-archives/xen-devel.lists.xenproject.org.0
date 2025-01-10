Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5870A0949D
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jan 2025 16:03:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.869773.1281240 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWGXN-0001Yc-Do; Fri, 10 Jan 2025 15:03:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 869773.1281240; Fri, 10 Jan 2025 15:03:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWGXN-0001Wp-BB; Fri, 10 Jan 2025 15:03:01 +0000
Received: by outflank-mailman (input) for mailman id 869773;
 Fri, 10 Jan 2025 15:02:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J0bo=UC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tWGXL-0001Rg-4t
 for xen-devel@lists.xenproject.org; Fri, 10 Jan 2025 15:02:59 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fa751def-cf63-11ef-a0df-8be0dac302b0;
 Fri, 10 Jan 2025 16:02:58 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-aa67ac42819so314547766b.0
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jan 2025 07:02:58 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab2e8c753fdsm46555266b.184.2025.01.10.07.02.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2025 07:02:56 -0800 (PST)
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
X-Inumbo-ID: fa751def-cf63-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1736521378; x=1737126178; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YqYdDANoSBsS1PjsOKiER1zG2JvS6sj37w22hFPqJfA=;
        b=ipNV7uGz+3vH5MFFAjtuoy/oxfWGGJDKMJ+awuuZ0Xtr7V9xQ25H0CGZJpUyAg/AbX
         Zv8ulboEbp+VCOXbl1UqpKE6KooiyJMsbQl4TFds2wEHq0JdQelgYW8wlN7PNyfz4HUF
         txHtTI09IcAMpxN7/UZm2wO6DKyggK79xKGbE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736521378; x=1737126178;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YqYdDANoSBsS1PjsOKiER1zG2JvS6sj37w22hFPqJfA=;
        b=R6Il8m25chtBM9oeDlwET2YkvkQ+vSDMZguddR+IPK2X60l6YNp6bTbw7hXmXpbqMl
         pugQnWehnLetsyMWFaCVLGK7JfLH81mbxAA7xnStd/Tu6nkl7av2NQ8pzWt/1BjGVJTG
         jZtmnX+nm696uHS9EIgIDlsiile1TxuzqRoj12cKEEUNmKNlxwzPIQrTSLorcwcVWP9d
         K8pOD5y3TmUyA7hPQzgUkgEKJdnhecjz9KPnSyRGvSOhyfrc7ZMq2KpWF3k7ZIy8HCDu
         KVNtHrDSBC8hTUacnAlEo/wlH9Cg+n3EdC4Gj6K81/ssOXB8eXvWhbz7EfdvLCCIImXp
         kzVg==
X-Gm-Message-State: AOJu0YxkhTcn+bNK7xgF5Qul7GgM+NAelHwUpPTqZXZYjowGvQA4NeIb
	geXiD1cIvblmyRkGarvq1C2kHf5hmlNirAtx7TtYSpD/5zBnVvpZOryQFw8y1mk=
X-Gm-Gg: ASbGnct566Yn8NRz3kUyiMyA3MtuVQb+qW8XyTBsOMuhShP0u2Scywo+lx6o6haxUgf
	k29QLnJOAztDX0ZivDLCNHYVVPMbnPVPMS1dYIzsQmfiQ/cuDRF/heaMR8gj7dhegPclcv87XcI
	XSPosnd3o+1RdtL8VOTj/x60A8QtI1SpvJicX+zHHdm8964Opnm6PFEJ7XpeIpiGUtw0qkCbxBk
	+P0+nXQSNappXDsWjbCaGUcpDd5eseMYS56FKV7R3SGbklnLB4Ad70vzsGBZlMaeoM=
X-Google-Smtp-Source: AGHT+IFx6zocR1K8MNQTFTs4PoaU068CTCKcQ2hg8ez/pyhmkoyjZ0XB4u19AMgEISrlB37nmd5sAw==
X-Received: by 2002:a17:907:70c:b0:aa6:9176:61ed with SMTP id a640c23a62f3a-ab2abc6d42emr1035266666b.48.1736521377393;
        Fri, 10 Jan 2025 07:02:57 -0800 (PST)
Date: Fri, 10 Jan 2025 16:02:54 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 15/18] x86/mm: introduce a per-vCPU mapcache when
 using ASI
Message-ID: <Z4E2nhxxIKO8sWoz@macbook.local>
References: <20250108142659.99490-1-roger.pau@citrix.com>
 <20250108142659.99490-16-roger.pau@citrix.com>
 <D6XMXUBHE5UI.16YI6AVTYXNUM@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <D6XMXUBHE5UI.16YI6AVTYXNUM@cloud.com>

On Thu, Jan 09, 2025 at 03:08:15PM +0000, Alejandro Vallejo wrote:
> On Wed Jan 8, 2025 at 2:26 PM GMT, Roger Pau Monne wrote:
> > When using a unique per-vCPU root page table the per-domain region becomes
> > per-vCPU, and hence the mapcache is no longer shared between all vCPUs of a
> > domain.  Introduce per-vCPU mapcache structures, and modify map_domain_page()
> > to create per-vCPU mappings when possible.  Note the lock is also not needed
> > with using per-vCPU map caches, as the structure is no longer shared.
> >
> > This introduces some duplication in the domain and vcpu structures, as both
> > contain a mapcache field to support running with and without per-vCPU
> > page-tables.
> >
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> >  xen/arch/x86/domain_page.c        | 90 ++++++++++++++++++++-----------
> >  xen/arch/x86/include/asm/domain.h | 20 ++++---
> >  2 files changed, 71 insertions(+), 39 deletions(-)
> >
> > diff --git a/xen/arch/x86/domain_page.c b/xen/arch/x86/domain_page.c
> > index 1372be20224e..65900d6218f8 100644
> > --- a/xen/arch/x86/domain_page.c
> > +++ b/xen/arch/x86/domain_page.c
> > @@ -74,7 +74,9 @@ void *map_domain_page(mfn_t mfn)
> >      struct vcpu *v;
> >      struct mapcache_domain *dcache;
> >      struct mapcache_vcpu *vcache;
> > +    struct mapcache *cache;
> >      struct vcpu_maphash_entry *hashent;
> > +    struct domain *d;
> >  
> >  #ifdef NDEBUG
> >      if ( mfn_x(mfn) <= PFN_DOWN(__pa(HYPERVISOR_VIRT_END - 1)) )
> > @@ -85,9 +87,12 @@ void *map_domain_page(mfn_t mfn)
> >      if ( !v || !is_pv_vcpu(v) )
> >          return mfn_to_virt(mfn_x(mfn));
> >  
> > -    dcache = &v->domain->arch.pv.mapcache;
> > +    d = v->domain;
> > +    dcache = &d->arch.pv.mapcache;
> >      vcache = &v->arch.pv.mapcache;
> > -    if ( !dcache->inuse )
> > +    cache = d->arch.vcpu_pt ? &v->arch.pv.mapcache.cache
> > +                            : &d->arch.pv.mapcache.cache;
> > +    if ( !cache->inuse )
> >          return mfn_to_virt(mfn_x(mfn));
> >  
> >      perfc_incr(map_domain_page_count);
> > @@ -98,17 +103,18 @@ void *map_domain_page(mfn_t mfn)
> >      if ( hashent->mfn == mfn_x(mfn) )
> >      {
> >          idx = hashent->idx;
> > -        ASSERT(idx < dcache->entries);
> > +        ASSERT(idx < cache->entries);
> >          hashent->refcnt++;
> >          ASSERT(hashent->refcnt);
> >          ASSERT(mfn_eq(l1e_get_mfn(MAPCACHE_L1ENT(idx)), mfn));
> >          goto out;
> >      }
> >  
> > -    spin_lock(&dcache->lock);
> > +    if ( !d->arch.vcpu_pt )
> > +        spin_lock(&dcache->lock);
> 
> Hmmm. I wonder whether we might not want a nospec here...

Not sure TBH, we have other instances of conditional locking that
doesn't use nospec().  That said I'm not claiming those are correct.
Shouldn't people that care about this kind of speculation into
critical regions just use CONFIG_SPECULATIVE_HARDEN_LOCK?

Thanks, Roger.

