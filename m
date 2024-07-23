Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC13493A3CD
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2024 17:37:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.763346.1173622 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWHZo-0004Rg-3w; Tue, 23 Jul 2024 15:37:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 763346.1173622; Tue, 23 Jul 2024 15:37:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWHZo-0004Op-1B; Tue, 23 Jul 2024 15:37:20 +0000
Received: by outflank-mailman (input) for mailman id 763346;
 Tue, 23 Jul 2024 15:37:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ruWa=OX=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sWHZl-0003vM-QV
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2024 15:37:17 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 705d1af8-4909-11ef-8776-851b0ebba9a2;
 Tue, 23 Jul 2024 17:37:16 +0200 (CEST)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2f029e9c9cfso3525401fa.2
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jul 2024 08:37:16 -0700 (PDT)
Received: from localhost ([185.25.67.249]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7aa8d8d0cesm14750066b.138.2024.07.23.08.37.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Jul 2024 08:37:15 -0700 (PDT)
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
X-Inumbo-ID: 705d1af8-4909-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1721749036; x=1722353836; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vsYukT5Adc3Zz4LX9TkT7E7HSo4fS0rUzHIbtS+s5JQ=;
        b=IkxdY6iCMR5oiiCTiReTtahcmPri3SatDOqIEC8PcPe/j9Rp64bcCC8YnffluBRzYn
         pBXm1qzoSKqYxGue4jfRmMeQJ94icF0FlJfRxVubaDXU9nQqFH2Y0gfnBMcU0yCHrFyg
         bklM0rQIVOC1bHCINdwlOi8GuWIKagVzzhZC8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721749036; x=1722353836;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vsYukT5Adc3Zz4LX9TkT7E7HSo4fS0rUzHIbtS+s5JQ=;
        b=ISgealvAht5mchJTKCoKDFLmAwDFTtGIFyGyRDHAqHpULuAlDuG2IGp4miT84aI6JX
         PCl+Xe5BPmKOMq/VLgtlgpj4XmUsJ2KDBCQiRTcsiVF3zKGDdXkU8A000pzbNQJPD1lW
         TMOyD9YgfKkVgGnY0JNOBWL5k7WEUlgPp6Uwubl/JCmrynO6gtehFEwETBspapem6RJP
         k86pFf794jZEV1JGf2Qbc2+ICrbcxx7A8zs703pr8C1gILTo/DDKe562EqBF/Trno2/t
         /d2NMrIw3hrhvnf5RTrVvo+IyvAIgAhl4z58mLY4tMyb/0IWgLtrj6dqa+OapzzwAM90
         zMBw==
X-Forwarded-Encrypted: i=1; AJvYcCWs0boWTNCGifAhotUzb952O2AxHP7aGHEapwAa8nUdPdLjMsr2qi8YWEAD7RvYQPyQBQpPBEuVXCKFfGYa0/FqOtt+31VU34Mu0rML/yU=
X-Gm-Message-State: AOJu0YwlZDx9QzBhIGfxkqJzxC6h6dVf4B1vTLhGwy1OkJDq7uvhcQOu
	z7SoDyLyOXqlyMrMKRGGbZ82h50+f1FIUXNvbUruuQqVsi36ZfbnvkGAA4ypJ4GA2LMNrUBaD1y
	Y
X-Google-Smtp-Source: AGHT+IF5nxZNtFMuNnScN89WmXtBMu5+26aFZ8AZKLz4WVlvJYGxWl9EIRpXwLAmKIqvYZNHXBm9aA==
X-Received: by 2002:a05:651c:10b1:b0:2ef:24f3:fb9c with SMTP id 38308e7fff4ca-2f02b98c668mr2133381fa.38.1721749035465;
        Tue, 23 Jul 2024 08:37:15 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 23 Jul 2024 16:37:12 +0100
Message-Id: <D2X13ED477J8.25JRFH9VEW33O@cloud.com>
Cc: "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper"
 <andrew.cooper3@citrix.com>, "Oleksii Kurochko"
 <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH for-4.19] x86/altcall: fix clang code-gen when using
 altcall in loop constructs
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Roger Pau Monne" <roger.pau@citrix.com>,
 <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.17.0
References: <20240723093117.99487-1-roger.pau@citrix.com>
In-Reply-To: <20240723093117.99487-1-roger.pau@citrix.com>

On Tue Jul 23, 2024 at 10:31 AM BST, Roger Pau Monne wrote:
> Yet another clang code generation issue when using altcalls.
>
> The issue this time is with using loop constructs around alternative_{,v}=
call
> instances using parameter types smaller than the register size.
>
> Given the following example code:
>
> static void bar(bool b)
> {
>     unsigned int i;
>
>     for ( i =3D 0; i < 10; i++ )
>     {
>         int ret_;
>         register union {
>             bool e;
>             unsigned long r;
>         } di asm("rdi") =3D { .e =3D b };
>         register unsigned long si asm("rsi");
>         register unsigned long dx asm("rdx");
>         register unsigned long cx asm("rcx");
>         register unsigned long r8 asm("r8");
>         register unsigned long r9 asm("r9");
>         register unsigned long r10 asm("r10");
>         register unsigned long r11 asm("r11");
>
>         asm volatile ( "call %c[addr]"
>                        : "+r" (di), "=3Dr" (si), "=3Dr" (dx),
>                          "=3Dr" (cx), "=3Dr" (r8), "=3Dr" (r9),
>                          "=3Dr" (r10), "=3Dr" (r11), "=3Da" (ret_)
>                        : [addr] "i" (&(func)), "g" (func)
>                        : "memory" );
>     }
> }
>
> See: https://godbolt.org/z/qvxMGd84q
>
> Clang will generate machine code that only resets the low 8 bits of %rdi
> between loop calls, leaving the rest of the register possibly containing
> garbage from the use of %rdi inside the called function.  Note also that =
clang
> doesn't truncate the input parameters at the callee, thus breaking the ps=
ABI.
>
> Fix this by turning the `e` element in the anonymous union into an array =
that
> consumes the same space as an unsigned long, as this forces clang to rese=
t the
> whole %rdi register instead of just the low 8 bits.
>
> Fixes: 2ce562b2a413 ('x86/altcall: use a union as register type for funct=
ion parameters on clang')
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> ---
> Adding Oleksii as to whether this could be considered for 4.19: it's stri=
ctly
> limited to clang builds, plus will need to be backported anyway.
> ---
>  xen/arch/x86/include/asm/alternative.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/xen/arch/x86/include/asm/alternative.h b/xen/arch/x86/includ=
e/asm/alternative.h
> index 0d3697f1de49..e63b45927643 100644
> --- a/xen/arch/x86/include/asm/alternative.h
> +++ b/xen/arch/x86/include/asm/alternative.h
> @@ -185,10 +185,10 @@ extern void alternative_branches(void);
>   */
>  #define ALT_CALL_ARG(arg, n)                                            =
\
>      register union {                                                    =
\
> -        typeof(arg) e;                                                  =
\
> +        typeof(arg) e[sizeof(long) / sizeof(arg)];                      =
\
>          unsigned long r;                                                =
\
>      } a ## n ## _ asm ( ALT_CALL_arg ## n ) =3D {                       =
  \
> -        .e =3D ({ BUILD_BUG_ON(sizeof(arg) > sizeof(void *)); (arg); }) =
  \
> +        .e[0] =3D ({ BUILD_BUG_ON(sizeof(arg) > sizeof(void *)); (arg); =
})\
>      }
>  #else
>  #define ALT_CALL_ARG(arg, n) \

Don't we want BUILD_BUG_ON(sizeof(long) % sizeof(arg) =3D=3D 0) instead? Ot=
herwise
odd sizes will cause the wrong union size to prevail, and while I can't see
today how those might come to happen there's Murphy's law.

Cheers,
Alejandro

