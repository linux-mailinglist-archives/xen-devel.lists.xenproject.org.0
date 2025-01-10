Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D68A09669
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jan 2025 16:50:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.869814.1281269 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWHHC-0002NR-4U; Fri, 10 Jan 2025 15:50:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 869814.1281269; Fri, 10 Jan 2025 15:50:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWHHC-0002Kr-0q; Fri, 10 Jan 2025 15:50:22 +0000
Received: by outflank-mailman (input) for mailman id 869814;
 Fri, 10 Jan 2025 15:50:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mmVM=UC=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tWHHB-0002Kl-2y
 for xen-devel@lists.xenproject.org; Fri, 10 Jan 2025 15:50:21 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 97db49b0-cf6a-11ef-a0df-8be0dac302b0;
 Fri, 10 Jan 2025 16:50:19 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3863c36a731so1627957f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jan 2025 07:50:19 -0800 (PST)
Received: from localhost ([66.81.170.107]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e9e37d3bsm55461245e9.31.2025.01.10.07.50.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jan 2025 07:50:18 -0800 (PST)
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
X-Inumbo-ID: 97db49b0-cf6a-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1736524219; x=1737129019; darn=lists.xenproject.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tUhxXZYEiIjTZLGclIWnxltqQKbyORiavFv7JaFGlNs=;
        b=PAY8c59n38d9cu9/E3q4re++RkjqhAhhoKL2a7Jx2FZ6xL+k4w/ZRatxaY7zSyppH+
         3+jx0yfMuBZeybdlj944W11dGfRja7Sag12wsha0EVSTV+I5PkxZBpexK6WMcoiJ3xZO
         osZTM3rmOKSJkbfvCrYd6QYnuNIRBvsqphtuw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736524219; x=1737129019;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tUhxXZYEiIjTZLGclIWnxltqQKbyORiavFv7JaFGlNs=;
        b=p+RrRFLK8lbEJBp/JLVbXAO6W6norN6/b+8OV+vaYAvTrBCoPNkcWe/Jz7aKTYyFeU
         EHeprTcguT97VjZ164ItFntqja8FxMAg/VajjS7fep9x8oIwIhc1GvEtrai6tKi+6AgR
         EUGV1PbpOw1G54qUJsjiz9uqfs4m9pqNhqpj4KG1cOcrIZ2J7JymPmrr+2GjZuMZjQk8
         Pef48h45LEuNrG3nUtUksgp25cdIm9LDFU7Lq3Qj48vL5dJOgNxzFP6+faGs/rDeQReY
         jMHDHGST8gN1qb2sc4G14Jx2gzonBUrJAX+y8Su23oC8V03XZcQgXl9DDFvN7WvvPB6p
         DeXQ==
X-Gm-Message-State: AOJu0YwxAPtX6LaeBnmbxd+QXN+IxFbWMjWb0zf3BPXEsmxYss2Ucu/y
	Y9u2IsN/1K723aiCplk8OxIF3EKKAQXV1RY2V+OO1mADgJsCMam1BGrzVB8GU+c=
X-Gm-Gg: ASbGncuRx0hLh5jeahyABnIhqUncXi/s5/eHo9T1ZiqUqgJL73Z5RuNHqBVzMSQoh3t
	l7Yj5qd2uGyoGkfG4KwcGzZ0vjwEQNgW+JXNZb8Nm4bNKFGy2u58TxCVHFhdCwBhY9MD6pejkMn
	qDy14ZoNVRmR9p7WTR0MJDFcQTdNDE6AgJlwKiuIz6ulcmsj5FNgOuAAOijuXSSSmBEJeWyMESR
	caLMLBFZxQiRsxqU6SX0AREKEVrFoQO1ycWQA4Jrp5lEBfy/Xb9ajdhCS7idQU=
X-Google-Smtp-Source: AGHT+IFOX73b3dv0QYzSDXgeve5p/cyhZ+80hgt2N6us0ApzB+YFUyV6o7OdOvgJldGH8+zn+rPO5w==
X-Received: by 2002:a5d:6d84:0:b0:385:ecdf:a30a with SMTP id ffacd0b85a97d-38a873140f6mr10342329f8f.33.1736524218821;
        Fri, 10 Jan 2025 07:50:18 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 10 Jan 2025 15:50:17 +0000
Message-Id: <D6YIGKABLDGN.J7DROWZ0H7BK@cloud.com>
To: =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: <xen-devel@lists.xenproject.org>, "Jan Beulich" <jbeulich@suse.com>,
 "Andrew Cooper" <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 04/18] x86/pv: introduce function to populate
 perdomain area and use it to map Xen GDT
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
X-Mailer: aerc 0.18.2
References: <20250108142659.99490-1-roger.pau@citrix.com>
 <20250108142659.99490-5-roger.pau@citrix.com>
 <D6XGAK96L261.324ZJ1U3UO8LF@cloud.com> <Z4Eur-PNej2JQAm_@macbook.local>
In-Reply-To: <Z4Eur-PNej2JQAm_@macbook.local>

On Fri Jan 10, 2025 at 2:29 PM GMT, Roger Pau Monn=C3=A9 wrote:
> On Thu, Jan 09, 2025 at 09:55:44AM +0000, Alejandro Vallejo wrote:
> > On Wed Jan 8, 2025 at 2:26 PM GMT, Roger Pau Monne wrote:
> > > The current code to update the Xen part of the GDT when running a PV =
guest
> > > relies on caching the direct map address of all the L1 tables used to=
 map the
> > > GDT and LDT, so that entries can be modified.
> > >
> > > Introduce a new function that populates the per-domain region, either=
 using the
> > > recursive linear mappings when the target vCPU is the current one, or=
 by
> > > directly modifying the L1 table of the per-domain region.
> > >
> > > Using such function to populate per-domain addresses drops the need t=
o keep a
> > > reference to per-domain L1 tables previously used to change the per-d=
omain
> > > mappings.
> > >
> > > Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> > > ---
> > >  xen/arch/x86/domain.c                | 11 +++-
> > >  xen/arch/x86/include/asm/desc.h      |  6 +-
> > >  xen/arch/x86/include/asm/mm.h        |  2 +
> > >  xen/arch/x86/include/asm/processor.h |  5 ++
> > >  xen/arch/x86/mm.c                    | 88 ++++++++++++++++++++++++++=
++
> > >  xen/arch/x86/smpboot.c               |  6 +-
> > >  xen/arch/x86/traps.c                 | 10 ++--
> > >  7 files changed, 113 insertions(+), 15 deletions(-)
> > >
> > > diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
> > > index 1f680bf176ee..0bd0ef7e40f4 100644
> > > --- a/xen/arch/x86/domain.c
> > > +++ b/xen/arch/x86/domain.c
> > > @@ -1953,9 +1953,14 @@ static always_inline bool need_full_gdt(const =
struct domain *d)
> > > =20
> > >  static void update_xen_slot_in_full_gdt(const struct vcpu *v, unsign=
ed int cpu)
> > >  {
> > > -    l1e_write(pv_gdt_ptes(v) + FIRST_RESERVED_GDT_PAGE,
> > > -              !is_pv_32bit_vcpu(v) ? per_cpu(gdt_l1e, cpu)
> > > -                                   : per_cpu(compat_gdt_l1e, cpu));
> > > +    ASSERT(v !=3D current);
> >=20
> > For this assert, and others below. IIUC, curr_vcpu =3D=3D current when =
we're
> > properly switched. When we're idling current =3D=3D idle and curr_vcpu =
=3D=3D prev_ctx.
> >=20
> > Granted, calling this in the middle of a lazy idle loop would be weird,=
 but
> > would it make sense for PT consistency to use curr_vcpu here...
>
> Hm, this function is called in a very specific context, and the assert
> intends to reflect that.  TBH I could just drop it, as
> populate_perdomain_mapping() will DTRT also when v =3D=3D current. The
> expectation for the context is also that current =3D=3D curr_vcpu.
>
> Note however that if v =3D=3D current we would need a flush after the
> populate_perdomain_mapping() call, since populate_perdomain_mapping()
> doesn't perform any flushing of the modified entries.  The main
> purpose of the ASSERT() is to notice this.
>
> > > +
> > > +    populate_perdomain_mapping(v,
> > > +                               GDT_VIRT_START(v) +
> > > +                               (FIRST_RESERVED_GDT_PAGE << PAGE_SHIF=
T),
> > > +                               !is_pv_32bit_vcpu(v) ? &per_cpu(gdt_m=
fn, cpu)
> > > +                                                    : &per_cpu(compa=
t_gdt_mfn,
> > > +                                                               cpu),=
 1);
> > >  }
> > > =20
> > >  static void load_full_gdt(const struct vcpu *v, unsigned int cpu)
> > > diff --git a/xen/arch/x86/include/asm/desc.h b/xen/arch/x86/include/a=
sm/desc.h
> > > index a1e0807d97ed..33981bfca588 100644
> > > --- a/xen/arch/x86/include/asm/desc.h
> > > +++ b/xen/arch/x86/include/asm/desc.h
> > > @@ -44,6 +44,8 @@
> > > =20
> > >  #ifndef __ASSEMBLY__
> > > =20
> > > +#include <xen/mm-frame.h>
> > > +
> > >  #define GUEST_KERNEL_RPL(d) (is_pv_32bit_domain(d) ? 1 : 3)
> > > =20
> > >  /* Fix up the RPL of a guest segment selector. */
> > > @@ -212,10 +214,10 @@ struct __packed desc_ptr {
> > > =20
> > >  extern seg_desc_t boot_gdt[];
> > >  DECLARE_PER_CPU(seg_desc_t *, gdt);
> > > -DECLARE_PER_CPU(l1_pgentry_t, gdt_l1e);
> > > +DECLARE_PER_CPU(mfn_t, gdt_mfn);
> > >  extern seg_desc_t boot_compat_gdt[];
> > >  DECLARE_PER_CPU(seg_desc_t *, compat_gdt);
> > > -DECLARE_PER_CPU(l1_pgentry_t, compat_gdt_l1e);
> > > +DECLARE_PER_CPU(mfn_t, compat_gdt_mfn);
> > >  DECLARE_PER_CPU(bool, full_gdt_loaded);
> > > =20
> > >  static inline void lgdt(const struct desc_ptr *gdtr)
> > > diff --git a/xen/arch/x86/include/asm/mm.h b/xen/arch/x86/include/asm=
/mm.h
> > > index 6c7e66ee21ab..b50a51327b2b 100644
> > > --- a/xen/arch/x86/include/asm/mm.h
> > > +++ b/xen/arch/x86/include/asm/mm.h
> > > @@ -603,6 +603,8 @@ int compat_arch_memory_op(unsigned long cmd, XEN_=
GUEST_HANDLE_PARAM(void) arg);
> > >  int create_perdomain_mapping(struct domain *d, unsigned long va,
> > >                               unsigned int nr, l1_pgentry_t **pl1tab,
> > >                               struct page_info **ppg);
> > > +void populate_perdomain_mapping(const struct vcpu *v, unsigned long =
va,
> > > +                                mfn_t *mfn, unsigned long nr);
> > >  void destroy_perdomain_mapping(struct domain *d, unsigned long va,
> > >                                 unsigned int nr);
> > >  void free_perdomain_mappings(struct domain *d);
> > > diff --git a/xen/arch/x86/include/asm/processor.h b/xen/arch/x86/incl=
ude/asm/processor.h
> > > index d247ef8dd226..82ee89f736c2 100644
> > > --- a/xen/arch/x86/include/asm/processor.h
> > > +++ b/xen/arch/x86/include/asm/processor.h
> > > @@ -243,6 +243,11 @@ static inline unsigned long cr3_pa(unsigned long=
 cr3)
> > >      return cr3 & X86_CR3_ADDR_MASK;
> > >  }
> > > =20
> > > +static inline mfn_t cr3_mfn(unsigned long cr3)
> > > +{
> > > +    return maddr_to_mfn(cr3_pa(cr3));
> > > +}
> > > +
> > >  static inline unsigned int cr3_pcid(unsigned long cr3)
> > >  {
> > >      return IS_ENABLED(CONFIG_PV) ? cr3 & X86_CR3_PCID_MASK : 0;
> > > diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
> > > index 3d5dd22b6c36..0abea792486c 100644
> > > --- a/xen/arch/x86/mm.c
> > > +++ b/xen/arch/x86/mm.c
> > > @@ -6423,6 +6423,94 @@ int create_perdomain_mapping(struct domain *d,=
 unsigned long va,
> > >      return rc;
> > >  }
> > > =20
> > > +void populate_perdomain_mapping(const struct vcpu *v, unsigned long =
va,
> > > +                                mfn_t *mfn, unsigned long nr)
> > > +{
> > > +    l1_pgentry_t *l1tab =3D NULL, *pl1e;
> > > +    const l3_pgentry_t *l3tab;
> > > +    const l2_pgentry_t *l2tab;
> > > +    struct domain *d =3D v->domain;
> > > +
> > > +    ASSERT(va >=3D PERDOMAIN_VIRT_START &&
> > > +           va < PERDOMAIN_VIRT_SLOT(PERDOMAIN_SLOTS));
> > > +    ASSERT(!nr || !l3_table_offset(va ^ (va + nr * PAGE_SIZE - 1)));
> > > +
> > > +    /* Use likely to force the optimization for the fast path. */
> > > +    if ( likely(v =3D=3D current) )
> >=20
> > ... and here? In particular I'd expect using curr_vcpu here means...
>
> I'm afraid not, this is a trap I've fallen originally when doing this
> series, as I indeed had v =3D=3D curr_vcpu here (and no
> sync_local_execstate() call).
>
> However as a result of an interrupt, a call to sync_local_execstate()
> might happen, at which point the previous check of v =3D=3D curr_vcpu
> becomes stale.

Wow, that's nasty! More than fair enough then. Guess the XSAVE wrappers (an=
d
more generally all vCPU-local memory accessors) will have to take this into
account before poking into the contents of the perdomain region.

>
> > > +    {
> > > +        unsigned int i;
> > > +
> > > +        /* Ensure page-tables are from current (if current !=3D curr=
_vcpu). */
> > > +        sync_local_execstate();
> >=20
> > ... this should not be needed.
>
> As kind of mentioned above, this is required to ensure the page-tables
> are in-sync with the vCPU in current, and cannot change as a result of
> an interrupt triggering a call to sync_local_execstate().
>
> Otherwise the page-tables could change while or after the call to
> populate_perdomain_mapping(), and the mappings could end up being
> created on the wrong page-tables.
>
> Thanks, Roger.

Cheers,
Alejandro

