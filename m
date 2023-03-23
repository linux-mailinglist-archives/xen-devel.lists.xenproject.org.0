Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94DDA6C6858
	for <lists+xen-devel@lfdr.de>; Thu, 23 Mar 2023 13:31:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513829.795444 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfK5l-0007dL-UF; Thu, 23 Mar 2023 12:30:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513829.795444; Thu, 23 Mar 2023 12:30:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfK5l-0007YW-QJ; Thu, 23 Mar 2023 12:30:53 +0000
Received: by outflank-mailman (input) for mailman id 513829;
 Thu, 23 Mar 2023 12:30:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6w1C=7P=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pfK5k-0007Af-4b
 for xen-devel@lists.xenproject.org; Thu, 23 Mar 2023 12:30:52 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8b30e8af-c976-11ed-b464-930f4c7d94ae;
 Thu, 23 Mar 2023 13:30:49 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id d17so11843399wrb.11
 for <xen-devel@lists.xenproject.org>; Thu, 23 Mar 2023 05:30:49 -0700 (PDT)
Received: from [192.168.8.100] (46.204.108.203.nat.umts.dynamic.t-mobile.pl.
 [46.204.108.203]) by smtp.gmail.com with ESMTPSA id
 o15-20020a1c750f000000b003ee1acdb036sm1765109wmc.17.2023.03.23.05.30.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Mar 2023 05:30:48 -0700 (PDT)
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
X-Inumbo-ID: 8b30e8af-c976-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679574649;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=in0lf9ii5GPOrlUOvE3Yr5xLBd1uYt4KFlxj9vcUjuI=;
        b=RGmudVwIInFbJSzMZ5+dQU2Icv+duMBKEKILNJ039Ptdbx0RWss6u/yTShcgfFKNhx
         oBrf4b/uFOxwsWni76CLp6WRK9EtkYoyPhxS6uSndaz4kSpwnbe+kl119mm7xuuJGMxs
         kLitKikY8Uvtnsh4UYsMaSb9CyszYS80nDxdx5h0LMD5VLmkIvp/jSRfWl3A63DilM24
         EpoOjcJaU4/vlXcLN8INHE97wufvSvgwa75bHMAWl0EluLCAEhSoYkLWDTwIs1Iz3yuj
         dPEjhFbQXeiDrZU02RXRH9t4xMnJjOKT/q8uo18ltCOAv4sfLZulV8WFb986mZ4IhkcG
         Ci6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679574649;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=in0lf9ii5GPOrlUOvE3Yr5xLBd1uYt4KFlxj9vcUjuI=;
        b=h7GAPeavue+YJWbcPGf7zfbsvFmI3gKiUTc0Z00SmrBEYYCqzrUUb19tOzDKhwa2KB
         XN2qsFQ+mWYJpPItYX7ZRGCtr6VJttQq4jAAdF42RRgFS/lEvFLFLrwcnRMuE6oopH3b
         kWqJBGi0HtyudeJPgWaqUqHyae+lZPwRRki8K3XaTYzxPIQxDugUhJXsQFV2K9kv/RYL
         qQJRN9GsVvVWkZipc6LFVHSyCWwXIw05PiCb2RvLl1tXJbOu5re3e+zlcOf55f+QrmXb
         +VdJ+oJeyCqWv/cwt4JnPMpF/gson4GMidV6tksuPRT1DO18h4wJ/K6JypjynuztlNar
         dL1Q==
X-Gm-Message-State: AAQBX9dfvZsGtEDbnu9x6FOrT+NHvU3lq4atFT+q6N8y7saRCCdbEPKj
	5xcbXUkry+z3Y2Ahj+H2yB0=
X-Google-Smtp-Source: AKy350aEDY965eESuv4lwVtt4eXaI44ZQJXqja2Xx3oo2RIdE4sUJXnJER7vAbcXvaBTg3V2TFiGvQ==
X-Received: by 2002:adf:dd06:0:b0:2cf:f3e8:910d with SMTP id a6-20020adfdd06000000b002cff3e8910dmr2652504wrm.16.1679574649125;
        Thu, 23 Mar 2023 05:30:49 -0700 (PDT)
Message-ID: <1da599963f20f84c84a9114e10776da3ed0d35e2.camel@gmail.com>
Subject: Re: [PATCH v2 1/3] xen/riscv: introduce setup_initial_pages
From: Oleksii <oleksii.kurochko@gmail.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>,  Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>, 
 Connor Davis <connojdavis@gmail.com>
Date: Thu, 23 Mar 2023 14:30:45 +0200
In-Reply-To: <98194c59-6bd8-7b98-c94d-df0f4faf0c04@xen.org>
References: <cover.1678984041.git.oleksii.kurochko@gmail.com>
	 <85a21ada5a0fc44bb9db1dcc1f6cf191a6e66bfb.1678984041.git.oleksii.kurochko@gmail.com>
	 <9ff0e335-6cb2-be49-046d-745ce05f7086@xen.org>
	 <5169c6c8a0c4c90b56e3f525a55de464edf7181e.camel@gmail.com>
	 <60444252-80b6-230e-9090-2c96d5d6187d@xen.org>
	 <c9f4b34c4aef31906e715c7ddce8e077e5eef52c.camel@gmail.com>
	 <98194c59-6bd8-7b98-c94d-df0f4faf0c04@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0

On Thu, 2023-03-23 at 11:57 +0000, Julien Grall wrote:
> On 23/03/2023 11:18, Oleksii wrote:
> > Hi Julien,
>=20
> Hi Oleksii,
>=20
> > On Wed, 2023-03-22 at 14:21 +0000, Julien Grall wrote:
> > ...
> > >=20
> > > > > > +=C2=A0=C2=A0=C2=A0 unsigned long page_addr;
> > > > > > +
> > > > > > +=C2=A0=C2=A0=C2=A0 // /* align start addresses */
> > > > > > +=C2=A0=C2=A0=C2=A0 // map_start &=3D XEN_PT_LEVEL_MAP_MASK(0);
> > > > > > +=C2=A0=C2=A0=C2=A0 // pa_start &=3D XEN_PT_LEVEL_MAP_MASK(0);
> > > > >=20
> > > > > They should be switched to ASSERT() or BUG_ON().
> > > > Sure. Thanks. I'll update.
> > > > >=20
> > > > > > +
> > > > > > +=C2=A0=C2=A0=C2=A0 page_addr =3D map_start;
> > > > > > +=C2=A0=C2=A0=C2=A0 while ( page_addr < map_end )
> > > > >=20
> > > > > This loop is continue to assume that only the mapping can
> > > > > first
> > > > > in
> > > > > 2MB
> > > > > section (or less if the start is not 2MB aligned).
> > > > >=20
> > > > > I am OK if you want to assume it, but I think this should be
> > > > > documented
> > > > > (with words and ASSERT()/BUG_ON()) to avoid any mistake.
> > > > I add a check in setup_initial_pagetables:
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BUG_ON(load_addr_start % (PAGE=
_ENTRIES * PAGE_SIZE) !=3D
> > > > 0);
> > > > Probably this is not a correct place and should be moved to
> > > > setup_initial_mapping() instead of setup_initial_pagetables()
> > >=20
> > > Yes it should be moved in setup_initial_mapping().
> > Then I'll moved it to setup_initial_mapping()
> > >=20
> > > > >=20
> > > > > > +=C2=A0=C2=A0=C2=A0 {
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long index=
2 =3D pt_index(2, page_addr);
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long index=
1 =3D pt_index(1, page_addr);
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long index=
0 =3D pt_index(0, page_addr);
> > > > > > +
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Setup level2 tab=
le */
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 second[index2] =3D =
paddr_to_pte((unsigned
> > > > > > long)first);
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 second[index2].pte =
|=3D PTE_TABLE;
> > > > > > +
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Setup level1 tab=
le */
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 first[index1] =3D p=
addr_to_pte((unsigned
> > > > > > long)zeroeth);
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 first[index1].pte |=
=3D PTE_TABLE;
> > > > > > +
> > > > > > +
> > > > >=20
> > > > > NIT: Spurious line?
> > > > Yeah, should be removed. Thanks.
> > > > >=20
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Setup level0 tab=
le */
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( !pte_is_valid(=
&zeroeth[index0]) )
> > > > >=20
> > > > > On the previous version, you said it should be checked for
> > > > > each
> > > > > level.
> > > > I had a terrible internet connection, and my message wasn't
> > > > sent.
> > >=20
> > > No worries.
> > >=20
> > > >=20
> > > > I decided not to check that l2 and l1 are used only for
> > > > referring
> > > > to
> > > > the next page table but not leaf PTE. So it is safe to
> > > > overwrite it
> > > > each time (the addresses of page tables are the same all the
> > > > time)
> > >=20
> > > You are letting the caller to decide which page-table to use for
> > > each
> > > level. So you are at the mercy that caller will do the right
> > > thing.
> > >=20
> > > IHMO, this is a pretty bad idea because debugging page-tables
> > > error
> > > are
> > > difficult. So it is better to have safety in place. This is not
> > > worth...
> > >=20
> > > =C2=A0=C2=A0 and
> > > > probably it will be better from optimization point of view to
> > > > ignore if
> > > > clauses.
> > >=20
> > > ... the optimization in particular when this is at boot time.
> > I didn't think about that caller will do always the right thing so
> > I will add the check.
> > >=20
> > > >=20
> > > > And it is needed in case of L0 because it is possible that some
> > > > addressed were marked with specific flag ( execution, read,
> > > > write )
> > > > and
> > > > so not to overwrite the flags set before the check is needed.
> > > In which case you should really report an error because the
> > > caller
> > > may
> > > have decide to set execution flag and you don't honor. So when
> > > the
> > > code
> > > is executed, you will receive a fault and this may be hard to
> > > find
> > > out
> > > what happen.
> >=20
> > Right now, it is expected situation that the caller will try to
> > change
> > execution flag during the setup of initial page tables. >
> > It is possible in the currently implemented logic of the setup of
> > initial page tables.
>=20
> This sounds like a bug in your caller implementation. You should not
> try=20
> to workaround this in your code updating the page-tables.
>=20
> > Let me explain what I mean.
> >=20
> > The first step of setup_initial_pagetables() is to map .text,
> > .init,
> > .rodata with necessary flags RX, RX, R.
> > Remaining sections will have RW flags, and to map them,
> > setup_initial_mapping() is called for the whole range of
> > [linker_start,
> > linker_end] not to map them one by one thereby during this step
> > setup_initial_mapping() will try to remap addresses ranges which
> > overlap with .text, .init, .rodata with RW flags but it should
> > leave
> > with the previously set flags.
> Why do you need to call setup_init_mapping() with the whole range? In
> fact the only reason I can think this is useful is when you when to=20
> create a 1:1 mapping when the linker and load address is different.
It is needed to not map each section separately one by one as most of
the sections have the same PTE_FLAGS (Read, Write, eXectuable, etc )

So it was decided to map the following sections separately as they have
'unique' flags:
 - .text -> RX
 - .rodata -> R
 - .init.text -> RX

All other sections are RW and could be covered by one call of
setup_init_mapping() for the whole range:
 - .data.ro_after_init
 - .data.read_mostly=20
 - .data=20
 - .init.data=20
 - .bss
So some ranges ( .text, .rodata, .init.text ) from the whole range will
be skipped as already mapped and the rest sections will be mapped
during one call of setup_init_mapping().

> But...
>=20
> > > > > > +
> > > > > > +=C2=A0=C2=A0=C2=A0 /* Get the addresses where the page tables =
were loaded
> > > > > > */
> > > > > > +=C2=A0=C2=A0=C2=A0 second=C2=A0 =3D (pte_t *)(&xen_second_page=
table);
> > > > > > +=C2=A0=C2=A0=C2=A0 first=C2=A0=C2=A0 =3D (pte_t *)(&xen_first_=
pagetable);
> > > > > > +=C2=A0=C2=A0=C2=A0 zeroeth =3D (pte_t *)(&xen_zeroeth_pagetabl=
e);
> > > > > > +
> > > > > > +=C2=A0=C2=A0=C2=A0 setup_initial_mapping(second, first, zeroet=
h,
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 LOAD_TO_LINK((unsigned
> > > > > > long)&_stext),
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 LOAD_TO_LINK((unsigned
> > > > > > long)&_etext),
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 (unsigned long)&_stext,
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 PTE_LEAF_DEFAULT);
> > > > > > +
> > > > > > +=C2=A0=C2=A0=C2=A0 setup_initial_mapping(second, first, zeroet=
h,
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 LOAD_TO_LINK((unsigned
> > > > > > long)&__init_begin),
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 LOAD_TO_LINK((unsigned
> > > > > > long)&__init_end),
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 (unsigned long)&__init_begin,
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 PTE_LEAF_DEFAULT |
> > > > > > PTE_WRITABLE);
> > > > > > +
> > > > > > +=C2=A0=C2=A0=C2=A0 setup_initial_mapping(second, first, zeroet=
h,
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 LOAD_TO_LINK((unsigned
> > > > > > long)&_srodata),
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 LOAD_TO_LINK((unsigned
> > > > > > long)&_erodata),
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 (unsigned long)(&_srodata),
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 PTE_VALID | PTE_READABLE);
> > > > > > +
> > > > > > +=C2=A0=C2=A0=C2=A0 setup_initial_mapping(second, first, zeroet=
h,
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 linker_addr_start,
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 linker_addr_end,
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 load_addr_start,
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 PTE_LEAF_DEFAULT |
> > > > > > PTE_READABLE);
> > >=20
> > > ... this is not cover above. AFAIU, this is the one for the 1:1
> > > mapping.
> > But there is no 1:1 mapping.
> > I thought that 1:1 mapping is when the physical address is equal to
> > 0x10020 then after MMU is enabled the virtual address will be the
> > same
> > 0x10020 and mapped to 0x10020.
> >=20
> > Probably I missed something but this code maps all linker addresses
> > to correspondent load addresses and it will be 1:1 only in case
> > when
> > load address is equal to linker address.
>=20
> ... here you say this is not the purpose.
>=20
> Also, if you don't intend to deal with load !=3D link address yet, then
> the following BUG_ON() needs to be updated:
>=20
> +=C2=A0=C2=A0=C2=A0 if (load_addr_start !=3D linker_addr_start)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BUG_ON((linker_addr_end > loa=
d_addr_start && load_addr_end >
> linker_addr_start));
I think that I'll cover it in the new patch series as I clarified all
necessary information and I don't expect that it will be too hard to
add from the start.
>=20
> > >=20
> > > > >=20
> > > > > As I said in v1, you need to use a different set of page-
> > > > > table
> > > > > here.
> > > > If I understand you correctly I have to use a different set of
> > > > page-
> > > > table in case when it is possible that size of Xen will be
> > > > larger
> > > > then
> > > > PAGE_SIZE. So I added to xen.lds.S a check to be sure that the
> > > > size
> > > > fits into PAGE_SIZE.
> > >=20
> > > This is not what I was referring to. I was pointing out that
> > > second,
> > > first, zeroeth are exactly the same for all the callers. You want
> > > to
> > > introduce a second set of zeroeth table. You will want to do the
> > > same
> > > for first but it is not always used.
> > >=20
> > > Otherwise, this is not going to work if Xen is loaded at a
> > > different
> > > address than the runtime.
> > Ok.
> >=20
> > I understand what do you mean in general but still I am not sure
> > that I
> > understand a particular case when I am sure that the size of Xen is
> > no
> > bigger then 2MB and load address is aligned on 2Mb boundary.
> >=20
> > The size of one l0 page table is 512 (1 << 9 ) entries which covers
> > 4K
> > (1 << 12) * 512 =3D 2 Mb of memory so it should be fine.
> > All the callers in my case are trying to map addresses from
> > [linker_start, linker_end] which is not bigger then 2 MB and is
> > aligned
> > on 2 MB boundary.
>=20
> I interpreted that your last call was meant to be for the 1:1 mapping
> when load !=3D link address. It looks like I was wrong, so the same=20
> page-table should be OK.
Thanks. Now we are on the same page.

But actually I like an idea to have more page tables and remove a
limitation to be aligned on 2MB boundary from the start.

I experimented with adding of additional table ( ( if it is necessary )
so it shouldn't be hard to add that code too.
>=20
> >=20
> > >=20
> > > That said, when I spoke with Andrew yesterday, he mentioned that
> > > your
> > > initial goal is to support the case where Xen is loaded at the
> > > runtime
> > > address. I understand this simplifies a lot the code and I told
> > > him I
> > > was OK with that. However, it would be good to document what are
> > > your
> > > goals in each series (this is not always clear what you skip on
> > > purpose).
> > >=20
> > > >=20
> > > > > Also, where do you guarantee that Xen will be loaded at a 2MB
> > > > > aligned
> > > > > address? (For a fact I know that UEFI is only guarantee 4KB
> > > > > alignment).
> > > > There is a check in setup_initial_pagetables:
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BUG_ON(load_addr_start % (PAGE=
_ENTRIES * PAGE_SIZE) !=3D
> > > > 0);
> > >=20
> > > This is not very obvious the check is to confirm that Xen is
> > > probably
> > > aligned. I would suggest to add a comment.
> > >=20
> > > Also, you might want to use XEN_PT_LEVEL_SIZE(..) to make it more
> > > obvious what sort of alignment you are trying to enforce.
> > I will update add the comment and use XEN_PT_LEVEL_SIZE(...)
> > instead.
> > >=20
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 la=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 sp, cpu0_boot_stack
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 li=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 t0, STACK_SIZE
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 add=C2=A0=C2=A0=C2=
=A0=C2=A0 sp, sp, t0
> > > > > > +
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Re-init an =
address of exception handler as it
> > > > > > was
> > > > > > overwritten=C2=A0 with
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * the address=
 of the .L_mmu_is_enabled label.
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Before jump=
 to trap_init save return address of
> > > > > > enable_mmu() to
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * know where =
we should back after enable_mmu()
> > > > > > will
> > > > > > be
> > > > > > finished.
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mv=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 s0, ra
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 lla=C2=A0=C2=A0=C2=
=A0=C2=A0 t0, trap_init
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 jalr=C2=A0=C2=A0=C2=
=A0 ra, t0
> > > > > > +
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Re-calculat=
e the return address of enable_mmu()
> > > > > > function for case
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * when linker=
 start address isn't equal to load
> > > > > > start
> > > > > > address
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 add=C2=A0=C2=A0=C2=
=A0=C2=A0 s0, s0, t1
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mv=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 ra, s0
> > > > > > +
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret
> > > > >=20
> > > > > Missing ENDPROC?
> > > > I haven't seen the usage of ENDPROC for RISC-V so it looks like
> > > > it
> > > > is
> > > > not necessary.
> > >=20
> > > Ok. Would the objdump be able to report the function properly
> > > then? I
> > > know that on Arm, it was necessary report assembly function
> > > properly.
> > It is fine for RISC-V:
> >=20
> > Disassembly of section .text:
> >=20
> > 0000000000200000 <_start>:
> > =C2=A0=C2=A0 200000:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 10401073=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 csrw=C2=A0=C2=A0=C2=A0 sie,zero
> > =C2=A0=C2=A0 200004:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6299=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 lui=C2=A0=C2=A0=C2=A0=C2=A0 t0,0x6
> > ...
> > =C2=A0=C2=A0 20003c:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 00000013=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 nop
> >=20
> > 0000000000200040 <enable_mmu>:
> > =C2=A0=C2=A0 200040:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0003a297=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 auipc=C2=A0=C2=A0 t0,0x3a
> > ...
> > =C2=A0=C2=A0 20009e:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 941a=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 add=C2=A0=C2=A0=C2=A0=C2=A0 s0,s0,t1
> > =C2=A0=C2=A0 2000a0:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 80a2=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mv=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ra,s0
> > =C2=A0=C2=A0 2000a2:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 8082=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ...
> >=20
> > 00000000002000b0 <__bitmap_empty>:
> > =C2=A0=C2=A0 2000b0:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1141=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 addi=C2=A0=C2=A0=C2=A0 sp,sp,-16
> > =C2=A0=C2=A0 2000b2:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 e422=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sd=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 s0,8(sp)
> > =C2=A0=C2=A0 2000b4:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0800=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 addi=C2=A0=C2=A0=C2=A0 s0,sp,16
> > ...
>=20
> Perfect thanks!
>=20
~ Oleksii


