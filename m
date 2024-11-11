Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 802439C3EBC
	for <lists+xen-devel@lfdr.de>; Mon, 11 Nov 2024 13:52:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.833696.1248891 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tATtV-0002en-Sq; Mon, 11 Nov 2024 12:51:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 833696.1248891; Mon, 11 Nov 2024 12:51:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tATtV-0002c3-Pa; Mon, 11 Nov 2024 12:51:49 +0000
Received: by outflank-mailman (input) for mailman id 833696;
 Mon, 11 Nov 2024 12:51:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dX8x=SG=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tATtU-0002bx-Jr
 for xen-devel@lists.xenproject.org; Mon, 11 Nov 2024 12:51:48 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b52ddb92-a02b-11ef-a0c6-8be0dac302b0;
 Mon, 11 Nov 2024 13:51:45 +0100 (CET)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2f7657f9f62so34817941fa.3
 for <xen-devel@lists.xenproject.org>; Mon, 11 Nov 2024 04:51:45 -0800 (PST)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ff179d7ec8sm16933201fa.109.2024.11.11.04.51.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Nov 2024 04:51:44 -0800 (PST)
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
X-Inumbo-ID: b52ddb92-a02b-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoyMzEiLCJoZWxvIjoibWFpbC1sajEteDIzMS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImI1MmRkYjkyLWEwMmItMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxMzI5NTA1LjYzMTY0Niwic2VuZGVyIjoib2xla3NpaS5rdXJvY2hrb0BnbWFpbC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731329505; x=1731934305; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MI8OJUJG4eHDYLWxnT5Ae0wZm0qRX8ov5qqkOjKqy4Y=;
        b=DRzgGL3U4482eu4bvDbqWa0iq0QXv4kuISY+92S+QVi/e0bK2yuvRefKxeLXS2Lw27
         2a/PRRZFGEQAHFmF93pHpvB7yWqy9dNlj/BT4fN8SwJZQAbN/HUfrc7ZkypKdaE3rFC6
         mb3sbcjRxk4XoZ/U7TZ3QYi9MaFkv/nJlZ9oT4epTSz2Q/F2pafp526EynTKpPaOveZp
         pz4k8iqgW5iStYqy6Tv4A1L5S0pMCZKIdrMvmMEgyZSwV/x09rnR7pg7QUGZSzjVqXpk
         sJ7XyMqfSfIKNASiUi2GGez88mFGgZXzmuLYpK/bzAii7A8dRXM58+90JBjZxZpS3WGG
         9WNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731329505; x=1731934305;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MI8OJUJG4eHDYLWxnT5Ae0wZm0qRX8ov5qqkOjKqy4Y=;
        b=b0BCTFgUKqoIuq+WPRggfWk2QQOkJDM76DiZP834ioghEWbbdbbaqgxG0srlsEe9/d
         OxtLYF5jT6GDMvjlkXTVVlXzTMn7k0z2sRsTTbRYeYSNSp9M/uXoDeGp4Jig/NOeYAzY
         w8kNHxR71DIQ4zJtvNxcTMzbUQ/gaea7CBl7vadlyLYSPtJelyXQNIN6HMG2ZUjfUmkK
         x17fkBx8qoOGMmA1jzKGaN+D8jY2OXCT2iwLzAqyiZG2idoC5UsMaRo8fmMlCY5/9JzP
         N2dt29dQfet2Yj9+3GUSX0V0fZ6kV6DGqxrzZzr2MmWZ6N6khejSUoN2qvGj+eOt2iUr
         ngOw==
X-Forwarded-Encrypted: i=1; AJvYcCWCDHHQFS3VxjyMkxcaVHISqbG05RIAIAv5O5L4WRPm94IUIshuyKCsphTyF+1SWD56fpMG5jbVu2A=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyBbJtuZ+1HoRTnJ5sRXfffBc//+Jv06PkPVXfxZpdwJHwG7CoZ
	z7m+HyoyKUXE1RocNI36/bAqEysosA4+HhiIX2Bb/TGxvZYZC5K//ji9wA==
X-Google-Smtp-Source: AGHT+IGcC5IxT04hUGYgeB0tVe2RNeOCu+t92deSs72a5ydTiwVAS3tQ0jHDt72cvd4I4KTeyoZuhg==
X-Received: by 2002:a05:651c:512:b0:2fb:4b0d:9092 with SMTP id 38308e7fff4ca-2ff201e6ddfmr44658131fa.1.1731329504553;
        Mon, 11 Nov 2024 04:51:44 -0800 (PST)
Message-ID: <8af72f722c96bae029ee8278c9164e3bc5474272.camel@gmail.com>
Subject: Re: [PATCH v4 1/3] xen/riscv: introduce setup_mm()
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman	
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper	 <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini	 <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Date: Mon, 11 Nov 2024 13:51:43 +0100
In-Reply-To: <9eeb11a3-df72-4a77-9235-6a872b365ecd@suse.com>
References: <cover.1731069334.git.oleksii.kurochko@gmail.com>
	 <2a9262165c71733792974f5e27795625013bc656.1731069334.git.oleksii.kurochko@gmail.com>
	 <9eeb11a3-df72-4a77-9235-6a872b365ecd@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.1 (3.54.1-1.fc41app1) 
MIME-Version: 1.0

On Mon, 2024-11-11 at 11:29 +0100, Jan Beulich wrote:
> On 08.11.2024 13:51, Oleksii Kurochko wrote:
> > @@ -37,9 +42,9 @@ static inline void *maddr_to_virt(paddr_t ma)
> > =C2=A0 */
> > =C2=A0static inline unsigned long virt_to_maddr(unsigned long va)
> > =C2=A0{
> > -=C2=A0=C2=A0=C2=A0 if ((va >=3D DIRECTMAP_VIRT_START) &&
> > +=C2=A0=C2=A0=C2=A0 if ((va >=3D directmap_virt_start) &&
>=20
> Is this a valid / necessary change to make?
You are right, this not valid change, va value is DIRECTMAP_VIRT_START-
relative.

>  Right now there looks to be
> nothing immediately below the directmap, yet that would need
> guaranteeing
> (e.g. by some BUILD_BIG_ON() or whatever else) if code builds upon
> that.
It is not really clear how to check that nothing below the directmap is
present/used. But IIUC there is no need for this check if properly
correct the condition above.

>=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (va < (DIRECTMAP_VIRT_=
START + DIRECTMAP_SIZE)))
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return directmapoff_to_madd=
r(va - DIRECTMAP_VIRT_START);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return directmapoff_to_madd=
r(va - directmap_virt_start);
>=20
> FTAOD - no question about this part of the change.
>=20
> > @@ -423,3 +429,140 @@ void * __init early_fdt_map(paddr_t
> > fdt_paddr)
> > =C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0 return fdt_virt;
> > =C2=A0}
> > +
> > +vaddr_t __ro_after_init directmap_virt_start =3D
> > DIRECTMAP_VIRT_START;
> > +
> > +struct page_info *__ro_after_init frametable_virt_start;
>=20
> As for directmap_virt_start - perhaps better with initializer?
Do you mean to initialized by NULL or frame_table?

If to initialize by frame_table then the if-condition won't work
properly in setup_frametable_mappings() ( but I think that this
condition could be dropped as setup_frametable_mappings() is supposed
to be called only once ?! ). And you mentioned about this condition
here ...

>=20
> > +#ifndef CONFIG_RISCV_32
> > +
> > +/* Map a frame table to cover physical addresses ps through pe */
> > +static void __init setup_frametable_mappings(paddr_t ps, paddr_t
> > pe)
> > +{
> > +=C2=A0=C2=A0=C2=A0 paddr_t aligned_ps =3D ROUNDUP(ps, PAGE_SIZE);
> > +=C2=A0=C2=A0=C2=A0 paddr_t aligned_pe =3D ROUNDDOWN(pe, PAGE_SIZE);
> > +=C2=A0=C2=A0=C2=A0 unsigned long nr_mfns =3D PFN_DOWN(aligned_pe - ali=
gned_ps);
> > +=C2=A0=C2=A0=C2=A0 unsigned long frametable_size =3D nr_mfns *
> > sizeof(*frame_table);
> > +=C2=A0=C2=A0=C2=A0 mfn_t base_mfn;
> > +
> > +=C2=A0=C2=A0=C2=A0 if ( !frametable_virt_start )
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 frametable_virt_start =3D f=
rame_table -
> > paddr_to_pfn(aligned_ps);
>=20
> If you make this conditional, then you need an "else" (or something
> that's
> effectively one) just like you have in setup_directmap_mappings().
> Like
> for the earlier assumption on ps being zero: Assumptions you make on
> how
> a function is used want to at least be self-consistent. I.e. here
> either
> you assume the function may be called more than once, or you don't.
...

Do we have in Xen something to be sure that the function is called only
once or I have to come up with static variable inside the function?

>=20
> > +static void __init setup_directmap_mappings(unsigned long
> > base_mfn,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long nr_mfns)
> > +{
> > +=C2=A0=C2=A0=C2=A0 static mfn_t __initdata directmap_mfn_start =3D
> > INVALID_MFN_INITIALIZER;
> > +
> > +=C2=A0=C2=A0=C2=A0 unsigned long base_addr =3D mfn_to_maddr(_mfn(base_=
mfn));
>=20
> Seeing this and ...
>=20
> > +=C2=A0=C2=A0=C2=A0 unsigned long high_bits_mask =3D
> > XEN_PT_LEVEL_MAP_MASK(HYP_PT_ROOT_LEVEL);
> > +
> > +=C2=A0=C2=A0=C2=A0 /* First call sets the directmap physical and virtu=
al offset.
> > */
> > +=C2=A0=C2=A0=C2=A0 if ( mfn_eq(directmap_mfn_start, INVALID_MFN) )
> > +=C2=A0=C2=A0=C2=A0 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 directmap_mfn_start =3D _mf=
n(base_mfn);
>=20
> ... this (and more further down) - perhaps better to have the
> function take
> mfn_t right away?
Agree, it makes sense. I'll update correspondingly.

>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * The base address may not =
be aligned to the second level
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * size in case of Sv39 (e.g=
. 1GB when using 4KB pages).
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * This would prevent superp=
age mappings for all the
> > regions
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * because the virtual addre=
ss and machine address should
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * both be suitably aligned.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Prevent that by offsettin=
g the start of the directmap
> > virtual
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * address.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 directmap_virt_start -=3D
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (ba=
se_addr & high_bits_mask) + (base_addr &
> > ~high_bits_mask);
>=20
> Isn't this the same as
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 directmap_virt_start -=3D base=
_addr;
>=20
> i.e. no different from what you had a few revisions back? I continue
> to
> think that only the low bits matter for the offsetting.
IIUYC you mean that "(base_addr &
~high_bits_mask)" should be dropped then I agree. Thanks for noticing
that.

>=20
> > +=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0 if ( base_mfn < mfn_x(directmap_mfn_start) )
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 panic("can't add directmap =
mapping at %#lx below directmap
> > start %#lx\n",
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 base_mfn, mfn_x(directmap_mfn_start));
> > +
> > +=C2=A0=C2=A0=C2=A0 if ( map_pages_to_xen((vaddr_t)mfn_to_virt(base_mfn=
),
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 _mfn(base_mfn), nr_mfns,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 PAGE_HYPERVISOR_RW) )
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 panic("Directmap mappings f=
or [%#"PRIpaddr", %#"PRIpaddr")
> > failed\n",
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 mfn_to_maddr(_mfn(base_mfn)),
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 mfn_to_maddr(_mfn(base_mfn + nr_mfns)));
>=20
> Maybe worth also logging the error code?
I am not really understand why do we need that as the use will see what
is the issue in the message inside panic().

>=20
> > +void __init setup_mm(void)
> > +{
> > +=C2=A0=C2=A0=C2=A0 const struct membanks *banks =3D bootinfo_get_mem()=
;
> > +=C2=A0=C2=A0=C2=A0 paddr_t ram_start =3D INVALID_PADDR;
> > +=C2=A0=C2=A0=C2=A0 paddr_t ram_end =3D 0;
> > +=C2=A0=C2=A0=C2=A0 paddr_t ram_size =3D 0;
> > +=C2=A0=C2=A0=C2=A0 unsigned int i;
> > +
> > +=C2=A0=C2=A0=C2=A0 /*
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * We need some memory to allocate the page-ta=
bles used for
> > the directmap
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * mappings. But some regions may contain memo=
ry already
> > allocated
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * for other uses (e.g. modules, reserved-memo=
ry...).
> > +=C2=A0=C2=A0=C2=A0=C2=A0 *
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * For simplicity, add all the free regions in=
 the boot
> > allocator.
> > +=C2=A0=C2=A0=C2=A0=C2=A0 */
> > +=C2=A0=C2=A0=C2=A0 populate_boot_allocator();
> > +
> > +=C2=A0=C2=A0=C2=A0 for ( i =3D 0; i < banks->nr_banks; i++ )
> > +=C2=A0=C2=A0=C2=A0 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct membank *bank =
=3D &banks->bank[i];
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 paddr_t bank_start =3D ROUN=
DUP(bank->start, PAGE_SIZE);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 paddr_t bank_end =3D ROUNDD=
OWN(bank->start + bank->size,
> > PAGE_SIZE);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long bank_size =3D=
 bank_end - bank_start;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ram_size +=3D bank_size;
>=20
> As before - you maintain ram_size here, ...
>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ram_start =3D min(ram_start=
, bank_start);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ram_end =3D max(ram_end, ba=
nk_end);
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 setup_directmap_mappings(PF=
N_DOWN(bank_start),
> > PFN_DOWN(bank_size));
> > +=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0 setup_frametable_mappings(ram_start, ram_end);
> > +=C2=A0=C2=A0=C2=A0 max_page =3D PFN_DOWN(ram_end);
> > +}
>=20
> ... without ever using the value. Why?
I started to use bank_end and bank_size in v2 and ram_size isn't really
needed anymore.

Thanks.

~ Oleksii

