Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C33F398B4FB
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2024 08:56:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807748.1219380 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svWoB-0001h3-Qx; Tue, 01 Oct 2024 06:56:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807748.1219380; Tue, 01 Oct 2024 06:56:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svWoB-0001fA-OF; Tue, 01 Oct 2024 06:56:31 +0000
Received: by outflank-mailman (input) for mailman id 807748;
 Tue, 01 Oct 2024 06:56:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AZty=Q5=kernel.org=ardb@srs-se1.protection.inumbo.net>)
 id 1svWoA-0001aF-Gv
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2024 06:56:30 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 47efcbc5-7fc2-11ef-a0ba-8be0dac302b0;
 Tue, 01 Oct 2024 08:56:29 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 293955C542D
 for <xen-devel@lists.xenproject.org>; Tue,  1 Oct 2024 06:56:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D65BC4CEE6
 for <xen-devel@lists.xenproject.org>; Tue,  1 Oct 2024 06:56:26 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-2fad75b46a3so10498051fa.2
 for <xen-devel@lists.xenproject.org>; Mon, 30 Sep 2024 23:56:26 -0700 (PDT)
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
X-Inumbo-ID: 47efcbc5-7fc2-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727765786;
	bh=D6cq+9W5AquN6Xivssj0gJ1Jk4JQ0mfYEn2CA9+npXI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=XwBYHQazazbTC4OwId3vnrFAgc6CpLItRV3CT+Z8Gu23wph58CKcedFo7OLdarXFj
	 CfBr/fhizt+I319h5X05aQeNiGEwLpOlTkxFwdMvZp5tn26hL9grIrgluiUanZgVrj
	 0ryllcIGgHjRky7zD5Cq7OsKZqK4RkRI4/CJstCL2fYk+KBEVoQob6cme8zRgaORsv
	 8IC6faZd2aGl4jfIjpTmpGu86/o4/aahDo/ckVnRLhdwe1cSJTcyxtGmwBVe5kWta6
	 zAbfWFj5Dzv5UH3KDkLJ7Igmws7XQ8kbnjqJSF3yJWaphRu3BKFYLpSFA19jzUWCHz
	 4bi5hwVR6eikg==
X-Forwarded-Encrypted: i=1; AJvYcCVg/TAnaeJ5Y1F6++ObZkjkVWvlae+1RhtHfVVKfRZ9k9Gs+nLmcH42baUBJIrQOUkR9mC1w3sNT6M=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx3xwHXHCc5FBbCdleURx7jMu5UwsI2O73EemMTO3P/EV93DEAa
	a98RDNdTNXiCxEHjlH01SFgVfprX7rSHhJ7us/igIv+rwRQHSZjYg9vb+TOzk6aXUdZRhRCOWwQ
	ugms8nSXJX09gWjmxIna/Bef+zx8=
X-Google-Smtp-Source: AGHT+IGjtx2HGlRUUxfHLsgxZrMc5HOLfFzS5jvtirjyIPXJpZcKEYpq6gBAXQaDQEq6eyp0Tbbah6SY1D/EzYnBAjs=
X-Received: by 2002:a05:6512:3b8d:b0:52b:bf8e:ffea with SMTP id
 2adb3069b0e04-5389fc6429dmr8367147e87.40.1727765784329; Mon, 30 Sep 2024
 23:56:24 -0700 (PDT)
MIME-Version: 1.0
References: <20240925150059.3955569-30-ardb+git@google.com>
 <20240925150059.3955569-34-ardb+git@google.com> <20241001053318.elfwwiyluw6rlynz@treble>
In-Reply-To: <20241001053318.elfwwiyluw6rlynz@treble>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 1 Oct 2024 08:56:12 +0200
X-Gmail-Original-Message-ID: <CAMj1kXFyd7zDqnFzHTZmcR+ktxRVdOnuF-VOW+E0PYPNaQGXzQ@mail.gmail.com>
Message-ID: <CAMj1kXFyd7zDqnFzHTZmcR+ktxRVdOnuF-VOW+E0PYPNaQGXzQ@mail.gmail.com>
Subject: Re: [RFC PATCH 04/28] x86/boot: Permit GOTPCREL relocations for
 x86_64 builds
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Uros Bizjak <ubizjak@gmail.com>, Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, 
	Christoph Lameter <cl@linux.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Juergen Gross <jgross@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Masahiro Yamada <masahiroy@kernel.org>, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Keith Packard <keithp@keithp.com>, 
	Justin Stitt <justinstitt@google.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	linux-doc@vger.kernel.org, linux-pm@vger.kernel.org, kvm@vger.kernel.org, 
	xen-devel@lists.xenproject.org, linux-efi@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-sparse@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, 1 Oct 2024 at 07:33, Josh Poimboeuf <jpoimboe@kernel.org> wrote:
>
> On Wed, Sep 25, 2024 at 05:01:04PM +0200, Ard Biesheuvel wrote:
> > +             if (r_type == R_X86_64_GOTPCREL) {
> > +                     Elf_Shdr *s = &secs[sec->shdr.sh_info].shdr;
> > +                     unsigned file_off = offset - s->sh_addr + s->sh_offset;
> > +
> > +                     /*
> > +                      * GOTPCREL relocations refer to instructions that load
> > +                      * a 64-bit address via a 32-bit relative reference to
> > +                      * the GOT.  In this case, it is the GOT entry that
> > +                      * needs to be fixed up, not the immediate offset in
> > +                      * the opcode. Note that the linker will have applied an
> > +                      * addend of -4 to compensate for the delta between the
> > +                      * relocation offset and the value of RIP when the
> > +                      * instruction executes, and this needs to be backed out
> > +                      * again. (Addends other than -4 are permitted in
> > +                      * principle, but make no sense in practice so they are
> > +                      * not supported.)
> > +                         */
> > +                     if (rel->r_addend != -4) {
> > +                             die("invalid addend (%ld) for %s relocation: %s\n",
> > +                                 rel->r_addend, rel_type(r_type), symname);
> > +                             break;
> > +                     }
>
> For x86 PC-relative addressing, the addend is <reloc offset> -
> <subsequent insn offset>.  So a PC-relative addend can be something
> other than -4 when the relocation applies to the middle of an
> instruction, e.g.:
>
>    5b381:       66 81 3d 00 00 00 00 01 06      cmpw   $0x601,0x0(%rip)        # 5b38a <generic_validate_add_page+0x4a> 5b384: R_X86_64_PC32    boot_cpu_data-0x6
>
>    5f283:       81 3d 00 00 00 00 ff ff ff 00   cmpl   $0xffffff,0x0(%rip)        # 5f28d <x86_acpi_suspend_lowlevel+0x9d>      5f285: R_X86_64_PC32    smpboot_control-0x8
>
>    72f67:       c6 05 00 00 00 00 01    movb   $0x1,0x0(%rip)        # 72f6e <sched_itmt_update_handler+0x6e>   72f69: R_X86_64_PC32    x86_topology_update-0x5
>
> Presumably that could also happen with R_X86_64_GOTPCREL?
>

In theory, yes.

But for the class of GOTPCREL relaxable instructions listed in the
psABI, the addend is always -4, and these are the only ones we might
expect from the compiler when using -fpic with 'hidden' visibility
and/or -mdirect-extern-access. Note that the memory operand
foo@GOTPCREL(%rip) produces the *address* of foo, and so it is always
the source operand, appearing at the end of the encoding.

Alternatively, we might simply subtract the addend from 'offset'
before applying the displacement from the opcode.

Note that this code gets removed again in the last patch, after
switching to PIE linking.

