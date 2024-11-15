Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D56C9CDBB7
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2024 10:37:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.837010.1252924 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBslB-00037h-8A; Fri, 15 Nov 2024 09:37:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 837010.1252924; Fri, 15 Nov 2024 09:37:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBslB-00035Q-5Q; Fri, 15 Nov 2024 09:37:01 +0000
Received: by outflank-mailman (input) for mailman id 837010;
 Fri, 15 Nov 2024 09:36:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Tcl1=SK=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1tBsl9-00035I-4h
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2024 09:36:59 +0000
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [2607:f8b0:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2610866e-a335-11ef-a0c7-8be0dac302b0;
 Fri, 15 Nov 2024 10:36:54 +0100 (CET)
Received: by mail-ot1-x332.google.com with SMTP id
 46e09a7af769-71815313303so902710a34.1
 for <xen-devel@lists.xenproject.org>; Fri, 15 Nov 2024 01:36:54 -0800 (PST)
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
X-Inumbo-ID: 2610866e-a335-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjI2MDc6ZjhiMDo0ODY0OjIwOjozMzIiLCJoZWxvIjoibWFpbC1vdDEteDMzMi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjI2MTA4NjZlLWEzMzUtMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNjYzNDE0Ljc3Njc0Mywic2VuZGVyIjoiZnJlZGlhbm8uemlnbGlvQGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1731663413; x=1732268213; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T0HwHYH/XM0oXYXGB08CJRRpmnB5m39KSPc+LJry+c4=;
        b=CkxrGErZnYiwvxiVWkSqyVJFEbLw1WFB3OGtD9E3ud2Sk0ipo6RidX2xVJvZg2+W0m
         fT+6ajK3B6QFbM0ra1W23DbOf0mhz18mJ5PP1CXufROQdCxdo0ce+6DUocXMJDbpcZJd
         00khsT1sjDT0PJdemwytp4dRHPYzLyK6bWTqY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731663413; x=1732268213;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T0HwHYH/XM0oXYXGB08CJRRpmnB5m39KSPc+LJry+c4=;
        b=NR/Utw6GQHaoLCxcExEq6kza6UPkAOJPXrgyhoreIuyFZ0+eYTIS3KQHjcvr1mnlZn
         7G7JeChMAPbZhFZyeGDMJ0vrLFpYXI1MSlJf3AIpneUmaRops8gTK97bxlW1AdpcYFaq
         iFHlUrz2HPKrMjvsJSObhD5bDAbwYkCvzx0u5zruGKUKTbaUM9uoyPJrza76EMYVNtub
         G8u7UqzTbTTOB97UCaxA3Fu5X6muzSNe1DVPOUXuadR9TnADBc513qZ8JTOJXfMztzGJ
         E6fFK/PS+fPEqzPKnX4sO0oAr+ZTd6pOkqGUjHT33UshhCYpJHcC/AkYOZjCAZEdA4qW
         dGTQ==
X-Gm-Message-State: AOJu0YwPM4b17gRpRDoIork/HQKPsZpuu4Il04E+4eYcR8sGUz5oGx7J
	cEOe7T2s4QDp2dYK5HXPPH/gQoJYyoitJTWMiiydIpoP7KOYGZBCrCg4X/kLL1ISKE7NM2hxsNv
	a0NbAZXWi0Y7fyR26azq3NTm8YM9NRfLj6RyAeA==
X-Google-Smtp-Source: AGHT+IFapDmXAHOeq7f7/Q1Iu0tp0S11Jygz8TF4nBNJ/S1wlmpgKkvrUQrEHiG2BK+D52QKN++l0Bvr+HttEJFeDSE=
X-Received: by 2002:a05:6830:6811:b0:717:fab7:f7cb with SMTP id
 46e09a7af769-71a77a08c32mr2416965a34.21.1731663413419; Fri, 15 Nov 2024
 01:36:53 -0800 (PST)
MIME-Version: 1.0
References: <20241114182219.1983073-1-andrew.cooper3@citrix.com>
In-Reply-To: <20241114182219.1983073-1-andrew.cooper3@citrix.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Fri, 15 Nov 2024 09:36:42 +0000
Message-ID: <CACHz=Zi40q2fiUJf4H1jVGezYcuHFMJBnMmoYtpmCB4iXw2eRw@mail.gmail.com>
Subject: Re: [PATCH] x86/boot: Fix comment about setting up the real mode stack
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <JBeulich@suse.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	"Daniel P . Smith" <dpsmith@apertussolutions.com>, 
	Alejandro Vallejo <alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 14, 2024 at 6:22=E2=80=AFPM Andrew Cooper <andrew.cooper3@citri=
x.com> wrote:
>
> It may have taken a while, but it occurs to me that the mentioned commit =
fixed
> a second problem too.
>
> On entering trampoline_boot_cpu_entry(), %esp points at the trampoline st=
ack,
> but in a 32bit flat segment.  It happens to be page aligned.
>
> When dropping into 16bit mode, the stack segment operates on %sp, preserv=
ing
> the upper bits.  Prior to 1ed76797439e, the top nibble of %sp would depen=
d on
> where the trampoline was placed in low memory, and only had a 1/16 chance=
 of
> being 0 and therefore operating on the intended stack.
>
> There was a 15/16 chance of using a different page in the trampoline as i=
f it
> were the stack.  Therefore, zeroing %esp was correct, but for more reason=
s
> than realised at the time.
>

It's not clear the additional reasons, even the original commit
mentioned wrong usage of upper bits.

> Update the comment to explain why zeroing %esp is correct in all cases.  =
Move
> it marginally earlier to when a 16bit stack segment is first loaded.
>

I don't see such an explanation, I mean, from "The stack is at
trampoline_phys + 64k, which for a 16bit stack segment wants %sp
starting at 0" I could assume "xor %sp, %sp" is correct too.

> Fixes: 1ed76797439e ("x86/boot: fix BIOS memory corruption on certain IBM=
 systems")

Does this commit really "fixes" something.

The subject "Fix comment about setting up the real mode stack" seems
to indicate an update of a comment, is it considered a fix?

This commit also moves the initialisation of %esp. Is there a reason for th=
is?

> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> CC: Daniel P. Smith <dpsmith@apertussolutions.com>
> CC: Frediano Ziglio <frediano.ziglio@cloud.com>
> CC: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> ---
>  xen/arch/x86/boot/trampoline.S | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/xen/arch/x86/boot/trampoline.S b/xen/arch/x86/boot/trampolin=
e.S
> index 924bda37c1b7..f5a1d61280c5 100644
> --- a/xen/arch/x86/boot/trampoline.S
> +++ b/xen/arch/x86/boot/trampoline.S
> @@ -176,6 +176,12 @@ trampoline_boot_cpu_entry:
>          mov     %eax,%gs
>          mov     %eax,%ss
>
> +        /*
> +         * The stack is at trampoline_phys + 64k, which for a 16bit stac=
k
> +         * segment wants %sp starting at 0.
> +         */
> +        xor     %esp, %esp
> +
>          /* Switch to pseudo-rm CS, enter real mode, and flush insn queue=
. */
>          mov     %cr0,%eax
>          dec     %eax
> @@ -190,8 +196,6 @@ trampoline_boot_cpu_entry:
>          mov     %ax,%es
>          mov     %ax,%ss
>
> -        /* Initialise stack pointer and IDT, and enable irqs. */

Fine, surely this commit without stack pointer handling is useless.

> -        xor     %esp,%esp
>          lidt    bootsym(rm_idt)
>          sti
>
>
> base-commit: 41c80496084aa3601230e01c3bc579a0a6d8359a
> prerequisite-patch-id: 6eb3b54ccd19effe3a89768e0ec5c7a2496a233a
> prerequisite-patch-id: b9c480479c1f4021e9c3fe659811e28bf88f6eca
> prerequisite-patch-id: 68f0d0fff4312fb059861efddbef95ddf4635b0e
> prerequisite-patch-id: 66902cf11d58181ff63b8ee4efb4078df5828490

Frediano

