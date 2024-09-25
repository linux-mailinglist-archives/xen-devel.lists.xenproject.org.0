Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D01986698
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 20:55:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.804531.1215540 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stX9x-0007GF-KI; Wed, 25 Sep 2024 18:54:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 804531.1215540; Wed, 25 Sep 2024 18:54:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stX9x-0007Dh-H7; Wed, 25 Sep 2024 18:54:45 +0000
Received: by outflank-mailman (input) for mailman id 804531;
 Wed, 25 Sep 2024 18:54:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=m3xb=QX=gmail.com=ubizjak@srs-se1.protection.inumbo.net>)
 id 1stX9v-0007Db-8v
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2024 18:54:43 +0000
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [2607:f8b0:4864:20::b35])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9f28d7e1-7b6f-11ef-a0ba-8be0dac302b0;
 Wed, 25 Sep 2024 20:54:42 +0200 (CEST)
Received: by mail-yb1-xb35.google.com with SMTP id
 3f1490d57ef6-e1a9463037cso155926276.2
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2024 11:54:42 -0700 (PDT)
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
X-Inumbo-ID: 9f28d7e1-7b6f-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727290481; x=1727895281; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r9JiPc1e2s96zySsIYz0vtObK76Zc9LQl9NPrLea+EU=;
        b=l/VXz5kdeFGZDbw/VgMn+Bh+kDpVL4yBIiuMExqWlZU5QsIfve6DoCdgmkmkkG3aVT
         YNc++T3BBcC64FMtCYkZRsmW0LMAnjoGrcOSI1cYzpKZM3LmE1C/9EXeExldAJEwvTB8
         VguFDdQ2srZX92d86wiXsMqKXnIN88HrXQPl1lKMNf0+K9XjPZ0ZW7V4ewPb/9sX3TP5
         VdN+hX2wBYqFVyDMW9AS7ZrhWzrLSSioV+sUhJVx+mzg4227x8ZLdDmoof0P2WRvKmNU
         ArR6QcV1Ef9K/Qjr8B07rydYZOQxnoxnJl5Ee9vlXbgzZiRGWD084GQ/pBdTqHoybC9F
         YXFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727290481; x=1727895281;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r9JiPc1e2s96zySsIYz0vtObK76Zc9LQl9NPrLea+EU=;
        b=QfTnQKhtx3rF7Xn41QL2Twx0ATrlKk9ND+8dKql2/URMJ0oPCdjJ989s3L3/Jp6UJv
         VC3yqrOv29DjoLNaGIPpbbOWu0K4g7azQzFs0UPti5/rqNrAYBhvs8hNPZPckeGrrC6Y
         HkSGeqAyWFy1HrGog49q/2EvckZsDG8ePlIiZBb2EyFzOqMnMj4k97rIO+7Dc/zNay8j
         byr1hYlkIVTxOW06PQjSRx2FHViHTAPv0SdbqJ21Yn9zSfxi4A52eHPOFg6RjLnoJ3Sm
         SZx9KatcCk+6Y0OSIeCPnG5IiMDU4ws7H3C2edWuwgfAdx5TP7uBnB8vIxdXK/3dw3Ox
         iFFw==
X-Forwarded-Encrypted: i=1; AJvYcCXrbr2QhDFLt3rUoGjYPOEtuA8Ch8yG2UfRegSm22AnM/DNWz/VlMncReaVBjpHCQ3Pe/Q7PGOhpdI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzrmAsw+MhkBVpt3/uWutRi6UMrY2ZmyVP4cwzingezHYgmIvmT
	QmIQ+wrIeTmNXpkqdU4qJG0xF0cT1Fvc/RFsXPkfhJbEYMCwfqDGRY7+QoRAGYcL/yvZcG/EdUh
	D6wriDlCRKUa9fbt12RkvTs/9ag4=
X-Google-Smtp-Source: AGHT+IE/AomPxV+6jhO1GTARWYosyPljDGpP1e9/F5qpa8tECBRSERkhi1mCuqRBaFK/92IcWIO0AVaTr2ic/OREhJo=
X-Received: by 2002:a05:690c:f08:b0:65f:d27d:3f6a with SMTP id
 00721157ae682-6e21d84c92emr41522977b3.7.1727290480582; Wed, 25 Sep 2024
 11:54:40 -0700 (PDT)
MIME-Version: 1.0
References: <20240925150059.3955569-30-ardb+git@google.com> <20240925150059.3955569-57-ardb+git@google.com>
In-Reply-To: <20240925150059.3955569-57-ardb+git@google.com>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Wed, 25 Sep 2024 20:54:27 +0200
Message-ID: <CAFULd4YnvhnUvq8epLqFs3hXLMCCrEi=HTRtRkLm4fg9YbP10g@mail.gmail.com>
Subject: Re: [RFC PATCH 27/28] x86/kernel: Switch to PIE linking for the core kernel
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@linux.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, Juergen Gross <jgross@suse.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Masahiro Yamada <masahiroy@kernel.org>, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Keith Packard <keithp@keithp.com>, 
	Justin Stitt <justinstitt@google.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, linux-doc@vger.kernel.org, 
	linux-pm@vger.kernel.org, kvm@vger.kernel.org, xen-devel@lists.xenproject.org, 
	linux-efi@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-sparse@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev, Hou Wenlong <houwenlong.hwl@antgroup.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 25, 2024 at 5:02=E2=80=AFPM Ard Biesheuvel <ardb+git@google.com=
> wrote:
>
> From: Ard Biesheuvel <ardb@kernel.org>
>
> Build the kernel as a Position Independent Executable (PIE). This
> results in more efficient relocation processing for the virtual
> displacement of the kernel (for KASLR). More importantly, it instructs
> the linker to generate what is actually needed (a program that can be
> moved around in memory before execution), which is better than having to
> rely on the linker to create a position dependent binary that happens to
> tolerate being moved around after poking it in exactly the right manner.
>
> Note that this means that all codegen should be compatible with PIE,
> including Rust objects, so this needs to switch to the small code model
> with the PIE relocation model as well.

I think that related to this work is the patch series [1] that
introduces the changes necessary to build the kernel as Position
Independent Executable (PIE) on x86_64 [1]. There are some more places
that need to be adapted for PIE. The patch series also introduces
objtool functionality to add validation for x86 PIE.

[1] "[PATCH RFC 00/43] x86/pie: Make kernel image's virtual address flexibl=
e"
https://lore.kernel.org/lkml/cover.1682673542.git.houwenlong.hwl@antgroup.c=
om/

Uros.

>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  arch/x86/Kconfig                        |  2 +-
>  arch/x86/Makefile                       | 11 +++++++----
>  arch/x86/boot/compressed/misc.c         |  2 ++
>  arch/x86/kernel/vmlinux.lds.S           |  5 +++++
>  drivers/firmware/efi/libstub/x86-stub.c |  2 ++
>  5 files changed, 17 insertions(+), 5 deletions(-)
>
> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> index 54cb1f14218b..dbb4d284b0e1 100644
> --- a/arch/x86/Kconfig
> +++ b/arch/x86/Kconfig
> @@ -2187,7 +2187,7 @@ config RANDOMIZE_BASE
>  # Relocation on x86 needs some additional build support
>  config X86_NEED_RELOCS
>         def_bool y
> -       depends on RANDOMIZE_BASE || (X86_32 && RELOCATABLE)
> +       depends on X86_32 && RELOCATABLE
>
>  config PHYSICAL_ALIGN
>         hex "Alignment value to which kernel should be aligned"
> diff --git a/arch/x86/Makefile b/arch/x86/Makefile
> index 83d20f402535..c1dcff444bc8 100644
> --- a/arch/x86/Makefile
> +++ b/arch/x86/Makefile
> @@ -206,9 +206,8 @@ else
>                  PIE_CFLAGS-$(CONFIG_SMP) +=3D -mstack-protector-guard-re=
g=3Dgs
>          endif
>
> -        # Don't emit relaxable GOTPCREL relocations
> -        KBUILD_AFLAGS_KERNEL +=3D -Wa,-mrelax-relocations=3Dno
> -        KBUILD_CFLAGS_KERNEL +=3D -Wa,-mrelax-relocations=3Dno $(PIE_CFL=
AGS-y)
> +        KBUILD_CFLAGS_KERNEL   +=3D $(PIE_CFLAGS-y)
> +        KBUILD_RUSTFLAGS_KERNEL        +=3D -Ccode-model=3Dsmall -Creloc=
ation-model=3Dpie
>  endif
>
>  #
> @@ -264,12 +263,16 @@ else
>  LDFLAGS_vmlinux :=3D
>  endif
>
> +ifdef CONFIG_X86_64
> +ldflags-pie-$(CONFIG_LD_IS_LLD)        :=3D --apply-dynamic-relocs
> +ldflags-pie-$(CONFIG_LD_IS_BFD)        :=3D -z call-nop=3Dsuffix-nop
> +LDFLAGS_vmlinux                        +=3D --pie -z text $(ldflags-pie-=
y)
> +
>  #
>  # The 64-bit kernel must be aligned to 2MB.  Pass -z max-page-size=3D0x2=
00000 to
>  # the linker to force 2MB page size regardless of the default page size =
used
>  # by the linker.
>  #
> -ifdef CONFIG_X86_64
>  LDFLAGS_vmlinux +=3D -z max-page-size=3D0x200000
>  endif
>
> diff --git a/arch/x86/boot/compressed/misc.c b/arch/x86/boot/compressed/m=
isc.c
> index 89f01375cdb7..79e3ffe16f61 100644
> --- a/arch/x86/boot/compressed/misc.c
> +++ b/arch/x86/boot/compressed/misc.c
> @@ -495,6 +495,8 @@ asmlinkage __visible void *extract_kernel(void *rmode=
, unsigned char *output)
>                 error("Destination virtual address changed when not reloc=
atable");
>  #endif
>
> +       boot_params_ptr->kaslr_va_shift =3D virt_addr - LOAD_PHYSICAL_ADD=
R;
> +
>         debug_putstr("\nDecompressing Linux... ");
>
>         if (init_unaccepted_memory()) {
> diff --git a/arch/x86/kernel/vmlinux.lds.S b/arch/x86/kernel/vmlinux.lds.=
S
> index f7e832c2ac61..d172e6e8eaaf 100644
> --- a/arch/x86/kernel/vmlinux.lds.S
> +++ b/arch/x86/kernel/vmlinux.lds.S
> @@ -459,6 +459,11 @@ xen_elfnote_phys32_entry_offset =3D
>
>         DISCARDS
>
> +       /DISCARD/ : {
> +               *(.dynsym .gnu.hash .hash .dynamic .dynstr)
> +               *(.interp .dynbss .eh_frame .sframe)
> +       }
> +
>         /*
>          * Make sure that the .got.plt is either completely empty or it
>          * contains only the lazy dispatch entries.
> diff --git a/drivers/firmware/efi/libstub/x86-stub.c b/drivers/firmware/e=
fi/libstub/x86-stub.c
> index f8e465da344d..5c03954924fe 100644
> --- a/drivers/firmware/efi/libstub/x86-stub.c
> +++ b/drivers/firmware/efi/libstub/x86-stub.c
> @@ -912,6 +912,8 @@ static efi_status_t efi_decompress_kernel(unsigned lo=
ng *kernel_entry)
>         if (status !=3D EFI_SUCCESS)
>                 return status;
>
> +       boot_params_ptr->kaslr_va_shift =3D virt_addr - LOAD_PHYSICAL_ADD=
R;
> +
>         entry =3D decompress_kernel((void *)addr, virt_addr, error);
>         if (entry =3D=3D ULONG_MAX) {
>                 efi_free(alloc_size, addr);
> --
> 2.46.0.792.g87dc391469-goog
>

