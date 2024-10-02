Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A38BC98DEFA
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2024 17:26:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.808890.1220955 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sw1FL-0006ZW-4V; Wed, 02 Oct 2024 15:26:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 808890.1220955; Wed, 02 Oct 2024 15:26:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sw1FL-0006XJ-1A; Wed, 02 Oct 2024 15:26:35 +0000
Received: by outflank-mailman (input) for mailman id 808890;
 Wed, 02 Oct 2024 15:26:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qBk0=Q6=kernel.org=ardb@srs-se1.protection.inumbo.net>)
 id 1sw1Ey-0004SG-8p
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2024 15:26:12 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [2604:1380:45d1:ec00::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a712d4ae-80d2-11ef-a0ba-8be0dac302b0;
 Wed, 02 Oct 2024 17:26:11 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 94CF0A43E41
 for <xen-devel@lists.xenproject.org>; Wed,  2 Oct 2024 15:26:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83D1CC4CED6
 for <xen-devel@lists.xenproject.org>; Wed,  2 Oct 2024 15:26:08 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-2fad15b3eeeso33591811fa.2
 for <xen-devel@lists.xenproject.org>; Wed, 02 Oct 2024 08:26:08 -0700 (PDT)
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
X-Inumbo-ID: a712d4ae-80d2-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727882768;
	bh=h4ubFnE46xeI8wN9+4BYkWAbARBnOtNFKXLTjQ3iYxs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=KFl7hH8baEyBXLc9YdutCabBIIsebd7h0c09OkpKue3HyYk0dPbzyKEPIAYZw8EA0
	 OSqK38e9b/ZQqENWs+TnswX2GzFQqN2nL0SRR4IVxtTfVUlSFGfffBS7Jg4BMNQIz8
	 HMkEBAAndduR9nNbwqZIze+PTqfQzCMnCy8hpJdW/BS84scv9IwY4mniaBcqBDDZua
	 ZBd9lUJThYLwrBMX2si1+483PfVcboCG4r+GJNcdiKhotGYBsctAy1Sareu7r1J5jh
	 Wd6eNnpiy5IQorN76AsuNn8HDWHvuwIblRMKj84P4HPuwkx+3e6SIsEVpTzuDrCbzg
	 6kBiHvv5uu5wg==
X-Forwarded-Encrypted: i=1; AJvYcCXZp675azna1l5vzhhkhNCfOgoOaQAK5EOUeyioq2PEm52aZ0XKc0BpULoa5iDzHbfN6TsFIeKdwcA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzvYfK2KM5B3fNYkg1OuNsxyQG68AiADTXebokrNLtoydUktwBT
	572gCWSmArlRSsIjwqr72Sa8g9XYPZc8nAhrWRNCUoSInuZ8nhoy/7boV8K821vxEzBzIsJE4Er
	3t6rGa2gC3XfjWsJwLSDqJjWAJZE=
X-Google-Smtp-Source: AGHT+IFjphesp/WsGS3U0PINOY0QAoUmw2aq4caedP0chVHCCyNa6a0rrCXQNZVU8wv2cCgEaQKnFwQhCH9Io7gBKbI=
X-Received: by 2002:a05:651c:1502:b0:2fa:d84a:bd83 with SMTP id
 38308e7fff4ca-2fae106e266mr23266981fa.24.1727882766692; Wed, 02 Oct 2024
 08:26:06 -0700 (PDT)
MIME-Version: 1.0
References: <20240925150059.3955569-30-ardb+git@google.com>
 <20240925150059.3955569-55-ardb+git@google.com> <99446363-152f-43a8-8b74-26f0d883a364@zytor.com>
In-Reply-To: <99446363-152f-43a8-8b74-26f0d883a364@zytor.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 2 Oct 2024 17:25:54 +0200
X-Gmail-Original-Message-ID: <CAMj1kXG7ZELM8D7Ft3H+dD5BHqENjY9eQ9kzsq2FzTgP5+2W3A@mail.gmail.com>
Message-ID: <CAMj1kXG7ZELM8D7Ft3H+dD5BHqENjY9eQ9kzsq2FzTgP5+2W3A@mail.gmail.com>
Subject: Re: [RFC PATCH 25/28] x86: Use PIE codegen for the core kernel
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org, x86@kernel.org, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Uros Bizjak <ubizjak@gmail.com>, 
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
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Peter,

Thanks for taking a look.

On Tue, 1 Oct 2024 at 23:13, H. Peter Anvin <hpa@zytor.com> wrote:
>
> On 9/25/24 08:01, Ard Biesheuvel wrote:
> > From: Ard Biesheuvel <ardb@kernel.org>
> >
> > As an intermediate step towards enabling PIE linking for the 64-bit x86
> > kernel, enable PIE codegen for all objects that are linked into the
> > kernel proper.
> >
> > This substantially reduces the number of relocations that need to be
> > processed when booting a relocatable KASLR kernel.
> >
>
> This really seems like going completely backwards to me.
>
> You are imposing a more restrictive code model on the kernel, optimizing
> for boot time in a way that will exert a permanent cost on the running
> kernel.
>

Fair point about the boot time. This is not the only concern, though,
and arguably the least important one.

As I responded to Andi before, it is also about using a code model and
relocation model that matches the reality of how the code is executed:
- the early C code runs from the 1:1 mapping, and needs special hacks
to accommodate this
- KASLR runs the kernel from a different virtual address than the one
we told the linker about

> There is a *huge* difference between the kernel and user space here:
>
> KERNEL MEMORY IS PERMANENTLY ALLOCATED, AND IS NEVER SHARED.
>

No need to shout.

> Dirtying user pages requires them to be unshared and dirty, which is
> undesirable. Kernel pages are *always* unshared and dirty.
>

I guess you are referring to the use of a GOT? That is a valid
concern, but it does not apply here. With hidden visibility and
compiler command line options like -mdirect-access-extern, all emitted
symbol references are direct. Disallowing text relocations could be
trivially enabled with this series if desired, and actually helps
avoid the tricky bugs we keep fixing in the early startup code that
executes from the 1:1 mapping (the C code in .head.text)

So it mostly comes down to minor differences in addressing modes, e.g.,

  movq $sym, %reg

actually uses more bytes than

  leaq sym(%rip), %reg

whereas

  movq sym, %reg

and

  movq sym(%rip), %reg

are the same length.

OTOH, indexing a statically allocated global array like

  movl array(,%reg1,4), %reg2

will be converted into

  leaq array(%rip), %reg2
  movl (%reg2,%reg1,4), %reg2

and is therefore less efficient in terms of code footprint. But in
general, the x86_64 ISA and psABI are quite flexible in this regard,
and extrapolating from past experiences with PIC code on i386 is not
really justified here.

As Andi also pointed out, what ultimately matters is the performance,
as well as code size where it impacts performance, through the I-cache
footprint. I'll do some testing before reposting, and maybe not bother
if the impact is negative.

> > It also brings us much closer to the ordinary PIE relocation model used
> > for most of user space, which is therefore much better supported and
> > less likely to create problems as we increase the range of compilers and
> > linkers that need to be supported.
>
> We have been resisting *for ages* making the kernel worse to accomodate
> broken compilers. We don't "need" to support more compilers -- we need
> the compilers to support us. We have working compilers; any new compiler
> that wants to play should be expected to work correctly.
>

We are in a much better place now than we were before in that regard,
which is actually how this effort came about: instead of lying to the
compiler, and maintaining our own pile of scripts and relocation
tools, we can just do what other arches are doing in Linux, and let
the toolchain do it for us.

