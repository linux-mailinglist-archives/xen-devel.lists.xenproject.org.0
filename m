Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D391D9C05DF
	for <lists+xen-devel@lfdr.de>; Thu,  7 Nov 2024 13:33:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.831797.1247176 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t91gy-0007Gs-Jc; Thu, 07 Nov 2024 12:32:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 831797.1247176; Thu, 07 Nov 2024 12:32:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t91gy-0007FO-G5; Thu, 07 Nov 2024 12:32:52 +0000
Received: by outflank-mailman (input) for mailman id 831797;
 Thu, 07 Nov 2024 12:32:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wb0k=SC=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1t91gx-0007FI-9e
 for xen-devel@lists.xenproject.org; Thu, 07 Nov 2024 12:32:51 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 657862e8-9d04-11ef-a0c6-8be0dac302b0;
 Thu, 07 Nov 2024 13:32:48 +0100 (CET)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-53a0c160b94so891752e87.2
 for <xen-devel@lists.xenproject.org>; Thu, 07 Nov 2024 04:32:48 -0800 (PST)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53d826a9d0asm196583e87.183.2024.11.07.04.32.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Nov 2024 04:32:45 -0800 (PST)
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
X-Inumbo-ID: 657862e8-9d04-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoxMmIiLCJoZWxvIjoibWFpbC1sZjEteDEyYi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjY1Nzg2MmU4LTlkMDQtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwOTgyNzY4LjAyOTE5Mywic2VuZGVyIjoib2xla3NpaS5rdXJvY2hrb0BnbWFpbC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730982767; x=1731587567; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KYSWrXMMRsd/cPCSRctkM5Gp0AVwIIS9n7AJfVx9F3s=;
        b=IOrbweNGuh5C1EDSGyUUyaC652pB55mvT770iGkFY8mHSRO/fkkvI8YPN2hzawmEOf
         XoPDgjsMqiG6MDuCOij/d6BvM/uho0+9uL0PVKP1o6H3Hn7z3dPJ4iB6YvRiSQQtakFa
         Mtg7Jvo5wNdfAVyafFZ7ZBuT+Wa1FBnh37/YY0KI9HL1Fv0uXISG1xHE1Rr+TqYXikac
         L4VLqye/NCiM4BO1se+T9tlvDM2EdfswBm/1HjgbJ7LSZyb4mNmLpp23rKlzdDg7353y
         mjEOEkySfadgR5i2rqkEGcW7wOkfZVS0YjrhPyxzVGjxETG1JprlIzncxPhr+rc/1oHc
         jwRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730982767; x=1731587567;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KYSWrXMMRsd/cPCSRctkM5Gp0AVwIIS9n7AJfVx9F3s=;
        b=E6tH43v/Npn3J0Ap5QQCCgKQcUszE2RXRBq17nkx600rouJjVxD5n3dm9CU+tVjRF0
         9IGBDJhYtsLuL4r2YoAevDpcwWuJNSGlgbs4UyzG5hZ21AfDWRxvkucP8/LNapXxEOo+
         5ZMRYRPzwCoN0/Mhkp5YLrIxCtJIXXhxfwJKbo6O+XkOnJ87RKOUFK4nObCVgJ1r/gLR
         s9C+rXLzR8Mf5baiuqDn33/zuFh99n87vOFK81Nm1+QtGxT1x9yI+7QK4F/hQoDUmrbw
         SPrj/Vm7skYgf0RB1/dICoMEptkVefbajZr2L2T90MnLFEhvnyTuwmhvvaFsuZJyAm25
         9xhQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmHFA8gN3PhFo4KX/Js08vRmlQMPQ8VWcxurtvopl3Jg03fsVV78v3hm084vaRzNYw1eZAosOZX/Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxhvm78dzyncKF2DMnHjGrfxCxcgkWXdzpN67B2EbTpUp7DWeni
	ihEyysXs9u5Shw+EO5xXnSZYiHbMe0TKkp/Qp/ZbUUBU3JdWqTpl
X-Google-Smtp-Source: AGHT+IGCjq8xToywcD3TK3Ki2J54eeA0IPvlk1IgDQuaGV16P0FTN/gPL4FTDg9VRK1ys9WzCTjxmw==
X-Received: by 2002:a05:6512:3d05:b0:536:55cf:3148 with SMTP id 2adb3069b0e04-53d65df8d2bmr11944597e87.31.1730982765863;
        Thu, 07 Nov 2024 04:32:45 -0800 (PST)
Message-ID: <779e315475c8fcbe6226767f96f67c88a0ad4eb7.camel@gmail.com>
Subject: Re: [PATCH v3 1/3] xen/riscv: introduce setup_mm()
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman	
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper	 <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini	 <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Date: Thu, 07 Nov 2024 13:32:44 +0100
In-Reply-To: <15f8c4d9-bd90-4b1e-9cea-53e62d601a58@suse.com>
References: <cover.1730465154.git.oleksii.kurochko@gmail.com>
	 <0f7cd809e848607408ff4615e55b847f5a524559.1730465154.git.oleksii.kurochko@gmail.com>
	 <9e22b5ad-634f-48b7-b64c-fc44319a1d4d@suse.com>
	 <8380261d24388e453e74514dad8216c97e3bebee.camel@gmail.com>
	 <15f8c4d9-bd90-4b1e-9cea-53e62d601a58@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.1 (3.54.1-1.fc41app1) 
MIME-Version: 1.0

On Thu, 2024-11-07 at 10:19 +0100, Jan Beulich wrote:
> On 06.11.2024 13:44, oleksii.kurochko@gmail.com=C2=A0wrote:
> > On Tue, 2024-11-05 at 16:20 +0100, Jan Beulich wrote:
> > > On 01.11.2024 14:16, Oleksii Kurochko wrote:> @@ -423,3 +429,138
> > > @@
> > > void * __init early_fdt_map(paddr_t fdt_paddr)
> > > > =C2=A0
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 return fdt_virt;
> > > > =C2=A0}
> > > > +
> > > > +vaddr_t __ro_after_init directmap_virt_start =3D
> > > > DIRECTMAP_VIRT_START;
> > > > +
> > > > +#ifndef CONFIG_RISCV_32
> > > > +
> > > > +/* Map a frame table to cover physical addresses ps through pe
> > > > */
> > > > +static void __init setup_frametable_mappings(paddr_t ps,
> > > > paddr_t
> > > > pe)
> > > > +{
> > > > +=C2=A0=C2=A0=C2=A0 paddr_t aligned_ps =3D ROUNDUP(ps, PAGE_SIZE);
> > > > +=C2=A0=C2=A0=C2=A0 paddr_t aligned_pe =3D ROUNDDOWN(pe, PAGE_SIZE)=
;
> > > > +=C2=A0=C2=A0=C2=A0 unsigned long nr_mfns =3D PFN_DOWN(aligned_pe -=
 aligned_ps);
> > > > +=C2=A0=C2=A0=C2=A0 unsigned long frametable_size =3D nr_mfns *
> > > > sizeof(*frame_table);
> > > > +=C2=A0=C2=A0=C2=A0 mfn_t base_mfn;
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 if ( frametable_size > FRAMETABLE_SIZE )
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 panic("The frametable c=
annot cover [%#"PRIpaddr",
> > > > %#"PRIpaddr")\n",
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 ps, pe);
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 /*
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * align base_mfn and frametable_size to M=
B(2) to have
> > > > superpage mapping
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * in map_pages_to_xen()
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 */
> > > > +=C2=A0=C2=A0=C2=A0 frametable_size =3D ROUNDUP(frametable_size, MB=
(2));
> > > > +=C2=A0=C2=A0=C2=A0 base_mfn =3D alloc_boot_pages(frametable_size >=
> PAGE_SHIFT,
> > > > PFN_DOWN(MB(2)));
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 if ( map_pages_to_xen(FRAMETABLE_VIRT_START, ba=
se_mfn,
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 PFN_DOWN(frametable_size),
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 PAGE_HYPERVISOR_RW) )
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 panic("frametable mappi=
ngs failed: %#lx -> %#lx\n",
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 FRAMETABLE_VIRT_START, mfn_x(base_mfn));
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 memset(&frame_table[0], -1, frametable_size);
> > > > +=C2=A0=C2=A0=C2=A0 memset(&frame_table[PFN_DOWN(aligned_ps)],
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0, nr=
_mfns * sizeof(*frame_table));
> > >=20
> > > Interesting - now you write out a huge amount of -1s, just to
> > > then
> > > overwrite
> > > most of them with zeroes. I'm not going to insist that you change
> > > this yet
> > > another time, but the performance hit from this is going to bite
> > > you/us as
> > > soon as Xen is run on bigger-memory systems.
> > I agree that validating or invalidating frames in a single pass
> > would
> > be preferable to nearly two passes. I=E2=80=99m considering whether the=
re=E2=80=99s
> > a
> > way to ensure that frame_table is set to -1 at compile time.
>=20
> How would that work, if the entire frame table is allocated
> dynamically?
Yeah, there is no way to work in dynamically allocated way. Then let's
stick to ...
>=20
> > It seems
> > the best approach (and only one?) might be to initialize
> > frame_table in
> > one pass as follows:
> > 1) [0, aligned_ps) =3D -1
> > 2) [aligned_ps, nr_mfns * sizeof(*frame_table)) =3D 0
> > 3) [nr_mfns * sizeof(*frame_table), frame_table_size) =3D -1
> > Does this approach seem optimal?
>=20
...
> That's what I would have expected, yes.

>=20
> > > Plus, unless I'm mistaken, the function continues to rely on ps
> > > =3D=3D 0
> > > as
> > > input. Just that the dependency is now better hidden.
> > > Specifically if
> > > you
> > > calculate nr_mfns from the difference, and then use that for
> > > allocation,
> > > then you need to offset the start of the mapping you create
> > > accordingly.
> > I'm not quite understanding why the method of calculating nr_mfns
> > affects how the frame_table is mapped. Isn=E2=80=99t it only necessary =
to
> > calculate the correct size of the frame_table that needs to be
> > allocated?
>=20
> Assume there's 4G of memory actually starting at 16G. Afaict you'll
> allocate a frame table for those 4G, but you'll map it right at
> FRAMETABLE_VIRT_START. Hence it'll cover the first 4G of physical
> addresses, but _none_ of the actual memory you've got.
I need to clarify some basics about the frame table.

Does Xen expect that frame_table[0] =3D 0 (PA), frame_table[1] =3D 4k (PA),
..., frame_table[x] =3D RAM_START_PA, frame_table[x+1] =3D RAM_START_PA +
4k, and so on?

My understanding is that it could be done as follows: frame_table[0] =3D
RAM_START_PA, frame_table[1] =3D RAM_START_PA + 4k, and so on, taking
into account mfn_to_page() and page_to_mfn() logic. (And yes, in that
case, the current implementations of mfn_to_page() and page_to_mfn()
aren't correct and should be updated as suggested here:
https://lore.kernel.org/xen-devel/cover.1730465154.git.oleksii.kurochko@gma=
il.com/T/#me2fc410f3d4758b71a9974d0be18a36f50d683b1as
as these implementations are based on that ps =3D=3D 0). With this setup,
mapping FRAMETABLE_VIRT_START to base_mfn should be correct, shouldn=E2=80=
=99t
it?

With the current implementations of mfn_to_page() and page_to_mfn(), we
either need to allocate a larger frame_table to cover the [0, ram_end)
range (in which case mapping FRAMETABLE_VIRT_START to base_mfn would
work), or change the mapping to frame_table=3D( FRAMETABLE_VIRT_START +
PFN_DOWN(ram_start) ) -> base_mfn. Or to not loose virtual addrees
space of FRAMETABLE ( so the mapping will still be
FRAMETABLE_VIRT_START -> base_mfn ) to do the similar to directmap
mapping ( or what the changes suggested in the link above). Is my
understanding correct?

>=20
> > > =C2=A0At
> > > which point you may need to apply extra care to cover the case
> > > where
> > > sizeof(*frame_table) is not a power of two, and hence e.g. the
> > > first
> > > valid
> > > page might have a struct instance straddling a page boundary.
> > The first valid page is aligned_ps ( which is aligned on a page
> > boundary ) so assuming that sizeof(*frame_table) < PAGE_SIZE we
> > can't
> > straddle a page boundary, can we?
>=20
> But sizeof(*frame_table) < PAGE_SIZE means nothing as to the
> alignment
> of an individual struct instance in memory. Iirc sizeof(*frame_table)
> is 48 for RISC-V, so the common alignment across struct instances
> isn't
> going to be better than 8, and there _will_ be instances straddling
> page boundaries.
If we speak about the alignment of an individual struct instance in
memory, what is the issue with that, except that it could be less
efficient when accessing this memory? This inefficiency could
potentially be addressed by adding some padding to the struct page_info
but then we will have bigger frame table size.
Another issue I can see is that the size of the frame table could be
calculated incorrectly. It may require an additional page to cover the
case when the frame table size isn't aligned to PAGE_SIZE, but this is
accounted for by rounding up the frame table size to 2MB
(frametable_size =3D ROUNDUP(frametable_size, MB(2));) before allocating
the frame table (base_mfn =3D alloc_boot_pages(frametable_size >>
PAGE_SHIFT, PFN_DOWN(MB(2)));).

Something else should be considered?

>=20
> > > > +=C2=A0=C2=A0=C2=A0 /*
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * The base address may not be aligned to =
the second level
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * size in case of Sv39 (e.g. 1GB when usi=
ng 4KB pages).
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * This would prevent superpage mappings f=
or all the
> > > > regions
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * because the virtual address and machine=
 address should
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * both be suitably aligned.
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 *
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * Prevent that by offsetting the start of=
 the directmap
> > > > virtual
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * address.
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 */
> > > > +=C2=A0=C2=A0=C2=A0 if ( map_pages_to_xen(DIRECTMAP_VIRT_START + (b=
ase_addr &
> > > > ~high_bits_mask),
> > >=20
> > > I'm afraid this is correct only for the first invocation of the
> > > function.
> > > For any further invocation you'd likely (attempt to) replace
> > > previously
> > > established mappings. I think that here you need to use
> > > directmap_virt_start
> > > instead.
> > Banks are sorted by bank start address ( common/device-
> > tree/bootfdt.c:623 ):
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * On Arm64 setup_directmap_m=
appings() expects to be called
> > with
> > =C2=A0=C2=A0 the lowest
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * bank in memory first. Ther=
e is no requirement that the DT
> > will
> > =C2=A0=C2=A0 provide
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * the banks sorted in ascend=
ing order. So sort them
> > through.
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sort(mem->bank, mem->nr_banks, siz=
eof(struct membank),
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cmp_=
memory_node, swap_memory_node);
> > ( btw, comment is needed to be updated ... )
> >=20
> > Thereby no replacement should happen if I don't miss something.
>=20
> I don't see how banks being sorted matters here. On the 2nd
> invocation
> you'll start mapping pages again from DIRECTMAP_VIRT_START plus an at
> most 1G (for SV39) offset. If both banks have 2G, the resulting
> mappings
> will necessarily overlap, if I'm not mistaken.
Yes, you are write, overlapping is really possible.

Then __mfn_to_virt(base_mfn) to calculate VA of a bank start should be
used:
   @@ -473,24 +483,24 @@ static void __init
   setup_directmap_mappings(unsigned long base_mfn,
        {
            directmap_mfn_start =3D _mfn(base_mfn);
   =20
   -        directmap_virt_start -=3D (base_addr & high_bits_mask);
   +       /*
   +        * The base address may not be aligned to the second level
   +        * size in case of Sv39 (e.g. 1GB when using 4KB pages).
   +        * This would prevent superpage mappings for all the regions
   +        * because the virtual address and machine address should
   +        * both be suitably aligned.
   +        *
   +        * Prevent that by offsetting the start of the directmap
   virtual
   +        * address.
   +        */
   +        directmap_virt_start -=3D (base_addr & high_bits_mask) +
   (base_addr & ~high_bits_mask);
        }
   =20
        if ( base_mfn < mfn_x(directmap_mfn_start) )
            panic("cannot add directmap mapping at %#lx below heap
   start %#lx\n",
                  base_mfn, mfn_x(directmap_mfn_start));
   =20
   -    /*
   -     * The base address may not be aligned to the second level
   -     * size in case of Sv39 (e.g. 1GB when using 4KB pages).
   -     * This would prevent superpage mappings for all the regions
   -     * because the virtual address and machine address should
   -     * both be suitably aligned.
   -     *
   -     * Prevent that by offsetting the start of the directmap
   virtual
   -     * address.
   -     */
   -    if ( map_pages_to_xen(DIRECTMAP_VIRT_START + (base_addr &
   ~high_bits_mask),
   +    if ( map_pages_to_xen((vaddr_t)mfn_to_virt(base_mfn),
                              _mfn(base_mfn), nr_mfns,
                              PAGE_HYPERVISOR_RW) )

Thanks!

~ Oleksii

