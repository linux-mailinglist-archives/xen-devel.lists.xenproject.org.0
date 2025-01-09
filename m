Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F033A0794F
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2025 15:34:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.868460.1279960 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVtbw-0000qB-7k; Thu, 09 Jan 2025 14:34:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 868460.1279960; Thu, 09 Jan 2025 14:34:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVtbw-0000oT-4t; Thu, 09 Jan 2025 14:34:12 +0000
Received: by outflank-mailman (input) for mailman id 868460;
 Thu, 09 Jan 2025 14:34:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bl7y=UB=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tVtbu-0000oN-Sv
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2025 14:34:10 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c939d6dd-ce96-11ef-99a4-01e77a169b0f;
 Thu, 09 Jan 2025 15:34:09 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-38a34e8410bso577352f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jan 2025 06:34:09 -0800 (PST)
Received: from localhost ([66.81.170.107]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a8e38c697sm2016678f8f.52.2025.01.09.06.34.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jan 2025 06:34:07 -0800 (PST)
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
X-Inumbo-ID: c939d6dd-ce96-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1736433248; x=1737038048; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Nyd8o6ZDmZrvb09cL1RZmKteo2db8IAljcfguY7qSQ=;
        b=jbCcx85AA4Lcokz+d1886Yx3nYm8Im8OQHiyZXfpO/99KZ4NivuJEIDk7BSlj/2+9m
         Dgllw8JwZZ+1FGbG3ws7rPQy4xC+EvoJjtAuJuzVwFTjQa5wwkFf6T+zc0QbSwo2eVsQ
         YxbbWPFZMpdkj8QEsSQafh0spsXCUBrr5GlI0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736433248; x=1737038048;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5Nyd8o6ZDmZrvb09cL1RZmKteo2db8IAljcfguY7qSQ=;
        b=NYMk+caq9iIAHBp4aDf9QOOFactwke5if3mxjDez2iLBDnKZmsbhFbao0kHrNNX8G3
         BGJ/uGTag8hW9rGBaIBX5NEVBbyujTWu5+vYx1mKelwORZ6AQWbOJgoi2VB0T99XeKTH
         skDg0RPyzUCag++wwXeT6x7B1jyxtpkZjskf2mHPU/W04XU+6K6hl4blqMEDCde0lArZ
         Za0Sh0DNSnSYoVpPglfahfNLmcUFUXEiA8c1SHixAVUDfXxPLrf7617dfelWokfhAegS
         49ZIPwlRJYnfzxOOCW6BPsO39nope3vrc7B74FAmMnrM3yjOhFLLiksENDJWflLpLEtv
         n78g==
X-Forwarded-Encrypted: i=1; AJvYcCXmGePZEwl6ptEMGJADcgRV3VZqGgn9Vv05lhJZtipJP9615R5r3YwC8+HCdwI3CSMyqwVmbV2wqaw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzStkxBnBn/IrbmdDwwEFZkRBQnp8KD14/BO1Wlud6HA6vFE0QH
	bChanTTkp4tH/jx4zL5s6wLLqP5VYDID/ZdQ3ogEOC4JBYriXEuwkH8KuG78I5Y=
X-Gm-Gg: ASbGncuee/RBlc3Es+zlmBURnmd/EOvY2dzbn2/4DT7e2ezlknCm2tZObMKnNi6cncR
	gf87UiBpQRa9n/Yfe1Jrf5tz1Iboy2YmQTQE0yvMwXg/7bPwQ7I/0eP0CY4rZicjuRZcGtxLNxs
	i9hYDC8SQ3viouGaOoD7rmf92XAieSxkQsmGIuXwO/2fQzR6GHme69/RrZj6NFtIf/LbhwQcHsv
	yu9b3kNMj4ebe9bA3vFMFPU1xrJmmXda7IGFFigkp5bDXl6+YqJ7znYFNsi2UQ=
X-Google-Smtp-Source: AGHT+IGrsj9gFvZbdFSfqAoftR5eWlus1YFDN0K1FzWTd0jQPThNxqDUpRWOm9wrPVllN86dIHmxlg==
X-Received: by 2002:a05:6000:1f81:b0:386:1cd3:8a03 with SMTP id ffacd0b85a97d-38a872ec38fmr5884682f8f.32.1736433248261;
        Thu, 09 Jan 2025 06:34:08 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 09 Jan 2025 14:34:05 +0000
Message-Id: <D6XM7OP0SQPB.3U12X09JAPKU3@cloud.com>
Cc: "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper"
 <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 07/18] x86/pv: update guest LDT mappings using the
 linear entries
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Roger Pau Monne" <roger.pau@citrix.com>,
 <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.18.2
References: <20250108142659.99490-1-roger.pau@citrix.com>
 <20250108142659.99490-8-roger.pau@citrix.com>
In-Reply-To: <20250108142659.99490-8-roger.pau@citrix.com>

On Wed Jan 8, 2025 at 2:26 PM GMT, Roger Pau Monne wrote:
> The pv_map_ldt_shadow_page() and pv_destroy_ldt() functions rely on the L=
1
> table(s) that contain such mappings being stashed in the domain structure=
, and
> thus such mappings being modified by merely updating the require L1 entri=
es.
>
> Switch pv_map_ldt_shadow_page() to unconditionally use the linear recursi=
ve, as
> that logic is always called while the vCPU is running on the current pCPU=
.
>
> For pv_destroy_ldt() use the linear mappings if the vCPU is the one curre=
ntly
> running on the pCPU, otherwise use destroy_mappings().
>
> Note this requires keeping an array with the pages currently mapped at th=
e LDT
> area, as that allows dropping the extra taken page reference when removin=
g the
> mappings.
>
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> ---
>  xen/arch/x86/include/asm/domain.h   |  2 ++
>  xen/arch/x86/pv/descriptor-tables.c | 19 ++++++++++---------
>  xen/arch/x86/pv/domain.c            |  4 ++++
>  xen/arch/x86/pv/mm.c                |  3 ++-
>  4 files changed, 18 insertions(+), 10 deletions(-)
>
> diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm=
/domain.h
> index b79d6badd71c..b659cffc7f81 100644
> --- a/xen/arch/x86/include/asm/domain.h
> +++ b/xen/arch/x86/include/asm/domain.h
> @@ -523,6 +523,8 @@ struct pv_vcpu
>      struct trap_info *trap_ctxt;
> =20
>      unsigned long gdt_frames[FIRST_RESERVED_GDT_PAGE];
> +    /* Max LDT entries is 8192, so 8192 * 8 =3D 64KiB (16 pages). */
> +    mfn_t ldt_frames[16];
>      unsigned long ldt_base;
>      unsigned int gdt_ents, ldt_ents;
> =20
> diff --git a/xen/arch/x86/pv/descriptor-tables.c b/xen/arch/x86/pv/descri=
ptor-tables.c
> index 5a79f022ce13..95b598a4c0cf 100644
> --- a/xen/arch/x86/pv/descriptor-tables.c
> +++ b/xen/arch/x86/pv/descriptor-tables.c
> @@ -20,28 +20,29 @@
>   */
>  bool pv_destroy_ldt(struct vcpu *v)
>  {
> -    l1_pgentry_t *pl1e;
> +    const unsigned int nr_frames =3D ARRAY_SIZE(v->arch.pv.ldt_frames);
>      unsigned int i, mappings_dropped =3D 0;
> -    struct page_info *page;
> =20
>      ASSERT(!in_irq());
> =20
>      ASSERT(v =3D=3D current || !vcpu_cpu_dirty(v));
> =20
> -    pl1e =3D pv_ldt_ptes(v);
> +    destroy_perdomain_mapping(v, LDT_VIRT_START(v), nr_frames);
> =20
> -    for ( i =3D 0; i < 16; i++ )
> +    for ( i =3D 0; i < nr_frames; i++ )

nit: While at this, can the "unsigned int" be moved here too?

>      {
> -        if ( !(l1e_get_flags(pl1e[i]) & _PAGE_PRESENT) )
> -            continue;
> +        mfn_t mfn =3D v->arch.pv.ldt_frames[i];
> +        struct page_info *page;
> =20
> -        page =3D l1e_get_page(pl1e[i]);
> -        l1e_write(&pl1e[i], l1e_empty());
> -        mappings_dropped++;
> +        if ( mfn_eq(mfn, INVALID_MFN) )
> +            continue;

Can it really be disjoint? As in, why "continue" and not "break"?. Not that=
 it
matters in the slightest, and I prefer this form; but I'm curious.

> =20
> +        v->arch.pv.ldt_frames[i] =3D INVALID_MFN;
> +        page =3D mfn_to_page(mfn);
>          ASSERT_PAGE_IS_TYPE(page, PGT_seg_desc_page);
>          ASSERT_PAGE_IS_DOMAIN(page, v->domain);
>          put_page_and_type(page);
> +        mappings_dropped++;
>      }
> =20
>      return mappings_dropped;
> diff --git a/xen/arch/x86/pv/domain.c b/xen/arch/x86/pv/domain.c
> index 7e8bffaae9a0..32d7488cc186 100644
> --- a/xen/arch/x86/pv/domain.c
> +++ b/xen/arch/x86/pv/domain.c
> @@ -303,6 +303,7 @@ void pv_vcpu_destroy(struct vcpu *v)
>  int pv_vcpu_initialise(struct vcpu *v)
>  {
>      struct domain *d =3D v->domain;
> +    unsigned int i;
>      int rc;
> =20
>      ASSERT(!is_idle_domain(d));
> @@ -311,6 +312,9 @@ int pv_vcpu_initialise(struct vcpu *v)
>      if ( rc )
>          return rc;
> =20
> +    for ( i =3D 0; i < ARRAY_SIZE(v->arch.pv.ldt_frames); i++ )
> +        v->arch.pv.ldt_frames[i] =3D INVALID_MFN;
> +

I think it makes more sense to move this earlier so ldt_frames[] is initial=
ised
even if pv_vcpu_initialise() fails. It may be benign, but it looks like an
accident abount to happen.

Also, nit: "unsigned int i"'s scope can be restricted to the loop itself.

  As in, "for ( unsigned int i =3D..."

>      BUILD_BUG_ON(X86_NR_VECTORS * sizeof(*v->arch.pv.trap_ctxt) >
>                   PAGE_SIZE);
>      v->arch.pv.trap_ctxt =3D xzalloc_array(struct trap_info, X86_NR_VECT=
ORS);
> diff --git a/xen/arch/x86/pv/mm.c b/xen/arch/x86/pv/mm.c
> index 187f5f6a3e8c..4853e619f2a7 100644
> --- a/xen/arch/x86/pv/mm.c
> +++ b/xen/arch/x86/pv/mm.c
> @@ -86,7 +86,8 @@ bool pv_map_ldt_shadow_page(unsigned int offset)
>          return false;
>      }
> =20
> -    pl1e =3D &pv_ldt_ptes(curr)[offset >> PAGE_SHIFT];
> +    curr->arch.pv.ldt_frames[offset >> PAGE_SHIFT] =3D page_to_mfn(page)=
;
> +    pl1e =3D &__linear_l1_table[l1_linear_offset(LDT_VIRT_START(curr) + =
offset)];
>      l1e_add_flags(gl1e, _PAGE_RW);
> =20
>      l1e_write(pl1e, gl1e);

Cheers,
Alejandro

