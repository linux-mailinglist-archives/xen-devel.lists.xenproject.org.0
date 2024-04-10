Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF4089EF09
	for <lists+xen-devel@lfdr.de>; Wed, 10 Apr 2024 11:42:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.702969.1098693 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruUSj-00013L-Am; Wed, 10 Apr 2024 09:41:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 702969.1098693; Wed, 10 Apr 2024 09:41:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruUSj-00011E-7R; Wed, 10 Apr 2024 09:41:49 +0000
Received: by outflank-mailman (input) for mailman id 702969;
 Wed, 10 Apr 2024 09:41:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NLmP=LP=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1ruUSi-00010m-BG
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2024 09:41:48 +0000
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [2607:f8b0:4864:20::1030])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8b63205e-f71e-11ee-94a3-07e782e9044d;
 Wed, 10 Apr 2024 11:41:46 +0200 (CEST)
Received: by mail-pj1-x1030.google.com with SMTP id
 98e67ed59e1d1-2a536b08d63so1939956a91.1
 for <xen-devel@lists.xenproject.org>; Wed, 10 Apr 2024 02:41:46 -0700 (PDT)
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
X-Inumbo-ID: 8b63205e-f71e-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1712742105; x=1713346905; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xqMRxOb/MoLU81En1hAr8zM8il7853Hn2/m88F6Q4ds=;
        b=kWKuCrbn79tvikK81J4Mv0GWOjqzQS/W94fGKW38Asa8v7TWnXbL38ivrF8+ReDX5d
         XTawvt4k2No9GIZlTN7sxgQqDkbiouFuZ2JDad05o+JlodgI1lwj+8L2XwVRXlvWpfG1
         JSVD4emUH+F09pmselKFfKy0EfcddzRhKsvDg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712742105; x=1713346905;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xqMRxOb/MoLU81En1hAr8zM8il7853Hn2/m88F6Q4ds=;
        b=OCl3yXJMmukNMGfqhEQyqX7mj/V3HHy+EHmiLwnahqt6HAxND6wtWPDZOgho0GlzGL
         RzhbYSB59vIIQz1xLEsClNLODpiMUs+b6vihqcD2+NWRHvFuG4whBKSDl8ejgpATi05q
         big4dofNlsk4soQ+sR33h0jAySx89XH4+hxihozU8NDUmth2ZVr+/VkaEZFNF913C44E
         sSXB1Hf0cHPkCBlKJu+vuR/kAtBiRGoARGH6K84GElP/ruuwSUKOz1WMkoHJ8kgzFeWa
         K6NKSzzAB1Z44azlCNvZwy8XCU5RHcWax1++ePazO9sfSVLuNPRq0PJo0BI2+uXaSUvH
         iZ5A==
X-Forwarded-Encrypted: i=1; AJvYcCXeM8hlbEs3aDTsHL1ThZ6Gn1S8lyq6F3kjehP57QntRq8OvvZLrefln1IljKL2nJLA4FTOL3M+psw2XIMtjR+Jq7zYzKFXkVd39vYrzbc=
X-Gm-Message-State: AOJu0YyhB/VFgTfXbcfw5k8dG4A8UWkAz3cN0qV8IK4jHcPZ9Ge4C6ie
	Xd6ZHvHlcspfaX0Ku+8lob7I9Eexpxs0KU4uKH11gOd3YWh8l++cqhadIyFhLrFs8OJPXzFW93Y
	H8JXXi+WQt3KGk/9QD1JxIuDTyLmgD6hU1f6Q
X-Google-Smtp-Source: AGHT+IF0mQn9zh77uCBA1ty9p978L2N460uKhIkzUYw/83lwxvyXrNes+qk3zndjyT/eztyI9cZCkIxi1zZNp0RC39M=
X-Received: by 2002:a17:90a:b786:b0:29b:961a:29c3 with SMTP id
 m6-20020a17090ab78600b0029b961a29c3mr1683796pjr.49.1712742104692; Wed, 10 Apr
 2024 02:41:44 -0700 (PDT)
MIME-Version: 1.0
References: <20240328151106.1451104-1-ross.lagerwall@citrix.com>
 <20240328151106.1451104-2-ross.lagerwall@citrix.com> <c3c2ce12-0699-42b3-bcaf-5bddf0616566@suse.com>
In-Reply-To: <c3c2ce12-0699-42b3-bcaf-5bddf0616566@suse.com>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Date: Wed, 10 Apr 2024 10:41:32 +0100
Message-ID: <CAG7k0EroeA=cRRDWnJqzH8esoaSmtg8-xjTwc-01og5R9JwPzg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] x86: Add support for building a multiboot2 PE binary
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 8, 2024 at 11:25=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 28.03.2024 16:11, Ross Lagerwall wrote:
> > In addition to building xen.efi and xen.gz, build xen-mbi.exe. The
> > latter is a PE binary that can be used with a multiboot2 loader that
> > supports loading PE binaries.
>
> I have to admit I find .exe a strange extension outside of the Windows
> world. Would it be an option to have no extension at all (xen-mbi), or
> use xen.mbi?

Sure, I have no strong preference on the name. I'll change it to
xen-mbi.

>
> > Using this option allows the binary to be signed and verified by Shim.
> > This means the same xen-mbi.exe binary can then be used for BIOS boot,
> > UEFI Boot and UEFI boot with Secure Boot verification (all with the
> > convenience of GRUB2 as a bootloader).
>
> With which "UEFI boot" really means "chainloader" from grub? That isn't
> required though, is it? I.e. "UEFI boot" ought to work also without
> involving grub?

There are a few comments here related to terminology and purpose so let
me try and clarify them in one place...

These are the existing methods of booting Xen on x86 that I know of:

* UEFI firmware boots xen.efi directly. This can be used with
  Secure Boot enabled.

* UEFI GRUB2 chainloads xen.efi by calling the firmware's
  LoadImage/StartImage. This can be used with Secure Boot enabled.

* BIOS GRUB2 boots xen.gz via multiboot1 protocol.

* BIOS GRUB2 boots xen.gz via multiboot2 protocol.

* UEFI GRUB2 boots xen.gz via multiboot2 protocol. This is much the
  same as the previous ,ethod but it does use a different entry point.
  This cannot be used with Secure Boot because Shim can only verify PE
  binaries.

These methods _do not_ work:

* BIOS GRUB2 boots xen.efi via multiboot2 protocol.

* UEFI GRUB2 boots xen.efi via multiboot2 protocol (despite what is
  implied by https://xenbits.xen.org/docs/unstable/misc/efi.html).

* Shim chainloads xen.efi. AFAICT this may have worked some time in
  the past but it doesn't currently work in my testing.

* GRUB2 verifies xen.efi using Shim and then chainloads it using an
  internal PE loader. This functionality doesn't exist in upstream
  GRUB. There are some distro patches to implement this functionality
  but they did not work with Xen when I tested them (probably for the
  same reason as the previous method).

This patch series adds 2 new methods of booting Xen:

* BIOS GRUB2 boots xen-mbi via multiboot2 protocol.

* UEFI GRUB2 boots xen-mbi via multiboot2 protocol. This supports
  Secure Boot by making it possible to call back to Shim to verify
  Xen.

We want to add Secure Boot support to XenServer and to that end, the
boot methods added by this patch are preferable to the existing boot
methods for a few reasons:

* We want a similar user experience regardless of whether BIOS or UEFI
  is used.
* When using GRUB2/multiboot, the boot files (xen.gz, vmlinuz, initrd)
  can be stored outside of the ESP which is preferable since the ESP
  is less flexible and is often somewhat limited in size.
* Using GRUB2/multiboot makes it easier to edit the Xen/Dom0
  command-line while booting / recovering a host compared with the
  config files used by the direct EFI boot.
* Using GRUB2 makes it easier to choose different boot options rather
  than having to use the firmware boot menu which is often quite
  unpleasant. Yes, we could use a UEFI bootloader like rEFInd to help
  with this but that then goes back to the first point about user
  experience.
* For development it makes life easier to always have a single Xen
  binary that is used regardless of whether BIOS/UEFI is used.

The terminology used in the patch description was not particularly
precise. To clarify, "BIOS boot" means booting xen-mbi via the
multiboot2 protocol with a BIOS-booted bootloader (like GRUB2).
"(U)EFI boot" means booting xen-mbi via the multiboot2 protocol with
a UEFI bootloader (like GRUB2).

>
> > The new binary is created by modifying xen.efi:
> > * Relocations are stripped since they are not needed.
>
> Because of the changed entry point, aiui. What hasn't become clear to
> me is what difference in functionality there's going to be between
> booting this new image in "UEFI boot" mode vs using xen.efi. Clearly
> xen.efi's own (EFI-level) command line options won't be available. But
> it feels like there might be more.

Indeed, relocations are not needed because we're using the multiboot2
entry point which handles everything without the need for relocations.

Hopefully the long comment above addresses why this patch is useful.

>
> > * The image base address is set to 0 since it must necessarily be below
> >   4 GiB and the loader will relocate it anyway.
>
> While technically okay, what is the reason for this adjustment?

The multiboot2 spec generally uses 32 bit addresses for everything and
says:

"The bootloader must not load any part of the kernel, the modules, the
Multiboot2 information structure, etc. higher than 4 GiB - 1."

An image base address above 4 GiB causes trouble because multiboot2
wasn't designed for this.

>
> > * The PE entry point is set to the multiboot2 entry point rather than
> >   the normal EFI entry point. This is only relevant for BIOS boot since
> >   for EFI boot the entry point is specified via a multiboot2 tag.
>
> Hmm, I may then be confused about the terminology further up: What is
> "BIOS boot" then? So far I've taken that as the equivalent of xen.gz's
> way of being booted (i.e. grub without EFI underneath).

Hopefully the long comment above clarifies the terminology.

>
> > @@ -123,6 +124,19 @@ syms-warn-dup-$(CONFIG_ENFORCE_UNIQUE_SYMBOLS) :=
=3D --error-dup
> >
> >  orphan-handling-$(call ld-option,--orphan-handling=3Dwarn) +=3D --orph=
an-handling=3Dwarn
> >
> > +ifeq ($(XEN_BUILD_PE),y)
> > +$(TARGET)-mbi.exe: $(TARGET).efi $(obj)/efi/modify-mbi-exe
> > +     $(OBJCOPY) --remove-section=3D.reloc $< $@.tmp
> > +     $(obj)/efi/modify-mbi-exe $@.tmp
> > +     $(OBJCOPY) --set-start=3D0x$$($(NM) -pa $@.tmp | awk '/T start$$/=
{print $$1}') $@.tmp $@.tmp2
>
> I understand section removal is better done by objcopy. Changing the entr=
y
> point could be done by the new tool, though (by passing it the designated
> address)?

Sure, I can do that if you would prefer.

>
> As to stripping .reloc - generally this needs accompanying by setting the
> "relocations stripped" flag in the COFF(?) header. Here, however, I take
> it this is not only not needed, but actually not wanted. This imo wants
> saying somewhere; the individual steps done here could do with brief
> comments anyway, imo.

Correct, it is not wanted. I can add some descriptive comments.

>
> > --- /dev/null
> > +++ b/xen/arch/x86/efi/modify-mbi-exe.c
> > @@ -0,0 +1,77 @@
> > +#include <stdio.h>
> > +#include <stdint.h>
> > +#include <unistd.h>
> > +#include <fcntl.h>
> > +
> > +struct mz_hdr {
> > +    uint16_t signature;
> > +#define MZ_SIGNATURE 0x5a4d
> > +    uint16_t last_page_size;
> > +    uint16_t page_count;
> > +    uint16_t relocation_count;
> > +    uint16_t header_paras;
> > +    uint16_t min_paras;
> > +    uint16_t max_paras;
> > +    uint16_t entry_ss;
> > +    uint16_t entry_sp;
> > +    uint16_t checksum;
> > +    uint16_t entry_ip;
> > +    uint16_t entry_cs;
> > +    uint16_t relocations;
> > +    uint16_t overlay;
> > +    uint8_t reserved[32];
> > +    uint32_t extended_header_base;
> > +};
> > +
> > +struct coff_hdr {
> > +    uint32_t signature;
> > +    uint16_t cpu;
> > +    uint16_t section_count;
> > +    int32_t timestamp;
> > +    uint32_t symbols_file_offset;
> > +    uint32_t symbol_count;
> > +    uint16_t opt_hdr_size;
> > +    uint16_t flags;
> > +};
>
> I can't spot any use of this struct.
>

Indeed, though this will actually be used if changing the entry point
is done with this tool so I'll probably keep it.

Thanks for your review,
Ross

