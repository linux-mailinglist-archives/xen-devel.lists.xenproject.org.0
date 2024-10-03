Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2949F98EC23
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2024 11:16:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.809218.1221429 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swHw6-0005gC-U9; Thu, 03 Oct 2024 09:15:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 809218.1221429; Thu, 03 Oct 2024 09:15:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swHw6-0005dd-Qy; Thu, 03 Oct 2024 09:15:50 +0000
Received: by outflank-mailman (input) for mailman id 809218;
 Thu, 03 Oct 2024 09:15:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d1Re=Q7=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1swHw4-0005dW-GT
 for xen-devel@lists.xenproject.org; Thu, 03 Oct 2024 09:15:48 +0000
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com
 [2607:f8b0:4864:20::c31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 130dd894-8168-11ef-a0ba-8be0dac302b0;
 Thu, 03 Oct 2024 11:15:47 +0200 (CEST)
Received: by mail-oo1-xc31.google.com with SMTP id
 006d021491bc7-5e7aec9e168so410676eaf.3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Oct 2024 02:15:47 -0700 (PDT)
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
X-Inumbo-ID: 130dd894-8168-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1727946946; x=1728551746; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qQRnFepe2nyy0Yymg3rZus965UOqHN71sM0Zb7C3GqY=;
        b=c/a1NduRGgsylFgi+cEweV7d86ovviw09mr21yiIP9ksQjKF5k+t70Wyy8sUN/cxT6
         gk8aWgZ+aLV02UXTbkHUloZV18EYLUQblaFRYCnOtwGJJ64GH5WeYoKDcLf40vIiW3aC
         VtweepDWOOAiZz233Lo7XtdHr0m4C7oAaXkcI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727946946; x=1728551746;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qQRnFepe2nyy0Yymg3rZus965UOqHN71sM0Zb7C3GqY=;
        b=cbfNlbu8Vt0lHhBNo8zUXYqGJQYhjURIdfyaQawbJtLLpFtvBtf0W4fynXT0u/HehT
         VxadFkGEca2Sm3AJBQ2p1vcIB+ZQUOpBxZeP5B6/K/7EMNMAzoJO1B0aSB+xe+jhYZ7p
         H0+EsAykifsNLXm/eW2aMSi0tFrerlD2ja1+yuulsuz9xAZ4Wd5r4MCXxIJYMCTKukMJ
         z/6n6e8br+tLrzHbevlJkYmvOtcDeZUNBfmqw/V+wYWqsyb9Oe6baisoSfYl4f6kVDfs
         KGHrtR2ehJwW9NwEHv2KZOgyQvJnwDnzK6h7suD5M9hvYLmF1jcsI/elF9uur4vlslDd
         ddfQ==
X-Gm-Message-State: AOJu0YzP8/TgFVyP7okEfwgpB9i3RYta+Nc/MEmnb3r7K8pGjvQinCzH
	6oVqD3UuoJRWYGScVKrZdbqCv585Qa6UDa3RAw8bFZK7+ocps85NovwJDLBt5LCONzY7py3zBpY
	9osC3MEoAgpb7uQh9/ujm7nlr029Z7Ti+jgcp0w==
X-Google-Smtp-Source: AGHT+IFxQCvXB7vSH62QYEzCqJdLUUsxz8xUqfyOmkjcZ/YJ2jKPsFdSP9xTTXGLmf/GZ69BtHVGtUC0kr6LnNn08ZM=
X-Received: by 2002:a05:6871:5d1:b0:268:9d81:24b7 with SMTP id
 586e51a60fabf-2878902cc2cmr3938992fac.29.1727946946176; Thu, 03 Oct 2024
 02:15:46 -0700 (PDT)
MIME-Version: 1.0
References: <20241002152725.1841575-1-andrew.cooper3@citrix.com>
In-Reply-To: <20241002152725.1841575-1-andrew.cooper3@citrix.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Thu, 3 Oct 2024 10:15:34 +0100
Message-ID: <CACHz=ZibOmQqZFU=aavR-WPJnN-GNKFu0NhWZmYHF_iPbk9caw@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] x86/alternatives: Adjust all insn-relative fields
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <JBeulich@suse.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 2, 2024 at 4:27=E2=80=AFPM Andrew Cooper <andrew.cooper3@citrix=
.com> wrote:
>
> Alternatives have had a reasonably severe restriction since their
> introduction.  This has been the source of several bugs, and several
> inefficiencies particularly in the speculative safety paths.
>
> v2:
>   Most work is in patch 1 and the new patch 2 (userspace harness).  Other
>   patches with minor or no change.
>
> Andrew Cooper (7):
>   x86: Introduce x86_decode_lite()
>   tests/x86: Introduce a userspace test harness for x86_decode_lite()
>   x86/alternative: Walk all replacements during self tests
>   x86/alternative: Indent the relocation logic
>   x86/alternative: Replace a continue with a goto
>   x86/alternative: Relocate all insn-relative fields
>   x86/spec-ctrl: Introduce and use DO_COND_BHB_SEQ
>
>  tools/tests/Makefile                      |   1 +
>  tools/tests/x86-decode-lite/.gitignore    |   1 +
>  tools/tests/x86-decode-lite/Makefile      |  45 ++
>  tools/tests/x86-decode-lite/insns.S       | 703 ++++++++++++++++++++++
>  tools/tests/x86-decode-lite/macro-magic.h |  52 ++
>  tools/tests/x86-decode-lite/main.c        | 111 ++++
>  tools/tests/x86-decode-lite/x86-emulate.h |  27 +
>  xen/arch/x86/alternative.c                | 213 +++++--
>  xen/arch/x86/hvm/vmx/entry.S              |  12 +-
>  xen/arch/x86/include/asm/spec_ctrl_asm.h  |  43 +-
>  xen/arch/x86/x86_emulate/Makefile         |   6 +
>  xen/arch/x86/x86_emulate/decode-lite.c    | 311 ++++++++++
>  xen/arch/x86/x86_emulate/private.h        |   2 +
>  xen/arch/x86/x86_emulate/x86_emulate.h    |  14 +
>  14 files changed, 1456 insertions(+), 85 deletions(-)
>  create mode 100644 tools/tests/x86-decode-lite/.gitignore
>  create mode 100644 tools/tests/x86-decode-lite/Makefile
>  create mode 100644 tools/tests/x86-decode-lite/insns.S
>  create mode 100644 tools/tests/x86-decode-lite/macro-magic.h
>  create mode 100644 tools/tests/x86-decode-lite/main.c
>  create mode 100644 tools/tests/x86-decode-lite/x86-emulate.h
>  create mode 100644 xen/arch/x86/x86_emulate/decode-lite.c
>

For patches 1 to 6

Reviewed-by: Frediano Ziglio <frediano.ziglio@cloud.com>

Frediano

