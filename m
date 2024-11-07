Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B779C08EB
	for <lists+xen-devel@lfdr.de>; Thu,  7 Nov 2024 15:31:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.831854.1247239 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t93X1-0008Vq-Uf; Thu, 07 Nov 2024 14:30:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 831854.1247239; Thu, 07 Nov 2024 14:30:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t93X1-0008Sg-Rr; Thu, 07 Nov 2024 14:30:43 +0000
Received: by outflank-mailman (input) for mailman id 831854;
 Thu, 07 Nov 2024 14:30:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eoxm=SC=gmail.com=ubizjak@srs-se1.protection.inumbo.net>)
 id 1t93Wz-0008SY-N4
 for xen-devel@lists.xenproject.org; Thu, 07 Nov 2024 14:30:41 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dbcfbe59-9d14-11ef-a0c6-8be0dac302b0;
 Thu, 07 Nov 2024 15:30:39 +0100 (CET)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2fb470a8b27so20159341fa.1
 for <xen-devel@lists.xenproject.org>; Thu, 07 Nov 2024 06:30:38 -0800 (PST)
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
X-Inumbo-ID: dbcfbe59-9d14-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoyMzIiLCJoZWxvIjoibWFpbC1sajEteDIzMi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImRiY2ZiZTU5LTlkMTQtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwOTg5ODM5LjA3NzQ1Niwic2VuZGVyIjoidWJpempha0BnbWFpbC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730989838; x=1731594638; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w3DzRFO1j10BZCdzNgBY0f8TIGH1g3i6yXo3itiQA+E=;
        b=YBGfYv24VKw/jlJrnEYhyuxy2gzS6v81ZlR0nczaU3Vy+aFWNAX9MW9OJFutrY6BOb
         x82ZGoi5LF5kqtFaewwSujpLOQ8wzYUCOq9wXROAueStn5dIz5DYsLhfOZf5lhFhg0C8
         Ni/30woZCRIcxcsgCEqf+ZK8n0/N0I5RhHyYMdmHFTQZNI+ydjIkLwjADaiawwLwjhVA
         margfysdZUhN6uIopMdX/D5sK8jx+1znRzkQ58enwUZ491Y9JzulsYvfgFNzMGIHn21F
         GiORrQHkm2RzMGB8LkoXi+UWJ2/OSUzIEHNdAUPwi9eLTYNGOZWKxYgrHJEiSj0rF7+g
         KGrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730989838; x=1731594638;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w3DzRFO1j10BZCdzNgBY0f8TIGH1g3i6yXo3itiQA+E=;
        b=Ic9cE2uaS2mYI+ovv9SkvaJpDBmIyJhvhyaynfG8FKOeoYcHmUJHBy9DONCW0ayHyw
         eiDY18WkkMnCrlqVlUCBJKqHgvEeSivBP4ldVPOog5/kmvSyFyl7/c3hHb3jESyCuD8Q
         k+pq1KXilX3jh/houCJl1HiBi6FmWAsmp+nByZzxfsPuY/WwcMlbyWUIA78+MC5A8im4
         34V1tuKtVNY0kIUNtp6MyWt3S7yCDZqYn/6rO7OW1g3u1qkQjmQ4yyHPTEo1SLj3jH3Y
         iM2SjwyZsqTix+oY81Z2LXVBJxzxGzAP/9b89vE9/yHa/CUVshGw6hg9jTNxJAffsLYU
         iKUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVp/ETHgsl6vxKdx5uAU8MgSqd/+6536w3RDky4w4XEYGkd0/JX92dhqyQcDmKRgcaGwsfXtNvSL3Q=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwNHwSNG7hg8DgiZjqsr9+kyRC4LUAAivWWpUhy6gWyQ+FWiW9B
	DyGn4plN/QcSagtNTTLeJVsUtpb+l5uv2Ms4BTV1MHAI/nlfajvGH2teQNXBfcJ1gsHYuKF8Tj6
	+L2PejdzWINOucOYaspS8iRFklM4=
X-Google-Smtp-Source: AGHT+IGgSyaarGGvCbE/nD3rQQTNPlY5f1CWNSjxwV6FbfjWZzSk+RTRw7sgBh5ZSJeTHLrO2EZStSq/tpCCRaB0u3Q=
X-Received: by 2002:a05:651c:150b:b0:2fb:5be4:3645 with SMTP id
 38308e7fff4ca-2ff1e808cfamr1000311fa.0.1730989837803; Thu, 07 Nov 2024
 06:30:37 -0800 (PST)
MIME-Version: 1.0
References: <20241105155801.1779119-1-brgerst@gmail.com> <20241105155801.1779119-6-brgerst@gmail.com>
In-Reply-To: <20241105155801.1779119-6-brgerst@gmail.com>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Thu, 7 Nov 2024 15:30:26 +0100
Message-ID: <CAFULd4ZAFuGMdkXz_Lu0vrQHQG4CSgaJzuGSdM0abPpNOO8cPg@mail.gmail.com>
Subject: Re: [PATCH v5 05/16] x86/pvh: Use fixed_percpu_data for early boot GSBASE
To: Brian Gerst <brgerst@gmail.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, 
	Ingo Molnar <mingo@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Borislav Petkov <bp@alien8.de>, Ard Biesheuvel <ardb@kernel.org>, Juergen Gross <jgross@suse.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 5, 2024 at 4:58=E2=80=AFPM Brian Gerst <brgerst@gmail.com> wrot=
e:
>
> Instead of having a private area for the stack canary, use
> fixed_percpu_data for GSBASE like the native kernel.
>
> Signed-off-by: Brian Gerst <brgerst@gmail.com>
> ---

This patch looks like it could be submitted independently of the main
series and should include XEN maintainers (CC'd).

Uros.

>  arch/x86/platform/pvh/head.S | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
>
> diff --git a/arch/x86/platform/pvh/head.S b/arch/x86/platform/pvh/head.S
> index 64fca49cd88f..b0a9a58952aa 100644
> --- a/arch/x86/platform/pvh/head.S
> +++ b/arch/x86/platform/pvh/head.S
> @@ -159,10 +159,15 @@ SYM_CODE_START_LOCAL(pvh_start_xen)
>  1:
>         UNWIND_HINT_END_OF_STACK
>
> -       /* Set base address in stack canary descriptor. */
> -       mov $MSR_GS_BASE,%ecx
> -       leal canary(%rip), %eax
> -       xor %edx, %edx
> +       /*
> +        * Set up GSBASE.
> +        * Note that, on SMP, the boot cpu uses init data section until
> +        * the per cpu areas are set up.
> +        */
> +       movl $MSR_GS_BASE,%ecx
> +       leaq INIT_PER_CPU_VAR(fixed_percpu_data)(%rip), %rdx
> +       movq %edx, %eax
> +       shrq $32, %rdx
>         wrmsr
>
>         /*
> @@ -232,8 +237,6 @@ SYM_DATA_START_LOCAL(gdt_start)
>  SYM_DATA_END_LABEL(gdt_start, SYM_L_LOCAL, gdt_end)
>
>         .balign 16
> -SYM_DATA_LOCAL(canary, .fill 48, 1, 0)
> -
>  SYM_DATA_START_LOCAL(early_stack)
>         .fill BOOT_STACK_SIZE, 1, 0
>  SYM_DATA_END_LABEL(early_stack, SYM_L_LOCAL, early_stack_end)
> --
> 2.47.0
>

