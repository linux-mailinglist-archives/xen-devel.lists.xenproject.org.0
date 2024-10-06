Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B981991B7C
	for <lists+xen-devel@lfdr.de>; Sun,  6 Oct 2024 02:06:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.811103.1223760 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxEn5-0002QV-5j; Sun, 06 Oct 2024 00:06:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 811103.1223760; Sun, 06 Oct 2024 00:06:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxEn5-0002OJ-1a; Sun, 06 Oct 2024 00:06:27 +0000
Received: by outflank-mailman (input) for mailman id 811103;
 Sun, 06 Oct 2024 00:06:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WT1T=RC=linuxfoundation.org=torvalds@srs-se1.protection.inumbo.net>)
 id 1sxEn3-0002Jj-8g
 for xen-devel@lists.xenproject.org; Sun, 06 Oct 2024 00:06:25 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d2d12c67-8376-11ef-a0bb-8be0dac302b0;
 Sun, 06 Oct 2024 02:06:24 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5c882864d3aso3569309a12.2
 for <xen-devel@lists.xenproject.org>; Sat, 05 Oct 2024 17:06:24 -0700 (PDT)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com.
 [209.85.208.52]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c8e0598abdsm1497079a12.3.2024.10.05.17.06.21
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Oct 2024 17:06:22 -0700 (PDT)
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-5c882864d3aso3569283a12.2
 for <xen-devel@lists.xenproject.org>; Sat, 05 Oct 2024 17:06:21 -0700 (PDT)
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
X-Inumbo-ID: d2d12c67-8376-11ef-a0bb-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1728173183; x=1728777983; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zwWtZnU6O3CUnR/7Ge8+NpuQOrJwSLSqT8+8zcDG8JI=;
        b=Jamf1JDj/llvRCSRTO441y0GpjiRQSwZlk5GCO8CUTOsM5soxSFrr2flD6OJbQcS5z
         VzOZ5B+ECAHxeZvfyDATQxQM5ua0gMj8jwUJ8n4ZJWqLEEqT6EALFKGCnRaWMU2m3big
         LSJPwhSu8+Ac6vkFh+dVH7tBnyzg624u+8iKM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728173183; x=1728777983;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zwWtZnU6O3CUnR/7Ge8+NpuQOrJwSLSqT8+8zcDG8JI=;
        b=SPU42PmQpgXuYczUcKDO9eORp8H4i9yjkh6kDNffdrJ/9e0aFMQWjeLG2GZ2lC8Qk7
         XMa6WnCE48ftMmAWTvQB2B/8JmwlOjJ0qgw2qs57Ku7eiDg7SmypnGA8grvPoEMp0imp
         eilz7hvWABJdb+csbro0ayo8S/OpyC2z14p8D30sJhVnp57dRNNw0EGWF691K9NzYECB
         2tdQruuXcPTysfk5BS8RnWCM1HFVm8UytASharnKczEQSXFaYPkUJHw0WlbCEYKZnAPm
         TB9ReT8/XobXWtn8dO2lcYZxVjl6x/JKGfgdeyDBuWBsqte0QaDJe9If8/YYLXdW3trG
         NCcA==
X-Forwarded-Encrypted: i=1; AJvYcCVe/Rp9FRUVTJN/6IZ+8/15AbRIPXThkAjJmGd6XMQKQy46NO7cukkLdNyjM731iS06wONX/YM05FM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyu7EsIDVWHYBpWNKLwS2Jlp+qytkplqF2snAwbuMa8qPGTjeQp
	OfGFb7MBCjwk1qJDVRgxlVjdSYCfu/oxFKWidZvC9Hn1XluXGs/RUKkUG9SmMKMZ2Z7u3kRGiuu
	7RIYJTA==
X-Google-Smtp-Source: AGHT+IFszf4YTb+YEh0ezdEgZNybAQ7JSJu9CfSttf4MikCby3QF8dHeLv80Fsqa4AFmNFkDTIn00w==
X-Received: by 2002:a05:6402:50d0:b0:5c3:c520:b019 with SMTP id 4fb4d7f45d1cf-5c8d2eb4d87mr5212354a12.34.1728173183163;
        Sat, 05 Oct 2024 17:06:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVSI3iTfqYGgn3imwPqRjluswSdPs0rEUoS6n21TWHBhqPitAqyF3j7FyVaEoTsWKnQDBjApHzASao=@lists.xenproject.org
X-Received: by 2002:a17:907:9693:b0:a99:3d93:c8bc with SMTP id
 a640c23a62f3a-a993d93cc22mr339286866b.13.1728172818387; Sat, 05 Oct 2024
 17:00:18 -0700 (PDT)
MIME-Version: 1.0
References: <20240925150059.3955569-30-ardb+git@google.com>
 <20240925150059.3955569-55-ardb+git@google.com> <99446363-152f-43a8-8b74-26f0d883a364@zytor.com>
 <CAMj1kXG7ZELM8D7Ft3H+dD5BHqENjY9eQ9kzsq2FzTgP5+2W3A@mail.gmail.com>
 <CAHk-=wj0HG2M1JgoN-zdCwFSW=N7j5iMB0RR90aftTS3oqwKTg@mail.gmail.com>
 <CAMj1kXEU5RU0i11zqD0433_LMMyNQH2gCoSkU7GeXmaRXGF1Yw@mail.gmail.com>
 <5c7490bb-aa74-427b-849e-c28c343b7409@zytor.com> <CAFULd4Yj9LfTnWFu=c1M7Eh44+XFk0ibwL57r5H7wZjvKZ8yaA@mail.gmail.com>
 <3bbb85ae-8ba5-4777-999f-d20705c386e7@zytor.com>
In-Reply-To: <3bbb85ae-8ba5-4777-999f-d20705c386e7@zytor.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 5 Oct 2024 17:00:01 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgkgnyW2V4gQQTDAOKXGZH0fqN=hApz1LFAE3OC3fhhrQ@mail.gmail.com>
Message-ID: <CAHk-=wgkgnyW2V4gQQTDAOKXGZH0fqN=hApz1LFAE3OC3fhhrQ@mail.gmail.com>
Subject: Re: [RFC PATCH 25/28] x86: Use PIE codegen for the core kernel
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Uros Bizjak <ubizjak@gmail.com>, Ard Biesheuvel <ardb@kernel.org>, 
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

On Sat, 5 Oct 2024 at 16:37, H. Peter Anvin <hpa@zytor.com> wrote:
>
> Sadly, that is not correct; neither gcc nor clang uses lea:

Looking around, this may be intentional. At least according to Agner,
several cores do better at "mov immediate" compared to "lea".

Eg a RIP-relative LEA on Zen 2 gets a throughput of two per cycle, but
a "MOV r,i" gets four. That got fixed in Zen 3 and later, but
apparently Intel had similar issues (Ivy Bridge: 1 LEA per cycle, vs 3
"mov i,r". Haswell is 1:4).

Of course, Agner's tables are good, but not necessarily always the
whole story. There are other instruction tables on the internet (eg
uops.info) with possibly more info.

And in reality, I would expect it to be a complete non-issue with any
OoO engine and real code, because you are very seldom ALU limited
particularly when there aren't any data dependencies.

But a RIP-relative LEA does seem to put a *bit* more pressure on the
core resources, so the compilers are may be right to pick a "mov".

               Linus

