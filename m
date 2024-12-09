Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 088719E9D36
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2024 18:42:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.851778.1265796 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKhls-0005no-Go; Mon, 09 Dec 2024 17:42:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 851778.1265796; Mon, 09 Dec 2024 17:42:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKhls-0005lo-DB; Mon, 09 Dec 2024 17:42:12 +0000
Received: by outflank-mailman (input) for mailman id 851778;
 Mon, 09 Dec 2024 17:42:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dNW1=TC=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tKhlr-0005li-6b
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2024 17:42:11 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e9e70dfd-b654-11ef-99a3-01e77a169b0f;
 Mon, 09 Dec 2024 18:42:09 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5d122cf8dd1so7582947a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 09 Dec 2024 09:42:09 -0800 (PST)
Received: from localhost ([217.156.233.154]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d3cf972f6dsm4800685a12.61.2024.12.09.09.42.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Dec 2024 09:42:07 -0800 (PST)
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
X-Inumbo-ID: e9e70dfd-b654-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1733766128; x=1734370928; darn=lists.xenproject.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sV0nsyX7vNkVSSafZpbxwKnujh7zQJgvV3AwYvXfYk8=;
        b=IK1cx1hnrneSudPGUHnWjRsz0hZKiwPS0lH2tBN3Q0V/b1KiPLiBPsZk9a0l04rQ2D
         I5H65UF/SBRCfE2UookpmB1JtwPfImh/RfNRihejA7aYpyTO66ec9XDmQfCVEWETJMgC
         IxMahf2OylNWoHaK9OaOsZNZkqGlyIaTHOBXI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733766128; x=1734370928;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sV0nsyX7vNkVSSafZpbxwKnujh7zQJgvV3AwYvXfYk8=;
        b=m7ZmmPFueF/JLzx/J/AIrTczprDZQR+9lpM/Yb4V/8dd7Dj191dg4cqUW4ZCmY6BJE
         otilgEAoLRWThagrPA2LbR5RlRdVpJ9qBxXGmPNyg1laxK86GipxjazTBTxnJUHEafcF
         Fa9hPOmvJPqoMzZpvJE/HkUKn/PrCgmaUUsCXWpD6E3ZToijv9Gp/FVQcLjP5QmR7js8
         tXsearEkKkk1CWZ9athGeL9Ouc+3r/4CuA88f9eZxvmcNXe9Xs7QxXqlTOOP/GT+GKpn
         sB52VkXTvZ4nwR1MPWfsKOHHjy/ZqTXe8fN/vTL/Qk8+ah7IDaU75bkoqXLGx7X+ZCaM
         igZA==
X-Forwarded-Encrypted: i=1; AJvYcCWtktXCqox7AN/6BjhPU3Ojk8KZ1ujJazhfPOzHpM5ZZ9qoMRqbM2TI9RuYiRg/oopbfONoZkx7ENM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwVJcGbvTbaTLLEk6KYG0F17UiuPdiqmB3ygy1fNzoxb3qo30kW
	wFnAFyusSBzgHzCu9XvEqeDyklaNmgZCLskNhHbg7I2KCEBGj5MXwI/GY69LDrM=
X-Gm-Gg: ASbGncvKzgZAI0GpnkKq7FJcE5lgzSGrod9suVXXS+8r5TGNfe5QZlGJuCtx//6Urzo
	z+hZ5aLazxZ0nbdgutig3L5vHEWTfiaIJ9rUTwzwnGpaE/ugoDjSfZ4ORbNT85W2e2MWEDu9CuO
	SUNfqNSAHiacghsIWpYMC6t/jQpWl3jPfUSj39Ar/qs1cBBuNUR6DvYZZzwGDZxypYgKa6qM9pY
	i/cpq2nfscRcYRRcQiXLIquL99zRiJZj+mjHoKCFgORHqRJj+hLZ3pJbhQ=
X-Google-Smtp-Source: AGHT+IF5hpIyBgq5/JEjJxGu/gxd9cGo73IjdSD6QZUN/lnxjOGyvV5Sh9hQwuBebEbdUYuhZ2RjPw==
X-Received: by 2002:a05:6402:3715:b0:5d0:ed71:3ce4 with SMTP id 4fb4d7f45d1cf-5d3be661883mr14529848a12.6.1733766128444;
        Mon, 09 Dec 2024 09:42:08 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Dec 2024 17:42:06 +0000
Message-Id: <D67CSQZBRZ0E.34J8KW00AIFI6@cloud.com>
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Elias El Yandouzi" <eliasely@amazon.com>,
 <xen-devel@lists.xenproject.org>
Cc: <julien@xen.org>, <pdurrant@amazon.com>, <dwmw@amazon.com>, "Hongyan
 Xia" <hongyxia@amazon.com>, "Julien Grall" <jgrall@amazon.com>
Subject: Re: [PATCH V4 03/15] x86/pv: Rewrite how building PV dom0 handles
 domheap mappings
X-Mailer: aerc 0.18.2
References: <20241111131148.52568-1-eliasely@amazon.com>
 <20241111131148.52568-4-eliasely@amazon.com>
In-Reply-To: <20241111131148.52568-4-eliasely@amazon.com>

Hi,

I've been trying to run this series for a while, but it crashes very
frequentyly starting from the patch that generalizes the mapcache. I think =
I've
tracked it down to this patch.

On Mon Nov 11, 2024 at 1:11 PM GMT, Elias El Yandouzi wrote:
> From: Hongyan Xia <hongyxia@amazon.com>
>
> Building a PV dom0 is allocating from the domheap but uses it like the
> xenheap. Use the pages as they should be.
>
> Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> Signed-off-by: Elias El Yandouzi <eliasely@amazon.com>
>
> ----
>     Changes in V4:
>         * Reduce the scope of l{1,2,4}start_mfn variables
>         * Make the macro `UNMAP_MAP_AND_ADVANCE` return the new virtual a=
ddress
>
>     Changes in V3:
>         * Fold following patch 'x86/pv: Map L4 page table for shim domain=
'
>
>     Changes in V2:
>         * Clarify the commit message
>         * Break the patch in two parts
>
>     Changes since Hongyan's version:
>         * Rebase
>         * Remove spurious newline
>
> diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
> index 18b7a3e4e025..b03df609cadb 100644
> --- a/xen/arch/x86/pv/dom0_build.c
> +++ b/xen/arch/x86/pv/dom0_build.c
> @@ -382,6 +382,7 @@ static int __init dom0_construct(struct domain *d,
>      l3_pgentry_t *l3tab =3D NULL, *l3start =3D NULL;
>      l2_pgentry_t *l2tab =3D NULL, *l2start =3D NULL;
>      l1_pgentry_t *l1tab =3D NULL, *l1start =3D NULL;
> +    mfn_t l3start_mfn =3D INVALID_MFN;
> =20
>      /*
>       * This fully describes the memory layout of the initial domain. All
> @@ -719,22 +720,34 @@ static int __init dom0_construct(struct domain *d,
>          v->arch.pv.event_callback_cs    =3D FLAT_COMPAT_KERNEL_CS;
>      }
> =20
> +#define UNMAP_MAP_AND_ADVANCE(mfn_var, virt_var, maddr) ({  \
> +    do {                                                    \
> +        unmap_domain_page(virt_var);                        \
> +        mfn_var =3D maddr_to_mfn(maddr);                      \
> +        maddr +=3D PAGE_SIZE;                                 \
> +        virt_var =3D map_domain_page(mfn_var);                \
> +    } while ( false );                                      \
> +    virt_var;                                               \
> +})
> +
>      if ( !compat )
>      {
> +        mfn_t l4start_mfn;
>          maddr_to_page(mpt_alloc)->u.inuse.type_info =3D PGT_l4_page_tabl=
e;
> -        l4start =3D l4tab =3D __va(mpt_alloc); mpt_alloc +=3D PAGE_SIZE;
> +        l4tab =3D UNMAP_MAP_AND_ADVANCE(l4start_mfn, l4start, mpt_alloc)=
;

In here l4start is mapped on the idle domain perdomain area, but...

>          clear_page(l4tab);
> -        init_xen_l4_slots(l4tab, _mfn(virt_to_mfn(l4start)),
> -                          d, INVALID_MFN, true);
> -        v->arch.guest_table =3D pagetable_from_paddr(__pa(l4start));
> +        init_xen_l4_slots(l4tab, l4start_mfn, d, INVALID_MFN, true);
> +        v->arch.guest_table =3D pagetable_from_mfn(l4start_mfn);
>      }
>      else
>      {
>          /* Monitor table already created by switch_compat(). */
> -        l4start =3D l4tab =3D __va(pagetable_get_paddr(v->arch.guest_tab=
le));
> +        mfn_t l4start_mfn =3D pagetable_get_mfn(v->arch.guest_table);
> +        l4start =3D l4tab =3D map_domain_page(l4start_mfn);
>          /* See public/xen.h on why the following is needed. */
>          maddr_to_page(mpt_alloc)->u.inuse.type_info =3D PGT_l3_page_tabl=
e;
>          l3start =3D __va(mpt_alloc); mpt_alloc +=3D PAGE_SIZE;
> +        UNMAP_MAP_AND_ADVANCE(l3start_mfn, l3start, mpt_alloc);
>      }
> =20
>      l4tab +=3D l4_table_offset(v_start);
> @@ -743,15 +756,17 @@ static int __init dom0_construct(struct domain *d,
>      {
>          if ( !((unsigned long)l1tab & (PAGE_SIZE-1)) )
>          {
> +            mfn_t l1start_mfn;
>              maddr_to_page(mpt_alloc)->u.inuse.type_info =3D PGT_l1_page_=
table;
> -            l1start =3D l1tab =3D __va(mpt_alloc); mpt_alloc +=3D PAGE_S=
IZE;
> +            l1tab =3D UNMAP_MAP_AND_ADVANCE(l1start_mfn, l1start, mpt_al=
loc);
>              clear_page(l1tab);
>              if ( count =3D=3D 0 )
>                  l1tab +=3D l1_table_offset(v_start);
>              if ( !((unsigned long)l2tab & (PAGE_SIZE-1)) )
>              {
> +                mfn_t l2start_mfn;
>                  maddr_to_page(mpt_alloc)->u.inuse.type_info =3D PGT_l2_p=
age_table;
> -                l2start =3D l2tab =3D __va(mpt_alloc); mpt_alloc +=3D PA=
GE_SIZE;
> +                l2tab =3D UNMAP_MAP_AND_ADVANCE(l2start_mfn, l2start, mp=
t_alloc);
>                  clear_page(l2tab);
>                  if ( count =3D=3D 0 )
>                      l2tab +=3D l2_table_offset(v_start);
> @@ -761,19 +776,19 @@ static int __init dom0_construct(struct domain *d,
>                      {
>                          maddr_to_page(mpt_alloc)->u.inuse.type_info =3D
>                              PGT_l3_page_table;
> -                        l3start =3D __va(mpt_alloc); mpt_alloc +=3D PAGE=
_SIZE;
> +                        UNMAP_MAP_AND_ADVANCE(l3start_mfn, l3start, mpt_=
alloc);
>                      }
>                      l3tab =3D l3start;
>                      clear_page(l3tab);
>                      if ( count =3D=3D 0 )
>                          l3tab +=3D l3_table_offset(v_start);
> -                    *l4tab =3D l4e_from_paddr(__pa(l3start), L4_PROT);
> +                    *l4tab =3D l4e_from_mfn(l3start_mfn, L4_PROT);
>                      l4tab++;
>                  }
> -                *l3tab =3D l3e_from_paddr(__pa(l2start), L3_PROT);
> +                *l3tab =3D l3e_from_mfn(l2start_mfn, L3_PROT);
>                  l3tab++;
>              }
> -            *l2tab =3D l2e_from_paddr(__pa(l1start), L2_PROT);
> +            *l2tab =3D l2e_from_mfn(l1start_mfn, L2_PROT);
>              l2tab++;
>          }
>          if ( count < initrd_pfn || count >=3D initrd_pfn + PFN_UP(initrd=
_len) )
> @@ -792,27 +807,32 @@ static int __init dom0_construct(struct domain *d,
> =20
>      if ( compat )
>      {
> -        l2_pgentry_t *l2t;
> -
>          /* Ensure the first four L3 entries are all populated. */
>          for ( i =3D 0, l3tab =3D l3start; i < 4; ++i, ++l3tab )
>          {
>              if ( !l3e_get_intpte(*l3tab) )
>              {
> +                mfn_t l2start_mfn;
>                  maddr_to_page(mpt_alloc)->u.inuse.type_info =3D PGT_l2_p=
age_table;
> -                l2tab =3D __va(mpt_alloc); mpt_alloc +=3D PAGE_SIZE;
> -                clear_page(l2tab);
> -                *l3tab =3D l3e_from_paddr(__pa(l2tab), L3_PROT);
> +                UNMAP_MAP_AND_ADVANCE(l2start_mfn, l2start, mpt_alloc);
> +                clear_page(l2start);
> +                *l3tab =3D l3e_from_mfn(l2start_mfn, L3_PROT);
>              }
>              if ( i =3D=3D 3 )
>                  l3e_get_page(*l3tab)->u.inuse.type_info |=3D PGT_pae_xen=
_l2;
>          }
> =20
> -        l2t =3D map_l2t_from_l3e(l3start[3]);
> -        init_xen_pae_l2_slots(l2t, d);
> -        unmap_domain_page(l2t);
> +        UNMAP_DOMAIN_PAGE(l2start);
> +        l2start =3D map_l2t_from_l3e(l3start[3]);
> +        init_xen_pae_l2_slots(l2start, d);
>      }
> =20
> +#undef UNMAP_MAP_AND_ADVANCE
> +
> +    UNMAP_DOMAIN_PAGE(l1start);
> +    UNMAP_DOMAIN_PAGE(l2start);
> +    UNMAP_DOMAIN_PAGE(l3start);

... l4start is not unmapped here. This is a problem, because we're about to
change the page tables into dom0's and start using its mapcache.

IMO, we should be unmapping here, and remapping in dom0's context. Otherwis=
e
l4start becomes a transiently stale pointer. Any remaining pointer obtained=
 via
map_domain_page() is a dangling pointer after the mapcache+pagetable switch=
.

> +
>      /* Pages that are part of page tables must be read only. */
>      mark_pv_pt_pages_rdonly(d, l4start, vpt_start, nr_pt_pages, &flush_f=
lags);
> =20
> @@ -987,6 +1007,8 @@ static int __init dom0_construct(struct domain *d,
>          pv_shim_setup_dom(d, l4start, v_start, vxenstore_start, vconsole=
_start,
>                            vphysmap_start, si);
> =20
> +    UNMAP_DOMAIN_PAGE(l4start);

As it is, this unmap is operating on the wrong mapcache, I think. I don't q=
uite
understand why I see intermittent boot crashes and not constant ones, but t=
his
seems like a bug.

What we want, I think, is:

  1. Increase the scope of l4start_mfn to be function-level.
  2. Do UNMAP_DOMAIN_PAGE(l4start) along with l1start, l2start and l3start.
  3. Include a pair of map_domain_page() and UNMAP_DOMAIN_PAGE() within the
     conditional, surrounding pv_shim_setup_dom.

> +
>  #ifdef CONFIG_COMPAT
>      if ( compat )
>          xlat_start_info(si, pv_shim ? XLAT_start_info_console_domU

I'll keep testing it in case I missed something, but this seems to work.

Cheers,
Alejandro

