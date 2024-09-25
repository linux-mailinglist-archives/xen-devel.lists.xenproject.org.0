Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 685A898651F
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 18:45:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.804417.1215400 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stV8k-0002js-FQ; Wed, 25 Sep 2024 16:45:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 804417.1215400; Wed, 25 Sep 2024 16:45:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stV8k-0002ho-CB; Wed, 25 Sep 2024 16:45:22 +0000
Received: by outflank-mailman (input) for mailman id 804417;
 Wed, 25 Sep 2024 16:45:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xqd3=QX=kernel.org=ardb@srs-se1.protection.inumbo.net>)
 id 1stV8j-0002hQ-Mi
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2024 16:45:21 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8cd5535d-7b5d-11ef-a0ba-8be0dac302b0;
 Wed, 25 Sep 2024 18:45:20 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1E8D25C5AA6
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2024 16:45:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2820C4CED2
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2024 16:45:18 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-2f75de9a503so483141fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2024 09:45:18 -0700 (PDT)
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
X-Inumbo-ID: 8cd5535d-7b5d-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727282718;
	bh=qgOwvX93MJaNEr7OQzS/TNQMPiUPOBpt0ph4xzwCx1w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=onMHF/g0D43HW6aMXQhcIu1A27RFbkhoDeVTu1IsE3Dr45prf9Gt/b9XTbLxkLRdc
	 tp+sKb+2tVL2RKsH7zt7pedqKxbxASz7T6hHTvkigsDpqXaREORqbOHeHr1WNosC80
	 8oqjuX47b/9IC6c9ciSn6WciiPIOmDd4sLFsDQ49EcS7F2y6hlJlFootPDIZyx6tV1
	 nZWbOIv6XsJEj83cV3qJkPJFVqvvPhr7TNk6o6VoBEYUa0GNLZHRv55RTy27voXKfL
	 S1kfkqExZO+yREPbbJkOthV308A1sBbwWyv5+7Rufb9Ltpojr4m1MeoarzGHGNAwS0
	 hJW9ST3pclReg==
X-Forwarded-Encrypted: i=1; AJvYcCUNQbDzwNLtqYNq2yZV1xE4HvC6nkxzSo/yY9Y/bZDF84qP8v0t0NdZjxXR3b5vwErZdmwrwYHm3wE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz9OIDeEAXa0ODvQoeudH4MlrC+xO0XQ+0s1e+Y1b3ZQyBpEMpu
	a7VWYAvb/WfofgIMBtaOUNdMwiSy0Q8CBhZeMnitxKiJb0KH3v1mSJulN/KGFFm+QQjOGC5dgdG
	nlecVX5+0EKyv13eidBbT+p052Zc=
X-Google-Smtp-Source: AGHT+IHztXYzAiMagygAhzDxKwnY8wOFDul9cLbEROanbEnmGDGU1AJFUfvHaHhmJ6jyIhgnmNtdOygZ3lKoSkpCLq0=
X-Received: by 2002:a2e:702:0:b0:2ef:20ae:d113 with SMTP id
 38308e7fff4ca-2f91ca64507mr16954501fa.40.1727282716715; Wed, 25 Sep 2024
 09:45:16 -0700 (PDT)
MIME-Version: 1.0
References: <20240925150059.3955569-30-ardb+git@google.com>
 <20240925150059.3955569-44-ardb+git@google.com> <CAHk-=wiLYCoGSnqqPq+7fHWgmyf5DpO4SLDJ4kF=EGZVVZOX4A@mail.gmail.com>
In-Reply-To: <CAHk-=wiLYCoGSnqqPq+7fHWgmyf5DpO4SLDJ4kF=EGZVVZOX4A@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 25 Sep 2024 18:45:05 +0200
X-Gmail-Original-Message-ID: <CAMj1kXH1xqYwhG16XxoBpoedTkBvt72xBjO259174jHirdf47A@mail.gmail.com>
Message-ID: <CAMj1kXH1xqYwhG16XxoBpoedTkBvt72xBjO259174jHirdf47A@mail.gmail.com>
Subject: Re: [RFC PATCH 14/28] x86/rethook: Use RIP-relative reference for
 return address
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org, x86@kernel.org, 
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

On Wed, 25 Sept 2024 at 18:39, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Wed, 25 Sept 2024 at 08:16, Ard Biesheuvel <ardb+git@google.com> wrote:
> >
> > Instead of pushing an immediate absolute address, which is incompatible
> > with PIE codegen or linking, use a LEA instruction to take the address
> > into a register.
>
> I don't think you can do this - it corrupts %rdi.
>
> Yes, the code uses  %rdi later, but that's inside the SAVE_REGS_STRING
> / RESTORE_REGS_STRING area.
>

Oops, I missed that.

> And we do have special calling conventions that aren't the regular
> ones, so %rdi might actually be used elsewhere. For example,
> __get_user_X and __put_user_X all have magical calling conventions:
> they don't actually use %rdi, but part of the calling convention is
> that the unused registers aren't modified.
>
> Of course, I'm not actually sure you can probe those and trigger this
> issue, but it all makes me think it's broken.
>
> And it's entirely possible that I'm wrong for some reason, but this
> just _looks_ very very wrong to me.
>
> I think you can do this with a "pushq mem" instead, and put the
> relocation into the memory location.
>

I'll change this into

  pushq arch_rethook_trampoline@GOTPCREL(%rip)

which I had originally. I was trying to avoid the load from memory,
but that obviously only works if the register is not live.

