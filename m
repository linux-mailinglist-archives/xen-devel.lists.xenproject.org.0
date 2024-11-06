Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C63CD9BEA5D
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2024 13:44:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.830927.1246042 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8fOT-0002mB-GS; Wed, 06 Nov 2024 12:44:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 830927.1246042; Wed, 06 Nov 2024 12:44:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8fOT-0002kS-Dk; Wed, 06 Nov 2024 12:44:17 +0000
Received: by outflank-mailman (input) for mailman id 830927;
 Wed, 06 Nov 2024 12:44:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yuz5=SB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1t8fOS-0002jr-3o
 for xen-devel@lists.xenproject.org; Wed, 06 Nov 2024 12:44:16 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d3a5768c-9c3c-11ef-a0c6-8be0dac302b0;
 Wed, 06 Nov 2024 13:44:13 +0100 (CET)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-539f2b95775so7752774e87.1
 for <xen-devel@lists.xenproject.org>; Wed, 06 Nov 2024 04:44:13 -0800 (PST)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53c7bccced1sm2482483e87.123.2024.11.06.04.44.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Nov 2024 04:44:12 -0800 (PST)
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
X-Inumbo-ID: d3a5768c-9c3c-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoxMzQiLCJoZWxvIjoibWFpbC1sZjEteDEzNC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImQzYTU3NjhjLTljM2MtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwODk3MDUzLjU0MzQxOCwic2VuZGVyIjoib2xla3NpaS5rdXJvY2hrb0BnbWFpbC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730897053; x=1731501853; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7qTUQjBhI9yWwF+wV7C9d94TaRmYhd28hDx20TNDDk4=;
        b=Zxjg/+79tBgW6DKuUl5n/iZAVDKsLz9SfntHLiO8GZMpicDYEQbCF4Rdg03gvqlvTk
         92EIYEw7AlhQrfXyBioOKx9tU45Qwc1ecDulQKIB8jeVU+KqKo5H/Dcu4OKSk62nvBMu
         FLw/G9ghg0tX/6Fwe4cNz2CpV0IkiTWd/prxz02zdVBJTleVxnA4czv5hxTzjGf7n9jn
         p753DKt0CsEOt3Lz09dB4PsYJUI2DsB/qvM79YH2ZAC/iTzQb34SEc1oaHjvrvFzNw7h
         rX56bxgSHX3RSrMT6vDqCdoB3IhU2DkbH4lrdzQGSgduxru2az9JkgWaPJC4h/tn7SVT
         DfvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730897053; x=1731501853;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7qTUQjBhI9yWwF+wV7C9d94TaRmYhd28hDx20TNDDk4=;
        b=bqZYxHoLKP8we79f00Ubt0bi37DojmPGPQtFiemhXrO+EJnTkjrlbZq5xXWmlle6Bi
         q5rT5Bn1wI3vuZrqnG/71y2C8JhneHw0EO5lPKjTviJnyZLxnv9YMrEe5GKGn/Q1n+3y
         71PGCvSB9k3uYwhuY/Hr5KxIdgSm2PRQev4HDMljZvk2BjE2qndXpCZ7403d9+giFVqW
         f/+QT2mnI5V4sQnxWhICiscyV3dIW4ICEUdeGuXjK/ErKVG4felSyHumqnaxEJP3U+K4
         WkiBp2rmVpsg+ByB8NIvVGrXvobSeH54BTQwTw0T1QU5+n95fo5QNlRu6uAMN98ccof4
         5Lgw==
X-Forwarded-Encrypted: i=1; AJvYcCXPxVRlmstLJT9cx6jUmzOeZ6DkiEgqd50k81gz3NvLC9GZ/7WW8Xn2saKRP2yo+nwBPVNN5kJdgJ4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyXo2DrWr0I2nalR4sQZyhXxlxS5P7eRD3ysv/s+hx0uQ2Moki8
	uwLqrXxWGKn68xnt7WLpV99wkFyPtuhyEblWxT+LDjh8Rr56CJA9
X-Google-Smtp-Source: AGHT+IHS3RPOBJYY7bxbqnwbUgxFO/woX/PnmYAdWli6f0NWg7PgHf1g0qhuFFaylMVxxuEsoqxz+w==
X-Received: by 2002:a05:6512:1150:b0:536:741a:6bc5 with SMTP id 2adb3069b0e04-53d65dca64cmr15362293e87.12.1730897052664;
        Wed, 06 Nov 2024 04:44:12 -0800 (PST)
Message-ID: <8380261d24388e453e74514dad8216c97e3bebee.camel@gmail.com>
Subject: Re: [PATCH v3 1/3] xen/riscv: introduce setup_mm()
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman	
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper	 <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini	 <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Date: Wed, 06 Nov 2024 13:44:11 +0100
In-Reply-To: <9e22b5ad-634f-48b7-b64c-fc44319a1d4d@suse.com>
References: <cover.1730465154.git.oleksii.kurochko@gmail.com>
	 <0f7cd809e848607408ff4615e55b847f5a524559.1730465154.git.oleksii.kurochko@gmail.com>
	 <9e22b5ad-634f-48b7-b64c-fc44319a1d4d@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.1 (3.54.1-1.fc41app1) 
MIME-Version: 1.0

On Tue, 2024-11-05 at 16:20 +0100, Jan Beulich wrote:
> On 01.11.2024 14:16, Oleksii Kurochko wrote:> @@ -423,3 +429,138 @@
> void * __init early_fdt_map(paddr_t fdt_paddr)
> > =C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0 return fdt_virt;
> > =C2=A0}
> > +
> > +vaddr_t __ro_after_init directmap_virt_start =3D
> > DIRECTMAP_VIRT_START;
> > +
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
> > +=C2=A0=C2=A0=C2=A0 if ( frametable_size > FRAMETABLE_SIZE )
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 panic("The frametable canno=
t cover [%#"PRIpaddr",
> > %#"PRIpaddr")\n",
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 ps, pe);
> > +
> > +=C2=A0=C2=A0=C2=A0 /*
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * align base_mfn and frametable_size to MB(2)=
 to have
> > superpage mapping
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * in map_pages_to_xen()
> > +=C2=A0=C2=A0=C2=A0=C2=A0 */
> > +=C2=A0=C2=A0=C2=A0 frametable_size =3D ROUNDUP(frametable_size, MB(2))=
;
> > +=C2=A0=C2=A0=C2=A0 base_mfn =3D alloc_boot_pages(frametable_size >> PA=
GE_SHIFT,
> > PFN_DOWN(MB(2)));
> > +
> > +=C2=A0=C2=A0=C2=A0 if ( map_pages_to_xen(FRAMETABLE_VIRT_START, base_m=
fn,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 PFN_DOWN(frametable_size),
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 PAGE_HYPERVISOR_RW) )
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 panic("frametable mappings =
failed: %#lx -> %#lx\n",
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 FRAMETABLE_VIRT_START, mfn_x(base_mfn));
> > +
> > +=C2=A0=C2=A0=C2=A0 memset(&frame_table[0], -1, frametable_size);
> > +=C2=A0=C2=A0=C2=A0 memset(&frame_table[PFN_DOWN(aligned_ps)],
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0, nr_mfn=
s * sizeof(*frame_table));
>=20
> Interesting - now you write out a huge amount of -1s, just to then
> overwrite
> most of them with zeroes. I'm not going to insist that you change
> this yet
> another time, but the performance hit from this is going to bite
> you/us as
> soon as Xen is run on bigger-memory systems.
I agree that validating or invalidating frames in a single pass would
be preferable to nearly two passes. I=E2=80=99m considering whether there=
=E2=80=99s a
way to ensure that frame_table is set to -1 at compile time. It seems
the best approach (and only one?) might be to initialize frame_table in
one pass as follows:
1) [0, aligned_ps) =3D -1
2) [aligned_ps, nr_mfns * sizeof(*frame_table)) =3D 0
3) [nr_mfns * sizeof(*frame_table), frame_table_size) =3D -1
Does this approach seem optimal?

>=20
> Plus, unless I'm mistaken, the function continues to rely on ps =3D=3D 0
> as
> input. Just that the dependency is now better hidden. Specifically if
> you
> calculate nr_mfns from the difference, and then use that for
> allocation,
> then you need to offset the start of the mapping you create
> accordingly.
I'm not quite understanding why the method of calculating nr_mfns
affects how the frame_table is mapped. Isn=E2=80=99t it only necessary to
calculate the correct size of the frame_table that needs to be
allocated?

I assume by the offset you mean something similar to what was done for
directmap mapping?


>  At
> which point you may need to apply extra care to cover the case where
> sizeof(*frame_table) is not a power of two, and hence e.g. the first
> valid
> page might have a struct instance straddling a page boundary.
The first valid page is aligned_ps ( which is aligned on a page
boundary ) so assuming that sizeof(*frame_table) < PAGE_SIZE we can't
straddle a page boundary, can we?

>=20
> > +=C2=A0=C2=A0=C2=A0 /*
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * The base address may not be aligned to the =
second level
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * size in case of Sv39 (e.g. 1GB when using 4=
KB pages).
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * This would prevent superpage mappings for a=
ll the regions
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * because the virtual address and machine add=
ress should
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * both be suitably aligned.
> > +=C2=A0=C2=A0=C2=A0=C2=A0 *
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * Prevent that by offsetting the start of the=
 directmap
> > virtual
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * address.
> > +=C2=A0=C2=A0=C2=A0=C2=A0 */
> > +=C2=A0=C2=A0=C2=A0 if ( map_pages_to_xen(DIRECTMAP_VIRT_START + (base_=
addr &
> > ~high_bits_mask),
>=20
> I'm afraid this is correct only for the first invocation of the
> function.
> For any further invocation you'd likely (attempt to) replace
> previously
> established mappings. I think that here you need to use
> directmap_virt_start
> instead.
Banks are sorted by bank start address ( common/device-
tree/bootfdt.c:623 ):
       /*
        * On Arm64 setup_directmap_mappings() expects to be called with
   the lowest
        * bank in memory first. There is no requirement that the DT will
   provide
        * the banks sorted in ascending order. So sort them through.
        */
       sort(mem->bank, mem->nr_banks, sizeof(struct membank),
            cmp_memory_node, swap_memory_node);
( btw, comment is needed to be updated ... )

Thereby no replacement should happen if I don't miss something.

I am thinking wouldn't it be more correct to use mfn_to_virt(base_mfn):
       if ( map_pages_to_xen(__mfn_to_virt(base_mfn) + (base_addr &
   ~high_bits_mask),
                             _mfn(base_mfn), nr_mfns,
                             PAGE_HYPERVISOR_RW) )

>=20
> > +/*
> > + * Setup memory management
> > + *
> > + * RISC-V 64 has a large virtual address space (the minimum
> > supported
> > + * MMU mode is Sv39, which provides GBs of VA space).
> > + *
> > + * The directmap_virt_start is shifted lower in the VA space to
> > + * (DIRECTMAP_VIRT_START - masked_low_bits_of_ram_start_address)
> > to avoid
> > + * wasting a large portion of the directmap space, this also
> > allows for simple
> > + * VA <-> PA translations. Also aligns DIRECTMAP_VIRT_START to a
> > GB boundary
> > + * (for Sv39; for other MMU mode boundaries will be bigger ) by
> > masking the
> > + * higher bits of the RAM start address to enable the use of
> > superpages in
> > + * map_pages_to_xen().
> > + *
> > + * The frametable is mapped starting from physical address 0,
> > minimizing
> > + * wasted VA space and simplifying page_to_mfn() and mfn_to_page()
> > + * translations.
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
>=20
> Nit: Is this actually necessary?
Agree, there is no need for total_pages. It should be dropped.

>=20
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
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ram_start =3D min(ram_start=
, bank_start);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ram_end =3D max(ram_end, ba=
nk_end);
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 setup_directmap_mappings(PF=
N_DOWN(bank_start),
> > PFN_DOWN(bank_size));
> > +=C2=A0=C2=A0=C2=A0 }
>=20
> You maintain ram_start in the loop, just to then ...
>=20
> > +=C2=A0=C2=A0=C2=A0 total_pages =3D PFN_DOWN(ram_size);
> > +
> > +=C2=A0=C2=A0=C2=A0 setup_frametable_mappings(0, ram_end);
> > +=C2=A0=C2=A0=C2=A0 max_page =3D PFN_DOWN(ram_end);
> > +}
>=20
> ... not use it at all - why?
ram_start was needed for the case when setup_frametable_mappings() used
it as the first argument. Now it isn't true anymore so should be
dropped.

Thanks.

~ Oleksii

