Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 280FF988F77
	for <lists+xen-devel@lfdr.de>; Sat, 28 Sep 2024 15:42:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.806745.1218005 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1suXhL-00034e-1A; Sat, 28 Sep 2024 13:41:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 806745.1218005; Sat, 28 Sep 2024 13:41:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1suXhK-00032I-UX; Sat, 28 Sep 2024 13:41:22 +0000
Received: by outflank-mailman (input) for mailman id 806745;
 Sat, 28 Sep 2024 13:41:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3Tjs=Q2=gmail.com=brgerst@srs-se1.protection.inumbo.net>)
 id 1suXhJ-00032C-By
 for xen-devel@lists.xenproject.org; Sat, 28 Sep 2024 13:41:21 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 57f00eda-7d9f-11ef-a0ba-8be0dac302b0;
 Sat, 28 Sep 2024 15:41:20 +0200 (CEST)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-5365cf5de24so3902514e87.1
 for <xen-devel@lists.xenproject.org>; Sat, 28 Sep 2024 06:41:20 -0700 (PDT)
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
X-Inumbo-ID: 57f00eda-7d9f-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727530879; x=1728135679; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iNmBSpA2BmR/JT9QNG5130+zMmw0zS2R0933ikB5pGY=;
        b=bhezv9eM0YxllwUg1UfXW956oMYSgzGlkOhPBI8TA22iceA7egL3S4VkLdFQ+g75lI
         SKtLauGVjBWw/ob5g6Pz9lrlY1hHi0kWLF/QI8oeV8rp906QHTTQkBWxzKbOLGMzXAkW
         UMPPkLdDY1qEVY2sGMpRRD6iYRWCVaJ9IJnlb8H/gsmP1J55AkwLYr6T1lrpM/kE1yHd
         pJRdWOf2hUz4ltA6yTnBcfni8lHZaGoSD4cd1foXZVu6A0krZT7pMHi3kzla0hHfWuEM
         zBPuNKUsQTGeJJLYA6WJ6RnMYDO40dPKPNzCxHhZZDJxrzcVvC3bXTqKDLuBMXByMsyT
         bsJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727530879; x=1728135679;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iNmBSpA2BmR/JT9QNG5130+zMmw0zS2R0933ikB5pGY=;
        b=CWjHjKFTCp1vJ4gZZ5V8jsBwaeS5/YTsnVK+6dobEnQ/M1w6XoEeq3PYRI3JPoGg3K
         s+u8mdr8qNwZ0PphZsJTyKqfFEuyo9bRAynKOWcvDNfMhfwbQ1FAb4R4xLxjmGPo1vNP
         zVuLeKY5XBAeVB6pMlQOMrRJluaUsICkkzTeD/Fpc/vTD8GlTlG/a+sax0GhHChy4MyJ
         UNFcN6QZ/atVE0zb2HAnzo6ksVP99GsQEyE+mqwiinD9CqKvWjj8f77F+h9xfaljblHH
         SWNAHTDMxBo4AUOPKheKE74udT9gnQo+5ncbeUPYuo51QGAfLIUmgGDhfGoC36O/QhXk
         aQ0g==
X-Forwarded-Encrypted: i=1; AJvYcCVlm7wH4I9eA0smSEw1m3RSf1KYlqOLcpM5aMNLOt/R77RSkTnSQhpE0y47CBIxdn9wPTtlMECkgBM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyaUbY8CQxrjUmLVeoCZAA6rSsfIm6jdGAI6aQrkJG65nqs2C91
	ejxw/Ospi+h7uUxxOTMqaz48q7uObB/FpC0feLI+ppDrIgtjUlsb0HW6BeEkfaS5CJBq6VtNhBF
	7gJ9qiiL6Vxz3idRQKOoye5LQPA==
X-Google-Smtp-Source: AGHT+IHmvDJivNH43Y01ucMKJYFoc8AFcX6hzmgU+8XoeSSFhpvEaQoSvahoajb/ht++NQ+MH1stDT2FsmHiW/GwHn4=
X-Received: by 2002:a05:6512:3f07:b0:536:54df:bffa with SMTP id
 2adb3069b0e04-5389fc7fefemr3962432e87.45.1727530879148; Sat, 28 Sep 2024
 06:41:19 -0700 (PDT)
MIME-Version: 1.0
References: <20240925150059.3955569-30-ardb+git@google.com>
 <20240925150059.3955569-35-ardb+git@google.com> <CAFULd4ZNwfPZO-yDjrtT2ANV509HeeYgR80b9AFachaVW5zqrg@mail.gmail.com>
In-Reply-To: <CAFULd4ZNwfPZO-yDjrtT2ANV509HeeYgR80b9AFachaVW5zqrg@mail.gmail.com>
From: Brian Gerst <brgerst@gmail.com>
Date: Sat, 28 Sep 2024 09:41:07 -0400
Message-ID: <CAMzpN2j4uj=mhdi7QHaA7y_NLtaHuRpnit38quK6RjvxdUYQew@mail.gmail.com>
Subject: Re: [RFC PATCH 05/28] x86: Define the stack protector guard symbol explicitly
To: Uros Bizjak <ubizjak@gmail.com>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Dennis Zhou <dennis@kernel.org>, 
	Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@linux.com>, 
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
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 25, 2024 at 2:33=E2=80=AFPM Uros Bizjak <ubizjak@gmail.com> wro=
te:
>
> On Wed, Sep 25, 2024 at 5:02=E2=80=AFPM Ard Biesheuvel <ardb+git@google.c=
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
>
> I would like to point out a series that converted the stack protector
> guard symbol to a normal percpu variable [1], so there was no need to
> assume anything about the location of the guard symbol.
>
> [1] "[PATCH v4 00/16] x86-64: Stack protector and percpu improvements"
> https://lore.kernel.org/lkml/20240322165233.71698-1-brgerst@gmail.com/
>
> Uros.

I plan on resubmitting that series sometime after the 6.12 merge
window closes.  As I recall from the last version, it was decided to
wait until after the next LTS release to raise the minimum GCC version
to 8.1 and avoid the need to be compatible with the old stack
protector layout.

Brian Gerst

