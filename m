Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE46EA072F5
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2025 11:26:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.868049.1279590 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVpjf-0004KH-8w; Thu, 09 Jan 2025 10:25:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 868049.1279590; Thu, 09 Jan 2025 10:25:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVpjf-0004IH-5Z; Thu, 09 Jan 2025 10:25:55 +0000
Received: by outflank-mailman (input) for mailman id 868049;
 Thu, 09 Jan 2025 10:25:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bl7y=UB=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tVpje-0004IB-Ed
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2025 10:25:54 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1a5759bf-ce74-11ef-99a4-01e77a169b0f;
 Thu, 09 Jan 2025 11:25:52 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-385e1fcb0e1so379657f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jan 2025 02:25:52 -0800 (PST)
Received: from localhost ([66.81.170.107]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a8e4b80besm1386027f8f.83.2025.01.09.02.25.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jan 2025 02:25:51 -0800 (PST)
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
X-Inumbo-ID: 1a5759bf-ce74-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1736418352; x=1737023152; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PYo5T+Q4kQBd85lnsYKAOIxFRBNCd1XVXpqut8F4Kzo=;
        b=b5RkbACwqePuGql7hkLwRzfaVrXytZrqbpxLRrSGkSQDyvCDzEahYSSP/54wXrKUIK
         rtozYiC2/gRlyN4g+Uj7omLOuvBnklTr5ZB5JtRtQQf6wrBYf/V9oj1HCZRU75aP0WFL
         NjMplnenl/xofP8YPEN/IP7agrIEP6rO22bUw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736418352; x=1737023152;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PYo5T+Q4kQBd85lnsYKAOIxFRBNCd1XVXpqut8F4Kzo=;
        b=H7zBjnyMJx/euMoVjZikAD1/nfbPQAZmJHvNqjOc6O7GbGScDAKIfsl2v8e6PSGoJi
         HhC9wOlCRU0qZiXCemh3B4ZtbrXS0CczMk8r2fZbyi7xcSxMUyeWsQMSN/RATl10Lnid
         PdXMtDlVFfMNW/ennxdTqScbdu0GRUQ4NTBOZEVxKC7Yc9NyzmWL6bJkspghoflYi38f
         KPdMjKAbH4IkXRr9ST/DBRCOsyCSiuCpoo6g6pH+tVZ7pmsraWyzdbDQ/x2ZCloERX3z
         nPs91xd61BLxBRzJCYolEpaRJSrjiz9cQFuxD2a1oPnTUNgdkn4OkOy6ggZL0qRedjzN
         XmWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCjKoe2PukZparjUK4otGq2QAj7WS3BYulaxvjhj8EuzdH4uCUk2Zc/M+1NNgf23PGRqzFVPjkPsA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxrep4TiJ20bsamsOwedelkVqbO3FFQXnguJvFN8SvAZk+977sg
	kHgd2PEGBci1tgcrwWV7mIVS5bc6WtHUbeBU1mH3QmDosZEn74mgnfwrcvQO830=
X-Gm-Gg: ASbGncv/4k0Gy7GmzdGO2onLd/DR3JIjbcTki1c/OCetUOPX6drvwIoNQYOOsPHzLsU
	X/Ef6QgoO5RvkNmO8GSfXmsfmfJluAe395LAL1xwryTrzdTghmia3tvvMGrTiD54VoLwRqL1iJm
	LeboI8XDBK6EZGwKCJCnABrowwOLguMcsHZuyydSJoXkPJyWv+3/RZ7oExAK33jmU+9eHvwZfrE
	IiQf7yIpvKrgjI1xAnGsRpSF3rkfeifHsxmAOsS6YohqOf8rJ/QWioTazEkrm0=
X-Google-Smtp-Source: AGHT+IFmuuToL0paDrsRLJdELl1n1nqR2X7wjKagqJB23KWV3chRtURthDswqM5owEUGILgBW1BjBg==
X-Received: by 2002:a05:6000:1848:b0:38a:8b2c:53ab with SMTP id ffacd0b85a97d-38a8b2c563emr2150646f8f.44.1736418351971;
        Thu, 09 Jan 2025 02:25:51 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 09 Jan 2025 10:25:50 +0000
Message-Id: <D6XGXLZ2SKUR.3CW1GPXWK3LFC@cloud.com>
Cc: "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper"
 <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2.1 06/18] x86/pv: set/clear guest GDT mappings using
 {populate,destroy}_perdomain_mapping()
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Roger Pau Monne" <roger.pau@citrix.com>,
 <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.18.2
References: <20250108142659.99490-7-roger.pau@citrix.com>
 <20250108151133.858-1-roger.pau@citrix.com>
In-Reply-To: <20250108151133.858-1-roger.pau@citrix.com>

On Wed Jan 8, 2025 at 3:11 PM GMT, Roger Pau Monne wrote:
> The pv_{set,destroy}_gdt() functions rely on the L1 table(s) that contain=
 such
> mappings being stashed in the domain structure, and thus such mappings be=
ing
> modified by merely updating the L1 entries.
>
> Switch both pv_{set,destroy}_gdt() to instead use
> {populate,destory}_perdomain_mapping().

nit: s/destory/destroy

How come pv_set_gdt() doesn't need to be reordered here (as opposed to v2)?

>
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> ---
> Changes since v2:
>  - Do not change ordering setup of arch_set_info_guest().
> ---
>  xen/arch/x86/pv/descriptor-tables.c | 28 ++++++++++++----------------
>  1 file changed, 12 insertions(+), 16 deletions(-)
>
> diff --git a/xen/arch/x86/pv/descriptor-tables.c b/xen/arch/x86/pv/descri=
ptor-tables.c
> index 02647a2c5047..5a79f022ce13 100644
> --- a/xen/arch/x86/pv/descriptor-tables.c
> +++ b/xen/arch/x86/pv/descriptor-tables.c
> @@ -49,23 +49,20 @@ bool pv_destroy_ldt(struct vcpu *v)
> =20
>  void pv_destroy_gdt(struct vcpu *v)
>  {
> -    l1_pgentry_t *pl1e =3D pv_gdt_ptes(v);
> -    mfn_t zero_mfn =3D _mfn(virt_to_mfn(zero_page));
> -    l1_pgentry_t zero_l1e =3D l1e_from_mfn(zero_mfn, __PAGE_HYPERVISOR_R=
O);
>      unsigned int i;
> =20
>      ASSERT(v =3D=3D current || !vcpu_cpu_dirty(v));
> =20
> -    v->arch.pv.gdt_ents =3D 0;
> -    for ( i =3D 0; i < FIRST_RESERVED_GDT_PAGE; i++ )
> -    {
> -        mfn_t mfn =3D l1e_get_mfn(pl1e[i]);
> +    if ( v->arch.cr3 )
> +        destroy_perdomain_mapping(v, GDT_VIRT_START(v),
> +                                  ARRAY_SIZE(v->arch.pv.gdt_frames));
> =20
> -        if ( (l1e_get_flags(pl1e[i]) & _PAGE_PRESENT) &&
> -             !mfn_eq(mfn, zero_mfn) )
> -            put_page_and_type(mfn_to_page(mfn));
> +    for ( i =3D 0; i < ARRAY_SIZE(v->arch.pv.gdt_frames); i++)
> +    {
> +        if ( !v->arch.pv.gdt_frames[i] )
> +            break;
> =20
> -        l1e_write(&pl1e[i], zero_l1e);
> +        put_page_and_type(mfn_to_page(_mfn(v->arch.pv.gdt_frames[i])));
>          v->arch.pv.gdt_frames[i] =3D 0;
>      }
>  }
> @@ -74,8 +71,8 @@ int pv_set_gdt(struct vcpu *v, const unsigned long fram=
es[],
>                 unsigned int entries)
>  {
>      struct domain *d =3D v->domain;
> -    l1_pgentry_t *pl1e;
>      unsigned int i, nr_frames =3D DIV_ROUND_UP(entries, 512);
> +    mfn_t mfns[ARRAY_SIZE(v->arch.pv.gdt_frames)];
> =20
>      ASSERT(v =3D=3D current || !vcpu_cpu_dirty(v));
> =20
> @@ -90,6 +87,8 @@ int pv_set_gdt(struct vcpu *v, const unsigned long fram=
es[],
>          if ( !mfn_valid(mfn) ||
>               !get_page_and_type(mfn_to_page(mfn), d, PGT_seg_desc_page) =
)
>              goto fail;
> +
> +        mfns[i] =3D mfn;
>      }
> =20
>      /* Tear down the old GDT. */
> @@ -97,12 +96,9 @@ int pv_set_gdt(struct vcpu *v, const unsigned long fra=
mes[],
> =20
>      /* Install the new GDT. */
>      v->arch.pv.gdt_ents =3D entries;
> -    pl1e =3D pv_gdt_ptes(v);
>      for ( i =3D 0; i < nr_frames; i++ )
> -    {
>          v->arch.pv.gdt_frames[i] =3D frames[i];
> -        l1e_write(&pl1e[i], l1e_from_pfn(frames[i], __PAGE_HYPERVISOR_RW=
));
> -    }
> +    populate_perdomain_mapping(v, GDT_VIRT_START(v), mfns, nr_frames);
> =20
>      return 0;
> =20

Cheers,
Alejandro

