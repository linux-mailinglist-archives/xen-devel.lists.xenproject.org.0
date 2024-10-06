Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C7C991D0E
	for <lists+xen-devel@lfdr.de>; Sun,  6 Oct 2024 10:01:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.811156.1223790 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxMBF-0001SA-0P; Sun, 06 Oct 2024 07:59:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 811156.1223790; Sun, 06 Oct 2024 07:59:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxMBE-0001Oh-Te; Sun, 06 Oct 2024 07:59:52 +0000
Received: by outflank-mailman (input) for mailman id 811156;
 Sun, 06 Oct 2024 07:59:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7wyB=RC=gmail.com=ubizjak@srs-se1.protection.inumbo.net>)
 id 1sxMBC-0001Ob-W4
 for xen-devel@lists.xenproject.org; Sun, 06 Oct 2024 07:59:51 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f5b32931-83b8-11ef-a0bb-8be0dac302b0;
 Sun, 06 Oct 2024 09:59:49 +0200 (CEST)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2fad5024b8dso38792181fa.1
 for <xen-devel@lists.xenproject.org>; Sun, 06 Oct 2024 00:59:49 -0700 (PDT)
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
X-Inumbo-ID: f5b32931-83b8-11ef-a0bb-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728201588; x=1728806388; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TPKYyYBqIk2nde1TDg/wyIZWJzsFsCGXcjUuTc5pqeY=;
        b=k4F+Y31N5GRr4Q1vu/gWodvWe4TktrOmaiexYxkFjOcG/T5CoAWlKOYDgDoX3Fs048
         fhsgkRZV48Zh1zqdIjCnMULgheDiUqekct0755kUH9o17zSvTptDgwO9JchwCoJ3NQd/
         imRbts9J76XabvqdQzOR2GL94Z4r+5nTBgzS1RvpaxFupDSL17gvxFCBCfCOgH6suXEZ
         ryZuXnRL1V7TqmmvyW/Gq5sCnJWCGiK2wjjE9pTVXxw5b5IytgICQuac/9uhfSnEqP4p
         BB1Vq6sribSN8TbIOy0dl11EmmwMS0nIIaE0gxCPaRYNHamoUpK1nZtFzRgbE7ID/c+M
         zcqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728201588; x=1728806388;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TPKYyYBqIk2nde1TDg/wyIZWJzsFsCGXcjUuTc5pqeY=;
        b=Fj3l8NJheniSYehIS7R+/3dIvkBJBG3zLR2cL5avAfVYUlm/jWQGtIWBYucvHpH75N
         HPLOZsAPOaX88Ibp6w5NhcEma7Qyqk8A98r+9REobBpxJQu4UQOPiKdKG+0S24+F5I6T
         7APKr7it3Bas0s9Orl3b/LIiCDOnTR/fi6ulCXf9NxSmJlgkw6KDVzIiHGl+g2pqNObl
         Mx82FaXTncLlcOJXrJWJjfRu6MB3mJ66QVu9qnANbSXEggQf3j3F+EQLBx2MOZJTDuG5
         kbY3y+cJSEmGbeqWe0izq31Mn3ekK1eDHUXHyLPpvbNZo1AJBG+TDYOlQFv/I8pbCzrk
         C+sQ==
X-Forwarded-Encrypted: i=1; AJvYcCWRfCisYmzEcHLTFVebshliuvuM9CG1oakpcRyhR0ax4YpRWtBtonwji7xjD8atGPEQtMDaY+7OS68=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzG9JYCUSmqEayFkg6xwVWmVwJNC1ALK4XoMgLK1HSQwmKHcGE8
	DjR9sga1WMl2qzz+N0vMxOyIrD9lAmjYOYhK7JFb9vdU6uP4ImNwk2QgHhINBJ+h7qsfJmfMyvh
	AUVKYL7HoyXPExUcbN+6yLtdsja4=
X-Google-Smtp-Source: AGHT+IE2zUoTNKRDJOdgkWI5Cw6UcFhRdeh7rJkjxE6MXyTsb+8X3cwADhQlSBEhykzT0ML1M4fcluEMHpcmKEmwoVU=
X-Received: by 2002:a05:651c:1549:b0:2fa:c873:45ce with SMTP id
 38308e7fff4ca-2faf3c64dcemr33189261fa.30.1728201588155; Sun, 06 Oct 2024
 00:59:48 -0700 (PDT)
MIME-Version: 1.0
References: <20240925150059.3955569-30-ardb+git@google.com>
 <20240925150059.3955569-55-ardb+git@google.com> <99446363-152f-43a8-8b74-26f0d883a364@zytor.com>
 <CAMj1kXG7ZELM8D7Ft3H+dD5BHqENjY9eQ9kzsq2FzTgP5+2W3A@mail.gmail.com>
 <CAHk-=wj0HG2M1JgoN-zdCwFSW=N7j5iMB0RR90aftTS3oqwKTg@mail.gmail.com>
 <CAMj1kXEU5RU0i11zqD0433_LMMyNQH2gCoSkU7GeXmaRXGF1Yw@mail.gmail.com>
 <5c7490bb-aa74-427b-849e-c28c343b7409@zytor.com> <CAFULd4Yj9LfTnWFu=c1M7Eh44+XFk0ibwL57r5H7wZjvKZ8yaA@mail.gmail.com>
 <3bbb85ae-8ba5-4777-999f-d20705c386e7@zytor.com>
In-Reply-To: <3bbb85ae-8ba5-4777-999f-d20705c386e7@zytor.com>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Sun, 6 Oct 2024 09:59:40 +0200
Message-ID: <CAFULd4b==a7H0zdGVfABntL0efrS-F3eeHGu-63oyz1eh1DwXQ@mail.gmail.com>
Subject: Re: [RFC PATCH 25/28] x86: Use PIE codegen for the core kernel
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Ard Biesheuvel <ardb@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org, x86@kernel.org, 
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

On Sun, Oct 6, 2024 at 1:37=E2=80=AFAM H. Peter Anvin <hpa@zytor.com> wrote=
:
>
> On 10/5/24 01:31, Uros Bizjak wrote:
> >>
> >> movq $sym to leaq sym(%rip) which you said ought to be smaller (and in
> >> reality appears to be the same size, 7 bytes) seems like a no-brainer
> >> and can be treated as a code quality issue -- in other words, file bug
> >> reports against gcc and clang.
> >
> > It is the kernel assembly source that should be converted to
> > rip-relative form, gcc (and probably clang) have nothing with it.
> >
>
> Sadly, that is not correct; neither gcc nor clang uses lea:
>
>         -hpa
>
>
> gcc version 14.2.1 20240912 (Red Hat 14.2.1-3) (GCC)
>
> hpa@tazenda:/tmp$ cat foo.c
> int foobar;
>
> int *where_is_foobar(void)
> {
>          return &foobar;
> }
>
> hpa@tazenda:/tmp$ gcc -mcmodel=3Dkernel -O2 -c -o foo.o foo.c

Indeed, but my reply was in the context of -fpie, which guarantees RIP
relative access. IOW, the compiler will always generate sym(%rip) with
-fpie, but (obviously) can't change assembly code in the kernel when
the PIE is requested.

Otherwise, MOV $immediate, %reg is faster when PIE is not required,
which is the case with -mcmodel=3Dkernel. IIRC, LEA with %rip had some
performance issues, which may not be the case anymore with newer
processors.

Due to the non-negligible impact of PIE, perhaps some kind of
CONFIG_PIE config definition should be introduced, so the assembly
code would be able to choose optimal asm sequence when PIE and non-PIE
is requested?

Uros.

