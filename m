Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3924991558
	for <lists+xen-devel@lfdr.de>; Sat,  5 Oct 2024 10:32:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.810826.1223574 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sx0Cd-0002kh-8O; Sat, 05 Oct 2024 08:31:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 810826.1223574; Sat, 05 Oct 2024 08:31:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sx0Cd-0002id-54; Sat, 05 Oct 2024 08:31:51 +0000
Received: by outflank-mailman (input) for mailman id 810826;
 Sat, 05 Oct 2024 08:31:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=E/Lu=RB=gmail.com=ubizjak@srs-se1.protection.inumbo.net>)
 id 1sx0Cb-0002iX-Dj
 for xen-devel@lists.xenproject.org; Sat, 05 Oct 2024 08:31:49 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4272f4d8-82f4-11ef-99a2-01e77a169b0f;
 Sat, 05 Oct 2024 10:31:47 +0200 (CEST)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2fadb636abaso29357331fa.3
 for <xen-devel@lists.xenproject.org>; Sat, 05 Oct 2024 01:31:47 -0700 (PDT)
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
X-Inumbo-ID: 4272f4d8-82f4-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728117106; x=1728721906; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=70cU5jNP52zmkSWZHO+lBdHOcE1V/JTH2eNm2kkh0zg=;
        b=khDTdkjarS7eBKPre7SsYFsxHF6beh4Cut6vNM8Qle4lGW+ZIPsAj4OHm+MhAQWnbo
         pDUfcfFSftmA8DyQ03NZG1y5pdglkZe/vBIRIdhmcYjaTTOBgLJLdGhBeWPL87J/kVfF
         +E6z+4Ck0VWNuOeAp9rTmAuLlTdHG2AVe1rIa7ybyDBvwFlgCUhnV9e08F3wac2AQ8o+
         yVlHGPHfX2Ij/VDZZ8PEiBNjun5R1NyNIKDoBAYQoYR63RKYu4jxq4E9MgzIJFQ5gCN5
         2bsu3PJ89MBjcXLdG/HupqJaanQB1wiWBU7jngYKiw0ydTJoDkGhsiUAi1ilD0k/WEl0
         7S2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728117106; x=1728721906;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=70cU5jNP52zmkSWZHO+lBdHOcE1V/JTH2eNm2kkh0zg=;
        b=vhtTRGeBI0//4Ntg7lNaxuPfkNVCdob6AUlCLZ65hmKkk3g87jWuLuGNtiUjM/li0T
         gmWOSNPOY1Waqx9GNLbgGR8C3Qtd3RlHRZJWAhTYJo1SD9qxBU+RTb2GdUN+VS97m+Ay
         BwHJHhXKHK4+LKSOJ7gbdW4H2brPOu8mnOiLHe8+dxN2OWJzi/wPGFFCT9lPT1qzy6ev
         xHBqyuH4oc5WsK1/6k1GebbhtePmD7dXODnqKX0GUdW2ofC/HEK7Yb5GsznivEE3Gys1
         H/zP7yliIQGohGy91lydZfqmy9vH4k69gxmKRZlNlBgSrqpUSLvk46qeEuY86Uvvpln/
         3nUQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0WvYqNMCX2zauog0bGLhxd6YEo5xd4Hx+3i0ailLDRRqsv8gTedBHuxS6Ok7NIaWQjXhY2Z0NCZY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzSj4prfpkJW/ru+s13KbrjmRzuMpWg9YLxRFh6AqwZLSAL/1KS
	ftdfMSJMJWs70nstcRVh/PXp092nZSX8BREhpEl7i0kxKM9AyF7IzXGqPX0jolKAYYpJoUfuYUV
	IO5DMFamb2KBzJRPm2Xt7FEcnyi8=
X-Google-Smtp-Source: AGHT+IGi0j/icjLt8RhHlOdJvbjdouTPFKKMu/CT/oe6l0e9sNaP3mHWfqnG22Q9j4GVb6Cdm+e2KfCpXo/Kl8KNmek=
X-Received: by 2002:a05:651c:1547:b0:2fa:d978:a6c4 with SMTP id
 38308e7fff4ca-2faf3d73888mr22769461fa.30.1728117106123; Sat, 05 Oct 2024
 01:31:46 -0700 (PDT)
MIME-Version: 1.0
References: <20240925150059.3955569-30-ardb+git@google.com>
 <20240925150059.3955569-55-ardb+git@google.com> <99446363-152f-43a8-8b74-26f0d883a364@zytor.com>
 <CAMj1kXG7ZELM8D7Ft3H+dD5BHqENjY9eQ9kzsq2FzTgP5+2W3A@mail.gmail.com>
 <CAHk-=wj0HG2M1JgoN-zdCwFSW=N7j5iMB0RR90aftTS3oqwKTg@mail.gmail.com>
 <CAMj1kXEU5RU0i11zqD0433_LMMyNQH2gCoSkU7GeXmaRXGF1Yw@mail.gmail.com> <5c7490bb-aa74-427b-849e-c28c343b7409@zytor.com>
In-Reply-To: <5c7490bb-aa74-427b-849e-c28c343b7409@zytor.com>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Sat, 5 Oct 2024 10:31:37 +0200
Message-ID: <CAFULd4Yj9LfTnWFu=c1M7Eh44+XFk0ibwL57r5H7wZjvKZ8yaA@mail.gmail.com>
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

On Fri, Oct 4, 2024 at 11:06=E2=80=AFPM H. Peter Anvin <hpa@zytor.com> wrot=
e:
>
> On 10/3/24 04:13, Ard Biesheuvel wrote:
> >
> >> That said, doing changes like changing "mov $sym" to "lea sym(%rip)" I
> >> feel are a complete no-brainer and should be done regardless of any
> >> other code generation issues.
> >
> > Yes, this is the primary reason I ended up looking into this in the
> > first place. Earlier this year, we ended up having to introduce
> > RIP_REL_REF() to emit those RIP-relative references explicitly, in
> > order to prevent the C code that is called via the early 1:1 mapping
> > from exploding. The amount of C code called in that manner has been
> > growing steadily over time with the introduction of 5-level paging and
> > SEV-SNP and TDX support, which need to play all kinds of tricks before
> > the normal kernel mappings are created.
> >
>
> movq $sym to leaq sym(%rip) which you said ought to be smaller (and in
> reality appears to be the same size, 7 bytes) seems like a no-brainer
> and can be treated as a code quality issue -- in other words, file bug
> reports against gcc and clang.

It is the kernel assembly source that should be converted to
rip-relative form, gcc (and probably clang) have nothing with it.

Uros.

