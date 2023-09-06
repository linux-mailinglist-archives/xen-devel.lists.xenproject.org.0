Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E13FE793A04
	for <lists+xen-devel@lfdr.de>; Wed,  6 Sep 2023 12:36:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.596464.930375 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdpti-0007kx-8b; Wed, 06 Sep 2023 10:36:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 596464.930375; Wed, 06 Sep 2023 10:36:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdpti-0007i6-4f; Wed, 06 Sep 2023 10:36:34 +0000
Received: by outflank-mailman (input) for mailman id 596464;
 Wed, 06 Sep 2023 10:36:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UMkA=EW=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qdpth-0007hc-Do
 for xen-devel@lists.xenproject.org; Wed, 06 Sep 2023 10:36:33 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3e586ac0-4ca1-11ee-9b0d-b553b5be7939;
 Wed, 06 Sep 2023 12:36:31 +0200 (CEST)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2bcb54226e7so9644151fa.1
 for <xen-devel@lists.xenproject.org>; Wed, 06 Sep 2023 03:36:31 -0700 (PDT)
Received: from [192.168.201.133] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 j12-20020a2e800c000000b002b9f0b25ff6sm3341788ljg.4.2023.09.06.03.36.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Sep 2023 03:36:30 -0700 (PDT)
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
X-Inumbo-ID: 3e586ac0-4ca1-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693996591; x=1694601391; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=C/KCsZxilrmaHr5dZv3qQjSxOdCI8ni2LFgH1WMsz3Q=;
        b=DJac3bGgrty2sCLdt8tvf+6NLKnT9LnoZLDvGYcfh7yHFsoEJmu2Njhk1T5VJEEDcM
         kFN77YkgzBT9O2OASPXbBuqK6816KZkN+VZAFA2CRJs+P/dN3/Lv5aIs2YBWILMn4elL
         DaNOBRS8NTRF8jt46pZ5GXrg9HAAC5CwXZ86JV/ANJ3MWmt0ZJX3PmDezWLKYmSl/dvl
         T8qLWe5eBgHiN/doDCd6IX6FNHuDOdjKlA3nM2EccclV5H2Z75Bc8SYkxMcKo1W2kwA8
         Pm1TtCiKvm3bvcAf79FlxAFVDggZOdC7IXLMlGtIIoUILf58+2qTU/jFnTHSO4vUYX5M
         VXVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693996591; x=1694601391;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C/KCsZxilrmaHr5dZv3qQjSxOdCI8ni2LFgH1WMsz3Q=;
        b=dh71DSU64woo520zu4GdLegXSn1a9oAw20hEwe3f9u6QITk3sjRKUXh3l7CopWb4cT
         xx6jMWqQLSclYe3iQ17gNvj14RO84J5o8mkHBhfmC8WVe+nxRmhAgYP0rGmlLqhX9Jkl
         47MndD0Lrb9RPLC4nGCk5r9l8b7dxr3mMXfjwgbYtATUizCtHIm7Fh0d3Nd0lCQdNswo
         oeiuoszyfGVY1yhLoCqrRrUrdnOXsyIQy5lYWevHGMq12RSfxxmpqG4G1sVYl+jWQ7G3
         /6bIMzRdcaptyAPCjqyhT2DWQ45mbJAWEznwNPjkAZqEm2zKpJZghi+p8DZVXT8vsYEq
         A5XQ==
X-Gm-Message-State: AOJu0YwB5fDR2K+U7RH51M4Vn7vi6vwS9z5AfXQhDcENskG2x6EJFJtH
	UB8TuFkhavJO8AR/MjW8/oc=
X-Google-Smtp-Source: AGHT+IGDnnlu+8iRzwtckFnxjAgRVZT8k1fAY+IFG7Sey0092Dy66qSLHhO8Rbv6kA3AM80kH8A8xw==
X-Received: by 2002:a2e:a4ba:0:b0:2b6:9e82:446 with SMTP id g26-20020a2ea4ba000000b002b69e820446mr1065372ljm.0.1693996590669;
        Wed, 06 Sep 2023 03:36:30 -0700 (PDT)
Message-ID: <8d297f28f6a92230fba950b5592fcdefe54f7f09.camel@gmail.com>
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
 <roger.pau@citrix.com>, Anthony PERARD <anthony.perard@citrix.com>
Date: Wed, 06 Sep 2023 13:36:29 +0300
In-Reply-To: <048CB17B-A139-4552-A51A-5696B019507B@arm.com>
References: <cover.1693583721.git.oleksii.kurochko@gmail.com>
	 <96b2a4ff48578b7b105581529d2aa6bebd8ad622.1693583721.git.oleksii.kurochko@gmail.com>
	 <3DCD5649-C172-4400-AA75-A28F5C0A106D@arm.com>
	 <e2b6ee2ecae5512a23a3e33bba0083b90a1c8831.camel@gmail.com>
	 <048CB17B-A139-4552-A51A-5696B019507B@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

On Tue, 2023-09-05 at 14:10 +0000, Bertrand Marquis wrote:
> Hi Oleksii,
>=20
> > On 5 Sep 2023, at 15:37, Oleksii <oleksii.kurochko@gmail.com>
> > wrote:
> >=20
> > Hi Bertrand,
> >=20
> > On Mon, 2023-09-04 at 13:39 +0000, Bertrand Marquis wrote:
> > > Hi Oleksii,
> > >=20
> > > > On 1 Sep 2023, at 18:02, Oleksii Kurochko
> > > > <oleksii.kurochko@gmail.com> wrote:
> > > >=20
> > > > Some headers are shared between individual architectures or are
> > > > empty.
> > > > To avoid duplication of these headers, asm-generic is
> > > > introduced.
> > > >=20
> > > > With the following patch, an architecture uses generic headers
> > > > mentioned in the file arch/$(ARCH)/include/asm/Kbuild.
> > >=20
> > > Kbuild refers to "Kernel build" I guess.
> > > I am ok to keep that name to keep things simpler when compared to
> > > Linux scripts but it would be good to mention that in the commit
> > > message for future reference.
> > Sure. I'll add that Kbuild refers to "Kernel build"
> > >=20
> > > >=20
> > > > To use a generic header is needed to add to
> > > > arch/$(ARCH)/include/asm/Kbuild :
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 generic-y +=3D <name-of-header=
-file.h>
> > > >=20
> > > > For each mentioned header in arch/$(ARCH)/include/asm/Kbuild,
> > > > kbuild will generate the necessary wrapper in
> > > > arch/$(ARCH)/include/generated/asm.
> > > >=20
> > > > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > > > ---
> > > > Changes in V4:
> > > > - introduce asm-generic support
> > > > - update commit message
> > > > ---
> > > > Changes in V3:
> > > > - Rename stubs dir to asm-generic
> > > > ---
> > > > Changes in V2:
> > > > - Nothing changed.
> > > > ---
> > > > xen/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | =
10 +++++++++-
> > > > xen/arch/arm/include/asm/Kbuild=C2=A0=C2=A0 |=C2=A0 1 +
> > > > xen/arch/ppc/include/asm/Kbuild=C2=A0=C2=A0 |=C2=A0 1 +
> > > > xen/arch/riscv/include/asm/Kbuild |=C2=A0 1 +
> > > > xen/arch/x86/include/asm/Kbuild=C2=A0=C2=A0 |=C2=A0 1 +
> > > > xen/scripts/Makefile.asm-generic=C2=A0 | 23 +++++++++++++++++++++++
> > > > 6 files changed, 36 insertions(+), 1 deletion(-)
> > > > create mode 100644 xen/arch/arm/include/asm/Kbuild
> > > > create mode 100644 xen/arch/ppc/include/asm/Kbuild
> > > > create mode 100644 xen/arch/riscv/include/asm/Kbuild
> > > > create mode 100644 xen/arch/x86/include/asm/Kbuild
> > > > create mode 100644 xen/scripts/Makefile.asm-generic
> > > >=20
> > > > diff --git a/xen/Makefile b/xen/Makefile
> > > > index f57e5a596c..698d6ddeb8 100644
> > > > --- a/xen/Makefile
> > > > +++ b/xen/Makefile
> > > > @@ -438,6 +438,7 @@ ifdef building_out_of_srctree
> > > > endif
> > > > CFLAGS +=3D -I$(srctree)/include
> > > > CFLAGS +=3D -I$(srctree)/arch/$(SRCARCH)/include
> > > > +CFLAGS +=3D -I$(srctree)/arch/$(SRCARCH)/include/generated
> > >=20
> > > Why are we generating files in the source tree ?=20
> > > Shouldn't we keep it unmodified ?
> > I think you are right.
> > I got myself confused because I do not use out-of-tree compilation
> > so
> > for me it looked like $(srctree).
> >=20
> > It would be better to use $(objtree) instead.
>=20
> Ack
>=20
> > >=20
> > > >=20
> > > > # Note that link order matters!
> > > > ALL_OBJS-y=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :=3D common/built_in.o
> > > > @@ -580,6 +581,7 @@ _clean:
> > > > rm -f $(TARGET).efi $(TARGET).efi.map $(TARGET).efi.elf
> > > > $(TARGET).efi.stripped
> > > > rm -f asm-offsets.s arch/*/include/asm/asm-offsets.h
> > > > rm -f .banner .allconfig.tmp include/xen/compile.h
> > > > + rm -rf arch/*/include/generated
> > > >=20
> > >=20
> > > You must use the same as for CFLAGS here so $(srctree) would be
> > > needed.
> > > (or something else depending on the fix for previous comment)
> > Thanks. I'll change to the value mentioned in CFLAGS.
> >=20
> > >=20
> > > > .PHONY: _distclean
> > > > _distclean: clean
> > > > @@ -589,7 +591,7 @@ $(TARGET).gz: $(TARGET)
> > > > gzip -n -f -9 < $< > $@.new
> > > > mv $@.new $@
> > > >=20
> > > > -$(TARGET): outputmakefile FORCE
> > > > +$(TARGET): outputmakefile asm-generic FORCE
> > > > $(Q)$(MAKE) $(build)=3Dtools
> > > > $(Q)$(MAKE) $(build)=3D. include/xen/compile.h
> > > > $(Q)$(MAKE) $(build)=3Dinclude all
> > > > @@ -667,6 +669,12 @@ endif # need-sub-make
> > > > PHONY +=3D FORCE
> > > > FORCE:
> > > >=20
> > > > +# Support for using generic headers in asm-generic
> > > > +PHONY +=3D asm-generic
> > > > +asm-generic:
> > > > + $(Q)$(MAKE) -f $(srctree)/scripts/Makefile.asm-generic \
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 obj=3Darch/$(SRCARCH)/include/generated/asm
> > > > +
> > > > # Declare the contents of the PHONY variable as phony.=C2=A0 We kee=
p
> > > > that
> > > > # information in a variable so we can use it in if_changed and
> > > > friends.
> > > > .PHONY: $(PHONY)
> > > > diff --git a/xen/arch/arm/include/asm/Kbuild
> > > > b/xen/arch/arm/include/asm/Kbuild
> > > > new file mode 100644
> > > > index 0000000000..a4e40e534e
> > > > --- /dev/null
> > > > +++ b/xen/arch/arm/include/asm/Kbuild
> > > > @@ -0,0 +1 @@
> > > > +# SPDX-License-Identifier: GPL-2.0-only
> > > > diff --git a/xen/arch/ppc/include/asm/Kbuild
> > > > b/xen/arch/ppc/include/asm/Kbuild
> > > > new file mode 100644
> > > > index 0000000000..a4e40e534e
> > > > --- /dev/null
> > > > +++ b/xen/arch/ppc/include/asm/Kbuild
> > > > @@ -0,0 +1 @@
> > > > +# SPDX-License-Identifier: GPL-2.0-only
> > > > diff --git a/xen/arch/riscv/include/asm/Kbuild
> > > > b/xen/arch/riscv/include/asm/Kbuild
> > > > new file mode 100644
> > > > index 0000000000..a4e40e534e
> > > > --- /dev/null
> > > > +++ b/xen/arch/riscv/include/asm/Kbuild
> > > > @@ -0,0 +1 @@
> > > > +# SPDX-License-Identifier: GPL-2.0-only
> > > > diff --git a/xen/arch/x86/include/asm/Kbuild
> > > > b/xen/arch/x86/include/asm/Kbuild
> > > > new file mode 100644
> > > > index 0000000000..a4e40e534e
> > > > --- /dev/null
> > > > +++ b/xen/arch/x86/include/asm/Kbuild
> > > > @@ -0,0 +1 @@
> > > > +# SPDX-License-Identifier: GPL-2.0-only
> > > > diff --git a/xen/scripts/Makefile.asm-generic
> > > > b/xen/scripts/Makefile.asm-generic
> > > > new file mode 100644
> > > > index 0000000000..0aac3f50b8
> > > > --- /dev/null
> > > > +++ b/xen/scripts/Makefile.asm-generic
> > > > @@ -0,0 +1,23 @@
> > > > +# SPDX-License-Identifier: GPL-2.0
> > > > +# include/asm-generic contains a lot of files that are used
> > > > +# verbatim by several architectures.
> > > > +#
> > > > +# This Makefile reads the file
> > > > arch/$(SRCARCH)/include/asm/Kbuild
> > > > +# and for each file listed in this file with generic-y creates
> > > > +# a small wrapper file in $(obj)
> > > > (arch/$(SRCARCH)/include/generated/asm)
> > > > +
> > > > +kbuild-file :=3D $(srctree)/arch/$(SRCARCH)/include/asm/Kbuild
> > > > +include $(kbuild-file)
> > > > +
> > > > +include scripts/Kbuild.include
> > > > +
> > > > +# Create output directory if not already present
> > > > +_dummy :=3D $(shell [ -d $(obj) ] || mkdir -p $(obj))
> > > > +
> > > > +quiet_cmd_wrap =3D WRAP=C2=A0=C2=A0=C2=A0 $@
> > > > +cmd_wrap =3D echo "\#include <asm-generic/$*.h>" >$@
> > > > +
> > > > +all: $(patsubst %, $(obj)/%, $(generic-y))
> > > > +
> > > > +$(obj)/%.h:
> > > > + $(call cmd,wrap)
> > >=20
> > > In fact i think your files are not generated in the srctree so
> > > this
> > > will break if you use out of tree compilation.
> > Why not? They will be generated in $obj which equal to
> > obj=3Darch/$(SRCARCH)/include/generated/asm ( in my case ).
>=20
> Right they are generated in the build tree but if it is not the same
> as srctree it will not work due to CFLAGS.
>=20
> >=20
> > Anyway I think that obj should be equal to what is mentioned in
> > CFLAGS.
>=20
> We generate other files like asm-offsets.h and it could in fact be
> that
> both srctree and build tree are already in include path.
>=20
> There is in makefile a rule already removing asm-offsets.h which is
> generated
> and this one does not use a prefix so we should follow this standard
> in fact.
>=20
> So we should not use any prefix (srctree or obj) i think.
I think you are right. Lets avoid usage of srctree/obj.


~ Oleksii

