Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F87B680C0F
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jan 2023 12:35:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.486922.754350 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMSRS-0008H5-01; Mon, 30 Jan 2023 11:35:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 486922.754350; Mon, 30 Jan 2023 11:35:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMSRR-0008Dr-Sp; Mon, 30 Jan 2023 11:35:17 +0000
Received: by outflank-mailman (input) for mailman id 486922;
 Mon, 30 Jan 2023 11:35:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qdfF=53=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pMSRQ-0008C3-DN
 for xen-devel@lists.xenproject.org; Mon, 30 Jan 2023 11:35:16 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 29f6158c-a092-11ed-9ec0-891035b88211;
 Mon, 30 Jan 2023 12:35:15 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id qw12so14915479ejc.2
 for <xen-devel@lists.xenproject.org>; Mon, 30 Jan 2023 03:35:14 -0800 (PST)
Received: from pc-879.home (83.29.147.144.ipv4.supernova.orange.pl.
 [83.29.147.144]) by smtp.gmail.com with ESMTPSA id
 r15-20020a1709067fcf00b0087fa83790d8sm4427334ejs.13.2023.01.30.03.35.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 03:35:13 -0800 (PST)
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
X-Inumbo-ID: 29f6158c-a092-11ed-9ec0-891035b88211
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=04m/QlYD5IP5yaIiFAfiA9arqesecfjmAPr2w53O6Rk=;
        b=eX4a3VUUwe9jt4YmxjSXpvkax5KfJYj5y8JB5a4eSLdZH9pfzo8yY8PG2GVBebq65O
         dEjCUzG94LC4+neBZsKF7/Wxjb0h3Z6o6uht66ErNyavC7NuTmUIYOZBBpshf/6IYqIX
         4uAq9jDMkm6lCvEPNGKgGsXQ0QxrL3uiiQLutWweO3+eP0tZvF2Ozt1Sm3WmVRtkscJi
         9H40HGcugyRG6Vd+WN6/zqbtRKi4PMenEQjiki0VVvhdrN5NAiHz6v674mren8caiSzs
         bT7sH8a//aykK5yLRJ2Bu0iT8KKN7IkKgxP4QK60pJQRslIzQVWKpZI9kJ9jo0Pmjgjb
         9UtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=04m/QlYD5IP5yaIiFAfiA9arqesecfjmAPr2w53O6Rk=;
        b=1ggp30hWoIUuA+49i3vbsVmPPrHFbdLM2hsE+3vmMkUfE2JnKdhLx2wz5gX5lrsYRw
         g6KJVJTNYZDBSWUnaZdYYbaKaQBvt4+jz+fsGYcitunVM3gty0CGzeW3y3KvIXOJsL4O
         HCVh3HOOrJ+LQMvL8zRoijdbFHXxNiqndoRhwUGbs/hoi5PwreNycaCdM9uQmXvP5tTW
         nuaj02NcWaFx38ySJhR5EfEuJa1iNIRRCfcYN95ZLN63GEpRr8/hGoN/kT3/go4T7Q9i
         fYqL+tJEriDIiruaUSfmMsAqXmf3SzdBmDwzTPcFdmj/gOU5+jgohHkiq9eWDW8mVKv7
         gbiw==
X-Gm-Message-State: AO0yUKUOVKWNX00LEyHSjggy2yk3UHE8DpS4xNTN0MN83qRh/gHdpGLz
	RHKK/+LKxZ2JwMkPlgPosbI=
X-Google-Smtp-Source: AK7set+mgM167L0+D51sv4So75bRjVBICY3zbXS7d9H0qk/9DDSKJ8Lx9iTMJltEZqG00/G0xiu5RA==
X-Received: by 2002:a17:907:7856:b0:878:4cdb:cb42 with SMTP id lb22-20020a170907785600b008784cdbcb42mr15673697ejc.60.1675078514510;
        Mon, 30 Jan 2023 03:35:14 -0800 (PST)
Message-ID: <2c4d490bde4f04f956e481257ddc7129c312abb6.camel@gmail.com>
Subject: Re: [PATCH v2 12/14] xen/riscv: introduce an implementation of
 macros from <asm/bug.h>
From: Oleksii <oleksii.kurochko@gmail.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>,  Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>, 
 Connor Davis <connojdavis@gmail.com>
Date: Mon, 30 Jan 2023 13:35:13 +0200
In-Reply-To: <73553bcf-9688-c187-a9cb-c12806484893@xen.org>
References: <cover.1674818705.git.oleksii.kurochko@gmail.com>
	 <06c06dde5ee635c6d1ebf66a8cff9e7e1f4fbf5c.1674818705.git.oleksii.kurochko@gmail.com>
	 <73553bcf-9688-c187-a9cb-c12806484893@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0

Hi Julien,
On Fri, 2023-01-27 at 16:02 +0000, Julien Grall wrote:
> Hi Oleksii,
>=20
> On 27/01/2023 13:59, Oleksii Kurochko wrote:
> > The patch introduces macros: BUG(), WARN(), run_in_exception(),
> > assert_failed.
> >=20
> > The implementation uses "ebreak" instruction in combination with
> > diffrent bug frame tables (for each type) which contains useful
> > information.
> >=20
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > ---
> > Changes:
> > =C2=A0=C2=A0 - Remove __ in define namings
> > =C2=A0=C2=A0 - Update run_in_exception_handler() with
> > =C2=A0=C2=A0=C2=A0=C2=A0 register void *fn_ asm(__stringify(BUG_FN_REG)=
) =3D (fn);
> > =C2=A0=C2=A0 - Remove bug_instr_t type and change it's usage to uint32_=
t
> > ---
> > =C2=A0 xen/arch/riscv/include/asm/bug.h | 118
> > ++++++++++++++++++++++++++++
> > =C2=A0 xen/arch/riscv/traps.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 128
> > +++++++++++++++++++++++++++++++
> > =C2=A0 xen/arch/riscv/xen.lds.S=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 10 +++
> > =C2=A0 3 files changed, 256 insertions(+)
> > =C2=A0 create mode 100644 xen/arch/riscv/include/asm/bug.h
> >=20
> > diff --git a/xen/arch/riscv/include/asm/bug.h
> > b/xen/arch/riscv/include/asm/bug.h
> > new file mode 100644
> > index 0000000000..4b15d8eba6
> > --- /dev/null
> > +++ b/xen/arch/riscv/include/asm/bug.h
> > @@ -0,0 +1,118 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Copyright (C) 2012 Regents of the University of California
> > + * Copyright (C) 2021-2023 Vates
>=20
> I have to question the two copyrights here given that the majority of
> the code seems to be taken from the arm implementation (see=20
> arch/arm/include/asm/bug.h).
>=20
> With that said, we should consolidate the code rather than
> duplicating=20
> it on every architecture.
>=20
Copyrights should be removed. They were taken from the previous
implementation of bug.h for RISC-V so I just forgot to remove them.

It looks like we should have common bug.h for ARM and RISCV but I am
not sure that I know how to do that better.
Probably the code wants to be moved to xen/include/bug.h and using
ifdef ARM && RISCV ...
But still I am not sure that this is the best one option as at least we
have different implementation for x86_64.
> Cheers,
>=20
~ Oleksii


