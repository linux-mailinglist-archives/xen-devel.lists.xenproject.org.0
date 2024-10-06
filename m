Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09BAD991D19
	for <lists+xen-devel@lfdr.de>; Sun,  6 Oct 2024 10:07:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.811164.1223801 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxMHt-0003hx-NE; Sun, 06 Oct 2024 08:06:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 811164.1223801; Sun, 06 Oct 2024 08:06:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxMHt-0003em-KO; Sun, 06 Oct 2024 08:06:45 +0000
Received: by outflank-mailman (input) for mailman id 811164;
 Sun, 06 Oct 2024 08:06:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7wyB=RC=gmail.com=ubizjak@srs-se1.protection.inumbo.net>)
 id 1sxMHr-0003eg-Rk
 for xen-devel@lists.xenproject.org; Sun, 06 Oct 2024 08:06:43 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eb799611-83b9-11ef-99a2-01e77a169b0f;
 Sun, 06 Oct 2024 10:06:41 +0200 (CEST)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2fad100dd9eso34906671fa.3
 for <xen-devel@lists.xenproject.org>; Sun, 06 Oct 2024 01:06:41 -0700 (PDT)
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
X-Inumbo-ID: eb799611-83b9-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728202001; x=1728806801; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=puHS7d7azwqNXLt828Ye1D2ZDeZMXjrh1xk6a66e+BY=;
        b=VsOIBDs63fgOf3NArO44UUxjFuy9LC0QnsZ/drNkqXAD0Kn4NGlwiMt/Xv27f/1Ukq
         4WRbmbQ6E5a/6ktip+W4rLv678Ywdj9QGKjJYB7lZO1jQ2+DgMLMVlILV2LRxxOQt/el
         2GPodpITqGPdlzY5qtZM6wDXHHXDwnLsnH6yrH1OAQeWFfdb7GB+eamNeSUDbilURAFh
         hatf1LdxI/KtPTwvpnhgS7rhJihsMbPB7jPMzMzs5m3Q/tlocOPFfVbqDInGoWIzrttL
         W1lA0NtmxdtAiFkMsMnc7UPvBn+ryeUo2/fcxu6lrt/L7ai4zPCYKoJpn2aCwJgOwcBv
         t4Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728202001; x=1728806801;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=puHS7d7azwqNXLt828Ye1D2ZDeZMXjrh1xk6a66e+BY=;
        b=aECxf+k9C9RyYxKc4KwxV/XyY7QnZc53TOU8TOmpjEe4ceZEbvlBokC4vX5SyWb8MN
         63MEZtTL2/HkDxGAhq9ps4cZf5L5mmElBdlFL63iE4d7X9P/Om5eJj+lGLqy69Ysl2Ps
         Y+5xhAfaZ48Bdx4unT/mINHy3jzGaBMHgwEs8rIe4vS//dsIdd5wMUVEsO2RdIFGpA5L
         V9fml40zbdeq0jXEJxMREGQUWcaoogKN/BVjvRgct7MZZ3/489JQ0ktpg846ZFb8AK9P
         YlFpIzKgCUBUCB2mnQl1KuktiRQF38wOJFYdtCjZs4f7aWP1godSooO/GKhffpCRZ63i
         C6UQ==
X-Forwarded-Encrypted: i=1; AJvYcCXOpIqORPcvMKAFwp/fB+JlZ+AU09bFk2V2wv6lJ04ZnQ8oWaM/76Cutb8lXn9Jj3DkJ0uD1YemM2g=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzzSUH38XD3ih1hZK7QKNNw7Z/Ih/oX+hRSyg+druGg7Qys56RN
	tglXH5+wF+rE8FRiN9eRNtnj4xF5PFdyOqwrcZmj3sqJ84mjQtduH9LOOgs0bkLWOU1a6FYX8z6
	7nsOHAGZ1JPAuzVFcdIoOG8Mn9P8=
X-Google-Smtp-Source: AGHT+IGS61n/I1TuC+MWyJZpRj63R+p8y0BprOkKwk0SOVREtUnFaMblR5HhGoJzVJpp1ktZzeiYw7JUqStdLpYUPwI=
X-Received: by 2002:a2e:bc0e:0:b0:2fa:cc50:41b with SMTP id
 38308e7fff4ca-2faf3c508ffmr41878031fa.5.1728202000783; Sun, 06 Oct 2024
 01:06:40 -0700 (PDT)
MIME-Version: 1.0
References: <20240925150059.3955569-30-ardb+git@google.com>
 <20240925150059.3955569-55-ardb+git@google.com> <99446363-152f-43a8-8b74-26f0d883a364@zytor.com>
 <CAMj1kXG7ZELM8D7Ft3H+dD5BHqENjY9eQ9kzsq2FzTgP5+2W3A@mail.gmail.com>
 <CAHk-=wj0HG2M1JgoN-zdCwFSW=N7j5iMB0RR90aftTS3oqwKTg@mail.gmail.com>
 <CAMj1kXEU5RU0i11zqD0433_LMMyNQH2gCoSkU7GeXmaRXGF1Yw@mail.gmail.com>
 <5c7490bb-aa74-427b-849e-c28c343b7409@zytor.com> <CAFULd4Yj9LfTnWFu=c1M7Eh44+XFk0ibwL57r5H7wZjvKZ8yaA@mail.gmail.com>
 <3bbb85ae-8ba5-4777-999f-d20705c386e7@zytor.com> <CAHk-=wgkgnyW2V4gQQTDAOKXGZH0fqN=hApz1LFAE3OC3fhhrQ@mail.gmail.com>
In-Reply-To: <CAHk-=wgkgnyW2V4gQQTDAOKXGZH0fqN=hApz1LFAE3OC3fhhrQ@mail.gmail.com>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Sun, 6 Oct 2024 10:06:33 +0200
Message-ID: <CAFULd4ZZxrJvJ9gF5tC-m-tmcDMvVM3te4xc7vnbF_OFU0D2=A@mail.gmail.com>
Subject: Re: [RFC PATCH 25/28] x86: Use PIE codegen for the core kernel
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "H. Peter Anvin" <hpa@zytor.com>, Ard Biesheuvel <ardb@kernel.org>, Ard Biesheuvel <ardb+git@google.com>, 
	linux-kernel@vger.kernel.org, x86@kernel.org, 
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

On Sun, Oct 6, 2024 at 2:00=E2=80=AFAM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Sat, 5 Oct 2024 at 16:37, H. Peter Anvin <hpa@zytor.com> wrote:
> >
> > Sadly, that is not correct; neither gcc nor clang uses lea:
>
> Looking around, this may be intentional. At least according to Agner,
> several cores do better at "mov immediate" compared to "lea".
>
> Eg a RIP-relative LEA on Zen 2 gets a throughput of two per cycle, but
> a "MOV r,i" gets four. That got fixed in Zen 3 and later, but
> apparently Intel had similar issues (Ivy Bridge: 1 LEA per cycle, vs 3
> "mov i,r". Haswell is 1:4).

Yes, this is the case. I just missed your reply when replying to
Peter's mail with a not so precise answer.

Uros.

