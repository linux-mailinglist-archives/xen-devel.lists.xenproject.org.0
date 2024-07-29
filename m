Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 688BE93F6CE
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2024 15:37:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.766747.1177262 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYQYO-00019O-O7; Mon, 29 Jul 2024 13:36:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 766747.1177262; Mon, 29 Jul 2024 13:36:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYQYO-00016s-LM; Mon, 29 Jul 2024 13:36:44 +0000
Received: by outflank-mailman (input) for mailman id 766747;
 Mon, 29 Jul 2024 13:36:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vj3p=O5=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sYQYN-00010W-B4
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2024 13:36:43 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9753d7ac-4daf-11ef-bc01-fd08da9f4363;
 Mon, 29 Jul 2024 15:36:42 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a7a83a968ddso486124466b.0
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jul 2024 06:36:42 -0700 (PDT)
Received: from localhost ([185.25.67.249]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acad414e2sm507142066b.127.2024.07.29.06.36.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jul 2024 06:36:41 -0700 (PDT)
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
X-Inumbo-ID: 9753d7ac-4daf-11ef-bc01-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1722260202; x=1722865002; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k1+lg4XxXA+d1m2Iy9FsWuEcd8B0hbx48+4qCXe7DqI=;
        b=Tkffr0ueT4F++GoSqe1WawnG9aTp9u2EwUwlZELGvPqySfGmUKqHw+o/jXum+4m707
         akH/wMpgtiSaQgOWUiB9orInmXKkp3c955s+KLfKFUOOycSt95ev4V5DQz9eMUXIVbaM
         64uaFhmCB8B+ZzzHrtR3q8+fZvU2dbIR8+Ws4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722260202; x=1722865002;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=k1+lg4XxXA+d1m2Iy9FsWuEcd8B0hbx48+4qCXe7DqI=;
        b=aiASg4aWWA+eCmDt40E1RtAX/jkccwgw6IW/6fXrZQbAOHco1V0mokLGLo3SEm9L1v
         HqDOYSP8ACEe+QarZQW8NSVWJN+4wT/geivErswok8QZlFPizk8WLacNZf7fUas5lHL9
         lJ+jTiduncU0q6k6yJ6Hdo+DzEwcC/N6UwtTS+R6/KhXg1UOopS481qAf1kULQTTipp6
         V4n/5oOvrInPOo+MJls+YUumvga2oYAYdaGkBwcbYI9McmUMtlSh9NudJSp9WCVhDByn
         kUnK16Z2+cH0TrPyA0Ois0tC/CsiTl/AeZL8J9wy8oHworL7EonzkzkOFRx7dQjQP8vi
         SEEg==
X-Forwarded-Encrypted: i=1; AJvYcCUh1+JTN0ADrMqaN2V4GU0S9GwoG1icDZmEWFBHq9R5wk/4meT5cLoIhezwAdlEoou+eW0u3gAdSnAkDBVOu7emmtUggNT8/2lfutIArQk=
X-Gm-Message-State: AOJu0Yy1GFSLQA26Ine4HipK5DolRqaxlfklOiusC3K/+zBx97j4Agkd
	aX+JG45bRJpASjLz/k7DAXSR6LeLaqyeLYK3OLUX1+SU4dFVKwhTLrQrkAs9G/k=
X-Google-Smtp-Source: AGHT+IEejAvAVpK9VD0REaEmJ+H2+YF04iDCqwOD7YSOP7mn0me8Tv7Uik2n7eCP8u7wwlOFg8+t7g==
X-Received: by 2002:a17:907:60d0:b0:a79:7e8b:34be with SMTP id a640c23a62f3a-a7d3ff557b5mr440850166b.4.1722260201894;
        Mon, 29 Jul 2024 06:36:41 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 29 Jul 2024 14:36:39 +0100
Message-Id: <D322ACW6M240.2G3UQGXHR0XU0@cloud.com>
Cc: "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper"
 <andrew.cooper3@citrix.com>, "Tim Deegan" <tim@xen.org>
Subject: Re: [PATCH 08/22] x86/mm: avoid passing a domain parameter to L4
 init function
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Roger Pau Monne" <roger.pau@citrix.com>,
 <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.17.0
References: <20240726152206.28411-1-roger.pau@citrix.com>
 <20240726152206.28411-9-roger.pau@citrix.com>
In-Reply-To: <20240726152206.28411-9-roger.pau@citrix.com>

On Fri Jul 26, 2024 at 4:21 PM BST, Roger Pau Monne wrote:
> In preparation for the function being called from contexts where no domai=
n is
> present.
>
> No functional change intended.
>
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> ---
>  xen/arch/x86/include/asm/mm.h  |  4 +++-
>  xen/arch/x86/mm.c              | 24 +++++++++++++-----------
>  xen/arch/x86/mm/hap/hap.c      |  3 ++-
>  xen/arch/x86/mm/shadow/hvm.c   |  3 ++-
>  xen/arch/x86/mm/shadow/multi.c |  7 +++++--
>  xen/arch/x86/pv/dom0_build.c   |  3 ++-
>  xen/arch/x86/pv/domain.c       |  3 ++-
>  7 files changed, 29 insertions(+), 18 deletions(-)
>
> diff --git a/xen/arch/x86/include/asm/mm.h b/xen/arch/x86/include/asm/mm.=
h
> index b3853ae734fa..076e7009dc99 100644
> --- a/xen/arch/x86/include/asm/mm.h
> +++ b/xen/arch/x86/include/asm/mm.h
> @@ -375,7 +375,9 @@ int devalidate_page(struct page_info *page, unsigned =
long type,
> =20
>  void init_xen_pae_l2_slots(l2_pgentry_t *l2t, const struct domain *d);
>  void init_xen_l4_slots(l4_pgentry_t *l4t, mfn_t l4mfn,
> -                       const struct domain *d, mfn_t sl4mfn, bool ro_mpt=
);
> +                       mfn_t sl4mfn, const struct page_info *perdomain_l=
3,
> +                       bool ro_mpt, bool maybe_compat, bool short_direct=
map);
> +

The comment currently in the .c file should probably be here instead, and
updated for the new arguments. That said, I'm skeptical 3 booleans is somet=
hing
desirable. It induces a lot of complexity at the call sites (which of the 8
forms of init_xen_l4_slots() do I need here?) and a lot of cognitive overlo=
ad.

I can't propose a solution because I'm still wrapping my head around how th=
e
layout (esp. compat layout) fits together. Maybe the booleans can be mapped=
 to
an enum? It would also help interpret the callsites as it'd no longer be a
sequence of contextless booleans, but a readable identifier.

>  bool fill_ro_mpt(mfn_t mfn);
>  void zap_ro_mpt(mfn_t mfn);
> =20
> diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
> index a792a300a866..c01b6712143e 100644
> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -1645,14 +1645,9 @@ static int promote_l3_table(struct page_info *page=
)
>   * extended directmap.
>   */
>  void init_xen_l4_slots(l4_pgentry_t *l4t, mfn_t l4mfn,
> -                       const struct domain *d, mfn_t sl4mfn, bool ro_mpt=
)
> +                       mfn_t sl4mfn, const struct page_info *perdomain_l=
3,
> +                       bool ro_mpt, bool maybe_compat, bool short_direct=
map)
>  {
> -    /*
> -     * PV vcpus need a shortened directmap.  HVM and Idle vcpus get the =
full
> -     * directmap.
> -     */
> -    bool short_directmap =3D !paging_mode_external(d);
> -
>      /* Slot 256: RO M2P (if applicable). */
>      l4t[l4_table_offset(RO_MPT_VIRT_START)] =3D
>          ro_mpt ? idle_pg_table[l4_table_offset(RO_MPT_VIRT_START)]
> @@ -1673,13 +1668,14 @@ void init_xen_l4_slots(l4_pgentry_t *l4t, mfn_t l=
4mfn,
>          l4e_from_mfn(sl4mfn, __PAGE_HYPERVISOR_RW);
> =20
>      /* Slot 260: Per-domain mappings. */
> -    l4t[l4_table_offset(PERDOMAIN_VIRT_START)] =3D
> -        l4e_from_page(d->arch.perdomain_l3_pg, __PAGE_HYPERVISOR_RW);
> +    if ( perdomain_l3 )
> +        l4t[l4_table_offset(PERDOMAIN_VIRT_START)] =3D
> +            l4e_from_page(perdomain_l3, __PAGE_HYPERVISOR_RW);
> =20
>      /* Slot 4: Per-domain mappings mirror. */
>      BUILD_BUG_ON(IS_ENABLED(CONFIG_PV32) &&
>                   !l4_table_offset(PERDOMAIN_ALT_VIRT_START));
> -    if ( !is_pv_64bit_domain(d) )
> +    if ( perdomain_l3 && maybe_compat )
>          l4t[l4_table_offset(PERDOMAIN_ALT_VIRT_START)] =3D
>              l4t[l4_table_offset(PERDOMAIN_VIRT_START)];
> =20
> @@ -1710,6 +1706,10 @@ void init_xen_l4_slots(l4_pgentry_t *l4t, mfn_t l4=
mfn,
>      else
>  #endif
>      {
> +        /*
> +         * PV vcpus need a shortened directmap.  HVM and Idle vcpus get =
the full
> +         * directmap.
> +         */
>          unsigned int slots =3D (short_directmap
>                                ? ROOT_PAGETABLE_PV_XEN_SLOTS
>                                : ROOT_PAGETABLE_XEN_SLOTS);
> @@ -1830,7 +1830,9 @@ static int promote_l4_table(struct page_info *page)
>      if ( !rc )
>      {
>          init_xen_l4_slots(pl4e, l4mfn,
> -                          d, INVALID_MFN, VM_ASSIST(d, m2p_strict));
> +                          INVALID_MFN, d->arch.perdomain_l3_pg,
> +                          VM_ASSIST(d, m2p_strict), !is_pv_64bit_domain(=
d),
> +                          true);
>          atomic_inc(&d->arch.pv.nr_l4_pages);
>      }
>      unmap_domain_page(pl4e);
> diff --git a/xen/arch/x86/mm/hap/hap.c b/xen/arch/x86/mm/hap/hap.c
> index d2011fde2462..c8514ca0e917 100644
> --- a/xen/arch/x86/mm/hap/hap.c
> +++ b/xen/arch/x86/mm/hap/hap.c
> @@ -402,7 +402,8 @@ static mfn_t hap_make_monitor_table(struct vcpu *v)
>      m4mfn =3D page_to_mfn(pg);
>      l4e =3D map_domain_page(m4mfn);
> =20
> -    init_xen_l4_slots(l4e, m4mfn, d, INVALID_MFN, false);
> +    init_xen_l4_slots(l4e, m4mfn, INVALID_MFN, d->arch.perdomain_l3_pg,
> +                      false, true, false);

Out of ignorance: why is the compat area mapped on HVM monitor PTs? I thoug=
ht
those were used exclusively in hypervisor context, and would hence always h=
ave
the 512 slots available.

>      unmap_domain_page(l4e);
> =20
>      return m4mfn;
> diff --git a/xen/arch/x86/mm/shadow/hvm.c b/xen/arch/x86/mm/shadow/hvm.c
> index c16f3b3adf32..93922a71e511 100644
> --- a/xen/arch/x86/mm/shadow/hvm.c
> +++ b/xen/arch/x86/mm/shadow/hvm.c
> @@ -758,7 +758,8 @@ mfn_t sh_make_monitor_table(const struct vcpu *v, uns=
igned int shadow_levels)
>       * shadow-linear mapping will either be inserted below when creating
>       * lower level monitor tables, or later in sh_update_cr3().
>       */
> -    init_xen_l4_slots(l4e, m4mfn, d, INVALID_MFN, false);
> +    init_xen_l4_slots(l4e, m4mfn, INVALID_MFN, d->arch.perdomain_l3_pg,
> +                      false, true, false);
> =20
>      if ( shadow_levels < 4 )
>      {
> diff --git a/xen/arch/x86/mm/shadow/multi.c b/xen/arch/x86/mm/shadow/mult=
i.c
> index 376f6823cd44..0def0c073ca8 100644
> --- a/xen/arch/x86/mm/shadow/multi.c
> +++ b/xen/arch/x86/mm/shadow/multi.c
> @@ -973,8 +973,11 @@ sh_make_shadow(struct vcpu *v, mfn_t gmfn, u32 shado=
w_type)
> =20
>              BUILD_BUG_ON(sizeof(l4_pgentry_t) !=3D sizeof(shadow_l4e_t))=
;
> =20
> -            init_xen_l4_slots(l4t, gmfn, d, smfn, (!is_pv_32bit_domain(d=
) &&
> -                                                   VM_ASSIST(d, m2p_stri=
ct)));
> +            init_xen_l4_slots(l4t, gmfn, smfn,
> +                              d->arch.perdomain_l3_pg,
> +                              (!is_pv_32bit_domain(d) &&
> +                               VM_ASSIST(d, m2p_strict)),
> +                              !is_pv_64bit_domain(d), true);
>              unmap_domain_page(l4t);
>          }
>          break;
> diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
> index 41772dbe80bf..6a6689f402bb 100644
> --- a/xen/arch/x86/pv/dom0_build.c
> +++ b/xen/arch/x86/pv/dom0_build.c
> @@ -711,7 +711,8 @@ int __init dom0_construct_pv(struct domain *d,
>          l4start =3D l4tab =3D __va(mpt_alloc); mpt_alloc +=3D PAGE_SIZE;
>          clear_page(l4tab);
>          init_xen_l4_slots(l4tab, _mfn(virt_to_mfn(l4start)),
> -                          d, INVALID_MFN, true);
> +                          INVALID_MFN, d->arch.perdomain_l3_pg,
> +                          true, !is_pv_64bit_domain(d), true);
>          v->arch.guest_table =3D pagetable_from_paddr(__pa(l4start));
>      }
>      else
> diff --git a/xen/arch/x86/pv/domain.c b/xen/arch/x86/pv/domain.c
> index 86b74fb372d5..6ff71f14a2f2 100644
> --- a/xen/arch/x86/pv/domain.c
> +++ b/xen/arch/x86/pv/domain.c
> @@ -124,7 +124,8 @@ static int setup_compat_l4(struct vcpu *v)
>      mfn =3D page_to_mfn(pg);
>      l4tab =3D map_domain_page(mfn);
>      clear_page(l4tab);
> -    init_xen_l4_slots(l4tab, mfn, v->domain, INVALID_MFN, false);
> +    init_xen_l4_slots(l4tab, mfn, INVALID_MFN, v->domain->arch.perdomain=
_l3_pg,
> +                      false, true, true);
>      unmap_domain_page(l4tab);
> =20
>      /* This page needs to look like a pagetable so that it can be shadow=
ed */


