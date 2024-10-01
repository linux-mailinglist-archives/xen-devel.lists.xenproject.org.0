Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46EEC98B5E8
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2024 09:40:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807777.1219419 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svXUK-0001R1-LS; Tue, 01 Oct 2024 07:40:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807777.1219419; Tue, 01 Oct 2024 07:40:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svXUK-0001Mm-Ih; Tue, 01 Oct 2024 07:40:04 +0000
Received: by outflank-mailman (input) for mailman id 807777;
 Tue, 01 Oct 2024 07:40:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AZty=Q5=kernel.org=ardb@srs-se1.protection.inumbo.net>)
 id 1svXUI-00012B-Re
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2024 07:40:02 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5d30807a-7fc8-11ef-a0ba-8be0dac302b0;
 Tue, 01 Oct 2024 09:40:01 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C366D5C54BC
 for <xen-devel@lists.xenproject.org>; Tue,  1 Oct 2024 07:39:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05D89C4CEE0
 for <xen-devel@lists.xenproject.org>; Tue,  1 Oct 2024 07:39:59 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-2fabfc06de3so28969671fa.1
 for <xen-devel@lists.xenproject.org>; Tue, 01 Oct 2024 00:39:58 -0700 (PDT)
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
X-Inumbo-ID: 5d30807a-7fc8-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727768399;
	bh=za16NxIQDUGjjHP2c29sw6PI8ZU3lXszSx4jSWmr5Jk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=aDEbkzH31TMYxyPZ0U4IqFDz2ggAiyQ93AuGH6DFWD852wq66X3Juctv++qrVnY1E
	 6ZxaDC6+h3KE0C3l6NuZeDDiDBRF3EQr23e6H7GtHVX072wWjX7iI/+gFopMi4XBCn
	 BQre8YouOhT4yPxzR2ekUT/nh48OGc3LLs9GaU55B4BLhQp30yz1hZOr+kIXvYG3ih
	 OZ3IX+Rt7jhZPHye/HmzQ++7Vy95pRJ5j3zgDMATlOYnW26kd2Y9d5yDOCNbt7sReu
	 G4umcThdYU5KCIUGRK/jsPgHtwnY8ozG6RFsniIyYbjsaaJ8GQzJdc9VLHuOINxJqx
	 dhb3f3MUsJE9A==
X-Forwarded-Encrypted: i=1; AJvYcCVr9R8O7sipGr+9Ntw37nntf8hsP4s0gIx07SHPQNkL2dm+UyNknZZ/7EtaINrPcRJlVDNleWbW/I4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwKhJ9ZwH0DRfO8UNX6QDFXRkPEFLaSbRd5WWkFCrnCIqqj7AYA
	ix6SiQaElc1NG//VDYV1i5kGmhvEc53SRzCKA6VDfQW7wwy5W6K+0yP4mUUsCRC5FqjDzdagktI
	OBOuwV3Zz6CQIOnY6QYbekWqwzRM=
X-Google-Smtp-Source: AGHT+IGSGW+uzmUjxyeIFaLft3PnZ2kaCaMuKqb2T+GLgytq3+U5XTQLxKYTu05fD4+Ir4Uuwo1LuIK4EgJ7mk97UG4=
X-Received: by 2002:a05:6512:b9e:b0:539:8e20:105 with SMTP id
 2adb3069b0e04-5398e200266mr5005657e87.28.1727768396993; Tue, 01 Oct 2024
 00:39:56 -0700 (PDT)
MIME-Version: 1.0
References: <20240925150059.3955569-30-ardb+git@google.com>
 <20240925150059.3955569-54-ardb+git@google.com> <20241001071841.yrc7cxdp2unnzju7@treble>
In-Reply-To: <20241001071841.yrc7cxdp2unnzju7@treble>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 1 Oct 2024 09:39:45 +0200
X-Gmail-Original-Message-ID: <CAMj1kXGA785Z2_AWuTTXPkvH9Mis=28rn_paOZe=gdaXjpu-=A@mail.gmail.com>
Message-ID: <CAMj1kXGA785Z2_AWuTTXPkvH9Mis=28rn_paOZe=gdaXjpu-=A@mail.gmail.com>
Subject: Re: [RFC PATCH 24/28] tools/objtool: Treat indirect ftrace calls as
 direct calls
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

On Tue, 1 Oct 2024 at 09:18, Josh Poimboeuf <jpoimboe@kernel.org> wrote:
>
> On Wed, Sep 25, 2024 at 05:01:24PM +0200, Ard Biesheuvel wrote:
> > +             if (insn->type == INSN_CALL_DYNAMIC) {
> > +                     if (!reloc)
> > +                             continue;
> > +
> > +                     /*
> > +                      * GCC 13 and older on x86 will always emit the call to
> > +                      * __fentry__ using a relaxable GOT-based symbol
> > +                      * reference when operating in PIC mode, i.e.,
> > +                      *
> > +                      *   call   *0x0(%rip)
> > +                      *             R_X86_64_GOTPCRELX  __fentry__-0x4
> > +                      *
> > +                      * where it is left up to the linker to relax this into
> > +                      *
> > +                      *   call   __fentry__
> > +                      *   nop
> > +                      *
> > +                      * if __fentry__ turns out to be DSO local, which is
> > +                      * always the case for vmlinux. Given that this
> > +                      * relaxation is mandatory per the x86_64 psABI, these
> > +                      * calls can simply be treated as direct calls.
> > +                      */
> > +                     if (arch_ftrace_match(reloc->sym->name)) {
> > +                             insn->type = INSN_CALL;
> > +                             add_call_dest(file, insn, reloc->sym, false);
> > +                     }
>
> Can the compiler also do this for non-fentry direct calls?

No, it is essentially an oversight in GCC that this happens at all,
and I fixed it [0] for GCC 14, i.e., to honour -mdirect-extern-access
when emitting these calls.

But even without that, it is peculiar at the very least that the
compiler would emit GOT based indirect calls at all.

Instead of

  call *__fentry__@GOTPCREL(%rip)

it should simply emit

  call __fentry__@PLT

and leave it up to the linker to resolve this directly or
lazily/eagerly via a PLT jump (assuming -fno-plt is not being used)

> If so would
> it make sense to generalize this by converting all
> INSN_CALL_DYNAMIC+reloc to INSN_CALL?
>
> And maybe something similar for add_jump_destinations().
>

I suppose that the pattern INSN_CALL_DYNAMIC+reloc is unambiguous, and
can therefore always be treated as INSN_CALL. But I don't anticipate
any other occurrences here, and if they do exist, they indicate some
other weirdness in the compiler, so perhaps it is better not to add
general support for these.


[0] https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=bde21de1205c0456f6df68c950fb7ee631fcfa93

