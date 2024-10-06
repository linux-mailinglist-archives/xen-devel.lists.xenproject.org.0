Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 700EA9920A5
	for <lists+xen-devel@lfdr.de>; Sun,  6 Oct 2024 21:19:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.811294.1223849 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxWlQ-0002CJ-K1; Sun, 06 Oct 2024 19:17:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 811294.1223849; Sun, 06 Oct 2024 19:17:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxWlQ-0002AH-HD; Sun, 06 Oct 2024 19:17:56 +0000
Received: by outflank-mailman (input) for mailman id 811294;
 Sun, 06 Oct 2024 19:17:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7wyB=RC=gmail.com=ubizjak@srs-se1.protection.inumbo.net>)
 id 1sxWlP-0002AB-J4
 for xen-devel@lists.xenproject.org; Sun, 06 Oct 2024 19:17:55 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id af448144-8417-11ef-a0bb-8be0dac302b0;
 Sun, 06 Oct 2024 21:17:53 +0200 (CEST)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2facf48166bso42281781fa.0
 for <xen-devel@lists.xenproject.org>; Sun, 06 Oct 2024 12:17:53 -0700 (PDT)
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
X-Inumbo-ID: af448144-8417-11ef-a0bb-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728242272; x=1728847072; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tbSrHUSflgwuD4ZHPRPJ5BZRTLC2CQwiCglTSKbl7rw=;
        b=D3fxEFQaMa6n6zAI54SOB2anTT7PFJ/ivwwstMcvAocJm0KvHVIxKyTFi5y+RIA++o
         SxSltO60/fXzdG0LQyiskbyrNUYjTOQoj6ErKu1N3qChOZBBwj8ER3ZcEqTO9OO6rCRr
         FeifmsumjJLs73oyzClLLeeNqL9Qj3AQVcUugB4HuwRWHCjYkzrY2veRToPpIHM1EY1Q
         Pxa6L+v7B3/oD6lv4ZcTTxmpFbYY7qAk/UlW+crZaJiPr8RLaIt3XqkLEykW8o8mAXtC
         FXsWMbO9UFlDgnY1fiA+l8gr39KygW0DQUQo+ZdyFF45NZAOWJJQOJrIIYHAQGkAUfqK
         E1TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728242272; x=1728847072;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tbSrHUSflgwuD4ZHPRPJ5BZRTLC2CQwiCglTSKbl7rw=;
        b=dYNStQWEZyBxLePLZM14PSE4uKbmuFw18exn/8UA8A3q9DcUzP/Z+OcPChijlfGZgQ
         +C7hV2CpGAFsb0yRsPhw5iTyLizNsEls7Mojf8i4Y0sp7DaqZjHsdzheR0vgKEIDmbec
         ayVkrG32b2utX2UEDOo3otkJQPoh2afnAIxc4EGUjH2ssoDdj5lYXFwYCbbNy20My/PD
         V/91HcVosz6ATxAfQnAK38ZY9iqG9f/P3OmMfP2Y0aCvOfm0bsWkppyKkcxtBj1BuUiE
         PHNomfuGCDI34PjGETnGlel7REDcV7kKD1HV2MQvuF9hpWEV5Oj5ZtvCNxP7ulW6+5Hd
         EW3w==
X-Forwarded-Encrypted: i=1; AJvYcCUWefXr3xbNVqFFRkn1+uLAUGKEHYawcuGhO67ChRCDHqXwwg0LO0srV8RxHDJbRdnBAKNedGuQe+c=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzHadSHbgAGSbNWx7UqkbGaRQNgpVNAvyL5FSv4DOjssoZtqGdC
	+QWCRipRvWLW3w0wCY+goXgmmNmEhZaxU8t12lNvJzgxIzBpEEEQnJT0KQ3ed3E75tFIUi4AeY2
	/NgmLlBG3P7E0S+FmHhlWTEFbyDs=
X-Google-Smtp-Source: AGHT+IGRTqhJhTusYfDXEbEiyI+dDRincUEm84afE7n1AFszrvf4EDsRGd1dnnPyUdXRuJKezOE3wzgwR0sUUmJI06c=
X-Received: by 2002:a05:651c:548:b0:2fa:cdd1:4f16 with SMTP id
 38308e7fff4ca-2faf3c150bdmr36366491fa.14.1728242272173; Sun, 06 Oct 2024
 12:17:52 -0700 (PDT)
MIME-Version: 1.0
References: <20240925150059.3955569-30-ardb+git@google.com>
 <20240925150059.3955569-55-ardb+git@google.com> <99446363-152f-43a8-8b74-26f0d883a364@zytor.com>
 <CAMj1kXG7ZELM8D7Ft3H+dD5BHqENjY9eQ9kzsq2FzTgP5+2W3A@mail.gmail.com>
 <CAHk-=wj0HG2M1JgoN-zdCwFSW=N7j5iMB0RR90aftTS3oqwKTg@mail.gmail.com>
 <CAMj1kXEU5RU0i11zqD0433_LMMyNQH2gCoSkU7GeXmaRXGF1Yw@mail.gmail.com>
 <5c7490bb-aa74-427b-849e-c28c343b7409@zytor.com> <CAFULd4Yj9LfTnWFu=c1M7Eh44+XFk0ibwL57r5H7wZjvKZ8yaA@mail.gmail.com>
 <3bbb85ae-8ba5-4777-999f-d20705c386e7@zytor.com> <CAFULd4b==a7H0zdGVfABntL0efrS-F3eeHGu-63oyz1eh1DwXQ@mail.gmail.com>
 <bfa1a86c3e4348159049e8277e9859dd@AcuMS.aculab.com>
In-Reply-To: <bfa1a86c3e4348159049e8277e9859dd@AcuMS.aculab.com>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Sun, 6 Oct 2024 21:17:40 +0200
Message-ID: <CAFULd4awNUm8MpZQ6XhPTRs6+2ZLtfnr=6vkK5DrY9L2rGR-5w@mail.gmail.com>
Subject: Re: [RFC PATCH 25/28] x86: Use PIE codegen for the core kernel
To: David Laight <David.Laight@aculab.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Ard Biesheuvel <ardb+git@google.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, 
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
	Kan Liang <kan.liang@linux.intel.com>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	"linux-efi@vger.kernel.org" <linux-efi@vger.kernel.org>, 
	"linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>, 
	"linux-sparse@vger.kernel.org" <linux-sparse@vger.kernel.org>, 
	"linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, 
	"linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>, 
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>, 
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 6, 2024 at 8:01=E2=80=AFPM David Laight <David.Laight@aculab.co=
m> wrote:
>
> ...
> > Due to the non-negligible impact of PIE, perhaps some kind of
> > CONFIG_PIE config definition should be introduced, so the assembly
> > code would be able to choose optimal asm sequence when PIE and non-PIE
> > is requested?
>
> I wouldn't have thought that performance mattered in the asm code
> that runs during startup?

No, not the code that runs only once, where performance impact can be toler=
ated.

This one:

https://lore.kernel.org/lkml/20240925150059.3955569-44-ardb+git@google.com/

Uros.

