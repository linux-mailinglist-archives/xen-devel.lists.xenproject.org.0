Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2264599006E
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2024 12:02:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.810256.1222949 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swf8E-00084N-K7; Fri, 04 Oct 2024 10:01:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 810256.1222949; Fri, 04 Oct 2024 10:01:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swf8E-00082u-HV; Fri, 04 Oct 2024 10:01:54 +0000
Received: by outflank-mailman (input) for mailman id 810256;
 Fri, 04 Oct 2024 10:01:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6mAw=RA=gmail.com=ubizjak@srs-se1.protection.inumbo.net>)
 id 1swf8D-00082o-GE
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2024 10:01:53 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ad8586ac-8237-11ef-a0bb-8be0dac302b0;
 Fri, 04 Oct 2024 12:01:51 +0200 (CEST)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2fac47f0b1aso24491561fa.1
 for <xen-devel@lists.xenproject.org>; Fri, 04 Oct 2024 03:01:51 -0700 (PDT)
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
X-Inumbo-ID: ad8586ac-8237-11ef-a0bb-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728036111; x=1728640911; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cieeCIQbn3uKGp6ANoCcdjT0voB4iLaxe9sLqJZ6O1w=;
        b=Ex7uWdy/1/CSu7pPIk02hJIUh0DvP9y1+DLBLU0aFiydbz7oxinvP6zMhN09xhJOLA
         vaVg/rrd5NWuF3Dmj6T4ssOrr5TGpjemHw8mGigEOjifXmCmtNTutQtWGwaFmHhgzl8d
         ozqA7e4TmfSgddvtrqkWpJr6Y2Q8V5ipRYfzMhVzTFld0ubohyjQCH4HW2keJOUrNIJB
         9xvmXPMWFGlJmhMOOvuxAG/GuLoXW2yv1Fk4/cMl2UW+J5iEBLdyKH0Dwb34pipEGE0p
         /DhtCXSrgMGkevtDQ125jqZHEjyM9wRr7e9w6WPFzfZz799dSfnpVpEj26zes7jHWyia
         5/EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728036111; x=1728640911;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cieeCIQbn3uKGp6ANoCcdjT0voB4iLaxe9sLqJZ6O1w=;
        b=C+xdp0oMZNt+sqvKU8aPL7Rlo0fQVys0oO8uYQfsDpH/3JnksAPcll5xxD6cbcAPUI
         Ytsk1FLGL/FHdor1Nz6Ep6vY9hOskLF6sm0cT5BnQu2s3JNwSF3CFa0JnUiRarMpwty1
         +4Em581SKfz9ZXVMYjJ/jfTaGQWhf0N31bDnDbfNMlID9EEjNv4wcoDnESYQ3q7yXdC0
         59X6jSsue3k6xk2NVG+W5P81I4KN0ryUMDXYW43wyZc47VUpiicmXrqsE/awJ+nFUK/i
         i3nWbMCPuTDt+R15xcPY431K7GOj7NaqQYZRYnWYNkSvhPOznepE4kZqahfL8afnyBEV
         MmWA==
X-Forwarded-Encrypted: i=1; AJvYcCWA80IOJRmQ+wI100r0tgr9N0r+qKU74BDYGTvvjzWVYcvW434mQbBjQTc3G3ZIv7lfquhsPtLTAac=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw0sgg2I2hTkVj2EcXcGXXfF/xkQaUlPz8rNHYEI87JABFKBKvv
	971EN0vmdHj1wXaNNM9vgTuL9wk1WqJTERYybaFXselRfV5JJkrSPJ3SCo5vcedTe2cPepSrU7T
	LFslov7X1MLafB79kAQyM4V+uTPc=
X-Google-Smtp-Source: AGHT+IFNljN6dwZlkogrdacVOY8k+lgMnJISEE8yVKjz9PNhP8aN8ZuhCudCHYoRMsLr1EPgwfyfZf3qjEWBYLSi1O4=
X-Received: by 2002:a2e:b889:0:b0:2ef:20ae:d113 with SMTP id
 38308e7fff4ca-2faf3d8a95emr9412991fa.40.1728036110938; Fri, 04 Oct 2024
 03:01:50 -0700 (PDT)
MIME-Version: 1.0
References: <20240925150059.3955569-30-ardb+git@google.com> <20240925150059.3955569-35-ardb+git@google.com>
In-Reply-To: <20240925150059.3955569-35-ardb+git@google.com>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Fri, 4 Oct 2024 12:01:39 +0200
Message-ID: <CAFULd4an+aN4iJ7T0DdMQDOBWrTZPJ4Oyy9ULm6R29fLNQND9Q@mail.gmail.com>
Subject: Re: [RFC PATCH 05/28] x86: Define the stack protector guard symbol explicitly
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@linux.com>, 
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

On Wed, Sep 25, 2024 at 5:02=E2=80=AFPM Ard Biesheuvel <ardb+git@google.com=
> wrote:
>
> From: Ard Biesheuvel <ardb@kernel.org>
>
> Specify the guard symbol for the stack cookie explicitly, rather than
> positioning it exactly 40 bytes into the per-CPU area. Doing so removes
> the need for the per-CPU region to be absolute rather than relative to
> the placement of the per-CPU template region in the kernel image, and
> this allows the special handling for absolute per-CPU symbols to be
> removed entirely.
>
> This is a worthwhile cleanup in itself, but it is also a prerequisite
> for PIE codegen and PIE linking, which can replace our bespoke and
> rather clunky runtime relocation handling.
>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  arch/x86/Makefile                     |  4 ++++
>  arch/x86/include/asm/init.h           |  2 +-
>  arch/x86/include/asm/processor.h      | 11 +++--------
>  arch/x86/include/asm/stackprotector.h |  4 ----
>  tools/perf/util/annotate.c            |  4 ++--
>  5 files changed, 10 insertions(+), 15 deletions(-)
>
> diff --git a/arch/x86/Makefile b/arch/x86/Makefile
> index 6b3fe6e2aadd..b78b7623a4a9 100644
> --- a/arch/x86/Makefile
> +++ b/arch/x86/Makefile
> @@ -193,6 +193,10 @@ else
>          KBUILD_RUSTFLAGS +=3D -Cno-redzone=3Dy
>          KBUILD_RUSTFLAGS +=3D -Ccode-model=3Dkernel
>
> +        ifeq ($(CONFIG_STACKPROTECTOR),y)
> +                KBUILD_CFLAGS +=3D -mstack-protector-guard-symbol=3Dfixe=
d_percpu_data

Looking at:

> +        * Since the irq_stack is the object at %gs:0, the bottom 8 bytes=
 of
> +        * the irq stack are reserved for the canary.

Please note that %gs:0 can also be achieved with
-mstack-protector-guard-offset=3D0

Uros.

