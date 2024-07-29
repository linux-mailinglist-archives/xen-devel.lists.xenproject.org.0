Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1538993FA55
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2024 18:11:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.766973.1177525 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYSy9-0007jh-S7; Mon, 29 Jul 2024 16:11:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 766973.1177525; Mon, 29 Jul 2024 16:11:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYSy9-0007he-O3; Mon, 29 Jul 2024 16:11:29 +0000
Received: by outflank-mailman (input) for mailman id 766973;
 Mon, 29 Jul 2024 16:11:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pZrP=O5=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sYSy8-0007hW-BV
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2024 16:11:28 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3538e06f-4dc5-11ef-bc01-fd08da9f4363;
 Mon, 29 Jul 2024 18:11:26 +0200 (CEST)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2ef2cce8be8so47060011fa.1
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jul 2024 09:11:26 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f03d0900absm13704961fa.134.2024.07.29.09.11.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jul 2024 09:11:25 -0700 (PDT)
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
X-Inumbo-ID: 3538e06f-4dc5-11ef-bc01-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722269486; x=1722874286; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qWPt5WEHzQ428/Gsy6YVPEJI1ji/Sm98Wz22XT/prMI=;
        b=XcdTzNrA1GPspP9+O3RnHkIuvf6vSiX5oCfn2kYIWMsBI6wZgdIJ7QId6Xm3H8qjy9
         pQmNQas345E2D8i5+BtPfXE25qqNtddz9pnRmAoDzDVJogGam6j0Dkp92Pwk4rbnzSOE
         dSWxU58+mWkMNLLFsIpfV3ogfyKLXjmIUgNd4NvuF/kFPBL9TF0kzLtzz1Le4i72MrjF
         jJfY2OKTa0UH9ZDrqVlBnJTRiXNC2VShYzVm9G9gT8tr7WO2C81IvrOK8T5V6q5w7D1Z
         tg4KcarL6uXmCV+C2jHpGIDEsms6u/sOLsmr7uvu3t35LPc/C3G0JCDLNVnge8M7hj11
         U/CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722269486; x=1722874286;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qWPt5WEHzQ428/Gsy6YVPEJI1ji/Sm98Wz22XT/prMI=;
        b=dn7gsUCU5APzjYbGHQnzjQUJ5iWrOkQuz0bk69X74mHYqWaNULtYMJDD6btseuDmJA
         eX05tk472ZTKN9ArIwrdVQGOlNN+/hETpZW4jEEW4tbfJMtFJV9Os8JFa9j8MqTiU30r
         7w0cUpEZ4ieoFoJWO542dxqm6CtEb6NhDQGhOF3UBk28TEjHOFRJ/msehaeyMNI7BWzY
         PX2cWlkYkZVDRDIjgP6/sg9vxSVzSOGZuC9LoL+ANQIdCaExuN4yJVgbTD49IIsoP1SC
         so1e/ru2rbrL7zV8DjRfaHc0XZOxxY1H4GKUTuZx5TjkkgLnjVbuAHX+tw0/b9rSOtml
         n5iQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRW1bH9yd8OXU5ab5IyBqX/qJdPZiGqde+IyHhodUFgdV9qXpgW3vNT8rlDtL3BjICKpbNzRdMENkHiEPLJwFA4o863rX3Q7DfSd5mHBU=
X-Gm-Message-State: AOJu0YzS0gn+gr/LCUNYGlA2L3EP9RSuP5uLF9lHKl5Qb71exMKaH+xi
	AADcuFyXY9UofGwqLtYan3Fzbjs8C5A50BUzz8bSsP8ISDzjGRV7
X-Google-Smtp-Source: AGHT+IEH//J2BVIS1PtdH2HMLPvL3hUf6Bze8wiC8ynBM8MAYT6Ig3zpkDNjH4G6dxNv0v4Yxlaedw==
X-Received: by 2002:a2e:b051:0:b0:2ef:25be:ebeb with SMTP id 38308e7fff4ca-2f12ebcaffdmr60831841fa.10.1722269485773;
        Mon, 29 Jul 2024 09:11:25 -0700 (PDT)
Message-ID: <28d646ba3d95da2eaf40869e1c07d950a0f3f203.camel@gmail.com>
Subject: Re: [PATCH v3 4/9] xen/riscv: setup fixmap mapping
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
 <michal.orzel@amd.com>
Date: Mon, 29 Jul 2024 18:11:24 +0200
In-Reply-To: <917cc521-c0c4-49e8-bc40-948679398bc6@suse.com>
References: <cover.1721834549.git.oleksii.kurochko@gmail.com>
	 <04576976b82b97442f645b83b3d62475d144af8e.1721834549.git.oleksii.kurochko@gmail.com>
	 <917cc521-c0c4-49e8-bc40-948679398bc6@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3 (3.52.3-1.fc40app2) 
MIME-Version: 1.0

On Mon, 2024-07-29 at 15:35 +0200, Jan Beulich wrote:
> On 24.07.2024 17:31, Oleksii Kurochko wrote:
> > Introduce a function to set up fixmap mappings and L0 page
> > table for fixmap.
> >=20
> > Additionally, defines were introduced in riscv/config.h to
> > calculate the FIXMAP_BASE address.
> > This involved introducing BOOT_FDT_VIRT_{START, SIZE} and
> > XEN_VIRT_SIZE, XEN_VIRT_END.
> >=20
> > Also, the check of Xen size was updated in the riscv/lds.S
> > script to use XEN_VIRT_SIZE instead of a hardcoded constant.
> >=20
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>=20
> Yet set_fixmap() isn't introduced here, so effectively it's all dead
> code. This could do with mentioning, as I at least would expect
> set_fixmap() to be usable once fixmaps are properly set up.
>=20
> > --- a/xen/arch/riscv/include/asm/config.h
> > +++ b/xen/arch/riscv/include/asm/config.h
> > @@ -66,6 +66,14 @@
> > =C2=A0#define SLOTN_ENTRY_BITS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 (HYP_PT_ROOT_LEVEL * VPN_BITS +
> > PAGE_SHIFT)
> > =C2=A0#define SLOTN(slot)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 (_AT(vaddr_t, slot) <<
> > SLOTN_ENTRY_BITS)
> > =C2=A0
> > +#define XEN_VIRT_SIZE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 MB(2)
> > +
> > +#define BOOT_FDT_VIRT_START=C2=A0=C2=A0=C2=A0=C2=A0 (XEN_VIRT_START + =
XEN_VIRT_SIZE)
> > +#define BOOT_FDT_VIRT_SIZE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MB(4)
> > +
> > +#define FIXMAP_BASE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 (BOOT_FDT_VIRT_START +
> > BOOT_FDT_VIRT_SIZE)
> > +#define FIXMAP_ADDR(n)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 (FIXMAP_BASE + (n) * PAGE_SIZE)
> > +
> > =C2=A0#if RV_STAGE1_MODE =3D=3D SATP_MODE_SV39
> > =C2=A0#define XEN_VIRT_START 0xFFFFFFFFC0000000
> > =C2=A0#elif RV_STAGE1_MODE =3D=3D SATP_MODE_SV48
>=20
> Related to my earlier comment: Is there a particular reason that what
> you add cannot live _below_ the XEN_VIRT_START definitions, so things
> actually appear in order?
It can leave _below_ the XEN_VIRT_START definitions, I just wanted to
be in sync with table above.
But I'll move everything below the XEN_VIRT_START as it is used in
newly introduced definitions.
>=20
>=20
>=20
> > @@ -81,6 +82,14 @@ static inline void flush_page_to_ram(unsigned
> > long mfn, bool sync_icache)
> > =C2=A0=C2=A0=C2=A0=C2=A0 BUG_ON("unimplemented");
> > =C2=A0}
> > =C2=A0
> > +/* Write a pagetable entry. */
> > +static inline void write_pte(pte_t *p, pte_t pte)
> > +{
> > +=C2=A0=C2=A0=C2=A0 RISCV_FENCE(rw, rw);
> > +=C2=A0=C2=A0=C2=A0 *p =3D pte;
> > +=C2=A0=C2=A0=C2=A0 RISCV_FENCE(rw, rw);
> > +}
>=20
> Why the first of the two fences?=C2=A0
To ensure that writes have completed with the old mapping.

> And isn't having the 2nd here going
> to badly affect batch updates of page tables?
By batch you mean update more then one pte?
It yes, then it will definitely affect. It could be dropped here but
could we do something to be sure that someone won't miss to add
fence/barrier?

>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * x is the highest page table level for curre=
ct=C2=A0 MMU mode (
> > for example,
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * for Sv39 has 3 page tables so the x =3D 2 (=
L2 -> L1 -> L0) ).
> > +=C2=A0=C2=A0=C2=A0=C2=A0 *
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * In this cycle we want to find L1 page table=
 because as L0
> > page table
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * xen_fixmap[] will be used.
> > +=C2=A0=C2=A0=C2=A0=C2=A0 *
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * i is defined ( HYP_PT_ROOT_LEVEL - 1 ) becu=
ase pte for L2 (
> > in
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * case of Sv39 ) has been recieved above.
> > +=C2=A0=C2=A0=C2=A0=C2=A0 */
> > +=C2=A0=C2=A0=C2=A0 for ( i =3D HYP_PT_ROOT_LEVEL - 1; i !=3D 0; i-- )
>=20
> I think the subtracting of 1 is unhelpful here. Think of another=C2=A0
> case where
> you want to walk down to L0. How would you express that with a
> similar for()
> construct. It would imo be more natural to use
>=20
> =C2=A0=C2=A0=C2=A0 for ( i =3D HYP_PT_ROOT_LEVEL; i > 1; i-- )
Then the first one _i_ will be initialized as L2, not L1. As an option
we then have to use ...
>=20
> here (and then in that hypothetical other case
>=20
> =C2=A0=C2=A0=C2=A0 for ( i =3D HYP_PT_ROOT_LEVEL; i > 0; i-- )
>=20
> ), and then the last part of the comment likely wouldn't be needed
> either.
> However, considering ...
>=20
> > +=C2=A0=C2=A0=C2=A0 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BUG_ON(!pte_is_valid(*pte))=
;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pte =3D (pte_t *)LOAD_TO_LI=
NK(pte_to_paddr(*pte));
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pte =3D &pte[pt_index(i, FI=
XMAP_ADDR(0))];
>=20
> ... the use of i here, it may instead want to be
... should be ( i - 1 ).
I am okay with such refactoring.

>=20
> =C2=A0=C2=A0=C2=A0 for ( i =3D HYP_PT_ROOT_LEVEL; i-- > 1; )
>=20
> > +=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0 BUG_ON(pte_is_valid(*pte));
> > +
> > +=C2=A0=C2=A0=C2=A0 tmp =3D paddr_to_pte(LINK_TO_LOAD((unsigned long)&x=
en_fixmap),
> > PTE_TABLE);
>=20
> I'm a little puzzled by the use of LINK_TO_LOAD() (and LOAD_TO_LINK()
> a
> little further up) here. Don't you have functioning __pa() and
> __va()?
No, they haven't been introduced yet.

~ Oleksii

