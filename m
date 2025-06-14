Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B04AD9E57
	for <lists+xen-devel@lfdr.de>; Sat, 14 Jun 2025 18:41:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1015625.1393186 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQTwD-0001Wl-PN; Sat, 14 Jun 2025 16:41:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1015625.1393186; Sat, 14 Jun 2025 16:41:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQTwD-0001UX-Ly; Sat, 14 Jun 2025 16:41:01 +0000
Received: by outflank-mailman (input) for mailman id 1015625;
 Sat, 14 Jun 2025 16:40:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=duY6=Y5=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1uQTwB-0001Aq-R3
 for xen-devel@lists.xenproject.org; Sat, 14 Jun 2025 16:40:59 +0000
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com
 [2607:f8b0:4864:20::112a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 58de0f23-493e-11f0-a309-13f23c93f187;
 Sat, 14 Jun 2025 18:40:58 +0200 (CEST)
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-70e1d8c2dc2so27363927b3.3; 
 Sat, 14 Jun 2025 09:40:58 -0700 (PDT)
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
X-Inumbo-ID: 58de0f23-493e-11f0-a309-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749919257; x=1750524057; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=42HLB7vPizxYysP77djk2L92Us5rCaaCpZzTdci5z24=;
        b=VWBFS513kb+RXIUJ8nKATywnf8hARg3JOPWBOGUNnJLyoq4ouwjaRhkS0FevoegrSN
         5/USROQh/lnqTlxXWSK8EE4IEEkSUMu+JTwdP370O+K4JB8wrYgvVGXT83imZzOeJPZv
         GV7BPSA1vSOI+nZE2vr5EjNIOwlXY3lPlbJoqVpUNkYxW56tdZo6i2MVD483s63T0CN0
         XEY4/wzsqfKauzc2634ceJc3okYMiE3Kbhi+Z2jAOagUzA+cGHsHbzm5TDidZiqJkEt6
         vba7GQHDHkFOpHzp2R0MqOQtlpeDcTk5Lse4GV1WdJDLtxUbnR+JluMU2Wuuno2MdFxD
         hPgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749919257; x=1750524057;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=42HLB7vPizxYysP77djk2L92Us5rCaaCpZzTdci5z24=;
        b=deVwUzAEm5szzxY+C8p2NHsZO7pbVdSIn/AjrrFsGySZdqTlosu0948ux64L7Ded8G
         3ngDb+Zyk5zkgRG6Ax2/1JQt95qPNfy7T6Sm0M7BMU+YY3924u1Ptx4bX77h8M/VOubB
         7a9CnOjTCxb74Y5AWOpu+QmYi9jFn98pqEGSkOI3SvceGhPGCqSQ2I0JdExjkG/tQ9TU
         urGF26L+NXklR6MRk32QogtTgpQMDO2PLTZXyGP2skg/OgJpTcsrSCGuM9GXxVvOJa1B
         2OuXPqELiLoY6CMYkI0cNjBcPMS1H14MDTLLM3QCU7GYbFQH2u5nW0GrFXF/bf/S7Cwi
         RUsQ==
X-Forwarded-Encrypted: i=1; AJvYcCXq+8jOAAfRE2MebBVemc/yqqOTCrZ+EI8JofBQ8izD6ZgMFvfYxCC+Dp5DH/nX3vCL9yPrbDYK5Uo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzPaamEBnODfuSX3I1h2NqEhQMXtgQiBw2XXjJNfVvQnfN3oLwx
	lJYvVSCEMdB+KxpchCJ5c9pdL+Q6yJlVGUNGtpnwNrCunWpp1Hne8+cpq7PhmXlWOpcyDDpbgyt
	xU81b0DEmyM6Mosx8poAl7uzry0JK+nA=
X-Gm-Gg: ASbGncu2Cx72u4zqbDXAe1ThL58BxpBvEwQJTSIqi4ba9aha4BonF0e1V2yNrzVMS7K
	M/6xEV56r5u6Eu7TOf+sk4FZQGrOUt1J9riyqRsA2GO++2XZlx+2FU6gtvnw1nwF3/Odp3PjSz2
	XNtQODP4xBXPxPMWWzoRwp4JzT7GX3Wxrct555IDCp
X-Google-Smtp-Source: AGHT+IGuuuPtD15+NIRs6pZG7pwSHOZbi5aqJoqJZZcGKqtWPCnsTvgV8mnXjUxGwLV7BMyrLSyX2ybHgpVzB0Jwedc=
X-Received: by 2002:a05:690c:4c08:b0:70f:8883:eb1a with SMTP id
 00721157ae682-7117537b9b5mr54186967b3.6.1749919257058; Sat, 14 Jun 2025
 09:40:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250321092451.17309-1-jgross@suse.com> <20250321092451.17309-3-jgross@suse.com>
In-Reply-To: <20250321092451.17309-3-jgross@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Sat, 14 Jun 2025 12:40:46 -0400
X-Gm-Features: AX0GCFsY6c5o-q74wdQQKXJzn2F1w802AGfeuuQ3aB3gDR_WQuh4t3gmQe3EW3k
Message-ID: <CAKf6xpv+KQx7ESdeXRvMfCj0KfY60yMgc8YU9bXZ2-K4Vv8OZg@mail.gmail.com>
Subject: Re: [MINI-OS PATCH 02/12] kexec: add final kexec stage
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org, 
	samuel.thibault@ens-lyon.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 21, 2025 at 5:25=E2=80=AFAM Juergen Gross <jgross@suse.com> wro=
te:
>
> Add the code and data definitions of the final kexec stage.
>
> Put the code and related data into a dedicated section in order to be
> able to copy it to another location. For this reason there must be no
> absolute relocations being used in the code or data.
>
> Being functionally related, add a function for adding a final kexec
> action.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>

> --- /dev/null
> +++ b/arch/x86/kexec.c
> @@ -0,0 +1,109 @@

> +
> +/*
> + * Final stage of kexec. Copies all data to the final destinations, zero=
es
> + * .bss and activates new kernel.
> + * Must be called with interrupts off. Stack, code and data must be
> + * accessible via identity mapped virtual addresses (virt =3D=3D phys). =
Copying
> + * and zeroing is done using virtual addresses.
> + * No relocations inside the function are allowed, as it is copied to an
> + * allocated page before being executed.

"page" is stated here.  Do we need an ASSERT later?

> + */

> +void do_kexec(void *kexec_page)
> +{
> +    unsigned long actions;
> +    unsigned long stack;
> +    unsigned long final;
> +    unsigned long phys;
> +
> +    actions =3D get_kexec_addr(kexec_page, kexec_actions);
> +    stack =3D get_kexec_addr(kexec_page, kexec_stack + KEXEC_STACK_LONGS=
);
> +    final =3D get_kexec_addr(kexec_page, kexec_final);
> +    phys =3D get_kexec_addr(kexec_page, kexec_phys);
> +
> +    memcpy(kexec_page, _kexec_start, KEXEC_SECSIZE);
> +    asm("cli\n\t"
> +        "mov %0, %%"ASM_SP"\n\t"
> +        "mov %1, %%"ASM_ARG1"\n\t"
> +        "mov %2, %%"ASM_ARG2"\n\t"
> +        "jmp *%3"
> +        :"=3Dm" (stack), "=3Dm" (actions), "=3Dm" (phys)

Aren't these inputs and not outputs?

> +        :"m" (final));
> +}
> +
> +#endif /* CONFIG_KEXEC */


> diff --git a/include/kexec.h b/include/kexec.h
> index 6fd96774..722be456 100644
> --- a/include/kexec.h
> +++ b/include/kexec.h
> @@ -1,7 +1,34 @@

> +
> +int kexec_add_action(int action, void *dest, void *src, unsigned int len=
);
> +
> +#define KEXEC_SECSIZE ((unsigned long)_kexec_end - (unsigned long)_kexec=
_start)

Add a build assertion here?  Or maybe the correct amount is allocated
and it doesn't matter.

Generally looks good.

Regards,
Jason

