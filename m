Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE799B7B91
	for <lists+xen-devel@lfdr.de>; Thu, 31 Oct 2024 14:20:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.828683.1243658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6V50-0007Ki-Pf; Thu, 31 Oct 2024 13:19:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 828683.1243658; Thu, 31 Oct 2024 13:19:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6V50-0007IO-Lp; Thu, 31 Oct 2024 13:19:14 +0000
Received: by outflank-mailman (input) for mailman id 828683;
 Thu, 31 Oct 2024 13:19:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=khX/=R3=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1t6V4z-0007Hq-H3
 for xen-devel@lists.xenproject.org; Thu, 31 Oct 2024 13:19:13 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b6553012-978a-11ef-99a3-01e77a169b0f;
 Thu, 31 Oct 2024 14:19:09 +0100 (CET)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-539fe02c386so1834536e87.0
 for <xen-devel@lists.xenproject.org>; Thu, 31 Oct 2024 06:19:09 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53c7bde3376sm196039e87.292.2024.10.31.06.19.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Oct 2024 06:19:07 -0700 (PDT)
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
X-Inumbo-ID: b6553012-978a-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoxMmUiLCJoZWxvIjoibWFpbC1sZjEteDEyZS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImI2NTUzMDEyLTk3OGEtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwMzgwNzQ5LjM1NzQ1Nywic2VuZGVyIjoib2xla3NpaS5rdXJvY2hrb0BnbWFpbC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730380749; x=1730985549; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=h1jKEF9vIzFBNQxbeI9MOUWtJY7wHKKC0+/cA9iQv5c=;
        b=al55euI17IFF5pVnrBmmj2Q2BQeTMf4pyn3XedJRzq70qGKrBRrKSUk+ebJxi3O0Ao
         QOfa20M96oVkLD/3X8XoEhL+dwOCNJcj6/uZPiKwL7lCaB1ZpuIlkgX0D5DYo6otwrh1
         JxgUIEwkTjacCAK7wkowRfJbvJfyrJPt6aIG2dr1R11LokyyMcbFYau50FNtolk5TvNa
         fq72sKgZ77pJB+A1rQNKr1+Isvh3Ru9+n/SZca3rLoANdgGYdghSDm+e3HGa2gPwVyvS
         tZ/ttDA09Z8QO19pGeTkRW1yoMecjlwFdDJPz2viZudyjvQ4ky65oZ9Ie4ek9qTYMeqs
         iNkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730380749; x=1730985549;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h1jKEF9vIzFBNQxbeI9MOUWtJY7wHKKC0+/cA9iQv5c=;
        b=MNEqZfFQ1r5XWbikXPLRwQjRZp26FencG/Q0YEwftn408MlaFCvnPMeAFtzopUVmpo
         cziamL9HRewBQjtG9uLRydOeXsIYZutFnHryIQSUPM4flD7/Ok9EvdrM18Vd1ADty3uY
         wTgxdcXoeBx7v1GKVcSJRpN3qvYMKVtkUGrX4bc3heeYemSiEk/MVXMO/fZWxZsmwzMH
         uz3fEFd53Cgmx6n75HbierFhV058uh5qnikM5ho0RrF2q4GK5tfKsD32PkCZHdTylBsj
         tllL2GZ7Q01x8PVZlKSF0ucP65wMA1kO9VBXyLdbP3L07e+PpDylOSfpB66Gl0HfivNN
         wC8A==
X-Forwarded-Encrypted: i=1; AJvYcCVCPrWa7uVm0ik7hRjJDTLxXKi7m5SAbYc8NEO9a5LCGCwj4Jbqj3waVkUeneYu0bdoDP+A7p0qPIk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzEtNz0d6Ki7HiuNwIwnrp+pbYO/D0PluGsn9pK+s49px91dzAY
	/2zoMnguVdIb3p+RSFp5B7EE2ZQpxE1yClv8IbZtvwvd+G11MRju
X-Google-Smtp-Source: AGHT+IFQmxTSyAkCvMFHPC8uUAzkW6gY3mZAfEQfLGdsQl4bxjUylZJW3EgOY7Pps+TfZYiOSM485g==
X-Received: by 2002:a05:6512:ea8:b0:539:f6b1:2d05 with SMTP id 2adb3069b0e04-53c7bbd0882mr908551e87.9.1730380748187;
        Thu, 31 Oct 2024 06:19:08 -0700 (PDT)
Message-ID: <878409fe69f7af07120f53ec7d2a58bf348b179c.camel@gmail.com>
Subject: Re: [PATCH v2 1/3] xen/riscv: introduce setup_mm()
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman	
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper	 <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini	 <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Date: Thu, 31 Oct 2024 14:19:07 +0100
In-Reply-To: <e067e169-3e63-4d01-963f-9dde3bb8e3b7@suse.com>
References: <cover.1729697111.git.oleksii.kurochko@gmail.com>
	 <28240dcfc04a11237db553c4e0ecb372aa0fe9ac.1729697111.git.oleksii.kurochko@gmail.com>
	 <8ec6463e-40a8-4d60-b4c2-ea964a06c572@suse.com>
	 <76fc4999eded2ce74fe73bc81998e92147cf802a.camel@gmail.com>
	 <e067e169-3e63-4d01-963f-9dde3bb8e3b7@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.1 (3.54.1-1.fc41app1) 
MIME-Version: 1.0

> > >=20
> > > >=20
>=20
> > Finally, regarding masking off the top bits of mfn, I'm not
> > entirely
> > clear on how this should work. If I understand correctly, if I mask
> > off
> > certain top bits in mfn, then I would need to unmask those same top
> > bits in maddr_to_virt() and virt_to_maddr(). Is that correct?
> >=20
> > Another point I=E2=80=99m unclear on is which specific part of the top =
bits
> > should be masked.
>=20
> You want to "move" the directmap such that the first legitimate RAM
> page is within the first (large/huge) page mapping of the directmap.
> IOW the "virtual" start of the directmap would move down in VA space.
> That still leaves things at a simple offset calculation when
> translating VA <-> PA.
>=20
> To give an example: Let's assume RAM starts at 61.5 Gb, and you want
> to
> use 1Gb mappings for the bulk of the directmap. Then the "virtual"
> start
> of the directmap would shift down to DIRECTMAP_VIRT_START - 60Gb,
> such that the first RAM page would be mapped at
> DIRECTMAP_VIRT_START + 1.5Gb. IOW it would be the low 30 address bits
> of
> the start address that you use (30 - PAGE_SHIFT for the MFN), with
> the
> higher bits contributing to the offset involved in the VA <-> PA
> translation. Values used depend on the (largest) page size you mean
> to
> use for the direct map: On systems with terabytes of memory
> (demanding
> Sv48 or even Sv57 mode) you may want to use 512Gb mappings, and hence
> you'd then need to mask the low 39 bits (or 48 for 256Tb mappings).
Thanks a lot for clarification. IIUC then not to many things should be
changed, only directmap mapping virtual address and calculation of
proper virtual address start of directmap:
   --- a/xen/arch/riscv/mm.c
   +++ b/xen/arch/riscv/mm.c
   @@ -457,6 +457,7 @@ vaddr_t __ro_after_init directmap_virt_start;
    static void __init setup_directmap_mappings(unsigned long base_mfn,
                                                unsigned long nr_mfns)
    {
   +    unsigned long base_addr =3D mfn_to_maddr(_mfn(base_mfn));
        int rc;
   =20
        /* First call sets the directmap physical and virtual offset. */
   @@ -473,14 +474,14 @@ static void __init
   setup_directmap_mappings(unsigned long base_mfn,
             * Prevent that by offsetting the start of the directmap
   virtual
             * address.
             */
   -        directmap_virt_start =3D DIRECTMAP_VIRT_START +
   pfn_to_paddr(base_mfn);
   +        directmap_virt_start =3D DIRECTMAP_VIRT_START - (base_addr &
   ~XEN_PT_LEVEL_SIZE(HYP_PT_ROOT_LEVEL));
        }
   =20
        if ( base_mfn < mfn_x(directmap_mfn_start) )
            panic("cannot add directmap mapping at %#lx below heap start
   %#lx\n",
                  base_mfn, mfn_x(directmap_mfn_start));
   =20
   -    rc =3D map_pages_to_xen((vaddr_t)mfn_to_virt(base_mfn),
   +    rc =3D map_pages_to_xen(DIRECTMAP_VIRT_START + (base_addr &
   XEN_PT_LEVEL_SIZE(HYP_PT_ROOT_LEVEL)),
                              _mfn(base_mfn), nr_mfns,
                              PAGE_HYPERVISOR_RW);
  =20

And of course then use directmap_virt_start in maddr_to_virt() and
virt_to_maddr():
   @@ -31,7 +31,7 @@ static inline void *maddr_to_virt(paddr_t ma)
   =20
        ASSERT(va_offset < DIRECTMAP_SIZE);
   =20
   -    return (void *)(XENHEAP_VIRT_START + va_offset);
   +    return (void *)(directmap_virt_start + va_offset);
    }
   =20
    /*
   @@ -44,7 +44,7 @@ static inline unsigned long virt_to_maddr(unsigned
   long va)
    {
        if ((va >=3D XENHEAP_VIRT_START) &&
            (va < (DIRECTMAP_VIRT_START + DIRECTMAP_SIZE)))
   -        return directmapoff_to_maddr(va - XENHEAP_VIRT_START);
   +        return directmapoff_to_maddr(va - directmap_virt_start);

>=20
> > > > +void __init setup_mm(void)
> > > > +{
> > > > +=C2=A0=C2=A0=C2=A0 const struct membanks *banks =3D bootinfo_get_m=
em();
> > > > +=C2=A0=C2=A0=C2=A0 paddr_t ram_start =3D INVALID_PADDR;
> > > > +=C2=A0=C2=A0=C2=A0 paddr_t ram_end =3D 0;
> > > > +=C2=A0=C2=A0=C2=A0 paddr_t ram_size =3D 0;
> > > > +=C2=A0=C2=A0=C2=A0 unsigned int i;
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 /*
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * We need some memory to allocate the pag=
e-tables used
> > > > for
> > > > the directmap
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * mappings. But some regions may contain =
memory already
> > > > allocated
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * for other uses (e.g. modules, reserved-=
memory...).
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 *
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * For simplicity, add all the free region=
s in the boot
> > > > allocator.
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 */
> > > > +=C2=A0=C2=A0=C2=A0 populate_boot_allocator();
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 total_pages =3D 0;
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 for ( i =3D 0; i < banks->nr_banks; i++ )
> > > > +=C2=A0=C2=A0=C2=A0 {
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct membank *b=
ank =3D &banks->bank[i];
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 paddr_t bank_end =3D ba=
nk->start + bank->size;
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ram_size +=3D ROUNDDOWN=
(bank->size, PAGE_SIZE);
> > >=20
> > > As before - if a bank doesn't cover full pages, this may give the
> > > impression
> > > of there being more "total pages" than there are.
> > Since it rounds down to PAGE_SIZE, if ram_start is 2K and the total
> > size of a bank is 11K, ram_size will end up being 8K, so the "total
> > pages" will cover less RAM than the actual size of the RAM bank.
>=20
> ram_start at 2k but bank size being 13k would yield 2 usable pages
> (first partial page of 2k unusable and last partial page of 3k
> unusable), yet ram_size of 12k (3 pages). You need to consider the
> common case; checking things work for a randomly chosen example isn't
> enough.
Then I have to check separately the start and end of bank and check if
ram_size should be reduced in case if the start or end isn't properly
aligned.

>=20
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ram_start =3D min(ram_s=
tart, bank->start);
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ram_end =3D max(ram_end=
, bank_end);
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 setup_directmap_mapping=
s(PFN_DOWN(bank->start),
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PFN_DOWN(bank->size));
> > >=20
> > > Similarly I don't think this is right when both start and size
> > > aren't
> > > multiple of PAGE_SIZE. You may map an unsuable partial page at
> > > the
> > > start,
> > > and then fail to map a fully usable page at the end.
> > ram_size should be a multiple of PAGE_SIZE because we have:
> > =C2=A0=C2=A0=C2=A0 ram_size +=3D ROUNDDOWN(bank->size, PAGE_SIZE);
> >=20
> > Do you know of any examples where bank->start isn't aligned to
> > PAGE_SIZE?
>=20
> Question is the other way around: Is it specified anywhere that start
> (and
> size) _need_ to be aligned? And if it is - do all firmware makers
> play by
> that (on x86 at least specifications often mean pretty little to
> firmware
> people, apparently)?
Yes, I understand that, I tried to find that somewhere in priv/unpriv
spec and wasn't able to find that. And that is why I asked if it should
be mentioned somewhere. Anyway, I think that it will be better just to
update the code and make it working in any case.

Thanks.

~ Oleksii


