Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F186C6668
	for <lists+xen-devel@lfdr.de>; Thu, 23 Mar 2023 12:18:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513790.795328 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfIxY-0000CL-C2; Thu, 23 Mar 2023 11:18:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513790.795328; Thu, 23 Mar 2023 11:18:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfIxY-00008x-8N; Thu, 23 Mar 2023 11:18:20 +0000
Received: by outflank-mailman (input) for mailman id 513790;
 Thu, 23 Mar 2023 11:18:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6w1C=7P=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pfIxW-00008r-K3
 for xen-devel@lists.xenproject.org; Thu, 23 Mar 2023 11:18:18 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 67495f54-c96c-11ed-b464-930f4c7d94ae;
 Thu, 23 Mar 2023 12:18:15 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id l12so20011285wrm.10
 for <xen-devel@lists.xenproject.org>; Thu, 23 Mar 2023 04:18:14 -0700 (PDT)
Received: from [192.168.8.100] (46.204.108.203.nat.umts.dynamic.t-mobile.pl.
 [46.204.108.203]) by smtp.gmail.com with ESMTPSA id
 v3-20020adfe4c3000000b002cf8220cc75sm7998308wrm.24.2023.03.23.04.18.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Mar 2023 04:18:13 -0700 (PDT)
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
X-Inumbo-ID: 67495f54-c96c-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679570294;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qPFKWsVdl6/0HXaBPNn5qvqY7qtKq1/ygkdLGCEXykI=;
        b=mlktyJNvmkqpomU7eD1wJMsKqy+In9sm8VDH1j3/bf3E9ZTEq84RtJFTdNNAnmQ6x7
         bBYkWKamPqVA6JG3XBhn6TiH9byOnqDksBq6i8tXbGfFnbyYy0AGT8MHWLhScevTn3tJ
         vjQZItdzASvMGFITl+55zynpd/smoe1ipuFd4ZFRoaQoHLqxw/oNVawhIp6srPhxGWa/
         xpnnI+gMXOjLMrB1frRPn6w1E+IAysLwCX2tBLdQmbcCw1UrIHtfhXhNr9mpfFzxR0Xa
         6mePrAwwtgQRpsvlLBfivnVM5+FLT2NLZQWEbTDY8o/bFCxurFv30c8R+4dbJCcFWmgH
         DrKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679570294;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qPFKWsVdl6/0HXaBPNn5qvqY7qtKq1/ygkdLGCEXykI=;
        b=vwOuUo7rTDvVF7S4AuD5VHwfmICYICBIBYz2AI/1miBgrlCPjP592w82pes2wgLJsC
         qiRGCx6zrbRIn0+C73dqgm8HL+4yDQ5pNSvOktNidCX0vLuBKBlaIVTCA4pQyJOdZOUe
         d5qaoV0sCSgAI34U5TCKmYkwAuO7+/Ocx/30KVcroaicgTU/n7I0k4N1t4CCtlHTMFPM
         31cCJdChtMdsa50cxF8qeFX8EwwoOjYFlsovSJrCMdXwVdfpcQ9m5u9eEnzdEyNLb53d
         WdKhN5Yxd2sSCmw2g9ouZsYSDg67GNcT6GH+CSN3+b6EIH4k8SA6V3ar+tTB2kwEQPUK
         Uq1Q==
X-Gm-Message-State: AAQBX9dToYuNtRRuVAjQf+RruuzD91y6dmO5+nnkkA6mpYtnPAVb2is2
	6lOBn2fz6gF+oRDNi4ftH/E=
X-Google-Smtp-Source: AKy350aYtvWxmHCKo+FMJ6O3GYkVV7uiG5lVTvMEmx5+9H3fUiqlOMNWdPaNLP+45XDZjhsEBpr5cw==
X-Received: by 2002:adf:fa0c:0:b0:2cf:e70f:d1a8 with SMTP id m12-20020adffa0c000000b002cfe70fd1a8mr2275628wrr.10.1679570293895;
        Thu, 23 Mar 2023 04:18:13 -0700 (PDT)
Message-ID: <c9f4b34c4aef31906e715c7ddce8e077e5eef52c.camel@gmail.com>
Subject: Re: [PATCH v2 1/3] xen/riscv: introduce setup_initial_pages
From: Oleksii <oleksii.kurochko@gmail.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>,  Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>, 
 Connor Davis <connojdavis@gmail.com>
Date: Thu, 23 Mar 2023 13:18:12 +0200
In-Reply-To: <60444252-80b6-230e-9090-2c96d5d6187d@xen.org>
References: <cover.1678984041.git.oleksii.kurochko@gmail.com>
	 <85a21ada5a0fc44bb9db1dcc1f6cf191a6e66bfb.1678984041.git.oleksii.kurochko@gmail.com>
	 <9ff0e335-6cb2-be49-046d-745ce05f7086@xen.org>
	 <5169c6c8a0c4c90b56e3f525a55de464edf7181e.camel@gmail.com>
	 <60444252-80b6-230e-9090-2c96d5d6187d@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0

Hi Julien,

On Wed, 2023-03-22 at 14:21 +0000, Julien Grall wrote:
...
>=20
> > > > +=C2=A0=C2=A0=C2=A0 unsigned long page_addr;
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 // /* align start addresses */
> > > > +=C2=A0=C2=A0=C2=A0 // map_start &=3D XEN_PT_LEVEL_MAP_MASK(0);
> > > > +=C2=A0=C2=A0=C2=A0 // pa_start &=3D XEN_PT_LEVEL_MAP_MASK(0);
> > >=20
> > > They should be switched to ASSERT() or BUG_ON().
> > Sure. Thanks. I'll update.
> > >=20
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 page_addr =3D map_start;
> > > > +=C2=A0=C2=A0=C2=A0 while ( page_addr < map_end )
> > >=20
> > > This loop is continue to assume that only the mapping can first
> > > in
> > > 2MB
> > > section (or less if the start is not 2MB aligned).
> > >=20
> > > I am OK if you want to assume it, but I think this should be
> > > documented
> > > (with words and ASSERT()/BUG_ON()) to avoid any mistake.
> > I add a check in setup_initial_pagetables:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BUG_ON(load_addr_start % (PAGE_ENTRIES *=
 PAGE_SIZE) !=3D 0);
> > Probably this is not a correct place and should be moved to
> > setup_initial_mapping() instead of setup_initial_pagetables()
>=20
> Yes it should be moved in setup_initial_mapping().
Then I'll moved it to setup_initial_mapping()
>=20
> > >=20
> > > > +=C2=A0=C2=A0=C2=A0 {
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long index2 =
=3D pt_index(2, page_addr);
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long index1 =
=3D pt_index(1, page_addr);
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long index0 =
=3D pt_index(0, page_addr);
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Setup level2 table *=
/
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 second[index2] =3D padd=
r_to_pte((unsigned long)first);
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 second[index2].pte |=3D=
 PTE_TABLE;
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Setup level1 table *=
/
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 first[index1] =3D paddr=
_to_pte((unsigned long)zeroeth);
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 first[index1].pte |=3D =
PTE_TABLE;
> > > > +
> > > > +
> > >=20
> > > NIT: Spurious line?
> > Yeah, should be removed. Thanks.
> > >=20
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Setup level0 table *=
/
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( !pte_is_valid(&zer=
oeth[index0]) )
> > >=20
> > > On the previous version, you said it should be checked for each
> > > level.
> > I had a terrible internet connection, and my message wasn't sent.
>=20
> No worries.
>=20
> >=20
> > I decided not to check that l2 and l1 are used only for referring
> > to
> > the next page table but not leaf PTE. So it is safe to overwrite it
> > each time (the addresses of page tables are the same all the time)
>=20
> You are letting the caller to decide which page-table to use for each
> level. So you are at the mercy that caller will do the right thing.
>=20
> IHMO, this is a pretty bad idea because debugging page-tables error
> are=20
> difficult. So it is better to have safety in place. This is not
> worth...
>=20
> =C2=A0 and
> > probably it will be better from optimization point of view to
> > ignore if
> > clauses.
>=20
> ... the optimization in particular when this is at boot time.
I didn't think about that caller will do always the right thing so
I will add the check.
>=20
> >=20
> > And it is needed in case of L0 because it is possible that some
> > addressed were marked with specific flag ( execution, read, write )
> > and
> > so not to overwrite the flags set before the check is needed.
> In which case you should really report an error because the caller
> may=20
> have decide to set execution flag and you don't honor. So when the
> code=20
> is executed, you will receive a fault and this may be hard to find
> out=20
> what happen.

Right now, it is expected situation that the caller will try to change
execution flag during the setup of initial page tables.

It is possible in the currently implemented logic of the setup of
initial page tables.

Let me explain what I mean.

The first step of setup_initial_pagetables() is to map .text, .init,
.rodata with necessary flags RX, RX, R.
Remaining sections will have RW flags, and to map them,
setup_initial_mapping() is called for the whole range of [linker_start,
linker_end] not to map them one by one thereby during this step
setup_initial_mapping() will try to remap addresses ranges which
overlap with .text, .init, .rodata with RW flags but it should leave
with the previously set flags.
>=20
> >=20
> > > the next page table but not leaf PTE.But here you still only
> > > check
> > > for a single level.
> > >=20
> > > Furthermore, I would strongly suggest to also check the valid PTE
> > > is
> > > the
> > > same as you intend to write to catch any override (they are a
> > > pain to
> > > debug).
> > but if load addresses and linker addresses don't overlap is it
> > possible
> > situation that valid PTE will be overridden?
>=20
> A bug in the code. In fact, if you add the check you would have
> notice=20
> that your existing code is buggy (see below).
>=20
> > >=20
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 /* Update level0 table */
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 zeroeth[index0] =3D paddr_to_pte((page_addr -
> > > > map_start)
> > > > + pa_start);
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 zeroeth[index0].pte |=3D flags;
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Point to next page *=
/
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 page_addr +=3D XEN_PT_L=
EVEL_SIZE(0);
> > > > +=C2=A0=C2=A0=C2=A0 }
> > > > +}
> > > > +
> > > > +/*
> > > > + * setup_initial_pagetables:
> > > > + *
> > > > + * Build the page tables for Xen that map the following:
> > > > + *=C2=A0=C2=A0 load addresses to linker addresses
>=20
> I would suggest to expand because this is not entirely what you
> exactly=20
> are doing. In fact...
>=20
> > > > + */
> > > > +void __init setup_initial_pagetables(void)
> > > > +{
> > > > +=C2=A0=C2=A0=C2=A0 pte_t *second;
> > > > +=C2=A0=C2=A0=C2=A0 pte_t *first;
> > > > +=C2=A0=C2=A0=C2=A0 pte_t *zeroeth;
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 unsigned long load_addr_start=C2=A0=C2=A0 =3D b=
oot_info.load_start;
> > > > +=C2=A0=C2=A0=C2=A0 unsigned long load_addr_end=C2=A0=C2=A0=C2=A0=
=C2=A0 =3D boot_info.load_end;
> > > > +=C2=A0=C2=A0=C2=A0 unsigned long linker_addr_start =3D boot_info.l=
inker_start;
> > > > +=C2=A0=C2=A0=C2=A0 unsigned long linker_addr_end=C2=A0=C2=A0 =3D b=
oot_info.linker_end;
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 BUG_ON(load_addr_start % (PAGE_ENTRIES * PAGE_S=
IZE) !=3D 0);
> > > > +=C2=A0=C2=A0=C2=A0 if (load_addr_start !=3D linker_addr_start)
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BUG_ON((linker_addr_end=
 > load_addr_start &&
> > > > load_addr_end
> > > > > linker_addr_start));
> > >=20
> > > I would suggest to switch to a panic() with an error message as
> > > this
> > > would help the user understanding what this is breaking.
> > >=20
> > > Alternatively, you could document what this check is for.
> > I think I will document it for now as panic() isn't ready for use
> > now.
> > >=20
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 /* Get the addresses where the page tables were=
 loaded */
> > > > +=C2=A0=C2=A0=C2=A0 second=C2=A0 =3D (pte_t *)(&xen_second_pagetabl=
e);
> > > > +=C2=A0=C2=A0=C2=A0 first=C2=A0=C2=A0 =3D (pte_t *)(&xen_first_page=
table);
> > > > +=C2=A0=C2=A0=C2=A0 zeroeth =3D (pte_t *)(&xen_zeroeth_pagetable);
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 setup_initial_mapping(second, first, zeroeth,
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 LOAD_TO_LINK((unsigned
> > > > long)&_stext),
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 LOAD_TO_LINK((unsigned
> > > > long)&_etext),
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 (unsigned long)&_stext,
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 PTE_LEAF_DEFAULT);
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 setup_initial_mapping(second, first, zeroeth,
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 LOAD_TO_LINK((unsigned
> > > > long)&__init_begin),
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 LOAD_TO_LINK((unsigned
> > > > long)&__init_end),
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 (unsigned long)&__init_begin,
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 PTE_LEAF_DEFAULT | PTE_WRITABLE);
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 setup_initial_mapping(second, first, zeroeth,
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 LOAD_TO_LINK((unsigned
> > > > long)&_srodata),
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 LOAD_TO_LINK((unsigned
> > > > long)&_erodata),
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 (unsigned long)(&_srodata),
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 PTE_VALID | PTE_READABLE);
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 setup_initial_mapping(second, first, zeroeth,
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 linker_addr_start,
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 linker_addr_end,
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 load_addr_start,
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 PTE_LEAF_DEFAULT | PTE_READABLE);
>=20
> ... this is not cover above. AFAIU, this is the one for the 1:1
> mapping.
But there is no 1:1 mapping.
I thought that 1:1 mapping is when the physical address is equal to
0x10020 then after MMU is enabled the virtual address will be the same
0x10020 and mapped to 0x10020.

Probably I missed something but this code maps all linker addresses
to correspondent load addresses and it will be 1:1 only in case when
load address is equal to linker address.
>=20
> > >=20
> > > As I said in v1, you need to use a different set of page-table
> > > here.
> > If I understand you correctly I have to use a different set of
> > page-
> > table in case when it is possible that size of Xen will be larger
> > then
> > PAGE_SIZE. So I added to xen.lds.S a check to be sure that the size
> > fits into PAGE_SIZE.
>=20
> This is not what I was referring to. I was pointing out that second,=20
> first, zeroeth are exactly the same for all the callers. You want to=20
> introduce a second set of zeroeth table. You will want to do the same
> for first but it is not always used.
>=20
> Otherwise, this is not going to work if Xen is loaded at a different=20
> address than the runtime.
Ok.

I understand what do you mean in general but still I am not sure that I
understand a particular case when I am sure that the size of Xen is no
bigger then 2MB and load address is aligned on 2Mb boundary.

The size of one l0 page table is 512 (1 << 9 ) entries which covers 4K
(1 << 12) * 512 =3D 2 Mb of memory so it should be fine.
All the callers in my case are trying to map addresses from
[linker_start, linker_end] which is not bigger then 2 MB and is aligned
on 2 MB boundary.

>=20
> That said, when I spoke with Andrew yesterday, he mentioned that your
> initial goal is to support the case where Xen is loaded at the
> runtime=20
> address. I understand this simplifies a lot the code and I told him I
> was OK with that. However, it would be good to document what are your
> goals in each series (this is not always clear what you skip on
> purpose).
>=20
> >=20
> > > Also, where do you guarantee that Xen will be loaded at a 2MB
> > > aligned
> > > address? (For a fact I know that UEFI is only guarantee 4KB
> > > alignment).
> > There is a check in setup_initial_pagetables:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BUG_ON(load_addr_start % (PAGE_ENTRIES *=
 PAGE_SIZE) !=3D 0);
>=20
> This is not very obvious the check is to confirm that Xen is probably
> aligned. I would suggest to add a comment.
>=20
> Also, you might want to use XEN_PT_LEVEL_SIZE(..) to make it more=20
> obvious what sort of alignment you are trying to enforce.
I will update add the comment and use XEN_PT_LEVEL_SIZE(...) instead.
>=20
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 la=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 sp, cpu0_boot_stack
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 li=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 t0, STACK_SIZE
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 add=C2=A0=C2=A0=C2=A0=
=C2=A0 sp, sp, t0
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Re-init an addr=
ess of exception handler as it was
> > > > overwritten=C2=A0 with
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * the address of =
the .L_mmu_is_enabled label.
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Before jump to =
trap_init save return address of
> > > > enable_mmu() to
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * know where we s=
hould back after enable_mmu() will
> > > > be
> > > > finished.
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mv=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 s0, ra
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 lla=C2=A0=C2=A0=C2=A0=
=C2=A0 t0, trap_init
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 jalr=C2=A0=C2=A0=C2=A0 =
ra, t0
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Re-calculate th=
e return address of enable_mmu()
> > > > function for case
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * when linker sta=
rt address isn't equal to load start
> > > > address
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 add=C2=A0=C2=A0=C2=A0=
=C2=A0 s0, s0, t1
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mv=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 ra, s0
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret
> > >=20
> > > Missing ENDPROC?
> > I haven't seen the usage of ENDPROC for RISC-V so it looks like it
> > is
> > not necessary.
>=20
> Ok. Would the objdump be able to report the function properly then? I
> know that on Arm, it was necessary report assembly function properly.
It is fine for RISC-V:

Disassembly of section .text:

0000000000200000 <_start>:
  200000:       10401073                csrw    sie,zero
  200004:       6299                    lui     t0,0x6
...
  20003c:       00000013                nop

0000000000200040 <enable_mmu>:
  200040:       0003a297                auipc   t0,0x3a
...
  20009e:       941a                    add     s0,s0,t1
  2000a0:       80a2                    mv      ra,s0
  2000a2:       8082                    ret
        ...

00000000002000b0 <__bitmap_empty>:
  2000b0:       1141                    addi    sp,sp,-16
  2000b2:       e422                    sd      s0,8(sp)
  2000b4:       0800                    addi    s0,sp,16
...

>=20
> > >=20
> > > > diff --git a/xen/arch/riscv/xen.lds.S
> > > > b/xen/arch/riscv/xen.lds.S
> > > > index eed457c492..e4ac4e84b6 100644
> > > > --- a/xen/arch/riscv/xen.lds.S
> > > > +++ b/xen/arch/riscv/xen.lds.S
> > > > @@ -179,3 +179,5 @@ SECTIONS
> > > > =C2=A0=C2=A0=20
> > > > =C2=A0=C2=A0 ASSERT(!SIZEOF(.got),=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ".=
got non-empty")
> > > > =C2=A0=C2=A0 ASSERT(!SIZEOF(.got.plt),=C2=A0 ".got.plt non-empty")
> > > > +
> > > > +ASSERT(_end - _start <=3D MB(2), "Xen too large for early-boot
> > > > assumptions")
> > >=20
> > ~ Oleksii
> >=20
>=20
~ Oleksii


