Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 420259951DB
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2024 16:36:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.813190.1226030 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syBJz-0003ad-Bj; Tue, 08 Oct 2024 14:36:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 813190.1226030; Tue, 08 Oct 2024 14:36:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syBJz-0003Y9-71; Tue, 08 Oct 2024 14:36:19 +0000
Received: by outflank-mailman (input) for mailman id 813190;
 Tue, 08 Oct 2024 14:36:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Iuf0=RE=gmail.com=brgerst@srs-se1.protection.inumbo.net>)
 id 1syBJx-0003Xk-Gr
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2024 14:36:17 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id acf81a25-8582-11ef-a0bc-8be0dac302b0;
 Tue, 08 Oct 2024 16:36:16 +0200 (CEST)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-53994aadb66so5158366e87.2
 for <xen-devel@lists.xenproject.org>; Tue, 08 Oct 2024 07:36:16 -0700 (PDT)
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
X-Inumbo-ID: acf81a25-8582-11ef-a0bc-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728398176; x=1729002976; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RAzASSCUQ2aUVsiLqBLU+OR2T2BBF/GKBA/6/Hrht2Y=;
        b=OedTASEAtWBKMJ4Akhroy+D+a9A946k/M4Lef9/Ysfv16TWLfcTMHSFBsmxzkWuR4U
         CeS6xivMHVQmvX1KmcZvUQnQJKAH0+V6ctvVAi20lCUAyT+8K+8JJSs2YKK2FOc+Cj1L
         4bvasG/usyAhSN5s08aeA46fzwYrFRU7h5Kuk1ugPnz7SofWI0PGfe7DQhkXnmbvrO+l
         gZNxjxS1QrGbcLB8D9kgT3VWf5qe+bW3NC2Et4oMeHSrySZrcMNbGDIuI6Q53Uyf/k2a
         /TjEkjdQHmxTGGEh4VET60Vjdl1PZojQpjzGwVVCMLEiQCteTyT/rBDZa1PS4ip1lVmB
         ekIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728398176; x=1729002976;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RAzASSCUQ2aUVsiLqBLU+OR2T2BBF/GKBA/6/Hrht2Y=;
        b=cIcy4yVkzlymKiGch3gL6QteJ30YEMUTKoo7X8d3z3J5egYTGlNoiseXcFhI/GrBwl
         0U3V9r7LUrhuaZqJ0axafibW5vuwj4imoLv9w2gSPUETp7qrDJK8zJb/Noa4r/ZU2S83
         +2MnknRiKGwU6bjQvi451Qc/up9ipYOJ+vfp29ozTWIplZG4PvYGU14sGqzA51keWhKr
         hvrGlvQ53SQN2IUdSXOWk1kFPPeP9eu9mcCOYwtf9RKiX16wQ50+a//rftnM1Q2RRAxJ
         Y8dYQvyG/UpGYIl5is0SsGPqIFgAMzug/ebDOcM0hQAHk2DgtixIjaNLl4t+O53mUMgi
         zb2g==
X-Forwarded-Encrypted: i=1; AJvYcCXlqGhLKdt4EE8Q0tCuMMX9oIwvuEREt++juWt2qOe+anCh8MeqEXkYIrfABNrf77kuSzaTcaoCBSM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwajCa7hfI9WqMfzbv4N7YgR1OCi8ZqhfhGPWpNjPr96rbP8NFR
	YuKPP6O0KfqAThl67wptZvrPbEVDtVSjdE2m1TU7MCxekee2l42zM7mGcyVP8QWW+zKTrS/ccaW
	s4zW28ht0sHfzOaZ6Eoo7xn/OzQ==
X-Google-Smtp-Source: AGHT+IFk7uSGpMKxSJMgul6omDcmQyMQl5Zy1l8C5NVTbpCgjnnjxrxdxyhpPaT355keXYtQRCu422aiN8olYIcP4XU=
X-Received: by 2002:a05:6512:3085:b0:539:8a9a:4e56 with SMTP id
 2adb3069b0e04-539ab8c6fb8mr8574397e87.53.1728398175714; Tue, 08 Oct 2024
 07:36:15 -0700 (PDT)
MIME-Version: 1.0
References: <20240925150059.3955569-30-ardb+git@google.com>
 <20240925150059.3955569-35-ardb+git@google.com> <CAFULd4ZNwfPZO-yDjrtT2ANV509HeeYgR80b9AFachaVW5zqrg@mail.gmail.com>
 <CAMzpN2j4uj=mhdi7QHaA7y_NLtaHuRpnit38quK6RjvxdUYQew@mail.gmail.com> <CAMj1kXF3_Hj9j2f_cBtwTFWvEmB0UoEs_cGkRiWc4AErDx0ftQ@mail.gmail.com>
In-Reply-To: <CAMj1kXF3_Hj9j2f_cBtwTFWvEmB0UoEs_cGkRiWc4AErDx0ftQ@mail.gmail.com>
From: Brian Gerst <brgerst@gmail.com>
Date: Tue, 8 Oct 2024 10:36:03 -0400
Message-ID: <CAMzpN2jWRV8-JzM2FjSvSz+VoDrNVeEJPgF7N5ksLaADHpnHsA@mail.gmail.com>
Subject: Re: [RFC PATCH 05/28] x86: Define the stack protector guard symbol explicitly
To: Ard Biesheuvel <ardb@kernel.org>
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

On Fri, Oct 4, 2024 at 9:15=E2=80=AFAM Ard Biesheuvel <ardb@kernel.org> wro=
te:
>
> On Sat, 28 Sept 2024 at 15:41, Brian Gerst <brgerst@gmail.com> wrote:
> >
> > On Wed, Sep 25, 2024 at 2:33=E2=80=AFPM Uros Bizjak <ubizjak@gmail.com>=
 wrote:
> > >
> > > On Wed, Sep 25, 2024 at 5:02=E2=80=AFPM Ard Biesheuvel <ardb+git@goog=
le.com> wrote:
> > > >
> > > > From: Ard Biesheuvel <ardb@kernel.org>
> > > >
> > > > Specify the guard symbol for the stack cookie explicitly, rather th=
an
> > > > positioning it exactly 40 bytes into the per-CPU area. Doing so rem=
oves
> > > > the need for the per-CPU region to be absolute rather than relative=
 to
> > > > the placement of the per-CPU template region in the kernel image, a=
nd
> > > > this allows the special handling for absolute per-CPU symbols to be
> > > > removed entirely.
> > > >
> > > > This is a worthwhile cleanup in itself, but it is also a prerequisi=
te
> > > > for PIE codegen and PIE linking, which can replace our bespoke and
> > > > rather clunky runtime relocation handling.
> > >
> > > I would like to point out a series that converted the stack protector
> > > guard symbol to a normal percpu variable [1], so there was no need to
> > > assume anything about the location of the guard symbol.
> > >
> > > [1] "[PATCH v4 00/16] x86-64: Stack protector and percpu improvements=
"
> > > https://lore.kernel.org/lkml/20240322165233.71698-1-brgerst@gmail.com=
/
> > >
> > > Uros.
> >
> > I plan on resubmitting that series sometime after the 6.12 merge
> > window closes.  As I recall from the last version, it was decided to
> > wait until after the next LTS release to raise the minimum GCC version
> > to 8.1 and avoid the need to be compatible with the old stack
> > protector layout.
> >
>
> Hi Brian,
>
> I'd be more than happy to compare notes on that - I wasn't aware of
> your intentions here, or I would have reached out before sending this
> RFC.
>
> There are two things that you would need to address for Clang support
> to work correctly:
> - the workaround I cc'ed you on the other day [0],
> - a workaround for the module loader so it tolerates the GOTPCRELX
> relocations that Clang emits [1]
>
>
>
> [0] https://lore.kernel.org/all/20241002092534.3163838-2-ardb+git@google.=
com/
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git/commit=
/?id=3Da18121aabbdd

The first patch should be applied independently as a bug fix, since it
already affects the 32-bit build with clang.

I don't have an environment with an older clang compiler to test the
second patch, but I'll assume it will be necessary.  I did run into an
issue with the GOTPCRELX relocations before [1], but I thought it was
just an objtool issue and didn't do more testing to know if modules
were broken or not.

Brian Gerst

[1] https://lore.kernel.org/all/20231026160100.195099-6-brgerst@gmail.com/

