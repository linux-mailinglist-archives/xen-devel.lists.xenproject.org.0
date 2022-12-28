Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20EEA6577DB
	for <lists+xen-devel@lfdr.de>; Wed, 28 Dec 2022 15:35:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.469511.728875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pAXVD-0007yt-7I; Wed, 28 Dec 2022 14:33:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 469511.728875; Wed, 28 Dec 2022 14:33:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pAXVD-0007wv-4T; Wed, 28 Dec 2022 14:33:55 +0000
Received: by outflank-mailman (input) for mailman id 469511;
 Wed, 28 Dec 2022 14:33:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vay5=42=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pAXVA-0007wp-Vv
 for xen-devel@lists.xenproject.org; Wed, 28 Dec 2022 14:33:53 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a4eca4de-86bc-11ed-8fd4-01056ac49cbb;
 Wed, 28 Dec 2022 15:33:50 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id bg10so11353722wmb.1
 for <xen-devel@lists.xenproject.org>; Wed, 28 Dec 2022 06:33:49 -0800 (PST)
Received: from 2a02.2378.1075.5dbb.ip.kyivstar.net
 ([2a02:2378:1075:5dbb:3d04:b321:fa08:657])
 by smtp.gmail.com with ESMTPSA id
 q20-20020a1ce914000000b003b4935f04a4sm24526514wmc.5.2022.12.28.06.33.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Dec 2022 06:33:48 -0800 (PST)
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
X-Inumbo-ID: a4eca4de-86bc-11ed-8fd4-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=szJt7ggbHEuy1C56XvPF9RoYPzJTXU+24nrgO9O4SHk=;
        b=LpHnxs9hUJDoVl4VFKB1BH5fQsa9imhMpNL6ZY1ZiT4v+VRAcCuYTL5Q+t1yvq86MJ
         mWnBvPi+w5YLzybWh9xxMF6yAjUTXtA9s37e2SuzlS4IJAmksurgsKFZgb6s7wriKjuN
         cfCTUR7PPo+PBNqRAaKg5dNNikDxUw3RL8Xmy46DYrLc3CdwuRmGBUlPp2Q2kbtY/GD1
         A4ULteCxXMhFs2+qz+tM+J2VrtPgZdK1AMuohkBBooWu15iF4VJFs6upSKhXiwUA0Qkd
         BdY3Zi1iOTJYeZ8EPjOvHkC3X1mwBQxD0YjWfqIZqQnj5JNsRBQF9IWtTaO2B9Tsfky1
         28rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=szJt7ggbHEuy1C56XvPF9RoYPzJTXU+24nrgO9O4SHk=;
        b=Ufg6cZC/3SdmG4azwf+d+YrtLuOujSdEcQZltRom4KvF/TmNKIpBsPCrpw5ccwzi/i
         AhROc+81LqDI007Q2E+SK8D6g6ug2YHNR1BhVH8uK9jDZ6cAUg1P3VfoybzLCcoX3k+L
         K7UCEW0UtLSMEt6r1Mi2i8WRu/n/+neoqOb8pD2VpYb3bv2A0sIu4NrtvJMeM97+LzoZ
         qliKO5VRBmicum/a5U5wmrptQKDdnEbo4eM6Z73jfIbPWL3wWo6lq9hddMsSF8hRVWU6
         rIzUc27vLjyw64ypow+5XownLNcazQItaoTkRnte1qsTuqE7JjV70chjKnjlg41YaKUN
         K+jg==
X-Gm-Message-State: AFqh2kqrcfq/hn+pgaKTUNWuWvpjZkmCLTytnLj9wDqnGqPJCQcQPtfn
	vFKkoiQij5jr7Z0FXqWGvw4=
X-Google-Smtp-Source: AMrXdXtJsLN9Azljcz/5a0qMNftUKnunrqImZHjRypqpDrj3P3u/H1/ulYXT5mVJbjmW+fCK4PFqaA==
X-Received: by 2002:a05:600c:5c8:b0:3d1:4145:b3b with SMTP id p8-20020a05600c05c800b003d141450b3bmr18337186wmd.9.1672238029238;
        Wed, 28 Dec 2022 06:33:49 -0800 (PST)
Message-ID: <fa182d75f8c092ab203beb52bd9124353754dd3d.camel@gmail.com>
Subject: Re: [XEN PATCH v1 1/4] arch/riscv: initial RISC-V support to
 build/run minimal Xen
From: Oleksii <oleksii.kurochko@gmail.com>
To: Alistair Francis <alistair23@gmail.com>
Cc: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org, Andrew
 Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Gianluca Guida <gianluca@rivosinc.com>, Bob
 Eshleman <bobbyeshleman@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>, Anthony
 PERARD <anthony.perard@citrix.com>
Date: Wed, 28 Dec 2022 16:33:46 +0200
In-Reply-To: <CAKmqyKMmW7rRXymMD6dNeLTLbUaSwO5nw=hJTk_xNvsZ3pg7jA@mail.gmail.com>
References: <cover.1671789736.git.oleksii.kurochko@gmail.com>
	 <5d5ec5fbd8787ed8f86bf84a5ac291d07a20b307.1671789736.git.oleksii.kurochko@gmail.com>
	 <3343c927-0f27-e285-5b6e-281c61939bb4@xen.org>
	 <43d726761900ba3d8b4919fc29fe7cb1991ac656.camel@gmail.com>
	 <CAKmqyKMmW7rRXymMD6dNeLTLbUaSwO5nw=hJTk_xNvsZ3pg7jA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1 (3.46.1-1.fc37) 
MIME-Version: 1.0

Alistair,

Thanks for your comments!

On Wed, 2022-12-28 at 14:51 +1000, Alistair Francis wrote:
> On Mon, Dec 26, 2022 at 9:14 PM Oleksii <oleksii.kurochko@gmail.com>
> wrote:
> >=20
> > Hi Julien,
> >=20
> > Thanks for your comments.
> >=20
> > On Fri, 2022-12-23 at 13:50 +0000, Julien Grall wrote:
> > > Hi Oleksii,
> > >=20
> > > + Anthony for the Makefile changes.
> > >=20
> > > On 23/12/2022 11:16, Oleksii Kurochko wrote:
> > > > The patch provides a minimal amount of changes to start
> > > > build and run minimal Xen binary at GitLab CI&CD that will
> > > > allow continuous checking of the build status of RISC-V Xen.
> > > >=20
> > > > RISC-V Xen can be built by the following instructions:
> > > > =C2=A0=C2=A0 $ CONTAINER=3Driscv64 ./automation/scripts/containeriz=
e \
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 make XEN_TARGET_ARCH=3Dr=
iscv64 tiny64_defconfig
> > > > =C2=A0=C2=A0 $ CONTAINER=3Driscv64 ./automation/scripts/containeriz=
e \
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 make XEN_TARGET_ARCH=3Dr=
iscv64 -C xen build
> > > >=20
> > > > RISC-V Xen can be run as:
> > > > =C2=A0=C2=A0 $ qemu-system-riscv64 -M virt -smp 1 -nographic -m 2g =
\
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -kernel xen/xen
> > > >=20
> > > > To run in debug mode should be done the following instructions:
> > > > =C2=A0 $ qemu-system-riscv64 -M virt -smp 1 -nographic -m 2g \
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -kernel xen/xen -s=
 -S
> > > > =C2=A0 # In separate terminal:
> > > > =C2=A0 $ riscv64-buildroot-linux-gnu-gdb
> > > > =C2=A0 $ target remote :1234
> > > > =C2=A0 $ add-symbol-file <xen_src>/xen/xen-syms 0x80200000
> > > > =C2=A0 $ hb *0x80200000
> > > > =C2=A0 $ c # it should stop at instruction j 0x80200000 <start>
> > > >=20
> > > > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > > > ---
> > > > =C2=A0 xen/arch/riscv/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 30 +++++++++++++
> > > > =C2=A0 xen/arch/riscv/arch.mk=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 10 +++++
> > > > =C2=A0 xen/arch/riscv/include/asm/config.h | 26 ++++++++++-
> > > > =C2=A0 xen/arch/riscv/include/asm/types.h=C2=A0 | 11 +++++
> > > > =C2=A0 xen/arch/riscv/riscv64/Makefile=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 2 +-
> > > > =C2=A0 xen/arch/riscv/riscv64/head.S=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 2 +-
> > > > =C2=A0 xen/arch/riscv/xen.lds.S=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 69
> > > > +++++++++++++++++++++++++++++
> > > > =C2=A0 7 files changed, 147 insertions(+), 3 deletions(-)
> > > > =C2=A0 create mode 100644 xen/arch/riscv/include/asm/types.h
> > > > =C2=A0 create mode 100644 xen/arch/riscv/xen.lds.S
> > > >=20
> > > > diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
> > > > index 942e4ffbc1..893dd19ea6 100644
> > > > --- a/xen/arch/riscv/Makefile
> > > > +++ b/xen/arch/riscv/Makefile
> > > > @@ -1,2 +1,32 @@
> > > > +obj-$(CONFIG_RISCV_64) +=3D riscv64/
> > > > +
> > > > +$(TARGET): $(TARGET)-syms
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 $(OBJCOPY) -O binary -S $< $@
> > > > +
> > > > +$(TARGET)-syms: $(objtree)/prelink.o $(obj)/xen.lds
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 $(LD) $(XEN_LDFLAGS) -T $(obj=
)/xen.lds -N $< \
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 $(SYMBOLS_DUMMY_OBJ) -o $(@D)/.$(@F).0
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 $(NM) -pa --format=3Dsysv $(@=
D)/.$(@F).0 \
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | $(objtree)/tools/symbols $(all_symbols) --
> > > > sysv --
> > > > sort >$(@D)/.$(@F).0.S
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 $(MAKE) $(build)=3D$(@D) $(@D=
)/.$(@F).0.o
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 $(LD) $(XEN_LDFLAGS) -T $(obj=
)/xen.lds -N $< \
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 $(@D)/.$(@F).0.o -o $(@D)/.$(@F).1
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 $(NM) -pa --format=3Dsysv $(@=
D)/.$(@F).1 \
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | $(objtree)/tools/symbols $(all_symbols) --
> > > > sysv --
> > > > sort >$(@D)/.$(@F).1.S
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 $(MAKE) $(build)=3D$(@D) $(@D=
)/.$(@F).1.o
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 $(LD) $(XEN_LDFLAGS) -T $(obj=
)/xen.lds -N $<
> > > > $(build_id_linker) \
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 $(@D)/.$(@F).1.o -o $@
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 $(NM) -pa --format=3Dsysv $(@=
D)/$(@F) \
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | $(objtree)/tools/symbols --all-symbols --
> > > > xensyms
> > > > --sysv --sort \
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 >$(@D)/$(@F).map
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rm -f $(@D)/.$(@F).[0-9]*
> > > > +
> > > > +$(obj)/xen.lds: $(src)/xen.lds.S FORCE
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 $(call if_changed_dep,cpp_lds_S)
> > > > +
> > > > +.PHONY: clean
> > > > +clean::
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rm -f $(objtree)/.xen-syms.[0=
-9]*
> > >=20
> > > Any reason to not use the variable clean-files as this is done
> > > for
> > > the
> > > other architectures?
> >=20
> > There is no reason not use the variable clean-files. I missed the
> > vairable clean-files so the patch will be updated to use the
> > variable clean-files instead of the variable clean.
> >=20
> > >=20
> > > > +
> > > > =C2=A0 .PHONY: include
> > > > =C2=A0 include:
> > > > diff --git a/xen/arch/riscv/arch.mk b/xen/arch/riscv/arch.mk
> > > > index ae8fe9dec7..9292b72718 100644
> > > > --- a/xen/arch/riscv/arch.mk
> > > > +++ b/xen/arch/riscv/arch.mk
> > > > @@ -11,3 +11,13 @@ riscv-march-$(CONFIG_RISCV_ISA_C)=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 :=3D
> > > > $(riscv-march-y)c
> > > > =C2=A0 # -mcmodel=3Dmedlow would force Xen into the lower half.
> > > >=20
> > > > =C2=A0 CFLAGS +=3D -march=3D$(riscv-march-y) -mstrict-align -
> > > > mcmodel=3Dmedany
> > > > +
> > > > +# TODO: Drop override and SYMBOLS_DUMMY_OBJ when more
> > > > +# of the build is working
> > > > +override ALL_OBJS-y =3D arch/$(TARGET_ARCH)/built_in.o
> > > > +override ALL_LIBS-y =3D
> > > > +ifneq ($(wildcard $(objtree)/common/symbols-dummy.o),)
> > > > +SYMBOLS_DUMMY_OBJ=3D$(objtree)/common/symbols-dummy.o
> > > > +else
> > > > +SYMBOLS_DUMMY_OBJ=3D
> > > > +endif
> > >=20
> > > Why do you need the ifneq here?
> >=20
> > The only reason for the ifneq here is to skip common
> > stuff from the build of minimal RISC-V Xen binary as it
> > requires pushing from the start a big amount of headers and
> > function
> > stubs which at least will lead to a huge patch and complicate a
> > code
> > review.
> >=20
> > It is possible to remove <common/symbols-dummy.o> from xen-syms
> > target in <xen/arch/riscv/Makefile> but an intention here was
> > to remain processing of xen-syms target similar to the original
> > one and it is the second reason why the ifneq was introduced and
> > added the comment "TODO: Drop ... SYMBOLS_DUMMY_OBJ when more
> > of the build is working".
> >=20
> > >=20
> > > > diff --git a/xen/arch/riscv/include/asm/config.h
> > > > b/xen/arch/riscv/include/asm/config.h
> > > > index e2ae21de61..756607a4a2 100644
> > > > --- a/xen/arch/riscv/include/asm/config.h
> > > > +++ b/xen/arch/riscv/include/asm/config.h
> > > > @@ -28,7 +28,7 @@
> > > >=20
> > > > =C2=A0 /* Linkage for RISCV */
> > > > =C2=A0 #ifdef __ASSEMBLY__
> > > > -#define ALIGN .align 2
> > > > +#define ALIGN .align 4
> > >=20
> > > Can you explain in the commit message why you need to change
> > > this?
> > > But
> > > ideally, this change should be part of a separate one.
> >=20
> > ALIGN was changed to equal the implementation-enforced instruction
> > address alignment (4-bytes), in order to ensure that entry points
> > are
> > properly aligned.
> > If to be honest I haven't verified that and took these changes from
> > the initial patch series pushed by Bobby Eshleman.
> >=20
> > >=20
> > > >=20
> > > > =C2=A0 #define ENTRY(name)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > > > =C2=A0=C2=A0=C2=A0 .globl name;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > > > @@ -36,6 +36,30 @@
> > > > =C2=A0=C2=A0=C2=A0 name:
> > > > =C2=A0 #endif
> > > >=20
> > > > +/*
> > > > + * Definition of XEN_VIRT_START should look like:
> > > > + *=C2=A0=C2=A0 define XEN_VIRT_START _AT(vaddr_t,0x00200000)
> > > > + * It requires including of additional headers which
> > > > + * will increase an amount of files unnecessary for
> > > > + * minimal RISC-V Xen build so set value of
> > > > + * XEN_VIRT_START explicitly.
> > > > + *
> > > > + * TODO: change it to _AT(vaddr_t,0x00200000) when
> > > > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 necessary header will be pu=
shed.
> > >=20
> > > The address here doesn't match the one below. I know this is an
> > > example
> > > but this is fairly confusing.
> >=20
> > This was done only as an example.
> >=20
> > >=20
> > > > + */
> > > > +#define XEN_VIRT_START=C2=A0 0x80200000
> > >=20
> > > I think you at least want to use _AT(unsigned long, ...) here to
> > > make
> > > clear this value should be interpreted as an unsigned value.
> > >=20
> > > You could even define vaddr_t now as you introduce a dummy
> > > types.h
> > > below.
> >=20
> > It makes sense to push the definition of vaddr_t and use
> > <xen/const.h>
> > to be able to use _AT() macros.
> >=20
> > Probably it would be nice to introduce others from types.h from the
> > start, wouldn't it? Or would it be better to leave the patch
> > minimal
> > and introduce only types necessary for vaddr_t?
>=20
> It would be best to add types.h early. I don't really see a reason
> not to
>=20
> >=20
> > >=20
> > > > +/*
> > > > + * PAGE_SIZE is defined in <{asm,xen}/page-*.h> but to
> > > > + * remove unnecessary headers for minimal
> > > > + * build headers it will be better to set PAGE_SIZE
> > > > + * explicitly.
> > >=20
> > > TBH, I think this is a shortcut that is unnecessary and will only
> > > introduce extra churn in the future (for instance, you will need
> > > to
> > > modify the include in xen.lds.S).
> > >=20
> > > But I am not the maintainer, so I will leave that decision to
> > > them
> > > whether this is acceptable.
> >=20
> > I didn't get what you mean by a shortcut here.
> >=20
> > The idea was to introduce PAGE_SIZE in the config.h directly for
> > now
> > to keep build of RISC-V Xen minimal as much as possible otherwise
> > it would be required to push dummy <asm/page-bits.h> to get only
> > one
> > needed definition of PAGE_SIZE to have buildable Xen.
> > Thereby it was decided to define PAGE_SIZE directly in
> > <asm/config.h>
> > and remove it after all definitions from <{asm,xen}/page-*.h> will
> > be
> > needed.
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
> > >=20
> > > > diff --git a/xen/arch/riscv/riscv64/head.S
> > > > b/xen/arch/riscv/riscv64/head.S
> > > > index 0dbc27ba75..0330b29c01 100644
> > > > --- a/xen/arch/riscv/riscv64/head.S
> > > > +++ b/xen/arch/riscv/riscv64/head.S
> > > > @@ -1,6 +1,6 @@
> > > > =C2=A0 #include <asm/config.h>
> > > >=20
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
> > >=20
> > > >=20
> > > > =C2=A0 ENTRY(start)
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 j=C2=A0 star=
t
> > > > diff --git a/xen/arch/riscv/xen.lds.S
> > > > b/xen/arch/riscv/xen.lds.S
> > > > new file mode 100644
> > > > index 0000000000..60628b3856
> > > > --- /dev/null
> > > > +++ b/xen/arch/riscv/xen.lds.S
> > > > @@ -0,0 +1,69 @@
> > > > +#include <xen/xen.lds.h>
> > > > +
> > > > +#undef ENTRY
> > > > +#undef ALIGN
> > > > +
> > > > +OUTPUT_ARCH(riscv)
> > > > +ENTRY(start)
> > > > +
> > > > +PHDRS
> > > > +{
> > > > +=C2=A0 text PT_LOAD ;
> > > > +#if defined(BUILD_ID)
> > > > +=C2=A0 note PT_NOTE ;
> > > > +#endif
> > > > +}
> > > > +
> > > > +SECTIONS
> > > > +{
> > > > +=C2=A0 . =3D XEN_VIRT_START;
> > > > +=C2=A0 _start =3D .;
> > > > +=C2=A0 .text : {
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 _stext =3D .;
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *(.text.header)
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *(.text)
> > >=20
> > > You are missing some sections here such as .text.cold,
> > > .text.unlikely...
> > >=20
> > > I understand they are probably not used yet. But it will avoid
> > > any
> > > nasty
> > > surprise if they are forgotten.
> >=20
> > They were skipped because they aren't use for now. Will add it in
> > the next version of the patch.
> >=20
> > >=20
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *(.gnu.warning)
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 . =3D ALIGN(POINTER_ALIGN);
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 _etext =3D .;
> > > > +=C2=A0 } :text
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 . =3D ALIGN(PAGE_SIZE);
> > > > +=C2=A0 .rodata : {
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 _srodata =3D .;
> > >=20
> > > You introduce _srodata but I can't find the matching _erodata.
> >=20
> > My fault. Thanks. Will add it in the the next version of the patch.
> >=20
> > >=20
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *(.rodata)
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *(.rodata.*)
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *(.data.rel.ro)
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *(.data.rel.ro.*)
> > > > +=C2=A0 } :text
> > > > +
> > > > +#if defined(BUILD_ID)
> > > > +=C2=A0 . =3D ALIGN(4);
> > > > +=C2=A0 .note.gnu.build-id : {
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __note_gnu_build_id_start =3D=
 .;
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *(.note.gnu.build-id)
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __note_gnu_build_id_end =3D .=
;
> > > > +=C2=A0 } :note :text
> > > > +#endif
> > > > +
> > > > +=C2=A0 . =3D ALIGN(PAGE_SIZE);
> > > > +=C2=A0 .data : { /* Data */
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *(.data .data.*)
> > >=20
> > > It would be better if you introduce .data.read_mostly right now
> > > separately.
> > >=20
> > > You also want *.data.page_aligned in .data.
> > >=20
> > > Lastly you are missing CONSTRUCTORS
> >=20
> > I will add offred sections and CONSTUCTORS in the next version of
> > the patch
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
> > with unneeded stuff for now.
>=20
> I think we should aim to get the linker file sorted right from the
> start. Otherwise someone is going to hit a nasty bug at some point in
> the future.

Probably I am not correct here but if I understand correcly the
sections that are mentioned in riscv/xen.lds.S now they are "default"
sections.

All other sections such as *(.bss.percpu.*) *(.bss.*algined) etc are
sections defined by user using __section directive or .section.
Thereby it will be hard to get a nasty bug because if a section is
needed and isn't defined then linker will produce an error about unkown
section.

Am i wrong?

Best regards,
 Oleksii

