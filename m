Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9874698748F
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2024 15:39:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.805533.1216654 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stohk-0005Hp-7h; Thu, 26 Sep 2024 13:38:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 805533.1216654; Thu, 26 Sep 2024 13:38:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stohk-0005Eg-4w; Thu, 26 Sep 2024 13:38:48 +0000
Received: by outflank-mailman (input) for mailman id 805533;
 Thu, 26 Sep 2024 13:38:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wyuO=QY=kernel.org=ardb@srs-se1.protection.inumbo.net>)
 id 1stohi-0005ER-W9
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2024 13:38:47 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a5e514f5-7c0c-11ef-99a2-01e77a169b0f;
 Thu, 26 Sep 2024 15:38:44 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B0AD65C5D99
 for <xen-devel@lists.xenproject.org>; Thu, 26 Sep 2024 13:38:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 057ADC4CED7
 for <xen-devel@lists.xenproject.org>; Thu, 26 Sep 2024 13:38:42 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-2f759b87f83so11859531fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 26 Sep 2024 06:38:41 -0700 (PDT)
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
X-Inumbo-ID: a5e514f5-7c0c-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727357922;
	bh=OPIQS2t62p13UwMnk1FiF+unfRr5Zwe9MubLOeGiJyM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=g9EVXOEDnIWgjiO11CiSYUffR3UR2CIpyUBeOwcQstmzkqWPGbR1xHtFOmKgG3tXi
	 dWv1rjZkgJ6WmyacNzOWvRS12GPPeg7nCos8grCoADllmAbt9O4kCzI2/kq+W84cct
	 RHaKy8aY7EIRqBkz88MdB0K0to7y1KW8nTJu8ARP+tG6rRcn8oS7w66/zy04g5RCYI
	 S/1n2yFSm2+pcMWJ2lIpS8W/6vvNJLatNuZ39k6KQvy3s5Z7TxkImbbvIg3UEelGoB
	 mdwpa8i/Byx28rE1AHF5ZP1LzmaIz95R57WsBUN8IZYhJ92C1wJDq1vJGN25VlnoGe
	 4Xb51g36ngHjw==
X-Forwarded-Encrypted: i=1; AJvYcCUuVaJwQwoGxXWqPSjIpZmYat4lOQSWPGH/14JxVmCkwYfOrGDDanMJkTaZyq9jwCUsXWPnnIk4B8k=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwuhZqBdrJQbdsMRATcDJ3J+lDnBTmyvuQtg7sav9xmT8rRAaKx
	akiU39Pa/u1HBA8UhXUYTn7T2z0yz/OgT1tklow4VQAUK9lWsZ+UARMMjmLe6pUSHEaD+S5EPZC
	RKoVvGv8cF36/aDK1xApBwfswyys=
X-Google-Smtp-Source: AGHT+IGDysp0zVaI/G56jPcUmenrli6iDQ7ZCklZUQ9W3MAWEI6d8p2NALI8I7dIlWV2Pg4Oztsl5Tqp++gl5gafuuo=
X-Received: by 2002:a2e:4a0a:0:b0:2ef:1784:a20 with SMTP id
 38308e7fff4ca-2f91ca68786mr32564001fa.38.1727357920170; Thu, 26 Sep 2024
 06:38:40 -0700 (PDT)
MIME-Version: 1.0
References: <20240925150059.3955569-30-ardb+git@google.com>
 <20240925150059.3955569-57-ardb+git@google.com> <4eca972d-a462-4cc5-9238-5d63485e1af4@oracle.com>
In-Reply-To: <4eca972d-a462-4cc5-9238-5d63485e1af4@oracle.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 26 Sep 2024 15:38:27 +0200
X-Gmail-Original-Message-ID: <CAMj1kXEOFDwoYrLH9f-d46HRPMw7HjWRQGNdMu5_D_Ny3UtPxg@mail.gmail.com>
Message-ID: <CAMj1kXEOFDwoYrLH9f-d46HRPMw7HjWRQGNdMu5_D_Ny3UtPxg@mail.gmail.com>
Subject: Re: [RFC PATCH 27/28] x86/kernel: Switch to PIE linking for the core kernel
To: Vegard Nossum <vegard.nossum@oracle.com>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org, x86@kernel.org, 
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
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, linux-doc@vger.kernel.org, 
	linux-pm@vger.kernel.org, kvm@vger.kernel.org, xen-devel@lists.xenproject.org, 
	linux-efi@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-sparse@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, 25 Sept 2024 at 22:25, Vegard Nossum <vegard.nossum@oracle.com> wrote:
>
>
> On 25/09/2024 17:01, Ard Biesheuvel wrote:
> > From: Ard Biesheuvel <ardb@kernel.org>
> >
> > Build the kernel as a Position Independent Executable (PIE). This
> > results in more efficient relocation processing for the virtual
> > displacement of the kernel (for KASLR). More importantly, it instructs
> > the linker to generate what is actually needed (a program that can be
> > moved around in memory before execution), which is better than having to
> > rely on the linker to create a position dependent binary that happens to
> > tolerate being moved around after poking it in exactly the right manner.
> >
> > Note that this means that all codegen should be compatible with PIE,
> > including Rust objects, so this needs to switch to the small code model
> > with the PIE relocation model as well.
> >
> > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> > ---
> >   arch/x86/Kconfig                        |  2 +-
> >   arch/x86/Makefile                       | 11 +++++++----
> >   arch/x86/boot/compressed/misc.c         |  2 ++
> >   arch/x86/kernel/vmlinux.lds.S           |  5 +++++
> >   drivers/firmware/efi/libstub/x86-stub.c |  2 ++
> >   5 files changed, 17 insertions(+), 5 deletions(-)
> >
...
>
> This patch causes a build failure here (on 64-bit):
>
>    LD      .tmp_vmlinux2
>    NM      .tmp_vmlinux2.syms
>    KSYMS   .tmp_vmlinux2.kallsyms.S
>    AS      .tmp_vmlinux2.kallsyms.o
>    LD      vmlinux
>    BTFIDS  vmlinux
> WARN: resolve_btfids: unresolved symbol bpf_lsm_key_free
> FAILED elf_update(WRITE): invalid section entry size
> make[5]: *** [scripts/Makefile.vmlinux:34: vmlinux] Error 255
> make[5]: *** Deleting file 'vmlinux'
> make[4]: *** [Makefile:1153: vmlinux] Error 2
> make[3]: *** [debian/rules:74: build-arch] Error 2
> dpkg-buildpackage: error: make -f debian/rules binary subprocess
> returned exit status 2
> make[2]: *** [scripts/Makefile.package:121: bindeb-pkg] Error 2
> make[1]: *** [/home/opc/linux-mainline-worktree2/Makefile:1544:
> bindeb-pkg] Error 2
> make: *** [Makefile:224: __sub-make] Error 2
>
> The parent commit builds fine. With V=1:
>
> + ldflags='-m elf_x86_64 -z noexecstack --pie -z text -z
> call-nop=suffix-nop -z max-page-size=0x200000 --build-id=sha1
> --orphan-handling=warn --script=./arch/x86/kernel/vmlinux.lds
> -Map=vmlinux.map'
> + ld -m elf_x86_64 -z noexecstack --pie -z text -z call-nop=suffix-nop
> -z max-page-size=0x200000 --build-id=sha1 --orphan-handling=warn
> --script=./arch/x86/kernel/vmlinux.lds -Map=vmlinux.map -o vmlinux
> --whole-archive vmlinux.a .vmlinux.export.o init/version-timestamp.o
> --no-whole-archive --start-group --end-group .tmp_vmlinux2.kallsyms.o
> .tmp_vmlinux1.btf.o
> + is_enabled CONFIG_DEBUG_INFO_BTF
> + grep -q '^CONFIG_DEBUG_INFO_BTF=y' include/config/auto.conf
> + info BTFIDS vmlinux
> + printf '  %-7s %s\n' BTFIDS vmlinux
>    BTFIDS  vmlinux
> + ./tools/bpf/resolve_btfids/resolve_btfids vmlinux
> WARN: resolve_btfids: unresolved symbol bpf_lsm_key_free
> FAILED elf_update(WRITE): invalid section entry size
>
> I can send the full config off-list if necessary, but looks like it
> might be enough to set CONFIG_DEBUG_INFO_BTF=y.
>

Thanks for the report. Turns out that adding the GOT to .rodata bumps
the section's sh_entsize to 8, and libelf complains if the section
size is not a multiple of the entry size.

I'll include a fix in the next revision.

