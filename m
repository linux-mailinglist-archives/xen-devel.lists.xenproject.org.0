Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7209B6991
	for <lists+xen-devel@lfdr.de>; Wed, 30 Oct 2024 17:51:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.828348.1243200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6Bu4-0005mH-9f; Wed, 30 Oct 2024 16:50:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 828348.1243200; Wed, 30 Oct 2024 16:50:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6Bu4-0005jt-6Q; Wed, 30 Oct 2024 16:50:40 +0000
Received: by outflank-mailman (input) for mailman id 828348;
 Wed, 30 Oct 2024 16:50:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dhn2=R2=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1t6Bu2-0005jn-Kl
 for xen-devel@lists.xenproject.org; Wed, 30 Oct 2024 16:50:38 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 14f39e98-96df-11ef-a0c3-8be0dac302b0;
 Wed, 30 Oct 2024 17:50:34 +0100 (CET)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2fb599aac99so65455201fa.1
 for <xen-devel@lists.xenproject.org>; Wed, 30 Oct 2024 09:50:34 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2fd4ae6e45dsm3190541fa.27.2024.10.30.09.50.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Oct 2024 09:50:33 -0700 (PDT)
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
X-Inumbo-ID: 14f39e98-96df-11ef-a0c3-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoyMmYiLCJoZWxvIjoibWFpbC1sajEteDIyZi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjE0ZjM5ZTk4LTk2ZGYtMTFlZi1hMGMzLThiZTBkYWMzMDJiMCIsInRzIjoxNzMwMzA3MDM0LjYwMTgwNiwic2VuZGVyIjoib2xla3NpaS5rdXJvY2hrb0BnbWFpbC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730307034; x=1730911834; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=h6H/kioEhec/tDUlT+W27Gdu1/z76mhnSlCWsrKvXhI=;
        b=h4vatExKix4YX8tqQGGUoXL3C1FHbJw+cWVhSaq0pNMA7h3WY1RSifbaHnQFKN7x1V
         a0bftidXZN5nrOyLmC10lmrdOSbcedMcIM0B7cCOsi4tz6YbXgaRdQ5xLXAgR4yV4Nbf
         SvTWHXo5wqEcIYjjJ8lGOHH7eGr8MBNR5vBj8vBpJNSzdJHYEhvZudUA2Yzy31p0ypJV
         bYxXTTkv3YHiqSuRAg0aGMQZ6SLfQDOjmQTeyGHvk5J747JzjCS8T6FKVtf8Y782SQoP
         AEiqPpXc8enQtxaMKhkCPSLQFgx0G7XYsGv1S3ZGos1By29uom67MI848orchIYmxYpP
         g56Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730307034; x=1730911834;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h6H/kioEhec/tDUlT+W27Gdu1/z76mhnSlCWsrKvXhI=;
        b=TP5+YhSHzWDqX2OXobdv6xDfiKY8s2exu53tVGuz7K187fMqjFpQdQwQsSWuVdRUvl
         fTub5KvuqzMz6rHAxOOCftI8U+TAMQMJQFVln4KMpWGu+E8CousWxXOPt50wztBF16Zi
         Wmufxmg3R491aLUh8emZszwAfH0y6y32ncPyX36BGMwZMjyGeikPo8BHOf7nfXP3CA4L
         yHa6tVeSXNAYLl58QXeV87cfBURncci2+PPAiFZeVjGHk/ru3QtWgDNxFv+iWZirPgJx
         DzIn0xno6ZZ38Km2kS3M9TIkX56T4ZqaXznMCYHAv+mMsOgZta9M2KIkjHA/gF0TxHrm
         yD1w==
X-Forwarded-Encrypted: i=1; AJvYcCVaYpuh+SEtjK5cf88Vd/JOmdb047chtwe/tFA7NUpo8fHJvFmAJnZGqTLMdnTN8QPVM5cAjF5+P+o=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw7J1LY1rawEF0VJ3ZGsNcPYb4zt+dVNKfkQTPexfC7H+RZUvyh
	cW8vyndrg9QAxMr9+Jc23Y0W9zmufQ09h5KehDJteba4PIbDIjBmlh3OHw==
X-Google-Smtp-Source: AGHT+IEQDwR96tIXboKLMfkD6FIugHGTHkUkHz+Otn+snajhKpb7WLCX+djfne0WlfEwX3gG7JcIFQ==
X-Received: by 2002:a05:651c:1549:b0:2fb:2980:6e3d with SMTP id 38308e7fff4ca-2fcbdf9d736mr72063861fa.15.1730307033400;
        Wed, 30 Oct 2024 09:50:33 -0700 (PDT)
Message-ID: <76fc4999eded2ce74fe73bc81998e92147cf802a.camel@gmail.com>
Subject: Re: [PATCH v2 1/3] xen/riscv: introduce setup_mm()
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman	
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper	 <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini	 <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Date: Wed, 30 Oct 2024 17:50:32 +0100
In-Reply-To: <8ec6463e-40a8-4d60-b4c2-ea964a06c572@suse.com>
References: <cover.1729697111.git.oleksii.kurochko@gmail.com>
	 <28240dcfc04a11237db553c4e0ecb372aa0fe9ac.1729697111.git.oleksii.kurochko@gmail.com>
	 <8ec6463e-40a8-4d60-b4c2-ea964a06c572@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.1 (3.54.1-1.fc41app1) 
MIME-Version: 1.0

On Wed, 2024-10-30 at 11:25 +0100, Jan Beulich wrote:
> On 23.10.2024 17:50, Oleksii Kurochko wrote:
> > Introduce the implementation of setup_mm(), which includes:
> > 1. Adding all free regions to the boot allocator, as memory is
> > needed
> > =C2=A0=C2=A0 to allocate page tables used for frame table mapping.
> > 2. Calculating RAM size and the RAM end address.
> > 3. Setting up direct map mappings from each RAM bank and initialize
> > =C2=A0=C2=A0 directmap_virt_start (also introduce XENHEAP_VIRT_START wh=
ich is
> > =C2=A0=C2=A0 defined as directmap_virt_start) to be properly aligned wi=
th RAM
> > =C2=A0=C2=A0 start to use more superpages to reduce pressure on the TLB=
.
> > 4. Setting up frame table mappings from physical address 0 to
> > ram_end
> > =C2=A0=C2=A0 to simplify mfn_to_page() and page_to_mfn() conversions.
> > 5. Setting up total_pages and max_page.
> >=20
> > Update virt_to_maddr() to use introduced XENHEAP_VIRT_START.
> >=20
> > Implement maddr_to_virt() function to convert a machine address
> > to a virtual address. This function is specifically designed to be
> > used
> > only for the DIRECTMAP region, so a check has been added to ensure
> > that
> > the address does not exceed DIRECTMAP_SIZE.
>=20
> I'm unconvinced by this. Conceivably the function could be used on
> "imaginary" addresses, just to calculate abstract positions or e.g.
> deltas. At the same time I'm also not going to insist on the removal
> of
> that assertion, so long as it doesn't trigger.
>=20
> > After the introduction of maddr_to_virt() the following linkage
> > error starts
> > to occur and to avoid it share_xen_page_with_guest() stub is added:
> > =C2=A0 riscv64-linux-gnu-ld: prelink.o: in function `tasklet_kill':
> > =C2=A0 /build/xen/common/tasklet.c:176: undefined reference to
> > =C2=A0=C2=A0=C2=A0=C2=A0 `share_xen_page_with_guest'
> > =C2=A0 riscv64-linux-gnu-ld: ./.xen-syms.0: hidden symbol
> > `share_xen_page_with_guest'
> > =C2=A0=C2=A0=C2=A0 isn't defined riscv64-linux-gnu-ld: final link faile=
d: bad
> > value
> >=20
> > Despite the linkger fingering tasklet.c, it's trace.o which has the
> > undefined
> > refenrece:
> > =C2=A0 $ find . -name \*.o | while read F; do nm $F | grep
> > share_xen_page_with_guest &&
> > =C2=A0=C2=A0=C2=A0 echo $F; done
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 U share_xen_page_with_g=
uest
> > =C2=A0=C2=A0=C2=A0 ./xen/common/built_in.o
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 U share_xen_page_with_g=
uest
> > =C2=A0=C2=A0=C2=A0 ./xen/common/trace.o
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 U share_xen_page_with_g=
uest
> > =C2=A0=C2=A0=C2=A0 ./xen/prelink.o
> >=20
> > Looking at trace.i, there is call of share_xen_page_with_guest()
> > but in case of
> > when maddr_to_virt() is defined as "return NULL" compiler optimizes
> > the part of
> > common/trace.c code where share_xen_page_with_priviliged_guest() is
> > called
> > ( there is no any code in dissambled common/trace.o ) so there is
> > no real call
> > of share_xen_page_with_priviliged_guest().
>=20
> I don't think it's the "return NULL", but rather BUG_ON()'s (really
> BUG()'s)
> unreachable(). Not the least because the function can't validly
> return NULL,
> and hence callers have no need to check for NULL.
>=20
> > @@ -25,8 +27,11 @@
> > =C2=A0
> > =C2=A0static inline void *maddr_to_virt(paddr_t ma)
> > =C2=A0{
> > -=C2=A0=C2=A0=C2=A0 BUG_ON("unimplemented");
> > -=C2=A0=C2=A0=C2=A0 return NULL;
> > +=C2=A0=C2=A0=C2=A0 unsigned long va_offset =3D maddr_to_directmapoff(m=
a);
> > +
> > +=C2=A0=C2=A0=C2=A0 ASSERT(va_offset < DIRECTMAP_SIZE);
> > +
> > +=C2=A0=C2=A0=C2=A0 return (void *)(XENHEAP_VIRT_START + va_offset);
> > =C2=A0}
>=20
> I'm afraid I'm not following why this uses XENHEAP_VIRT_START, when
> it's all about the directmap. I'm in trouble with XENHEAP_VIRT_START
> in the first place: You don't have a separate "heap" virtual address
> range, do you?
The name may not be ideal for RISC-V. I borrowed it from Arm, intending
to account for cases where the directmap virtual start might not align
with DIRECTMAP_VIRT_START due to potential adjustments for superpage
mapping.
And my understanding is that XENHEAP =3D=3D DIRECTMAP in case of Arm64.

Let's discuss below whether XENHEAP_VIRT_START is necessary, as there
are related questions connected to it.

>=20
> > @@ -37,9 +42,9 @@ static inline void *maddr_to_virt(paddr_t ma)
> > =C2=A0 */
> > =C2=A0static inline unsigned long virt_to_maddr(unsigned long va)
> > =C2=A0{
> > -=C2=A0=C2=A0=C2=A0 if ((va >=3D DIRECTMAP_VIRT_START) &&
> > +=C2=A0=C2=A0=C2=A0 if ((va >=3D XENHEAP_VIRT_START) &&
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (va < (DIRECTMAP_VIRT_=
START + DIRECTMAP_SIZE)))
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return directmapoff_to_madd=
r(va - DIRECTMAP_VIRT_START);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return directmapoff_to_madd=
r(va - XENHEAP_VIRT_START);
>=20
> Same concern here then.
>=20
> > @@ -423,3 +424,123 @@ void * __init early_fdt_map(paddr_t
> > fdt_paddr)
> > =C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0 return fdt_virt;
> > =C2=A0}
> > +
> > +#ifndef CONFIG_RISCV_32
>=20
> I'd like to ask that you be more selective with this #ifdef (or omit
> it
> altogether here). setup_mm() itself, for example, looks good for any
> mode.
Regarding setup_mm() as they have pretty different implementations for
32 and 64 bit versions.

> Like does ...
>=20
> > +#define ROUNDDOWN(addr, size)=C2=A0 ((addr) & ~((size) - 1))
>=20
> ... this #define. Then again this macro may better be placed in
> xen/macros.h anyway, next to ROUNDUP().
I will put it there. It was put in arch specific code as for such long
existence of Xen project no one introduce that so I decided that it is
only one specific case thereby no real need to go to common.

>=20
> > +=C2=A0=C2=A0=C2=A0 frametable_size =3D ROUNDUP(frametable_size, MB(2))=
;
> > +=C2=A0=C2=A0=C2=A0 base_mfn =3D alloc_boot_pages(frametable_size >> PA=
GE_SHIFT,
> > PFN_DOWN(MB(2)));
>=20
> The 2Mb aspect wants a (brief) comment, imo.
>=20
> > +=C2=A0=C2=A0=C2=A0 if ( map_pages_to_xen(FRAMETABLE_VIRT_START, base_m=
fn,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 PFN_DOWN(frametable_size),
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 PAGE_HYPERVISOR_RW) )
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 panic("Unable to setup the =
frametable mappings\n");
> > +
> > +=C2=A0=C2=A0=C2=A0 memset(&frame_table[0], 0, nr_mfns * sizeof(struct
> > page_info));
> > +=C2=A0=C2=A0=C2=A0 memset(&frame_table[nr_mfns], -1,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 frametabl=
e_size - (nr_mfns * sizeof(struct
> > page_info)));
>=20
> Here (see comments on v1) you're still assuming ps =3D=3D 0.
Do you refer to ?
```
> +/* Map a frame table to cover physical addresses ps through pe */
> +static void __init setup_frametable_mappings(paddr_t ps, paddr_t pe)
> +{
> +    unsigned long nr_mfns =3D mfn_x(mfn_add(maddr_to_mfn(pe), -1)) -

This looks to be accounting for a partial page at the end.

> +                            mfn_x(maddr_to_mfn(ps)) + 1;

Whereas this doesn't do the same at the start. The sole present caller
passes 0, so that's going to be fine for the time being. Yet it's a
latent pitfall. I'd recommend to either drop the function parameter, or
to deal with it correctly right away.
```
And I've added aligned_ps to cover the case that ps could be not page
aligned.

Or are you refering to 0 in memset(&frame_table[0],...)?

>=20
> > +/* Map the region in the directmap area. */
> > +static void __init setup_directmap_mappings(unsigned long
> > base_mfn,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long nr_mfns)
> > +{
> > +=C2=A0=C2=A0=C2=A0 int rc;
> > +
> > +=C2=A0=C2=A0=C2=A0 /* First call sets the directmap physical and virtu=
al offset.
> > */
> > +=C2=A0=C2=A0=C2=A0 if ( mfn_eq(directmap_mfn_start, INVALID_MFN) )
> > +=C2=A0=C2=A0=C2=A0 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 directmap_mfn_start =3D _mf=
n(base_mfn);
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * The base address ma=
y not be aligned to the second level
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * size (e.g. 1GB when=
 using 4KB pages). This would
> > prevent
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * superpage mappings =
for all the regions because the
> > virtual
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * address and machine=
 address should both be suitably
> > aligned.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Prevent that by off=
setting the start of the directmap
> > virtual
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * address.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 directmap_virt_start =3D DI=
RECTMAP_VIRT_START +
> > pfn_to_paddr(base_mfn);
>=20
> Don't you need to mask off top bits of the incoming MFN here, or else
> you
> may waste a huge part of direct map space?
Yes, it will result in a loss of direct map space, but we still have a
considerable amount available in Sv39 mode and higher modes. The
largest RAM_START I see currently is 0x1000000000, which means we would
lose 68 GB. However, our DIRECTMAP_SIZE is 308 GB, so there is still
plenty of free space available, and we can always increase
DIRECTMAP_SIZE since we have a lot of free virtual address space in
Sv39.

That said, I=E2=80=99m not insisting on this approach.
My suggestion was to handle the addition and subtraction of
directmap_mfn_start in maddr_to_virt() and virt_to_maddr():
```
+extern mfn_t directmap_mfn_start;
 extern vaddr_t directmap_virt_start;
=20
 #define pfn_to_paddr(pfn) ((paddr_t)(pfn) << PAGE_SHIFT)
@@ -31,7 +32,7 @@ static inline void *maddr_to_virt(paddr_t ma)
=20
     ASSERT(va_offset < DIRECTMAP_SIZE);
=20
-    return (void *)(XENHEAP_VIRT_START + va_offset);
+    return (void *)(XENHEAP_VIRT_START -
(mfn_to_maddr(directmap_mfn_start)) + va_offset);
 }
=20
 /*
@@ -44,7 +45,7 @@ static inline unsigned long virt_to_maddr(unsigned
long va)
 {
     if ((va >=3D XENHEAP_VIRT_START) &&
         (va < (DIRECTMAP_VIRT_START + DIRECTMAP_SIZE)))
-        return directmapoff_to_maddr(va - XENHEAP_VIRT_START);
+        return directmapoff_to_maddr(va - XENHEAP_VIRT_START +
mfn_to_maddr(directmap_mfn_start));
=20
     BUILD_BUG_ON(XEN_VIRT_SIZE !=3D MB(2));
     ASSERT((va >> (PAGETABLE_ORDER + PAGE_SHIFT)) =3D=3D
diff --git a/xen/arch/riscv/mm.c b/xen/arch/riscv/mm.c
index 262cec811e..7ef9db2363 100644
--- a/xen/arch/riscv/mm.c
+++ b/xen/arch/riscv/mm.c
@@ -450,7 +450,7 @@ static void __init
setup_frametable_mappings(paddr_t ps, paddr_t pe)
 }
=20
-static mfn_t __ro_after_init directmap_mfn_start =3D
INVALID_MFN_INITIALIZER;
+mfn_t __ro_after_init directmap_mfn_start =3D INVALID_MFN_INITIALIZER;
 vaddr_t __ro_after_init directmap_virt_start;
=20
 /* Map the region in the directmap area. */
@@ -462,6 +462,8 @@ static void __init
setup_directmap_mappings(unsigned long base_mfn,
     /* First call sets the directmap physical and virtual offset. */
     if ( mfn_eq(directmap_mfn_start, INVALID_MFN) )
     {
+        unsigned long mfn_gb =3D base_mfn & ~XEN_PT_LEVEL_SIZE(2);
+
         directmap_mfn_start =3D _mfn(base_mfn);
=20
         /*
@@ -473,7 +475,8 @@ static void __init
setup_directmap_mappings(unsigned long base_mfn,
          * Prevent that by offsetting the start of the directmap
virtual
          * address.
          */
-        directmap_virt_start =3D DIRECTMAP_VIRT_START +
pfn_to_paddr(base_mfn);
+        directmap_virt_start =3D DIRECTMAP_VIRT_START  +
+            (base_mfn - mfn_gb) * PAGE_SIZE; /*+
pfn_to_paddr(base_mfn)*/;
```

Finally, regarding masking off the top bits of mfn, I'm not entirely
clear on how this should work. If I understand correctly, if I mask off
certain top bits in mfn, then I would need to unmask those same top
bits in maddr_to_virt() and virt_to_maddr(). Is that correct?

Another point I=E2=80=99m unclear on is which specific part of the top bits
should be masked.

If you could explain this to me, I would really appreciate it, and I'll
be happy to use the masking approach.

>=20
> > +}
> > +
> > +/*
> > + * Setup memory management
> > + *
> > + * RISC-V 64 has a large virtual address space (the minimum
> > supported
> > + * MMU mode is Sv39, which provides TBs of VA space).
>=20
> Is it really TBs? According to my math you'd need more than 40 bits
> to
> map a single Tb (alongside other stuff).
I accidentally calculated it as the first 40 bits (from bits 0 to 39)
due to the "39" in Sv39. However, in reality, it=E2=80=99s actually 39 bits
(from bits 0 to 38), so it represents less than TBs, only GBs of
virtual address space.

>=20
> > + */
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
> > +=C2=A0=C2=A0=C2=A0 total_pages =3D 0;
> > +
> > +=C2=A0=C2=A0=C2=A0 for ( i =3D 0; i < banks->nr_banks; i++ )
> > +=C2=A0=C2=A0=C2=A0 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct membank *bank =
=3D &banks->bank[i];
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 paddr_t bank_end =3D bank->=
start + bank->size;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ram_size +=3D ROUNDDOWN(ban=
k->size, PAGE_SIZE);
>=20
> As before - if a bank doesn't cover full pages, this may give the
> impression
> of there being more "total pages" than there are.
Since it rounds down to PAGE_SIZE, if ram_start is 2K and the total
size of a bank is 11K, ram_size will end up being 8K, so the "total
pages" will cover less RAM than the actual size of the RAM bank.

>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ram_start =3D min(ram_start=
, bank->start);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ram_end =3D max(ram_end, ba=
nk_end);
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 setup_directmap_mappings(PF=
N_DOWN(bank->start),
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PFN_DOWN(bank->size));
>=20
> Similarly I don't think this is right when both start and size aren't
> multiple of PAGE_SIZE. You may map an unsuable partial page at the
> start,
> and then fail to map a fully usable page at the end.
ram_size should be a multiple of PAGE_SIZE because we have:
    ram_size +=3D ROUNDDOWN(bank->size, PAGE_SIZE);

Do you know of any examples where bank->start isn't aligned to
PAGE_SIZE? Should be somewhere mentioned what is legal physical address
for RAM start? If it=E2=80=99s not PAGE_SIZE-aligned, then it seems we have=
 no
choice but to use ALIGNUP(..., PAGE_SIZE), which would mean losing part
of the bank.

~ Oleksii

