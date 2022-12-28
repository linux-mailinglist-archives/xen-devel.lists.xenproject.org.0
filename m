Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1BE66572E0
	for <lists+xen-devel@lfdr.de>; Wed, 28 Dec 2022 05:53:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.469440.728808 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pAOQD-0008Gh-BS; Wed, 28 Dec 2022 04:52:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 469440.728808; Wed, 28 Dec 2022 04:52:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pAOQD-0008FC-7P; Wed, 28 Dec 2022 04:52:09 +0000
Received: by outflank-mailman (input) for mailman id 469440;
 Wed, 28 Dec 2022 04:52:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8Lbo=42=gmail.com=alistair23@srs-se1.protection.inumbo.net>)
 id 1pAOQB-0008F6-Iu
 for xen-devel@lists.xenproject.org; Wed, 28 Dec 2022 04:52:07 +0000
Received: from mail-vk1-xa2b.google.com (mail-vk1-xa2b.google.com
 [2607:f8b0:4864:20::a2b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 601b975e-866b-11ed-8fd4-01056ac49cbb;
 Wed, 28 Dec 2022 05:52:05 +0100 (CET)
Received: by mail-vk1-xa2b.google.com with SMTP id 6so7017592vkz.0
 for <xen-devel@lists.xenproject.org>; Tue, 27 Dec 2022 20:52:05 -0800 (PST)
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
X-Inumbo-ID: 601b975e-866b-11ed-8fd4-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Wk+91qCpE/cR8piAuuFfnNvgxdIV9CiddMwOOFabXNI=;
        b=LB0NvY4ePCQ93iXU13aXamHXuhhjRftMGv4oUC7itpA4oL8IjAcPUQyVT5xpE+3vbo
         tMe5z/5xaX/DnrFxE1MWRQ8CYV2hl5klcyT5wD+jDHBBpbTgT3RyEUnGG5EwSLjeyJ/+
         LKbkUe9Nkam9/muK2kbVE8j8CZhpq0toya/zk3nTDZ28eufT8bZt30h4Z7GQHDmVwcEv
         4570NDoIItLfM4DLubaeekACMgyhBEst2vNAE0KqE56pcYXLfwfRHh9Ef36iwOgxNXta
         k1fSrQoJP53tZBPseHvvkGCjYyKAfPX5mIkFdPuGf2ObaxySSCteU8tmXEhVwK/s4sDZ
         GXKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wk+91qCpE/cR8piAuuFfnNvgxdIV9CiddMwOOFabXNI=;
        b=vJz770Zk2AR7s5EKOaCKDuG5i91rZV2g3b3fIb3SYeZfEZ8dROnYsXHQx8tHMyC9Lo
         MoWe/SBmbC5aRWp64LaZD/rsPgJd0tdGPDPKxjzNxKFDKbNlVaOY9c/3mwM+pTkjyEXR
         s5tn5wJpYZyCTmwohtxClUhDTWgzBIxajV/JmZOo07Vl5kxr87WkHfnNI4i9KUA6BhTP
         C046U5J4M3pw2NfGHW81Xvmm4iEseDUNPrIrT34d7OO0KjKK6P5FDOlcqnQhneHjunJ8
         upYeQm/VVpxSXCwrSmbPCA7h88XqgUzTzbHCojJPzzNqmw1u4J/PKuUi0xcFZ0/RQIJo
         br7w==
X-Gm-Message-State: AFqh2koQ2HJKVaaopuKfOAcHA46CARGV+81lOJAuw/Iy+tp4BbW0ziSF
	317A8HQ82vDKKAfuqk8Quqz84CXh8h2OClcygfI=
X-Google-Smtp-Source: AMrXdXv41iqDphK9+yvfL/lV4G7O2wdojoIvZJS1QPAvIv0Jq1m74GFayQFAb1XvYI8NiyA05MH9Jhp5q9g6ZsmdnIY=
X-Received: by 2002:a1f:a954:0:b0:3b8:ba98:bd43 with SMTP id
 s81-20020a1fa954000000b003b8ba98bd43mr2649476vke.34.1672203124441; Tue, 27
 Dec 2022 20:52:04 -0800 (PST)
MIME-Version: 1.0
References: <cover.1671789736.git.oleksii.kurochko@gmail.com>
 <5d5ec5fbd8787ed8f86bf84a5ac291d07a20b307.1671789736.git.oleksii.kurochko@gmail.com>
 <3343c927-0f27-e285-5b6e-281c61939bb4@xen.org> <43d726761900ba3d8b4919fc29fe7cb1991ac656.camel@gmail.com>
In-Reply-To: <43d726761900ba3d8b4919fc29fe7cb1991ac656.camel@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 28 Dec 2022 14:51:38 +1000
Message-ID: <CAKmqyKMmW7rRXymMD6dNeLTLbUaSwO5nw=hJTk_xNvsZ3pg7jA@mail.gmail.com>
Subject: Re: [XEN PATCH v1 1/4] arch/riscv: initial RISC-V support to
 build/run minimal Xen
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Gianluca Guida <gianluca@rivosinc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, 
	Alistair Francis <alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>, 
	Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Dec 26, 2022 at 9:14 PM Oleksii <oleksii.kurochko@gmail.com> wrote:
>
> Hi Julien,
>
> Thanks for your comments.
>
> On Fri, 2022-12-23 at 13:50 +0000, Julien Grall wrote:
> > Hi Oleksii,
> >
> > + Anthony for the Makefile changes.
> >
> > On 23/12/2022 11:16, Oleksii Kurochko wrote:
> > > The patch provides a minimal amount of changes to start
> > > build and run minimal Xen binary at GitLab CI&CD that will
> > > allow continuous checking of the build status of RISC-V Xen.
> > >
> > > RISC-V Xen can be built by the following instructions:
> > >    $ CONTAINER=riscv64 ./automation/scripts/containerize \
> > >         make XEN_TARGET_ARCH=riscv64 tiny64_defconfig
> > >    $ CONTAINER=riscv64 ./automation/scripts/containerize \
> > >         make XEN_TARGET_ARCH=riscv64 -C xen build
> > >
> > > RISC-V Xen can be run as:
> > >    $ qemu-system-riscv64 -M virt -smp 1 -nographic -m 2g \
> > >         -kernel xen/xen
> > >
> > > To run in debug mode should be done the following instructions:
> > >   $ qemu-system-riscv64 -M virt -smp 1 -nographic -m 2g \
> > >          -kernel xen/xen -s -S
> > >   # In separate terminal:
> > >   $ riscv64-buildroot-linux-gnu-gdb
> > >   $ target remote :1234
> > >   $ add-symbol-file <xen_src>/xen/xen-syms 0x80200000
> > >   $ hb *0x80200000
> > >   $ c # it should stop at instruction j 0x80200000 <start>
> > >
> > > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > > ---
> > >   xen/arch/riscv/Makefile             | 30 +++++++++++++
> > >   xen/arch/riscv/arch.mk              | 10 +++++
> > >   xen/arch/riscv/include/asm/config.h | 26 ++++++++++-
> > >   xen/arch/riscv/include/asm/types.h  | 11 +++++
> > >   xen/arch/riscv/riscv64/Makefile     |  2 +-
> > >   xen/arch/riscv/riscv64/head.S       |  2 +-
> > >   xen/arch/riscv/xen.lds.S            | 69
> > > +++++++++++++++++++++++++++++
> > >   7 files changed, 147 insertions(+), 3 deletions(-)
> > >   create mode 100644 xen/arch/riscv/include/asm/types.h
> > >   create mode 100644 xen/arch/riscv/xen.lds.S
> > >
> > > diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
> > > index 942e4ffbc1..893dd19ea6 100644
> > > --- a/xen/arch/riscv/Makefile
> > > +++ b/xen/arch/riscv/Makefile
> > > @@ -1,2 +1,32 @@
> > > +obj-$(CONFIG_RISCV_64) += riscv64/
> > > +
> > > +$(TARGET): $(TARGET)-syms
> > > +       $(OBJCOPY) -O binary -S $< $@
> > > +
> > > +$(TARGET)-syms: $(objtree)/prelink.o $(obj)/xen.lds
> > > +       $(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< \
> > > +               $(SYMBOLS_DUMMY_OBJ) -o $(@D)/.$(@F).0
> > > +       $(NM) -pa --format=sysv $(@D)/.$(@F).0 \
> > > +               | $(objtree)/tools/symbols $(all_symbols) --sysv --
> > > sort >$(@D)/.$(@F).0.S
> > > +       $(MAKE) $(build)=$(@D) $(@D)/.$(@F).0.o
> > > +       $(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< \
> > > +               $(@D)/.$(@F).0.o -o $(@D)/.$(@F).1
> > > +       $(NM) -pa --format=sysv $(@D)/.$(@F).1 \
> > > +               | $(objtree)/tools/symbols $(all_symbols) --sysv --
> > > sort >$(@D)/.$(@F).1.S
> > > +       $(MAKE) $(build)=$(@D) $(@D)/.$(@F).1.o
> > > +       $(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $<
> > > $(build_id_linker) \
> > > +               $(@D)/.$(@F).1.o -o $@
> > > +       $(NM) -pa --format=sysv $(@D)/$(@F) \
> > > +               | $(objtree)/tools/symbols --all-symbols --xensyms
> > > --sysv --sort \
> > > +               >$(@D)/$(@F).map
> > > +       rm -f $(@D)/.$(@F).[0-9]*
> > > +
> > > +$(obj)/xen.lds: $(src)/xen.lds.S FORCE
> > > +               $(call if_changed_dep,cpp_lds_S)
> > > +
> > > +.PHONY: clean
> > > +clean::
> > > +       rm -f $(objtree)/.xen-syms.[0-9]*
> >
> > Any reason to not use the variable clean-files as this is done for
> > the
> > other architectures?
>
> There is no reason not use the variable clean-files. I missed the
> vairable clean-files so the patch will be updated to use the
> variable clean-files instead of the variable clean.
>
> >
> > > +
> > >   .PHONY: include
> > >   include:
> > > diff --git a/xen/arch/riscv/arch.mk b/xen/arch/riscv/arch.mk
> > > index ae8fe9dec7..9292b72718 100644
> > > --- a/xen/arch/riscv/arch.mk
> > > +++ b/xen/arch/riscv/arch.mk
> > > @@ -11,3 +11,13 @@ riscv-march-$(CONFIG_RISCV_ISA_C)       :=
> > > $(riscv-march-y)c
> > >   # -mcmodel=medlow would force Xen into the lower half.
> > >
> > >   CFLAGS += -march=$(riscv-march-y) -mstrict-align -mcmodel=medany
> > > +
> > > +# TODO: Drop override and SYMBOLS_DUMMY_OBJ when more
> > > +# of the build is working
> > > +override ALL_OBJS-y = arch/$(TARGET_ARCH)/built_in.o
> > > +override ALL_LIBS-y =
> > > +ifneq ($(wildcard $(objtree)/common/symbols-dummy.o),)
> > > +SYMBOLS_DUMMY_OBJ=$(objtree)/common/symbols-dummy.o
> > > +else
> > > +SYMBOLS_DUMMY_OBJ=
> > > +endif
> >
> > Why do you need the ifneq here?
>
> The only reason for the ifneq here is to skip common
> stuff from the build of minimal RISC-V Xen binary as it
> requires pushing from the start a big amount of headers and function
> stubs which at least will lead to a huge patch and complicate a code
> review.
>
> It is possible to remove <common/symbols-dummy.o> from xen-syms
> target in <xen/arch/riscv/Makefile> but an intention here was
> to remain processing of xen-syms target similar to the original
> one and it is the second reason why the ifneq was introduced and
> added the comment "TODO: Drop ... SYMBOLS_DUMMY_OBJ when more
> of the build is working".
>
> >
> > > diff --git a/xen/arch/riscv/include/asm/config.h
> > > b/xen/arch/riscv/include/asm/config.h
> > > index e2ae21de61..756607a4a2 100644
> > > --- a/xen/arch/riscv/include/asm/config.h
> > > +++ b/xen/arch/riscv/include/asm/config.h
> > > @@ -28,7 +28,7 @@
> > >
> > >   /* Linkage for RISCV */
> > >   #ifdef __ASSEMBLY__
> > > -#define ALIGN .align 2
> > > +#define ALIGN .align 4
> >
> > Can you explain in the commit message why you need to change this?
> > But
> > ideally, this change should be part of a separate one.
>
> ALIGN was changed to equal the implementation-enforced instruction
> address alignment (4-bytes), in order to ensure that entry points are
> properly aligned.
> If to be honest I haven't verified that and took these changes from
> the initial patch series pushed by Bobby Eshleman.
>
> >
> > >
> > >   #define ENTRY(name)                                \
> > >     .globl name;                                     \
> > > @@ -36,6 +36,30 @@
> > >     name:
> > >   #endif
> > >
> > > +/*
> > > + * Definition of XEN_VIRT_START should look like:
> > > + *   define XEN_VIRT_START _AT(vaddr_t,0x00200000)
> > > + * It requires including of additional headers which
> > > + * will increase an amount of files unnecessary for
> > > + * minimal RISC-V Xen build so set value of
> > > + * XEN_VIRT_START explicitly.
> > > + *
> > > + * TODO: change it to _AT(vaddr_t,0x00200000) when
> > > + *       necessary header will be pushed.
> >
> > The address here doesn't match the one below. I know this is an
> > example
> > but this is fairly confusing.
>
> This was done only as an example.
>
> >
> > > + */
> > > +#define XEN_VIRT_START  0x80200000
> >
> > I think you at least want to use _AT(unsigned long, ...) here to make
> > clear this value should be interpreted as an unsigned value.
> >
> > You could even define vaddr_t now as you introduce a dummy types.h
> > below.
>
> It makes sense to push the definition of vaddr_t and use <xen/const.h>
> to be able to use _AT() macros.
>
> Probably it would be nice to introduce others from types.h from the
> start, wouldn't it? Or would it be better to leave the patch minimal
> and introduce only types necessary for vaddr_t?

It would be best to add types.h early. I don't really see a reason not to

>
> >
> > > +/*
> > > + * PAGE_SIZE is defined in <{asm,xen}/page-*.h> but to
> > > + * remove unnecessary headers for minimal
> > > + * build headers it will be better to set PAGE_SIZE
> > > + * explicitly.
> >
> > TBH, I think this is a shortcut that is unnecessary and will only
> > introduce extra churn in the future (for instance, you will need to
> > modify the include in xen.lds.S).
> >
> > But I am not the maintainer, so I will leave that decision to them
> > whether this is acceptable.
>
> I didn't get what you mean by a shortcut here.
>
> The idea was to introduce PAGE_SIZE in the config.h directly for now
> to keep build of RISC-V Xen minimal as much as possible otherwise
> it would be required to push dummy <asm/page-bits.h> to get only one
> needed definition of PAGE_SIZE to have buildable Xen.
> Thereby it was decided to define PAGE_SIZE directly in <asm/config.h>
> and remove it after all definitions from <{asm,xen}/page-*.h> will be
> needed.
>
> >
> > > + *
> > > + * TODO: remove it when <asm/page-*.h> will be needed
> > > + *       defintion of PAGE_SIZE should be remove from
> >
> > s/defintion/definition/
>
> Thanks for finding the typo. Will update it in the next version of
> the patch.
>
> >
> > > + *       this header.
> > > + */
> > > +#define PAGE_SIZE       4096 > +
> > >   #endif /* __RISCV_CONFIG_H__ */
> > >   /*
> > >    * Local variables:
> > > diff --git a/xen/arch/riscv/include/asm/types.h
> > > b/xen/arch/riscv/include/asm/types.h
> > > new file mode 100644
> > > index 0000000000..afbca6b15c
> > > --- /dev/null
> > > +++ b/xen/arch/riscv/include/asm/types.h
> > > @@ -0,0 +1,11 @@
> > > +#ifndef __TYPES_H__
> > > +#define __TYPES_H__
> > > +
> > > +/*
> > > + *
> > > + * asm/types.h is required for xen-syms.S file which
> > > + * is produced by tools/symbols.
> > > + *
> > > + */
> > > +
> > > +#endif
> > > diff --git a/xen/arch/riscv/riscv64/Makefile
> > > b/xen/arch/riscv/riscv64/Makefile
> > > index 15a4a65f66..3340058c08 100644
> > > --- a/xen/arch/riscv/riscv64/Makefile
> > > +++ b/xen/arch/riscv/riscv64/Makefile
> > > @@ -1 +1 @@
> > > -extra-y += head.o
> > > +obj-y += head.o
> >
> > This changes want to be explained. So does...
>
> RISC-V 64 would be supported now and minimal build is built
> now only obj-y stuff.
>
> >
> > > diff --git a/xen/arch/riscv/riscv64/head.S
> > > b/xen/arch/riscv/riscv64/head.S
> > > index 0dbc27ba75..0330b29c01 100644
> > > --- a/xen/arch/riscv/riscv64/head.S
> > > +++ b/xen/arch/riscv/riscv64/head.S
> > > @@ -1,6 +1,6 @@
> > >   #include <asm/config.h>
> > >
> > > -        .text
> > > +        .section .text.header, "ax", %progbits
> >
> > ... AFAICT this is to match the recent change in the build system.
>
> I am not sure that I get you here but it was done to make 'start'
> instructions to be the first instructions that will be executed and
> to make 'start' symbol to be the first in xen-syms.map file otherwise
> gdb shows that Xen starts from the wrong instructions, fails to find
> correct source file and goes crazy.
>
> >
> > >
> > >   ENTRY(start)
> > >           j  start
> > > diff --git a/xen/arch/riscv/xen.lds.S b/xen/arch/riscv/xen.lds.S
> > > new file mode 100644
> > > index 0000000000..60628b3856
> > > --- /dev/null
> > > +++ b/xen/arch/riscv/xen.lds.S
> > > @@ -0,0 +1,69 @@
> > > +#include <xen/xen.lds.h>
> > > +
> > > +#undef ENTRY
> > > +#undef ALIGN
> > > +
> > > +OUTPUT_ARCH(riscv)
> > > +ENTRY(start)
> > > +
> > > +PHDRS
> > > +{
> > > +  text PT_LOAD ;
> > > +#if defined(BUILD_ID)
> > > +  note PT_NOTE ;
> > > +#endif
> > > +}
> > > +
> > > +SECTIONS
> > > +{
> > > +  . = XEN_VIRT_START;
> > > +  _start = .;
> > > +  .text : {
> > > +        _stext = .;
> > > +       *(.text.header)
> > > +       *(.text)
> >
> > You are missing some sections here such as .text.cold,
> > .text.unlikely...
> >
> > I understand they are probably not used yet. But it will avoid any
> > nasty
> > surprise if they are forgotten.
>
> They were skipped because they aren't use for now. Will add it in
> the next version of the patch.
>
> >
> > > +       *(.gnu.warning)
> > > +       . = ALIGN(POINTER_ALIGN);
> > > +       _etext = .;
> > > +  } :text
> > > +
> > > +    . = ALIGN(PAGE_SIZE);
> > > +  .rodata : {
> > > +        _srodata = .;
> >
> > You introduce _srodata but I can't find the matching _erodata.
>
> My fault. Thanks. Will add it in the the next version of the patch.
>
> >
> > > +       *(.rodata)
> > > +       *(.rodata.*)
> > > +       *(.data.rel.ro)
> > > +       *(.data.rel.ro.*)
> > > +  } :text
> > > +
> > > +#if defined(BUILD_ID)
> > > +  . = ALIGN(4);
> > > +  .note.gnu.build-id : {
> > > +       __note_gnu_build_id_start = .;
> > > +       *(.note.gnu.build-id)
> > > +       __note_gnu_build_id_end = .;
> > > +  } :note :text
> > > +#endif
> > > +
> > > +  . = ALIGN(PAGE_SIZE);
> > > +  .data : { /* Data */
> > > +       *(.data .data.*)
> >
> > It would be better if you introduce .data.read_mostly right now
> > separately.
> >
> > You also want *.data.page_aligned in .data.
> >
> > Lastly you are missing CONSTRUCTORS
>
> I will add offred sections and CONSTUCTORS in the next version of
> the patch
>
> >
> > > +  } :text
> > > +
> >
> > I am assuming you are going to add .init.* afterwards?
> >
> > > +  . = ALIGN(PAGE_SIZE);
> > > +  .bss : {
> > > +       __bss_start = .;
> > > +       *(.bss .bss.*)
> > > +       . = ALIGN(POINTER_ALIGN);
> > > +       __bss_end = .;
> >
> > Same as .data, I would recommend to properly populate it.
>
> Do you mean to add .bss.stack_aligned, .bss.page_aligned, .bss.percpu*?
> One of the reasons they were skipped is they aren't used now and one
> more reason if to believe xen.lds.S file from ARM
> .bss.percpu.read_mostly should be aligned by SMP_CACHE_BYTES which
> requires dummy <asm/cache.h> (or not ?) which will increase the patch
> with unneeded stuff for now.

I think we should aim to get the linker file sorted right from the
start. Otherwise someone is going to hit a nasty bug at some point in
the future.

Alistair

>
> >
> > Cheers,
> >
>
> Best regards,
>  Oleksii
>

