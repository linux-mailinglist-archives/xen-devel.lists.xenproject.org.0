Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13707A095D7
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jan 2025 16:37:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.869800.1281260 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWH3x-0007i7-SO; Fri, 10 Jan 2025 15:36:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 869800.1281260; Fri, 10 Jan 2025 15:36:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWH3x-0007ey-PT; Fri, 10 Jan 2025 15:36:41 +0000
Received: by outflank-mailman (input) for mailman id 869800;
 Fri, 10 Jan 2025 15:36:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mmVM=UC=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tWH3w-0007eo-S3
 for xen-devel@lists.xenproject.org; Fri, 10 Jan 2025 15:36:40 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aecb9e27-cf68-11ef-99a4-01e77a169b0f;
 Fri, 10 Jan 2025 16:36:38 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4361815b96cso16328245e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jan 2025 07:36:38 -0800 (PST)
Received: from localhost ([66.81.170.107]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e9d8fb99sm56218295e9.3.2025.01.10.07.36.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jan 2025 07:36:37 -0800 (PST)
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
X-Inumbo-ID: aecb9e27-cf68-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1736523398; x=1737128198; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S1ryMVl/qZS/jpcFHRhUv6+vaIZhN/DUNPGjMlSR+WE=;
        b=XWRyhYSPLMN0E9x9sEzGpRNtQOJZbydb9MRk9047F6Au/KW6KJOFK/kXMFUTQpZgMk
         gTzFCe8cJJG/1qDCYok86xHca8ULXlqoS8LrXemo7y7t+YczCmA0Jh0du0SKOhjXayQp
         AmD39FixJjlcxEIRgeplVqk3kKy78W1NjgWSg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736523398; x=1737128198;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=S1ryMVl/qZS/jpcFHRhUv6+vaIZhN/DUNPGjMlSR+WE=;
        b=FPOX2P7uQJy9a3o0TwHIoXFI3SJeHchgR8ACwlpLSyGyO58NAhp8lO/Sc9OGJLbhxx
         x6PwlqkfaC4AKZkhC7NLFI2RDILIcQGmNd0EMYatK0fbwi/CHYLYU5O4yUJA+rWX+W/O
         BkPkUPM7iXTWc568hkSZNI/g6BDaD3pX6cT1kHeQU4VNWwqaRfNGI/5WHBfynXvcjzga
         /RqEGryOSSKZbkryMzDJWrepvAajm9PD3NabMiKj+SLLeqBmS4LNDpIOvQX8xY1+7Wkn
         RSS8Ph8Qc6GJK2ihjT8w0VnZQ88Gpdoo1EXP4qivp/611xVWn1JhckJJy3ZxiedoJL9M
         OQBQ==
X-Gm-Message-State: AOJu0Yzku7fdtMVdur+y7wQZVPHC5uW2a7MQvgtS/hw9Eep5OiTVISbk
	x5bkrz9/R3ruW5Ac6jn2Ea0Ptd7/XOR6zinGcIjib5vjDzWyvhxnqJAKp5YlCA4cy+9HtIp1uTf
	3oAl0iQ==
X-Gm-Gg: ASbGncvJtrl52okte4dtGhFoGK7Pt6xEUgM5TMoay5iHhBlWgPusJlsyllAvNnXwJXI
	UtE2cObZu4JD4vzm2yV9kAF0Thtamy7fW8gwMRme+sBhElntr8Eeugb9Fn6JmxcXCKKWDaqpicT
	so8OHZlqpyAqEv4Q8sljFwPsT1cUdnEpsmQvJfwdYlf/OHGc9WvGfMi5AFy48nBB3a550fZv7Qe
	e/qkxGxuAVqHC/b3mDzZIDtG+R5mb54jBO0LgiOKoQC5xbYn+Mac3+v6ojO4/c=
X-Google-Smtp-Source: AGHT+IHvwlY5Mt/EUY+zHxQWGedl1tsYf6CHmFd3cE5G54HJmsba6AyEXR9urMk3pjaFfs7YQHOWyQ==
X-Received: by 2002:a05:6000:4611:b0:38a:624b:e619 with SMTP id ffacd0b85a97d-38a8730e03emr9987576f8f.43.1736523398269;
        Fri, 10 Jan 2025 07:36:38 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 10 Jan 2025 15:36:35 +0000
Message-Id: <D6YI62UU3U96.1YMORYP5SVE6Z@cloud.com>
Cc: <xen-devel@lists.xenproject.org>, "Jan Beulich" <jbeulich@suse.com>,
 "Andrew Cooper" <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 07/18] x86/pv: update guest LDT mappings using the
 linear entries
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
X-Mailer: aerc 0.18.2
References: <20250108142659.99490-1-roger.pau@citrix.com>
 <20250108142659.99490-8-roger.pau@citrix.com>
 <D6XM7OP0SQPB.3U12X09JAPKU3@cloud.com> <Z4EyWLde4lHH-2Sm@macbook.local>
In-Reply-To: <Z4EyWLde4lHH-2Sm@macbook.local>

On Fri Jan 10, 2025 at 2:44 PM GMT, Roger Pau Monn=C3=A9 wrote:
> On Thu, Jan 09, 2025 at 02:34:05PM +0000, Alejandro Vallejo wrote:
> > On Wed Jan 8, 2025 at 2:26 PM GMT, Roger Pau Monne wrote:
> > > The pv_map_ldt_shadow_page() and pv_destroy_ldt() functions rely on t=
he L1
> > > table(s) that contain such mappings being stashed in the domain struc=
ture, and
> > > thus such mappings being modified by merely updating the require L1 e=
ntries.
> > >
> > > Switch pv_map_ldt_shadow_page() to unconditionally use the linear rec=
ursive, as
> > > that logic is always called while the vCPU is running on the current =
pCPU.
> > >
> > > For pv_destroy_ldt() use the linear mappings if the vCPU is the one c=
urrently
> > > running on the pCPU, otherwise use destroy_mappings().
> > >
> > > Note this requires keeping an array with the pages currently mapped a=
t the LDT
> > > area, as that allows dropping the extra taken page reference when rem=
oving the
> > > mappings.
> > >
> > > Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> > > ---
> > >  xen/arch/x86/include/asm/domain.h   |  2 ++
> > >  xen/arch/x86/pv/descriptor-tables.c | 19 ++++++++++---------
> > >  xen/arch/x86/pv/domain.c            |  4 ++++
> > >  xen/arch/x86/pv/mm.c                |  3 ++-
> > >  4 files changed, 18 insertions(+), 10 deletions(-)
> > >
> > > diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include=
/asm/domain.h
> > > index b79d6badd71c..b659cffc7f81 100644
> > > --- a/xen/arch/x86/include/asm/domain.h
> > > +++ b/xen/arch/x86/include/asm/domain.h
> > > @@ -523,6 +523,8 @@ struct pv_vcpu
> > >      struct trap_info *trap_ctxt;
> > > =20
> > >      unsigned long gdt_frames[FIRST_RESERVED_GDT_PAGE];
> > > +    /* Max LDT entries is 8192, so 8192 * 8 =3D 64KiB (16 pages). */
> > > +    mfn_t ldt_frames[16];
> > >      unsigned long ldt_base;
> > >      unsigned int gdt_ents, ldt_ents;
> > > =20
> > > diff --git a/xen/arch/x86/pv/descriptor-tables.c b/xen/arch/x86/pv/de=
scriptor-tables.c
> > > index 5a79f022ce13..95b598a4c0cf 100644
> > > --- a/xen/arch/x86/pv/descriptor-tables.c
> > > +++ b/xen/arch/x86/pv/descriptor-tables.c
> > > @@ -20,28 +20,29 @@
> > >   */
> > >  bool pv_destroy_ldt(struct vcpu *v)
> > >  {
> > > -    l1_pgentry_t *pl1e;
> > > +    const unsigned int nr_frames =3D ARRAY_SIZE(v->arch.pv.ldt_frame=
s);
> > >      unsigned int i, mappings_dropped =3D 0;
> > > -    struct page_info *page;
> > > =20
> > >      ASSERT(!in_irq());
> > > =20
> > >      ASSERT(v =3D=3D current || !vcpu_cpu_dirty(v));
> > > =20
> > > -    pl1e =3D pv_ldt_ptes(v);
> > > +    destroy_perdomain_mapping(v, LDT_VIRT_START(v), nr_frames);
> > > =20
> > > -    for ( i =3D 0; i < 16; i++ )
> > > +    for ( i =3D 0; i < nr_frames; i++ )
> >=20
> > nit: While at this, can the "unsigned int" be moved here too?
>
> I don't mind much, but I also don't usually do such changes as I think
> it adds more noise.

Fair enough, nvm then.

>
> > >      {
> > > -        if ( !(l1e_get_flags(pl1e[i]) & _PAGE_PRESENT) )
> > > -            continue;
> > > +        mfn_t mfn =3D v->arch.pv.ldt_frames[i];
> > > +        struct page_info *page;
> > > =20
> > > -        page =3D l1e_get_page(pl1e[i]);
> > > -        l1e_write(&pl1e[i], l1e_empty());
> > > -        mappings_dropped++;
> > > +        if ( mfn_eq(mfn, INVALID_MFN) )
> > > +            continue;
> >=20
> > Can it really be disjoint? As in, why "continue" and not "break"?. Not =
that it
> > matters in the slightest, and I prefer this form; but I'm curious.
>
> I think so?  The PV guest LDT is populated as a result of page-faults,
> so if the guest only happens to use segment descriptors that are on
> the third page, the second page might not be mapped?
>
> The continue was there already, and I really didn't dare to change
> this, neither asked myself much.  Assumed due to how the guest LDT is
> mapped on a page-fault basis it could indeed be disjointly mapped.

Ah, I see. That makes sense then. I wouldn't suggest changing it either, I
was just curious :)

>
> > > =20
> > > +        v->arch.pv.ldt_frames[i] =3D INVALID_MFN;
> > > +        page =3D mfn_to_page(mfn);
> > >          ASSERT_PAGE_IS_TYPE(page, PGT_seg_desc_page);
> > >          ASSERT_PAGE_IS_DOMAIN(page, v->domain);
> > >          put_page_and_type(page);
> > > +        mappings_dropped++;
> > >      }
> > > =20
> > >      return mappings_dropped;
> > > diff --git a/xen/arch/x86/pv/domain.c b/xen/arch/x86/pv/domain.c
> > > index 7e8bffaae9a0..32d7488cc186 100644
> > > --- a/xen/arch/x86/pv/domain.c
> > > +++ b/xen/arch/x86/pv/domain.c
> > > @@ -303,6 +303,7 @@ void pv_vcpu_destroy(struct vcpu *v)
> > >  int pv_vcpu_initialise(struct vcpu *v)
> > >  {
> > >      struct domain *d =3D v->domain;
> > > +    unsigned int i;
> > >      int rc;
> > > =20
> > >      ASSERT(!is_idle_domain(d));
> > > @@ -311,6 +312,9 @@ int pv_vcpu_initialise(struct vcpu *v)
> > >      if ( rc )
> > >          return rc;
> > > =20
> > > +    for ( i =3D 0; i < ARRAY_SIZE(v->arch.pv.ldt_frames); i++ )
> > > +        v->arch.pv.ldt_frames[i] =3D INVALID_MFN;
> > > +
> >=20
> > I think it makes more sense to move this earlier so ldt_frames[] is ini=
tialised
> > even if pv_vcpu_initialise() fails. It may be benign, but it looks like=
 an
> > accident abount to happen.
>
> Right, pv_destroy_gdt_ldt_l1tab() doesn't care at all about the
> contents of ldt_frames[], but it will be safe to do change the
> ordering in pv_vcpu_initialise().
>
> Thanks, Roger.

Cheers,
Alejandro

