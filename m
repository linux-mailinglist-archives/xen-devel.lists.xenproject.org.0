Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C46D79231E
	for <lists+xen-devel@lfdr.de>; Tue,  5 Sep 2023 15:37:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.595711.929303 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdWF2-0000EX-LY; Tue, 05 Sep 2023 13:37:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 595711.929303; Tue, 05 Sep 2023 13:37:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdWF2-0000Bp-IR; Tue, 05 Sep 2023 13:37:16 +0000
Received: by outflank-mailman (input) for mailman id 595711;
 Tue, 05 Sep 2023 13:37:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uOuH=EV=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qdWF1-0000Bi-GP
 for xen-devel@lists.xenproject.org; Tue, 05 Sep 2023 13:37:15 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 52242199-4bf1-11ee-9b0d-b553b5be7939;
 Tue, 05 Sep 2023 15:37:13 +0200 (CEST)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-500cfb168c6so4177091e87.2
 for <xen-devel@lists.xenproject.org>; Tue, 05 Sep 2023 06:37:13 -0700 (PDT)
Received: from [192.168.201.133] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 i24-20020ac25238000000b004fb78959218sm2388003lfl.200.2023.09.05.06.37.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Sep 2023 06:37:11 -0700 (PDT)
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
X-Inumbo-ID: 52242199-4bf1-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693921033; x=1694525833; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=emeEI0p6W+EweINIUmLiMj/8DhyvM4qSHxn8c66icZY=;
        b=QE44nHmO9Vn0/r10ZaW5adrC2d7lCLtN5UW6MjuSn7z32xwy2ULa1BBdNPzyd2jAGD
         FK/jjO22keUvl5gaIpFhcagOmUOs0VCPp42yD/u2KJSCtp7ZNCyf65WTmMhU23HjGuZH
         1lv5vCFfyfRs1D8D+gKX6JOXaqdF+QVcaLfITynLNJQP1NaMTQfJ2bn0pQ4TXJ8o0EFe
         jBNddt6sPmnR3Vy+sj5rXJYAMtw3MGS6q+LBKYCd4BuAzGFO+tYFyd7eBgCtn7beKmhk
         O57N1oMj3BiOKMVpYgp/w7wjzVjTOMnXVPnuoWJp8RXVc7BdHuazQbMKSJ9HuMfy58hA
         ZdWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693921033; x=1694525833;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=emeEI0p6W+EweINIUmLiMj/8DhyvM4qSHxn8c66icZY=;
        b=Q1sbU+0+DnDYlsEf71RAJQ29jTMUlW8UpZND/yRn+EzSVxsrC2Xxnz6p4Az/h/pG5w
         n0r1xXoKbOMMqQIqfHiz1q1HDg33nKAYDWTfniOrkErE7QVsyj/4LdXG6N8Wc1YaQUpU
         bvIFUKC0BIL9R7FihC5M15u+4ZnNICfTCh/6gjhDndbSG96xOcg16/ttd+bGmEqBrJJ5
         SB/UXHha+rDjZ9GyCp5PQiHJHq6SUSYjr9C9QmH8XuQMNmMFD4bOUyGYo9Ls3ulnr3QI
         x3v+kj93lklNNcGP0sHu1r/OjoOYwiXF0EBGExRTKsScwTXi03lHCHQWuqsOiCcgTVNI
         EDUw==
X-Gm-Message-State: AOJu0Yz2XnX9mybc6a5N+dPYTPsZ89fMEowGCzWXEEqaKsVzBMg2GKaj
	llJL/KE08V8wqX00GV15j3o=
X-Google-Smtp-Source: AGHT+IH/Q9OGygzs4XPKMK3iVpopeXRS/hTohw8S1+qM48kZetpWdhhdY1BssflcBCK3L+BxLaz2Ng==
X-Received: by 2002:a05:6512:3ca8:b0:500:b5db:990b with SMTP id h40-20020a0565123ca800b00500b5db990bmr10919641lfv.47.1693921032414;
        Tue, 05 Sep 2023 06:37:12 -0700 (PDT)
Message-ID: <e2b6ee2ecae5512a23a3e33bba0083b90a1c8831.camel@gmail.com>
Subject: Re: [PATCH v4 1/2] xen: asm-generic support
From: Oleksii <oleksii.kurochko@gmail.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
 <jbeulich@suse.com>,  Andrew Cooper <andrew.cooper3@citrix.com>, George
 Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Shawn Anastasio
 <sanastasio@raptorengineering.com>, Bob Eshleman <bobbyeshleman@gmail.com>,
  Alistair Francis <alistair.francis@wdc.com>, Connor Davis
 <connojdavis@gmail.com>, Roger Pau =?ISO-8859-1?Q?Monn=E9?=
 <roger.pau@citrix.com>
Date: Tue, 05 Sep 2023 16:37:11 +0300
In-Reply-To: <3DCD5649-C172-4400-AA75-A28F5C0A106D@arm.com>
References: <cover.1693583721.git.oleksii.kurochko@gmail.com>
	 <96b2a4ff48578b7b105581529d2aa6bebd8ad622.1693583721.git.oleksii.kurochko@gmail.com>
	 <3DCD5649-C172-4400-AA75-A28F5C0A106D@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

Hi Bertrand,

On Mon, 2023-09-04 at 13:39 +0000, Bertrand Marquis wrote:
> Hi Oleksii,
>=20
> > On 1 Sep 2023, at 18:02, Oleksii Kurochko
> > <oleksii.kurochko@gmail.com> wrote:
> >=20
> > Some headers are shared between individual architectures or are
> > empty.
> > To avoid duplication of these headers, asm-generic is introduced.
> >=20
> > With the following patch, an architecture uses generic headers
> > mentioned in the file arch/$(ARCH)/include/asm/Kbuild.
>=20
> Kbuild refers to "Kernel build" I guess.
> I am ok to keep that name to keep things simpler when compared to
> Linux scripts but it would be good to mention that in the commit
> message for future reference.
Sure. I'll add that Kbuild refers to "Kernel build"
>=20
> >=20
> > To use a generic header is needed to add to
> > arch/$(ARCH)/include/asm/Kbuild :
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 generic-y +=3D <name-of-header-fil=
e.h>
> >=20
> > For each mentioned header in arch/$(ARCH)/include/asm/Kbuild,
> > kbuild will generate the necessary wrapper in
> > arch/$(ARCH)/include/generated/asm.
> >=20
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > ---
> > Changes in V4:
> > - introduce asm-generic support
> > - update commit message
> > ---
> > Changes in V3:
> > - Rename stubs dir to asm-generic
> > ---
> > Changes in V2:
> > - Nothing changed.
> > ---
> > xen/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 10 =
+++++++++-
> > xen/arch/arm/include/asm/Kbuild=C2=A0=C2=A0 |=C2=A0 1 +
> > xen/arch/ppc/include/asm/Kbuild=C2=A0=C2=A0 |=C2=A0 1 +
> > xen/arch/riscv/include/asm/Kbuild |=C2=A0 1 +
> > xen/arch/x86/include/asm/Kbuild=C2=A0=C2=A0 |=C2=A0 1 +
> > xen/scripts/Makefile.asm-generic=C2=A0 | 23 +++++++++++++++++++++++
> > 6 files changed, 36 insertions(+), 1 deletion(-)
> > create mode 100644 xen/arch/arm/include/asm/Kbuild
> > create mode 100644 xen/arch/ppc/include/asm/Kbuild
> > create mode 100644 xen/arch/riscv/include/asm/Kbuild
> > create mode 100644 xen/arch/x86/include/asm/Kbuild
> > create mode 100644 xen/scripts/Makefile.asm-generic
> >=20
> > diff --git a/xen/Makefile b/xen/Makefile
> > index f57e5a596c..698d6ddeb8 100644
> > --- a/xen/Makefile
> > +++ b/xen/Makefile
> > @@ -438,6 +438,7 @@ ifdef building_out_of_srctree
> > endif
> > CFLAGS +=3D -I$(srctree)/include
> > CFLAGS +=3D -I$(srctree)/arch/$(SRCARCH)/include
> > +CFLAGS +=3D -I$(srctree)/arch/$(SRCARCH)/include/generated
>=20
> Why are we generating files in the source tree ?=20
> Shouldn't we keep it unmodified ?
I think you are right.
I got myself confused because I do not use out-of-tree compilation so
for me it looked like $(srctree).

It would be better to use $(objtree) instead.
>=20
> >=20
> > # Note that link order matters!
> > ALL_OBJS-y=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :=3D common/built_in.o
> > @@ -580,6 +581,7 @@ _clean:
> > rm -f $(TARGET).efi $(TARGET).efi.map $(TARGET).efi.elf
> > $(TARGET).efi.stripped
> > rm -f asm-offsets.s arch/*/include/asm/asm-offsets.h
> > rm -f .banner .allconfig.tmp include/xen/compile.h
> > + rm -rf arch/*/include/generated
> >=20
>=20
> You must use the same as for CFLAGS here so $(srctree) would be
> needed.
> (or something else depending on the fix for previous comment)
Thanks. I'll change to the value mentioned in CFLAGS.

>=20
> > .PHONY: _distclean
> > _distclean: clean
> > @@ -589,7 +591,7 @@ $(TARGET).gz: $(TARGET)
> > gzip -n -f -9 < $< > $@.new
> > mv $@.new $@
> >=20
> > -$(TARGET): outputmakefile FORCE
> > +$(TARGET): outputmakefile asm-generic FORCE
> > $(Q)$(MAKE) $(build)=3Dtools
> > $(Q)$(MAKE) $(build)=3D. include/xen/compile.h
> > $(Q)$(MAKE) $(build)=3Dinclude all
> > @@ -667,6 +669,12 @@ endif # need-sub-make
> > PHONY +=3D FORCE
> > FORCE:
> >=20
> > +# Support for using generic headers in asm-generic
> > +PHONY +=3D asm-generic
> > +asm-generic:
> > + $(Q)$(MAKE) -f $(srctree)/scripts/Makefile.asm-generic \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 obj=
=3Darch/$(SRCARCH)/include/generated/asm
> > +
> > # Declare the contents of the PHONY variable as phony.=C2=A0 We keep
> > that
> > # information in a variable so we can use it in if_changed and
> > friends.
> > .PHONY: $(PHONY)
> > diff --git a/xen/arch/arm/include/asm/Kbuild
> > b/xen/arch/arm/include/asm/Kbuild
> > new file mode 100644
> > index 0000000000..a4e40e534e
> > --- /dev/null
> > +++ b/xen/arch/arm/include/asm/Kbuild
> > @@ -0,0 +1 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > diff --git a/xen/arch/ppc/include/asm/Kbuild
> > b/xen/arch/ppc/include/asm/Kbuild
> > new file mode 100644
> > index 0000000000..a4e40e534e
> > --- /dev/null
> > +++ b/xen/arch/ppc/include/asm/Kbuild
> > @@ -0,0 +1 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > diff --git a/xen/arch/riscv/include/asm/Kbuild
> > b/xen/arch/riscv/include/asm/Kbuild
> > new file mode 100644
> > index 0000000000..a4e40e534e
> > --- /dev/null
> > +++ b/xen/arch/riscv/include/asm/Kbuild
> > @@ -0,0 +1 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > diff --git a/xen/arch/x86/include/asm/Kbuild
> > b/xen/arch/x86/include/asm/Kbuild
> > new file mode 100644
> > index 0000000000..a4e40e534e
> > --- /dev/null
> > +++ b/xen/arch/x86/include/asm/Kbuild
> > @@ -0,0 +1 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > diff --git a/xen/scripts/Makefile.asm-generic
> > b/xen/scripts/Makefile.asm-generic
> > new file mode 100644
> > index 0000000000..0aac3f50b8
> > --- /dev/null
> > +++ b/xen/scripts/Makefile.asm-generic
> > @@ -0,0 +1,23 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +# include/asm-generic contains a lot of files that are used
> > +# verbatim by several architectures.
> > +#
> > +# This Makefile reads the file arch/$(SRCARCH)/include/asm/Kbuild
> > +# and for each file listed in this file with generic-y creates
> > +# a small wrapper file in $(obj)
> > (arch/$(SRCARCH)/include/generated/asm)
> > +
> > +kbuild-file :=3D $(srctree)/arch/$(SRCARCH)/include/asm/Kbuild
> > +include $(kbuild-file)
> > +
> > +include scripts/Kbuild.include
> > +
> > +# Create output directory if not already present
> > +_dummy :=3D $(shell [ -d $(obj) ] || mkdir -p $(obj))
> > +
> > +quiet_cmd_wrap =3D WRAP=C2=A0=C2=A0=C2=A0 $@
> > +cmd_wrap =3D echo "\#include <asm-generic/$*.h>" >$@
> > +
> > +all: $(patsubst %, $(obj)/%, $(generic-y))
> > +
> > +$(obj)/%.h:
> > + $(call cmd,wrap)
>=20
> In fact i think your files are not generated in the srctree so this
> will break if you use out of tree compilation.
Why not? They will be generated in $obj which equal to
obj=3Darch/$(SRCARCH)/include/generated/asm ( in my case ).

Anyway I think that obj should be equal to what is mentioned in CFLAGS.

~ Oleksii

