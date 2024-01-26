Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E53683DE29
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jan 2024 16:59:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.672140.1045865 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTObW-0004TM-Ul; Fri, 26 Jan 2024 15:58:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 672140.1045865; Fri, 26 Jan 2024 15:58:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTObW-0004RK-Rg; Fri, 26 Jan 2024 15:58:54 +0000
Received: by outflank-mailman (input) for mailman id 672140;
 Fri, 26 Jan 2024 15:58:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DqdW=JE=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rTObV-0004M7-5X
 for xen-devel@lists.xenproject.org; Fri, 26 Jan 2024 15:58:53 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cc4ac08c-bc63-11ee-98f5-efadbce2ee36;
 Fri, 26 Jan 2024 16:58:51 +0100 (CET)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-510218c4a0eso1372180e87.1
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jan 2024 07:58:51 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 x23-20020a19e017000000b0051011f26471sm216939lfg.9.2024.01.26.07.58.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jan 2024 07:58:50 -0800 (PST)
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
X-Inumbo-ID: cc4ac08c-bc63-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706284730; x=1706889530; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uZOvO3x3u/ipc+lklxD98+c44oiJeF1Z7ag6u/VJbSo=;
        b=GI5A6Z+8Vsji4GTUAT6C4wzwZDD5/qojkzarw3VrjKemaF5pN30Dh2pCYVim+V3Rp6
         7RifXWuJWgk/JoeVsUsp8bqyFzdVHGJZjtCHtjHtMKbaEPhROpl8+KBlbhax6SzgAJdp
         Rvpzh8y2l7Cl6RAM1lkW5fTMaZT9cSvMPGEydlFnge5nLGfHWh1IPsNOKbkf3GzmjlBe
         w4lZZHgMDxuS2lwsm1DWBJs4MeY/PqPuAJXOlVDNp13uoHzLvp1d1XbODSX8rqZjTXlB
         87jQoeE7hisJsi9Ncf3aWVxVFayMEWt6OzH3V6Z1c5t0ku4MWv7lZZOGzRyN6o3STh7C
         q5mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706284730; x=1706889530;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uZOvO3x3u/ipc+lklxD98+c44oiJeF1Z7ag6u/VJbSo=;
        b=OaoNFVJsxCCoz7mqxAkR8HE7ViRvvjkN6H94VURI/r7MkCi+Bwg5gV4swwy9+O41cg
         50xkh2QmvRcpy1hH4n51v0RsvoXNrEoWzXOLMtm/01nr9AfSfSkJv2CLZhv7dZm8FPAg
         2f83495U7HuYoDDNDLs+UoTLviVeSRI/AmPxQW1nRWODupFp54Zl4V2SeV2nl5qKWF3E
         /I/bdhNgis81lYbmeaoa5jj+S1C6uemN0GusNf6f5dI+7R2xRVZ6WhnsJoAKpGKs0P+g
         oUgaMXuogc9uLGuAw1feUg8v0yZb1PnrawfE/pGhXqMZyAjdPJSNgWeUYcgTk0lpaetD
         x5vA==
X-Gm-Message-State: AOJu0YzKSdUTSjAPu38Z7jYS0DSYUVLwj+VejAGmAghaZ2ZkmUTm9DJv
	RWU8tv59fMzQG6kCJ6+GkDWGgUJIkv7ujBCntW9hDNyFO4TI622y
X-Google-Smtp-Source: AGHT+IHbcaw2IH/NOChKzYd17B5h164pugdcPI/pFNtlp7GlPJqAddQjNgnDGmBc2jgymQgFLhaWSQ==
X-Received: by 2002:a19:ac48:0:b0:510:1706:2c3f with SMTP id r8-20020a19ac48000000b0051017062c3fmr29893lfc.22.1706284730286;
        Fri, 26 Jan 2024 07:58:50 -0800 (PST)
Message-ID: <1104df46d7780ef1bbcb6c745685b10fe6d2aa5d.camel@gmail.com>
Subject: Re: [PATCH] xen/lib: introduce generic find next bit operations
From: Oleksii <oleksii.kurochko@gmail.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Shawn Anastasio
 <sanastasio@raptorengineering.com>
Date: Fri, 26 Jan 2024 17:58:49 +0200
In-Reply-To: <f8602dc5-e603-42fc-b3a2-dc71c55db341@xen.org>
References: 
	<52730e6314210ba4164a9934a720c4fda201447b.1706266854.git.oleksii.kurochko@gmail.com>
	 <f8602dc5-e603-42fc-b3a2-dc71c55db341@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Fri, 2024-01-26 at 13:20 +0000, Julien Grall wrote:
> Hi,
Hi Julien,

>=20
> On 26/01/2024 12:20, Oleksii Kurochko wrote:
> > find-next-bit.c is common for Arm64, PPC and RISCV64,
> > so it is moved to xen/lib.
> >=20
> > Suggested-by: Jan Beulich <jbeulich@suse.com>
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > ---
> > =C2=A0 docs/misra/exclude-list.json=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
=C2=A0 4 -
> > =C2=A0 xen/arch/arm/arm64/lib/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +-
> > =C2=A0 xen/arch/arm/include/asm/arm64/bitops.h=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 48 --------
> > =C2=A0 xen/arch/ppc/include/asm/bitops.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 115 -------------
> > -----
> > =C2=A0 xen/include/xen/bitops.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 48 ++++++++
> > =C2=A0 xen/lib/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> > =C2=A0 .../find_next_bit.c =3D> lib/find-next-bit.c}=C2=A0=C2=A0 |=C2=
=A0=C2=A0 0
> > =C2=A0 7 files changed, 50 insertions(+), 168 deletions(-)
> > =C2=A0 rename xen/{arch/arm/arm64/lib/find_next_bit.c =3D> lib/find-nex=
t-
> > bit.c} (100%)
> >=20
> > diff --git a/docs/misra/exclude-list.json b/docs/misra/exclude-
> > list.json
> > index 7971d0e70f..7fe02b059d 100644
> > --- a/docs/misra/exclude-list.json
> > +++ b/docs/misra/exclude-list.json
> > @@ -13,10 +13,6 @@
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 "rel_path": "arch/arm/arm64/insn.c",
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 "comment": "Imported on Linux, ignore for now"
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "re=
l_path": "arch/arm/arm64/lib/find_next_bit.c",
>=20
> Rather than removing the section, I was expecting the rel_path to be=20
> updated. Can you explain why you think the exclusion is not
> necessary?
I considered simply updating the path to xen/lib/find-next-bit.c, but
ultimately opted to remove it. This decision was based on the fact that
the line in question checks for a file that no longer exists. If it's
preferable to update the rel_path with xen/lib/find-next-bit.c, I'm
more than willing to make that adjustment.

>=20
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "co=
mment": "Imported from Linux, ignore for now"
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 "rel_path": "arch/x86/acpi/boot.c",
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 "comment": "Imported from Linux, ignore for now"
> > diff --git a/xen/arch/arm/arm64/lib/Makefile
> > b/xen/arch/arm/arm64/lib/Makefile
> > index 1b9c7a95e6..66cfac435a 100644
> > --- a/xen/arch/arm/arm64/lib/Makefile
> > +++ b/xen/arch/arm/arm64/lib/Makefile
> > @@ -1,4 +1,4 @@
> > =C2=A0 obj-y +=3D memcpy.o memcmp.o memmove.o memset.o memchr.o
> > =C2=A0 obj-y +=3D clear_page.o
> > -obj-y +=3D bitops.o find_next_bit.o
> > +obj-y +=3D bitops.o
> > =C2=A0 obj-y +=3D strchr.o strcmp.o strlen.o strncmp.o strnlen.o strrch=
r.o
> > diff --git a/xen/arch/arm/include/asm/arm64/bitops.h
> > b/xen/arch/arm/include/asm/arm64/bitops.h
> > index d85a49bca4..f9dd066237 100644
> > --- a/xen/arch/arm/include/asm/arm64/bitops.h
> > +++ b/xen/arch/arm/include/asm/arm64/bitops.h
> > @@ -36,57 +36,9 @@ static inline int flsl(unsigned long x)
> > =C2=A0=20
> > =C2=A0 /* Based on linux/include/asm-generic/bitops/find.h */
> > =C2=A0=20
> > -#ifndef find_next_bit
> > -/**
> > - * find_next_bit - find the next set bit in a memory region
> > - * @addr: The address to base the search on
> > - * @offset: The bitnumber to start searching at
> > - * @size: The bitmap size in bits
> > - */
> > -extern unsigned long find_next_bit(const unsigned long *addr,
> > unsigned long
> > -		size, unsigned long offset);
> > -#endif
> > -
> > -#ifndef find_next_zero_bit
> > -/**
> > - * find_next_zero_bit - find the next cleared bit in a memory
> > region
> > - * @addr: The address to base the search on
> > - * @offset: The bitnumber to start searching at
> > - * @size: The bitmap size in bits
> > - */
> > -extern unsigned long find_next_zero_bit(const unsigned long *addr,
> > unsigned
> > -		long size, unsigned long offset);
> > -#endif
> > -
> > -#ifdef CONFIG_GENERIC_FIND_FIRST_BIT
> > -
> > -/**
> > - * find_first_bit - find the first set bit in a memory region
> > - * @addr: The address to start the search at
> > - * @size: The maximum size to search
> > - *
> > - * Returns the bit number of the first set bit.
> > - */
> > -extern unsigned long find_first_bit(const unsigned long *addr,
> > -				=C2=A0=C2=A0=C2=A0 unsigned long size);
> > -
> > -/**
> > - * find_first_zero_bit - find the first cleared bit in a memory
> > region
> > - * @addr: The address to start the search at
> > - * @size: The maximum size to search
> > - *
> > - * Returns the bit number of the first cleared bit.
> > - */
> > -extern unsigned long find_first_zero_bit(const unsigned long
> > *addr,
> > -					 unsigned long size);
> > -#else /* CONFIG_GENERIC_FIND_FIRST_BIT */
> > -
> > =C2=A0 #define find_first_bit(addr, size) find_next_bit((addr), (size),
> > 0)
> > =C2=A0 #define find_first_zero_bit(addr, size)
> > find_next_zero_bit((addr), (size), 0)
> > =C2=A0=20
> > -#endif /* CONFIG_GENERIC_FIND_FIRST_BIT */
>=20
> AFAICT, you are changing the behavior for Arm64 without explaining
> why.=20
> Before, it was possible to set CONFIG_GENERIC_FIND_FIRST_BIT so the=20
> generic version of find_first_*_bit are used. This is not possible=20
> anymore with your change.
>=20
> Looking at Linux, I see that arm64 is now selecting=20
> GENERIC_FIND_FIRST_BIT (see [1]). So I would argue, we should not
> define=20
> find_first_bit(). That said, that's probably a separate patch.
>=20
> For now, you want to explain why GENERIC_FIND_FIRST_BIT is dropped.
I chose to remove it because I couldn't find any usage or configuration
setting for this in Xen (Arm).

I can add "#ifdef GENERIC_FIND_FIRST_BIT" around find_first_zero_bit()
and find_first_bit() in xen/bitops.h, and according to the link [1], it
should be wrapped with ifdef. Perhaps it would be better to use "#if
defined(GENERIC_FIND_FIRST_BIT) && defined(CONFIG_ARM_64)".

My only concern is that it might seem somewhat inconsistent with the
other find_*_bit() functions added in this patch. Should we be care
about that? I mean that do we need similar config or it would be enough
to add a comment why it is necessary to have ifdef
GENERIC_FIND_FIRST_BIT.

~ Oleksii
>=20
> [1]=20
> https://lore.kernel.org/linux-arch/20210225135700.1381396-1-yury.norov@gm=
ail.com/
>=20


