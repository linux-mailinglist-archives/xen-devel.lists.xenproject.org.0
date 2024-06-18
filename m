Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8641590C4F7
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jun 2024 10:37:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.742836.1149709 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJULP-0003ad-Dr; Tue, 18 Jun 2024 08:37:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 742836.1149709; Tue, 18 Jun 2024 08:37:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJULP-0003Yd-Ab; Tue, 18 Jun 2024 08:37:35 +0000
Received: by outflank-mailman (input) for mailman id 742836;
 Tue, 18 Jun 2024 08:37:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GTcF=NU=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1sJULO-0003YX-F1
 for xen-devel@lists.xenproject.org; Tue, 18 Jun 2024 08:37:34 +0000
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [2607:f8b0:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 00c6f9a1-2d4e-11ef-b4bb-af5377834399;
 Tue, 18 Jun 2024 10:37:32 +0200 (CEST)
Received: by mail-ot1-x334.google.com with SMTP id
 46e09a7af769-6f9fbec4fd9so3000683a34.2
 for <xen-devel@lists.xenproject.org>; Tue, 18 Jun 2024 01:37:32 -0700 (PDT)
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
X-Inumbo-ID: 00c6f9a1-2d4e-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1718699851; x=1719304651; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eb0RXj6kXsdM0uSSP81X1dIWEztXTh0vf9AdUTcavuo=;
        b=FGjRBK0IItjBr4lgVSi62Aj8Wm22Qiktp8tQHn26rptUohjopAIHsEKCCqr+zdfdJm
         aSBY9oaaL+j9UabWS56mzuptc7Yr0UoyCt53ZQM15itl6UN/o8LzCTaVryaKIthIFhMq
         RPNn05k23uxqR3abv2pQwBJPasS/RQuEAdtbk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718699851; x=1719304651;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eb0RXj6kXsdM0uSSP81X1dIWEztXTh0vf9AdUTcavuo=;
        b=g8TY/PNk+nz5CMMiiVz8rhehSdgdM1pGMnwjVo7myAbLEcJwi0OGoYGnSHAyj5LSZc
         vYXHIReg0E71IEcRN9z+TkJL7BJ6q2/LNxFjWQTpt99wVrewinv81BFclxQ2p5Vx7J+k
         LhJU1IgJ0TTeGk0OJKUF4CrErOLg8QumejisgMNoAW/JbVJSsrlcLGuceQAwk3s2lxNR
         JDrGIKXe9j/0KJ8pqEjL4H4VKd2qAjSKwQFcql7wwnR2jOBeO64w/fsGSfySskzHQgtE
         VxqF10sVAgS2xKrU2CPFUCQYNItWhPqNa8OCEQofN+yh43B6MS0TNjXoHPBUlF5S8Rni
         YWXA==
X-Forwarded-Encrypted: i=1; AJvYcCUpMiPSDjB0cM4hVP0L+p+pkSgyrdmk7pSg1h6cEXwprh8itThPKfY1urbhACnSP2585KZeXVVjTTPUMfY+j4kPyTlxtnAbyjqyjbx62y8=
X-Gm-Message-State: AOJu0YyQEZ2tXRfrDqOR+ErNryXpU4gKdUgWKrekV4R+h7cCeYAXbCD1
	2dhbL7REd8EQkr9L6pBK9pu4gTcBZUEvKxOIG7NPIQjJYFyo/j5l4LyIkIqP2yBoSoXa098SlZb
	DaAdBamnaczbiGah6Tzk+y+OlYr9jShhVYpNMvQ==
X-Google-Smtp-Source: AGHT+IEWkf5j2W5kw2iqzjVXFFr/KNj2UxQ6QnKHSgfx22Hyq9qpLr4BXiXOgbfkFgo2DeJ1XRr/iFXuaj+25RD/LPA=
X-Received: by 2002:a05:6870:b011:b0:254:a89e:acca with SMTP id
 586e51a60fabf-2584258a3d9mr12682841fac.0.1718699850938; Tue, 18 Jun 2024
 01:37:30 -0700 (PDT)
MIME-Version: 1.0
References: <20240617141303.53857-1-frediano.ziglio@cloud.com>
 <2fe6ef97-84f2-4bf4-870b-b0bb580fa38f@suse.com> <ZnBKDRWi_2cO6WbA@macbook>
In-Reply-To: <ZnBKDRWi_2cO6WbA@macbook>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Tue, 18 Jun 2024 09:37:08 +0100
Message-ID: <CACHz=Zg4Zoyr4KNeig4yDDNUxvV325beJEyT-L-K0a+FHp7oDg@mail.gmail.com>
Subject: Re: [PATCH] x86/xen/time: Reduce Xen timer tick
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, 
	Dave Hansen <dave.hansen@linux.intel.com>, Borislav Petkov <bp@alien8.de>, 
	Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>, 
	xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 17, 2024 at 3:37=E2=80=AFPM Roger Pau Monn=C3=A9 <roger.pau@cit=
rix.com> wrote:
>
> On Mon, Jun 17, 2024 at 04:22:21PM +0200, Jan Beulich wrote:
> > On 17.06.2024 16:13, Frediano Ziglio wrote:
> > > Current timer tick is causing some deadline to fail.
> > > The current high value constant was probably due to an old
> > > bug in the Xen timer implementation causing errors if the
> > > deadline was in the future.
> > > This was fixed in Xen commit:
> > > 19c6cbd90965 xen/vcpu: ignore VCPU_SSHOTTMR_future
> >
> > And then newer kernels are no longer reliably usable on Xen older than
> > this?
>
> I think this should reference the Linux commit that removed the usage
> of VCPU_SSHOTTMR_future on Linux itself, not the change that makes Xen
> ignore the flag.
>

Yes, Linux kernel stopped using this flag since 2016 with commit
c06b6d70feb32d28f04ba37aa3df17973fd37b6b, "xen/x86: don't lose event
interrupts", I'll add it in the commit message.

> > > --- a/arch/x86/xen/time.c
> > > +++ b/arch/x86/xen/time.c
> > > @@ -30,7 +30,7 @@
> > >  #include "xen-ops.h"
> > >
> > >  /* Minimum amount of time until next clock event fires */
> > > -#define TIMER_SLOP 100000
> > > +#define TIMER_SLOP 1000
> >
> > It may be just the lack of knowledge of mine towards noadays's Linux'es
> > time handling, but the change of a value with this name and thus
> > commented doesn't directly relate to "timer tick" rate. Could you maybe
> > help me see the connection?
>
> The TIMER_SLOP define is used in min_delta_{ns,ticks} field, and I
> think this is wrong.
>
> The min_delta_ns for the Xen timer is 1ns.  If Linux needs some
> greater min delta than what the timer interface supports it should be
> handled in the generic timer code, not open coded at the definition of
> possibly each timer implementation.
>

I think this is done to reduce potential event handling frequency, in
some other part of timer code (in kernel/time/clockevents.c) there's a
comment "Deltas less than 1usec are pointless noise".
I think it's hard for a software to get a frequency so high so I
didn't propose 1ns.
What are you suggesting? To put 1ns and see what happens? Is there any
proper test code for this?

> Thanks, Roger.

Frediano

