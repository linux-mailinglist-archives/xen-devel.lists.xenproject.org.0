Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 301449CDBBB
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2024 10:39:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.837018.1252935 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBsnR-0003gx-L6; Fri, 15 Nov 2024 09:39:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 837018.1252935; Fri, 15 Nov 2024 09:39:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBsnR-0003fT-HE; Fri, 15 Nov 2024 09:39:21 +0000
Received: by outflank-mailman (input) for mailman id 837018;
 Fri, 15 Nov 2024 09:39:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Tcl1=SK=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1tBsnQ-0003fL-56
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2024 09:39:20 +0000
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com
 [2607:f8b0:4864:20::c2c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7b140be0-a335-11ef-a0c7-8be0dac302b0;
 Fri, 15 Nov 2024 10:39:17 +0100 (CET)
Received: by mail-oo1-xc2c.google.com with SMTP id
 006d021491bc7-5ee9db85af0so869454eaf.0
 for <xen-devel@lists.xenproject.org>; Fri, 15 Nov 2024 01:39:17 -0800 (PST)
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
X-Inumbo-ID: 7b140be0-a335-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjI2MDc6ZjhiMDo0ODY0OjIwOjpjMmMiLCJoZWxvIjoibWFpbC1vbzEteGMyYy5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjdiMTQwYmUwLWEzMzUtMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNjYzNTU3LjM2MTA1Mywic2VuZGVyIjoiZnJlZGlhbm8uemlnbGlvQGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1731663556; x=1732268356; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UoFmVf6k6eJO106wGcAmef5cNSC0GosBuw0ID6B4UZc=;
        b=RuNDm0hlUPfXyMqvI7/8/z9dMOpctzxHiutrewk5UTiUUz8G+ktt9wDhKWs9uJ/muS
         zKivI0p2vIUXLCVrnId8s2uWqS5llel7u7gaEzF5kD5SjnJaHOZUPhgbM/gjwbkcpWIL
         bbm65qCviYIMagpXMfkXq8P/GR67xmYuicq48=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731663556; x=1732268356;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UoFmVf6k6eJO106wGcAmef5cNSC0GosBuw0ID6B4UZc=;
        b=QEoBP/gMOjNol0SLVBmYjnbiW5Vb8fMzd9H/5xk7Dz+bV6oM1btEgGanj4e2NtpDUc
         vLCmLLVEgM/cWh1gEW0PsnNdBnmnawwSadBKmUWlU/vHNp7ysQAbBT9PY6IDvi/fGYGi
         vICW1vLUTbmsOgb8WF7VTX9SarbtOzLadZqc2wKhSM6o4w6LuZfc5P7Wq66wNjUocilL
         1nkS0oCPMf5brRj+kGtv49sKaiSfD0x/ghlgXuXmOtleEizx4fMSMDHtecStjvfP5T9c
         7dqA4xvotXyyNHrQ6byY7/AW4h/kWep8SCT3joK8BuYYRwx5895ZPCiTAYE9Luuhg0iX
         hNuA==
X-Forwarded-Encrypted: i=1; AJvYcCWlKPSJ9AZn4J127dpt3AbK+wovq0AQmD5dx1AxvGBwSr/CRr1mWDV/Fr+C3CFaxi+bu8mfZ3mMW+k=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwRJwjvcl7w0I6+Lb7o6ljuWG28+hXEaVkuvFfnxLfdTayUubYe
	nu7l7f0/TBWeTCwBg0kDpT1esp/gZpOKZCGSZmGer0LJxueFQ3ZN8ztbivBr06tLpxHqbgi5Zyo
	m2RNG4sYafrGHz13AxuXL1O63qVF8V3RUno6zMA==
X-Google-Smtp-Source: AGHT+IGAvh9+Hm2R9cZjFbzsU6ZuAG0KLwSrywXt5C3anrnVL0e9JP3ZfdDJcl79mRnzTf3MkAyJJQB1lLLR/W3dcIU=
X-Received: by 2002:a05:6830:374c:b0:709:41c4:6a5 with SMTP id
 46e09a7af769-71a773bac06mr1186402a34.3.1731663556044; Fri, 15 Nov 2024
 01:39:16 -0800 (PST)
MIME-Version: 1.0
References: <20241114182219.1983073-1-andrew.cooper3@citrix.com> <990887c0-d76f-4f8a-a6a6-c3dca49dcb91@suse.com>
In-Reply-To: <990887c0-d76f-4f8a-a6a6-c3dca49dcb91@suse.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Fri, 15 Nov 2024 09:39:04 +0000
Message-ID: <CACHz=Zgwb1PPWQGgTap-O1UdhSBevZbiG=3ygs+TKe1e+2u+YA@mail.gmail.com>
Subject: Re: [PATCH] x86/boot: Fix comment about setting up the real mode stack
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	"Daniel P . Smith" <dpsmith@apertussolutions.com>, 
	Alejandro Vallejo <alejandro.vallejo@cloud.com>, Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 15, 2024 at 9:29=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 14.11.2024 19:22, Andrew Cooper wrote:
> > It may have taken a while, but it occurs to me that the mentioned commi=
t fixed
> > a second problem too.
> >
> > On entering trampoline_boot_cpu_entry(), %esp points at the trampoline =
stack,
> > but in a 32bit flat segment.  It happens to be page aligned.
> >
> > When dropping into 16bit mode, the stack segment operates on %sp, prese=
rving
> > the upper bits.  Prior to 1ed76797439e, the top nibble of %sp would dep=
end on
> > where the trampoline was placed in low memory, and only had a 1/16 chan=
ce of
> > being 0 and therefore operating on the intended stack.
> >
> > There was a 15/16 chance of using a different page in the trampoline as=
 if it
> > were the stack.  Therefore, zeroing %esp was correct, but for more reas=
ons
> > than realised at the time.
>
> I'm afraid I don't follow this analysis. Said commit replaced clearing of=
 %sp
> by clearing of %esp. That made no difference for anything using the 16-bi=
t
> register. I don't see how the top nibble of %sp could have been non-zero
> prior to that change.
>

I think it refers to 1ed76797439e, not this change.

> > Update the comment to explain why zeroing %esp is correct in all cases.=
  Move
> > it marginally earlier to when a 16bit stack segment is first loaded.
>
> The movement is fine, and the comment is fine by itself, too. It doesn't
> cover the significance of using 32-bit operand size, though (which may or=
 may
> not be relevant, to a fair degree depending on the above).
>

I assume a usage in the firmware, besides, we switch to 32/64 at some
point too so having the upper part 0 is safer in any case.

> Jan
>
> > --- a/xen/arch/x86/boot/trampoline.S
> > +++ b/xen/arch/x86/boot/trampoline.S
> > @@ -176,6 +176,12 @@ trampoline_boot_cpu_entry:
> >          mov     %eax,%gs
> >          mov     %eax,%ss
> >
> > +        /*
> > +         * The stack is at trampoline_phys + 64k, which for a 16bit st=
ack
> > +         * segment wants %sp starting at 0.
> > +         */
> > +        xor     %esp, %esp
> > +
> >          /* Switch to pseudo-rm CS, enter real mode, and flush insn que=
ue. */
> >          mov     %cr0,%eax
> >          dec     %eax
> > @@ -190,8 +196,6 @@ trampoline_boot_cpu_entry:
> >          mov     %ax,%es
> >          mov     %ax,%ss
> >
> > -        /* Initialise stack pointer and IDT, and enable irqs. */
> > -        xor     %esp,%esp
> >          lidt    bootsym(rm_idt)
> >          sti
> >
>

