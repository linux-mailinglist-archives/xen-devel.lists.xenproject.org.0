Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C62B840384
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jan 2024 12:10:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.672913.1047011 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUPVb-0003aX-FZ; Mon, 29 Jan 2024 11:08:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 672913.1047011; Mon, 29 Jan 2024 11:08:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUPVb-0003Z1-CD; Mon, 29 Jan 2024 11:08:59 +0000
Received: by outflank-mailman (input) for mailman id 672913;
 Mon, 29 Jan 2024 11:08:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XNHd=JH=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rUPVZ-0003Yv-8Y
 for xen-devel@lists.xenproject.org; Mon, 29 Jan 2024 11:08:57 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a8aa45f8-be96-11ee-8a43-1f161083a0e0;
 Mon, 29 Jan 2024 12:07:58 +0100 (CET)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-5102e2ab56eso1696254e87.2
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jan 2024 03:07:57 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 g14-20020a19ee0e000000b005110e5a3724sm412328lfb.67.2024.01.29.03.07.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jan 2024 03:07:56 -0800 (PST)
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
X-Inumbo-ID: a8aa45f8-be96-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706526477; x=1707131277; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6K4wLsQGuNpI3+vcfAR8ge4acxppjZAmqAMS4zBTgH4=;
        b=c7yIOSgHiOdopiUwKnf0hK5Pcv9Xo5ycZzhqjw2fzb8d92iCgY4YeBXW9l3liCJKlG
         O/H+iBIvzVjRsF5lBSSWFQn3VzwrxhV4mlqokSGKuhECwoJPTqQZNXAkkTYUxbYjCwIY
         CQ1svn0QJvK6RA/ht97UY5/yXIG08Hd761Cv8OlKQJHGTIIjo9+6QzKi84u5u37oLzgM
         LB+e4lCvRsyADoew5L8TAvYtHuwJvV6zv7/R55j1sINw7PAyIbXkPvEd6U1rVMz94K4L
         Sk8A8t+mZEwmROTwxmMTGrPvMRyuy4p7nEfqNRI4LKWCBaU50Np0gBXemXlPVXQm1bsD
         T2vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706526477; x=1707131277;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6K4wLsQGuNpI3+vcfAR8ge4acxppjZAmqAMS4zBTgH4=;
        b=i9uZCU+DwBuwZFl8VOFggTtwL5g/P6vFsJYCOjB3oGEuL3RcXJI4wLtKrIcIMN5JOG
         duo6/U8ehec7PoqCK4EbCozdRQG6su1PVTFSsd+eBsPbeOMnYyAWL0fF6mXDKGLQUDde
         QAHn+ghQAu2unIaNp/+iHIi8NGTvX+alk3Jp+oiBzY6bSrtOwl9/lfrGdmk22r7naEpN
         YJb2WxmM+StR3WHpW2u8CyuBQfBHOr1LZ8JlmUufnTWpIPYQt3SCOqPdidtWwyf7wSXB
         Icj06Nuf3gMMUx6vKVkCHrQm2I0Hs2+wbotg6f4h/bQuXKj8yvNyGkeRJAD7ksYs2xbj
         RGXg==
X-Gm-Message-State: AOJu0YzTgT+bjHCK/UIhrLBEv/0I5HiYpEGz5IqkgeZxgeI0RdcLiJZ0
	HL4pawCSgocVZCmVG1C3W3bVBCJCBo65riECBGObfwonSRsqpPzU
X-Google-Smtp-Source: AGHT+IEnAc40IxuvuFJdue/TDryAQOBa0KkjXdCBsZ3bQYngZkFuA1F5dIZksQcsMsBZJi4PKFiG5Q==
X-Received: by 2002:ac2:5b03:0:b0:510:253f:32db with SMTP id v3-20020ac25b03000000b00510253f32dbmr3649546lfn.45.1706526477167;
        Mon, 29 Jan 2024 03:07:57 -0800 (PST)
Message-ID: <e165048a82b55ce0beb9ea171202bfc6167334bc.camel@gmail.com>
Subject: Re: [PATCH] xen/lib: introduce generic find next bit operations
From: Oleksii <oleksii.kurochko@gmail.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Shawn Anastasio
 <sanastasio@raptorengineering.com>
Date: Mon, 29 Jan 2024 13:07:54 +0200
In-Reply-To: <a5a553cf-fe8c-4934-ac97-bdc59aeaed1c@xen.org>
References: 
	<52730e6314210ba4164a9934a720c4fda201447b.1706266854.git.oleksii.kurochko@gmail.com>
	 <f8602dc5-e603-42fc-b3a2-dc71c55db341@xen.org>
	 <1104df46d7780ef1bbcb6c745685b10fe6d2aa5d.camel@gmail.com>
	 <a5a553cf-fe8c-4934-ac97-bdc59aeaed1c@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

Hi Julien,

> >=20
> > >=20
> > > On 26/01/2024 12:20, Oleksii Kurochko wrote:
> > > > find-next-bit.c is common for Arm64, PPC and RISCV64,
> > > > so it is moved to xen/lib.
> > > >=20
> > > > Suggested-by: Jan Beulich <jbeulich@suse.com>
> > > > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > > > ---
> > > > =C2=A0=C2=A0 docs/misra/exclude-list.json=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0 4 -
> > > > =C2=A0=C2=A0 xen/arch/arm/arm64/lib/Makefile=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=
=A0 2 +-
> > > > =C2=A0=C2=A0 xen/arch/arm/include/asm/arm64/bitops.h=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 48 --------
> > > > =C2=A0=C2=A0 xen/arch/ppc/include/asm/bitops.h=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 115 --------
> > > > -----
> > > > -----
> > > > =C2=A0=C2=A0 xen/include/xen/bitops.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 48 ++++++++
> > > > =C2=A0=C2=A0 xen/lib/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=
=A0 1 +
> > > > =C2=A0=C2=A0 .../find_next_bit.c =3D> lib/find-next-bit.c}=C2=A0=C2=
=A0 |=C2=A0=C2=A0 0
> > > > =C2=A0=C2=A0 7 files changed, 50 insertions(+), 168 deletions(-)
> > > > =C2=A0=C2=A0 rename xen/{arch/arm/arm64/lib/find_next_bit.c =3D> li=
b/find-
> > > > next-
> > > > bit.c} (100%)
> > > >=20
> > > > diff --git a/docs/misra/exclude-list.json b/docs/misra/exclude-
> > > > list.json
> > > > index 7971d0e70f..7fe02b059d 100644
> > > > --- a/docs/misra/exclude-list.json
> > > > +++ b/docs/misra/exclude-list.json
> > > > @@ -13,10 +13,6 @@
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 "rel_path": "arch/arm/arm64/insn.c",
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 "comment": "Imported on Linux, ignore for now"
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 "rel_path": "arch/arm/arm64/lib/find_next_bit.c",
> > >=20
> > > Rather than removing the section, I was expecting the rel_path to
> > > be
> > > updated. Can you explain why you think the exclusion is not
> > > necessary?
> > I considered simply updating the path to xen/lib/find-next-bit.c,
> > but
> > ultimately opted to remove it. This decision was based on the fact
> > that
> > the line in question checks for a file that no longer exists.=20
>=20
> That's not quite correct. The file still exists but with a different
> name.
>=20
> > If it's
> > preferable to update the rel_path with xen/lib/find-next-bit.c, I'm
> > more than willing to make that adjustment.
>=20
> The problem is by removing the file, you effectively tell Eclair to=20
> report any MISRA error. I don't believe this is what we want here.
I don't know how it should work, but when I ran CI's cppcheck and
Eclair jobs nothing were broken:
https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/1153360853

>=20
> But if the other agrees with you, then this change ought to be
> explained=20
> in the commit message.
>=20
> To me the key is the commit message should contain enough information
> for the reviewer to understand what/why you are doing. All the
> changes I=20
> pointed out are definitely not just a normal code movement.
I understand your point, I'll do my best next time.=20

> >=20
> > >=20
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 "comment": "Imported from Linux, ignore for now"
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 "rel_path": "arch/x86/acpi/boot.c",
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 "comment": "Imported from Linux, ignore for now"
> > > > diff --git a/xen/arch/arm/arm64/lib/Makefile
> > > > b/xen/arch/arm/arm64/lib/Makefile
> > > > index 1b9c7a95e6..66cfac435a 100644
> > > > --- a/xen/arch/arm/arm64/lib/Makefile
> > > > +++ b/xen/arch/arm/arm64/lib/Makefile
> > > > @@ -1,4 +1,4 @@
> > > > =C2=A0=C2=A0 obj-y +=3D memcpy.o memcmp.o memmove.o memset.o memchr=
.o
> > > > =C2=A0=C2=A0 obj-y +=3D clear_page.o
> > > > -obj-y +=3D bitops.o find_next_bit.o
> > > > +obj-y +=3D bitops.o
> > > > =C2=A0=C2=A0 obj-y +=3D strchr.o strcmp.o strlen.o strncmp.o strnle=
n.o
> > > > strrchr.o
> > > > diff --git a/xen/arch/arm/include/asm/arm64/bitops.h
> > > > b/xen/arch/arm/include/asm/arm64/bitops.h
> > > > index d85a49bca4..f9dd066237 100644
> > > > --- a/xen/arch/arm/include/asm/arm64/bitops.h
> > > > +++ b/xen/arch/arm/include/asm/arm64/bitops.h
> > > > @@ -36,57 +36,9 @@ static inline int flsl(unsigned long x)
> > > > =C2=A0=C2=A0=20
> > > > =C2=A0=C2=A0 /* Based on linux/include/asm-generic/bitops/find.h */
> > > > =C2=A0=C2=A0=20
> > > > -#ifndef find_next_bit
> > > > -/**
> > > > - * find_next_bit - find the next set bit in a memory region
> > > > - * @addr: The address to base the search on
> > > > - * @offset: The bitnumber to start searching at
> > > > - * @size: The bitmap size in bits
> > > > - */
> > > > -extern unsigned long find_next_bit(const unsigned long *addr,
> > > > unsigned long
> > > > -		size, unsigned long offset);
> > > > -#endif
> > > > -
> > > > -#ifndef find_next_zero_bit
> > > > -/**
> > > > - * find_next_zero_bit - find the next cleared bit in a memory
> > > > region
> > > > - * @addr: The address to base the search on
> > > > - * @offset: The bitnumber to start searching at
> > > > - * @size: The bitmap size in bits
> > > > - */
> > > > -extern unsigned long find_next_zero_bit(const unsigned long
> > > > *addr,
> > > > unsigned
> > > > -		long size, unsigned long offset);
> > > > -#endif
> > > > -
> > > > -#ifdef CONFIG_GENERIC_FIND_FIRST_BIT
> > > > -
> > > > -/**
> > > > - * find_first_bit - find the first set bit in a memory region
> > > > - * @addr: The address to start the search at
> > > > - * @size: The maximum size to search
> > > > - *
> > > > - * Returns the bit number of the first set bit.
> > > > - */
> > > > -extern unsigned long find_first_bit(const unsigned long *addr,
> > > > -				=C2=A0=C2=A0=C2=A0 unsigned long size);
> > > > -
> > > > -/**
> > > > - * find_first_zero_bit - find the first cleared bit in a
> > > > memory
> > > > region
> > > > - * @addr: The address to start the search at
> > > > - * @size: The maximum size to search
> > > > - *
> > > > - * Returns the bit number of the first cleared bit.
> > > > - */
> > > > -extern unsigned long find_first_zero_bit(const unsigned long
> > > > *addr,
> > > > -					 unsigned long size);
> > > > -#else /* CONFIG_GENERIC_FIND_FIRST_BIT */
> > > > -
> > > > =C2=A0=C2=A0 #define find_first_bit(addr, size) find_next_bit((addr=
),
> > > > (size),
> > > > 0)
> > > > =C2=A0=C2=A0 #define find_first_zero_bit(addr, size)
> > > > find_next_zero_bit((addr), (size), 0)
> > > > =C2=A0=C2=A0=20
> > > > -#endif /* CONFIG_GENERIC_FIND_FIRST_BIT */
> > >=20
> > > AFAICT, you are changing the behavior for Arm64 without
> > > explaining
> > > why.
> > > Before, it was possible to set CONFIG_GENERIC_FIND_FIRST_BIT so
> > > the
> > > generic version of find_first_*_bit are used. This is not
> > > possible
> > > anymore with your change.
> > >=20
> > > Looking at Linux, I see that arm64 is now selecting
> > > GENERIC_FIND_FIRST_BIT (see [1]). So I would argue, we should not
> > > define
> > > find_first_bit(). That said, that's probably a separate patch.
> > >=20
> > > For now, you want to explain why GENERIC_FIND_FIRST_BIT is
> > > dropped.
> > I chose to remove it because I couldn't find any usage or
> > configuration
> > setting for this in Xen (Arm).
>=20
> Right. My point is the commit message can lead to think this is a
> simple=20
> code movement and there are no change of behavior.
>=20
> It wasn't clear to me whether this was done on purpose or not. It
> looks=20
> like it was and therefore should really be explained in the commit
> message.
Next time I'll add the explanation to the commit message to make it
more clear.

>=20
> >=20
> > I can add "#ifdef GENERIC_FIND_FIRST_BIT" around
> > find_first_zero_bit()
> > and find_first_bit() in xen/bitops.h, and according to the link
> > [1], it
> > should be wrapped with ifdef. Perhaps it would be better to use
> > "#if
> > defined(GENERIC_FIND_FIRST_BIT) && defined(CONFIG_ARM_64)".
> >=20
> > My only concern is that it might seem somewhat inconsistent with
> > the
> > other find_*_bit() functions added in this patch. Should we be care
> > about that? I mean that do we need similar config or it would be
> > enough
> > to add a comment why it is necessary to have ifdef
> > GENERIC_FIND_FIRST_BIT.
>=20
> Note that I didn't ask to keep GENERIC_FIND_FIRST_BIT. I actually=20
> pointed out that it can be removed but it should be explained in the=20
> commit message.
GENERIC_FIND_FIRST_BIT config was removed in Linux kernel too as all
architectures were switched to use find_{first,last}_bit()
unconditionally:
https://lore.kernel.org/linux-arch/20211005054059.475634-5-yury.norov@gmail=
.com/

This is not the case of Xen, as some, at least, x86 has arch specific
implementation of find_{first,last}_bit(), but it can be another one
justification why this config can be removed in Xen.

~ Oleksii

