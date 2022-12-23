Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AECFF655114
	for <lists+xen-devel@lfdr.de>; Fri, 23 Dec 2022 14:50:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.468959.728181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8iRL-0005CN-PR; Fri, 23 Dec 2022 13:50:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 468959.728181; Fri, 23 Dec 2022 13:50:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8iRL-00059x-Mn; Fri, 23 Dec 2022 13:50:23 +0000
Received: by outflank-mailman (input) for mailman id 468959;
 Fri, 23 Dec 2022 13:50:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p8iRJ-00059r-Uz
 for xen-devel@lists.xenproject.org; Fri, 23 Dec 2022 13:50:21 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p8iRJ-0006G5-G2; Fri, 23 Dec 2022 13:50:21 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=[192.168.3.230]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p8iRJ-0006DH-5K; Fri, 23 Dec 2022 13:50:21 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=zk0hESTuJ1pSguZZ4wmRnKwDN8uHhE2RK1592n9wHAc=; b=JemsAzkp2CMNiZOgCnBOTF/M8O
	DYgwO1BFLXDJsuhQ74lo0hkfhVMr327GLIk/yPL+ISZE9HMlFdRKH8SjgZKeGjaFjmxxUf0E6KlZh
	0oupkKOkPUoEGfTHrZMtDzwesRm0Owh+7KKqRfyhiZn6g/xM2I9oRQrKgtNZNf/zoV6U=;
Message-ID: <3343c927-0f27-e285-5b6e-281c61939bb4@xen.org>
Date: Fri, 23 Dec 2022 13:50:18 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [XEN PATCH v1 1/4] arch/riscv: initial RISC-V support to
 build/run minimal Xen
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <cover.1671789736.git.oleksii.kurochko@gmail.com>
 <5d5ec5fbd8787ed8f86bf84a5ac291d07a20b307.1671789736.git.oleksii.kurochko@gmail.com>
Content-Language: en-US
From: Julien Grall <julien@xen.org>
In-Reply-To: <5d5ec5fbd8787ed8f86bf84a5ac291d07a20b307.1671789736.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Oleksii,

+ Anthony for the Makefile changes.

On 23/12/2022 11:16, Oleksii Kurochko wrote:
> The patch provides a minimal amount of changes to start
> build and run minimal Xen binary at GitLab CI&CD that will
> allow continuous checking of the build status of RISC-V Xen.
> 
> RISC-V Xen can be built by the following instructions:
>    $ CONTAINER=riscv64 ./automation/scripts/containerize \
>         make XEN_TARGET_ARCH=riscv64 tiny64_defconfig
>    $ CONTAINER=riscv64 ./automation/scripts/containerize \
>         make XEN_TARGET_ARCH=riscv64 -C xen build
> 
> RISC-V Xen can be run as:
>    $ qemu-system-riscv64 -M virt -smp 1 -nographic -m 2g \
>         -kernel xen/xen
> 
> To run in debug mode should be done the following instructions:
>   $ qemu-system-riscv64 -M virt -smp 1 -nographic -m 2g \
>          -kernel xen/xen -s -S
>   # In separate terminal:
>   $ riscv64-buildroot-linux-gnu-gdb
>   $ target remote :1234
>   $ add-symbol-file <xen_src>/xen/xen-syms 0x80200000
>   $ hb *0x80200000
>   $ c # it should stop at instruction j 0x80200000 <start>
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
>   xen/arch/riscv/Makefile             | 30 +++++++++++++
>   xen/arch/riscv/arch.mk              | 10 +++++
>   xen/arch/riscv/include/asm/config.h | 26 ++++++++++-
>   xen/arch/riscv/include/asm/types.h  | 11 +++++
>   xen/arch/riscv/riscv64/Makefile     |  2 +-
>   xen/arch/riscv/riscv64/head.S       |  2 +-
>   xen/arch/riscv/xen.lds.S            | 69 +++++++++++++++++++++++++++++
>   7 files changed, 147 insertions(+), 3 deletions(-)
>   create mode 100644 xen/arch/riscv/include/asm/types.h
>   create mode 100644 xen/arch/riscv/xen.lds.S
> 
> diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
> index 942e4ffbc1..893dd19ea6 100644
> --- a/xen/arch/riscv/Makefile
> +++ b/xen/arch/riscv/Makefile
> @@ -1,2 +1,32 @@
> +obj-$(CONFIG_RISCV_64) += riscv64/
> +
> +$(TARGET): $(TARGET)-syms
> +	$(OBJCOPY) -O binary -S $< $@
> +
> +$(TARGET)-syms: $(objtree)/prelink.o $(obj)/xen.lds
> +	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< \
> +		$(SYMBOLS_DUMMY_OBJ) -o $(@D)/.$(@F).0
> +	$(NM) -pa --format=sysv $(@D)/.$(@F).0 \
> +		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort >$(@D)/.$(@F).0.S
> +	$(MAKE) $(build)=$(@D) $(@D)/.$(@F).0.o
> +	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< \
> +		$(@D)/.$(@F).0.o -o $(@D)/.$(@F).1
> +	$(NM) -pa --format=sysv $(@D)/.$(@F).1 \
> +		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort >$(@D)/.$(@F).1.S
> +	$(MAKE) $(build)=$(@D) $(@D)/.$(@F).1.o
> +	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< $(build_id_linker) \
> +		$(@D)/.$(@F).1.o -o $@
> +	$(NM) -pa --format=sysv $(@D)/$(@F) \
> +		| $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
> +		>$(@D)/$(@F).map
> +	rm -f $(@D)/.$(@F).[0-9]*
> +
> +$(obj)/xen.lds: $(src)/xen.lds.S FORCE
> +	        $(call if_changed_dep,cpp_lds_S)
> +
> +.PHONY: clean
> +clean::
> +	rm -f $(objtree)/.xen-syms.[0-9]*

Any reason to not use the variable clean-files as this is done for the 
other architectures?

> +
>   .PHONY: include
>   include:
> diff --git a/xen/arch/riscv/arch.mk b/xen/arch/riscv/arch.mk
> index ae8fe9dec7..9292b72718 100644
> --- a/xen/arch/riscv/arch.mk
> +++ b/xen/arch/riscv/arch.mk
> @@ -11,3 +11,13 @@ riscv-march-$(CONFIG_RISCV_ISA_C)       := $(riscv-march-y)c
>   # -mcmodel=medlow would force Xen into the lower half.
>   
>   CFLAGS += -march=$(riscv-march-y) -mstrict-align -mcmodel=medany
> +
> +# TODO: Drop override and SYMBOLS_DUMMY_OBJ when more
> +# of the build is working
> +override ALL_OBJS-y = arch/$(TARGET_ARCH)/built_in.o
> +override ALL_LIBS-y =
> +ifneq ($(wildcard $(objtree)/common/symbols-dummy.o),)
> +SYMBOLS_DUMMY_OBJ=$(objtree)/common/symbols-dummy.o
> +else
> +SYMBOLS_DUMMY_OBJ=
> +endif

Why do you need the ifneq here?

> diff --git a/xen/arch/riscv/include/asm/config.h b/xen/arch/riscv/include/asm/config.h
> index e2ae21de61..756607a4a2 100644
> --- a/xen/arch/riscv/include/asm/config.h
> +++ b/xen/arch/riscv/include/asm/config.h
> @@ -28,7 +28,7 @@
>   
>   /* Linkage for RISCV */
>   #ifdef __ASSEMBLY__
> -#define ALIGN .align 2
> +#define ALIGN .align 4

Can you explain in the commit message why you need to change this? But 
ideally, this change should be part of a separate one.

>   
>   #define ENTRY(name)                                \
>     .globl name;                                     \
> @@ -36,6 +36,30 @@
>     name:
>   #endif
>   
> +/*
> + * Definition of XEN_VIRT_START should look like:
> + *   define XEN_VIRT_START _AT(vaddr_t,0x00200000)
> + * It requires including of additional headers which
> + * will increase an amount of files unnecessary for
> + * minimal RISC-V Xen build so set value of
> + * XEN_VIRT_START explicitly.
> + *
> + * TODO: change it to _AT(vaddr_t,0x00200000) when
> + *       necessary header will be pushed.

The address here doesn't match the one below. I know this is an example 
but this is fairly confusing.

> + */
> +#define XEN_VIRT_START  0x80200000

I think you at least want to use _AT(unsigned long, ...) here to make 
clear this value should be interpreted as an unsigned value.

You could even define vaddr_t now as you introduce a dummy types.h below.

> +/*
> + * PAGE_SIZE is defined in <{asm,xen}/page-*.h> but to
> + * remove unnecessary headers for minimal
> + * build headers it will be better to set PAGE_SIZE
> + * explicitly.

TBH, I think this is a shortcut that is unnecessary and will only 
introduce extra churn in the future (for instance, you will need to 
modify the include in xen.lds.S).

But I am not the maintainer, so I will leave that decision to them 
whether this is acceptable.

> + *
> + * TODO: remove it when <asm/page-*.h> will be needed
> + *       defintion of PAGE_SIZE should be remove from

s/defintion/definition/

> + *       this header.
> + */
> +#define PAGE_SIZE       4096 > +
>   #endif /* __RISCV_CONFIG_H__ */
>   /*
>    * Local variables:
> diff --git a/xen/arch/riscv/include/asm/types.h b/xen/arch/riscv/include/asm/types.h
> new file mode 100644
> index 0000000000..afbca6b15c
> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/types.h
> @@ -0,0 +1,11 @@
> +#ifndef __TYPES_H__
> +#define __TYPES_H__
> +
> +/*
> + *
> + * asm/types.h is required for xen-syms.S file which
> + * is produced by tools/symbols.
> + *
> + */
> +
> +#endif
> diff --git a/xen/arch/riscv/riscv64/Makefile b/xen/arch/riscv/riscv64/Makefile
> index 15a4a65f66..3340058c08 100644
> --- a/xen/arch/riscv/riscv64/Makefile
> +++ b/xen/arch/riscv/riscv64/Makefile
> @@ -1 +1 @@
> -extra-y += head.o
> +obj-y += head.o

This changes want to be explained. So does...

> diff --git a/xen/arch/riscv/riscv64/head.S b/xen/arch/riscv/riscv64/head.S
> index 0dbc27ba75..0330b29c01 100644
> --- a/xen/arch/riscv/riscv64/head.S
> +++ b/xen/arch/riscv/riscv64/head.S
> @@ -1,6 +1,6 @@
>   #include <asm/config.h>
>   
> -        .text
> +        .section .text.header, "ax", %progbits

... AFAICT this is to match the recent change in the build system.

>   
>   ENTRY(start)
>           j  start
> diff --git a/xen/arch/riscv/xen.lds.S b/xen/arch/riscv/xen.lds.S
> new file mode 100644
> index 0000000000..60628b3856
> --- /dev/null
> +++ b/xen/arch/riscv/xen.lds.S
> @@ -0,0 +1,69 @@
> +#include <xen/xen.lds.h>
> +
> +#undef ENTRY
> +#undef ALIGN
> +
> +OUTPUT_ARCH(riscv)
> +ENTRY(start)
> +
> +PHDRS
> +{
> +  text PT_LOAD ;
> +#if defined(BUILD_ID)
> +  note PT_NOTE ;
> +#endif
> +}
> +
> +SECTIONS
> +{
> +  . = XEN_VIRT_START;
> +  _start = .;
> +  .text : {
> +        _stext = .;
> +       *(.text.header)
> +       *(.text)

You are missing some sections here such as .text.cold, .text.unlikely...

I understand they are probably not used yet. But it will avoid any nasty 
surprise if they are forgotten.

> +       *(.gnu.warning)
> +       . = ALIGN(POINTER_ALIGN);
> +       _etext = .;
> +  } :text
> +
> +    . = ALIGN(PAGE_SIZE);
> +  .rodata : {
> +        _srodata = .;

You introduce _srodata but I can't find the matching _erodata.

> +       *(.rodata)
> +       *(.rodata.*)
> +       *(.data.rel.ro)
> +       *(.data.rel.ro.*)
> +  } :text
> +
> +#if defined(BUILD_ID)
> +  . = ALIGN(4);
> +  .note.gnu.build-id : {
> +       __note_gnu_build_id_start = .;
> +       *(.note.gnu.build-id)
> +       __note_gnu_build_id_end = .;
> +  } :note :text
> +#endif
> +
> +  . = ALIGN(PAGE_SIZE);
> +  .data : { /* Data */
> +       *(.data .data.*)

It would be better if you introduce .data.read_mostly right now separately.

You also want *.data.page_aligned in .data.

Lastly you are missing CONSTRUCTORS

> +  } :text
> +

I am assuming you are going to add .init.* afterwards?

> +  . = ALIGN(PAGE_SIZE);
> +  .bss : {
> +       __bss_start = .;
> +       *(.bss .bss.*)
> +       . = ALIGN(POINTER_ALIGN);
> +       __bss_end = .;

Same as .data, I would recommend to properly populate it.

Cheers,

-- 
Julien Grall

