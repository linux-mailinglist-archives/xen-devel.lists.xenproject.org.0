Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3628D9A40C
	for <lists+xen-devel@lfdr.de>; Fri, 23 Aug 2019 01:48:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0wl0-0007fN-46; Thu, 22 Aug 2019 23:44:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TCGK=WS=gmail.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1i0wky-0007fF-BV
 for xen-devel@lists.xenproject.org; Thu, 22 Aug 2019 23:44:40 +0000
X-Inumbo-ID: ce30bca8-c536-11e9-8980-bc764e2007e4
Received: from mail-ua1-x941.google.com (unknown [2607:f8b0:4864:20::941])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ce30bca8-c536-11e9-8980-bc764e2007e4;
 Thu, 22 Aug 2019 23:44:39 +0000 (UTC)
Received: by mail-ua1-x941.google.com with SMTP id r10so2644087uam.1
 for <xen-devel@lists.xenproject.org>; Thu, 22 Aug 2019 16:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qzczsjuTDBp4MCHiOP+HOnnpbtzWe53kDw8N9oJY1iw=;
 b=nLByK2YZOS1ANgFtcfN36xyididg9xZ2JecpNZ8zyebf37iypxMouqv7Mltnecjgiw
 0Jgl5Md1pIsCT+b+nEjO98mpif4IaDz1/OAnRh64g8PLKHsEha/FRqIS+sewz0WJ/7yC
 FiCpueVSjZ/iI8Y8y1897tuPi20X1LQTgaOGYBSsx1637/p+9aRVre6wQ5i1FsSvMMAm
 wA/THqsgT4oi1HuDw6X2xuDsULRnjdSNMoAAIv8PF4Otid+HZSVmZ6nK/gpDiMqjCVzP
 SCKT+dDNYOQ2NOOW6M7ZMMtw4FehWuX9L7EXr9fFGNF4mGr0upSaHUYQw4VXn+Bwbt5U
 q7Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qzczsjuTDBp4MCHiOP+HOnnpbtzWe53kDw8N9oJY1iw=;
 b=Bn2exarF+Ey4Zs4iB5F0SOHiQUDiEpdq1ZRFoxf6m+P3NpAr+TlGUkTUibn3skF5QG
 omLlUElApCcnNKC18C29lgCNC204fUhRWahpkiRZ5JTNe0xZzKigjX0UC/2iMyrcwq1R
 CgbT2VfGCMlOkdQ4zoO59LsgHPtUMVl5hYqAuVO8nBWaaYkIzqb57EAp1mkoA9hJn1Ib
 t6YqVh7ashGyJRRkAmLTRmeRwLWALJvfiHND2kltOdqnOOYy8f0b+cT2gxlvvbtrh4jN
 BJduDp5FZHeLm9DF+fh1lbiF1OVx9sAr195Bf4Mh4zrB+Z/3HN5ppdP/B5Z6epTgRdFG
 b45A==
X-Gm-Message-State: APjAAAWUztBIDd28seBTPi4oyNj8NoJXWUbI4qor66UcsLaHD/FlC/Or
 WZfCab4Jzyjy/tJHHgBYJb2z1XwH5tiodN4OQUo=
X-Google-Smtp-Source: APXvYqz8Fin3a404OWbOatEMAfeNFtp2lXvjN/LGcULk9zKc+dB1IoB83xaEcY67gKR3JoytvSe60y25I1Zr2WMdXOg=
X-Received: by 2002:ab0:240e:: with SMTP id f14mr1355522uan.26.1566517478559; 
 Thu, 22 Aug 2019 16:44:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190812173019.11956-1-julien.grall@arm.com>
 <20190812173019.11956-26-julien.grall@arm.com>
 <alpine.DEB.2.21.1908221604020.25445@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.1908221604020.25445@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall@gmail.com>
Date: Fri, 23 Aug 2019 00:44:26 +0100
Message-ID: <CAF3u54CHeN3qkE3eOJDSyCAgfK=sQp8Lv-gOnP6WspF6X7oG3A@mail.gmail.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [Xen-devel] [PATCH v3 25/28] xen/arm64: head: Introduce macros
 to create table and mapping entry
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Julien Grall <julien.grall@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: multipart/mixed; boundary="===============4265127629131956411=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============4265127629131956411==
Content-Type: multipart/alternative; boundary="000000000000d8154e0590bd4528"

--000000000000d8154e0590bd4528
Content-Type: text/plain; charset="UTF-8"

On Fri, 23 Aug 2019, 00:33 Stefano Stabellini, <sstabellini@kernel.org>
wrote:

> On Mon, 12 Aug 2019, Julien Grall wrote:
> > At the moment, any update to the boot-pages are open-coded. This is
> > making more difficult to understand the logic of a function as each
> > update roughly requires 6 instructions.
> >
> > To ease the readability, two new macros are introduced:
> >     - create_table_entry: Create a page-table entry in a given table.
> >     This can work at any level.
> >     - create_mapping_entry: Create a mapping entry in a given table.
> >     None of the users will require to map at any other level than 3rd
> >     (i.e page granularity). So the macro is supporting support 3rd level
>                                                          ^ you meant
>                                                          only?
>

Yes, I will fix it.


> >     mapping.
> >
> > Furthermore, the two macros are capable to work independently of the
> > state of the MMU.
> >
> > Lastly, take the opportunity to replace open-coded version in
> > setup_fixmap() by the two new macros. The ones in create_page_tables()
> > will be replaced in a follow-up patch.
> >
> > Signed-off-by: Julien Grall <julien.grall@arm.com>
> >
> > ---
> >     Changes in v3:
> >         - Patch added
> > ---
> >  xen/arch/arm/arm64/head.S | 83
> ++++++++++++++++++++++++++++++++++++++---------
> >  1 file changed, 67 insertions(+), 16 deletions(-)
> >
> > diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
> > index f2a0e1d3b0..f4177dbba1 100644
> > --- a/xen/arch/arm/arm64/head.S
> > +++ b/xen/arch/arm/arm64/head.S
> > @@ -492,6 +492,68 @@ cpu_init:
> >  ENDPROC(cpu_init)
> >
> >  /*
> > + * Macro to create a page table entry in \ptbl to \tbl
> > + *
> > + * ptbl:    table symbol where the entry will be created
> > + * tbl:     table symbol to point to
> > + * virt:    virtual address
>
> Why not pass the virtual address as a symbol too?
>

Because we have no symbol for most of the virtual addresses. They are just
constant defined in config.h.


>
> > + * shift:   #imm page table shift
> > + * tmp1:    scratch register
> > + * tmp2:    scratch register
> > + * tmp3:    scratch register
> > + *
> > + * Preserves \virt
> > + * Clobbers \tmp1, \tmp2, \tmp3
> > + *
> > + * Also use x20 for the phys offset.
> > + *
> > + * Note that all parameters using registers should be distinct.
> > + */
> > +.macro create_table_entry, ptbl, tbl, virt, shift, tmp1, tmp2, tmp3
> > +        lsr   \tmp1, \virt, #\shift
> > +        and   \tmp1, \tmp1, #LPAE_ENTRY_MASK/* \tmp1 := slot in \tlb */
> > +
> > +        load_paddr \tmp2, \tbl
> > +        mov   \tmp3, #PT_PT                 /* \tmp3 := right for
> linear PT */
> > +        orr   \tmp3, \tmp3, \tmp2           /*          + \tlb paddr */
> > +
> > +        adr_l \tmp2, \ptbl
> > +
> > +        str   \tmp3, [\tmp2, \tmp1, lsl #3]
> > +.endm
> > +
> > +/*
> > + * Macro to create a mapping entry in \tbl to \phys. Only mapping in 3rd
> > + * level table (i.e page granularity) is supported.
> > + *
> > + * tbl:     table symbol where the entry will be created
>
> NIT: for consistency, I would prefer if you called it ptlb
>

Ok.


>
> > + * virt:    virtual address
>
> It could be a symbol here, right?
>

No. See above.


>
> > + * phys:    physical address (should be page aligned)
> > + * tmp1:    scratch register
> > + * tmp2:    scratch register
> > + * tmp3:    scratch register
> > + * type:    mapping type. If not specified it will be normal memory
> (PT_MEM_L3)
> > + *
> > + * Preserves \virt, \phys
> > + * Clobbers \tmp1, \tmp2, \tmp3
> > + *
> > + * Note that all parameters using registers should be distinct.
> > + */
> > +.macro create_mapping_entry, tbl, virt, phys, tmp1, tmp2, tmp3,
> type=PT_MEM_L3
> > +        and   \tmp3, \phys, #THIRD_MASK     /* \tmp3 :=
> PAGE_ALIGNED(phys) */
> > +
> > +        lsr   \tmp1, \virt, #THIRD_SHIFT
> > +        and   \tmp1, \tmp1, #LPAE_ENTRY_MASK/* \tmp1 := slot in \tlb */
> > +
> > +        mov   \tmp2, #\type                 /* \tmp2 := right for
> section PT */
> > +        orr   \tmp2, \tmp2, \tmp3           /*          +
> PAGE_ALIGNED(phys) */
> > +
> > +        adr_l \tmp3, \tbl
> > +
> > +        str   \tmp2, [\tmp3, \tmp1, lsl #3]
> > +.endm
> > +
> > +/*
> >   * Rebuild the boot pagetable's first-level entries. The structure
> >   * is described in mm.c.
> >   *
> > @@ -735,28 +797,17 @@ ENDPROC(remove_identity_mapping)
> >   *   x20: Physical offset
> >   *   x23: Early UART base physical address
> >   *
> > - * Clobbers x1 - x4
> > + * Clobbers x0 - x3
> >   */
> >  setup_fixmap:
> >  #ifdef CONFIG_EARLY_PRINTK
> >          /* Add UART to the fixmap table */
> > -        ldr   x1, =xen_fixmap        /* x1 := vaddr (xen_fixmap) */
> > -        lsr   x2, x23, #THIRD_SHIFT
> > -        lsl   x2, x2, #THIRD_SHIFT   /* 4K aligned paddr of UART */
> > -        mov   x3, #PT_DEV_L3
> > -        orr   x2, x2, x3             /* x2 := 4K dev map including UART
> */
> > -        str   x2, [x1, #(FIXMAP_CONSOLE*8)] /* Map it in the first
> fixmap's slot */
> > +        ldr   x0, =EARLY_UART_VIRTUAL_ADDRESS
> > +        create_mapping_entry xen_fixmap, x0, x23, x1, x2, x3,
> type=PT_DEV_L3
> >  #endif
> > -
> >          /* Map fixmap into boot_second */
> > -        ldr   x4, =boot_second       /* x4 := vaddr (boot_second) */
> > -        load_paddr x2, xen_fixmap
> > -        mov   x3, #PT_PT
> > -        orr   x2, x2, x3             /* x2 := table map of xen_fixmap */
> > -        ldr   x1, =FIXMAP_ADDR(0)
> > -        lsr   x1, x1, #(SECOND_SHIFT - 3)   /* x1 := Slot for FIXMAP(0)
> */
> > -        str   x2, [x4, x1]           /* Map it in the fixmap's slot */
> > -
> > +        ldr   x0, =FIXMAP_ADDR(0)
> > +        create_table_entry boot_second, xen_fixmap, x0, SECOND_SHIFT,
> x1, x2, x3
> >          /* Ensure any page table updates made above have occurred. */
> >          dsb   nshst
> >
> > --
> > 2.11.0
> >
>
> _______________________________________________
> Xen-devel mailing list
> Xen-devel@lists.xenproject.org
> https://lists.xenproject.org/mailman/listinfo/xen-devel

--000000000000d8154e0590bd4528
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Fri, 23 Aug 2019, 00:33 Stefano Stabellini, &lt;<a =
href=3D"mailto:sstabellini@kernel.org">sstabellini@kernel.org</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">On Mon, 12 Aug 2019, Julien Grall=
 wrote:<br>
&gt; At the moment, any update to the boot-pages are open-coded. This is<br=
>
&gt; making more difficult to understand the logic of a function as each<br=
>
&gt; update roughly requires 6 instructions.<br>
&gt; <br>
&gt; To ease the readability, two new macros are introduced:<br>
&gt;=C2=A0 =C2=A0 =C2=A0- create_table_entry: Create a page-table entry in =
a given table.<br>
&gt;=C2=A0 =C2=A0 =C2=A0This can work at any level.<br>
&gt;=C2=A0 =C2=A0 =C2=A0- create_mapping_entry: Create a mapping entry in a=
 given table.<br>
&gt;=C2=A0 =C2=A0 =C2=A0None of the users will require to map at any other =
level than 3rd<br>
&gt;=C2=A0 =C2=A0 =C2=A0(i.e page granularity). So the macro is supporting =
support 3rd level<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^ you meant<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0only?<br></blockquot=
e></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Yes, I will fix=
 it.</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail=
_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex">
<br>
&gt;=C2=A0 =C2=A0 =C2=A0mapping.<br>
&gt; <br>
&gt; Furthermore, the two macros are capable to work independently of the<b=
r>
&gt; state of the MMU.<br>
&gt; <br>
&gt; Lastly, take the opportunity to replace open-coded version in<br>
&gt; setup_fixmap() by the two new macros. The ones in create_page_tables()=
<br>
&gt; will be replaced in a follow-up patch.<br>
&gt; <br>
&gt; Signed-off-by: Julien Grall &lt;<a href=3D"mailto:julien.grall@arm.com=
" target=3D"_blank" rel=3D"noreferrer">julien.grall@arm.com</a>&gt;<br>
&gt; <br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0 =C2=A0Changes in v3:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- Patch added<br>
&gt; ---<br>
&gt;=C2=A0 xen/arch/arm/arm64/head.S | 83 +++++++++++++++++++++++++++++++++=
+++++---------<br>
&gt;=C2=A0 1 file changed, 67 insertions(+), 16 deletions(-)<br>
&gt; <br>
&gt; diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S<br>
&gt; index f2a0e1d3b0..f4177dbba1 100644<br>
&gt; --- a/xen/arch/arm/arm64/head.S<br>
&gt; +++ b/xen/arch/arm/arm64/head.S<br>
&gt; @@ -492,6 +492,68 @@ cpu_init:<br>
&gt;=C2=A0 ENDPROC(cpu_init)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 /*<br>
&gt; + * Macro to create a page table entry in \ptbl to \tbl<br>
&gt; + *<br>
&gt; + * ptbl:=C2=A0 =C2=A0 table symbol where the entry will be created<br=
>
&gt; + * tbl:=C2=A0 =C2=A0 =C2=A0table symbol to point to<br>
&gt; + * virt:=C2=A0 =C2=A0 virtual address<br>
<br>
Why not pass the virtual address as a symbol too?<br></blockquote></div></d=
iv><div dir=3D"auto"><br></div><div dir=3D"auto">Because we have no symbol =
for most of the virtual addresses. They are just constant defined in config=
.h.</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_=
quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex">
<br>
<br>
&gt; + * shift:=C2=A0 =C2=A0#imm page table shift<br>
&gt; + * tmp1:=C2=A0 =C2=A0 scratch register<br>
&gt; + * tmp2:=C2=A0 =C2=A0 scratch register<br>
&gt; + * tmp3:=C2=A0 =C2=A0 scratch register<br>
&gt; + *<br>
&gt; + * Preserves \virt<br>
&gt; + * Clobbers \tmp1, \tmp2, \tmp3<br>
&gt; + *<br>
&gt; + * Also use x20 for the phys offset.<br>
&gt; + *<br>
&gt; + * Note that all parameters using registers should be distinct.<br>
&gt; + */<br>
&gt; +.macro create_table_entry, ptbl, tbl, virt, shift, tmp1, tmp2, tmp3<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 lsr=C2=A0 =C2=A0\tmp1, \virt, #\shift<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 and=C2=A0 =C2=A0\tmp1, \tmp1, #LPAE_ENTRY=
_MASK/* \tmp1 :=3D slot in \tlb */<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 load_paddr \tmp2, \tbl<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 mov=C2=A0 =C2=A0\tmp3, #PT_PT=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* \tmp3 :=3D right for=
 linear PT */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 orr=C2=A0 =C2=A0\tmp3, \tmp3, \tmp2=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 + \=
tlb paddr */<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 adr_l \tmp2, \ptbl<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 str=C2=A0 =C2=A0\tmp3, [\tmp2, \tmp1, lsl=
 #3]<br>
&gt; +.endm<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * Macro to create a mapping entry in \tbl to \phys. Only mapping in =
3rd<br>
&gt; + * level table (i.e page granularity) is supported.<br>
&gt; + *<br>
&gt; + * tbl:=C2=A0 =C2=A0 =C2=A0table symbol where the entry will be creat=
ed<br>
<br>
NIT: for consistency, I would prefer if you called it ptlb<br></blockquote>=
</div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Ok.</div><div dir=
=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex">
<br>
<br>
&gt; + * virt:=C2=A0 =C2=A0 virtual address<br>
<br>
It could be a symbol here, right?<br></blockquote></div></div><div dir=3D"a=
uto"><br></div><div dir=3D"auto">No. See above.</div><div dir=3D"auto"><br>=
</div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex">
<br>
<br>
&gt; + * phys:=C2=A0 =C2=A0 physical address (should be page aligned)<br>
&gt; + * tmp1:=C2=A0 =C2=A0 scratch register<br>
&gt; + * tmp2:=C2=A0 =C2=A0 scratch register<br>
&gt; + * tmp3:=C2=A0 =C2=A0 scratch register<br>
&gt; + * type:=C2=A0 =C2=A0 mapping type. If not specified it will be norma=
l memory (PT_MEM_L3)<br>
&gt; + *<br>
&gt; + * Preserves \virt, \phys<br>
&gt; + * Clobbers \tmp1, \tmp2, \tmp3<br>
&gt; + *<br>
&gt; + * Note that all parameters using registers should be distinct.<br>
&gt; + */<br>
&gt; +.macro create_mapping_entry, tbl, virt, phys, tmp1, tmp2, tmp3, type=
=3DPT_MEM_L3<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 and=C2=A0 =C2=A0\tmp3, \phys, #THIRD_MASK=
=C2=A0 =C2=A0 =C2=A0/* \tmp3 :=3D PAGE_ALIGNED(phys) */<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 lsr=C2=A0 =C2=A0\tmp1, \virt, #THIRD_SHIF=
T<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 and=C2=A0 =C2=A0\tmp1, \tmp1, #LPAE_ENTRY=
_MASK/* \tmp1 :=3D slot in \tlb */<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 mov=C2=A0 =C2=A0\tmp2, #\type=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* \tmp2 :=3D right for=
 section PT */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 orr=C2=A0 =C2=A0\tmp2, \tmp2, \tmp3=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 + P=
AGE_ALIGNED(phys) */<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 adr_l \tmp3, \tbl<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 str=C2=A0 =C2=A0\tmp2, [\tmp3, \tmp1, lsl=
 #3]<br>
&gt; +.endm<br>
&gt; +<br>
&gt; +/*<br>
&gt;=C2=A0 =C2=A0* Rebuild the boot pagetable&#39;s first-level entries. Th=
e structure<br>
&gt;=C2=A0 =C2=A0* is described in mm.c.<br>
&gt;=C2=A0 =C2=A0*<br>
&gt; @@ -735,28 +797,17 @@ ENDPROC(remove_identity_mapping)<br>
&gt;=C2=A0 =C2=A0*=C2=A0 =C2=A0x20: Physical offset<br>
&gt;=C2=A0 =C2=A0*=C2=A0 =C2=A0x23: Early UART base physical address<br>
&gt;=C2=A0 =C2=A0*<br>
&gt; - * Clobbers x1 - x4<br>
&gt; + * Clobbers x0 - x3<br>
&gt;=C2=A0 =C2=A0*/<br>
&gt;=C2=A0 setup_fixmap:<br>
&gt;=C2=A0 #ifdef CONFIG_EARLY_PRINTK<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Add UART to the fixmap table */<b=
r>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ldr=C2=A0 =C2=A0x1, =3Dxen_fixmap=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 /* x1 :=3D vaddr (xen_fixmap) */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 lsr=C2=A0 =C2=A0x2, x23, #THIRD_SHIFT<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 lsl=C2=A0 =C2=A0x2, x2, #THIRD_SHIFT=C2=
=A0 =C2=A0/* 4K aligned paddr of UART */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 mov=C2=A0 =C2=A0x3, #PT_DEV_L3<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 orr=C2=A0 =C2=A0x2, x2, x3=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* x2 :=3D 4K dev map including UART */<b=
r>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 str=C2=A0 =C2=A0x2, [x1, #(FIXMAP_CONSOLE=
*8)] /* Map it in the first fixmap&#39;s slot */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ldr=C2=A0 =C2=A0x0, =3DEARLY_UART_VIRTUAL=
_ADDRESS<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 create_mapping_entry xen_fixmap, x0, x23,=
 x1, x2, x3, type=3DPT_DEV_L3<br>
&gt;=C2=A0 #endif<br>
&gt; -<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Map fixmap into boot_second */<br=
>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ldr=C2=A0 =C2=A0x4, =3Dboot_second=C2=A0 =
=C2=A0 =C2=A0 =C2=A0/* x4 :=3D vaddr (boot_second) */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 load_paddr x2, xen_fixmap<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 mov=C2=A0 =C2=A0x3, #PT_PT<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 orr=C2=A0 =C2=A0x2, x2, x3=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* x2 :=3D table map of xen_fixmap */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ldr=C2=A0 =C2=A0x1, =3DFIXMAP_ADDR(0)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 lsr=C2=A0 =C2=A0x1, x1, #(SECOND_SHIFT - =
3)=C2=A0 =C2=A0/* x1 :=3D Slot for FIXMAP(0) */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 str=C2=A0 =C2=A0x2, [x4, x1]=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Map it in the fixmap&#39;s slot */<br>
&gt; -<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ldr=C2=A0 =C2=A0x0, =3DFIXMAP_ADDR(0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 create_table_entry boot_second, xen_fixma=
p, x0, SECOND_SHIFT, x1, x2, x3<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Ensure any page table updates mad=
e above have occurred. */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dsb=C2=A0 =C2=A0nshst<br>
&gt;=C2=A0 <br>
&gt; -- <br>
&gt; 2.11.0<br>
&gt; <br>
<br>
_______________________________________________<br>
Xen-devel mailing list<br>
<a href=3D"mailto:Xen-devel@lists.xenproject.org" target=3D"_blank" rel=3D"=
noreferrer">Xen-devel@lists.xenproject.org</a><br>
<a href=3D"https://lists.xenproject.org/mailman/listinfo/xen-devel" rel=3D"=
noreferrer noreferrer" target=3D"_blank">https://lists.xenproject.org/mailm=
an/listinfo/xen-devel</a></blockquote></div></div></div>

--000000000000d8154e0590bd4528--


--===============4265127629131956411==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4265127629131956411==--

