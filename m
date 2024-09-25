Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF199865E2
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 19:44:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.804464.1215449 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stW2r-0003dC-LF; Wed, 25 Sep 2024 17:43:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 804464.1215449; Wed, 25 Sep 2024 17:43:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stW2r-0003bI-IV; Wed, 25 Sep 2024 17:43:21 +0000
Received: by outflank-mailman (input) for mailman id 804464;
 Wed, 25 Sep 2024 17:43:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xqd3=QX=kernel.org=ardb@srs-se1.protection.inumbo.net>)
 id 1stW2q-0003a3-6s
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2024 17:43:20 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a54409a3-7b65-11ef-99a2-01e77a169b0f;
 Wed, 25 Sep 2024 19:43:17 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EB1D35C5BFB
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2024 17:43:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A1A4C4CECE
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2024 17:43:15 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-2f75c205e4aso1129631fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2024 10:43:15 -0700 (PDT)
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
X-Inumbo-ID: a54409a3-7b65-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727286195;
	bh=F9RWq/rXxSYntRpuJCLCsbi4j1kIhMfwU6j+9oqCDbQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=M6VEBkraQSPZ8cxqReuxBwlaICA2tzRN5Zceq56xf5Mo0x9B4Z3dAcSux2zF96RN6
	 YalpWG0dbVFqDz8qTawbEkhXKN/LYPQrPL3+8ixoIy9TWf5++k/7ic6LOUko0Q+veV
	 gM/aSWopCbB7nG+gAczSb6bbzJSUzI71pV5Hbu1iz9Ncj3SgotN2J/tB7Mkw88wQ4V
	 zgzFJaFoEw5v7wRC5zmL/8lR5Ap/+Z+UtF1KeFezjm7Bm2DbPA9Fxac/wRVXRVaFdH
	 RLaNqPaV4xw96RmEbWQp8G+5I2p3MGskkBPE3W8iVOUecXG0QM+UDn4ivtteDOumUS
	 mfsOFtWbNwlBQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+fOq8H9ZL0dOB5Y+A7CdWYzXPktONxC7k9vN1fdvCiNQQtd9CrfLuma6UZS38OkRPfJAJ3+HJrCE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwrMz/f48UPMYtT+itBqBSCKbHdy87cfqedNwpRJtcXQr/kXjOS
	Fje1zmNfwRwlN3TcdsS12qRNh40Od7uC5ZCZsNwrBHLW4jV8iqgFudpY6j7PBqGi2Su9sUAVMEC
	7alN26xb3t4tulIqeJxx0LTE0f5c=
X-Google-Smtp-Source: AGHT+IE+in2ujKNOqfeviyH74B95luqIkWPFYLgeNJlVInDDisJWQsgCamgzHX+iXC0QURdLGLDiXb1g2DagGfPNhfo=
X-Received: by 2002:a05:651c:1504:b0:2f6:5f7b:e5e0 with SMTP id
 38308e7fff4ca-2f915ff58a0mr23471981fa.21.1727286193113; Wed, 25 Sep 2024
 10:43:13 -0700 (PDT)
MIME-Version: 1.0
References: <20240925150059.3955569-30-ardb+git@google.com>
 <20240925150059.3955569-35-ardb+git@google.com> <CAP-5=fXw1rcgWgMeDSVqiDYh2XYApyaJpNvukvJ7vMs7ZPMr6g@mail.gmail.com>
In-Reply-To: <CAP-5=fXw1rcgWgMeDSVqiDYh2XYApyaJpNvukvJ7vMs7ZPMr6g@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 25 Sep 2024 19:43:01 +0200
X-Gmail-Original-Message-ID: <CAMj1kXEmssrOhu20aLW4v88YVdkCfbeRg6arkgUoDNHm-4vbMA@mail.gmail.com>
Message-ID: <CAMj1kXEmssrOhu20aLW4v88YVdkCfbeRg6arkgUoDNHm-4vbMA@mail.gmail.com>
Subject: Re: [RFC PATCH 05/28] x86: Define the stack protector guard symbol explicitly
To: Ian Rogers <irogers@google.com>
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
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	linux-doc@vger.kernel.org, linux-pm@vger.kernel.org, kvm@vger.kernel.org, 
	xen-devel@lists.xenproject.org, linux-efi@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-sparse@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 25 Sept 2024 at 17:54, Ian Rogers <irogers@google.com> wrote:
>
> On Wed, Sep 25, 2024 at 8:02=E2=80=AFAM Ard Biesheuvel <ardb+git@google.c=
om> wrote:
> >
> > From: Ard Biesheuvel <ardb@kernel.org>
> >
> > Specify the guard symbol for the stack cookie explicitly, rather than
> > positioning it exactly 40 bytes into the per-CPU area. Doing so removes
> > the need for the per-CPU region to be absolute rather than relative to
> > the placement of the per-CPU template region in the kernel image, and
> > this allows the special handling for absolute per-CPU symbols to be
> > removed entirely.
> >
> > This is a worthwhile cleanup in itself, but it is also a prerequisite
> > for PIE codegen and PIE linking, which can replace our bespoke and
> > rather clunky runtime relocation handling.
> >
> > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> > ---
> >  arch/x86/Makefile                     |  4 ++++
> >  arch/x86/include/asm/init.h           |  2 +-
> >  arch/x86/include/asm/processor.h      | 11 +++--------
> >  arch/x86/include/asm/stackprotector.h |  4 ----
> >  tools/perf/util/annotate.c            |  4 ++--
> >  5 files changed, 10 insertions(+), 15 deletions(-)
> >
...
> > diff --git a/tools/perf/util/annotate.c b/tools/perf/util/annotate.c
> > index 37ce43c4eb8f..7ecfedf5edb9 100644
> > --- a/tools/perf/util/annotate.c
> > +++ b/tools/perf/util/annotate.c
> > @@ -2485,10 +2485,10 @@ static bool is_stack_operation(struct arch *arc=
h, struct disasm_line *dl)
> >
> >  static bool is_stack_canary(struct arch *arch, struct annotated_op_loc=
 *loc)
> >  {
> > -       /* On x86_64, %gs:40 is used for stack canary */
> > +       /* On x86_64, %gs:0 is used for stack canary */
> >         if (arch__is(arch, "x86")) {
> >                 if (loc->segment =3D=3D INSN_SEG_X86_GS && loc->imm &&
> > -                   loc->offset =3D=3D 40)
> > +                   loc->offset =3D=3D 0)
>
> As a new perf tool  can run on old kernels we may need to have this be
> something like:
> (loc->offset =3D=3D 40 /* pre v6.xx kernels */ || loc->offset =3D=3D 0 /*
> v6.xx and later */ )
>
> We could make this dependent on the kernel by processing the os_release s=
tring:
> https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git/=
tree/tools/perf/util/env.h#n55
> but that could well be more trouble than it is worth.
>

Yeah. I also wonder what the purpose of this feature is. At the end of
this series, the stack cookie will no longer be at a fixed offset of
%GS anyway, and so perf will not be able to identify it in the same
manner. So it is probably better to just leave this in place, as the
%gs:0 case will not exist in the field (assuming that the series lands
all at once).

Any idea why this deviates from other architectures? Is x86_64 the
only arch that needs to identify stack canary accesses in perf? We
could rename the symbol to something identifiable, and do it across
all architectures, if this really serves a need (and assuming that
perf has insight into the symbol table).

