Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F279865F3
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 19:49:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.804476.1215469 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stW85-0007jo-EU; Wed, 25 Sep 2024 17:48:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 804476.1215469; Wed, 25 Sep 2024 17:48:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stW85-0007hF-Bp; Wed, 25 Sep 2024 17:48:45 +0000
Received: by outflank-mailman (input) for mailman id 804476;
 Wed, 25 Sep 2024 17:48:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LwhS=QX=google.com=irogers@srs-se1.protection.inumbo.net>)
 id 1stW84-0007h9-DV
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2024 17:48:44 +0000
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [2607:f8b0:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6784caea-7b66-11ef-a0ba-8be0dac302b0;
 Wed, 25 Sep 2024 19:48:43 +0200 (CEST)
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-2056aa5cefcso17785ad.0
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2024 10:48:43 -0700 (PDT)
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
X-Inumbo-ID: 6784caea-7b66-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727286522; x=1727891322; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lrK3h7FdOSPKkdvPmV4/inQbE4aDL8B9EB3Kr7AaA5w=;
        b=G7EzpT/8VceC+DQ9PAu3w+rgdPWRm3WcjeCXlWXxg2uTi9JfA98DVulu+GQyhj9cJw
         tnBXFbB3DzXTturZB8ghNAARYma3WiQHt/qB7LPwEO6zpVUkIzZvfh3ORAQwOO0vHPST
         8019/b37XSk1uHyOoKx4x7l9eXzxvsAL3JHG/nsme/U9ZYXPy6X2T54a8K2+xvNa1xSK
         /B9EdD57wl1Tn4N8eMlkREaFrpM3aDtk6nllO7KhMGkNtp2JbgSyH4vCG8O5w2l1qI4n
         RKiDlVRvDBQIjpB4n2Y5TPnc3Y7v+Ls8JaKEw0oEiEzgOEkgTZcLH6PFS+B/PiOD9en6
         UStw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727286522; x=1727891322;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lrK3h7FdOSPKkdvPmV4/inQbE4aDL8B9EB3Kr7AaA5w=;
        b=H/NwT2b0p8IfMXUyB1ulYVsKbr8FaUlRwM8QsbcdDmdJLDX61pVIJuUquWD208N+AQ
         7sxDHHWjh4ex62qmEttRdBJfwoKuc6cJlFy4RZk71SJB8R+AmGH/jOhbHUY1IaHbxczK
         AyDeM/UNW3Q3hPZJJyjreLKu2GECfrInltBqfg6gNJlIuJauh/Wjzy02EVtJ0wcbOghU
         nF/zrQMo3bsDidPYWL6XyJvUz00G2BvdkiDRStEX2camw6usiIKYbc2UijP6Y/yywJz4
         THghMxCraR4KEWmGKODU+AtJch1JvjMv4DCPY5kxSPVnfPcXqQUHYBBWebKaQn8o8tjf
         6gFA==
X-Forwarded-Encrypted: i=1; AJvYcCWlES7YTsJsLX6+qwRaujeB9Av0xxC0EWocwK91YExCyPjkaSx21c2/uQR3WOtXKOrxGanhY1/MZVo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxZlpTfI2fGvaW4wLAjLTvnDZnoRBL7EZ+gf69gVsqusMqz6uSx
	5WPU5O+9uEzRVPsFomNP1VbF0E4YcuWw4wmVuRZyVjoftG7hQ+yr6h80+LiZSo2VCdYVjkMIWob
	W/O39ocais7QvmGDt1xYWrxy9CyHm4sQ4Qyl3
X-Google-Smtp-Source: AGHT+IFiXYlI29ocsY9jVI8vGIQKmEL8X6grxbcgFKgyWyz2ix/vsNm7/Zsem2ox1yGF0FtMygKog55oBTNJR6Dh6yI=
X-Received: by 2002:a17:903:1210:b0:206:a913:96b9 with SMTP id
 d9443c01a7336-20b1b302843mr105105ad.10.1727286521405; Wed, 25 Sep 2024
 10:48:41 -0700 (PDT)
MIME-Version: 1.0
References: <20240925150059.3955569-30-ardb+git@google.com>
 <20240925150059.3955569-35-ardb+git@google.com> <CAP-5=fXw1rcgWgMeDSVqiDYh2XYApyaJpNvukvJ7vMs7ZPMr6g@mail.gmail.com>
 <CAMj1kXEmssrOhu20aLW4v88YVdkCfbeRg6arkgUoDNHm-4vbMA@mail.gmail.com>
In-Reply-To: <CAMj1kXEmssrOhu20aLW4v88YVdkCfbeRg6arkgUoDNHm-4vbMA@mail.gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 25 Sep 2024 10:48:27 -0700
Message-ID: <CAP-5=fXstnbX7rY1_RcOP_TmuXqY3HTt__4VgEkgNEJQPHxezg@mail.gmail.com>
Subject: Re: [RFC PATCH 05/28] x86: Define the stack protector guard symbol explicitly
To: Ard Biesheuvel <ardb@kernel.org>, Namhyung Kim <namhyung@kernel.org>
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
	Arnaldo Carvalho de Melo <acme@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	linux-doc@vger.kernel.org, linux-pm@vger.kernel.org, kvm@vger.kernel.org, 
	xen-devel@lists.xenproject.org, linux-efi@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-sparse@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 25, 2024 at 10:43=E2=80=AFAM Ard Biesheuvel <ardb@kernel.org> w=
rote:
>
> On Wed, 25 Sept 2024 at 17:54, Ian Rogers <irogers@google.com> wrote:
> >
> > On Wed, Sep 25, 2024 at 8:02=E2=80=AFAM Ard Biesheuvel <ardb+git@google=
.com> wrote:
> > >
> > > From: Ard Biesheuvel <ardb@kernel.org>
> > >
> > > Specify the guard symbol for the stack cookie explicitly, rather than
> > > positioning it exactly 40 bytes into the per-CPU area. Doing so remov=
es
> > > the need for the per-CPU region to be absolute rather than relative t=
o
> > > the placement of the per-CPU template region in the kernel image, and
> > > this allows the special handling for absolute per-CPU symbols to be
> > > removed entirely.
> > >
> > > This is a worthwhile cleanup in itself, but it is also a prerequisite
> > > for PIE codegen and PIE linking, which can replace our bespoke and
> > > rather clunky runtime relocation handling.
> > >
> > > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> > > ---
> > >  arch/x86/Makefile                     |  4 ++++
> > >  arch/x86/include/asm/init.h           |  2 +-
> > >  arch/x86/include/asm/processor.h      | 11 +++--------
> > >  arch/x86/include/asm/stackprotector.h |  4 ----
> > >  tools/perf/util/annotate.c            |  4 ++--
> > >  5 files changed, 10 insertions(+), 15 deletions(-)
> > >
> ...
> > > diff --git a/tools/perf/util/annotate.c b/tools/perf/util/annotate.c
> > > index 37ce43c4eb8f..7ecfedf5edb9 100644
> > > --- a/tools/perf/util/annotate.c
> > > +++ b/tools/perf/util/annotate.c
> > > @@ -2485,10 +2485,10 @@ static bool is_stack_operation(struct arch *a=
rch, struct disasm_line *dl)
> > >
> > >  static bool is_stack_canary(struct arch *arch, struct annotated_op_l=
oc *loc)
> > >  {
> > > -       /* On x86_64, %gs:40 is used for stack canary */
> > > +       /* On x86_64, %gs:0 is used for stack canary */
> > >         if (arch__is(arch, "x86")) {
> > >                 if (loc->segment =3D=3D INSN_SEG_X86_GS && loc->imm &=
&
> > > -                   loc->offset =3D=3D 40)
> > > +                   loc->offset =3D=3D 0)
> >
> > As a new perf tool  can run on old kernels we may need to have this be
> > something like:
> > (loc->offset =3D=3D 40 /* pre v6.xx kernels */ || loc->offset =3D=3D 0 =
/*
> > v6.xx and later */ )
> >
> > We could make this dependent on the kernel by processing the os_release=
 string:
> > https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.gi=
t/tree/tools/perf/util/env.h#n55
> > but that could well be more trouble than it is worth.
> >
>
> Yeah. I also wonder what the purpose of this feature is. At the end of
> this series, the stack cookie will no longer be at a fixed offset of
> %GS anyway, and so perf will not be able to identify it in the same
> manner. So it is probably better to just leave this in place, as the
> %gs:0 case will not exist in the field (assuming that the series lands
> all at once).
>
> Any idea why this deviates from other architectures? Is x86_64 the
> only arch that needs to identify stack canary accesses in perf? We
> could rename the symbol to something identifiable, and do it across
> all architectures, if this really serves a need (and assuming that
> perf has insight into the symbol table).

This is relatively new work coming from Namhyung for data type
profiling and I believe is pretty much just x86 at the moment -
although the ever awesome IBM made contributions for PowerPC. The data
type profiling is trying to classify memory accesses which is why it
cares about the stack canary instruction, the particular encoding
shouldn't matter.

Thanks,
Ian

