Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC209A4124
	for <lists+xen-devel@lfdr.de>; Fri, 18 Oct 2024 16:28:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.821996.1236000 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1nwz-0004Z3-Jh; Fri, 18 Oct 2024 14:27:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 821996.1236000; Fri, 18 Oct 2024 14:27:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1nwz-0004XF-GO; Fri, 18 Oct 2024 14:27:33 +0000
Received: by outflank-mailman (input) for mailman id 821996;
 Fri, 18 Oct 2024 14:27:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jazm=RO=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1t1nwy-0004Wr-HU
 for xen-devel@lists.xenproject.org; Fri, 18 Oct 2024 14:27:32 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1b444c46-8d5d-11ef-99a3-01e77a169b0f;
 Fri, 18 Oct 2024 16:27:30 +0200 (CEST)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2fb587d0436so23378331fa.2
 for <xen-devel@lists.xenproject.org>; Fri, 18 Oct 2024 07:27:30 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53a151b01ecsm231706e87.23.2024.10.18.07.27.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Oct 2024 07:27:28 -0700 (PDT)
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
X-Inumbo-ID: 1b444c46-8d5d-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729261650; x=1729866450; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YQTm7Rcj774u6EMpqacNn4u91Je6LfJJSxE7uInnP84=;
        b=b8FbTpwvcFy30lyRl0WTZtpaS6iVLGgPkSGMT/P6A738idsr45OOGwJVqFggD51pA0
         vmc5sJ44TYPRtzeOi3bY8im/QB3XJjkRN4bBFN867iSqTAC5cKLY4l/qq1SXJX/mlFUm
         Q7bNqKMUS8mW1JfnimSTZKZDjXJBqgMeAZOMU7h1jZpCWFunLrf1zsSylxffNVsdum8x
         W7zD9Xte99VdaT1pgLzb8lu1Hu3YrhyZ72p8VvmvSr0cjLEhHj8/Gj+yIpjQEiFHEy19
         abPoLClRSJsWtJR5fdzPiIW32qCT7xzp3RwddqYY7zYIz0xywVvt+6RiBBotZwKXmP8m
         HzkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729261650; x=1729866450;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YQTm7Rcj774u6EMpqacNn4u91Je6LfJJSxE7uInnP84=;
        b=WstLgc8D1zEwauuGyjS87VdLduiBlUy7WPbAC+p9mk7tNefFTcOko6JliOcHfjPgMy
         W/asm4IRonRvofrTcLz5GZCBxYTEBK3FW9mBUZ9lLVar7K7kJMClW9FFXDd8mfrN+QG/
         IhlKWATjls7M6bmitWBJaF7sSiJm1p8encDFzIHiBq2EoguQom+qBIKyCwWwj0XRxCLF
         c0GJ38UsxdzOcTpuVX1cJj09dNgO6b5k4fyXRnhQo97XtT/chEtuf7FMJ0rqx/CmbFt/
         pMjO1YY/vKai7yMueY/VbC6WwPJ+hiLFkwKxDdv2xTdnJpKsfTEblLN8jsuzdihNl8fv
         UFSA==
X-Forwarded-Encrypted: i=1; AJvYcCXbWd7x77oOmw/ouoCoZ8uxmkB1SHHeMmNSZ7RBABX+AmYp6Rb0M9MMXj+0o7yhqXtqPPjE73naqj8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzDP5oK9OqT4Co3+0px91CBsJ3L6JvPtvdJVj/dIOmh87uCBX41
	KTKVGdsykDx6ILLj7PlubztOgEcldbnDxznU83CwxzytOP1BFMxK
X-Google-Smtp-Source: AGHT+IEw0CEg7xbRMjH85VlE4IugE61vRMANzUH41/pzLYegQLPJbPss53qgPnwJSJIAWMdDOsIxGw==
X-Received: by 2002:a05:6512:2387:b0:539:89a8:5fe8 with SMTP id 2adb3069b0e04-53a1522a886mr2164104e87.29.1729261649308;
        Fri, 18 Oct 2024 07:27:29 -0700 (PDT)
Message-ID: <abc1c95497372f3a46b34c6694b75b4e1647d4b9.camel@gmail.com>
Subject: Re: [PATCH v1 3/5] xen/riscv: introduce setup_mm()
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Date: Fri, 18 Oct 2024 16:27:28 +0200
In-Reply-To: <37929e86-0394-499e-ada1-4686ff77d3f7@suse.com>
References: <cover.1729068334.git.oleksii.kurochko@gmail.com>
	 <300a4a5911766d42ec01c3fcaee664d72b484296.1729068334.git.oleksii.kurochko@gmail.com>
	 <37929e86-0394-499e-ada1-4686ff77d3f7@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40app2) 
MIME-Version: 1.0

On Thu, 2024-10-17 at 17:15 +0200, Jan Beulich wrote:
> On 16.10.2024 11:15, Oleksii Kurochko wrote:
>=20
> > +=C2=A0=C2=A0=C2=A0 if ( map_pages_to_xen((vaddr_t)mfn_to_virt(0),
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 _mfn(0), nr_mfns,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 PAGE_HYPERVISOR_RW) )
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 panic("Unable to setup the =
directmap mappings.\n");
> > +}
> > +
> > +/* Map a frame table to cover physical addresses ps through pe */
> > +static void __init setup_frametable_mappings(paddr_t ps, paddr_t
> > pe)
> > +{
> > +=C2=A0=C2=A0=C2=A0 unsigned long nr_mfns =3D mfn_x(mfn_add(maddr_to_mf=
n(pe), -1)) -
>=20
> This looks to be accounting for a partial page at the end.
>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 mfn_x(maddr_to_mfn(ps)) + 1;
>=20
> Whereas this doesn't do the same at the start. The sole present
> caller
> passes 0, so that's going to be fine for the time being. Yet it's a
> latent pitfall. I'd recommend to either drop the function parameter,
> or
> to deal with it correctly right away.
Then it will be better to do in the next way to be sure that everything
is properly aligned:
   unsigned long nr_mfns =3D PFN_DOWN(ALIGN_UP(pe) - ALIGN_DOWN(ps));

> > +=C2=A0=C2=A0=C2=A0 memset(&frame_table[0], 0, nr_mfns * sizeof(struct
> > page_info));
> > +=C2=A0=C2=A0=C2=A0 memset(&frame_table[nr_mfns], -1,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 frametabl=
e_size - (nr_mfns * sizeof(struct
> > page_info)));
> > +}
> > +
> > +vaddr_t directmap_virt_end __read_mostly;
>=20
> __ro_after_init? And moved ahead of the identifier, just like ...
>=20
> > +/*
> > + * Setup memory management
> > + *
> > + * RISC-V 64 has a large virtual address space (the minimum
> > supported
> > + * MMU mode is Sv39, which provides TBs of VA space).
> > + * In the case of RISC-V 64, the directmap and frametable are
> > mapped
> > + * starting from physical address 0 to simplify the page_to_mfn(),
> > + * mfn_to_page(), and maddr_to_virt() calculations, as there is no
> > need
> > + * to account for {directmap, frametable}_base_pdx in this setup.
> > + */
> > +void __init setup_mm(void)
>=20
> ... __init is placed e.g. here.
>=20
> It's also unclear why the variable needs to be non-static.
As it could be use then for some ASSERT(), for example, in
virt_to_page() as Arm or x86 do.

>=20
> > +{
> > +=C2=A0=C2=A0=C2=A0 const struct membanks *banks =3D bootinfo_get_mem()=
;
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
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ram_size =3D ram_size + ban=
k->size;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ram_end =3D max(ram_end, ba=
nk_end);
> > +=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0 setup_directmap_mappings(PFN_DOWN(ram_end));
>=20
> While you may want to use non-offset-ed mappings, I can't see how you
> can
> validly map just a single huge chunk, no matter whether there are
> holes
> in there. Such holes could hold MMIO regions, which I'm sure would
> require
> more careful mapping (to avoid cacheable accesses, or even
> speculative
> ones).
My intention was to avoid subraction of directmap_start ( =3D ram_start )
in maddr_to_virt() to have less  operations during maddr to virt
calculation:
   static inline void *maddr_to_virt(paddr_t ma)
   {
       /* Offset in the direct map, accounting for pdx compression */
       unsigned long va_offset =3D maddr_to_directmapoff(ma);
  =20
       ASSERT(va_offset < DIRECTMAP_SIZE);
  =20
       return (void *)(DIRECTMAP_VIRT_START /* - directmap_start */ +
   va_offset);
   }
But it seems I don't have any chance to avoid that because of mentioned
by you reasons... Except probably to have a config which will hard code
RAM_START for each platform ( what on other hand will make Xen less
flexible in some point ).
Does it make sense to have a config instead of identifying ram_start in
runtime?

So I have to rework this part of code to look as:
    for ( i =3D 0; i < banks->nr_banks; i++ )
    {
        const struct membank *bank =3D &banks->bank[i];
        paddr_t bank_end =3D bank->start + bank->size;

        ram_size =3D ram_size + bank->size;
        ram_start =3D min(ram_start, bank->start);
        ram_end =3D max(ram_end, bank_end);

        setup_directmap_mappings(PFN_DOWN(bank->start),
                                 PFN_DOWN(bank->size));
    }


>=20
> > +=C2=A0=C2=A0=C2=A0 total_pages =3D PFN_DOWN(ram_size);
>=20
> Imo the rounding down to page granularity needs to be done when
> ram_size
> is accumulated, such that partial pages simply won't be counted.
> Unless
> of course there's a guarantee that banks can never have partial pages
> at
> their start/end.
Hmm, good point. I thought that start/end is always properly aligned
but I can't find in device tree spec that it is guaranteed for memory
node, so it will really better rounding down after ram_size is
accumulated.

~ Oleksii

