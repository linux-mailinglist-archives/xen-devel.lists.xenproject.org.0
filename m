Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F496A67CAD
	for <lists+xen-devel@lfdr.de>; Tue, 18 Mar 2025 20:06:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.919795.1324158 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tucFy-0000tx-P0; Tue, 18 Mar 2025 19:05:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 919795.1324158; Tue, 18 Mar 2025 19:05:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tucFy-0000rw-MA; Tue, 18 Mar 2025 19:05:42 +0000
Received: by outflank-mailman (input) for mailman id 919795;
 Tue, 18 Mar 2025 19:05:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b9yH=WF=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1tucFx-0000rX-7E
 for xen-devel@lists.xenproject.org; Tue, 18 Mar 2025 19:05:41 +0000
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com
 [2607:f8b0:4864:20::c2e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fac24aee-042b-11f0-9abb-95dc52dad729;
 Tue, 18 Mar 2025 20:05:39 +0100 (CET)
Received: by mail-oo1-xc2e.google.com with SMTP id
 006d021491bc7-601b1132110so2849248eaf.3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Mar 2025 12:05:39 -0700 (PDT)
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
X-Inumbo-ID: fac24aee-042b-11f0-9abb-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1742324738; x=1742929538; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M/KksLPTlwCHnKfA1GLXVQzfwBspJLeaMmBzwPwoVpg=;
        b=Pp9OhHaqn7Jw079cUTFkpc2l+rgnEbZvIpEo3ZkjSISSKNvNF1FCcIgcIOgfwybE4R
         QPGNvMvK+Sl3j0o/iNyLIfEBbEJYSFhb237/AFljlzdxV3Q+S7qUkqAkzHDfiquylTxe
         EXcgG25TBaraf4kZ701OhKnBVqZ+ftC1w4llU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742324738; x=1742929538;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M/KksLPTlwCHnKfA1GLXVQzfwBspJLeaMmBzwPwoVpg=;
        b=mpf7jQw0w9ZkKCXFfxkhaFdOXqkR/lZAUx856k9rTLicLXC5wvjgvLOg7U7P9cQ8VA
         Ex0n7vdhWLT/XDTR3Szgbb9MI+5wXs+zcnNluc7hOFwU3uM+PFfMT9oGIU3iSawGuZV/
         meY/lbH+600169v0Az0A6VmwD9vNryapplQPjBWwULl0jeMe4Mj2xglk6ez5e681MZVi
         yxVh4W8ydtF+gun0WzCJayXBQdCR1UahIEmVj2fn/dCxYFrSmd+n4K9yYQRjYLSn1Fem
         TcushQ4lr1gYkNkpT27ucsOP1D7uSli2GYHRe01dDUbm7PZpGOaQk0x/D2AYKsh6aPKA
         sOCw==
X-Gm-Message-State: AOJu0Yw/irM1TziNpAejxWOkzcMsI4B1wBe6H+eif/EOl4OjUmFcdEWi
	G233HAQRiRDy7cCBcGum+gRbzKmuUwUOnRJJPEyG0g89fLb3cliVt+YXv50oG9s0jkbRrexllgK
	SS7Ii21hXl1vP9U6BJyt+YP8YbFje02RwVKDQWw==
X-Gm-Gg: ASbGnctOuD4Y8ui5EkAMJfOFsjIj2vUbfQcmXwuVXcONHLcydW5WNBMvNYo1FxdDCWM
	PWjwiDMOYrFs6erh1XDwavOwNUtkWMAi6xz5+R2C0ORM+m2jBcj28mML2ZYmOHE+bYyFkZc69LG
	ifHPY7IUjDFAr8FC3yERtgup4=
X-Google-Smtp-Source: AGHT+IFqlwP/M+NdKrO9tjZOFkoJKlRMh1JNJSIX5OYf8uWCX5Wuq8aYQI8IK1FVu69LM2jEIFCujvHQ+94yvlHgqa4=
X-Received: by 2002:a05:6820:a00d:b0:601:af96:36eb with SMTP id
 006d021491bc7-6021cce5efamr155872eaf.4.1742324737891; Tue, 18 Mar 2025
 12:05:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250318173547.59475-1-roger.pau@citrix.com> <20250318173547.59475-5-roger.pau@citrix.com>
In-Reply-To: <20250318173547.59475-5-roger.pau@citrix.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Tue, 18 Mar 2025 19:05:26 +0000
X-Gm-Features: AQ5f1JpysMeuAuSBpmNXDH_trxlQLcsNneW2-y25le-uJHsT8S4Vf5JDFp2m8No
Message-ID: <CACHz=Zhyn54-w=dysFXwwzhdnL4RVnadKoT+hx7hR42_VrY2oA@mail.gmail.com>
Subject: Re: [PATCH 4/7] x86/boot: apply trampoline relocations at destination position
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, 
	"Daniel P. Smith" <dpsmith@apertussolutions.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 18, 2025 at 5:36=E2=80=AFPM Roger Pau Monne <roger.pau@citrix.c=
om> wrote:
>
> Change the order relocations are applied.  Currently the trampoline is
> patched for relocations before being copied to the low 1MB region.  Chang=
e
> the order and instead copy the trampoline first to the low 1MB region and
> then apply the relocations.
>
> This will allow making .init.text section read-only (so read and execute
> permissions only), which is relevant when Xen is built as a PE image.
>

This change is not enough to make the section read-only, some other
code writes directly into the trampoline at the not-relocated
position.
But this improves the situation.
The code looks fine, I'll try the code if it passes some tests I did.

> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> ---
>  xen/arch/x86/boot/build32.lds.S      |  1 +
>  xen/arch/x86/boot/head.S             |  6 +++---
>  xen/arch/x86/boot/reloc-trampoline.c | 16 ++++++++--------
>  xen/arch/x86/efi/efi-boot.h          | 15 ++++++---------
>  4 files changed, 18 insertions(+), 20 deletions(-)
>
> diff --git a/xen/arch/x86/boot/build32.lds.S b/xen/arch/x86/boot/build32.=
lds.S
> index 1e59732edd6e..92dc320b7380 100644
> --- a/xen/arch/x86/boot/build32.lds.S
> +++ b/xen/arch/x86/boot/build32.lds.S
> @@ -50,6 +50,7 @@ SECTIONS
>          DECLARE_IMPORT(__trampoline_seg_start);
>          DECLARE_IMPORT(__trampoline_seg_stop);
>          DECLARE_IMPORT(trampoline_phys);
> +        DECLARE_IMPORT(trampoline_start);
>          DECLARE_IMPORT(boot_vid_info);
>          . =3D . + GAP;
>          *(.text)
> diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
> index 59a2b5005cf6..3f81b21b5a7f 100644
> --- a/xen/arch/x86/boot/head.S
> +++ b/xen/arch/x86/boot/head.S
> @@ -679,9 +679,6 @@ trampoline_setup:
>          shr     $PAGE_SHIFT, %ecx                /* %ecx =3D Slot to wri=
te */
>          mov     %edx, sym_offs(l1_bootmap)(%esi, %ecx, 8)
>
> -        /* Apply relocations to bootstrap trampoline. */
> -        call    reloc_trampoline32
> -
>          /* Do not parse command line on EFI platform here. */
>          cmpb    $0, sym_esi(efi_platform)
>          jnz     1f
> @@ -709,6 +706,9 @@ trampoline_setup:
>          mov     $((trampoline_end - trampoline_start) / 4),%ecx
>          rep movsl
>
> +        /* Apply relocations to bootstrap trampoline. */
> +        call    reloc_trampoline32
> +
>          /* Jump into the relocated trampoline. */
>          lret
>
> diff --git a/xen/arch/x86/boot/reloc-trampoline.c b/xen/arch/x86/boot/rel=
oc-trampoline.c
> index e35e7c78aa86..ac54aef14eaf 100644
> --- a/xen/arch/x86/boot/reloc-trampoline.c
> +++ b/xen/arch/x86/boot/reloc-trampoline.c
> @@ -20,19 +20,19 @@ void reloc_trampoline64(void)
>      uint32_t phys =3D trampoline_phys;
>      const int32_t *trampoline_ptr;
>
> -    /*
> -     * Apply relocations to trampoline.
> -     *
> -     * This modifies the trampoline in place within Xen, so that it will
> -     * operate correctly when copied into place.
> -     */
> +    /* Apply relocations to trampoline after copy to destination. */
> +#define RELA_TARGET(ptr, bits) \
> +    *(uint ## bits ## _t *)(phys + *ptr + (long)ptr - (long)trampoline_s=
tart)
> +
>      for ( trampoline_ptr =3D __trampoline_rel_start;
>            trampoline_ptr < __trampoline_rel_stop;
>            ++trampoline_ptr )
> -        *(uint32_t *)(*trampoline_ptr + (long)trampoline_ptr) +=3D phys;
> +        RELA_TARGET(trampoline_ptr, 32) +=3D phys;
>
>      for ( trampoline_ptr =3D __trampoline_seg_start;
>            trampoline_ptr < __trampoline_seg_stop;
>            ++trampoline_ptr )
> -        *(uint16_t *)(*trampoline_ptr + (long)trampoline_ptr) =3D phys >=
> 4;
> +        RELA_TARGET(trampoline_ptr, 16) =3D phys >> 4;
> +
> +#undef RELA_TARGET
>  }
> diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
> index 1d8902a9a724..e4ed8639b9ac 100644
> --- a/xen/arch/x86/efi/efi-boot.h
> +++ b/xen/arch/x86/efi/efi-boot.h
> @@ -105,10 +105,8 @@ static void __init efi_arch_relocate_image(unsigned =
long delta)
>      }
>  }
>
> -static void __init relocate_trampoline(unsigned long phys)
> +static void __init relocate_trampoline(void)
>  {
> -    trampoline_phys =3D phys;
> -
>      if ( !efi_enabled(EFI_LOADER) )
>          return;
>
> @@ -213,6 +211,8 @@ static void __init efi_arch_process_memory_map(EFI_SY=
STEM_TABLE *SystemTable,
>          }
>      }
>
> +    if ( !trampoline_phys )
> +        trampoline_phys =3D cfg.addr;
>  }
>
>  static void *__init efi_arch_allocate_mmap_buffer(UINTN map_size)
> @@ -223,11 +223,7 @@ static void *__init efi_arch_allocate_mmap_buffer(UI=
NTN map_size)
>  static void __init efi_arch_pre_exit_boot(void)
>  {
>      if ( !trampoline_phys )
> -    {
> -        if ( !cfg.addr )
> -            blexit(L"No memory for trampoline");
> -        relocate_trampoline(cfg.addr);
> -    }
> +        blexit(L"No memory for trampoline");
>  }
>
>  static void __init noreturn efi_arch_post_exit_boot(void)
> @@ -236,6 +232,7 @@ static void __init noreturn efi_arch_post_exit_boot(v=
oid)
>
>      efi_arch_relocate_image(__XEN_VIRT_START - xen_phys_start);
>      memcpy(_p(trampoline_phys), trampoline_start, cfg.size);
> +    relocate_trampoline();
>
>      /*
>       * We're in physical mode right now (i.e. identity map), so a regula=
r
> @@ -638,7 +635,7 @@ static void __init efi_arch_memory_setup(void)
>      status =3D efi_bs->AllocatePages(AllocateMaxAddress, EfiLoaderData,
>                                     PFN_UP(cfg.size), &cfg.addr);
>      if ( status =3D=3D EFI_SUCCESS )
> -        relocate_trampoline(cfg.addr);
> +        trampoline_phys =3D cfg.addr;
>      else
>      {
>          cfg.addr =3D 0;

Frediano

