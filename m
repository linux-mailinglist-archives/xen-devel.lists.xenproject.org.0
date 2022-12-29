Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57325658AAA
	for <lists+xen-devel@lfdr.de>; Thu, 29 Dec 2022 09:46:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.469658.729056 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pAoXm-0005kG-Le; Thu, 29 Dec 2022 08:45:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 469658.729056; Thu, 29 Dec 2022 08:45:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pAoXm-0005hA-IR; Thu, 29 Dec 2022 08:45:42 +0000
Received: by outflank-mailman (input) for mailman id 469658;
 Thu, 29 Dec 2022 08:45:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=huHg=43=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pAoXl-0005h4-P2
 for xen-devel@lists.xenproject.org; Thu, 29 Dec 2022 08:45:41 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2c27a200-8755-11ed-91b6-6bf2151ebd3b;
 Thu, 29 Dec 2022 09:45:40 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id bx10so16852247wrb.0
 for <xen-devel@lists.xenproject.org>; Thu, 29 Dec 2022 00:45:40 -0800 (PST)
Received: from [192.168.0.145] ([195.234.76.149])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a5d42c4000000b002876ab9debcsm4657607wrr.36.2022.12.29.00.45.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Dec 2022 00:45:39 -0800 (PST)
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
X-Inumbo-ID: 2c27a200-8755-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dgwR7gOszcPEX0FH1lurSFggxSFvTU4sEabij0oL3T8=;
        b=cyLiOIyFh0fISg34fymN5QLbc8B+atg7TN8P6El8cxbEc9vZQOXbAnEtWRTbuVMPO1
         Tj8DI+3YX2JCgOSrVmj2FKFcNUJiZGayRUiN5SOF1Oqycj3Toan+Wb84ApGocfcpspuP
         FseZsSetQPL85CtsoFWcgCdDcymN6bj9br8qrJ1lDg9LwPB4cjP1s0KqzJlg0KTdW3Kw
         ezfS9dKpAWxs0Qbozk4i1ZDesKVinBlAfSl9uGG7/myxZO3DkT9mlyzhZopG9gZ8wvGs
         dmRQu4ulUZu//0ym2+iro4OrKFaN1GV6e1OmuyPgDZMQVBXFbGYrPwMx9fxXzGR5554s
         XBxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dgwR7gOszcPEX0FH1lurSFggxSFvTU4sEabij0oL3T8=;
        b=6oqZKaIXBzNAVfdCh65cJupwg97Ukq4UYylIVCtCoxE6ZGN4qqdezK1995iVkxVtC2
         3RFJYCeK5PA22obJqk08hEKm1ZIfRgvRmfnxrVlzAHOc7qwVi+dHTNdSL/LjNI6rq+Z/
         KUw0ccEEt0oUim4ahnJ0zQqZejTXqO3huCybiOi6Gedw2F88haP0cc/2beQX0bRC/Utd
         HWEHDQAGvNgKASAhDHXZBacI40BoEP2lIAyB40VGsN+kTcDTYWjZ4m9tY+5NWK/B7vwy
         gLFaDDHggBzbLg2VeNSHvqrGjQnp+OUNAMChep6/R74M4TafNsQt6n9EnwLdLywejhzE
         vINQ==
X-Gm-Message-State: AFqh2kpG62zu1BlnmYJpN54ZriAqLvJIr7U3xU/XXgmeTIlBJPa7UwKh
	RQ/Y53JcARG539awGXinejg=
X-Google-Smtp-Source: AMrXdXus80TP9ooL8GwE40LXv7NoTf8FmcrIHi2YoZ47C6g8VChQdwRtmhwATYbDbTtHbo6NQ7+a4Q==
X-Received: by 2002:a5d:4d8c:0:b0:241:fb7d:2f15 with SMTP id b12-20020a5d4d8c000000b00241fb7d2f15mr14091578wru.29.1672303539766;
        Thu, 29 Dec 2022 00:45:39 -0800 (PST)
Message-ID: <540787f539e2620951ebbc7d0aa6767588e0e3ab.camel@gmail.com>
Subject: Re: [XEN PATCH v1 1/4] arch/riscv: initial RISC-V support to
 build/run minimal Xen
From: Oleksii <oleksii.kurochko@gmail.com>
To: Julien Grall <julien.grall@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@citrix.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Gianluca Guida <gianluca@rivosinc.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Date: Thu, 29 Dec 2022 10:45:38 +0200
In-Reply-To: <CAF3u54A+Qqn+7dyBqh8utnN04b-DYkHbtL5DEEWuw9HQ2EQzTQ@mail.gmail.com>
References: <cover.1671789736.git.oleksii.kurochko@gmail.com>
	 <5d5ec5fbd8787ed8f86bf84a5ac291d07a20b307.1671789736.git.oleksii.kurochko@gmail.com>
	 <3343c927-0f27-e285-5b6e-281c61939bb4@xen.org>
	 <43d726761900ba3d8b4919fc29fe7cb1991ac656.camel@gmail.com>
	 <CAF3u54A+Qqn+7dyBqh8utnN04b-DYkHbtL5DEEWuw9HQ2EQzTQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1 (3.46.1-1.fc37) 
MIME-Version: 1.0

On Wed, 2022-12-28 at 22:22 +0000, Julien Grall wrote:
>=20
>=20
> On Mon, 26 Dec 2022 at 12:14, Oleksii <oleksii.kurochko@gmail.com>
> wrote:
> > >=20
> > > > +/*
> > > > + * PAGE_SIZE is defined in <{asm,xen}/page-*.h> but to
> > > > + * remove unnecessary headers for minimal
> > > > + * build headers it will be better to set PAGE_SIZE
> > > > + * explicitly.
> > >=20
> > > TBH, I think this is a shortcut that is unnecessary and will only
> > > introduce extra churn in the future (for instance, you will need
> > > to=20
> > > modify the include in xen.lds.S).
> > >=20
> > > But I am not the maintainer, so I will leave that decision to
> > > them=20
> > > whether this is acceptable.
> >=20
> > I didn't get what you mean by a shortcut here.
> >=20
>=20
>=20
> config.h is automatically included everywhere. So anything defined in
> the header will also be available everywhere. Once you move the
> definition in a separate header, then you will have have to chase
> where the definition is used.
>=20
> An alternative would be to include the new header in config.h.
> However, this is not always wanted (we are trying to limit the scope
> of some definitions).
>=20
> So maybe you are saving a few minutes now. But you will spend a lot
> more to chase the places where the new header needs to be included.
>=20

Thanks for clarification.

> >=20
> > >=20
> > > > + *
> > > > + * TODO: remove it when <asm/page-*.h> will be needed
> > > > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 defintion of PAGE_SIZE shou=
ld be remove from
> > >=20
> > > s/defintion/definition/
> >=20
> > Thanks for finding the typo. Will update it in the next version of
> > the patch.
> >=20
> > >=20
> > > > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 this header.
> > > > + */
> > > > +#define PAGE_SIZE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4096 > +
> > > > =C2=A0 #endif /* __RISCV_CONFIG_H__ */
> > > > =C2=A0 /*
> > > > =C2=A0=C2=A0 * Local variables:
> > > > diff --git a/xen/arch/riscv/include/asm/types.h
> > > > b/xen/arch/riscv/include/asm/types.h
> > > > new file mode 100644
> > > > index 0000000000..afbca6b15c
> > > > --- /dev/null
> > > > +++ b/xen/arch/riscv/include/asm/types.h
> > > > @@ -0,0 +1,11 @@
> > > > +#ifndef __TYPES_H__
> > > > +#define __TYPES_H__
> > > > +
> > > > +/*
> > > > + *
> > > > + * asm/types.h is required for xen-syms.S file which
> > > > + * is produced by tools/symbols.
> > > > + *
> > > > + */
> > > > +
> > > > +#endif
> > > > diff --git a/xen/arch/riscv/riscv64/Makefile
> > > > b/xen/arch/riscv/riscv64/Makefile
> > > > index 15a4a65f66..3340058c08 100644
> > > > --- a/xen/arch/riscv/riscv64/Makefile
> > > > +++ b/xen/arch/riscv/riscv64/Makefile
> > > > @@ -1 +1 @@
> > > > -extra-y +=3D head.o
> > > > +obj-y +=3D head.o
> > >=20
> > > This changes want to be explained. So does...
> >=20
> > RISC-V 64 would be supported now and minimal build is built
> > now only obj-y stuff.
> >=20
>=20
>=20
> I am a bit confused. It thought what was checked in was meant to
> work. Did I misremembered?

The current mainline Xen can only build head.o directly using the
following command:
make XEN_TARGET_ARCH=3Driscv64 CROSS_COMPILE=3Driscv64-linux-gnu-
KBUILD_DEFCONFIG=3Dtiny64_defconfig arch/riscv/riscv64/head.o

Comments can be found in the commit: 2a04f396a34c5a43b9a09d72e8c4f

> >=20
> >=20
> > >=20
> > > > diff --git a/xen/arch/riscv/riscv64/head.S
> > > > b/xen/arch/riscv/riscv64/head.S
> > > > index 0dbc27ba75..0330b29c01 100644
> > > > --- a/xen/arch/riscv/riscv64/head.S
> > > > +++ b/xen/arch/riscv/riscv64/head.S
> > > > @@ -1,6 +1,6 @@
> > > > =C2=A0 #include <asm/config.h>
> > > > =C2=A0=20
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .text
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .section .text.header, =
"ax", %progbits
> > >=20
> > > ... AFAICT this is to match the recent change in the build
> > > system.
> >=20
> > I am not sure that I get you here but it was done to make 'start'
> > instructions to be the first instructions that will be executed and
> > to make 'start' symbol to be the first in xen-syms.map file
> > otherwise
> > gdb shows that Xen starts from the wrong instructions, fails to
> > find
> > correct source file and goes crazy.
> >=20
>=20
>=20
> When the file head.S was originally created, there was no section
> .text.header. Instead head.S was included at the top with some
> different runes.
> >=20
> > >=20
> > > > +=C2=A0 } :text
> > > > +
> > >=20
> > > I am assuming you are going to add .init.* afterwards?
> > >=20
> > > > +=C2=A0 . =3D ALIGN(PAGE_SIZE);
> > > > +=C2=A0 .bss : {
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __bss_start =3D .;
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *(.bss .bss.*)
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 . =3D ALIGN(POINTER_ALIGN);
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __bss_end =3D .;
> > >=20
> > > Same as .data, I would recommend to properly populate it.
> >=20
> > Do you mean to add .bss.stack_aligned, .bss.page_aligned,
> > .bss.percpu*?
> > One of the reasons they were skipped is they aren't used now and
> > one
> > more reason if to believe xen.lds.S file from ARM
> > .bss.percpu.read_mostly should be aligned by SMP_CACHE_BYTES which
> > requires dummy <asm/cache.h> (or not ?) which will increase the
> > patch
> > with unneeded stuff for now.=20
> >=20
>=20
>=20
> I will answer your reply to Alistair here at the same time.
>=20
> The problem is .bss.* will include any section start with .bss.. IOW
> section like .bss.page_aligned will also be covered and therefore you
> will not get a linker failure.
>=20
> Instead , the linker will fold the section wherever it wants.
> Therefore, there is no guarantee, the content will be page aligned.
> When using the binary, you could end up with weird behavior that will
> be hard to debug.
>=20
> I understand you are trying to get a basic build. But, I feel the
> linker is not something you want to quickly rush. 1h may turn into
> hours lost in a few months because not everyone may remember that you
> didn=E2=80=99t special case .bss.page_aligned.
>=20
> Short of suggesting to have a common linker script, =C2=A0you could simpl=
y
> not use * (IOW explictly list the section).=C2=A0 With that, you should
> get a linking warning/error if the section is not listed.
>=20
Totally agree then.
I missed that there is .bss.*.
Actually I reworked a little bit xen.lds.S. As a basis I took xen.lds.S
from ARM and removed all arch specific sections. So xen.lds.S contains
stuff which isn't used for now (for example, *(.data.schedulers)) but
will be used in future.
Would it be better to go with the reworked linker script or remove
unneeded sections for now and make it get a linking warning/error when
sections will be used?=20

> Cheers,

BR,
 Oleksii


