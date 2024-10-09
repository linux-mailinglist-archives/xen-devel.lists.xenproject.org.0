Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D02F9971DD
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 18:39:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.814963.1228690 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syZiO-0005p3-8W; Wed, 09 Oct 2024 16:39:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 814963.1228690; Wed, 09 Oct 2024 16:39:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syZiO-0005lZ-4D; Wed, 09 Oct 2024 16:39:08 +0000
Received: by outflank-mailman (input) for mailman id 814963;
 Wed, 09 Oct 2024 16:39:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hyzk=RF=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1syZiM-0005LG-9M
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 16:39:06 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fe9c95f7-865c-11ef-99a2-01e77a169b0f;
 Wed, 09 Oct 2024 18:39:04 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a9950d27234so534928166b.1
 for <xen-devel@lists.xenproject.org>; Wed, 09 Oct 2024 09:39:04 -0700 (PDT)
Received: from localhost ([52.166.251.127]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a997f2f8414sm209433766b.129.2024.10.09.09.39.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Oct 2024 09:39:02 -0700 (PDT)
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
X-Inumbo-ID: fe9c95f7-865c-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1728491943; x=1729096743; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HzpNoZNqPSyHc9i1i+Cka9r8/zmSyIAoPO8gugqQhPw=;
        b=HS8gBL/bbtYA5flWiySyOeZI4uo7J97roJc0Z70yxsHB+TdSaFD2g/3gMys8bxJUal
         vUOWC7cPHgp39GSxF6P6BsdsBKJKB+5jFbMQ8+e7nCZnyRu91AjB+PWVls9xmJ8WU65z
         ate6NSXIwA3GySDpEl+1kU7r3eW9xFAozriiA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728491943; x=1729096743;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HzpNoZNqPSyHc9i1i+Cka9r8/zmSyIAoPO8gugqQhPw=;
        b=ZQDVswu9kLMTdLtuJRWQ7kod1oCdQMFR78A+cpvbdRlTOmlXA/NOMDNZ52pykA2tI5
         ErOYqu5Z7u0ji+WdKCeUI/GgGxLUGISbpJ4hDmZNZwFsouN43LKP6ly66ELzpi4uec/t
         CQW/3NZ1kgn6yYRdnZAFmds9Q/WrU5VfG809W3jok+et5ukknB5cukj/YFA7uN2XaSHq
         pD88zbEQaUwz8ATXAFRdLXZoKxRMWLXADy5JLliYTVWX/r++7YfPJk+ttn9U1FsKr60+
         CeJcNRJXNGaKd0pNV9CXYv25WlkcJWnBSPVHtRmaRY/iOI3bDOmPROb3CK5D8qZMu4j8
         toMg==
X-Forwarded-Encrypted: i=1; AJvYcCWLSvN2HUeZ0tFn6EbICF1egtHSPAtwPpTJ3Ig30KvCttLT6alnt+S/OXFuaUUcW3JEPRdIa569uII=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzucgEWhn10/bnita6Oig7ifqvdKaI1Si3xJVGMufMdJSBfJJrX
	RHgfba4gbIo6MQKa2w6XoBGef93I8T5nK2bmsE0yFVDUSCLApmmtX0de/PTeL7I=
X-Google-Smtp-Source: AGHT+IG0CmBFiU1G+MEmMa/LdzLVa9jsaqOfQ4dLD4Z5AySWrmNgrCifD75+axzGGgUOOuZbDoGjWA==
X-Received: by 2002:a17:906:730b:b0:a99:5ea9:ad4e with SMTP id a640c23a62f3a-a998d10d135mr259844166b.13.1728491943338;
        Wed, 09 Oct 2024 09:39:03 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 09 Oct 2024 17:39:02 +0100
Message-Id: <D4RF986LYWQE.2IFU9N2CJYLFD@cloud.com>
Cc: =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, "Xen-devel"
 <xen-devel@lists.xenproject.org>, "Andrew Cooper"
 <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v6 03/11] xen/x86: Add initial x2APIC ID to the
 per-vLAPIC save area
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Jan Beulich" <jbeulich@suse.com>
X-Mailer: aerc 0.18.2
References: <20241001123807.605-1-alejandro.vallejo@cloud.com>
 <20241001123807.605-4-alejandro.vallejo@cloud.com>
 <c8b35378-d677-4c28-9304-530269178225@suse.com>
In-Reply-To: <c8b35378-d677-4c28-9304-530269178225@suse.com>

Hi,

On Wed Oct 9, 2024 at 2:12 PM BST, Jan Beulich wrote:
> On 01.10.2024 14:37, Alejandro Vallejo wrote:
> > @@ -311,18 +310,15 @@ void guest_cpuid(const struct vcpu *v, uint32_t l=
eaf,
> > =20
> >      case 0xb:
> >          /*
> > -         * In principle, this leaf is Intel-only.  In practice, it is =
tightly
> > -         * coupled with x2apic, and we offer an x2apic-capable APIC em=
ulation
> > -         * to guests on AMD hardware as well.
> > -         *
> > -         * TODO: Rework topology logic.
> > +         * Don't expose topology information to PV guests. Exposed on =
HVM
> > +         * along with x2APIC because they are tightly coupled.
> >           */
> > -        if ( p->basic.x2apic )
> > +        if ( is_hvm_domain(d) && p->basic.x2apic )
>
> This change isn't mentioned at all in the description, despite it having =
the
> potential of introducing a (perceived) regression. See the comments near =
the
> top of calculate_pv_max_policy() and near the top of
> domain_cpu_policy_changed(). What's wrong with ...
>
> >          {
> >              *(uint8_t *)&res->c =3D subleaf;
> > =20
> >              /* Fix the x2APIC identifier. */
> > -            res->d =3D v->vcpu_id * 2;
> > +            res->d =3D vlapic_x2apic_id(vcpu_vlapic(v));
>
> ...
>
>             res->d =3D is_hvm_domain(d) ? vlapic_x2apic_id(vcpu_vlapic(v)=
)
>                                       : v->vcpu_id * 2;
>
> ?

Hmmm. I haven't seem problems with PV guests, but that's a good point. Whil=
e I
suspect no PV guest would use this value for anything relevant (seeing how
there's no actual APIC), handing out zeroes might still have bad consequenc=
es.

Sure, I'll amend it.

>
> > --- a/xen/arch/x86/hvm/vlapic.c
> > +++ b/xen/arch/x86/hvm/vlapic.c
> > @@ -1090,7 +1090,7 @@ static uint32_t x2apic_ldr_from_id(uint32_t id)
> >  static void set_x2apic_id(struct vlapic *vlapic)
> >  {
> >      const struct vcpu *v =3D vlapic_vcpu(vlapic);
> > -    uint32_t apic_id =3D v->vcpu_id * 2;
> > +    uint32_t apic_id =3D vlapic->hw.x2apic_id;
>
> Any reason you're open-coding vlapic_x2apic_id() here and ...
>
> > @@ -1470,7 +1470,7 @@ void vlapic_reset(struct vlapic *vlapic)
> >      if ( v->vcpu_id =3D=3D 0 )
> >          vlapic->hw.apic_base_msr |=3D APIC_BASE_BSP;
> > =20
> > -    vlapic_set_reg(vlapic, APIC_ID, (v->vcpu_id * 2) << 24);
> > +    vlapic_set_reg(vlapic, APIC_ID, SET_xAPIC_ID(vlapic->hw.x2apic_id)=
);
>
> ... here?

Not a good one. vlapic_x2apic_id() exists mostly to allow self-contained
accesses from outside this translation unit. It makes no harm using the
accessor even inside, sure.

>
> Jan

Cheers,
Alejandro

