Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3923870CE
	for <lists+xen-devel@lfdr.de>; Tue, 18 May 2021 06:59:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.128598.241404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1liroG-0004zV-HV; Tue, 18 May 2021 04:58:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 128598.241404; Tue, 18 May 2021 04:58:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1liroG-0004xQ-E3; Tue, 18 May 2021 04:58:24 +0000
Received: by outflank-mailman (input) for mailman id 128598;
 Tue, 18 May 2021 04:58:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k696=KN=gmail.com=connojdavis@srs-us1.protection.inumbo.net>)
 id 1liroF-0004xK-9j
 for xen-devel@lists.xenproject.org; Tue, 18 May 2021 04:58:23 +0000
Received: from mail-oo1-xc2e.google.com (unknown [2607:f8b0:4864:20::c2e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f52ece38-9ff9-4977-af32-efcf8a780231;
 Tue, 18 May 2021 04:58:21 +0000 (UTC)
Received: by mail-oo1-xc2e.google.com with SMTP id
 j17-20020a4ad6d10000b02901fef5280522so1978187oot.0
 for <xen-devel@lists.xenproject.org>; Mon, 17 May 2021 21:58:21 -0700 (PDT)
Received: from [192.168.99.80] (142-79-211-230.starry-inc.net.
 [142.79.211.230])
 by smtp.gmail.com with ESMTPSA id j16sm3585479otn.55.2021.05.17.21.58.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 May 2021 21:58:20 -0700 (PDT)
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
X-Inumbo-ID: f52ece38-9ff9-4977-af32-efcf8a780231
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=h7CSCLY6qNiPcBHyu63u237ERyyaZGO07dKlZAetLi4=;
        b=BPPv7Gmc0r6DqkIQ0FqK0PI2YxzeBRNFCE/Ks1JXekfpgOel7XPz3ze+GyrCo6aZM5
         ESVpw2A9bBqNNdw0NQEMyCGUVnua+pdcwXLnmy8ag+A58Wpg4Mzhr8aN7iJuQsEFHjPU
         fzZB2MQPi0boQSPUXlcVWb/71tFfeZcDHmqSSNq1piXC7UzltaIE1y2h8zNCWOvtr6ZS
         KH4+NpYVBVKFdOGYhe3kO7HeiGPOUwr9QHYZ58A/xFeGh8Rc7w32606ZyMN6QvTUli0h
         SWnQFxWQ9JdwQ0neBadyoNLloD7VEGVAujUwkdeepGqZhS/hrJ6Srt1g7/iPjp1nfRDs
         WHsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=h7CSCLY6qNiPcBHyu63u237ERyyaZGO07dKlZAetLi4=;
        b=q6rrVlSILOva426o0Ma1cKHUOCrWxgMrb7aWHKaBM5YDxPnMr42zSdp1GIgCROGrtB
         a7IplTUBD/hdkn4AjhoXDdoOqQUeWYsJGX2H5CbVFn8YTxvjCHFUZgqdMsMSbF19alO1
         Gbqymh3LrtLRUqwsKBSnUqkHXReI8KDvKa+Elz3qk03pTFtjL7M1PSdazDEHFJarDvgN
         3AJLnraIfsQ00xz0Z/DQ93iI18kPJTyB7ufHrGYrAreko+SZ+zKDH3usggqnRikYRwec
         pvXsiJDQrpmud5QXD4KVwMSqz3g4sECRP+uQ11ZCI0TIaiahjmyhmh84ip59mM0CzYtC
         aKGw==
X-Gm-Message-State: AOAM5324jLMyS1vdtk84CSQ7UpM6861cQFmsHJUQ27bRJzxrVQX7XBnP
	7/IH6+s4WhyiBeUfS12LrLhRjIrGqmL1iw==
X-Google-Smtp-Source: ABdhPJztjqttf4ZqXSjCXU1z2F62/GP7QsvHbNFCkgSaDskmReEYI81Cbxa8h/0KsFJFS0+fef/KbA==
X-Received: by 2002:a4a:925c:: with SMTP id g28mr58372ooh.65.1621313901063;
        Mon, 17 May 2021 21:58:21 -0700 (PDT)
Subject: Re: [PATCH v3 4/5] xen: Add files needed for minimal riscv build
To: Jan Beulich <jbeulich@suse.com>
Cc: Bobby Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair23@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1621017334.git.connojdavis@gmail.com>
 <a7d2d43d0d9de9e10a3e92bc6f977d6f4b53bef6.1621017334.git.connojdavis@gmail.com>
 <ce3ff72e-611b-3b9c-96fa-afc9e8767681@suse.com>
From: Connor Davis <connojdavis@gmail.com>
Message-ID: <95399fcf-54b0-828f-b3cb-9332ad779f68@gmail.com>
Date: Mon, 17 May 2021 22:58:42 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <ce3ff72e-611b-3b9c-96fa-afc9e8767681@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 5/17/21 5:51 AM, Jan Beulich wrote:
> On 14.05.2021 20:53, Connor Davis wrote:
>> --- /dev/null
>> +++ b/config/riscv64.mk
>> @@ -0,0 +1,5 @@
>> +CONFIG_RISCV := y
>> +CONFIG_RISCV_64 := y
>> +CONFIG_RISCV_$(XEN_OS) := y
> I wonder whether the last one actually gets used anywhere, but I do
> realize that other architectures have similar definitions.
>
>> --- a/xen/Makefile
>> +++ b/xen/Makefile
>> @@ -26,7 +26,9 @@ MAKEFLAGS += -rR
>>   EFI_MOUNTPOINT ?= $(BOOT_DIR)/efi
>>   
>>   ARCH=$(XEN_TARGET_ARCH)
>> -SRCARCH=$(shell echo $(ARCH) | sed -e 's/x86.*/x86/' -e s'/arm\(32\|64\)/arm/g')
>> +SRCARCH=$(shell echo $(ARCH) | \
>> +	  sed -e 's/x86.*/x86/' -e s'/arm\(32\|64\)/arm/g' \
>> +	      -e s'/riscv.*/riscv/g')
> I think in makefiles tab indentation would better be restricted to
> rules. While here it's a minor nit, ...
>
>> @@ -35,7 +37,8 @@ include $(XEN_ROOT)/Config.mk
>>   # Set ARCH/SUBARCH appropriately.
>>   export TARGET_SUBARCH  := $(XEN_TARGET_ARCH)
>>   export TARGET_ARCH     := $(shell echo $(XEN_TARGET_ARCH) | \
>> -                            sed -e 's/x86.*/x86/' -e s'/arm\(32\|64\)/arm/g')
>> +                            sed -e 's/x86.*/x86/' -e s'/arm\(32\|64\)/arm/g' \
>> +			        -e s'/riscv.*/riscv/g')
> ... here you're actually introducing locally inconsistent indentation.
>
>> --- /dev/null
>> +++ b/xen/arch/riscv/Kconfig
>> @@ -0,0 +1,52 @@
>> +config 64BIT
>> +	bool
> I'm afraid this is stale now - the option now lives in xen/arch/Kconfig,
> available to all architectures.
>
>> +config RISCV_64
>> +	bool
>> +	depends on 64BIT
> Such a "depends on" is relatively pointless - they're more important to
> have when there is a prompt.
>
>> +config ARCH_DEFCONFIG
>> +	string
>> +	default "arch/riscv/configs/riscv64_defconfig" if RISCV_64
> For the RISCV_64 dependency to be really useful (at least with the
> command line kconfig), you want its selection to live above the use.
>
>> +menu "Architecture Features"
>> +
>> +source "arch/Kconfig"
>> +
>> +endmenu
>> +
>> +menu "ISA Selection"
>> +
>> +choice
>> +	prompt "Base ISA"
>> +        default RISCV_ISA_RV64IMA
>> +        help
>> +          This selects the base ISA extensions that Xen will target.
>> +
>> +config RISCV_ISA_RV64IMA
>> +	bool "RV64IMA"
>> +        select 64BIT
>> +        select RISCV_64
> I think you want only the latter here, and the former done by RISCV_64
> (or select the former here, and have "default y if 64BIT" at RISCV_64).
> That way, not every party wanting 64-bit has to select both.
>
>> +        help
>> +           Use the RV64I base ISA, plus the "M" and "A" extensions
>> +           for integer multiply/divide and atomic instructions, respectively.
>> +
>> +endchoice
>> +
>> +config RISCV_ISA_C
>> +	bool "Compressed extension"
>> +        help
>> +           Add "C" to the ISA subsets that the toolchain is allowed
>> +           to emit when building Xen, which results in compressed
>> +           instructions in the Xen binary.
>> +
>> +           If unsure, say N.
> For all of the above, please adjust indentation to be consistent with
> (the bulk of) what we have elsewhere.
Will do
>> --- /dev/null
>> +++ b/xen/arch/riscv/arch.mk
>> @@ -0,0 +1,16 @@
>> +########################################
>> +# RISCV-specific definitions
>> +
>> +ifeq ($(CONFIG_RISCV_64),y)
>> +    CFLAGS += -mabi=lp64
>> +endif
> Wherever possible I think we should prefer the list approach:
>
> CFLAGS-$(CONFIG_RISCV_64) += -mabi=lp64
>
>> --- /dev/null
>> +++ b/xen/arch/riscv/configs/riscv64_defconfig
>> @@ -0,0 +1,12 @@
>> +# CONFIG_SCHED_CREDIT is not set
>> +# CONFIG_SCHED_RTDS is not set
>> +# CONFIG_SCHED_NULL is not set
>> +# CONFIG_SCHED_ARINC653 is not set
>> +# CONFIG_TRACEBUFFER is not set
>> +# CONFIG_DEBUG is not set
>> +# CONFIG_DEBUG_INFO is not set
>> +# CONFIG_HYPFS is not set
>> +# CONFIG_GRANT_TABLE is not set
>> +# CONFIG_SPECULATIVE_HARDEN_ARRAY is not set
>> +
>> +CONFIG_EXPERT=y
> These are rather odd defaults, more like for a special purpose
> config than a general purpose one. None of what you turn off here
> will guarantee to be off for people actually trying to build
> things, so it's not clear to me what the idea here is. As a
> specific remark, especially during bringup work I think it is
> quite important to not default DEBUG to off: You definitely want
> to see whether any assertions trigger.
The idea was to turn off as much stuff as possible to get a minimal
build (involving xen/common) working. Although now that we're focused on
only a few files at a time, they could be enabled without adding any
undue burden (at least for now).

Perhaps it would be best to rename the file to include "tiny" or something,
and then add a normal defconfig once things are actually running?

At any rate, agreed on the DEBUG setting, I will enable that.
>> --- /dev/null
>> +++ b/xen/include/asm-riscv/config.h
>> @@ -0,0 +1,110 @@
>> +/******************************************************************************
>> + * config.h
>> + *
>> + * A Linux-style configuration list.
> May I suggest to not further replicate this now inapplicable
> comment? It was already somewhat bogus for Arm to clone from x86.
Sure thing.
>
>> + */
>> +
>> +#ifndef __RISCV_CONFIG_H__
>> +#define __RISCV_CONFIG_H__
>> +
>> +#if defined(CONFIG_RISCV_64)
>> +# define LONG_BYTEORDER 3
>> +# define ELFSIZE 64
>> +#else
>> +# error "Unsupported RISCV variant"
>> +#endif
>> +
>> +#define BYTES_PER_LONG (1 << LONG_BYTEORDER)
>> +#define BITS_PER_LONG  (BYTES_PER_LONG << 3)
>> +#define POINTER_ALIGN  BYTES_PER_LONG
>> +
>> +#define BITS_PER_LLONG 64
>> +
>> +/* xen_ulong_t is always 64 bits */
>> +#define BITS_PER_XEN_ULONG 64
>> +
>> +#define CONFIG_RISCV 1
> This duplicates a "real" Kconfig setting, doesn't it?
Yes, will remove, thanks
>
>> +#define CONFIG_RISCV_L1_CACHE_SHIFT 6
>> +
>> +#define CONFIG_PAGEALLOC_MAX_ORDER 18
>> +#define CONFIG_DOMU_MAX_ORDER      9
>> +#define CONFIG_HWDOM_MAX_ORDER     10
>> +
>> +#define OPT_CONSOLE_STR "dtuart"
>> +
>> +#ifdef CONFIG_RISCV_64
>> +#define MAX_VIRT_CPUS 128u
>> +#else
>> +#error "Unsupported RISCV variant"
>> +#endif
> Could this be folded with the other similar construct further up?
Yep, will do.

Thanks,
Connor

