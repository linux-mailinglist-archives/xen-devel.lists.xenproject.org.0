Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F5A98EDAD
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2024 13:14:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.809278.1221529 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swJmT-0001uG-9z; Thu, 03 Oct 2024 11:14:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 809278.1221529; Thu, 03 Oct 2024 11:14:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swJmT-0001rb-7H; Thu, 03 Oct 2024 11:14:01 +0000
Received: by outflank-mailman (input) for mailman id 809278;
 Thu, 03 Oct 2024 11:13:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1FP3=Q7=kernel.org=ardb@srs-se1.protection.inumbo.net>)
 id 1swJmQ-0001rT-RJ
 for xen-devel@lists.xenproject.org; Thu, 03 Oct 2024 11:13:58 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 94b4ff92-8178-11ef-a0ba-8be0dac302b0;
 Thu, 03 Oct 2024 13:13:57 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 03A025C5BF6
 for <xen-devel@lists.xenproject.org>; Thu,  3 Oct 2024 11:13:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F348BC4CED2
 for <xen-devel@lists.xenproject.org>; Thu,  3 Oct 2024 11:13:53 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-539885dd4bcso1007508e87.0
 for <xen-devel@lists.xenproject.org>; Thu, 03 Oct 2024 04:13:53 -0700 (PDT)
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
X-Inumbo-ID: 94b4ff92-8178-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727954034;
	bh=ncshirJSuuxVYT6Rg4hMRMg6qTFNBzUzykD4N2BkVY8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Jo5b2EyMOS3uk9JDlHSQeU5R1aJyjAs0+fTPWkZCep6Wfe3FtEcKX92qY2mtaY2EK
	 Ci8TPn6Ee42qRsmfrcj1l+x8zMsi6bvfBaExW2NU/fSlbTuDXDF1+X8cFBydkm8Y27
	 lb+XzyBozg7zRqcDdBoznF0nnozWrNcR9tzS6b9UomNb4g91qxhdupQuTqUK4zEuA4
	 z7g+nzwCR3g6dyxU7168Y4P6qlP/X9DMrNre/R3uCNKxAg+BkBWF+gHp9jrQW3cTIh
	 xrWMcRuCjU0dRKRqqjEvI0IIIfAguu/05IPATBt+DaAJfq3OXiy9Jf7zCzIbXi+uOl
	 853BOc6UvNv1A==
X-Forwarded-Encrypted: i=1; AJvYcCXATtmYYtKed5tJ6b9yZggsSPeXeKF9Irz1tFL5Qw7U89ysmzQfjHnge8I7M/WMqXBJHntv/oSrZf0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwpCdf/9KNqV3rbYGqZpPgTRDastw2ce8XLaSeWsCZJpOUuP7TT
	5u4KeRAnkVZo6NryIvx9UJX3OYWZY4UMK9OppNbxzY9IAAZSrj2GVYsjcGmmoUfewrWIK+RIxp1
	qOvlMyjicoVavzK97imxc962MCpE=
X-Google-Smtp-Source: AGHT+IH0sWh3HiA/Y/FG77TM2NrCKaNhbA4eJ/qwHE/WqxSdpNeBFdDDl6WpEY+OacY7yD9godh5OoCJmImz57qPZ+Q=
X-Received: by 2002:a05:6512:1241:b0:536:9ef0:d829 with SMTP id
 2adb3069b0e04-539a07a1db9mr3832198e87.44.1727954032228; Thu, 03 Oct 2024
 04:13:52 -0700 (PDT)
MIME-Version: 1.0
References: <20240925150059.3955569-30-ardb+git@google.com>
 <20240925150059.3955569-55-ardb+git@google.com> <99446363-152f-43a8-8b74-26f0d883a364@zytor.com>
 <CAMj1kXG7ZELM8D7Ft3H+dD5BHqENjY9eQ9kzsq2FzTgP5+2W3A@mail.gmail.com> <CAHk-=wj0HG2M1JgoN-zdCwFSW=N7j5iMB0RR90aftTS3oqwKTg@mail.gmail.com>
In-Reply-To: <CAHk-=wj0HG2M1JgoN-zdCwFSW=N7j5iMB0RR90aftTS3oqwKTg@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 3 Oct 2024 13:13:40 +0200
X-Gmail-Original-Message-ID: <CAMj1kXEU5RU0i11zqD0433_LMMyNQH2gCoSkU7GeXmaRXGF1Yw@mail.gmail.com>
Message-ID: <CAMj1kXEU5RU0i11zqD0433_LMMyNQH2gCoSkU7GeXmaRXGF1Yw@mail.gmail.com>
Subject: Re: [RFC PATCH 25/28] x86: Use PIE codegen for the core kernel
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "H. Peter Anvin" <hpa@zytor.com>, Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org, 
	x86@kernel.org, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
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

On Wed, 2 Oct 2024 at 22:02, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Wed, 2 Oct 2024 at 08:31, Ard Biesheuvel <ardb@kernel.org> wrote:
> >
> > I guess you are referring to the use of a GOT? That is a valid
> > concern, but it does not apply here. With hidden visibility and
> > compiler command line options like -mdirect-access-extern, all emitted
> > symbol references are direct.
>
> I absolutely hate GOT entries. We definitely shouldn't ever do
> anything that causes them on x86-64.
>
> I'd much rather just do boot-time relocation, and I don't think the
> "we run code at a different location than we told the linker" is an
> arghument against it.
>
> Please, let's make sure we never have any of the global offset table horror.
>
> Yes, yes, you can't avoid them on other architectures.
>

GCC/binutils never needs them. GCC 13 and older will emit some
horrible indirect fentry hook calls via the GOT, but those are NOPed
out by objtool anyway, so that is easily fixable.

Clang/LLD is slightly trickier, because Clang emits relaxable GOTPCREL
relocations, but LLD doesn't update the relocations emitted via
--emit-relocs, so the relocs tool gets confused. This is one of the
reasons I had for proposing to simply switch to PIE linking, and let
the linker deal with all of that. Note that Clang may emit these even
when not generating PIC/PIE code at all.

So this is the reason I wanted to add support for GOTPCREL relocations
in the relocs tool - it is really quite trivial to do, and makes our
jobs slightly easier when dealing with these compiler quirks. The
alternative would be to teach objtool how to relax 'movq
foo@GOTPCREL(%rip)' into 'leaq foo(%rip)' - these are GOTPCREL
relaxations described in the x86_64 psABI for ELF, which is why
compilers are assuming more and more that emitting these is fine even
without -fpic, given that the linker is supposed to elide them if
possible.

Note that there are 1 or 2 cases in the asm code where it is actually
quite useful to refer to the address of foo as 'foo@GOTPCREL(%rip)' in
instructions that take memory operands, but those individual cases are
easily converted to something else if even having a GOT with just 2
entries is a dealbreaker for you.

> That said, doing changes like changing "mov $sym" to "lea sym(%rip)" I
> feel are a complete no-brainer and should be done regardless of any
> other code generation issues.
>

Yes, this is the primary reason I ended up looking into this in the
first place. Earlier this year, we ended up having to introduce
RIP_REL_REF() to emit those RIP-relative references explicitly, in
order to prevent the C code that is called via the early 1:1 mapping
from exploding. The amount of C code called in that manner has been
growing steadily over time with the introduction of 5-level paging and
SEV-SNP and TDX support, which need to play all kinds of tricks before
the normal kernel mappings are created.

Compiling with -fpie and linking with --pie -z text produces an
executable that is guaranteed to have only RIP-relative references in
the .text segment, removing the need for RIP_REL_REF entirely (it
already does nothing when __pic__ is #define'd).

