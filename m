Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD026A47B7
	for <lists+xen-devel@lfdr.de>; Mon, 27 Feb 2023 18:17:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.502835.774844 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWh7b-0008BD-4K; Mon, 27 Feb 2023 17:17:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 502835.774844; Mon, 27 Feb 2023 17:17:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWh7b-00088Z-1I; Mon, 27 Feb 2023 17:17:07 +0000
Received: by outflank-mailman (input) for mailman id 502835;
 Mon, 27 Feb 2023 17:17:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ddEZ=6X=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pWh7a-00088T-1A
 for xen-devel@lists.xenproject.org; Mon, 27 Feb 2023 17:17:06 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8d780928-b6c2-11ed-a82a-c9ca1d2f71af;
 Mon, 27 Feb 2023 18:17:03 +0100 (CET)
Received: by mail-lj1-x22e.google.com with SMTP id z42so7197282ljq.13
 for <xen-devel@lists.xenproject.org>; Mon, 27 Feb 2023 09:17:03 -0800 (PST)
Received: from [192.168.8.114] (46.204.108.203.nat.umts.dynamic.t-mobile.pl.
 [46.204.108.203]) by smtp.gmail.com with ESMTPSA id
 b15-20020a2e988f000000b0029599744c02sm806368ljj.75.2023.02.27.09.17.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 09:17:02 -0800 (PST)
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
X-Inumbo-ID: 8d780928-b6c2-11ed-a82a-c9ca1d2f71af
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZmBDKNUPDF5/6k02WURTwKtK8hP0cnZH3gnLZ0vsKqY=;
        b=fTfmiGmNowgJdmHo9aHhG8N03I6wPkruq3KKaZIjVUVlRmxYXoogeotwuPknvk4+Lg
         G8fZEmYEKW7x/kUosVYRYD5Xc7FL67baY0jhQqYXK5ShHOa+No9VSfEEIe5XumRIudfe
         xaRi6MCgvq42KKicsYtHieWKhLgF9Pa0P7LgJFdBnUpgLvWwk1lwD5lTKj1FLG0iI7+h
         +7XOYIZj/qx1fOXQCQftVW4zBqQNVXmB6ZEPxHgssyEysBKpUmB7BFqw2J/iSRdWXHFn
         dHrnzB4AryQorTlfoRnllprREu+fr9NhYXHQrRzYyOdZlcS93ROStliL/MkUz7czProX
         pgXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZmBDKNUPDF5/6k02WURTwKtK8hP0cnZH3gnLZ0vsKqY=;
        b=3Pwdwi8rweOY/XuFpFWQd5RKmesxiE7vHWZsFztG+WVDlt9QNhqATBr+XJ2sJ+IjFx
         KL/3hZygNO6+CoeB+zp9akqxpnlApw6Qu9HbUt9Fz8bXQLruDfg1z3zYPEN1SP+fH9yj
         Cu+y90pvfK5EAt6AEYJpU7xXkrX8cS8SlL42MiJJy9YaqCk63BSdce6PS4ugjJwZUVKK
         FFVuRdYN9zbeYoI//85dz4RBzm8E6b/H0dAFreTUu5n7Lb3jsGmzP+cuG0JHzj3lWbMg
         V1sqlBKL6EYZAmSpxWQXbi9YLiHTzyIL1HN6BIDpeGB7vkOq2xqnofJfcLSlAt13f9GW
         7khw==
X-Gm-Message-State: AO0yUKXSuVVbO46yo6oj5IqffnkCMZYQkHDzGXQW4Qqh+VO8ejqFCpeO
	h6174H3CFHU9c7mOVH7ok1Q=
X-Google-Smtp-Source: AK7set9Z86gIV1i4uNaiNwfHMGoLQvnGDSzsCJTAzKzAbTTJN1UGsYFujB4c3piXRIG93SsRh/iVYw==
X-Received: by 2002:a2e:1414:0:b0:293:4b96:1b6b with SMTP id u20-20020a2e1414000000b002934b961b6bmr8789797ljd.25.1677518222778;
        Mon, 27 Feb 2023 09:17:02 -0800 (PST)
Message-ID: <e2a1968767e7a0f1535920ada14ec2f323e0f9c5.camel@gmail.com>
Subject: Re: [PATCH v1 2/3] xen/riscv: setup initial pagetables
From: Oleksii <oleksii.kurochko@gmail.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Gianluca Guida <gianluca@rivosinc.com>, Bob
 Eshleman <bobbyeshleman@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>,  Connor Davis <connojdavis@gmail.com>
Date: Mon, 27 Feb 2023 19:17:01 +0200
In-Reply-To: <52072f1b-0cf8-a218-eefc-a8c1b4cecf43@xen.org>
References: <cover.1677250203.git.oleksii.kurochko@gmail.com>
	 <83444f8f90cf2adf431762d919ba958a25ff8ce4.1677250203.git.oleksii.kurochko@gmail.com>
	 <52072f1b-0cf8-a218-eefc-a8c1b4cecf43@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0

On Sat, 2023-02-25 at 18:05 +0000, Julien Grall wrote:
> Hi,
>=20
> On 24/02/2023 15:06, Oleksii Kurochko wrote:
> > Calculate load and linker linker image addresses and
> > setup initial pagetables.
> >=20
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > ---
> > =C2=A0 xen/arch/riscv/setup.c | 11 +++++++++++
> > =C2=A0 1 file changed, 11 insertions(+)
> >=20
> > diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
> > index b7cd438a1d..f69bc278bb 100644
> > --- a/xen/arch/riscv/setup.c
> > +++ b/xen/arch/riscv/setup.c
> > @@ -1,9 +1,11 @@
> > =C2=A0 #include <xen/bug.h>
> > =C2=A0 #include <xen/compile.h>
> > =C2=A0 #include <xen/init.h>
> > +#include <xen/kernel.h>
> > =C2=A0=20
> > =C2=A0 #include <asm/csr.h>
> > =C2=A0 #include <asm/early_printk.h>
> > +#include <asm/mm.h>
> > =C2=A0 #include <asm/traps.h>
> > =C2=A0=20
> > =C2=A0 /* Xen stack for bringing up the first CPU. */
> > @@ -43,6 +45,11 @@ static void __init disable_fpu(void)
> > =C2=A0=20
> > =C2=A0 void __init noreturn start_xen(void)
> > =C2=A0 {
> > +=C2=A0=C2=A0=C2=A0 unsigned long load_start=C2=A0=C2=A0=C2=A0 =3D (uns=
igned long)start;
> > +=C2=A0=C2=A0=C2=A0 unsigned long load_end=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 =3D load_start + (unsigned
> > long)(_end - _start);
>=20
> I am a bit puzzled, on top of load_addr() and linker_addr(), you
> wrote=20
> it can't use global variable/function. But here... you are using
> them.=20
> So how is this different?
I don't use load_addr() and linker_addr() macros here.
>=20
> > +=C2=A0=C2=A0=C2=A0 unsigned long linker_start=C2=A0 =3D (unsigned long=
)_start;
> > +=C2=A0=C2=A0=C2=A0 unsigned long linker_end=C2=A0=C2=A0=C2=A0 =3D (uns=
igned long)_end;
>=20
> I am a bit confused with how you define the start/end for both the=20
> linker and load. In one you use _start and the other _end.
>=20
> Both are fixed at compile time, so I assume the values will be a
> linked=20
> address rather than the load address. So how is this meant to how?
>=20
_start, _end - it is label from linker script so I use them to define
linker_start and linker_end addresses.

load_start is defined as an address of start() function from head.S and
load_end is the load_start + the size  (_end - _start)

> Furthermore, I would expect linker_start and load_start to point to
> the=20
> same symbol (the only different is one store the virtual address
> whereas=20
> the other the physical address). But here you are technically using
> two=20
> different symbol. Can you explain why?
It is used to make identity mapping for the range [load_addr, load_end]
and [linker_addr, linker_end]. It was done so because in Bobby's
patches in the linker script XEN_VIRT_START is defined as
_AT(vaddr_t,0x00200000) but bootloader loads Xen at 0x80200000 and so
in this case loadr_addr !=3D linker_addr.
But I have changed XEN_VIRT_START to 0x8020...00 so they are equal now.
>=20
> > +
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * The following things are passed =
by bootloader:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0=C2=A0 a0 -> hart_id
> > @@ -65,6 +72,10 @@ void __init noreturn start_xen(void)
> > =C2=A0=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 test_macros_from_bug_h();
> > =C2=A0=20
> > +=C2=A0=C2=A0=C2=A0 setup_initial_pagetables(load_start, load_end, link=
er_start,
> > linker_end);
>=20
> Shouldn't this happen earlier in start_xen()?
It can. If to be honest I don't know if it should. I added at the end
only because it was the last thing I worked on...
>=20
> Cheers,
>=20
~ Oleksii

