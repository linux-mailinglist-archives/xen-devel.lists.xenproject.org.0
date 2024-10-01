Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCBA198B70F
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2024 10:36:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807810.1219470 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svYM6-0002Mv-GC; Tue, 01 Oct 2024 08:35:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807810.1219470; Tue, 01 Oct 2024 08:35:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svYM6-0002Js-Cp; Tue, 01 Oct 2024 08:35:38 +0000
Received: by outflank-mailman (input) for mailman id 807810;
 Tue, 01 Oct 2024 08:35:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i7H1=Q5=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1svYM4-0002Jm-HY
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2024 08:35:36 +0000
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [2607:f8b0:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1ff7afbd-7fd0-11ef-a0ba-8be0dac302b0;
 Tue, 01 Oct 2024 10:35:34 +0200 (CEST)
Received: by mail-ot1-x333.google.com with SMTP id
 46e09a7af769-710e14e2134so2888044a34.0
 for <xen-devel@lists.xenproject.org>; Tue, 01 Oct 2024 01:35:34 -0700 (PDT)
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
X-Inumbo-ID: 1ff7afbd-7fd0-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1727771733; x=1728376533; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bR/E6Kd3KorSxT+iMi28Cu97at4KfTtYRUNGDauOYMI=;
        b=Inc4EwXRaFETj66Iky1lxzmAof97KpdH26Fs7ujsRZ5jxj2js2FenFF1s1kSA1Qykj
         CS2uBLUhWempgEmTzI/horJ3hbI36Y+e+83lp6nbAIevDwQMzATYZIMfa+6nCgm1xSy0
         sLGpKiorlsjVZPDrnjKEn/q9OBZC/O5WsDmMI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727771733; x=1728376533;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bR/E6Kd3KorSxT+iMi28Cu97at4KfTtYRUNGDauOYMI=;
        b=wU9qcw8/UP2/NNoFw0IW/zUzOn0Q+4p9TDb767/zDGrThJ81Y3sgQ8lgCiEdvh3Tk8
         X5XYYQI1Si9KavZ7nwWLI5HlQDRxVEIWn0YymssNowtM7iMLIjDeUhVUhMPGmPc/S5jk
         J2XEX62d0YKeEukW1gG+K159qkeH5ZOh9XdmPXz5HEhIWAitwdWlUrL476hz98Z9gXlG
         yKT3TyKPrEXLvm6pmWXmVHAFw3x+O4WzMF2WOGRMYazRJX7KQDVOPDzpT8vdDTRHgC+P
         SYJ20nOep9tcIBPms9WZ15sbjijXeRK27rlJAXD317DtBGPYgeH/9M44elM+UWm96rXJ
         Rc/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWHjKtgAIafjdWaR7Rn5HvlwVpX2dC8NG2qO3SBUSB3lCwknigMtSUIB2GwHbHoDTySsIUoW3EoyEM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx5luNU2OuTT21XHOJwkRDpZ8QFB3IWuYf8VdrE7YzYXPlErMJT
	fOboJxLYkCWFogfLpbto0IQVVpi1SpnaBkSV4bPQ/yNpUCIpv3lWkn7xgDObDLfihPp+umqgq9Z
	VlTRWMdTraqFp5WnJN5c8oe3/g7X3UQsRcpZrmQ==
X-Google-Smtp-Source: AGHT+IFF5nOk65nGqZm7GXuwxvW/NHGNCBryeRX/qvX6aChuEXzvptNJL4SoahhWDkyuI72p4yUd7gIpyGpBKbAi3W0=
X-Received: by 2002:a05:6870:e310:b0:25e:23b4:cf3e with SMTP id
 586e51a60fabf-28710bd9a0fmr9272218fac.44.1727771733174; Tue, 01 Oct 2024
 01:35:33 -0700 (PDT)
MIME-Version: 1.0
References: <20240926092109.475271-1-frediano.ziglio@cloud.com>
 <20240926092109.475271-3-frediano.ziglio@cloud.com> <e17b2afc-3647-4472-9d37-1510b40ff23d@suse.com>
In-Reply-To: <e17b2afc-3647-4472-9d37-1510b40ff23d@suse.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Tue, 1 Oct 2024 09:35:22 +0100
Message-ID: <CACHz=ZhtYik3p4z2mc1PYG9M68Mwap68_DdoE7MWksW0VW+BTw@mail.gmail.com>
Subject: Re: [PATCH v6 2/3] x86/boot: Rewrite EFI/MBI2 code partly in C
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	"Daniel P. Smith" <dpsmith@apertussolutions.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 30, 2024 at 4:51=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 26.09.2024 11:21, Frediano Ziglio wrote:
> > @@ -243,7 +234,7 @@ __efi64_mb2_start:
> >          /*
> >           * Initialize BSS (no nasty surprises!).
> >           * It must be done earlier than in BIOS case
> > -         * because efi_multiboot2() touches it.
> > +         * because efi_multiboot2_prelude() touches it.
> >           */
> >          mov     %eax, %edx
>
> I think this MOV wants to gain a comment, now that ...
>
> >          lea     __bss_start(%rip), %edi
> > @@ -252,36 +243,30 @@ __efi64_mb2_start:
> >          shr     $3, %ecx
> >          xor     %eax, %eax
> >          rep stosq
> > -        mov     %edx, %eax
>
> ... this one's going away.
>

What about

diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
index 89b5e2af88..6fa6ea93e5 100644
--- a/xen/arch/x86/boot/head.S
+++ b/xen/arch/x86/boot/head.S
@@ -231,12 +231,14 @@ __efi64_mb2_start:
         */
        and     $~15, %rsp

+       /* Move away magic number, we need it later but we need to use %eax=
 */
+        mov     %eax, %edx
+
        /*
         * Initialize BSS (no nasty surprises!).
         * It must be done earlier than in BIOS case
         * because efi_multiboot2_prelude() touches it.
         */
-        mov     %eax, %edx
        lea     __bss_start(%rip), %edi
        lea     __bss_end(%rip), %ecx
        sub     %edi, %ecx

??

> > --- a/xen/arch/x86/efi/stub.c
> > +++ b/xen/arch/x86/efi/stub.c
> > @@ -17,7 +17,8 @@
> >   */
> >
> >  void __init noreturn efi_multiboot2(EFI_HANDLE ImageHandle,
> > -                                    EFI_SYSTEM_TABLE *SystemTable)
> > +                                    EFI_SYSTEM_TABLE *SystemTable,
> > +                                    const char *cmdline)
>
> While with ...
>
> > --- /dev/null
> > +++ b/xen/arch/x86/include/asm/efi.h
> > @@ -0,0 +1,18 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +
> > +#ifndef X86_ASM_EFI_H
> > +#define X86_ASM_EFI_H
> > +
> > +#include <xen/types.h>
> > +#include <asm/x86_64/efibind.h>
> > +#include <efi/efidef.h>
> > +#include <efi/eficapsule.h>
> > +#include <efi/eficon.h>
> > +#include <efi/efidevp.h>
> > +#include <efi/efiapi.h>
> > +
> > +void efi_multiboot2(EFI_HANDLE ImageHandle,
> > +                    EFI_SYSTEM_TABLE *SystemTable,
> > +                    const char *cmdline);
>
> ... the declaration now (supposedly) in scope the need for that earlier
> adjustment may be a little more obvious, you still ought to mention it
> in the description. If you did, you'd might have noticed that stub.c now
> also needs to include the new asm/efi.h, for the declaration to actually
> have its full intended effect.
>
> Jan

Done, both stub and normal code.

Frediano

