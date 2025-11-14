Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D8AC5DEE6
	for <lists+xen-devel@lfdr.de>; Fri, 14 Nov 2025 16:40:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1162753.1490287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJvuC-0005Yg-No; Fri, 14 Nov 2025 15:40:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1162753.1490287; Fri, 14 Nov 2025 15:40:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJvuC-0005WE-KQ; Fri, 14 Nov 2025 15:40:08 +0000
Received: by outflank-mailman (input) for mailman id 1162753;
 Fri, 14 Nov 2025 15:40:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Jk/=5W=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vJvuB-0005Rw-6x
 for xen-devel@lists.xenproject.org; Fri, 14 Nov 2025 15:40:07 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 316e68d0-c170-11f0-9d18-b5c5bf9af7f9;
 Fri, 14 Nov 2025 16:40:06 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-640e9f5951aso5106198a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 14 Nov 2025 07:40:06 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-71-38.play-internet.pl.
 [109.243.71.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b73785d0e04sm20392466b.47.2025.11.14.07.40.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Nov 2025 07:40:04 -0800 (PST)
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
X-Inumbo-ID: 316e68d0-c170-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763134805; x=1763739605; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0HIxqQ9YMecJfwFs5hXLgd3zBBFFGo18VaUYlZB1Ozg=;
        b=DGfGf06Y4ZeV+uMCTLcBYAeUwKcE9tK3FDgyIguB8g1VIqnNsE3QexlQIOXWJ09THH
         P8WUjVikUEnlEItgBmILv6d5GeEyRMUS/027pB7vGHixL9xEuD7olzaKZjptKNSKy3zP
         yr1Im+rGykKK3I+9LrKSKcV/dmAftiT6T8PdF6YAoK4V8KwA7nn7t4nQlmYEsVSgUAjL
         VcYiEEi7Z4z1PSnzX5GkLDurKGmi63d6NEf48oWWAh8Zw2a83hqBxNtWiFcd3xIpsvsZ
         MLiP7PO6/4cnIzKA8uxqe2sJx2NVKJ/7kzNbSYuSi7/EkCyDaswyCHLHUzwx2+kfFHJo
         WabA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763134805; x=1763739605;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0HIxqQ9YMecJfwFs5hXLgd3zBBFFGo18VaUYlZB1Ozg=;
        b=ijNrTQh0JBdMJeQiqFBkl1ouQpD/JoUnnx8XgVP+eoU1xC6UYti3sMw3HDbT+xOVBK
         5z4KwmJV4gne4t0vt2hkHx+5v9BOXq3wOrQiqn6xcwNkjNnxW/WesnnwHsIFegnpw+8F
         QVtCFs9VJwDfbRGcyVYb/J1HmQ/IpC2QSTPtUX059WFjaOVwjL+pwmx+3eUN8OdWBe14
         N+Tz00UrhQv9Cl7HVv1oQgSzTWJdCu0iTFb6wx9QouxoPP2Tg+mfJoDwywmpG0nrIuZw
         InOt1G4KrXerc5MNeDLT9NWpSqM7/Q6o1tfLKkU97/C9kMq8PXVBP+Wpp1qsTaPwdiqj
         0IEw==
X-Forwarded-Encrypted: i=1; AJvYcCXp7gjnkmITUuJwhxZvdJbR7fkPM+jpK0WxGVi7kNmj/XQQPrg9nRmmEPMl9FWEJnaDJEC1tu+1o44=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzz2aUmvKFeKlv4waUIGo+0kdYXHGTow6U3DUAFmihWcAMCjOZk
	JQFf5hMO0iOfoPY4u3LXP5m2lpnrvV8TwX2ZTm/WOO2hrcFIjipAU4Tt
X-Gm-Gg: ASbGncuJjlkwJ3nos9p6YfiB3fI2RVfn1xjf8j/TfKH0+iQWPJgUWKExqwY25Qo76cb
	wtRJwM/yCW6huCQrqIXsibIA61ihIYZVWTqZwhJJfHz5JRuRb+79YlwMA4HvM+sVknDwsdDnkw4
	ZrfIvalfBPfWccxHJg0fJnvtQuxeLIhMc5Cbw1PSAtMIgJQV7P+FLBxLT/KNCCdnoidpmtx+j+9
	0M21r18TUy53u+tMX1BIQqGo/E41fFn7qG4IOp7Ly/WONW3f6DuCHm55FagLRJCDlRdLD80zIz0
	t73CxBqH8xhLxaoAKqQGWM9Zlm7sfCCW3EM3wqd2OH78WJ0fFqStGtnRKiTM8GdzjIPyxqco2xV
	P50XpWeQ3v8kjCW9Ki4UMYC4zKc2QvXJWjjGOqgyZGdcpUAPD/eIg4hI1lxqULgHx2mfRfWv78O
	cSP7yEwIsNoET5LcjgCkEpXUFo9nwYEAur9HmDbqHFdoTvZllZv2hC/qIk9w/t
X-Google-Smtp-Source: AGHT+IEC9QIDaE484YxTeJdCpKtqr65AH2U5wD/UETPImvXP/fvrOrby1gdDgTgpWZWmSDPAkfMe2g==
X-Received: by 2002:a17:907:3ea9:b0:b70:b9b6:9a94 with SMTP id a640c23a62f3a-b7365af93e3mr447184166b.23.1763134805028;
        Fri, 14 Nov 2025 07:40:05 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------rIgHzd3MjhhWKv1T3mEQ2sVM"
Message-ID: <6729f3d9-618c-4dcd-93f8-d02ca7cea017@gmail.com>
Date: Fri, 14 Nov 2025 16:40:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8] xen: Strip xen.efi by default
To: Frediano Ziglio <frediano.ziglio@citrix.com>,
 xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Frediano Ziglio <freddy77@gmail.com>,
 Demi Marie Obenour <demiobenour@gmail.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>
References: <20251113154358.28704-1-frediano.ziglio@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20251113154358.28704-1-frediano.ziglio@citrix.com>

This is a multi-part message in MIME format.
--------------rIgHzd3MjhhWKv1T3mEQ2sVM
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 11/13/25 4:43 PM, Frediano Ziglio wrote:
> From: Frediano Ziglio<frediano.ziglio@cloud.com>
>
> For xen.gz file we strip all symbols and have an additional
> xen-syms.efi file version with all symbols.
> Make xen.efi more coherent stripping all symbols too.
> xen-syms.efi can be used for debugging.
>
> Signed-off-by: Frediano Ziglio<frediano.ziglio@cloud.com>

Release-Acked-By: Oleksii Kurochko<oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

> ---
> Changes since v1:
> - avoid leaving target if some command fails.
>
> Changes since v2:
> - do not convert type but retain PE format;
> - use xen-syms.efi for new file name, more consistent with ELF.
>
> Changes since v3:
> - update documentation;
> - do not remove xen.efi.elf;
> - check endbr instruction before generating final target.
>
> Changes since v4:
> - simplify condition check;
> - avoid reuse of $@.tmp file.
>
> Changes since v5:
> - avoid creation of temporary file.
>
> Changes since v6:
> - install xen-syms.efi;
> - always strip xen.efi;
> - restore EFI_LDFLAGS check during rule execution;
> - update CHANGELOG.md;
> - added xen-syms.efi to .gitignore.
>
> Changes since v7:
> - move and improve CHANGELOG.md changes.
> ---
>   .gitignore            |  1 +
>   CHANGELOG.md          |  3 +++
>   docs/misc/efi.pandoc  |  8 +-------
>   xen/Kconfig.debug     |  9 ++-------
>   xen/Makefile          | 25 +++----------------------
>   xen/arch/x86/Makefile | 11 ++++++++---
>   6 files changed, 18 insertions(+), 39 deletions(-)
>
> diff --git a/.gitignore b/.gitignore
> index d83427aba8..213972b65c 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -222,6 +222,7 @@ tools/flask/policy/xenpolicy-*
>   xen/xen
>   xen/suppression-list.txt
>   xen/xen-syms
> +xen/xen-syms.efi
>   xen/xen-syms.map
>   xen/xen.*
>   
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index c9932a2af0..bc16e316e7 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -34,6 +34,9 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>        BAR for HVM guests, to improve performance of guests using it to map the
>        grant table or foreign memory.
>      - Allow configuring the number of altp2m tables per domain via vm.cfg.
> +   - The install-time environment variable INSTALL_EFI_STRIP no longer exists.
> +     xen.efi is always stripped, while the symbols remain available in
> +     xen-syms.efi.
>   
>   ### Added
>    - Introduce new PDX compression algorithm to cope with Intel Sierra Forest and
> diff --git a/docs/misc/efi.pandoc b/docs/misc/efi.pandoc
> index 11c1ac3346..c66b18a66b 100644
> --- a/docs/misc/efi.pandoc
> +++ b/docs/misc/efi.pandoc
> @@ -20,13 +20,7 @@ Xen to load the configuration file even if multiboot modules are found.
>   Once built, `make install-xen` will place the resulting binary directly into
>   the EFI boot partition, provided `EFI_VENDOR` is set in the environment (and
>   `EFI_MOUNTPOINT` is overridden as needed, should the default of `/boot/efi` not
> -match your system). When built with debug info, the binary can be quite large.
> -Setting `INSTALL_EFI_STRIP=1` in the environment will cause it to be stripped
> -of debug info in the process of installing. `INSTALL_EFI_STRIP` can also be set
> -to any combination of options suitable to pass to `strip`, in case the default
> -ones don't do. The xen.efi binary will also be installed in `/usr/lib64/efi/`,
> -unless `EFI_DIR` is set in the environment to override this default. This
> -binary will not be stripped in the process.
> +match your system).
>   
>   The binary itself will require a configuration file (names with the `.efi`
>   extension of the binary's name replaced by `.cfg`, and - until an existing
> diff --git a/xen/Kconfig.debug b/xen/Kconfig.debug
> index d900d926c5..1a8e0c6ec3 100644
> --- a/xen/Kconfig.debug
> +++ b/xen/Kconfig.debug
> @@ -147,12 +147,7 @@ config DEBUG_INFO
>   	  Say Y here if you want to build Xen with debug information. This
>   	  information is needed e.g. for doing crash dump analysis of the
>   	  hypervisor via the "crash" tool.
> -	  Saying Y will increase the size of the xen-syms and xen.efi
> -	  binaries. In case the space on the EFI boot partition is rather
> -	  limited, you may want to install a stripped variant of xen.efi in
> -	  the EFI boot partition (look for "INSTALL_EFI_STRIP" in
> -	  docs/misc/efi.pandoc for more information - when not using
> -	  "make install-xen" for installing xen.efi, stripping needs to be
> -	  done outside the Xen build environment).
> +	  Saying Y will increase the size of the xen-syms, xen-syms.efi and
> +	  xen.efi.elf binaries.
>   
>   endmenu
> diff --git a/xen/Makefile b/xen/Makefile
> index fc9244420e..5ed029fed1 100644
> --- a/xen/Makefile
> +++ b/xen/Makefile
> @@ -493,22 +493,6 @@ endif
>   .PHONY: _build
>   _build: $(TARGET)$(CONFIG_XEN_INSTALL_SUFFIX)
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
>   .PHONY: _install
>   _install: D=$(DESTDIR)
>   _install: T=$(notdir $(TARGET))
> @@ -526,18 +510,15 @@ _install: $(TARGET)$(CONFIG_XEN_INSTALL_SUFFIX)
>   	if [ -r $(TARGET).efi -a -n '$(EFI_DIR)' ]; then \
>   		[ -d $(D)$(EFI_DIR) ] || $(INSTALL_DIR) $(D)$(EFI_DIR); \
>   		$(INSTALL_DATA) $(TARGET).efi $(D)$(EFI_DIR)/$(T)-$(XEN_FULLVERSION).efi; \
> -		for x in map elf; do \
> -			if [ -e $(TARGET).efi.$$x ]; then \
> -				$(INSTALL_DATA) $(TARGET).efi.$$x $(D)$(DEBUG_DIR)/$(T)-$(XEN_FULLVERSION).efi.$$x; \
> +		for x in .efi.map .efi.elf -syms.efi; do \
> +			if [ -e $(TARGET)$$x ]; then \
> +				$(INSTALL_DATA) $(TARGET)$$x $(D)$(DEBUG_DIR)/$(T)-$(XEN_FULLVERSION)$$x; \
>   			fi; \
>   		done; \
>   		ln -sf $(T)-$(XEN_FULLVERSION).efi $(D)$(EFI_DIR)/$(T)-$(XEN_VERSION).$(XEN_SUBVERSION).efi; \
>   		ln -sf $(T)-$(XEN_FULLVERSION).efi $(D)$(EFI_DIR)/$(T)-$(XEN_VERSION).efi; \
>   		ln -sf $(T)-$(XEN_FULLVERSION).efi $(D)$(EFI_DIR)/$(T).efi; \
>   		if [ -n '$(EFI_MOUNTPOINT)' -a -n '$(EFI_VENDOR)' ]; then \
> -			$(if $(efi-strip-opt), \
> -			     $(STRIP) $(efi-strip-opt) -p -o $(TARGET).efi.stripped $(TARGET).efi && \
> -			     $(INSTALL_DATA) $(TARGET).efi.stripped $(D)$(EFI_MOUNTPOINT)/efi/$(EFI_VENDOR)/$(T)-$(XEN_FULLVERSION).efi ||) \
>   			$(INSTALL_DATA) $(TARGET).efi $(D)$(EFI_MOUNTPOINT)/efi/$(EFI_VENDOR)/$(T)-$(XEN_FULLVERSION).efi; \
>   		elif [ "$(D)" = "$(patsubst $(shell cd $(XEN_ROOT) && pwd)/%,%,$(D))" ]; then \
>   			echo 'EFI installation only partially done (EFI_VENDOR not set)' >&2; \
> diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
> index 407571c510..a154ffe6b2 100644
> --- a/xen/arch/x86/Makefile
> +++ b/xen/arch/x86/Makefile
> @@ -228,12 +228,17 @@ endif
>   	$(MAKE) $(build)=$(@D) .$(@F).1r.o .$(@F).1s.o
>   	$(LD) $(call EFI_LDFLAGS,$(VIRT_BASE)) -T $(obj)/efi.lds $< \
>   	      $(dot-target).1r.o $(dot-target).1s.o $(orphan-handling-y) \
> -	      $(note_file_option) -o $@
> -	$(NM) -pa --format=sysv $@ \
> +	      $(note_file_option) -o $(TARGET)-syms.efi
> +	$(NM) -pa --format=sysv $(TARGET)-syms.efi \
>   		| $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
>   		> $@.map
>   ifeq ($(CONFIG_DEBUG_INFO),y)
> -	$(if $(filter --strip-debug,$(EFI_LDFLAGS)),:$(space))$(OBJCOPY) -O elf64-x86-64 $@ $@.elf
> +	$(if $(filter --strip-debug,$(EFI_LDFLAGS)),:$(space))$(OBJCOPY) \
> +		-O elf64-x86-64 $(TARGET)-syms.efi $@.elf
> +endif
> +	$(STRIP) $(TARGET)-syms.efi -o $@
> +ifneq ($(CONFIG_DEBUG_INFO),y)
> +	rm -f $(TARGET)-syms.efi
>   endif
>   	rm -f $(dot-target).[0-9]* $(@D)/..$(@F).[0-9]*
>   ifeq ($(CONFIG_XEN_IBT),y)
--------------rIgHzd3MjhhWKv1T3mEQ2sVM
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 11/13/25 4:43 PM, Frediano Ziglio
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20251113154358.28704-1-frediano.ziglio@citrix.com">
      <pre wrap="" class="moz-quote-pre">From: Frediano Ziglio <a class="moz-txt-link-rfc2396E" href="mailto:frediano.ziglio@cloud.com">&lt;frediano.ziglio@cloud.com&gt;</a>

For xen.gz file we strip all symbols and have an additional
xen-syms.efi file version with all symbols.
Make xen.efi more coherent stripping all symbols too.
xen-syms.efi can be used for debugging.

Signed-off-by: Frediano Ziglio <a class="moz-txt-link-rfc2396E" href="mailto:frediano.ziglio@cloud.com">&lt;frediano.ziglio@cloud.com&gt;</a></pre>
    </blockquote>
    <pre>Release-Acked-By: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>

Thanks.

~ Oleksii</pre>
    <blockquote type="cite"
      cite="mid:20251113154358.28704-1-frediano.ziglio@citrix.com">
      <pre wrap="" class="moz-quote-pre">
---
Changes since v1:
- avoid leaving target if some command fails.

Changes since v2:
- do not convert type but retain PE format;
- use xen-syms.efi for new file name, more consistent with ELF.

Changes since v3:
- update documentation;
- do not remove xen.efi.elf;
- check endbr instruction before generating final target.

Changes since v4:
- simplify condition check;
- avoid reuse of $@.tmp file.

Changes since v5:
- avoid creation of temporary file.

Changes since v6:
- install xen-syms.efi;
- always strip xen.efi;
- restore EFI_LDFLAGS check during rule execution;
- update CHANGELOG.md;
- added xen-syms.efi to .gitignore.

Changes since v7:
- move and improve CHANGELOG.md changes.
---
 .gitignore            |  1 +
 CHANGELOG.md          |  3 +++
 docs/misc/efi.pandoc  |  8 +-------
 xen/Kconfig.debug     |  9 ++-------
 xen/Makefile          | 25 +++----------------------
 xen/arch/x86/Makefile | 11 ++++++++---
 6 files changed, 18 insertions(+), 39 deletions(-)

diff --git a/.gitignore b/.gitignore
index d83427aba8..213972b65c 100644
--- a/.gitignore
+++ b/.gitignore
@@ -222,6 +222,7 @@ tools/flask/policy/xenpolicy-*
 xen/xen
 xen/suppression-list.txt
 xen/xen-syms
+xen/xen-syms.efi
 xen/xen-syms.map
 xen/xen.*
 
diff --git a/CHANGELOG.md b/CHANGELOG.md
index c9932a2af0..bc16e316e7 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -34,6 +34,9 @@ The format is based on [Keep a Changelog](<a class="moz-txt-link-freetext" href="https://keepachangelog.com/en/1.0.0/">https://keepachangelog.com/en/1.0.0/</a>)
      BAR for HVM guests, to improve performance of guests using it to map the
      grant table or foreign memory.
    - Allow configuring the number of altp2m tables per domain via vm.cfg.
+   - The install-time environment variable INSTALL_EFI_STRIP no longer exists.
+     xen.efi is always stripped, while the symbols remain available in
+     xen-syms.efi.
 
 ### Added
  - Introduce new PDX compression algorithm to cope with Intel Sierra Forest and
diff --git a/docs/misc/efi.pandoc b/docs/misc/efi.pandoc
index 11c1ac3346..c66b18a66b 100644
--- a/docs/misc/efi.pandoc
+++ b/docs/misc/efi.pandoc
@@ -20,13 +20,7 @@ Xen to load the configuration file even if multiboot modules are found.
 Once built, `make install-xen` will place the resulting binary directly into
 the EFI boot partition, provided `EFI_VENDOR` is set in the environment (and
 `EFI_MOUNTPOINT` is overridden as needed, should the default of `/boot/efi` not
-match your system). When built with debug info, the binary can be quite large.
-Setting `INSTALL_EFI_STRIP=1` in the environment will cause it to be stripped
-of debug info in the process of installing. `INSTALL_EFI_STRIP` can also be set
-to any combination of options suitable to pass to `strip`, in case the default
-ones don't do. The xen.efi binary will also be installed in `/usr/lib64/efi/`,
-unless `EFI_DIR` is set in the environment to override this default. This
-binary will not be stripped in the process.
+match your system).
 
 The binary itself will require a configuration file (names with the `.efi`
 extension of the binary's name replaced by `.cfg`, and - until an existing
diff --git a/xen/Kconfig.debug b/xen/Kconfig.debug
index d900d926c5..1a8e0c6ec3 100644
--- a/xen/Kconfig.debug
+++ b/xen/Kconfig.debug
@@ -147,12 +147,7 @@ config DEBUG_INFO
 	  Say Y here if you want to build Xen with debug information. This
 	  information is needed e.g. for doing crash dump analysis of the
 	  hypervisor via the "crash" tool.
-	  Saying Y will increase the size of the xen-syms and xen.efi
-	  binaries. In case the space on the EFI boot partition is rather
-	  limited, you may want to install a stripped variant of xen.efi in
-	  the EFI boot partition (look for "INSTALL_EFI_STRIP" in
-	  docs/misc/efi.pandoc for more information - when not using
-	  "make install-xen" for installing xen.efi, stripping needs to be
-	  done outside the Xen build environment).
+	  Saying Y will increase the size of the xen-syms, xen-syms.efi and
+	  xen.efi.elf binaries.
 
 endmenu
diff --git a/xen/Makefile b/xen/Makefile
index fc9244420e..5ed029fed1 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -493,22 +493,6 @@ endif
 .PHONY: _build
 _build: $(TARGET)$(CONFIG_XEN_INSTALL_SUFFIX)
 
-# Strip
-#
-# INSTALL_EFI_STRIP, if defined, will cause xen.efi to be stripped before it
-# is installed. If INSTALL_EFI_STRIP is '1', then the default option(s) below
-# will be used. Otherwise, INSTALL_EFI_STRIP value will be used as the
-# option(s) to the strip command.
-ifdef INSTALL_EFI_STRIP
-
-ifeq ($(INSTALL_EFI_STRIP),1)
-efi-strip-opt := --strip-debug --keep-file-symbols
-else
-efi-strip-opt := $(INSTALL_EFI_STRIP)
-endif
-
-endif
-
 .PHONY: _install
 _install: D=$(DESTDIR)
 _install: T=$(notdir $(TARGET))
@@ -526,18 +510,15 @@ _install: $(TARGET)$(CONFIG_XEN_INSTALL_SUFFIX)
 	if [ -r $(TARGET).efi -a -n '$(EFI_DIR)' ]; then \
 		[ -d $(D)$(EFI_DIR) ] || $(INSTALL_DIR) $(D)$(EFI_DIR); \
 		$(INSTALL_DATA) $(TARGET).efi $(D)$(EFI_DIR)/$(T)-$(XEN_FULLVERSION).efi; \
-		for x in map elf; do \
-			if [ -e $(TARGET).efi.$$x ]; then \
-				$(INSTALL_DATA) $(TARGET).efi.$$x $(D)$(DEBUG_DIR)/$(T)-$(XEN_FULLVERSION).efi.$$x; \
+		for x in .efi.map .efi.elf -syms.efi; do \
+			if [ -e $(TARGET)$$x ]; then \
+				$(INSTALL_DATA) $(TARGET)$$x $(D)$(DEBUG_DIR)/$(T)-$(XEN_FULLVERSION)$$x; \
 			fi; \
 		done; \
 		ln -sf $(T)-$(XEN_FULLVERSION).efi $(D)$(EFI_DIR)/$(T)-$(XEN_VERSION).$(XEN_SUBVERSION).efi; \
 		ln -sf $(T)-$(XEN_FULLVERSION).efi $(D)$(EFI_DIR)/$(T)-$(XEN_VERSION).efi; \
 		ln -sf $(T)-$(XEN_FULLVERSION).efi $(D)$(EFI_DIR)/$(T).efi; \
 		if [ -n '$(EFI_MOUNTPOINT)' -a -n '$(EFI_VENDOR)' ]; then \
-			$(if $(efi-strip-opt), \
-			     $(STRIP) $(efi-strip-opt) -p -o $(TARGET).efi.stripped $(TARGET).efi &amp;&amp; \
-			     $(INSTALL_DATA) $(TARGET).efi.stripped $(D)$(EFI_MOUNTPOINT)/efi/$(EFI_VENDOR)/$(T)-$(XEN_FULLVERSION).efi ||) \
 			$(INSTALL_DATA) $(TARGET).efi $(D)$(EFI_MOUNTPOINT)/efi/$(EFI_VENDOR)/$(T)-$(XEN_FULLVERSION).efi; \
 		elif [ "$(D)" = "$(patsubst $(shell cd $(XEN_ROOT) &amp;&amp; pwd)/%,%,$(D))" ]; then \
 			echo 'EFI installation only partially done (EFI_VENDOR not set)' &gt;&amp;2; \
diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index 407571c510..a154ffe6b2 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -228,12 +228,17 @@ endif
 	$(MAKE) $(build)=$(@D) .$(@F).1r.o .$(@F).1s.o
 	$(LD) $(call EFI_LDFLAGS,$(VIRT_BASE)) -T $(obj)/efi.lds $&lt; \
 	      $(dot-target).1r.o $(dot-target).1s.o $(orphan-handling-y) \
-	      $(note_file_option) -o $@
-	$(NM) -pa --format=sysv $@ \
+	      $(note_file_option) -o $(TARGET)-syms.efi
+	$(NM) -pa --format=sysv $(TARGET)-syms.efi \
 		| $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
 		&gt; $@.map
 ifeq ($(CONFIG_DEBUG_INFO),y)
-	$(if $(filter --strip-debug,$(EFI_LDFLAGS)),:$(space))$(OBJCOPY) -O elf64-x86-64 $@ $@.elf
+	$(if $(filter --strip-debug,$(EFI_LDFLAGS)),:$(space))$(OBJCOPY) \
+		-O elf64-x86-64 $(TARGET)-syms.efi $@.elf
+endif
+	$(STRIP) $(TARGET)-syms.efi -o $@
+ifneq ($(CONFIG_DEBUG_INFO),y)
+	rm -f $(TARGET)-syms.efi
 endif
 	rm -f $(dot-target).[0-9]* $(@D)/..$(@F).[0-9]*
 ifeq ($(CONFIG_XEN_IBT),y)
</pre>
    </blockquote>
  </body>
</html>

--------------rIgHzd3MjhhWKv1T3mEQ2sVM--

