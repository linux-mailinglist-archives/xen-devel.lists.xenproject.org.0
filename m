Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41391BB3FB9
	for <lists+xen-devel@lfdr.de>; Thu, 02 Oct 2025 15:06:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1135809.1472771 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4J0V-0001ev-El; Thu, 02 Oct 2025 13:06:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1135809.1472771; Thu, 02 Oct 2025 13:06:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4J0V-0001cl-BM; Thu, 02 Oct 2025 13:06:03 +0000
Received: by outflank-mailman (input) for mailman id 1135809;
 Thu, 02 Oct 2025 13:06:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wm6k=4L=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1v4J0T-0001cb-TZ
 for xen-devel@lists.xenproject.org; Thu, 02 Oct 2025 13:06:01 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8a59bd42-9f90-11f0-9809-7dc792cee155;
 Thu, 02 Oct 2025 15:05:59 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-46e34bd8eb2so10844695e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Oct 2025 06:05:59 -0700 (PDT)
Received: from [192.168.1.183] (host-92-22-57-86.as13285.net. [92.22.57.86])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e61a020a3sm82773015e9.10.2025.10.02.06.05.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Oct 2025 06:05:58 -0700 (PDT)
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
X-Inumbo-ID: 8a59bd42-9f90-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1759410359; x=1760015159; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mLZZEW+Ff1qW+AzwoujXqGEDMyNnelIs1ptfLVcvf/g=;
        b=puGsp/FB343xbKJQswWJo4UWYstDs63a03J4eI4PLY6py7mWqHrJDp+LkP30erps1M
         gjve/HQC2Ck0YfxacHAY6UKtrYkFbAcVwvzLLhb7iUWagBU5N7u9E0exN0eocAvlfrbp
         dwFfa2DELVB/uwZYZquLhtDOM90y7p13mzl8E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759410359; x=1760015159;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mLZZEW+Ff1qW+AzwoujXqGEDMyNnelIs1ptfLVcvf/g=;
        b=A5lJsxLis84/QmaxQleWq6IQBaQjo1wURWDDRrzTc8wUX7RUATyauQw2m+veZRumyD
         2+iGgR5F0i7xB8a+pR8p4DwN1sAMTdC3jA4bkyuZS/867yPC3gv/yy7f3f7NKys2H8FG
         yAjHPcSIZoRRFxzJR6zc/sQu0dD84IiiZjkEPrLnJl5c8shbiLsX8YbhuaxdgP0Uchqj
         riZ7S6jaTRXMYeLGlQ1Ok5sje1YNg8gTOeuBhTDFZ3E+WgP6Gb71BAaxlC0Htd8DCymH
         nG9P881kYPR6fKXCaWhz+c/bMuhhViqgz5J9GNCTIX7R/JMU+8RLf5/tilfEV/rpgBeH
         NZfg==
X-Forwarded-Encrypted: i=1; AJvYcCUvDOtCyC7r8VyOvPC8/zlPu2JTgCbqFDrcAVO55L1Gx+AAlLgNDB8yr/6xKb1kPKcSIJZzCdjOg5c=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzqRp3DS8ovEf5lxH8XGMLYHwCKaMWDYDomiO0/cjRxELiMX4hX
	og3MK258BZfuV5fpegC4yAahvaLlY0DXyNpfOg9DZ8kG3yGsE87NFHHWd9CqfP/h4+8=
X-Gm-Gg: ASbGncsBy7FdxWgUwAQFiu5Mu4c6ONJuf5wA9jcKUsh5u74Y36PI1vPmeYsqUDXMvYu
	5cwUg5Kw48CrXe8e35DUauOJflyiRHCHrOxp1CbiCq7zMH3peNveQ+q3sxFVKxsjbLYRF05E2F9
	T8ZKtHLTWAMffAqGrwGji40Y08jfSd1w2VZYj+TyWqFttQeRsKDYHeUJy7Rw/p+cyrReu8mqgX3
	/gjL2R13U7ugTB6/2Uw96LpLgBYXf6bP39Hgwc+2HSl/vEdgRNNKKkhxb1eJhuMc8r4yOgE4dPj
	MYOrg1r2ubYji4vwBOT388Bt8IDPpN9Ovuhc/OjpojeAdSCNLROJzuMZsNc0kgpsSV30fwfgtcR
	ntj+j8id04PB+l4VYH6MDHNhmaMdlZ1psLkSYfBqwJkTQ/Ae6oWb0EUMqwcR8I8sESUHsre32od
	McQMdyjn5q8ru86I4QVmSByzM=
X-Google-Smtp-Source: AGHT+IHkpdGMKHCF6ril8pisjjFye6P/DC5hIOB4rqobrIdwI3ZP214AbjhtDeK6IVIw+Kg52iv/xg==
X-Received: by 2002:a05:600d:41eb:b0:46e:45d3:82fa with SMTP id 5b1f17b1804b1-46e6127a2c9mr62639345e9.10.1759410358727;
        Thu, 02 Oct 2025 06:05:58 -0700 (PDT)
Message-ID: <586a66e5-4b11-485e-955a-da5fc3183737@citrix.com>
Date: Thu, 2 Oct 2025 14:05:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen: Strip xen.efi by default
To: Frediano Ziglio <frediano.ziglio@cloud.com>,
 xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Daniel Smith <dpsmith@apertussolutions.com>,
 "michal.zygowski@3mdeb.com" <michal.zygowski@3mdeb.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <20250612100705.21988-1-frediano.ziglio@cloud.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250612100705.21988-1-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12/06/2025 11:07 am, Frediano Ziglio wrote:
> For xen.gz file we strip all symbols and have an additional
> xen-syms file version with all symbols.
> Make xen.efi more coherent stripping all symbols too.
> xen.efi.elf can be used for debugging.
>
> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> ---
> Changes since v1:
> - avoid leaving target if some command fails

CC-ing the EFI maintainers, as this is an EFI change.

At the recent QubesOS hackathon, Michał Żygowski (3mdeb) found that
stripping Xen was the difference between the system booting and not.

With debugging symbols, xen.efi was ~32M and is placed above the 4G
boundary by the EFI loader, hitting Xen's sanity check that it's below 4G.

Xen does still have a requirement to live below the 4G boundary.  At a
minimum, idle_pg_table needs to be addressable with a 32bit %cr3, but I
bet that isn't the only restriction we have.

So, either we find a way of telling the EFI loader (using PE+ headers
only) that we require to be below 4G (I have no idea if this is
possible), or we strip xen.efi by default.

I don't think making Xen.efi safe to operate above the 4G boundary is a
viable option at this point.

As Xen's defaults are broken on modern systems, this is also a bugfix
candidate for 4.21, so CC Oleksii.

~Andrew

(Retaining full patch for those CC'd into the thread)

> ---
>  docs/misc/efi.pandoc  |  8 +-------
>  xen/Kconfig.debug     |  9 ++-------
>  xen/Makefile          | 19 -------------------
>  xen/arch/x86/Makefile |  8 +++++---
>  4 files changed, 8 insertions(+), 36 deletions(-)
>
> diff --git a/docs/misc/efi.pandoc b/docs/misc/efi.pandoc
> index 11c1ac3346..c66b18a66b 100644
> --- a/docs/misc/efi.pandoc
> +++ b/docs/misc/efi.pandoc
> @@ -20,13 +20,7 @@ Xen to load the configuration file even if multiboot modules are found.
>  Once built, `make install-xen` will place the resulting binary directly into
>  the EFI boot partition, provided `EFI_VENDOR` is set in the environment (and
>  `EFI_MOUNTPOINT` is overridden as needed, should the default of `/boot/efi` not
> -match your system). When built with debug info, the binary can be quite large.
> -Setting `INSTALL_EFI_STRIP=1` in the environment will cause it to be stripped
> -of debug info in the process of installing. `INSTALL_EFI_STRIP` can also be set
> -to any combination of options suitable to pass to `strip`, in case the default
> -ones don't do. The xen.efi binary will also be installed in `/usr/lib64/efi/`,
> -unless `EFI_DIR` is set in the environment to override this default. This
> -binary will not be stripped in the process.
> +match your system).
>  
>  The binary itself will require a configuration file (names with the `.efi`
>  extension of the binary's name replaced by `.cfg`, and - until an existing
> diff --git a/xen/Kconfig.debug b/xen/Kconfig.debug
> index d14093017e..cafbb1236c 100644
> --- a/xen/Kconfig.debug
> +++ b/xen/Kconfig.debug
> @@ -147,12 +147,7 @@ config DEBUG_INFO
>  	  Say Y here if you want to build Xen with debug information. This
>  	  information is needed e.g. for doing crash dump analysis of the
>  	  hypervisor via the "crash" tool.
> -	  Saying Y will increase the size of the xen-syms and xen.efi
> -	  binaries. In case the space on the EFI boot partition is rather
> -	  limited, you may want to install a stripped variant of xen.efi in
> -	  the EFI boot partition (look for "INSTALL_EFI_STRIP" in
> -	  docs/misc/efi.pandoc for more information - when not using
> -	  "make install-xen" for installing xen.efi, stripping needs to be
> -	  done outside the Xen build environment).
> +	  Saying Y will increase the size of the xen-syms and xen.efi.elf
> +	  binaries.
>  
>  endmenu
> diff --git a/xen/Makefile b/xen/Makefile
> index 8fc4e042ff..664c4ea7b8 100644
> --- a/xen/Makefile
> +++ b/xen/Makefile
> @@ -488,22 +488,6 @@ endif
>  .PHONY: _build
>  _build: $(TARGET)$(CONFIG_XEN_INSTALL_SUFFIX)
>  
> -# Strip
> -#
> -# INSTALL_EFI_STRIP, if defined, will cause xen.efi to be stripped before it
> -# is installed. If INSTALL_EFI_STRIP is '1', then the default option(s) below
> -# will be used. Otherwise, INSTALL_EFI_STRIP value will be used as the
> -# option(s) to the strip command.
> -ifdef INSTALL_EFI_STRIP
> -
> -ifeq ($(INSTALL_EFI_STRIP),1)
> -efi-strip-opt := --strip-debug --keep-file-symbols
> -else
> -efi-strip-opt := $(INSTALL_EFI_STRIP)
> -endif
> -
> -endif
> -
>  .PHONY: _install
>  _install: D=$(DESTDIR)
>  _install: T=$(notdir $(TARGET))
> @@ -530,9 +514,6 @@ _install: $(TARGET)$(CONFIG_XEN_INSTALL_SUFFIX)
>  		ln -sf $(T)-$(XEN_FULLVERSION).efi $(D)$(EFI_DIR)/$(T)-$(XEN_VERSION).efi; \
>  		ln -sf $(T)-$(XEN_FULLVERSION).efi $(D)$(EFI_DIR)/$(T).efi; \
>  		if [ -n '$(EFI_MOUNTPOINT)' -a -n '$(EFI_VENDOR)' ]; then \
> -			$(if $(efi-strip-opt), \
> -			     $(STRIP) $(efi-strip-opt) -p -o $(TARGET).efi.stripped $(TARGET).efi && \
> -			     $(INSTALL_DATA) $(TARGET).efi.stripped $(D)$(EFI_MOUNTPOINT)/efi/$(EFI_VENDOR)/$(T)-$(XEN_FULLVERSION).efi ||) \
>  			$(INSTALL_DATA) $(TARGET).efi $(D)$(EFI_MOUNTPOINT)/efi/$(EFI_VENDOR)/$(T)-$(XEN_FULLVERSION).efi; \
>  		elif [ "$(D)" = "$(patsubst $(shell cd $(XEN_ROOT) && pwd)/%,%,$(D))" ]; then \
>  			echo 'EFI installation only partially done (EFI_VENDOR not set)' >&2; \
> diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
> index ce724a9daa..e0ebc8c73e 100644
> --- a/xen/arch/x86/Makefile
> +++ b/xen/arch/x86/Makefile
> @@ -232,14 +232,16 @@ endif
>  	$(MAKE) $(build)=$(@D) .$(@F).1r.o .$(@F).1s.o
>  	$(LD) $(call EFI_LDFLAGS,$(VIRT_BASE)) -T $(obj)/efi.lds $< \
>  	      $(dot-target).1r.o $(dot-target).1s.o $(orphan-handling-y) \
> -	      $(note_file_option) -o $@
> -	$(NM) -pa --format=sysv $@ \
> +	      $(note_file_option) -o $@.tmp
> +	$(NM) -pa --format=sysv $@.tmp \
>  		| $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
>  		> $@.map
>  ifeq ($(CONFIG_DEBUG_INFO),y)
> -	$(if $(filter --strip-debug,$(EFI_LDFLAGS)),:$(space))$(OBJCOPY) -O elf64-x86-64 $@ $@.elf
> +	$(if $(filter --strip-debug,$(EFI_LDFLAGS)),:$(space))$(OBJCOPY) -O elf64-x86-64 $@.tmp $@.elf
> +	$(if $(filter --strip-debug,$(EFI_LDFLAGS)),:$(space))$(STRIP) $@.tmp
>  endif
>  	rm -f $(dot-target).[0-9]* $(@D)/..$(@F).[0-9]*
> +	mv -f $@.tmp $@
>  ifeq ($(CONFIG_XEN_IBT),y)
>  	$(SHELL) $(srctree)/tools/check-endbr.sh $@
>  endif


