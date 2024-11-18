Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D4919D17A4
	for <lists+xen-devel@lfdr.de>; Mon, 18 Nov 2024 19:09:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.839454.1255252 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tD6BQ-0000Ku-8d; Mon, 18 Nov 2024 18:09:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 839454.1255252; Mon, 18 Nov 2024 18:09:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tD6BQ-0000IU-5P; Mon, 18 Nov 2024 18:09:08 +0000
Received: by outflank-mailman (input) for mailman id 839454;
 Mon, 18 Nov 2024 18:09:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mIWu=SN=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tD6BO-0000IO-Og
 for xen-devel@lists.xenproject.org; Mon, 18 Nov 2024 18:09:06 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2fe13414-a5d8-11ef-99a3-01e77a169b0f;
 Mon, 18 Nov 2024 19:09:00 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a99f646ff1bso697182066b.2
 for <xen-devel@lists.xenproject.org>; Mon, 18 Nov 2024 10:09:00 -0800 (PST)
Received: from localhost ([185.25.67.249]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa20e081574sm565347366b.179.2024.11.18.10.08.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Nov 2024 10:08:59 -0800 (PST)
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
X-Inumbo-ID: 2fe13414-a5d8-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzYiLCJoZWxvIjoibWFpbC1lajEteDYzNi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjJmZTEzNDE0LWE1ZDgtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxOTUzMzQwLjgyNTg0MSwic2VuZGVyIjoiYWxlamFuZHJvLnZhbGxlam9AY2xvdWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1731953340; x=1732558140; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=05U+eHEv06g5QU7+ytyEww0kKOfOL8ykdgGZyS7ohgA=;
        b=L8oS35DB6UNzNZhiQBESh2sqVQlWEjaFhvtyMOpF5Z91JHfWXjC4XFECJYYtPJSyKt
         WWatYKCdWbPeeYHpUyTgR6lGKxiZvGC3xOg8e87UM3qOp1QYwL3/7CzSNkkJv1fu9PQL
         WV5uVDzK3gdaAKiNMehErAT51D6uLFXDW5tyc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731953340; x=1732558140;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=05U+eHEv06g5QU7+ytyEww0kKOfOL8ykdgGZyS7ohgA=;
        b=vXKPGkqdkdz0E26e3vwsyO2Z5deocg4y2iVwlvEcczmikYBRae7ManprRVtcfJWRLn
         bUwrE0UIYkHYghEbob8FFpjWEjXzyD7X/6p2sBTb8+y8MJItBSyOFy1EJSv4SQa/ZMF2
         7N4juK5syOyDvn+gIdBCgBqq6NcsG2zNM9+PWERJLLor/Ex7kepKckQ7AIcYAIlZU6dM
         xyCTV6R0/9ON1cTRZ1QM+8sx8YgWgino0YiQQp3LGGTrsmfTP2fyL0SI1mJuGRjm6NsO
         y0XSjDA8dppyvS6DLAgk0GTy1kL+d36HCxB/Fbs9ZynKadtfyMQ5d6ly2TgT8bf3Fc7f
         4ViA==
X-Forwarded-Encrypted: i=1; AJvYcCX6Dp5/FwMOrZXXiHZcYtu5eTjHXQuUSrdJdTsA8AwVKeaVDnt4xDf+W6l1ccEtRkB3IsFwNEo+EqE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwI/KbBd1rBjnBeTRsh4Ehcf2w9uSIsnq+JX9HsaTcc85iQcP9U
	mDQ9QxYj6FTeeAhQObKqenkXNc7Wr+96PlvUhBslEkq+CrPTgTUncMxwvo75HRQ=
X-Google-Smtp-Source: AGHT+IGq553ck/1IjnuXT6F0sh4qyDfnL7daw5ef/fz40NKLY3yQgFHAJBYtw6ZvjfEiECfUBRXm/A==
X-Received: by 2002:a17:906:da84:b0:a99:403e:2578 with SMTP id a640c23a62f3a-aa4833e9196mr1365041366b.5.1731953340221;
        Mon, 18 Nov 2024 10:09:00 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 18 Nov 2024 18:08:57 +0000
Message-Id: <D5PI7VAO3Y1Z.AMHQW0VS2CBI@cloud.com>
Cc: <julien@xen.org>, <pdurrant@amazon.com>, <dwmw@amazon.com>, "Hongyan
 Xia" <hongyxia@amazon.com>, "Julien Grall" <jgrall@amazon.com>
Subject: Re: [PATCH V4 07/15] x86/domain_page: Remove the fast paths when
 mfn is not in the directmap
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Elias El Yandouzi" <eliasely@amazon.com>,
 <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.18.2
References: <20241111131148.52568-1-eliasely@amazon.com>
 <20241111131148.52568-8-eliasely@amazon.com>
In-Reply-To: <20241111131148.52568-8-eliasely@amazon.com>

I'm still headscratching about various things, but the build errors are on
release builds without pmap enabled. I'm highlighted them here.

On Mon Nov 11, 2024 at 1:11 PM GMT, Elias El Yandouzi wrote:
> From: Hongyan Xia <hongyxia@amazon.com>
>
> When mfn is not in direct map, never use mfn_to_virt for any mappings.
>
> We replace mfn_x(mfn) <=3D PFN_DOWN(__pa(HYPERVISOR_VIRT_END - 1)) with
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
>     Changes in v4:
>         * Introduce helper functions virt_is_fixmap and virt_in_fixmap_ra=
nge
>
>     Changes since Hongyan's version:
>         * arch_mfn_in_direct_map() was renamed to arch_mfns_in_directmap(=
)
>         * add a special case for the PMAP in domain_page_map_to_mfn()
>
> diff --git a/xen/arch/x86/domain_page.c b/xen/arch/x86/domain_page.c
> index 55e337aaf703..df7d4750ef05 100644
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
> =20
>  static DEFINE_PER_CPU(struct vcpu *, override);
> @@ -24,6 +26,7 @@ static inline struct vcpu *mapcache_current_vcpu(void)
>  {
>      /* In the common case we use the mapcache of the running VCPU. */
>      struct vcpu *v =3D this_cpu(override) ?: current;
> +    struct vcpu *idle_v =3D idle_vcpu[smp_processor_id()];
> =20
>      /*
>       * When current isn't properly set up yet, this is equivalent to
> @@ -35,10 +38,11 @@ static inline struct vcpu *mapcache_current_vcpu(void=
)
>      /*
>       * When using efi runtime page tables, we have the equivalent of the=
 idle
>       * domain's page tables but current may point at another domain's VC=
PU.
> -     * Return NULL as though current is not properly set up yet.
> +     * Return the idle domains's vcpu on that core because the efi per-d=
omain
> +     * region (where the mapcache is) is in-sync with the idle domain.
>       */
>      if ( efi_rs_using_pgtables() )
> -        return NULL;
> +        return idle_v;
> =20
>      /*
>       * If guest_table is NULL, and we are running a paravirtualised gues=
t,
> @@ -48,7 +52,7 @@ static inline struct vcpu *mapcache_current_vcpu(void)
>      if ( unlikely(pagetable_is_null(v->arch.guest_table)) && is_pv_vcpu(=
v) )
>      {
>          /* If we really are idling, perform lazy context switch now. */
> -        if ( (v =3D idle_vcpu[smp_processor_id()]) =3D=3D current )
> +        if ( (v =3D idle_v) =3D=3D current )
>              sync_local_execstate();
>          /* We must now be running on the idle page table. */
>          ASSERT(cr3_pa(read_cr3()) =3D=3D __pa(idle_pg_table));
> @@ -77,18 +81,24 @@ void *map_domain_page(mfn_t mfn)
>      struct vcpu_maphash_entry *hashent;
> =20
>  #ifdef NDEBUG
> -    if ( mfn_x(mfn) <=3D PFN_DOWN(__pa(HYPERVISOR_VIRT_END - 1)) )
> +    if ( arch_mfns_in_directmap(mfn_x(mfn), 1) )
>          return mfn_to_virt(mfn_x(mfn));
>  #endif
> =20
>      v =3D mapcache_current_vcpu();
> -    if ( !v )
> -        return mfn_to_virt(mfn_x(mfn));
> +    if ( !v || !v->domain->arch.mapcache.inuse )
> +    {
> +        if ( arch_mfns_in_directmap(mfn_x(mfn), 1) )
> +            return mfn_to_virt(mfn_x(mfn));
> +        else
> +        {
> +            BUG_ON(system_state >=3D SYS_STATE_smp_boot);

Missing CONFIG_HAS_PMAP guards around this return. Without it this wants to
BUG(), I think. I'm not entirely convinced the current logic takes into acc=
ount
the extended directmap present in HVM and idle vCPUs though.

arch_mfns_in_directmap() merely checks they fit in DIRECTMAP_SIZE, doesn't =
it?

> +            return pmap_map(mfn);
> +        }
> +    }
> =20
>      dcache =3D &v->domain->arch.mapcache;
>      vcache =3D &v->arch.mapcache;
> -    if ( !dcache->inuse )
> -        return mfn_to_virt(mfn_x(mfn));
> =20
>      perfc_incr(map_domain_page_count);
> =20
> @@ -184,6 +194,12 @@ void unmap_domain_page(const void *ptr)
>      if ( !va || va >=3D DIRECTMAP_VIRT_START )
>          return;
> =20
> +    if ( virt_is_fixmap(va) )
> +    {
> +        pmap_unmap(ptr);
> +        return;
> +    }
> +

This hunk is also missing CONFIG_HAS_PMAP guards.

>      ASSERT(va >=3D MAPCACHE_VIRT_START && va < MAPCACHE_VIRT_END);
> =20
>      v =3D mapcache_current_vcpu();
> @@ -237,7 +253,7 @@ int mapcache_domain_init(struct domain *d)
>      unsigned int bitmap_pages;
> =20
>  #ifdef NDEBUG
> -    if ( !mem_hotplug && max_page <=3D PFN_DOWN(__pa(HYPERVISOR_VIRT_END=
 - 1)) )
> +    if ( !mem_hotplug && arch_mfn_in_directmap(0, max_page) )

I suspect you wanted arch_mfns_in_directmap() rather than _mfn_

>          return 0;
>  #endif
> =20
> @@ -308,7 +324,7 @@ void *map_domain_page_global(mfn_t mfn)
>              local_irq_is_enabled()));
> =20
>  #ifdef NDEBUG
> -    if ( mfn_x(mfn) <=3D PFN_DOWN(__pa(HYPERVISOR_VIRT_END - 1)) )
> +    if ( arch_mfn_in_directmap(mfn_x(mfn, 1)) )

I suspect you wanted 's/mfn_x(mfn, 1)/mfn_x(mfn), 1/' instead?

>          return mfn_to_virt(mfn_x(mfn));
>  #endif
> =20
> @@ -335,6 +351,22 @@ mfn_t domain_page_map_to_mfn(const void *ptr)
>      if ( va >=3D DIRECTMAP_VIRT_START )
>          return _mfn(virt_to_mfn(ptr));
> =20
> +    /*
> +     * The fixmap is stealing the top-end of the VMAP. So the check for
> +     * the PMAP *must* happen first.
> +     *
> +     * Also, the fixmap translate a slot to an address backwards. The
> +     * logic will rely on it to avoid any complexity. So check at
> +     * compile time this will always hold.
> +    */
> +    BUILD_BUG_ON(fix_to_virt(FIX_PMAP_BEGIN) < fix_to_virt(FIX_PMAP_END)=
);
> +
> +    if ( virt_in_fixmap_range(va, FIX_PMAP_BEGIN, FIX_PMAP_END) )
> +    {
> +        BUG_ON(system_state >=3D SYS_STATE_smp_boot);
> +        return l1e_get_mfn(l1_fixmap[l1_table_offset(va)]);
> +    }
> +

This hunk should be surrounded by CONFIG_HAS_PMAP guards or it'll fail to
compile.

>      if ( va >=3D VMAP_VIRT_START && va < VMAP_VIRT_END )
>          return vmap_to_mfn(va);
> =20
> diff --git a/xen/arch/x86/include/asm/fixmap.h b/xen/arch/x86/include/asm=
/fixmap.h
> index 80b7b74fd816..381c95a8b11f 100644
> --- a/xen/arch/x86/include/asm/fixmap.h
> +++ b/xen/arch/x86/include/asm/fixmap.h
> @@ -101,6 +101,31 @@ static inline unsigned long virt_to_fix(const unsign=
ed long vaddr)
>      return __virt_to_fix(vaddr);
>  }
> =20
> +static inline bool virt_is_fixmap(const unsigned long vaddr)
> +{
> +    return vaddr >=3D FIXADDR_START && vaddr < FIXADDR_TOP;
> +}
> +
> +static inline bool virt_in_fixmap_range(
> +    const unsigned long vaddr,
> +    const unsigned int start_idx,
> +    const unsigned int end_idx
> +)
> +{
> +    unsigned long start_addr =3D (unsigned long)fix_to_virt(start_idx);
> +    unsigned long end_addr =3D (unsigned long)fix_to_virt(end_idx);
> +
> +    /*
> +     * The check ensures that the virtual address (vaddr) is within the
> +     * fixmap range. The addresses are allocated backwards, meaning the
> +     * start address is higher than the end address. As a result, the
> +     * check ensures that the virtual address is greater than or equal t=
o
> +     * the end address, and less than or equal to the start address, whi=
ch
> +     * may appear counterintuitive due to the reverse allocation order.
> +     */
> +    return ((vaddr & PAGE_MASK) <=3D start_addr) && (vaddr >=3D end_addr=
);
> +}
> +
>  enum fixed_addresses_x {
>      /* Index 0 is reserved since fix_x_to_virt(0) =3D=3D FIXADDR_X_TOP. =
*/
>      FIX_X_RESERVED,

Cheers,
Alejandro

