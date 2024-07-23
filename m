Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1DF093A4F4
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2024 19:29:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.763431.1173703 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWJJM-0006v4-KP; Tue, 23 Jul 2024 17:28:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 763431.1173703; Tue, 23 Jul 2024 17:28:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWJJM-0006sX-Gd; Tue, 23 Jul 2024 17:28:28 +0000
Received: by outflank-mailman (input) for mailman id 763431;
 Tue, 23 Jul 2024 17:28:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v/3h=OX=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sWJJL-0006sP-FJ
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2024 17:28:27 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f78f34d5-4918-11ef-8776-851b0ebba9a2;
 Tue, 23 Jul 2024 19:28:25 +0200 (CEST)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-52efc60a6e6so4723544e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jul 2024 10:28:25 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7aa6fea966sm33434466b.223.2024.07.23.10.28.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jul 2024 10:28:24 -0700 (PDT)
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
X-Inumbo-ID: f78f34d5-4918-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721755705; x=1722360505; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KC/kVP5leGBWfFNk3ux16WqZBf+9M++3iWG5hoC03UM=;
        b=h0AoCXxwlPjhfAozQOUgpIZGBxi7/Wmy0rg9oDM6wmQ+9nnlB8TJ7dcFmpIXhpP2vu
         Y+43UliO/7frGswzG0HSBNirHeh2PRHovn/M4sw0LWaHU6cMl6PI2zACbP9Q6hAJZjVF
         tTPxFgC02e7Qtss5LteNCsmZ3L/E302xQ6eDsFCgvrkz0mkK8wOe7DybksiiWxqF0TkN
         IrcP2P0iPkjiUKszIjoU1893a63ci4w7WRZZz21tDPC7kOKClRe33PzAa6uWWLh0z2yR
         JtjIbq2Dm2Vpgd/u+h6T6PYOY3+7FBCil/Rd/ewK2G8hbENnK0HS2UfvFr4/Lk+/fH3I
         fMsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721755705; x=1722360505;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KC/kVP5leGBWfFNk3ux16WqZBf+9M++3iWG5hoC03UM=;
        b=S40giF1MBygXORmCh71z+YCeLI33gGc/pU4iPQSr4znwJiR1cpYJRD/61X+zN6N3kl
         6ilgXgNkrvSnn/511f5FgChGXR03GpAVP5cquocJiIHWjUrjMuylycylUAd007nI8lgw
         D78wIGViETSHbVZOGwF9PU8lnqvE/KIm2s4tmeYXkIuO5XEHGaYb1ifKbcWJ+9RR6/Nl
         k30XVPi0W+Ci2bEwMjbEV37OuL2V47yVbNZWujKC8j0gJGiIo2yRy9KUczjzaEyGZXLF
         CfELjEETeJKV/4S9kH+090NvDnOvuxnTJsnoFNcV6/4Pum8Fcpv74NkTAcsLExppAQW1
         iQIw==
X-Forwarded-Encrypted: i=1; AJvYcCW7qXtfWgAMAvET3RAkzNhIXk6A1RF/moJyNziRC396JxxNATPQ/2VX5qch0Dr3U3NMP6Y1LevhdwCpCwwfCqC6Mtp9z6AM2/OAwT03TvU=
X-Gm-Message-State: AOJu0YyxSRjhbQawHSOm4F8zyJRngTVG+PpO+gOibQYAzX4wwKocvKuT
	JNtSNctaXrlf240iO3P6/tGs1+UH2Ya50cSmn7g+szmrP3HRgnNe
X-Google-Smtp-Source: AGHT+IE2dmPD/QI6urB2SUsb4+WoQTQxtaJ10NsDDB8p+izqieGL77On/0LTbV7D473ug2kbLQJDuw==
X-Received: by 2002:a05:6512:12c4:b0:52c:86de:cb61 with SMTP id 2adb3069b0e04-52fcda2168fmr222678e87.10.1721755704613;
        Tue, 23 Jul 2024 10:28:24 -0700 (PDT)
Message-ID: <f3cf8cbfd02f5889e498a8046ca24141a8ceb010.camel@gmail.com>
Subject: Re: [PATCH v2 5/8] xen/riscv: introduce asm/pmap.h header
From: oleksii.kurochko@gmail.com
To: Julien Grall <julien@xen.org>
Cc: Jan Beulich <jbeulich@suse.com>, Alistair Francis
 <alistair.francis@wdc.com>,  Bob Eshleman <bobbyeshleman@gmail.com>, Connor
 Davis <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,  xen-devel@lists.xenproject.org
Date: Tue, 23 Jul 2024 19:28:23 +0200
In-Reply-To: <29c8b24ecd240268caa64ddcc590188ec3e80cd1.camel@gmail.com>
References: <cover.1720799925.git.oleksii.kurochko@gmail.com>
	 <c7331e4c2f481f069571976a708c4aba04d2c0e4.1720799926.git.oleksii.kurochko@gmail.com>
	 <6458c61d-5974-41c2-a1e6-76e4a15a487a@suse.com>
	 <54af6fb751da1103054de2d79a2057bec658f399.camel@gmail.com>
	 <623da862-8e76-4d40-9aa9-b02c8fd9944d@xen.org>
	 <a53ef38e044db149bb37b70f1e56a33c6a3e7c83.camel@gmail.com>
	 <26ae01e2-d085-48d7-8b1f-da1e44b01e53@xen.org>
	 <CAMacjJwWLjGcFbYEhCPyNEW_+sfb51+XtKqyBcc2JGm=D5bf0w@mail.gmail.com>
	 <97c82aca-0b8a-4b78-980b-0857dbdae80a@suse.com>
	 <4c9eb7a79c33c7cd2f6bde05b1fbc7770e662026.camel@gmail.com>
	 <14ffb00d-d6ba-4c18-88c1-2601a2df8a8b@suse.com>
	 <b7e248ae79aaded532d86453520fcb4cb7a7fb3b.camel@gmail.com>
	 <9baa3203-b8d0-4774-a2a5-7ba61b213f1c@xen.org>
	 <29c8b24ecd240268caa64ddcc590188ec3e80cd1.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3 (3.52.3-1.fc40app2) 
MIME-Version: 1.0

On Tue, 2024-07-23 at 19:25 +0200, oleksii.kurochko@gmail.com wrote:
> On Tue, 2024-07-23 at 16:49 +0100, Julien Grall wrote:
> > Hi Oleksii,
> >=20
> > On 23/07/2024 16:36, oleksii.kurochko@gmail.com=C2=A0wrote:
> > > On Tue, 2024-07-23 at 12:02 +0200, Jan Beulich wrote:
> > > > On 23.07.2024 10:55, oleksii.kurochko@gmail.com=C2=A0wrote:
> > > > > On Tue, 2024-07-23 at 10:36 +0200, Jan Beulich wrote:
> > > > > > On 23.07.2024 10:02, Oleksii Kurochko wrote:
> > > > > > > On Mon, Jul 22, 2024 at 7:27=E2=80=AFPM Julien Grall
> > > > > > > <julien@xen.org>
> > > > > > > wrote:
> > > > > > > > > > On 22/07/2024 15:44, Oleksii Kurochko wrote:
> > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0 /* Map a 4k page in a fixmap ent=
ry */
> > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0 void set_fixmap(unsigned map, mf=
n_t mfn,
> > > > > > > > > unsigned
> > > > > > > > > int
> > > > > > > > > flags)
> > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0 {
> > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pte_t pt=
e;
> > > > > > > > >=20
> > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pte =3D =
mfn_to_xen_entry(mfn, flags);
> > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pte.pte =
|=3D PTE_LEAF_DEFAULT;
> > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 write_pt=
e(&xen_fixmap[pt_index(0,
> > > > > > > > > FIXMAP_ADDR(map))],
> > > > > > > > > pte);
> > > > > > > >=20
> > > > > > > > It would be saner to check if you are not overwriting
> > > > > > > > any
> > > > > > > > existing
> > > > > > > > mapping as otherwise you will probably need a TLB
> > > > > > > > flush.
> > > > > > > >=20
> > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0 }
> > > > > > > > >=20
> > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0 /* Remove a mapping from a fixma=
p entry */
> > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0 void clear_fixmap(unsigned map)
> > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0 {
> > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pte_t pt=
e =3D {0};
> > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 write_pt=
e(&xen_fixmap[pt_index(0,
> > > > > > > > > FIXMAP_ADDR(map))],
> > > > > > > > > pte);
> > > > > > > >=20
> > > > > > > > Don't you need a TLB flush?
> > > > > > > >=20
> > > > > > > Inside write_pte() there is "sfence.vma".
> > > > > >=20
> > > > > > That's just a fence though, not a TLB flush.
> > > > > =C2=A0From the privileged doc:
> > > > > =C2=A0=C2=A0=C2=A0 ```
> > > > > =C2=A0=C2=A0=C2=A0 SFENCE.VMA is also used to invalidate entries =
in the
> > > > > =C2=A0=C2=A0=C2=A0 address-translation cache associated with a ha=
rt (see
> > > > > Section
> > > > > 4.3.2).
> > > > > =C2=A0=C2=A0=C2=A0 ...
> > > > > =C2=A0=C2=A0=C2=A0 The SFENCE.VMA is used to flush any local hard=
ware caches
> > > > > related to
> > > > > =C2=A0=C2=A0=C2=A0 address translation.
> > > > > =C2=A0=C2=A0=C2=A0 It is specified as a fence rather than a TLB f=
lush to
> > > > > provide
> > > > > cleaner
> > > > > =C2=A0=C2=A0=C2=A0 semantics with respect to
> > > > > =C2=A0=C2=A0=C2=A0 which instructions are affected by the flush o=
peration
> > > > > and
> > > > > to
> > > > > support a
> > > > > =C2=A0=C2=A0=C2=A0 wider variety of dynamic
> > > > > =C2=A0=C2=A0=C2=A0 caching structures and memory-management schem=
es.
> > > > > SFENCE.VMA is
> > > > > also
> > > > > =C2=A0=C2=A0=C2=A0 used by higher
> > > > > =C2=A0=C2=A0=C2=A0 privilege levels to synchronize page table wri=
tes and the
> > > > > address
> > > > > =C2=A0=C2=A0=C2=A0 translation hardware.
> > > > > =C2=A0=C2=A0=C2=A0 ...
> > > > > =C2=A0=C2=A0=C2=A0 ```
> > > > > I read this as SFENCE.VMA is used not only for ordering of
> > > > > load/stores,
> > > > > but also to flush TLB ( which is a type of more general term
> > > > > as
> > > > > address-translation cache, IIUIC ).
> > I have to admit, I am a little because concerned with calling
> > sfence.vma=20
> > in write_pte() (this may only be because I am not very familiar
> > with=20
> > RISC-V).
> >=20
> > We have cases where multiple entry will be written in a single=20
> > map_pages_to_xen() call. So wouldn't this means that the local TLBs
> > would be nuked for every write rather than once?
> Yes, it will be nuked. It is bad from perfomance point of view.
> I just wanted to be sure that I won't miss to put sfence.vma when it
> is
> necessary and then reworked that a little bit after. But it seems it
> would be better not to call sfence.vma in write_pte() just from the
> start.
>=20
>=20
> >=20
> >=20
> > > >=20
> > > > Oh, I see. Kind of unexpected for an instruction of that name.
> > > > Yet
> > > > note
> > > > how they talk about the local hart only. You need a wider scope
> > > > TLB
> > > > flush here.
> > > Could you please clarify why it is needed wider?
> > >=20
> > > Arm Xen flushed only local TLB.
> >=20
> > Which code are you looking at? set_fixmap() will propagate the TLB
> > flush=20
> > to all innershareable CPUs.
> Yes, here I agree that set_fixmap() uses map_pages_to_xen which
> somewhere inside uses flush_xen_tlb_range_va() ( not
> flush_xen_tlb_range_va() ) so TLB flush will happen for all
> innershareable CPUs.
> >=20
> > The PMAP interface will do a local TLB flush because the interface
> > can=20
> > only be used during early boot where there is a single CPU running.
>=20
> Yes, I am looking at PMAP:
> =C2=A0=C2=A0 static inline void arch_pmap_unmap(unsigned int slot)
> =C2=A0=C2=A0 {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 lpae_t pte =3D {};
> =C2=A0=C2=A0=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 write_pte(&xen_fixmap[slot], pte);
> =C2=A0=C2=A0=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 flush_xen_tlb_range_va(FIXMAP_ADDR(s=
lot), PAGE_SIZE);
> =C2=A0=C2=A0 }
> IIUC, originaly Jan told about arch_pmap_unmap() case so that is why
> I
> decided to clarify additionaly.

Julien,
I have a questation related to Arm's version of arch_pmap_map():

   static inline void arch_pmap_map(unsigned int slot, mfn_t mfn)
   {
       lpae_t *entry =3D &xen_fixmap[slot];
       lpae_t pte;
  =20
       ASSERT(!lpae_is_valid(*entry));
  =20
       pte =3D mfn_to_xen_entry(mfn, PAGE_HYPERVISOR_RW);
       pte.pt.table =3D 1;
       write_pte(entry, pte);
       /*
        * The new entry will be used very soon after arch_pmap_map()
   returns.
        * So ensure the DSB in write_pte() has completed before
   continuing.
        */
       isb();
   }
  =20
Is the code above isb() is correct? is it insure the DSB not ISB?
And isn't need to do TLB flush here?

~ Oleksii


>=20
> >=20
> > > RISC-V Linux kernel for fixmap also uses: local_flush_tlb_page().
> >=20
> > I don't know how Linux is using set_fixmap(). But what matters is
> > how
> > Xen is using set_fixmap(). We have a couple of places in Xen where
> > the=20
> > fixmap needs to be accessed by all the CPUs.
> >=20
> > Given this is a common interface in Xen, I think it makes sense to=20
> > follow the same approach to avoid any confusion.
> Sure. Thanks for claryfying. I will flush_xen_tlb_range_va() for
> set_fixmap().
>=20
>=20
> ~ Oleksii


