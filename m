Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 752861FC145
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2020 23:58:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlJaM-0003oa-B0; Tue, 16 Jun 2020 21:57:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6FtR=75=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1jlJaK-0003oV-Nf
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2020 21:57:36 +0000
X-Inumbo-ID: 630c1784-b01c-11ea-bb8b-bc764e2007e4
Received: from mail-wm1-x344.google.com (unknown [2a00:1450:4864:20::344])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 630c1784-b01c-11ea-bb8b-bc764e2007e4;
 Tue, 16 Jun 2020 21:57:36 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id b82so4296184wmb.1
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2020 14:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9t7wxTVD8cO8pPAaDjStEF+l/wut0mddPi/6BK89dOg=;
 b=qgIXO1qmu0sv2u+KrkYrTHr83dTJvCb3KiokKLazVP36YFuvp5FCoYq+3UZgGsMMY5
 zjKzn8bQULro+x7/ruZB/90ZPMH0BircWMAMqrvBlwUWdw5CKfwJssTcNVXqn8mwigFm
 bCmha/wDnJhB4GLoyDPy42iI3017TwfUsXCX2x5Z7o8MgEPJy+LA9YYBNjxiLbtjVdCg
 Wh7npOMKZQg35xd1PkB5M25sFlEPY3WVZGyYOv53b8MwsmVZzZkvHAqf+Gc4FCItrPnI
 TOTjmxbcL3+ycAS69HLN9vHz64xBYI6+7GtKClWU0NTwbkI5PfQiVybXKzt0MQRRy07T
 Tjaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9t7wxTVD8cO8pPAaDjStEF+l/wut0mddPi/6BK89dOg=;
 b=thHSJAPpsg5TAZ/n66Arb8Z4/eOztlAoIuhw2evlORECYsFpgT4miNMw4rlhPojGQ8
 xoA/2iv9lH/pX6YJkCVBORZN5PW8tVhEaJRW/2MiRHzaCtT89teSutfr1SGMvoRP5uL4
 3TkTqxgAEClueznUKRAUJk33Ax+ZF/XAU244MTDqKkJle3k2Ih8wL2d6/DPA2mVFv8xi
 OOQDHoHHRRX6wMeztJUGXQ8zkiBiTmWRozaURQwZvj3snYzdIgyR1jR/p6kuiEGkM4LN
 zNQ5x2Lk8epp538BwITSCMxpXZQ4x9SP59ee44+cstU00WgzhqpClzibyTYIhVg1GLBy
 PmGA==
X-Gm-Message-State: AOAM533v/N1NaOvPoz6Wen4fKpBuNNF42MatZKHRH4snNXIvb7x8lJeC
 PCbtd5LIK2rtxtauhG8m+KlDGala5i9+kIMvyDE=
X-Google-Smtp-Source: ABdhPJzHtjdXH29P7nu4e/iRkQo2JI/PBKz68nlc1fAdoSZelJcYuemXhorKb6DENdA+mTr+/k+Soigc21POsIvpDBY=
X-Received: by 2002:a1c:230f:: with SMTP id j15mr5421257wmj.100.1592344655157; 
 Tue, 16 Jun 2020 14:57:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200616175913.7368-1-julien@xen.org>
 <20200616175913.7368-3-julien@xen.org>
 <alpine.DEB.2.21.2006161425480.24982@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2006161425480.24982@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Tue, 16 Jun 2020 22:57:24 +0100
Message-ID: <CAJ=z9a0Wo2Vz=q-ApY-16p4xBnDckUhe73z9v4W4av7FmwMjKQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] xen/arm: Mitigate straight-line speculation for SMC
 call
To: Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Paul Durrant <paul@xen.org>, Andre Przywara <Andre.Przywara@arm.com>,
 Julien Grall <jgrall@amazon.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
 "Xen.org security team" <security@xenproject.org>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, 16 Jun 2020 at 22:34, Stefano Stabellini <sstabellini@kernel.org> wrote:
>
> On Tue, 16 Jun 2020, Julien Grall wrote:
> > From: Julien Grall <jgrall@amazon.com>
> >
> > SMC call will update some of registers (typically only x0) depending on
>   ^a SMC call
>
> > the arguments provided.
> >
> > Some CPUs can speculate past a SMC instruction and potentially perform
> > speculative access to emrmoy using the pre-call values before executing
>                         ^ memory
>
> > the SMC.
> >
> > There is no known gadget available after the SMC call today. However
> > some of the registers may contain values from the guest and are expected
> > to be updated by the SMC call.
> >
> > In order to harden the code, it would be better to prevent straight-line
> > speculation from an SMC. Architecturally executing the speculation
>                    ^ a? any?

"any" might be better.

>
>
> > barrier after every SMC can be rather expensive (particularly on core
> > not SB). Therefore we want to mitigate it diferrently:
>        ^ not SB capable?                    ^ differently

It might be better to say "which doesn't support ARMv8.0-SB"

> >   */
> >  #define arm_smccc_1_1_smc(...)                                  \
> >      do {                                                        \
> >          __declare_args(__count_args(__VA_ARGS__), __VA_ARGS__); \
> >          asm volatile("smc #0\n"                                 \
> > +                     "b 1f\n"                                   \
> > +                     ASM_SB                                     \
> > +                     "1:\n"                                     \
> >                       __constraints(__count_args(__VA_ARGS__))); \
> >          if ( ___res )                                           \
> >          *___res = (typeof(*___res)){r0, r1, r2, r3};            \
> > diff --git a/xen/include/asm-arm/system.h b/xen/include/asm-arm/system.h
> > index 65d5c8e423d7..e33ff4e0fc39 100644
> > --- a/xen/include/asm-arm/system.h
> > +++ b/xen/include/asm-arm/system.h
> > @@ -33,6 +33,14 @@
> >  #define smp_mb__before_atomic()    smp_mb()
> >  #define smp_mb__after_atomic()     smp_mb()
> >
> > +/*
> > + * Speculative barrier
> > + * XXX: Add support for the 'sb' instruction
> > + */
> > +#define ASM_SB "dsb nsh \n isb \n"
>
> Why not ';' ? Anyway it doesn't matter.

Per [1] and [2], a semicolon is not portable as some assemblers may
treat anything after it as a comment.

This reminds me that I have been using semicolons in entry.S. I
should probably have a look to avoid them.

Cheers,

[1] https://developer.arm.com/docs/dui0801/d/structure-of-assembly-language-modules/syntax-of-source-lines-in-assembly-language
[2] https://gcc.gnu.org/onlinedocs/gcc/Extended-Asm.html#AssemblerTemplate

