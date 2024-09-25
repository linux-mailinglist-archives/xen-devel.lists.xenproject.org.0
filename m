Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0B498645F
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 18:01:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.804363.1215329 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stUS1-00065H-Rc; Wed, 25 Sep 2024 16:01:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 804363.1215329; Wed, 25 Sep 2024 16:01:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stUS1-00063m-Ow; Wed, 25 Sep 2024 16:01:13 +0000
Received: by outflank-mailman (input) for mailman id 804363;
 Wed, 25 Sep 2024 15:54:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LwhS=QX=google.com=irogers@srs-se1.protection.inumbo.net>)
 id 1stUL6-0008TE-Gs
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2024 15:54:04 +0000
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [2607:f8b0:4864:20::136])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 62c977fa-7b56-11ef-a0ba-8be0dac302b0;
 Wed, 25 Sep 2024 17:54:03 +0200 (CEST)
Received: by mail-il1-x136.google.com with SMTP id
 e9e14a558f8ab-3a045f08fd6so308355ab.0
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2024 08:54:03 -0700 (PDT)
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
X-Inumbo-ID: 62c977fa-7b56-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727279642; x=1727884442; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mtlWMtq+JiEyWaKdO0nlwORQa61CRpWkCRYLpleOmWc=;
        b=k59Rbti/QWY6QawI5DZUaZ/AZhRr3NmccIOEXbFIeA6vy5y2eOOku0vX3x3MKmtGQu
         549YvBbU9MUbgl+Bihu09XRMdpdy6CFNW3Tid4UI4u+/ltEZPdSPaNHHQBuwu9ObiIns
         0w9wQWqxrr4RMIeEXTIIrepLMuxMhNzyD/7Gl+D7vvchs5EFe1tq+H5nA0p4A9AKZTcs
         ZfO+w6vUQNxNJMwADEfj/NLMCz/KfTgO8pSScEIaC53wZ9p9p+y/DXaQH4h8bUt+GtK1
         VyTY2HzpqLOLjpRaZ6H7at2dDRSW8Ve1EWKwrc7KOy069Q8mBlRHNKGssp9J4WQxUSj5
         rFoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727279642; x=1727884442;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mtlWMtq+JiEyWaKdO0nlwORQa61CRpWkCRYLpleOmWc=;
        b=A0sAJk1A3QJ4wix5ZjRDUMzonXL/KscCXqjj1T9mmRt5jrjhXfRUGvdmHKaARyaHbo
         Q4A7XOlZpSyPo4mxuxD2FIgA8rrJSEJerEOJB/oRc+YlxQdPDT9wqN/PqM6Osas/8WYW
         IixnzDlb+/3h5kAOkLFN0o9Ysw23uSL0SY6Pki6kzSfeao9CibiR+GdwUCaVy9CYVZog
         Vdz0q3bp6nXoM38joKFIQ/tJFl/yKM36aWhVL7l2vOvZYxW8zs1AWeCXGqZ4Fnloc6OG
         K2GZUa2ryrjAdR+9HN93+MMLGErlTSDhyFm/NL+hNOXUEKUvTGNtMiEaaDm8PMzEQAy1
         wQyw==
X-Forwarded-Encrypted: i=1; AJvYcCVOxOrcKK3XGzi4bmXfyd5zNOPluyxOurPg0kqg2lJgqGqTq9dg8HfTBUTCKy5W8FnJDUQ8Z2MotIk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyfswmOIQ6nRtJWvHr3gzS27icwOxkqbaFRFlpG0aI8AmGsSrgL
	aCU9w5h6DEdR+yqQNZQFPP63D4ybCRnzMCCVDuVj+Cl4ZM6x7MLHAW20ZrJpkRVkq64BM6ZA7Tj
	yLLKGCmhWhHyH3WGLyoYXuvnblxs74s0khT7+
X-Google-Smtp-Source: AGHT+IECKVgNpXJyra6xJfQTQh6aQ7i0vY0ZTk0QtA5OBdxknRIVX3nOfLE4llLAa859tdiG19FbtS4i20eJ0xsZ7pg=
X-Received: by 2002:a05:6e02:b2e:b0:3a0:926a:8d35 with SMTP id
 e9e14a558f8ab-3a27443ee75mr1540455ab.17.1727279641904; Wed, 25 Sep 2024
 08:54:01 -0700 (PDT)
MIME-Version: 1.0
References: <20240925150059.3955569-30-ardb+git@google.com> <20240925150059.3955569-35-ardb+git@google.com>
In-Reply-To: <20240925150059.3955569-35-ardb+git@google.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 25 Sep 2024 08:53:50 -0700
Message-ID: <CAP-5=fXw1rcgWgMeDSVqiDYh2XYApyaJpNvukvJ7vMs7ZPMr6g@mail.gmail.com>
Subject: Re: [RFC PATCH 05/28] x86: Define the stack protector guard symbol explicitly
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Uros Bizjak <ubizjak@gmail.com>, Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, 
	Christoph Lameter <cl@linux.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Juergen Gross <jgross@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Masahiro Yamada <masahiroy@kernel.org>, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Keith Packard <keithp@keithp.com>, 
	Justin Stitt <justinstitt@google.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	linux-doc@vger.kernel.org, linux-pm@vger.kernel.org, kvm@vger.kernel.org, 
	xen-devel@lists.xenproject.org, linux-efi@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-sparse@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 25, 2024 at 8:02=E2=80=AFAM Ard Biesheuvel <ardb+git@google.com=
> wrote:
>
> From: Ard Biesheuvel <ardb@kernel.org>
>
> Specify the guard symbol for the stack cookie explicitly, rather than
> positioning it exactly 40 bytes into the per-CPU area. Doing so removes
> the need for the per-CPU region to be absolute rather than relative to
> the placement of the per-CPU template region in the kernel image, and
> this allows the special handling for absolute per-CPU symbols to be
> removed entirely.
>
> This is a worthwhile cleanup in itself, but it is also a prerequisite
> for PIE codegen and PIE linking, which can replace our bespoke and
> rather clunky runtime relocation handling.
>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  arch/x86/Makefile                     |  4 ++++
>  arch/x86/include/asm/init.h           |  2 +-
>  arch/x86/include/asm/processor.h      | 11 +++--------
>  arch/x86/include/asm/stackprotector.h |  4 ----
>  tools/perf/util/annotate.c            |  4 ++--
>  5 files changed, 10 insertions(+), 15 deletions(-)
>
> diff --git a/arch/x86/Makefile b/arch/x86/Makefile
> index 6b3fe6e2aadd..b78b7623a4a9 100644
> --- a/arch/x86/Makefile
> +++ b/arch/x86/Makefile
> @@ -193,6 +193,10 @@ else
>          KBUILD_RUSTFLAGS +=3D -Cno-redzone=3Dy
>          KBUILD_RUSTFLAGS +=3D -Ccode-model=3Dkernel
>
> +        ifeq ($(CONFIG_STACKPROTECTOR),y)
> +                KBUILD_CFLAGS +=3D -mstack-protector-guard-symbol=3Dfixe=
d_percpu_data
> +        endif
> +
>          # Don't emit relaxable GOTPCREL relocations
>          KBUILD_AFLAGS_KERNEL +=3D -Wa,-mrelax-relocations=3Dno
>          KBUILD_CFLAGS_KERNEL +=3D -Wa,-mrelax-relocations=3Dno
> diff --git a/arch/x86/include/asm/init.h b/arch/x86/include/asm/init.h
> index 14d72727d7ee..3ed0e8ec973f 100644
> --- a/arch/x86/include/asm/init.h
> +++ b/arch/x86/include/asm/init.h
> @@ -2,7 +2,7 @@
>  #ifndef _ASM_X86_INIT_H
>  #define _ASM_X86_INIT_H
>
> -#define __head __section(".head.text")
> +#define __head __section(".head.text") __no_stack_protector
>
>  struct x86_mapping_info {
>         void *(*alloc_pgt_page)(void *); /* allocate buf for page table *=
/
> diff --git a/arch/x86/include/asm/processor.h b/arch/x86/include/asm/proc=
essor.h
> index 4a686f0e5dbf..56bc36116814 100644
> --- a/arch/x86/include/asm/processor.h
> +++ b/arch/x86/include/asm/processor.h
> @@ -402,14 +402,9 @@ struct irq_stack {
>  #ifdef CONFIG_X86_64
>  struct fixed_percpu_data {
>         /*
> -        * GCC hardcodes the stack canary as %gs:40.  Since the
> -        * irq_stack is the object at %gs:0, we reserve the bottom
> -        * 48 bytes of the irq stack for the canary.
> -        *
> -        * Once we are willing to require -mstack-protector-guard-symbol=
=3D
> -        * support for x86_64 stackprotector, we can get rid of this.
> +        * Since the irq_stack is the object at %gs:0, the bottom 8 bytes=
 of
> +        * the irq stack are reserved for the canary.
>          */
> -       char            gs_base[40];
>         unsigned long   stack_canary;
>  };
>
> @@ -418,7 +413,7 @@ DECLARE_INIT_PER_CPU(fixed_percpu_data);
>
>  static inline unsigned long cpu_kernelmode_gs_base(int cpu)
>  {
> -       return (unsigned long)per_cpu(fixed_percpu_data.gs_base, cpu);
> +       return (unsigned long)&per_cpu(fixed_percpu_data, cpu);
>  }
>
>  extern asmlinkage void entry_SYSCALL32_ignore(void);
> diff --git a/arch/x86/include/asm/stackprotector.h b/arch/x86/include/asm=
/stackprotector.h
> index 00473a650f51..d1dcd22a0a4c 100644
> --- a/arch/x86/include/asm/stackprotector.h
> +++ b/arch/x86/include/asm/stackprotector.h
> @@ -51,10 +51,6 @@ static __always_inline void boot_init_stack_canary(voi=
d)
>  {
>         unsigned long canary =3D get_random_canary();
>
> -#ifdef CONFIG_X86_64
> -       BUILD_BUG_ON(offsetof(struct fixed_percpu_data, stack_canary) !=
=3D 40);
> -#endif
> -
>         current->stack_canary =3D canary;
>  #ifdef CONFIG_X86_64
>         this_cpu_write(fixed_percpu_data.stack_canary, canary);
> diff --git a/tools/perf/util/annotate.c b/tools/perf/util/annotate.c
> index 37ce43c4eb8f..7ecfedf5edb9 100644
> --- a/tools/perf/util/annotate.c
> +++ b/tools/perf/util/annotate.c
> @@ -2485,10 +2485,10 @@ static bool is_stack_operation(struct arch *arch,=
 struct disasm_line *dl)
>
>  static bool is_stack_canary(struct arch *arch, struct annotated_op_loc *=
loc)
>  {
> -       /* On x86_64, %gs:40 is used for stack canary */
> +       /* On x86_64, %gs:0 is used for stack canary */
>         if (arch__is(arch, "x86")) {
>                 if (loc->segment =3D=3D INSN_SEG_X86_GS && loc->imm &&
> -                   loc->offset =3D=3D 40)
> +                   loc->offset =3D=3D 0)

As a new perf tool  can run on old kernels we may need to have this be
something like:
(loc->offset =3D=3D 40 /* pre v6.xx kernels */ || loc->offset =3D=3D 0 /*
v6.xx and later */ )

We could make this dependent on the kernel by processing the os_release str=
ing:
https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git/tr=
ee/tools/perf/util/env.h#n55
but that could well be more trouble than it is worth.

Thanks,
Ian

>                         return true;
>         }

>
> --
> 2.46.0.792.g87dc391469-goog
>

