Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 461F29903AD
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2024 15:16:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.810416.1223124 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swi9n-0002aC-1B; Fri, 04 Oct 2024 13:15:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 810416.1223124; Fri, 04 Oct 2024 13:15:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swi9m-0002XH-US; Fri, 04 Oct 2024 13:15:42 +0000
Received: by outflank-mailman (input) for mailman id 810416;
 Fri, 04 Oct 2024 13:15:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+0K3=RA=kernel.org=ardb@srs-se1.protection.inumbo.net>)
 id 1swi9l-0002XB-2u
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2024 13:15:41 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bf61e012-8252-11ef-a0bb-8be0dac302b0;
 Fri, 04 Oct 2024 15:15:39 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 636355C5BBE
 for <xen-devel@lists.xenproject.org>; Fri,  4 Oct 2024 13:15:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEE66C4CEDA
 for <xen-devel@lists.xenproject.org>; Fri,  4 Oct 2024 13:15:36 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-5398996acbeso2442288e87.1
 for <xen-devel@lists.xenproject.org>; Fri, 04 Oct 2024 06:15:36 -0700 (PDT)
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
X-Inumbo-ID: bf61e012-8252-11ef-a0bb-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728047736;
	bh=1JZwYefyhSOCZB3CuZertgMGY1R4ZnxNXU0IyQGN6qM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Kjjnc/L90TMtexTjGYxAYy1SQ1QLyKkvF/CbvX4DRZe3QZLNjgmA043In5Mn3i/rw
	 6B5X+WF05mnRkF5MPsreCu1/RWhlYy0+kTzNNOgDa8rsLpPqegA7XxXK7Rhx0nUxa6
	 IBkZJ2pdiTlc6pHGbh4RfTk0ZTnhtJZsbARiZlcRcR6BaSSw9ooGopO2oN7M88zaKP
	 i9ZukewwH6dgft/J+7smkC7XLiCKWNYuCiKQdA/fHzzcPvpm6QIq/WKqZBvWKoD11P
	 SHCZ55g+iyuo9/ex9afVt1+UpR3QIha2xI0NPLiyaKR+gtHkWFsHfMyaquC5SiCFd1
	 mpOvPGs/3yVlw==
X-Forwarded-Encrypted: i=1; AJvYcCX1wg8CR8oTBh3VHZeJWJ4tZZfz7Xz1DY+5OszAlZh0rj10wG16wtFnH+W7MRlOmo5SRlU5ddYDz3c=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz2SQo6JjkR5hZ+OV0qtaAJ1xz448rM5hLuolVyap9Jja/tlPhV
	YHyfhx5QbQbK1pv0WLcIn+8C+HkjuTOp66/3Ljhv0x0mRZX84m1sMw8vVHXRWRXt523PzQrnqSf
	/7hVns1b4ed2lvrBRtKzksu0DIl8=
X-Google-Smtp-Source: AGHT+IEuHrt3V5yx40A/FQDIn91vq5WH5zeRnx8eS4s+O/De09fFFzzyl2W2oN2bUPJ3C1JSY+Ea24ADde6nXP4PqRA=
X-Received: by 2002:a05:6512:3096:b0:539:a2e0:4e75 with SMTP id
 2adb3069b0e04-539ab8662d1mr1636973e87.14.1728047734917; Fri, 04 Oct 2024
 06:15:34 -0700 (PDT)
MIME-Version: 1.0
References: <20240925150059.3955569-30-ardb+git@google.com>
 <20240925150059.3955569-35-ardb+git@google.com> <CAFULd4ZNwfPZO-yDjrtT2ANV509HeeYgR80b9AFachaVW5zqrg@mail.gmail.com>
 <CAMzpN2j4uj=mhdi7QHaA7y_NLtaHuRpnit38quK6RjvxdUYQew@mail.gmail.com>
In-Reply-To: <CAMzpN2j4uj=mhdi7QHaA7y_NLtaHuRpnit38quK6RjvxdUYQew@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 4 Oct 2024 15:15:22 +0200
X-Gmail-Original-Message-ID: <CAMj1kXF3_Hj9j2f_cBtwTFWvEmB0UoEs_cGkRiWc4AErDx0ftQ@mail.gmail.com>
Message-ID: <CAMj1kXF3_Hj9j2f_cBtwTFWvEmB0UoEs_cGkRiWc4AErDx0ftQ@mail.gmail.com>
Subject: Re: [RFC PATCH 05/28] x86: Define the stack protector guard symbol explicitly
To: Brian Gerst <brgerst@gmail.com>
Cc: Uros Bizjak <ubizjak@gmail.com>, Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org, 
	x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, 
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
Content-Transfer-Encoding: quoted-printable

On Sat, 28 Sept 2024 at 15:41, Brian Gerst <brgerst@gmail.com> wrote:
>
> On Wed, Sep 25, 2024 at 2:33=E2=80=AFPM Uros Bizjak <ubizjak@gmail.com> w=
rote:
> >
> > On Wed, Sep 25, 2024 at 5:02=E2=80=AFPM Ard Biesheuvel <ardb+git@google=
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
> >
> > I would like to point out a series that converted the stack protector
> > guard symbol to a normal percpu variable [1], so there was no need to
> > assume anything about the location of the guard symbol.
> >
> > [1] "[PATCH v4 00/16] x86-64: Stack protector and percpu improvements"
> > https://lore.kernel.org/lkml/20240322165233.71698-1-brgerst@gmail.com/
> >
> > Uros.
>
> I plan on resubmitting that series sometime after the 6.12 merge
> window closes.  As I recall from the last version, it was decided to
> wait until after the next LTS release to raise the minimum GCC version
> to 8.1 and avoid the need to be compatible with the old stack
> protector layout.
>

Hi Brian,

I'd be more than happy to compare notes on that - I wasn't aware of
your intentions here, or I would have reached out before sending this
RFC.

There are two things that you would need to address for Clang support
to work correctly:
- the workaround I cc'ed you on the other day [0],
- a workaround for the module loader so it tolerates the GOTPCRELX
relocations that Clang emits [1]



[0] https://lore.kernel.org/all/20241002092534.3163838-2-ardb+git@google.co=
m/
[1] https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git/commit/?=
id=3Da18121aabbdd

