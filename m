Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2234494D081
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2024 14:49:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.774724.1185152 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1scP2h-0005aJ-Fj; Fri, 09 Aug 2024 12:48:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 774724.1185152; Fri, 09 Aug 2024 12:48:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1scP2h-0005XU-Cw; Fri, 09 Aug 2024 12:48:27 +0000
Received: by outflank-mailman (input) for mailman id 774724;
 Fri, 09 Aug 2024 12:48:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mmNo=PI=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1scP2f-0005X0-Es
 for xen-devel@lists.xenproject.org; Fri, 09 Aug 2024 12:48:25 +0000
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com
 [2607:f8b0:4864:20::c2c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a9454a73-564d-11ef-bc04-fd08da9f4363;
 Fri, 09 Aug 2024 14:48:23 +0200 (CEST)
Received: by mail-oo1-xc2c.google.com with SMTP id
 006d021491bc7-5d5b22f97b7so1559933eaf.2
 for <xen-devel@lists.xenproject.org>; Fri, 09 Aug 2024 05:48:23 -0700 (PDT)
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
X-Inumbo-ID: a9454a73-564d-11ef-bc04-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1723207702; x=1723812502; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HJAM21U9aeooXeP9n4hIK7lw9tJ9eYyOJoJlxBE5nUQ=;
        b=chCtywPE7jehzulhLOiI+xV7KiyES6FJt1sr7KSY83f76SsGehugYGTCyMNo9EhAFK
         ErCFTeAD9CwffcCkwHnTROL4PjYy5AGoStB4OsZ4AAAuuvKypc1Bl7x10Mt/eOTGsNQM
         C/DKVIFER/OaFtMR77tzQ7sFoHxXIycR8+EDs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723207702; x=1723812502;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HJAM21U9aeooXeP9n4hIK7lw9tJ9eYyOJoJlxBE5nUQ=;
        b=enhqnfGa/jCwyfokgnh6wntHUKS2uj4Rn0khurVqrvQvFVEGPKkhUWQNrx018AJ2gQ
         HD8tojxBSRHe2WUH34XJvcNnFq2I03K3dfSCqXjfTdzTsmy091OCiCnJhLjsrf24zvs8
         ApuOH1ASKvjhfZXtBQRneMblD+zXz+4sa28RH4n1riA/hPdPuEX6OqhwLMWbOXMrcXpb
         sWKgn+yruLlzzn9zWtTmqnvjf9821Hw/Aop3ZZma6f4XqaZN2fcDCB2xAfHBdxy7Hi15
         pfiGQDnIjr+XOfN/VDjSxw969kVxE7J2oZ4uznb5QJF9kl26VWe8XRSU+iMmzTbUa0yV
         dlNA==
X-Forwarded-Encrypted: i=1; AJvYcCX8jxOG4qrh4yBcxBnn1/ySrZ3i6PLGbZFL7of6j8RC03Tf+37GXfwW5GmuNzPGBXUCJaCIdMrMPHu9kbBQzlNnyFu5waFHFJzx6YI/f6U=
X-Gm-Message-State: AOJu0YzzswCwhZBdw5oK3dIQNELb7AWygOF7tIgj0icc9zbvsdkhcqKR
	6zCvhG8u6cp9KtF2c69+zSw5Izh4rwGtbmv7IEfuUUtr5dveIDTPCSi3f0C85SzwhfP5Qpi+L72
	fi0XFPgknzjYT6xOkTAt2Q8E7p25GyMHvDiH2wA==
X-Google-Smtp-Source: AGHT+IFAWHTFKj3lIq0XEiDKZsQTtdx8O4ysicspyztSZ1JRwXR4cLWiw26WemI11KKq9t5cSxeyMcdBfoWj4QfYse0=
X-Received: by 2002:a05:6820:162a:b0:5d5:bd48:8ed8 with SMTP id
 006d021491bc7-5d870b39c76mr1719917eaf.5.1723207701742; Fri, 09 Aug 2024
 05:48:21 -0700 (PDT)
MIME-Version: 1.0
References: <20240807134819.8987-1-alejandro.vallejo@cloud.com>
 <20240807134819.8987-4-alejandro.vallejo@cloud.com> <cf819b39-6ce8-4446-b7b6-a1b247f45400@suse.com>
In-Reply-To: <cf819b39-6ce8-4446-b7b6-a1b247f45400@suse.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Fri, 9 Aug 2024 13:48:11 +0100
Message-ID: <CACHz=ZgwPunPO771EbX1hKEdmXC1ysBQ7RzYK8K1pakyBS927A@mail.gmail.com>
Subject: Re: [PATCH 3/5] x86: Set xen_phys_start and trampoline_xen_phys_start earlier
To: Jan Beulich <jbeulich@suse.com>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 8, 2024 at 9:25=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wrot=
e:
>
> On 07.08.2024 15:48, Alejandro Vallejo wrote:
> > No reason to wait, if Xen image is loaded by EFI (not multiboot
> > EFI path) these are set in efi_arch_load_addr_check, but
> > not in the multiboot EFI code path.
> > This change makes the 2 code paths more similar and allows
> > the usage of these variables if needed.
>
> I'm afraid I'm struggling with any "similarity" argument here. Imo it
> would be better what, if anything, needs (is going to need) either or
> both of these set earlier. Which isn't to say it's wrong to do early
> what can be done early, just that ...
>

About similarity is that some part of EFI code expect xen_phys_start
to be initialized so this change make sure that if in the future these
paths are called even for this case they won't break.

> > --- a/xen/arch/x86/boot/head.S
> > +++ b/xen/arch/x86/boot/head.S
> > @@ -259,6 +259,11 @@ __efi64_mb2_start:
> >          jmp     x86_32_switch
> >
> >  .Lefi_multiboot2_proto:
> > +        /* Save Xen image load base address for later use. */
> > +        lea     __image_base__(%rip),%rsi
> > +        movq    %rsi, xen_phys_start(%rip)
> > +        movl    %esi, trampoline_xen_phys_start(%rip)
>
> ... this path is EFI only if I'm not mistaken, while ...
>
> > @@ -605,10 +610,6 @@ trampoline_setup:
> >           * Called on legacy BIOS and EFI platforms.
> >           */
> >
> > -        /* Save Xen image load base address for later use. */
> > -        mov     %esi, sym_esi(xen_phys_start)
> > -        mov     %esi, sym_esi(trampoline_xen_phys_start)
>
> ... the comment in context is pretty clear about this code also being
> used in the non-EFI case. It is, however, the case that %esi is 0 in
> that case. Yet surely you want to mention this in the description, to
> clarify the correctness of the change.

Restored this code.

>
> Also in the code you move please consistently omit insn suffixes when
> they're not needed. Just like it was in the original code, and just
> like you already omit the q from "lea".
>

Done

> Finally, if you used a register other than %rsi (say %r14) you could
> replace the "lea" after x86_32_switch by a 2nd "mov", similar to the
> one that's already there to load %edi. (You'd need to move the new
> code up by yet a few more lines, to cover the jump to x86_32_switch
> there, too.)
>

IMHO it makes code less readable, it's hard to understand which
registers are in use or not, I prefer to compute one more time
instead, this code is not in an hard path and it's going to be
discarded after initialization.

> Jan

Frediano

