Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B9D23A0139
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jun 2021 21:08:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.138930.257035 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqh5E-0004Pr-LN; Tue, 08 Jun 2021 19:08:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 138930.257035; Tue, 08 Jun 2021 19:08:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqh5E-0004Mv-I6; Tue, 08 Jun 2021 19:08:16 +0000
Received: by outflank-mailman (input) for mailman id 138930;
 Tue, 08 Jun 2021 19:08:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MP2/=LC=gmail.com=bobbyeshleman@srs-us1.protection.inumbo.net>)
 id 1lqh5C-0004Mp-W4
 for xen-devel@lists.xenproject.org; Tue, 08 Jun 2021 19:08:15 +0000
Received: from mail-pg1-x52e.google.com (unknown [2607:f8b0:4864:20::52e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7194ff7a-b54a-4a85-b107-eb451ff6d210;
 Tue, 08 Jun 2021 19:08:13 +0000 (UTC)
Received: by mail-pg1-x52e.google.com with SMTP id y12so5470310pgk.6
 for <xen-devel@lists.xenproject.org>; Tue, 08 Jun 2021 12:08:13 -0700 (PDT)
Received: from [192.168.0.7] ([75.164.44.148])
 by smtp.gmail.com with ESMTPSA id j9sm15736870pjy.25.2021.06.08.12.08.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 12:08:11 -0700 (PDT)
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
X-Inumbo-ID: 7194ff7a-b54a-4a85-b107-eb451ff6d210
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=uj8cs4tAOqs8gD6/bSimGTktOgMVbmEbSzaXj2omFfo=;
        b=PExyHtLqwMxsg2nnqp98Cx4LzXn5hX6WVhGa7RvXsbckN/Ed1gqxzLhMNQqDN1P1Dw
         9d22LApcZBuI9HAnKBMpuT04OnwCsP9W9ri1f8adeMTNLobDsp26EJJx84islV8wUysA
         axxoTqa7GTB8Q3/UfNfimunuI6Rj5GYS3zO2C1kKk8wiv49Cz6Js4zH/3aOQKBecC+hR
         VHSeRfiwXFSAVCv4pOaPvm8sWVgFkclpdsrJeEgY1Xih8Tgcg0ahcJVMpUe+X5E9c6Lp
         6FEhvNtegqurM/FeG0qquArE6jvsGafXAC/r3uBzLuDTpbIZWxZG8tACyZ/1sSUgYq/x
         3ggw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=uj8cs4tAOqs8gD6/bSimGTktOgMVbmEbSzaXj2omFfo=;
        b=V9tXQGPs9/DWpKxZ/trX1IYb1ZKEEAZbhnpPkaQ6+lf7iWCjHnwogJQtd/9RnQyFaf
         drydzrZ9oXTpD6czhUwpHoQZYYCc//A4SFwvIEYR1ISvsraas7mXDBgCOfJcT3OLY3o7
         1N9ldqOJO68jDMFSWSQZ/2TtY3yhDncM+t3CWEE3p6cNx7LT30UdWIexPFBf+yMa7dwI
         HyPRIJW3ZSJcRG58tHJvz1ZjA/ccNo/v4HW4+OiTwtq7phusmkc1kk0gfR7JaTMUGmKR
         0SBrWiD21RPxQzk1kfazNsTK7py0qFXhgohlGVJdya+amEIO9Ck2kIn+7kTMuLhKlvgg
         qSQQ==
X-Gm-Message-State: AOAM533ep5yEZY+VM9Vu0RgMhq6/bUOohXlXMfTbswaH5IVfRHvUTytp
	FzJJAWlsef6EwVDcFjl0DV0=
X-Google-Smtp-Source: ABdhPJxrSZvIvsJEYL9r4Iffk1Gex1ZqRlRjpWNKhiDaPtu8gM4rNWFKjI2MMd7xSJ7Lhc168K88Ng==
X-Received: by 2002:a62:2987:0:b029:2de:b564:648d with SMTP id p129-20020a6229870000b02902deb564648dmr1391028pfp.48.1623179292514;
        Tue, 08 Jun 2021 12:08:12 -0700 (PDT)
Subject: Re: [PATCH v8 2/2] xen: Add files needed for minimal riscv build
To: Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
Cc: Alistair Francis <alistair23@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Alistair Francis <alistair.francis@wdc.com>
References: <cover.1622772299.git.connojdavis@gmail.com>
 <4337d3cd6891b34f534d85ca62712bd3b446edf8.1622772299.git.connojdavis@gmail.com>
From: Bob Eshleman <bobbyeshleman@gmail.com>
Organization: Vates SAS
Message-ID: <38ffb102-a403-23d6-8b0b-607a8cd3d515@gmail.com>
Date: Tue, 8 Jun 2021 12:08:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <4337d3cd6891b34f534d85ca62712bd3b446edf8.1622772299.git.connojdavis@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 6/3/21 7:14 PM, Connor Davis wrote:
> Add arch-specific makefiles and configs needed to build for
> riscv. Also add a minimal head.S that is a simple infinite loop.
> head.o can be built with
> 
> $ make XEN_TARGET_ARCH=riscv64 SUBSYSTEMS=xen -C xen tiny64_defconfig
> $ make XEN_TARGET_ARCH=riscv64 SUBSYSTEMS=xen -C xen TARGET=riscv64/head.o
> 
> No other TARGET is supported at the moment.
> 
> Signed-off-by: Connor Davis <connojdavis@gmail.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  MAINTAINERS                             |  9 +++++
>  config/riscv64.mk                       |  5 +++
>  xen/Makefile                            |  8 +++--
>  xen/arch/riscv/Kconfig                  | 48 +++++++++++++++++++++++++
>  xen/arch/riscv/Kconfig.debug            |  0
>  xen/arch/riscv/Makefile                 |  2 ++
>  xen/arch/riscv/Rules.mk                 |  0
>  xen/arch/riscv/arch.mk                  | 14 ++++++++
>  xen/arch/riscv/configs/tiny64_defconfig | 13 +++++++
>  xen/arch/riscv/riscv64/asm-offsets.c    |  0
>  xen/arch/riscv/riscv64/head.S           |  6 ++++
>  xen/include/asm-riscv/config.h          | 47 ++++++++++++++++++++++++
>  12 files changed, 150 insertions(+), 2 deletions(-)
>  create mode 100644 config/riscv64.mk
>  create mode 100644 xen/arch/riscv/Kconfig
>  create mode 100644 xen/arch/riscv/Kconfig.debug
>  create mode 100644 xen/arch/riscv/Makefile
>  create mode 100644 xen/arch/riscv/Rules.mk
>  create mode 100644 xen/arch/riscv/arch.mk
>  create mode 100644 xen/arch/riscv/configs/tiny64_defconfig
>  create mode 100644 xen/arch/riscv/riscv64/asm-offsets.c
>  create mode 100644 xen/arch/riscv/riscv64/head.S
>  create mode 100644 xen/include/asm-riscv/config.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d46b08a0d2..5a1f92422a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -456,6 +456,15 @@ F:	tools/libs/light/libxl_nonetbuffer.c
>  F:	tools/hotplug/Linux/remus-netbuf-setup
>  F:	tools/hotplug/Linux/block-drbd-probe
>  
> +RISCV
> +M:	Bob Eshleman <bobbyeshleman@gmail.com>
> +M:	Alistair Francis <alistair.francis@wdc.com>
> +R:	Connor Davis <connojdavis@gmail.com>
> +S:	Supported
> +F:	config/riscv64.mk
> +F:	xen/arch/riscv/
> +F:	xen/include/asm-riscv/
> +
>  RTDS SCHEDULER
>  M:	Dario Faggioli <dfaggioli@suse.com>
>  M:	Meng Xu <mengxu@cis.upenn.edu>
> diff --git a/config/riscv64.mk b/config/riscv64.mk
> new file mode 100644
> index 0000000000..a5a21e5fa2
> --- /dev/null
> +++ b/config/riscv64.mk
> @@ -0,0 +1,5 @@
> +CONFIG_RISCV := y
> +CONFIG_RISCV_64 := y
> +CONFIG_RISCV_$(XEN_OS) := y
> +
> +CONFIG_XEN_INSTALL_SUFFIX :=
> diff --git a/xen/Makefile b/xen/Makefile
> index 7ce7692354..89879fad4c 100644
> --- a/xen/Makefile
> +++ b/xen/Makefile
> @@ -26,7 +26,9 @@ MAKEFLAGS += -rR
>  EFI_MOUNTPOINT ?= $(BOOT_DIR)/efi
>  
>  ARCH=$(XEN_TARGET_ARCH)
> -SRCARCH=$(shell echo $(ARCH) | sed -e 's/x86.*/x86/' -e s'/arm\(32\|64\)/arm/g')
> +SRCARCH=$(shell echo $(ARCH) | \
> +          sed -e 's/x86.*/x86/' -e s'/arm\(32\|64\)/arm/g' \
> +              -e s'/riscv.*/riscv/g')
>  
>  # Don't break if the build process wasn't called from the top level
>  # we need XEN_TARGET_ARCH to generate the proper config
> @@ -35,7 +37,8 @@ include $(XEN_ROOT)/Config.mk
>  # Set ARCH/SUBARCH appropriately.
>  export TARGET_SUBARCH  := $(XEN_TARGET_ARCH)
>  export TARGET_ARCH     := $(shell echo $(XEN_TARGET_ARCH) | \
> -                            sed -e 's/x86.*/x86/' -e s'/arm\(32\|64\)/arm/g')
> +                            sed -e 's/x86.*/x86/' -e s'/arm\(32\|64\)/arm/g' \
> +                                -e s'/riscv.*/riscv/g')
>  
>  # Allow someone to change their config file
>  export KCONFIG_CONFIG ?= .config
> @@ -335,6 +338,7 @@ _clean: delete-unfresh-files
>  	$(MAKE) $(clean) xsm
>  	$(MAKE) $(clean) crypto
>  	$(MAKE) $(clean) arch/arm
> +	$(MAKE) $(clean) arch/riscv
>  	$(MAKE) $(clean) arch/x86
>  	$(MAKE) $(clean) test
>  	$(MAKE) -f $(BASEDIR)/tools/kconfig/Makefile.kconfig ARCH=$(ARCH) SRCARCH=$(SRCARCH) clean
> diff --git a/xen/arch/riscv/Kconfig b/xen/arch/riscv/Kconfig
> new file mode 100644
> index 0000000000..468e250c86
> --- /dev/null
> +++ b/xen/arch/riscv/Kconfig
> @@ -0,0 +1,48 @@
> +config RISCV
> +	def_bool y
> +
> +config RISCV_64
> +	def_bool y
> +	select 64BIT
> +
> +config ARCH_DEFCONFIG
> +	string
> +	default "arch/riscv/configs/tiny64_defconfig"
> +
> +menu "Architecture Features"
> +
> +source "arch/Kconfig"
> +
> +endmenu
> +
> +menu "ISA Selection"
> +
> +choice
> +	prompt "Base ISA"
> +	default RISCV_ISA_RV64IMA if RISCV_64
> +	help
> +	  This selects the base ISA extensions that Xen will target.
> +
> +config RISCV_ISA_RV64IMA
> +	bool "RV64IMA"
> +	help
> +	  Use the RV64I base ISA, plus the "M" and "A" extensions
> +	  for integer multiply/divide and atomic instructions, respectively.
> +
> +endchoice
> +
> +config RISCV_ISA_C
> +	bool "Compressed extension"
> +	default y
> +	help
> +	  Add "C" to the ISA subsets that the toolchain is allowed to
> +	  emit when building Xen, which results in compressed instructions
> +	  in the Xen binary.
> +
> +	  If unsure, say Y.
> +
> +endmenu
> +
> +source "common/Kconfig"
> +
> +source "drivers/Kconfig"
> diff --git a/xen/arch/riscv/Kconfig.debug b/xen/arch/riscv/Kconfig.debug
> new file mode 100644
> index 0000000000..e69de29bb2
> diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
> new file mode 100644
> index 0000000000..942e4ffbc1
> --- /dev/null
> +++ b/xen/arch/riscv/Makefile
> @@ -0,0 +1,2 @@
> +.PHONY: include
> +include:
> diff --git a/xen/arch/riscv/Rules.mk b/xen/arch/riscv/Rules.mk
> new file mode 100644
> index 0000000000..e69de29bb2
> diff --git a/xen/arch/riscv/arch.mk b/xen/arch/riscv/arch.mk
> new file mode 100644
> index 0000000000..53dadb8975
> --- /dev/null
> +++ b/xen/arch/riscv/arch.mk
> @@ -0,0 +1,14 @@
> +########################################
> +# RISCV-specific definitions
> +
> +CFLAGS-$(CONFIG_RISCV_64) += -mabi=lp64
> +
> +riscv-march-$(CONFIG_RISCV_ISA_RV64IMA) := rv64ima
> +riscv-march-$(CONFIG_RISCV_ISA_C)       := $(riscv-march-y)c
> +
> +# Note that -mcmodel=medany is used so that Xen can be mapped
> +# into the upper half _or_ the lower half of the address space.
> +# -mcmodel=medlow would force Xen into the lower half.
> +
> +CFLAGS += -march=$(riscv-march-y) -mstrict-align -mcmodel=medany
> +CFLAGS += -I$(BASEDIR)/include
> diff --git a/xen/arch/riscv/configs/tiny64_defconfig b/xen/arch/riscv/configs/tiny64_defconfig
> new file mode 100644
> index 0000000000..3c9a2ff941
> --- /dev/null
> +++ b/xen/arch/riscv/configs/tiny64_defconfig
> @@ -0,0 +1,13 @@
> +# CONFIG_SCHED_CREDIT is not set
> +# CONFIG_SCHED_RTDS is not set
> +# CONFIG_SCHED_NULL is not set
> +# CONFIG_SCHED_ARINC653 is not set
> +# CONFIG_TRACEBUFFER is not set
> +# CONFIG_HYPFS is not set
> +# CONFIG_GRANT_TABLE is not set
> +# CONFIG_SPECULATIVE_HARDEN_ARRAY is not set
> +
> +CONFIG_RISCV_64=y
> +CONFIG_DEBUG=y
> +CONFIG_DEBUG_INFO=y
> +CONFIG_EXPERT=y
> diff --git a/xen/arch/riscv/riscv64/asm-offsets.c b/xen/arch/riscv/riscv64/asm-offsets.c
> new file mode 100644
> index 0000000000..e69de29bb2
> diff --git a/xen/arch/riscv/riscv64/head.S b/xen/arch/riscv/riscv64/head.S
> new file mode 100644
> index 0000000000..0dbc27ba75
> --- /dev/null
> +++ b/xen/arch/riscv/riscv64/head.S
> @@ -0,0 +1,6 @@
> +#include <asm/config.h>
> +
> +        .text
> +
> +ENTRY(start)
> +        j  start
> diff --git a/xen/include/asm-riscv/config.h b/xen/include/asm-riscv/config.h
> new file mode 100644
> index 0000000000..e2ae21de61
> --- /dev/null
> +++ b/xen/include/asm-riscv/config.h
> @@ -0,0 +1,47 @@
> +#ifndef __RISCV_CONFIG_H__
> +#define __RISCV_CONFIG_H__
> +
> +#if defined(CONFIG_RISCV_64)
> +# define LONG_BYTEORDER 3
> +# define ELFSIZE 64
> +# define MAX_VIRT_CPUS 128u
> +#else
> +# error "Unsupported RISCV variant"
> +#endif
> +
> +#define BYTES_PER_LONG (1 << LONG_BYTEORDER)
> +#define BITS_PER_LONG  (BYTES_PER_LONG << 3)
> +#define POINTER_ALIGN  BYTES_PER_LONG
> +
> +#define BITS_PER_LLONG 64
> +
> +/* xen_ulong_t is always 64 bits */
> +#define BITS_PER_XEN_ULONG 64
> +
> +#define CONFIG_RISCV_L1_CACHE_SHIFT 6
> +#define CONFIG_PAGEALLOC_MAX_ORDER  18
> +#define CONFIG_DOMU_MAX_ORDER       9
> +#define CONFIG_HWDOM_MAX_ORDER      10
> +
> +#define OPT_CONSOLE_STR "dtuart"
> +#define INVALID_VCPU_ID MAX_VIRT_CPUS
> +
> +/* Linkage for RISCV */
> +#ifdef __ASSEMBLY__
> +#define ALIGN .align 2
> +
> +#define ENTRY(name)                                \
> +  .globl name;                                     \
> +  ALIGN;                                           \
> +  name:
> +#endif
> +
> +#endif /* __RISCV_CONFIG_H__ */
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> 

Acked-by: Bobby Eshleman <bobbyeshleman@gmail.com>

