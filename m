Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 608F99864F6
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 18:40:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.804406.1215380 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stV3P-0007We-J7; Wed, 25 Sep 2024 16:39:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 804406.1215380; Wed, 25 Sep 2024 16:39:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stV3P-0007U9-G1; Wed, 25 Sep 2024 16:39:51 +0000
Received: by outflank-mailman (input) for mailman id 804406;
 Wed, 25 Sep 2024 16:39:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nrVF=QX=linuxfoundation.org=torvalds@srs-se1.protection.inumbo.net>)
 id 1stV3N-0007Sk-RG
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2024 16:39:49 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c7574e9c-7b5c-11ef-a0ba-8be0dac302b0;
 Wed, 25 Sep 2024 18:39:48 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a8d100e9ce0so4148666b.2
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2024 09:39:48 -0700 (PDT)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com.
 [209.85.218.49]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93930c8a98sm229864866b.124.2024.09.25.09.39.43
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Sep 2024 09:39:44 -0700 (PDT)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-a8d29b7edc2so6339066b.1
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2024 09:39:43 -0700 (PDT)
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
X-Inumbo-ID: c7574e9c-7b5c-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1727282388; x=1727887188; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nj8+qG2S/Bk0hHBrSluJoVQqRkgSfLVqxLrwhmmQqfQ=;
        b=Vw0aJLzbvWFrwt8/RL9T4XanlLVkzgcgMGNvov/sSIE1O8AbeyWuiJQiiLIK4LMrpj
         bxfdkWXmacUiZPDATYVstOx8ufN1RDvxjHvbN8tbK4TtBzZUCXOofmULy0i3EIprZucx
         Su1M7ttc5VWEwiQ16WyOIcgIJqi9GzNxRvaAg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727282388; x=1727887188;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nj8+qG2S/Bk0hHBrSluJoVQqRkgSfLVqxLrwhmmQqfQ=;
        b=ddH9p77+ALNy+JKscOFbK+0Vyp2HMHSza+JnJOf3lkaufgNGO/Xk9Y/6oit7x85o8G
         ncZWXBo3v9uhvTODAWWn/7xgP0ZI7URRcS1lJjd3qZ8iOxN0nDEQ6NkBb6cIjGjyf+X/
         xCiGSONX+K8NOI6ZTftyGSEBWDhgVyBu2NW01eCpaFu1T2dHLcl/omJT1pOvakrdwV3g
         Vsh0dwuXgNlr535EjE9aftJv+TiS4qtmrlS5C9C+K7dLu7FXwNI9iaa7Rz+wglT0ihpy
         5a86wPIpijr4FAjnrocrm0ThZr9U342/wrPzIB2ifPg6uKMHT4z0TnXZJn+F2w+2THOf
         gkwg==
X-Forwarded-Encrypted: i=1; AJvYcCVlR5mOoP3TVjyPpecMh8u36jRoWNlfLI85GuQEa0hijVvcknMCi+BsWoSN8eMfOpJluYdFZOP//QE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxBgV+1rogPZ9GgG9ckYnMFfGmklJ9bOOZlexbIx5IjkJvdv1Az
	PD2dGpF6Gw8HwNqZqdknIblqRtdn65t0S+l0JFsiKPtwXBtbQlJRsnoGYQLxIyeawYp9vl6OI9y
	iUFVodg==
X-Google-Smtp-Source: AGHT+IF5D1xI1AMGa8sZA7Oi7w9dBn85aPd017wWQWf94sdmxgB2lp7XkaK9qwP74E8jOPg2Z+TKtw==
X-Received: by 2002:a17:907:e220:b0:a90:df6f:f087 with SMTP id a640c23a62f3a-a93a05f0d5dmr270646166b.47.1727282387707;
        Wed, 25 Sep 2024 09:39:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWdu/gdPUmw4orPoJW2w2vCTEWx6ls3sm1LpKIStgvIldq3CnlkAsgZldYMhHDfrVu/5d/2xsyn+Nc=@lists.xenproject.org
X-Received: by 2002:a17:906:f5a9:b0:a86:9d39:a2a with SMTP id
 a640c23a62f3a-a93a0330c37mr309689066b.8.1727282382886; Wed, 25 Sep 2024
 09:39:42 -0700 (PDT)
MIME-Version: 1.0
References: <20240925150059.3955569-30-ardb+git@google.com> <20240925150059.3955569-44-ardb+git@google.com>
In-Reply-To: <20240925150059.3955569-44-ardb+git@google.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 25 Sep 2024 09:39:23 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiLYCoGSnqqPq+7fHWgmyf5DpO4SLDJ4kF=EGZVVZOX4A@mail.gmail.com>
Message-ID: <CAHk-=wiLYCoGSnqqPq+7fHWgmyf5DpO4SLDJ4kF=EGZVVZOX4A@mail.gmail.com>
Subject: Re: [RFC PATCH 14/28] x86/rethook: Use RIP-relative reference for
 return address
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
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

On Wed, 25 Sept 2024 at 08:16, Ard Biesheuvel <ardb+git@google.com> wrote:
>
> Instead of pushing an immediate absolute address, which is incompatible
> with PIE codegen or linking, use a LEA instruction to take the address
> into a register.

I don't think you can do this - it corrupts %rdi.

Yes, the code uses  %rdi later, but that's inside the SAVE_REGS_STRING
/ RESTORE_REGS_STRING area.

And we do have special calling conventions that aren't the regular
ones, so %rdi might actually be used elsewhere. For example,
__get_user_X and __put_user_X all have magical calling conventions:
they don't actually use %rdi, but part of the calling convention is
that the unused registers aren't modified.

Of course, I'm not actually sure you can probe those and trigger this
issue, but it all makes me think it's broken.

And it's entirely possible that I'm wrong for some reason, but this
just _looks_ very very wrong to me.

I think you can do this with a "pushq mem" instead, and put the
relocation into the memory location.

                 Linus

