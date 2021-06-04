Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C47D39B005
	for <lists+xen-devel@lfdr.de>; Fri,  4 Jun 2021 03:49:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.136618.253225 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loyx6-00086F-06; Fri, 04 Jun 2021 01:48:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 136618.253225; Fri, 04 Jun 2021 01:48:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loyx5-00084r-TD; Fri, 04 Jun 2021 01:48:47 +0000
Received: by outflank-mailman (input) for mailman id 136618;
 Fri, 04 Jun 2021 01:48:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sjsn=K6=gmail.com=connojdavis@srs-us1.protection.inumbo.net>)
 id 1loyx4-00084l-Uq
 for xen-devel@lists.xenproject.org; Fri, 04 Jun 2021 01:48:47 +0000
Received: from mail-oi1-x22e.google.com (unknown [2607:f8b0:4864:20::22e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1ffd949a-3513-49ef-b43e-304d0b25fc09;
 Fri, 04 Jun 2021 01:48:45 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id v22so8288757oic.2
 for <xen-devel@lists.xenproject.org>; Thu, 03 Jun 2021 18:48:45 -0700 (PDT)
Received: from [192.168.99.80] (142-79-211-230.starry-inc.net.
 [142.79.211.230])
 by smtp.gmail.com with ESMTPSA id n17sm158772oij.57.2021.06.03.18.48.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Jun 2021 18:48:44 -0700 (PDT)
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
X-Inumbo-ID: 1ffd949a-3513-49ef-b43e-304d0b25fc09
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=L26ql0Ro1PUVovU7RjnHg95qVz4JfRvv+2ImX6K34AU=;
        b=HtEHUiipfDLbL5I8D1O+xDDpbAiHrHV0UBlL/Mx430t41OMCkRLlHIAMnwo7Y34StD
         qpWPyHLDDpvs6ONSCXfExnNoViQA5sznM57+TzNMqw2qhLrPgNAkP/JgnFZAFneh6W0L
         ooBjMHI6aBvoAX32+aH//eg1/VFAn3i84m48FNkSSy2O5mIouBYdRjiNg7Ez/oCyBhzX
         9yq9KYUtydyUjn3TvflTNRRcLMUxOx+bs4G/A234MxP8kUEolBbFTpsVx23mVwCJYALL
         mBCgNV4yWxHUBezCoH9mnVSe+m2/6RrIomvAgbJXZ2YfirdCCZv27Mm2R+W2jZl4sX1h
         StKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=L26ql0Ro1PUVovU7RjnHg95qVz4JfRvv+2ImX6K34AU=;
        b=I5xPu/fOTrU3NxB+uylGKjUelleOmVKZx0EtjLnj1H2IHaY1Ya5RafIQRsJVAQqOKx
         iJsOLi+jNQXF/SDUHBLb98qSOPtxYvbko8TBTY69Kd+cCkqPBZbns5FkRmfEwjKh3X8n
         9tiXVYCiONklTPAXshRDeP5SYmDCdxAerS28rZX53/u2wPi0elhj+h6xj34GIon5VD+I
         PbbSsJGPH4AnXi5fztKhx/+h6wFhbCf55/Gk4Br7UXDaiZB0w29bV+zhrCl0pRv+6GCo
         yLzaU9csAW0utHSX2vSOai02RgD3APxbIF9a8MGvM8RWFqM4Fe7A0iQDJMlUEHibTEDt
         uBsQ==
X-Gm-Message-State: AOAM532Kt6S6FyFWFV7YzFP9Vh4F27q7eeSgFJ5gxAKQGfzAgTv1eDCx
	47iLgR4BWBm1FBhq3F4BpPw=
X-Google-Smtp-Source: ABdhPJyMncjHAhuPLorOLl9+EJbJSHa93Bp/Wk42cuGVMrPOMz6MQLxoKFkktUNL3DCRgvbgL6CyqA==
X-Received: by 2002:a05:6808:15a0:: with SMTP id t32mr9068325oiw.91.1622771325007;
        Thu, 03 Jun 2021 18:48:45 -0700 (PDT)
Subject: Re: [PATCH v7 2/2] xen: Add files needed for minimal riscv build
To: Alistair Francis <alistair23@gmail.com>
Cc: "open list:X86" <xen-devel@lists.xenproject.org>,
 Bobby Eshleman <bobbyeshleman@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <cover.1622676439.git.connojdavis@gmail.com>
 <d4670a35758df878565cf757bbc20e2815618eb5.1622676439.git.connojdavis@gmail.com>
 <CAKmqyKPSTmkufvpAj9A_jK1sRkK+J9DMNUgmKfWchrCB9Hm+oQ@mail.gmail.com>
From: Connor Davis <connojdavis@gmail.com>
Message-ID: <0f1548ab-4b80-9dc4-ef16-98146394909b@gmail.com>
Date: Thu, 3 Jun 2021 19:48:56 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <CAKmqyKPSTmkufvpAj9A_jK1sRkK+J9DMNUgmKfWchrCB9Hm+oQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 6/3/21 5:33 PM, Alistair Francis wrote:
> On Thu, Jun 3, 2021 at 9:38 AM Connor Davis <connojdavis@gmail.com> wrote:
>> Add arch-specific makefiles and configs needed to build for
>> riscv. Also add a minimal head.S that is a simple infinite loop.
>> head.o can be built with
>>
>> $ make XEN_TARGET_ARCH=riscv64 SUBSYSTEMS=xen -C xen tiny64_defconfig
>> $ make XEN_TARGET_ARCH=riscv64 SUBSYSTEMS=xen -C xen TARGET=riscv64/head.o
>>
>> No other TARGET is supported at the moment.
>>
>> Signed-off-by: Connor Davis <connojdavis@gmail.com>
>> ---
>> Bob: I moved back to XEN_TARGET_ARCH=riscv64 because supplying
>> just XEN_TARGET_ARCH=riscv causes TARGET_ARCH == TARGET_SUBARCH, and
>> that broke the build after the recent commit b6ecd5c8bc
>> "build: centralize / unify asm-offsets generation". It also deviates
>> from how x86 and arm work now, so I think this change is for the best
>> for now. That commit is also why the PHONY include target is added
>> in the riscv/Makefile.
>> ---
>>   MAINTAINERS                             |  8 +++++
>>   config/riscv64.mk                       |  5 +++
>>   xen/Makefile                            |  8 +++--
>>   xen/arch/riscv/Kconfig                  | 47 +++++++++++++++++++++++++
>>   xen/arch/riscv/Kconfig.debug            |  0
>>   xen/arch/riscv/Makefile                 |  2 ++
>>   xen/arch/riscv/Rules.mk                 |  0
>>   xen/arch/riscv/arch.mk                  | 14 ++++++++
>>   xen/arch/riscv/configs/tiny64_defconfig | 13 +++++++
>>   xen/arch/riscv/riscv64/asm-offsets.c    |  0
>>   xen/arch/riscv/riscv64/head.S           |  6 ++++
>>   xen/include/asm-riscv/config.h          | 47 +++++++++++++++++++++++++
>>   12 files changed, 148 insertions(+), 2 deletions(-)
>>   create mode 100644 config/riscv64.mk
>>   create mode 100644 xen/arch/riscv/Kconfig
>>   create mode 100644 xen/arch/riscv/Kconfig.debug
>>   create mode 100644 xen/arch/riscv/Makefile
>>   create mode 100644 xen/arch/riscv/Rules.mk
>>   create mode 100644 xen/arch/riscv/arch.mk
>>   create mode 100644 xen/arch/riscv/configs/tiny64_defconfig
>>   create mode 100644 xen/arch/riscv/riscv64/asm-offsets.c
>>   create mode 100644 xen/arch/riscv/riscv64/head.S
>>   create mode 100644 xen/include/asm-riscv/config.h
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index d46b08a0d2..956e71220d 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -456,6 +456,14 @@ F: tools/libs/light/libxl_nonetbuffer.c
>>   F:     tools/hotplug/Linux/remus-netbuf-setup
>>   F:     tools/hotplug/Linux/block-drbd-probe
>>
>> +RISCV
>> +M:     Bob Eshleman <bobbyeshleman@gmail.com>
>> +R:     Connor Davis <connojdavis@gmail.com>
>> +S:     Supported
>> +F:     config/riscv64.mk
>> +F:     xen/arch/riscv/
>> +F:     xen/include/asm-riscv/
> I volunteer to be a maintainer as well, feel free to say no :)
>
> I did the QEMU RISC-V H extension port and have a pretty good
> understanding of the RISC-V Hypervisor extension.
Great! I will add you.
>> +
>>   RTDS SCHEDULER
>>   M:     Dario Faggioli <dfaggioli@suse.com>
>>   M:     Meng Xu <mengxu@cis.upenn.edu>
>> diff --git a/config/riscv64.mk b/config/riscv64.mk
>> new file mode 100644
>> index 0000000000..a5a21e5fa2
>> --- /dev/null
>> +++ b/config/riscv64.mk
>> @@ -0,0 +1,5 @@
>> +CONFIG_RISCV := y
>> +CONFIG_RISCV_64 := y
>> +CONFIG_RISCV_$(XEN_OS) := y
>> +
>> +CONFIG_XEN_INSTALL_SUFFIX :=
>> diff --git a/xen/Makefile b/xen/Makefile
>> index 7ce7692354..89879fad4c 100644
>> --- a/xen/Makefile
>> +++ b/xen/Makefile
>> @@ -26,7 +26,9 @@ MAKEFLAGS += -rR
>>   EFI_MOUNTPOINT ?= $(BOOT_DIR)/efi
>>
>>   ARCH=$(XEN_TARGET_ARCH)
>> -SRCARCH=$(shell echo $(ARCH) | sed -e 's/x86.*/x86/' -e s'/arm\(32\|64\)/arm/g')
>> +SRCARCH=$(shell echo $(ARCH) | \
>> +          sed -e 's/x86.*/x86/' -e s'/arm\(32\|64\)/arm/g' \
>> +              -e s'/riscv.*/riscv/g')
>>
>>   # Don't break if the build process wasn't called from the top level
>>   # we need XEN_TARGET_ARCH to generate the proper config
>> @@ -35,7 +37,8 @@ include $(XEN_ROOT)/Config.mk
>>   # Set ARCH/SUBARCH appropriately.
>>   export TARGET_SUBARCH  := $(XEN_TARGET_ARCH)
>>   export TARGET_ARCH     := $(shell echo $(XEN_TARGET_ARCH) | \
>> -                            sed -e 's/x86.*/x86/' -e s'/arm\(32\|64\)/arm/g')
>> +                            sed -e 's/x86.*/x86/' -e s'/arm\(32\|64\)/arm/g' \
>> +                                -e s'/riscv.*/riscv/g')
>>
>>   # Allow someone to change their config file
>>   export KCONFIG_CONFIG ?= .config
>> @@ -335,6 +338,7 @@ _clean: delete-unfresh-files
>>          $(MAKE) $(clean) xsm
>>          $(MAKE) $(clean) crypto
>>          $(MAKE) $(clean) arch/arm
>> +       $(MAKE) $(clean) arch/riscv
>>          $(MAKE) $(clean) arch/x86
>>          $(MAKE) $(clean) test
>>          $(MAKE) -f $(BASEDIR)/tools/kconfig/Makefile.kconfig ARCH=$(ARCH) SRCARCH=$(SRCARCH) clean
>> diff --git a/xen/arch/riscv/Kconfig b/xen/arch/riscv/Kconfig
>> new file mode 100644
>> index 0000000000..bd8381c5e0
>> --- /dev/null
>> +++ b/xen/arch/riscv/Kconfig
>> @@ -0,0 +1,47 @@
>> +config RISCV
>> +       def_bool y
>> +
>> +config RISCV_64
>> +       def_bool y
>> +       select 64BIT
>> +
>> +config ARCH_DEFCONFIG
>> +       string
>> +       default "arch/riscv/configs/tiny64_defconfig"
>> +
>> +menu "Architecture Features"
>> +
>> +source "arch/Kconfig"
>> +
>> +endmenu
>> +
>> +menu "ISA Selection"
>> +
>> +choice
>> +       prompt "Base ISA"
>> +       default RISCV_ISA_RV64IMA if RISCV_64
>> +       help
>> +         This selects the base ISA extensions that Xen will target.
>> +
>> +config RISCV_ISA_RV64IMA
>> +       bool "RV64IMA"
>> +       help
>> +         Use the RV64I base ISA, plus the "M" and "A" extensions
>> +         for integer multiply/divide and atomic instructions, respectively.
>> +
>> +endchoice
>> +
>> +config RISCV_ISA_C
>> +       bool "Compressed extension"
>> +       help
>> +         Add "C" to the ISA subsets that the toolchain is allowed to
>> +         emit when building Xen, which results in compressed instructions
>> +         in the Xen binary.
>> +
>> +         If unsure, say N.
> I would change this to y if you are unsure. I don't expect any
> hardware to have an MMU (yet along the H extension) and no compressed
> instruction extension. Linux won't run without the C extension.
> Otherwise looks good:
>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Thanks. I was thinking it may make bring-up easier (at least in assembly
glue) if C was turned off, but in the end it will probably be easiest to 
mimic
linux. I will change to Y.

Connor

