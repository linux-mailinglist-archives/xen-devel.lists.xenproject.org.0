Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB85382B7D
	for <lists+xen-devel@lfdr.de>; Mon, 17 May 2021 13:51:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.128186.240699 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1libmB-0007Gm-MS; Mon, 17 May 2021 11:51:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 128186.240699; Mon, 17 May 2021 11:51:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1libmB-0007Dg-J8; Mon, 17 May 2021 11:51:11 +0000
Received: by outflank-mailman (input) for mailman id 128186;
 Mon, 17 May 2021 11:51:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FIJu=KM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1libmA-0007Da-Jn
 for xen-devel@lists.xenproject.org; Mon, 17 May 2021 11:51:10 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f41515cf-504f-46e3-9321-7846ee63903d;
 Mon, 17 May 2021 11:51:07 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7B673AD9F;
 Mon, 17 May 2021 11:51:06 +0000 (UTC)
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
X-Inumbo-ID: f41515cf-504f-46e3-9321-7846ee63903d
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1621252266; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hNgqxTeEaaedrCQZvAxUUKMN+PMgdcQJkWDCdUu/0FM=;
	b=DGxOcKyLjpnV2boVs4M2hetRyt0QSgVKhxgnQgEstG7ROln+dDO9gL2YwVf4qRizlFfWXa
	/1NnBDjjmAlEM33f6FDTAQDi0c16Oph9InXYvJ4UWbMnmi/KoFYCf5YQBo2GbmghwuLplL
	UQ8zjIJzcKQtVvmCe8oFrfxc/tSkQUw=
Subject: Re: [PATCH v3 4/5] xen: Add files needed for minimal riscv build
To: Connor Davis <connojdavis@gmail.com>
Cc: Bobby Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair23@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1621017334.git.connojdavis@gmail.com>
 <a7d2d43d0d9de9e10a3e92bc6f977d6f4b53bef6.1621017334.git.connojdavis@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ce3ff72e-611b-3b9c-96fa-afc9e8767681@suse.com>
Date: Mon, 17 May 2021 13:51:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <a7d2d43d0d9de9e10a3e92bc6f977d6f4b53bef6.1621017334.git.connojdavis@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 14.05.2021 20:53, Connor Davis wrote:
> --- /dev/null
> +++ b/config/riscv64.mk
> @@ -0,0 +1,5 @@
> +CONFIG_RISCV := y
> +CONFIG_RISCV_64 := y
> +CONFIG_RISCV_$(XEN_OS) := y

I wonder whether the last one actually gets used anywhere, but I do
realize that other architectures have similar definitions.

> --- a/xen/Makefile
> +++ b/xen/Makefile
> @@ -26,7 +26,9 @@ MAKEFLAGS += -rR
>  EFI_MOUNTPOINT ?= $(BOOT_DIR)/efi
>  
>  ARCH=$(XEN_TARGET_ARCH)
> -SRCARCH=$(shell echo $(ARCH) | sed -e 's/x86.*/x86/' -e s'/arm\(32\|64\)/arm/g')
> +SRCARCH=$(shell echo $(ARCH) | \
> +	  sed -e 's/x86.*/x86/' -e s'/arm\(32\|64\)/arm/g' \
> +	      -e s'/riscv.*/riscv/g')

I think in makefiles tab indentation would better be restricted to
rules. While here it's a minor nit, ...

> @@ -35,7 +37,8 @@ include $(XEN_ROOT)/Config.mk
>  # Set ARCH/SUBARCH appropriately.
>  export TARGET_SUBARCH  := $(XEN_TARGET_ARCH)
>  export TARGET_ARCH     := $(shell echo $(XEN_TARGET_ARCH) | \
> -                            sed -e 's/x86.*/x86/' -e s'/arm\(32\|64\)/arm/g')
> +                            sed -e 's/x86.*/x86/' -e s'/arm\(32\|64\)/arm/g' \
> +			        -e s'/riscv.*/riscv/g')

... here you're actually introducing locally inconsistent indentation.

> --- /dev/null
> +++ b/xen/arch/riscv/Kconfig
> @@ -0,0 +1,52 @@
> +config 64BIT
> +	bool

I'm afraid this is stale now - the option now lives in xen/arch/Kconfig,
available to all architectures.

> +config RISCV_64
> +	bool
> +	depends on 64BIT

Such a "depends on" is relatively pointless - they're more important to
have when there is a prompt.

> +config ARCH_DEFCONFIG
> +	string
> +	default "arch/riscv/configs/riscv64_defconfig" if RISCV_64

For the RISCV_64 dependency to be really useful (at least with the
command line kconfig), you want its selection to live above the use.

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
> +        default RISCV_ISA_RV64IMA
> +        help
> +          This selects the base ISA extensions that Xen will target.
> +
> +config RISCV_ISA_RV64IMA
> +	bool "RV64IMA"
> +        select 64BIT
> +        select RISCV_64

I think you want only the latter here, and the former done by RISCV_64
(or select the former here, and have "default y if 64BIT" at RISCV_64).
That way, not every party wanting 64-bit has to select both.

> +        help
> +           Use the RV64I base ISA, plus the "M" and "A" extensions
> +           for integer multiply/divide and atomic instructions, respectively.
> +
> +endchoice
> +
> +config RISCV_ISA_C
> +	bool "Compressed extension"
> +        help
> +           Add "C" to the ISA subsets that the toolchain is allowed
> +           to emit when building Xen, which results in compressed
> +           instructions in the Xen binary.
> +
> +           If unsure, say N.

For all of the above, please adjust indentation to be consistent with
(the bulk of) what we have elsewhere.

> --- /dev/null
> +++ b/xen/arch/riscv/arch.mk
> @@ -0,0 +1,16 @@
> +########################################
> +# RISCV-specific definitions
> +
> +ifeq ($(CONFIG_RISCV_64),y)
> +    CFLAGS += -mabi=lp64
> +endif

Wherever possible I think we should prefer the list approach:

CFLAGS-$(CONFIG_RISCV_64) += -mabi=lp64

> --- /dev/null
> +++ b/xen/arch/riscv/configs/riscv64_defconfig
> @@ -0,0 +1,12 @@
> +# CONFIG_SCHED_CREDIT is not set
> +# CONFIG_SCHED_RTDS is not set
> +# CONFIG_SCHED_NULL is not set
> +# CONFIG_SCHED_ARINC653 is not set
> +# CONFIG_TRACEBUFFER is not set
> +# CONFIG_DEBUG is not set
> +# CONFIG_DEBUG_INFO is not set
> +# CONFIG_HYPFS is not set
> +# CONFIG_GRANT_TABLE is not set
> +# CONFIG_SPECULATIVE_HARDEN_ARRAY is not set
> +
> +CONFIG_EXPERT=y

These are rather odd defaults, more like for a special purpose
config than a general purpose one. None of what you turn off here
will guarantee to be off for people actually trying to build
things, so it's not clear to me what the idea here is. As a
specific remark, especially during bringup work I think it is
quite important to not default DEBUG to off: You definitely want
to see whether any assertions trigger.

> --- /dev/null
> +++ b/xen/include/asm-riscv/config.h
> @@ -0,0 +1,110 @@
> +/******************************************************************************
> + * config.h
> + *
> + * A Linux-style configuration list.

May I suggest to not further replicate this now inapplicable
comment? It was already somewhat bogus for Arm to clone from x86.

> + */
> +
> +#ifndef __RISCV_CONFIG_H__
> +#define __RISCV_CONFIG_H__
> +
> +#if defined(CONFIG_RISCV_64)
> +# define LONG_BYTEORDER 3
> +# define ELFSIZE 64
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
> +#define CONFIG_RISCV 1

This duplicates a "real" Kconfig setting, doesn't it?

> +#define CONFIG_RISCV_L1_CACHE_SHIFT 6
> +
> +#define CONFIG_PAGEALLOC_MAX_ORDER 18
> +#define CONFIG_DOMU_MAX_ORDER      9
> +#define CONFIG_HWDOM_MAX_ORDER     10
> +
> +#define OPT_CONSOLE_STR "dtuart"
> +
> +#ifdef CONFIG_RISCV_64
> +#define MAX_VIRT_CPUS 128u
> +#else
> +#error "Unsupported RISCV variant"
> +#endif

Could this be folded with the other similar construct further up?

Jan

