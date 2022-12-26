Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1636865621C
	for <lists+xen-devel@lfdr.de>; Mon, 26 Dec 2022 12:15:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.469275.728629 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p9lQq-0007GR-GE; Mon, 26 Dec 2022 11:14:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 469275.728629; Mon, 26 Dec 2022 11:14:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p9lQq-0007Dt-Da; Mon, 26 Dec 2022 11:14:12 +0000
Received: by outflank-mailman (input) for mailman id 469275;
 Mon, 26 Dec 2022 11:14:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T6Sp=4Y=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1p9lQo-0007Dn-V1
 for xen-devel@lists.xenproject.org; Mon, 26 Dec 2022 11:14:11 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6a1ef314-850e-11ed-8fd4-01056ac49cbb;
 Mon, 26 Dec 2022 12:14:09 +0100 (CET)
Received: by mail-lf1-x136.google.com with SMTP id 1so15588536lfz.4
 for <xen-devel@lists.xenproject.org>; Mon, 26 Dec 2022 03:14:07 -0800 (PST)
Received: from 2a02.2378.104b.7439.ip.kyivstar.net
 ([2a02:2378:104b:7439:bef4:5f:98f5:beea])
 by smtp.gmail.com with ESMTPSA id
 y26-20020a0565123f1a00b00494603953b6sm1764562lfa.6.2022.12.26.03.14.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Dec 2022 03:14:06 -0800 (PST)
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
X-Inumbo-ID: 6a1ef314-850e-11ed-8fd4-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=z28nug8gZ0u7AA8p92zZ9yeGRdKVMNwxMy6m1c5r7Qg=;
        b=CEgcyEymsl/XfQUHhuG1AD//oHxvGezElXDc7JJ8d6HyzGoT7H6L2vA+RXGqwVTapU
         ZdY24WQo5evWPXmcBcCzyg9bYIhrdP/qEdzTpInJ/rfmImdbQ9r11k1wjxpK6dG8T38A
         jVffNLDn7rWzXa7KviLBbBo920ih16Qsko4B4r0BKBdUn73WDdhicB66i0+XonxxqU1+
         8aCbuBvqIsr+/kxi5pbfaUDK5BAuyv4CyLxiF+YG8Hf+/Pmr6yRAXLoORHgcdzhGdbDl
         vaKLAiEmocKY+ujXrzH7Qv80FXdQU9/TcMVsu2JelKFeVUZK60gk7BdXfO8SHFx9BBNn
         AxVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z28nug8gZ0u7AA8p92zZ9yeGRdKVMNwxMy6m1c5r7Qg=;
        b=nK9ufCUn9UjXBSroX+oG4BN8C74CjyIBohWNzHJ2u/y8SDVg5IYRtkvWjL0OJh8K7w
         WBjCjOZDvO5Kc1cmiIEc58wU3Py79y2zPCDg/l2X2D+1w3FfCqAY28yqrmSVtTNQlVBD
         I2I0W15yYSojN518+Ym65GPmiLi3C4EL+pByLbFOcBz5AMGfonavfEKOaBHYYhf0pZkC
         XLNLk7t/JGqoonrgiG84SahCT/unKStBpllg8Y+86DENSKxMYjgy+K/fC3VlW3A6a508
         jeUr/9vBe6kgbmhH4w1kKNL1vAthfvcnvpVBYPA825MFNZfswxhxODj/JOT4CQl5uAqQ
         t+eg==
X-Gm-Message-State: AFqh2kpRAUj5G4HwG1uvZKhLWFyDrEEtaegW1KFofKWiWuT8CyHrdlBx
	BzbhCkpQ3EYnOTuc6r1zdSg=
X-Google-Smtp-Source: AMrXdXsGHXQHDLWOUB5k8CeDSMxNXrE5Vx05pwdoJiVAtvBdjDI2xQCECD23EOJ0vm0Tt8f+wFbT1g==
X-Received: by 2002:ac2:4898:0:b0:4b3:d6e1:26bb with SMTP id x24-20020ac24898000000b004b3d6e126bbmr4744048lfc.29.1672053246856;
        Mon, 26 Dec 2022 03:14:06 -0800 (PST)
Message-ID: <43d726761900ba3d8b4919fc29fe7cb1991ac656.camel@gmail.com>
Subject: Re: [XEN PATCH v1 1/4] arch/riscv: initial RISC-V support to
 build/run minimal Xen
From: Oleksii <oleksii.kurochko@gmail.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Gianluca Guida <gianluca@rivosinc.com>, Bob
 Eshleman <bobbyeshleman@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>,  Connor Davis <connojdavis@gmail.com>, Anthony
 PERARD <anthony.perard@citrix.com>
Date: Mon, 26 Dec 2022 13:14:04 +0200
In-Reply-To: <3343c927-0f27-e285-5b6e-281c61939bb4@xen.org>
References: <cover.1671789736.git.oleksii.kurochko@gmail.com>
	 <5d5ec5fbd8787ed8f86bf84a5ac291d07a20b307.1671789736.git.oleksii.kurochko@gmail.com>
	 <3343c927-0f27-e285-5b6e-281c61939bb4@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1 (3.46.1-1.fc37) 
MIME-Version: 1.0

Hi Julien,

Thanks for your comments.

On Fri, 2022-12-23 at 13:50 +0000, Julien Grall wrote:
> Hi Oleksii,
>=20
> + Anthony for the Makefile changes.
>=20
> On 23/12/2022 11:16, Oleksii Kurochko wrote:
> > The patch provides a minimal amount of changes to start
> > build and run minimal Xen binary at GitLab CI&CD that will
> > allow continuous checking of the build status of RISC-V Xen.
> >=20
> > RISC-V Xen can be built by the following instructions:
> > =C2=A0=C2=A0 $ CONTAINER=3Driscv64 ./automation/scripts/containerize \
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 make XEN_TARGET_ARCH=3Driscv=
64 tiny64_defconfig
> > =C2=A0=C2=A0 $ CONTAINER=3Driscv64 ./automation/scripts/containerize \
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 make XEN_TARGET_ARCH=3Driscv=
64 -C xen build
> >=20
> > RISC-V Xen can be run as:
> > =C2=A0=C2=A0 $ qemu-system-riscv64 -M virt -smp 1 -nographic -m 2g \
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -kernel xen/xen
> >=20
> > To run in debug mode should be done the following instructions:
> > =C2=A0 $ qemu-system-riscv64 -M virt -smp 1 -nographic -m 2g \
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -kernel xen/xen -s -S
> > =C2=A0 # In separate terminal:
> > =C2=A0 $ riscv64-buildroot-linux-gnu-gdb
> > =C2=A0 $ target remote :1234
> > =C2=A0 $ add-symbol-file <xen_src>/xen/xen-syms 0x80200000
> > =C2=A0 $ hb *0x80200000
> > =C2=A0 $ c # it should stop at instruction j 0x80200000 <start>
> >=20
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > ---
> > =C2=A0 xen/arch/riscv/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 30 +++++++++++++
> > =C2=A0 xen/arch/riscv/arch.mk=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 10 +++++
> > =C2=A0 xen/arch/riscv/include/asm/config.h | 26 ++++++++++-
> > =C2=A0 xen/arch/riscv/include/asm/types.h=C2=A0 | 11 +++++
> > =C2=A0 xen/arch/riscv/riscv64/Makefile=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 =
2 +-
> > =C2=A0 xen/arch/riscv/riscv64/head.S=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 2 +-
> > =C2=A0 xen/arch/riscv/xen.lds.S=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 69
> > +++++++++++++++++++++++++++++
> > =C2=A0 7 files changed, 147 insertions(+), 3 deletions(-)
> > =C2=A0 create mode 100644 xen/arch/riscv/include/asm/types.h
> > =C2=A0 create mode 100644 xen/arch/riscv/xen.lds.S
> >=20
> > diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
> > index 942e4ffbc1..893dd19ea6 100644
> > --- a/xen/arch/riscv/Makefile
> > +++ b/xen/arch/riscv/Makefile
> > @@ -1,2 +1,32 @@
> > +obj-$(CONFIG_RISCV_64) +=3D riscv64/
> > +
> > +$(TARGET): $(TARGET)-syms
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0$(OBJCOPY) -O binary -S $< $=
@
> > +
> > +$(TARGET)-syms: $(objtree)/prelink.o $(obj)/xen.lds
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0$(LD) $(XEN_LDFLAGS) -T $(ob=
j)/xen.lds -N $< \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0$(SYMBOLS_DUMMY_OBJ) -o $(@D)/.$(@F).0
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0$(NM) -pa --format=3Dsysv $(=
@D)/.$(@F).0 \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0| $(objtree)/tools/symbols $(all_symbols) --sysv --
> > sort >$(@D)/.$(@F).0.S
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0$(MAKE) $(build)=3D$(@D) $(@=
D)/.$(@F).0.o
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0$(LD) $(XEN_LDFLAGS) -T $(ob=
j)/xen.lds -N $< \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0$(@D)/.$(@F).0.o -o $(@D)/.$(@F).1
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0$(NM) -pa --format=3Dsysv $(=
@D)/.$(@F).1 \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0| $(objtree)/tools/symbols $(all_symbols) --sysv --
> > sort >$(@D)/.$(@F).1.S
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0$(MAKE) $(build)=3D$(@D) $(@=
D)/.$(@F).1.o
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0$(LD) $(XEN_LDFLAGS) -T $(ob=
j)/xen.lds -N $<
> > $(build_id_linker) \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0$(@D)/.$(@F).1.o -o $@
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0$(NM) -pa --format=3Dsysv $(=
@D)/$(@F) \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0| $(objtree)/tools/symbols --all-symbols --xensyms
> > --sysv --sort \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0>$(@D)/$(@F).map
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0rm -f $(@D)/.$(@F).[0-9]*
> > +
> > +$(obj)/xen.lds: $(src)/xen.lds.S FORCE
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 $(call if_changed_dep,cpp_lds_S)
> > +
> > +.PHONY: clean
> > +clean::
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0rm -f $(objtree)/.xen-syms.[=
0-9]*
>=20
> Any reason to not use the variable clean-files as this is done for
> the=20
> other architectures?

There is no reason not use the variable clean-files. I missed the
vairable clean-files so the patch will be updated to use the
variable clean-files instead of the variable clean.

>=20
> > +
> > =C2=A0 .PHONY: include
> > =C2=A0 include:
> > diff --git a/xen/arch/riscv/arch.mk b/xen/arch/riscv/arch.mk
> > index ae8fe9dec7..9292b72718 100644
> > --- a/xen/arch/riscv/arch.mk
> > +++ b/xen/arch/riscv/arch.mk
> > @@ -11,3 +11,13 @@ riscv-march-$(CONFIG_RISCV_ISA_C)=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 :=3D
> > $(riscv-march-y)c
> > =C2=A0 # -mcmodel=3Dmedlow would force Xen into the lower half.
> > =C2=A0=20
> > =C2=A0 CFLAGS +=3D -march=3D$(riscv-march-y) -mstrict-align -mcmodel=3D=
medany
> > +
> > +# TODO: Drop override and SYMBOLS_DUMMY_OBJ when more
> > +# of the build is working
> > +override ALL_OBJS-y =3D arch/$(TARGET_ARCH)/built_in.o
> > +override ALL_LIBS-y =3D
> > +ifneq ($(wildcard $(objtree)/common/symbols-dummy.o),)
> > +SYMBOLS_DUMMY_OBJ=3D$(objtree)/common/symbols-dummy.o
> > +else
> > +SYMBOLS_DUMMY_OBJ=3D
> > +endif
>=20
> Why do you need the ifneq here?

The only reason for the ifneq here is to skip common
stuff from the build of minimal RISC-V Xen binary as it
requires pushing from the start a big amount of headers and function
stubs which at least will lead to a huge patch and complicate a code
review.

It is possible to remove <common/symbols-dummy.o> from xen-syms
target in <xen/arch/riscv/Makefile> but an intention here was
to remain processing of xen-syms target similar to the original
one and it is the second reason why the ifneq was introduced and
added the comment "TODO: Drop ... SYMBOLS_DUMMY_OBJ when more
of the build is working".

>=20
> > diff --git a/xen/arch/riscv/include/asm/config.h
> > b/xen/arch/riscv/include/asm/config.h
> > index e2ae21de61..756607a4a2 100644
> > --- a/xen/arch/riscv/include/asm/config.h
> > +++ b/xen/arch/riscv/include/asm/config.h
> > @@ -28,7 +28,7 @@
> > =C2=A0=20
> > =C2=A0 /* Linkage for RISCV */
> > =C2=A0 #ifdef __ASSEMBLY__
> > -#define ALIGN .align 2
> > +#define ALIGN .align 4
>=20
> Can you explain in the commit message why you need to change this?
> But=20
> ideally, this change should be part of a separate one.

ALIGN was changed to equal the implementation-enforced instruction
address alignment (4-bytes), in order to ensure that entry points are
properly aligned.
If to be honest I haven't verified that and took these changes from
the initial patch series pushed by Bobby Eshleman.

>=20
> > =C2=A0=20
> > =C2=A0 #define ENTRY(name)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > =C2=A0=C2=A0=C2=A0 .globl name;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > @@ -36,6 +36,30 @@
> > =C2=A0=C2=A0=C2=A0 name:
> > =C2=A0 #endif
> > =C2=A0=20
> > +/*
> > + * Definition of XEN_VIRT_START should look like:
> > + *=C2=A0=C2=A0 define XEN_VIRT_START _AT(vaddr_t,0x00200000)
> > + * It requires including of additional headers which
> > + * will increase an amount of files unnecessary for
> > + * minimal RISC-V Xen build so set value of
> > + * XEN_VIRT_START explicitly.
> > + *
> > + * TODO: change it to _AT(vaddr_t,0x00200000) when
> > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 necessary header will be pushed=
.
>=20
> The address here doesn't match the one below. I know this is an
> example=20
> but this is fairly confusing.

This was done only as an example.

>=20
> > + */
> > +#define XEN_VIRT_START=C2=A0 0x80200000
>=20
> I think you at least want to use _AT(unsigned long, ...) here to make
> clear this value should be interpreted as an unsigned value.
>=20
> You could even define vaddr_t now as you introduce a dummy types.h
> below.

It makes sense to push the definition of vaddr_t and use <xen/const.h>
to be able to use _AT() macros.

Probably it would be nice to introduce others from types.h from the
start, wouldn't it? Or would it be better to leave the patch minimal
and introduce only types necessary for vaddr_t?

>=20
> > +/*
> > + * PAGE_SIZE is defined in <{asm,xen}/page-*.h> but to
> > + * remove unnecessary headers for minimal
> > + * build headers it will be better to set PAGE_SIZE
> > + * explicitly.
>=20
> TBH, I think this is a shortcut that is unnecessary and will only=20
> introduce extra churn in the future (for instance, you will need to=20
> modify the include in xen.lds.S).
>=20
> But I am not the maintainer, so I will leave that decision to them=20
> whether this is acceptable.

I didn't get what you mean by a shortcut here.

The idea was to introduce PAGE_SIZE in the config.h directly for now
to keep build of RISC-V Xen minimal as much as possible otherwise
it would be required to push dummy <asm/page-bits.h> to get only one
needed definition of PAGE_SIZE to have buildable Xen.
Thereby it was decided to define PAGE_SIZE directly in <asm/config.h>
and remove it after all definitions from <{asm,xen}/page-*.h> will be
needed.

>=20
> > + *
> > + * TODO: remove it when <asm/page-*.h> will be needed
> > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 defintion of PAGE_SIZE should b=
e remove from
>=20
> s/defintion/definition/

Thanks for finding the typo. Will update it in the next version of
the patch.

>=20
> > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 this header.
> > + */
> > +#define PAGE_SIZE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4096 > +
> > =C2=A0 #endif /* __RISCV_CONFIG_H__ */
> > =C2=A0 /*
> > =C2=A0=C2=A0 * Local variables:
> > diff --git a/xen/arch/riscv/include/asm/types.h
> > b/xen/arch/riscv/include/asm/types.h
> > new file mode 100644
> > index 0000000000..afbca6b15c
> > --- /dev/null
> > +++ b/xen/arch/riscv/include/asm/types.h
> > @@ -0,0 +1,11 @@
> > +#ifndef __TYPES_H__
> > +#define __TYPES_H__
> > +
> > +/*
> > + *
> > + * asm/types.h is required for xen-syms.S file which
> > + * is produced by tools/symbols.
> > + *
> > + */
> > +
> > +#endif
> > diff --git a/xen/arch/riscv/riscv64/Makefile
> > b/xen/arch/riscv/riscv64/Makefile
> > index 15a4a65f66..3340058c08 100644
> > --- a/xen/arch/riscv/riscv64/Makefile
> > +++ b/xen/arch/riscv/riscv64/Makefile
> > @@ -1 +1 @@
> > -extra-y +=3D head.o
> > +obj-y +=3D head.o
>=20
> This changes want to be explained. So does...

RISC-V 64 would be supported now and minimal build is built
now only obj-y stuff.

>=20
> > diff --git a/xen/arch/riscv/riscv64/head.S
> > b/xen/arch/riscv/riscv64/head.S
> > index 0dbc27ba75..0330b29c01 100644
> > --- a/xen/arch/riscv/riscv64/head.S
> > +++ b/xen/arch/riscv/riscv64/head.S
> > @@ -1,6 +1,6 @@
> > =C2=A0 #include <asm/config.h>
> > =C2=A0=20
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .text
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .section .text.header, "ax"=
, %progbits
>=20
> ... AFAICT this is to match the recent change in the build system.

I am not sure that I get you here but it was done to make 'start'
instructions to be the first instructions that will be executed and
to make 'start' symbol to be the first in xen-syms.map file otherwise
gdb shows that Xen starts from the wrong instructions, fails to find
correct source file and goes crazy.

>=20
> > =C2=A0=20
> > =C2=A0 ENTRY(start)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 j=C2=A0 start
> > diff --git a/xen/arch/riscv/xen.lds.S b/xen/arch/riscv/xen.lds.S
> > new file mode 100644
> > index 0000000000..60628b3856
> > --- /dev/null
> > +++ b/xen/arch/riscv/xen.lds.S
> > @@ -0,0 +1,69 @@
> > +#include <xen/xen.lds.h>
> > +
> > +#undef ENTRY
> > +#undef ALIGN
> > +
> > +OUTPUT_ARCH(riscv)
> > +ENTRY(start)
> > +
> > +PHDRS
> > +{
> > +=C2=A0 text PT_LOAD ;
> > +#if defined(BUILD_ID)
> > +=C2=A0 note PT_NOTE ;
> > +#endif
> > +}
> > +
> > +SECTIONS
> > +{
> > +=C2=A0 . =3D XEN_VIRT_START;
> > +=C2=A0 _start =3D .;
> > +=C2=A0 .text : {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 _stext =3D .;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *(.text.header)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *(.text)
>=20
> You are missing some sections here such as .text.cold,
> .text.unlikely...
>=20
> I understand they are probably not used yet. But it will avoid any
> nasty=20
> surprise if they are forgotten.

They were skipped because they aren't use for now. Will add it in
the next version of the patch.

>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *(.gnu.warning)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 . =3D ALIGN(POINTER_ALIGN);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 _etext =3D .;
> > +=C2=A0 } :text
> > +
> > +=C2=A0=C2=A0=C2=A0 . =3D ALIGN(PAGE_SIZE);
> > +=C2=A0 .rodata : {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 _srodata =3D .;
>=20
> You introduce _srodata but I can't find the matching _erodata.

My fault. Thanks. Will add it in the the next version of the patch.

>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *(.rodata)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *(.rodata.*)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *(.data.rel.ro)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *(.data.rel.ro.*)
> > +=C2=A0 } :text
> > +
> > +#if defined(BUILD_ID)
> > +=C2=A0 . =3D ALIGN(4);
> > +=C2=A0 .note.gnu.build-id : {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __note_gnu_build_id_start =3D .;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *(.note.gnu.build-id)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __note_gnu_build_id_end =3D .;
> > +=C2=A0 } :note :text
> > +#endif
> > +
> > +=C2=A0 . =3D ALIGN(PAGE_SIZE);
> > +=C2=A0 .data : { /* Data */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *(.data .data.*)
>=20
> It would be better if you introduce .data.read_mostly right now
> separately.
>=20
> You also want *.data.page_aligned in .data.
>=20
> Lastly you are missing CONSTRUCTORS

I will add offred sections and CONSTUCTORS in the next version of
the patch

>=20
> > +=C2=A0 } :text
> > +
>=20
> I am assuming you are going to add .init.* afterwards?
>=20
> > +=C2=A0 . =3D ALIGN(PAGE_SIZE);
> > +=C2=A0 .bss : {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __bss_start =3D .;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *(.bss .bss.*)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 . =3D ALIGN(POINTER_ALIGN);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __bss_end =3D .;
>=20
> Same as .data, I would recommend to properly populate it.

Do you mean to add .bss.stack_aligned, .bss.page_aligned, .bss.percpu*?
One of the reasons they were skipped is they aren't used now and one
more reason if to believe xen.lds.S file from ARM
.bss.percpu.read_mostly should be aligned by SMP_CACHE_BYTES which
requires dummy <asm/cache.h> (or not ?) which will increase the patch
with unneeded stuff for now.=20

>=20
> Cheers,
>=20

Best regards,
 Oleksii

