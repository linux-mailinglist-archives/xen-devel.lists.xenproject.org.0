Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25476C39F69
	for <lists+xen-devel@lfdr.de>; Thu, 06 Nov 2025 10:59:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1156647.1485685 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGwlb-0007a4-SU; Thu, 06 Nov 2025 09:58:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1156647.1485685; Thu, 06 Nov 2025 09:58:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGwlb-0007YD-Nk; Thu, 06 Nov 2025 09:58:55 +0000
Received: by outflank-mailman (input) for mailman id 1156647;
 Thu, 06 Nov 2025 09:58:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RMQi=5O=gmail.com=freddy77@srs-se1.protection.inumbo.net>)
 id 1vGwlZ-0006nz-U0
 for xen-devel@lists.xenproject.org; Thu, 06 Nov 2025 09:58:54 +0000
Received: from mail-yx1-xb12a.google.com (mail-yx1-xb12a.google.com
 [2607:f8b0:4864:20::b12a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 327e70fe-baf7-11f0-980a-7dc792cee155;
 Thu, 06 Nov 2025 10:58:52 +0100 (CET)
Received: by mail-yx1-xb12a.google.com with SMTP id
 956f58d0204a3-63f9beb26f7so655788d50.2
 for <xen-devel@lists.xenproject.org>; Thu, 06 Nov 2025 01:58:52 -0800 (PST)
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
X-Inumbo-ID: 327e70fe-baf7-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762423131; x=1763027931; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0qEC6mPhFeWUcv0CzUwruen+Ncg+IvqbHhJtSOKX2JY=;
        b=PKDMhNzVde7I+voygOUW9XFZO7Q4O4c/6gOUeyiQV7DUDXQNn2gy11S8ITuQrmNtnF
         yiYwjMovpobbCO5EPGZthwM3nkyrgTVJB/9vWQ2P1dGzjvJlSsSshJMkW21Odi6QiW6K
         sGxXaZO05Rogw8GsbRsMkvRTgxK8Oej2zNqin+y5KlgMEA1qOTBZnRrwBrOxC0Td9tvw
         ghpPtSHA2jCnFhmwQ5HdeSGHVfoDP8Efk+ymaGaqg0xkh6SYx/ePDwr8NLnisVbf25g/
         CN9u76PywqONfwTJn5QgWfZA7wUS/Jb6r2+lQVqZxBc9pZ/THay362uLilLt56y0djAK
         WswQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762423131; x=1763027931;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0qEC6mPhFeWUcv0CzUwruen+Ncg+IvqbHhJtSOKX2JY=;
        b=U/tJlOf+v8UXGaMu0ENEosCzIdEyq1p6dU24Fl8/tH+bP6eGl9dnTuF1zRSLojvl09
         A590G6aIVcGgWnVRT5dMclXQPdU7h2X/U5Vtey/86xAhZWFct1rNH8avZ0LYJFvHi38A
         NElMs3hYS9E/6u0pv6ZWD2pRaHMIfzLkkffsM0z+C5BPhq2jbXAYkXhrmwp3YPkDCN66
         nt5q61Zq1DTd7nlBptUvpKNiuRDVxY/w0ylAhSq0QYtuOWHT+CRg3RF9LpfxTQ3cUTpG
         GMvjzObUCbnMffbvN2UcOeNuQdoGMAH1TmYWJ1UWq+FB1Tku0ocTm2nL7dLrcdRMKvjX
         Fzkw==
X-Forwarded-Encrypted: i=1; AJvYcCX1wRB2L3OptaXkoc7KDtD3MN8bOEMlMZ3Xdj4rPmXXoNwm2aEikZepNUDZt6kK0YqFpGYTNiL6XGY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyLoTit4IeRbCtwCDcC0T2J3cJOqYaeP304GoTFqusxGKgdewXV
	qZuhw9x5U89KbvnsgoAfahrKIkL3LHDMMVb6WkVmsg/I9VQyp8XADBvv8gKa1mzXQoHMvsGDyqi
	JRZC9910DaIzvp4ETxyP550ZUUHuhkcI=
X-Gm-Gg: ASbGncum25idQsb5jwyilNzLfTO/ejs/ROEWn/7ce2F/J5ja6he8OH7WAE0e/DdZbgg
	oQfqMK5fvbcKE+VBINxpveqVeMqaeSVgq3RBQ7Hne3GGWelwIUBKDG0Lq4yUzeeu0ALNLqLeBoo
	RNjnkHDiTik7/1+ms9vHVlygeVIwCsyp8vcOiu6QCULvt9kEFRgZvw7nveUeiEjUu398v/38YFg
	O34PwIOdKap/VYudl1372MmvtwEUU3m5uDibxdgvZeTrvNq5+GR7LFT5STl
X-Google-Smtp-Source: AGHT+IGTMqxw2wLO0aj8eevOgFuuktlrPn6HMuyd3Q+8cLPgIYnW9ykm56KTR1msiDzCVuwf6PnKK5jKj4GMtvWZrak=
X-Received: by 2002:a05:690c:450c:b0:786:5712:46c7 with SMTP id
 00721157ae682-786a41be642mr96746957b3.41.1762423130731; Thu, 06 Nov 2025
 01:58:50 -0800 (PST)
MIME-Version: 1.0
References: <20251105153808.20278-1-frediano.ziglio@citrix.com>
 <fdc9fd41-2224-4672-911e-3e17b428d32a@gmail.com> <CAHt6W4eyH_7c4Q-KYaDjNJnSXjKSVNT1iSw0sNbLMXnK3iEHRg@mail.gmail.com>
 <d193feac-3285-4c26-9a8a-ba09437e7e76@gmail.com>
In-Reply-To: <d193feac-3285-4c26-9a8a-ba09437e7e76@gmail.com>
From: Frediano Ziglio <freddy77@gmail.com>
Date: Thu, 6 Nov 2025 09:58:39 +0000
X-Gm-Features: AWmQ_bka-zoJlgF7DlMyS7XzSfIs5hPxCYIwFZPWOAuxO_0Kf9qxjCF0N0UZMHI
Message-ID: <CAHt6W4fEbuk+VzjFxfz5=T8GXCVW_jSoqqMAkiQTXL79B93SPg@mail.gmail.com>
Subject: Re: [PATCH v3] xen: Strip xen.efi by default
To: Demi Marie Obenour <demiobenour@gmail.com>
Cc: Frediano Ziglio <frediano.ziglio@citrix.com>, xen-devel@lists.xenproject.org, 
	Frediano Ziglio <frediano.ziglio@cloud.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, 
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 6 Nov 2025 at 03:52, Demi Marie Obenour <demiobenour@gmail.com> wrote:
>
> On 11/5/25 21:00, Frediano Ziglio wrote:
> > On Wed, 5 Nov 2025 at 20:31, Demi Marie Obenour <demiobenour@gmail.com> wrote:
> >>
> >> On 11/5/25 10:38, Frediano Ziglio wrote:
> >>> From: Frediano Ziglio <frediano.ziglio@cloud.com>
> >>>
> >>> For xen.gz file we strip all symbols and have an additional
> >>> xen-syms file version with all symbols.
> >>> Make xen.efi more coherent stripping all symbols too.
> >>> xen-syms.efi can be used for debugging.
> >>>
> >>> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> >>> ---
> >>> Changes since v1:
> >>> - avoid leaving target if some command fails.
> >>>
> >>> Changes since v2:
> >>> - do not convert type but retain PE format;
> >>> = use xen-syms.efi for new file name, more consistent with ELF.
> >>> ---
> >>>  docs/misc/efi.pandoc  |  8 +-------
> >>>  xen/Kconfig.debug     |  9 ++-------
> >>>  xen/Makefile          | 19 -------------------
> >>>  xen/arch/x86/Makefile |  9 ++++++---
> >>>  4 files changed, 9 insertions(+), 36 deletions(-)
> >>>
> >>> diff --git a/docs/misc/efi.pandoc b/docs/misc/efi.pandoc
> >>> index 11c1ac3346..c66b18a66b 100644
> >>> --- a/docs/misc/efi.pandoc
> >>> +++ b/docs/misc/efi.pandoc
> >>> @@ -20,13 +20,7 @@ Xen to load the configuration file even if multiboot modules are found.
> >>>  Once built, `make install-xen` will place the resulting binary directly into
> >>>  the EFI boot partition, provided `EFI_VENDOR` is set in the environment (and
> >>>  `EFI_MOUNTPOINT` is overridden as needed, should the default of `/boot/efi` not
> >>> -match your system). When built with debug info, the binary can be quite large.
> >>> -Setting `INSTALL_EFI_STRIP=1` in the environment will cause it to be stripped
> >>> -of debug info in the process of installing. `INSTALL_EFI_STRIP` can also be set
> >>> -to any combination of options suitable to pass to `strip`, in case the default
> >>> -ones don't do. The xen.efi binary will also be installed in `/usr/lib64/efi/`,
> >>> -unless `EFI_DIR` is set in the environment to override this default. This
> >>> -binary will not be stripped in the process.
> >>> +match your system).
> >>>
> >>>  The binary itself will require a configuration file (names with the `.efi`
> >>>  extension of the binary's name replaced by `.cfg`, and - until an existing
> >>> diff --git a/xen/Kconfig.debug b/xen/Kconfig.debug
> >>> index d900d926c5..58ee10ee3e 100644
> >>> --- a/xen/Kconfig.debug
> >>> +++ b/xen/Kconfig.debug
> >>> @@ -147,12 +147,7 @@ config DEBUG_INFO
> >>>         Say Y here if you want to build Xen with debug information. This
> >>>         information is needed e.g. for doing crash dump analysis of the
> >>>         hypervisor via the "crash" tool.
> >>> -       Saying Y will increase the size of the xen-syms and xen.efi
> >>> -       binaries. In case the space on the EFI boot partition is rather
> >>> -       limited, you may want to install a stripped variant of xen.efi in
> >>> -       the EFI boot partition (look for "INSTALL_EFI_STRIP" in
> >>> -       docs/misc/efi.pandoc for more information - when not using
> >>> -       "make install-xen" for installing xen.efi, stripping needs to be
> >>> -       done outside the Xen build environment).
> >>> +       Saying Y will increase the size of the xen-syms and xen.efi.elf
> >>> +       binaries.
> >>>
> >>>  endmenu
> >>> diff --git a/xen/Makefile b/xen/Makefile
> >>> index ddcee8835c..605a26c181 100644
> >>> --- a/xen/Makefile
> >>> +++ b/xen/Makefile
> >>> @@ -493,22 +493,6 @@ endif
> >>>  .PHONY: _build
> >>>  _build: $(TARGET)$(CONFIG_XEN_INSTALL_SUFFIX)
> >>>
> >>> -# Strip
> >>> -#
> >>> -# INSTALL_EFI_STRIP, if defined, will cause xen.efi to be stripped before it
> >>> -# is installed. If INSTALL_EFI_STRIP is '1', then the default option(s) below
> >>> -# will be used. Otherwise, INSTALL_EFI_STRIP value will be used as the
> >>> -# option(s) to the strip command.
> >>> -ifdef INSTALL_EFI_STRIP
> >>> -
> >>> -ifeq ($(INSTALL_EFI_STRIP),1)
> >>> -efi-strip-opt := --strip-debug --keep-file-symbols
> >>> -else
> >>> -efi-strip-opt := $(INSTALL_EFI_STRIP)
> >>> -endif
> >>> -
> >>> -endif
> >>> -
> >>>  .PHONY: _install
> >>>  _install: D=$(DESTDIR)
> >>>  _install: T=$(notdir $(TARGET))
> >>> @@ -535,9 +519,6 @@ _install: $(TARGET)$(CONFIG_XEN_INSTALL_SUFFIX)
> >>>               ln -sf $(T)-$(XEN_FULLVERSION).efi $(D)$(EFI_DIR)/$(T)-$(XEN_VERSION).efi; \
> >>>               ln -sf $(T)-$(XEN_FULLVERSION).efi $(D)$(EFI_DIR)/$(T).efi; \
> >>>               if [ -n '$(EFI_MOUNTPOINT)' -a -n '$(EFI_VENDOR)' ]; then \
> >>> -                     $(if $(efi-strip-opt), \
> >>> -                          $(STRIP) $(efi-strip-opt) -p -o $(TARGET).efi.stripped $(TARGET).efi && \
> >>> -                          $(INSTALL_DATA) $(TARGET).efi.stripped $(D)$(EFI_MOUNTPOINT)/efi/$(EFI_VENDOR)/$(T)-$(XEN_FULLVERSION).efi ||) \
> >>>                       $(INSTALL_DATA) $(TARGET).efi $(D)$(EFI_MOUNTPOINT)/efi/$(EFI_VENDOR)/$(T)-$(XEN_FULLVERSION).efi; \
> >>>               elif [ "$(D)" = "$(patsubst $(shell cd $(XEN_ROOT) && pwd)/%,%,$(D))" ]; then \
> >>>                       echo 'EFI installation only partially done (EFI_VENDOR not set)' >&2; \
> >>> diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
> >>> index 407571c510..c118ab7b7d 100644
> >>> --- a/xen/arch/x86/Makefile
> >>> +++ b/xen/arch/x86/Makefile
> >>> @@ -228,14 +228,17 @@ endif
> >>>       $(MAKE) $(build)=$(@D) .$(@F).1r.o .$(@F).1s.o
> >>>       $(LD) $(call EFI_LDFLAGS,$(VIRT_BASE)) -T $(obj)/efi.lds $< \
> >>>             $(dot-target).1r.o $(dot-target).1s.o $(orphan-handling-y) \
> >>> -           $(note_file_option) -o $@
> >>> -     $(NM) -pa --format=sysv $@ \
> >>> +           $(note_file_option) -o $@.tmp
> >>> +     $(NM) -pa --format=sysv $@.tmp \
> >>>               | $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
> >>>               > $@.map
> >>>  ifeq ($(CONFIG_DEBUG_INFO),y)
> >>> -     $(if $(filter --strip-debug,$(EFI_LDFLAGS)),:$(space))$(OBJCOPY) -O elf64-x86-64 $@ $@.elf
> >>> +     $(if $(filter --strip-debug,$(EFI_LDFLAGS)),:$(space))cp -f \
> >>> +        $@.tmp $(TARGET)-syms.efi
> >>> +     $(if $(filter --strip-debug,$(EFI_LDFLAGS)),:$(space))$(STRIP) $@.tmp
> >>>  endif
> >>>       rm -f $(dot-target).[0-9]* $(@D)/..$(@F).[0-9]*
> >>> +     mv -f $@.tmp $@
> >>>  ifeq ($(CONFIG_XEN_IBT),y)
> >>>       $(SHELL) $(srctree)/tools/check-endbr.sh $@
> >>>  endif
> >>
> >> Does this also strip the string table from xen.efi?  I'm concerned that
> >> signing xen.efi for secure boot won't work if there is a string table.
> >> In particular, it appears that EDK2 will miscalculate the file hash if
> >> the string table is before the signature.  Moving the string table after
> >> the signature invalidates the pointer to it.  The only exception is if
> >> the string table is itself in a section, but I don't know if that is the
> >> case.
> >
> > I don't know if the string table is stripped but I can surely confirm
> > that signing xen.efi is working with secure boot.
> >
> > Frediano
>
> Does objdump on the signed file return correct section names?

From objdump -x

Sections:
Idx Name          Size      VMA               LMA               File off  Algn
  0 .text         0016c9ae  ffff82d040200000  ffff82d040200000  00000320  2**4
                  CONTENTS, ALLOC, LOAD, READONLY, CODE
  1 .rodata       0006b9e8  ffff82d040400000  ffff82d040400000  0016cce0  2**2
                  CONTENTS, ALLOC, LOAD, DATA
  2 .buildid      00000035  ffff82d04046c000  ffff82d04046c000  001d86e0  2**2
                  CONTENTS, ALLOC, LOAD, READONLY, DATA
  3 .init.text    0004d123  ffff82d040600000  ffff82d040600000  001d8720  2**2
                  CONTENTS, ALLOC, LOAD, READONLY, CODE
  4 .init.data    0006c9b0  ffff82d040800000  ffff82d040800000  00225860  2**2
                  CONTENTS, ALLOC, LOAD, DATA
  5 .data.read_mostly 00028da8  ffff82d040a00000  ffff82d040a00000
00292220  2**4
                  CONTENTS, ALLOC, LOAD, DATA
  6 .data         0000feec  ffff82d040a29000  ffff82d040a29000  002bafe0  2**4
                  CONTENTS, ALLOC, LOAD, DATA
  7 .bss          00223108  ffff82d040a39000  ffff82d040a39000  00000000  2**4
                  ALLOC
  8 .reloc        000016b8  ffff82d040c5d000  ffff82d040c5d000  002caee0  2**2
                  CONTENTS, ALLOC, LOAD, READONLY, DATA
  9 .sbat         000000a6  ffff82d040c5f000  ffff82d040c5f000  002cc5a0  2**2
                  CONTENTS, READONLY

Which looks correct.

From hexdump -C I can see close to the end

...
002cc580  30 ae 38 ae 60 ae 00 00  00 80 a3 00 10 00 00 00  |0.8.`...........|
002cc590  a0 ae c0 ae e0 ae 00 00  00 00 00 00 00 00 00 00  |................|
002cc5a0  73 62 61 74 2c 31 2c 53  42 41 54 20 56 65 72 73  |sbat,1,SBAT Vers|
002cc5b0  69 6f 6e 2c 73 62 61 74  2c 31 2c 68 74 74 70 73  |ion,sbat,1,https|
002cc5c0  3a 2f 2f 67 69 74 68 75  62 2e 63 6f 6d 2f 72 68  |://github.com/rh|
002cc5d0  62 6f 6f 74 2f 73 68 69  6d 2f 62 6c 6f 62 2f 6d  |boot/shim/blob/m|
002cc5e0  61 69 6e 2f 53 42 41 54  2e 6d 64 0a 78 65 6e 2e  |ain/SBAT.md.xen.|
002cc5f0  78 73 2c 31 2c 43 6c 6f  75 64 20 53 6f 66 74 77  |xs,1,Cloud Softw|
002cc600  61 72 65 20 47 72 6f 75  70 2c 78 65 6e 2c 34 2e  |are Group,xen,4.|
002cc610  32 30 2e 31 2d 37 2e 32  32 2e 67 33 65 30 36 37  |20.1-7.22.g3e067|
002cc620  32 36 62 2e 78 73 39 2c  6d 61 69 6c 74 6f 3a 73  |26b.xs9,mailto:s|
002cc630  65 63 75 72 69 74 79 40  78 65 6e 73 65 72 76 65  |ecurity@xenserve|
002cc640  72 2e 63 6f 6d 0a 00 00  00 00 00 00 00 00 00 00  |r.com...........|
002cc650  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
002cc660  2c 00 00 00 2e 69 6e 69  74 2e 74 65 78 74 00 2e  |,....init.text..|
002cc670  69 6e 69 74 2e 64 61 74  61 00 2e 64 61 74 61 2e  |init.data..data.|
002cc680  72 65 61 64 5f 6d 6f 73  74 6c 79 00 00 00 00 00  |read_mostly.....|
002cc690  9e 05 00 00 00 02 02 00  30 82 05 92 06 09 2a 86  |........0.....*.|
002cc6a0  48 86 f7 0d 01 07 02 a0  82 05 83 30 82 05 7f 02  |H..........0....|
002cc6b0  01 01 31 0f 30 0d 06 09  60 86 48 01 65 03 04 02  |..1.0...`.H.e...|
002cc6c0  01 05 00 30 5c 06 0a 2b  06 01 04 01 82 37 02 01  |...0\..+.....7..|
002cc6d0  04 a0 4e 30 4c 30 17 06  0a 2b 06 01 04 01 82 37  |..N0L0...+.....7|
002cc6e0  02 01 0f 30 09 03 01 00  a0 04 a2 02 80 00 30 31  |...0..........01|
002cc6f0  30 0d 06 09 60 86 48 01  65 03 04 02 01 05 00 04  |0...`.H.e.......|
002cc700  20 e2 47 64 f8 e8 7b 62  eb 17 e0 13 0a 0d 93 02  | .Gd..{b........|
002cc710  7a d8 3b f0 20 a8 ee 3d  49 98 3f de c1 47 de 15  |z.;. ..=I.?..G..|
002cc720  43 a0 82 03 2c 30 82 03  28 30 82 02 10 a0 03 02  |C...,0..(0......|
002cc730  01 02 02 11 00 8f fc 11  bf 41 54 40 74 89 2c 53  |.........AT@t.,S|
002cc740  a5 78 c1 e8 32 30 0d 06  09 2a 86 48 86 f7 0d 01  |.x..20...*.H....|
002cc750  01 0b 05 00 30 1c 31 1a  30 18 06 03 55 04 03 13  |....0.1.0...U...|
002cc760  11 58 65 6e 53 65 72 76  65 72 20 58 65 6e 20 64  |.XenServer Xen d|
002cc770  65 76 30 1e 17 0d 32 35  30 33 32 30 31 36 35 35  |ev0...2503201655|
002cc780  30 37 5a 17 0d 33 37 30  31 31 39 30 33 31 34 30  |07Z..37011903140|
002cc790  37 5a 30 1c 31 1a 30 18  06 03 55 04 03 13 11 58  |7Z0.1.0...U....X|
002cc7a0  65 6e 53 65 72 76 65 72  20 58 65 6e 20 64 65 76  |enServer Xen dev|
...

So, this confirms that the string table is there to support larger
section names and the signature is there and it's working.

--
Frediano

