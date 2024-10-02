Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 700DD98E3DF
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2024 22:03:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.809006.1221109 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sw5YB-00064X-9U; Wed, 02 Oct 2024 20:02:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 809006.1221109; Wed, 02 Oct 2024 20:02:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sw5YB-00062g-6d; Wed, 02 Oct 2024 20:02:19 +0000
Received: by outflank-mailman (input) for mailman id 809006;
 Wed, 02 Oct 2024 20:02:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N+S4=Q6=linuxfoundation.org=torvalds@srs-se1.protection.inumbo.net>)
 id 1sw5Y9-00062a-Bx
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2024 20:02:17 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3865613a-80f9-11ef-a0ba-8be0dac302b0;
 Wed, 02 Oct 2024 22:02:15 +0200 (CEST)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-53992157528so162081e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 02 Oct 2024 13:02:15 -0700 (PDT)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com.
 [209.85.167.47]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5389fd5f5d1sm1983619e87.114.2024.10.02.13.02.09
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Oct 2024 13:02:13 -0700 (PDT)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-53992157528so161959e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 02 Oct 2024 13:02:09 -0700 (PDT)
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
X-Inumbo-ID: 3865613a-80f9-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1727899335; x=1728504135; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=felyUMZ1epn3qYN0qQZjWDzIrXK7nsXRUmOCiXehfgQ=;
        b=XF9zsgj6bnmeQOuIr7l9cEdtTeQSeSCQPzDqt/+6feU4tl9Nv3nmcmwakZNfD2H0w2
         OMEru+LK545dmNFz7Y3xFBukxtq5po+Vkp91ukjbnm7Mpm3W2m7FYYiPF38REa7CpmSD
         g9TN1Gj4dl6W4cCujwZ9EKzM1Rzz6LybiQJDA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727899335; x=1728504135;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=felyUMZ1epn3qYN0qQZjWDzIrXK7nsXRUmOCiXehfgQ=;
        b=aRkKelNPfzp6btusntzmX21Oyn81/EB4RCQ8U4ySo9d++idIYf3rKO/xfgJfi2t1b0
         CQAvG1qfHwVP9MD6qV4X8bv/KB6FQk3Jkoe5w6HnAeSLqWD5/BBWxxpGnI3mWF8kG0tS
         ftWGIll6PHu6/luRBi/osZVTIWkN0yQcgzZ6Yakgvm1YbuKlyuW1gJSZHUkF3tuzCFLD
         uLAtO5pJKACXA1EKl5IdIVeWy73wQbdYMv09GpNK1EB7RTEI8E7bOeN5sMHzR1mkONUE
         cGp7NjVWI9PQxSo3kwGmNHrT60dUcZWvJQKA5T5sTrJ8r4OmXpEzt7ClJbqyI3WKzuQ+
         VzQA==
X-Forwarded-Encrypted: i=1; AJvYcCUTbtBtYjT2srNDhhFO5RQ25vcRYN1uiU3fgHmhfdkKZMUrbmD5VNnBqWyV2lyDfFFI71DC+tzoQ7M=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw0RessRlkrXRnbllRh4o32TJQQ2dVyY8U08GAqblPI/j3iAZ6j
	pg5AY7jxWz1oENaruYAfriMINDR98r4l6J9MPhVvTnNWrdF7qyY6cl9N1UPcDqQdzf2dmfH2O8x
	QP9evxQ==
X-Google-Smtp-Source: AGHT+IGwHDPxC44I1CDtJXRhcNBt7uLVO4GK31CwAvVdJyhqnKNqz/17Gxetu8NkTQEpYBPUTqccBA==
X-Received: by 2002:a05:6512:31cd:b0:533:4676:c21c with SMTP id 2adb3069b0e04-539a079f587mr2834173e87.44.1727899334641;
        Wed, 02 Oct 2024 13:02:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXLDA8jnqNqmfbJkxAO5MCbO59uSypho9Mhddhh7gDWudJp8OrYcl2UD7z+o6oi8D9ZMfUdB4HVhG8=@lists.xenproject.org
X-Received: by 2002:a05:6512:e9e:b0:535:6795:301a with SMTP id
 2adb3069b0e04-539a079eb59mr2506573e87.47.1727899328912; Wed, 02 Oct 2024
 13:02:08 -0700 (PDT)
MIME-Version: 1.0
References: <20240925150059.3955569-30-ardb+git@google.com>
 <20240925150059.3955569-55-ardb+git@google.com> <99446363-152f-43a8-8b74-26f0d883a364@zytor.com>
 <CAMj1kXG7ZELM8D7Ft3H+dD5BHqENjY9eQ9kzsq2FzTgP5+2W3A@mail.gmail.com>
In-Reply-To: <CAMj1kXG7ZELM8D7Ft3H+dD5BHqENjY9eQ9kzsq2FzTgP5+2W3A@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 2 Oct 2024 13:01:52 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj0HG2M1JgoN-zdCwFSW=N7j5iMB0RR90aftTS3oqwKTg@mail.gmail.com>
Message-ID: <CAHk-=wj0HG2M1JgoN-zdCwFSW=N7j5iMB0RR90aftTS3oqwKTg@mail.gmail.com>
Subject: Re: [RFC PATCH 25/28] x86: Use PIE codegen for the core kernel
To: Ard Biesheuvel <ardb@kernel.org>
Cc: "H. Peter Anvin" <hpa@zytor.com>, Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org, 
	x86@kernel.org, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Uros Bizjak <ubizjak@gmail.com>, Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, 
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

On Wed, 2 Oct 2024 at 08:31, Ard Biesheuvel <ardb@kernel.org> wrote:
>
> I guess you are referring to the use of a GOT? That is a valid
> concern, but it does not apply here. With hidden visibility and
> compiler command line options like -mdirect-access-extern, all emitted
> symbol references are direct.

I absolutely hate GOT entries. We definitely shouldn't ever do
anything that causes them on x86-64.

I'd much rather just do boot-time relocation, and I don't think the
"we run code at a different location than we told the linker" is an
arghument against it.

Please, let's make sure we never have any of the global offset table horror.

Yes, yes, you can't avoid them on other architectures.

That said, doing changes like changing "mov $sym" to "lea sym(%rip)" I
feel are a complete no-brainer and should be done regardless of any
other code generation issues.

Let's not do relocation for no good reason.

             Linus

