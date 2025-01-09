Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD27CA07B35
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2025 16:08:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.868615.1280203 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVu8z-0000p0-Dp; Thu, 09 Jan 2025 15:08:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 868615.1280203; Thu, 09 Jan 2025 15:08:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVu8z-0000mY-Ab; Thu, 09 Jan 2025 15:08:21 +0000
Received: by outflank-mailman (input) for mailman id 868615;
 Thu, 09 Jan 2025 15:08:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bl7y=UB=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tVu8y-0000mS-5V
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2025 15:08:20 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8edc386b-ce9b-11ef-a0df-8be0dac302b0;
 Thu, 09 Jan 2025 16:08:18 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-385ef8b64b3so951523f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jan 2025 07:08:18 -0800 (PST)
Received: from localhost ([66.81.170.107]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e9d26a7bsm25020495e9.0.2025.01.09.07.08.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jan 2025 07:08:16 -0800 (PST)
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
X-Inumbo-ID: 8edc386b-ce9b-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1736435298; x=1737040098; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lpHS3CLRqwjBeCtRk1rXsfSsyI5n4Smr+9iJA/k0piE=;
        b=awLBixL1rQ1gKdijkld6kpmetayxie10UwpL3oTqoR7h0CrF/Z8iC1dhdwW9v9N+oW
         MSm0qg+YyK4FdWtxsY/x1LM+iv4MFJgCvM4JlZSUPVMzDjoX/DUA4wbri2WuZEJA0wxW
         6Kc9t4eASEhhKYfipxHX7dReJbsouCkyvP+7A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736435298; x=1737040098;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lpHS3CLRqwjBeCtRk1rXsfSsyI5n4Smr+9iJA/k0piE=;
        b=LzKHmTgqLLV3XI//w6yv5byFE0nmAtdzpXK6lVlCHStv4eV+eAUK8xA/0QSC8Zoh37
         qAJjVvqL8IwuL7I288+XGi/9K63pfohBNwqaVBCQHTgofrwqx/tF0+EJmVpjLRiuqXK8
         sYdJ+1t0xpl1cap0s7nTvKdb5ps68WYx3jbH3vgFyTmSIr7pmojl8c+heaME3T75/oZI
         mogjmDGN27G+rbCKExqsamGXaWJo6R9JvPDMqD0aWINXHySa8GfuYZoRdL5jANCo8Gly
         XmytCk8DBIDOrwWOe5l2+bZvcnsqteoM0PUwxehMrehBr6UjSC8etK8zps0+RD48JU6L
         ZyXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVbwhqsvshTr35Q9gWN7sI3QEs5+PTVcGWhrN4WA8SAxQI56Lx0Han3uOhS9Y3oTKi+ws46HkeO4k=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyiPT0+zayImSdeS3lS1ZkSw1RAKaXLkRoAuHkEoqTXCdnrw0+r
	usRUd6+zjtv0Db/7isUS/uqJa34pR7ZgoaaNqZOD0GILXqLIRtar9ud9ecoZNM4=
X-Gm-Gg: ASbGncvmCWtaafdRAjpizRyRlTrFTwJX2Q0hR1eSP2Hp9ZX5rkd59OrxZUeBfqk3r0A
	KXY3SYTMt+tQvlc3A9DUNMtB9zSCfKtatLBPnWntw6AJ9E82LoZ9i2SsOYGx417TuogUYsL9NRz
	viJ0ECXU+CFOI4xpmidCsRuPq9NU8C2EWZsc2n0uDJg+0C7cRUFxTMdtZbw3QOPBsZUfV2O2P/o
	bu/BPYRf+42NDdWegceOH+cLrdYuxfrU47jVrzwxjO3PnIYnGqpU8yYCWHSJWM=
X-Google-Smtp-Source: AGHT+IHEs/6HGlugKZTEblyFNdg7cteinAR3dM8ti0nLcb/Xles8JrF4da534DewHrWDgPaIjGvn/A==
X-Received: by 2002:a5d:6c64:0:b0:385:ec6e:e87a with SMTP id ffacd0b85a97d-38a8730fc40mr7290828f8f.43.1736435297195;
        Thu, 09 Jan 2025 07:08:17 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 09 Jan 2025 15:08:15 +0000
Message-Id: <D6XMXUBHE5UI.16YI6AVTYXNUM@cloud.com>
Cc: "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper"
 <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 15/18] x86/mm: introduce a per-vCPU mapcache when
 using ASI
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Roger Pau Monne" <roger.pau@citrix.com>,
 <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.18.2
References: <20250108142659.99490-1-roger.pau@citrix.com>
 <20250108142659.99490-16-roger.pau@citrix.com>
In-Reply-To: <20250108142659.99490-16-roger.pau@citrix.com>

On Wed Jan 8, 2025 at 2:26 PM GMT, Roger Pau Monne wrote:
> When using a unique per-vCPU root page table the per-domain region become=
s
> per-vCPU, and hence the mapcache is no longer shared between all vCPUs of=
 a
> domain.  Introduce per-vCPU mapcache structures, and modify map_domain_pa=
ge()
> to create per-vCPU mappings when possible.  Note the lock is also not nee=
ded
> with using per-vCPU map caches, as the structure is no longer shared.
>
> This introduces some duplication in the domain and vcpu structures, as bo=
th
> contain a mapcache field to support running with and without per-vCPU
> page-tables.
>
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> ---
>  xen/arch/x86/domain_page.c        | 90 ++++++++++++++++++++-----------
>  xen/arch/x86/include/asm/domain.h | 20 ++++---
>  2 files changed, 71 insertions(+), 39 deletions(-)
>
> diff --git a/xen/arch/x86/domain_page.c b/xen/arch/x86/domain_page.c
> index 1372be20224e..65900d6218f8 100644
> --- a/xen/arch/x86/domain_page.c
> +++ b/xen/arch/x86/domain_page.c
> @@ -74,7 +74,9 @@ void *map_domain_page(mfn_t mfn)
>      struct vcpu *v;
>      struct mapcache_domain *dcache;
>      struct mapcache_vcpu *vcache;
> +    struct mapcache *cache;
>      struct vcpu_maphash_entry *hashent;
> +    struct domain *d;
> =20
>  #ifdef NDEBUG
>      if ( mfn_x(mfn) <=3D PFN_DOWN(__pa(HYPERVISOR_VIRT_END - 1)) )
> @@ -85,9 +87,12 @@ void *map_domain_page(mfn_t mfn)
>      if ( !v || !is_pv_vcpu(v) )
>          return mfn_to_virt(mfn_x(mfn));
> =20
> -    dcache =3D &v->domain->arch.pv.mapcache;
> +    d =3D v->domain;
> +    dcache =3D &d->arch.pv.mapcache;
>      vcache =3D &v->arch.pv.mapcache;
> -    if ( !dcache->inuse )
> +    cache =3D d->arch.vcpu_pt ? &v->arch.pv.mapcache.cache
> +                            : &d->arch.pv.mapcache.cache;
> +    if ( !cache->inuse )
>          return mfn_to_virt(mfn_x(mfn));
> =20
>      perfc_incr(map_domain_page_count);
> @@ -98,17 +103,18 @@ void *map_domain_page(mfn_t mfn)
>      if ( hashent->mfn =3D=3D mfn_x(mfn) )
>      {
>          idx =3D hashent->idx;
> -        ASSERT(idx < dcache->entries);
> +        ASSERT(idx < cache->entries);
>          hashent->refcnt++;
>          ASSERT(hashent->refcnt);
>          ASSERT(mfn_eq(l1e_get_mfn(MAPCACHE_L1ENT(idx)), mfn));
>          goto out;
>      }
> =20
> -    spin_lock(&dcache->lock);
> +    if ( !d->arch.vcpu_pt )
> +        spin_lock(&dcache->lock);

Hmmm. I wonder whether we might not want a nospec here...

> =20
>      /* Has some other CPU caused a wrap? We must flush if so. */
> -    if ( unlikely(dcache->epoch !=3D vcache->shadow_epoch) )
> +    if ( unlikely(!d->arch.vcpu_pt && dcache->epoch !=3D vcache->shadow_=
epoch) )
>      {
>          vcache->shadow_epoch =3D dcache->epoch;
>          if ( NEED_FLUSH(this_cpu(tlbflush_time), dcache->tlbflush_timest=
amp) )
> @@ -118,21 +124,21 @@ void *map_domain_page(mfn_t mfn)
>          }
>      }
> =20
> -    idx =3D find_next_zero_bit(dcache->inuse, dcache->entries, dcache->c=
ursor);
> -    if ( unlikely(idx >=3D dcache->entries) )
> +    idx =3D find_next_zero_bit(cache->inuse, cache->entries, cache->curs=
or);
> +    if ( unlikely(idx >=3D cache->entries) )
>      {
>          unsigned long accum =3D 0, prev =3D 0;
> =20
>          /* /First/, clean the garbage map and update the inuse list. */
> -        for ( i =3D 0; i < BITS_TO_LONGS(dcache->entries); i++ )
> +        for ( i =3D 0; i < BITS_TO_LONGS(cache->entries); i++ )
>          {
>              accum |=3D prev;
> -            dcache->inuse[i] &=3D ~xchg(&dcache->garbage[i], 0);
> -            prev =3D ~dcache->inuse[i];
> +            cache->inuse[i] &=3D ~xchg(&cache->garbage[i], 0);
> +            prev =3D ~cache->inuse[i];
>          }
> =20
> -        if ( accum | (prev & BITMAP_LAST_WORD_MASK(dcache->entries)) )
> -            idx =3D find_first_zero_bit(dcache->inuse, dcache->entries);
> +        if ( accum | (prev & BITMAP_LAST_WORD_MASK(cache->entries)) )
> +            idx =3D find_first_zero_bit(cache->inuse, cache->entries);
>          else
>          {
>              /* Replace a hash entry instead. */
> @@ -152,19 +158,23 @@ void *map_domain_page(mfn_t mfn)
>                      i =3D 0;
>              } while ( i !=3D MAPHASH_HASHFN(mfn_x(mfn)) );
>          }
> -        BUG_ON(idx >=3D dcache->entries);
> +        BUG_ON(idx >=3D cache->entries);
> =20
>          /* /Second/, flush TLBs. */
>          perfc_incr(domain_page_tlb_flush);
>          flush_tlb_local();
> -        vcache->shadow_epoch =3D ++dcache->epoch;
> -        dcache->tlbflush_timestamp =3D tlbflush_current_time();
> +        if ( !d->arch.vcpu_pt )
> +        {
> +            vcache->shadow_epoch =3D ++dcache->epoch;
> +            dcache->tlbflush_timestamp =3D tlbflush_current_time();
> +        }
>      }
> =20
> -    set_bit(idx, dcache->inuse);
> -    dcache->cursor =3D idx + 1;
> +    set_bit(idx, cache->inuse);
> +    cache->cursor =3D idx + 1;
> =20
> -    spin_unlock(&dcache->lock);
> +    if ( !d->arch.vcpu_pt )
> +        spin_unlock(&dcache->lock);

... and here.

> =20
>      l1e_write(&MAPCACHE_L1ENT(idx), l1e_from_mfn(mfn, __PAGE_HYPERVISOR_=
RW));
> =20
> @@ -178,6 +188,7 @@ void unmap_domain_page(const void *ptr)
>      unsigned int idx;
>      struct vcpu *v;
>      struct mapcache_domain *dcache;
> +    struct mapcache *cache;
>      unsigned long va =3D (unsigned long)ptr, mfn, flags;
>      struct vcpu_maphash_entry *hashent;
> =20
> @@ -190,7 +201,9 @@ void unmap_domain_page(const void *ptr)
>      ASSERT(v && is_pv_vcpu(v));
> =20
>      dcache =3D &v->domain->arch.pv.mapcache;
> -    ASSERT(dcache->inuse);
> +    cache =3D v->domain->arch.vcpu_pt ? &v->arch.pv.mapcache.cache
> +                                    : &v->domain->arch.pv.mapcache.cache=
;
> +    ASSERT(cache->inuse);
> =20
>      idx =3D PFN_DOWN(va - MAPCACHE_VIRT_START);
>      mfn =3D l1e_get_pfn(MAPCACHE_L1ENT(idx));
> @@ -213,7 +226,7 @@ void unmap_domain_page(const void *ptr)
>                     hashent->mfn);
>              l1e_write(&MAPCACHE_L1ENT(hashent->idx), l1e_empty());
>              /* /Second/, mark as garbage. */
> -            set_bit(hashent->idx, dcache->garbage);
> +            set_bit(hashent->idx, cache->garbage);
>          }
> =20
>          /* Add newly-freed mapping to the maphash. */
> @@ -225,7 +238,7 @@ void unmap_domain_page(const void *ptr)
>          /* /First/, zap the PTE. */
>          l1e_write(&MAPCACHE_L1ENT(idx), l1e_empty());
>          /* /Second/, mark as garbage. */
> -        set_bit(idx, dcache->garbage);
> +        set_bit(idx, cache->garbage);
>      }
> =20
>      local_irq_restore(flags);
> @@ -234,7 +247,6 @@ void unmap_domain_page(const void *ptr)
>  void mapcache_domain_init(struct domain *d)
>  {
>      struct mapcache_domain *dcache =3D &d->arch.pv.mapcache;
> -    unsigned int bitmap_pages;
> =20
>      ASSERT(is_pv_domain(d));
> =20
> @@ -243,13 +255,12 @@ void mapcache_domain_init(struct domain *d)
>          return;
>  #endif
> =20
> +    if ( d->arch.vcpu_pt )
> +        return;
> +
>      BUILD_BUG_ON(MAPCACHE_VIRT_END + PAGE_SIZE * (3 +
>                   2 * PFN_UP(BITS_TO_LONGS(MAPCACHE_ENTRIES) * sizeof(lon=
g))) >
>                   MAPCACHE_VIRT_START + (PERDOMAIN_SLOT_MBYTES << 20));
> -    bitmap_pages =3D PFN_UP(BITS_TO_LONGS(MAPCACHE_ENTRIES) * sizeof(lon=
g));
> -    dcache->inuse =3D (void *)MAPCACHE_VIRT_END + PAGE_SIZE;
> -    dcache->garbage =3D dcache->inuse +
> -                      (bitmap_pages + 1) * PAGE_SIZE / sizeof(long);
> =20
>      spin_lock_init(&dcache->lock);
>  }
> @@ -258,30 +269,45 @@ int mapcache_vcpu_init(struct vcpu *v)
>  {
>      struct domain *d =3D v->domain;
>      struct mapcache_domain *dcache =3D &d->arch.pv.mapcache;
> +    struct mapcache *cache;
>      unsigned long i;
> -    unsigned int ents =3D d->max_vcpus * MAPCACHE_VCPU_ENTRIES;
> +    unsigned int ents =3D (d->arch.vcpu_pt ? 1 : d->max_vcpus) *
> +                        MAPCACHE_VCPU_ENTRIES;
>      unsigned int nr =3D PFN_UP(BITS_TO_LONGS(ents) * sizeof(long));
> =20
> -    if ( !is_pv_vcpu(v) || !dcache->inuse )
> +    if ( !is_pv_vcpu(v) )
>          return 0;
> =20
> -    if ( ents > dcache->entries )
> +    cache =3D d->arch.vcpu_pt ? &v->arch.pv.mapcache.cache
> +                            : &dcache->cache;
> +
> +    if ( !cache->inuse )
> +        return 0;
> +
> +    if ( ents > cache->entries )
>      {
>          /* Populate page tables. */
>          int rc =3D create_perdomain_mapping(v, MAPCACHE_VIRT_START, ents=
, false);
> +        const unsigned int bitmap_pages =3D
> +            PFN_UP(BITS_TO_LONGS(MAPCACHE_ENTRIES) * sizeof(long));
> +
> +        cache->inuse =3D (void *)MAPCACHE_VIRT_END + PAGE_SIZE;
> +        cache->garbage =3D cache->inuse +
> +                         (bitmap_pages + 1) * PAGE_SIZE / sizeof(long);
> +
> =20
>          /* Populate bit maps. */
>          if ( !rc )
> -            rc =3D create_perdomain_mapping(v, (unsigned long)dcache->in=
use,
> +            rc =3D create_perdomain_mapping(v, (unsigned long)cache->inu=
se,
>                                            nr, true);
>          if ( !rc )
> -            rc =3D create_perdomain_mapping(v, (unsigned long)dcache->ga=
rbage,
> +            rc =3D create_perdomain_mapping(v, (unsigned long)cache->gar=
bage,
>                                            nr, true);
> =20
>          if ( rc )
>              return rc;
> =20
> -        dcache->entries =3D ents;
> +        cache->entries =3D ents;
>      }
> =20
>      /* Mark all maphash entries as not in use. */

Cheers,
Alejandro

