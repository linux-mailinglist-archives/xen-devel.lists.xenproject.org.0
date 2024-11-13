Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDEAC9C6D3A
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2024 11:58:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.835361.1251230 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBB56-0001Cf-6p; Wed, 13 Nov 2024 10:58:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 835361.1251230; Wed, 13 Nov 2024 10:58:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBB56-0001B9-3g; Wed, 13 Nov 2024 10:58:40 +0000
Received: by outflank-mailman (input) for mailman id 835361;
 Wed, 13 Nov 2024 10:58:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1B9J=SI=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1tBB54-0001B3-Dj
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2024 10:58:38 +0000
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com
 [2607:f8b0:4864:20::c31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 39868a86-a1ae-11ef-99a3-01e77a169b0f;
 Wed, 13 Nov 2024 11:58:34 +0100 (CET)
Received: by mail-oo1-xc31.google.com with SMTP id
 006d021491bc7-5ee53b30470so2649231eaf.3
 for <xen-devel@lists.xenproject.org>; Wed, 13 Nov 2024 02:58:34 -0800 (PST)
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
X-Inumbo-ID: 39868a86-a1ae-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjI2MDc6ZjhiMDo0ODY0OjIwOjpjMzEiLCJoZWxvIjoibWFpbC1vbzEteGMzMS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjM5ODY4YTg2LWExYWUtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNDk1NTE0LjE4NjU2Mywic2VuZGVyIjoiZnJlZGlhbm8uemlnbGlvQGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1731495513; x=1732100313; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tyGWgqc4ibN5N7aw3VjeRozCnjQ/b0STP9Xy3TONgAE=;
        b=cZj64KXq6O1QjJn1m6oBDN/KqvLwSyOw2JDnsPrSl565Q8th1tcYq2uMGE/+bOsEuP
         Eo7eUJ0s/zaZE7Q7J5LRiRKHg7JVMnPJ5NGvsFTzD+M2NCF3JqZW132dKWzBQbexnpFE
         Z0HlrE1PuI9WuP6dahYzHN9qVJHygBn5PzksU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731495513; x=1732100313;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tyGWgqc4ibN5N7aw3VjeRozCnjQ/b0STP9Xy3TONgAE=;
        b=Ncv5FSOARPKi8jyPsP0IjrGFpEyoJ4UMQrlf0wBsiIeI0RvTuFiUQDhKKbz4qtI9dM
         t85AiSDKKOzIybBd2+dlGZhE5MCk2tX0hCFrDxnJchW5/0wATP/4i6jpPu2+Hs4k9klI
         KTqxIQG1EUyBAp6ws5KQKgp+8ol6jaqExcEn0iA7GiXxS5RiYF8JB7om2NChJA4mlXVX
         K/wPTQepx72xCMzOK7Jq3hfLyQlAj9TDjb59KrEMgxEbQlRJycsQJt1XGdf0tlk0OnLH
         3f05uPLZc87vRmi/jKqqIrTQ+iUDPRYYIw5oXpcsSLJyikzsSZwrzy8OFhGbQi67sY2M
         vDmg==
X-Gm-Message-State: AOJu0YxVmhfMBQ5mHwHCGH5rmXcLegE8sSAxgkl+aenLOQnOEMYgClLQ
	RS6ki2edq5XLgb6Pd0c+Yv1Otmx989E+vKRiBiHLx2W2z7k3dub7X4U/NclJUH8IaBgRrn2lYwf
	U1QALCyJVFaMNtxLGUIOHX+/e9gySMb+s+DUisQ==
X-Google-Smtp-Source: AGHT+IGrsiU9GB6w9wgt3PfjjSY63f4/51cCHIRVsxCcOZGxmI55kuJeuPStXbHx8hXL4sIaPlvv8hhi2McG2P9m00o=
X-Received: by 2002:a05:6820:200f:b0:5e5:c073:9ea5 with SMTP id
 006d021491bc7-5ee86a3f3f0mr4146198eaf.6.1731495512792; Wed, 13 Nov 2024
 02:58:32 -0800 (PST)
MIME-Version: 1.0
References: <20241113093058.1562447-1-andrew.cooper3@citrix.com>
 <20241113093058.1562447-3-andrew.cooper3@citrix.com> <CACHz=ZjO64JZTj4sXZirLpZFDjbd6RE+HGX38Y6u_RN=Jtw9mA@mail.gmail.com>
In-Reply-To: <CACHz=ZjO64JZTj4sXZirLpZFDjbd6RE+HGX38Y6u_RN=Jtw9mA@mail.gmail.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Wed, 13 Nov 2024 10:58:22 +0000
Message-ID: <CACHz=ZiF9za7_y-6m5msZUt=tV56AbLDJ85smk+OntGC4Wa=ow@mail.gmail.com>
Subject: Re: [PATCH 2/2] x86/trampoline: Rationalise the constants to describe
 the size
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <JBeulich@suse.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	"Daniel P . Smith" <dpsmith@apertussolutions.com>, 
	Alejandro Vallejo <alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 13, 2024 at 10:18=E2=80=AFAM Frediano Ziglio
<frediano.ziglio@cloud.com> wrote:
>
> On Wed, Nov 13, 2024 at 9:31=E2=80=AFAM Andrew Cooper <andrew.cooper3@cit=
rix.com> wrote:
> >
> > The logic is far more sane to follow with a total size, and the positio=
n of
> > the end of the heap.  Remove or fix the the remaining descriptions of h=
ow the
>
> typo: the the
>
> > trampoline is laid out.
> >
> > No functional change.  The compiled binary is identical.
> >
> > Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> > ---
> > CC: Jan Beulich <JBeulich@suse.com>
> > CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> > CC: Daniel P. Smith <dpsmith@apertussolutions.com>
> > CC: Frediano Ziglio <frediano.ziglio@cloud.com>
> > CC: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> > ---
> >  xen/arch/x86/boot/head.S          | 21 ++-------------------
> >  xen/arch/x86/boot/reloc.c         |  5 ++---
> >  xen/arch/x86/efi/efi-boot.h       |  2 +-
> >  xen/arch/x86/include/asm/config.h |  5 +++--
> >  xen/arch/x86/xen.lds.S            |  2 +-
> >  5 files changed, 9 insertions(+), 26 deletions(-)
> >
> > diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
> > index dcda91cfda49..b31cf83758c1 100644
> > --- a/xen/arch/x86/boot/head.S
> > +++ b/xen/arch/x86/boot/head.S
> > @@ -494,7 +494,7 @@ trampoline_bios_setup:
> >
> >  2:
> >          /* Reserve memory for the trampoline and the low-memory stack.=
 */
> > -        sub     $((TRAMPOLINE_SPACE+TRAMPOLINE_STACK_SPACE)>>4),%ecx
> > +        sub     $TRAMPOLINE_SIZE >> 4, %ecx
> >
> >          /* From arch/x86/smpboot.c: start_eip had better be page-align=
ed! */
> >          xor     %cl, %cl
> > @@ -525,23 +525,6 @@ trampoline_setup:
> >          mov     %eax, sym_esi(multiboot_ptr)
> >  2:
> >
> > -        /*
> > -         * Now trampoline_phys points to the following structure (lowe=
st address
> > -         * is at the bottom):
> > -         *
> > -         * +------------------------+
> > -         * | TRAMPOLINE_STACK_SPACE |
> > -         * +------------------------+
> > -         * |     Data (MBI / PVH)   |
> > -         * +- - - - - - - - - - - - +
> > -         * |    TRAMPOLINE_SPACE    |
> > -         * +------------------------+
> > -         *
> > -         * Data grows downwards from the highest address of TRAMPOLINE=
_SPACE
> > -         * region to the end of the trampoline. The rest of TRAMPOLINE=
_SPACE is
> > -         * reserved for trampoline code and data.
> > -         */
> > -
>
> I fail to see a similar description somewhere now.
>
> >          /* Interrogate CPU extended features via CPUID. */
> >          mov     $1, %eax
> >          cpuid
> > @@ -713,7 +696,7 @@ trampoline_setup:
> >  1:
> >          /* Switch to low-memory stack which lives at the end of trampo=
line region. */
> >          mov     sym_esi(trampoline_phys), %edi
> > -        lea     TRAMPOLINE_SPACE+TRAMPOLINE_STACK_SPACE(%edi),%esp
> > +        lea     TRAMPOLINE_SIZE(%edi), %esp
> >          lea     trampoline_boot_cpu_entry-trampoline_start(%edi),%eax
> >          pushl   $BOOT_CS32
> >          push    %eax
> > diff --git a/xen/arch/x86/boot/reloc.c b/xen/arch/x86/boot/reloc.c
> > index e50e161b2740..1f47e10f7fa6 100644
> > --- a/xen/arch/x86/boot/reloc.c
> > +++ b/xen/arch/x86/boot/reloc.c
> > @@ -65,7 +65,7 @@ typedef struct memctx {
> >      /*
> >       * Simple bump allocator.
> >       *
> > -     * It starts from the base of the trampoline and allocates downwar=
ds.
> > +     * It starts from end of of the trampoline heap and allocates down=
wards.
>
> Nice !
> Minor typo "It starts from the end of the trampoline heap and
> allocates downwards."
>
> >       */
> >      uint32_t ptr;
> >  } memctx;
> > @@ -349,8 +349,7 @@ static multiboot_info_t *mbi2_reloc(uint32_t mbi_in=
, memctx *ctx)
> >  /* SAF-1-safe */
> >  void *reloc(uint32_t magic, uint32_t in)
> >  {
> > -    /* Get bottom-most low-memory stack address. */
> > -    memctx ctx =3D { trampoline_phys + TRAMPOLINE_SPACE };
> > +    memctx ctx =3D { trampoline_phys + TRAMPOLINE_HEAP_END };
> >
> >      switch ( magic )
> >      {
> > diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
> > index 7930b7c73892..9d3f2b71447e 100644
> > --- a/xen/arch/x86/efi/efi-boot.h
> > +++ b/xen/arch/x86/efi/efi-boot.h
> > @@ -633,7 +633,7 @@ static void __init efi_arch_memory_setup(void)
> >      if ( efi_enabled(EFI_LOADER) )
> >          cfg.size =3D trampoline_end - trampoline_start;
> >      else
> > -        cfg.size =3D TRAMPOLINE_SPACE + TRAMPOLINE_STACK_SPACE;
> > +        cfg.size =3D TRAMPOLINE_SIZE;
> >
> >      status =3D efi_bs->AllocatePages(AllocateMaxAddress, EfiLoaderData=
,
> >                                     PFN_UP(cfg.size), &cfg.addr);
> > diff --git a/xen/arch/x86/include/asm/config.h b/xen/arch/x86/include/a=
sm/config.h
> > index f8a5a4913b07..20141ede31a1 100644
> > --- a/xen/arch/x86/include/asm/config.h
> > +++ b/xen/arch/x86/include/asm/config.h
> > @@ -51,8 +51,9 @@
> >
> >  #define IST_SHSTK_SIZE 1024
> >
> > -#define TRAMPOLINE_STACK_SPACE  PAGE_SIZE
> > -#define TRAMPOLINE_SPACE        (KB(64) - TRAMPOLINE_STACK_SPACE)
> > +/* See asm/trampoline.h */
>
> I fail to see any description and need for a heap or why the size is 64kb=
.
> There is a description about trampoline code and wakeup code but not
> the fact we copy MBI data and so we need a heap.
> Stack could be just due to the need of it, so implicit, heap a bit less.
>
> > +#define TRAMPOLINE_SIZE         KB(64)
> > +#define TRAMPOLINE_HEAP_END     (TRAMPOLINE_SIZE - PAGE_SIZE)
> >  #define WAKEUP_STACK_MIN        3072
> >
> >  #define MBI_SPACE_MIN           (2 * PAGE_SIZE)
> > diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
> > index 35693f6e3380..e7d93d1f4ac3 100644
> > --- a/xen/arch/x86/xen.lds.S
> > +++ b/xen/arch/x86/xen.lds.S
> > @@ -410,7 +410,7 @@ ASSERT(!SIZEOF(.plt),      ".plt non-empty")
> >  ASSERT(!SIZEOF(.rela),     "leftover relocations")
> >  #endif
> >
> > -ASSERT((trampoline_end - trampoline_start) < TRAMPOLINE_SPACE - MBI_SP=
ACE_MIN,
> > +ASSERT((trampoline_end - trampoline_start) < TRAMPOLINE_HEAP_END - MBI=
_SPACE_MIN,
> >      "not enough room for trampoline and mbi data")
> >  ASSERT((wakeup_stack - wakeup_stack_start) >=3D WAKEUP_STACK_MIN,
> >      "wakeup stack too small")
>
> Code is nice, just that documentation is stated but missing in my opinion=
.
>

Hi,
  I realized I messed the first patch of the series, so with that,
beside the small typos

Reviewed-by: Frediano Ziglio <frediano.ziglio@cloud.com>

Frediano

