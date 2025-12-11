Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0170FCB5F33
	for <lists+xen-devel@lfdr.de>; Thu, 11 Dec 2025 13:53:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1184047.1506592 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTgAc-0004b3-25; Thu, 11 Dec 2025 12:53:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1184047.1506592; Thu, 11 Dec 2025 12:53:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTgAb-0004ZS-VG; Thu, 11 Dec 2025 12:53:21 +0000
Received: by outflank-mailman (input) for mailman id 1184047;
 Thu, 11 Dec 2025 12:53:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oCI8=6R=gmail.com=samaan.dehghan@srs-se1.protection.inumbo.net>)
 id 1vTgAa-0004YM-9D
 for xen-devel@lists.xenproject.org; Thu, 11 Dec 2025 12:53:20 +0000
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [2607:f8b0:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5ce116b0-d690-11f0-b15b-2bf370ae4941;
 Thu, 11 Dec 2025 13:53:18 +0100 (CET)
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-297f35be2ffso622385ad.2
 for <xen-devel@lists.xenproject.org>; Thu, 11 Dec 2025 04:53:17 -0800 (PST)
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
X-Inumbo-ID: 5ce116b0-d690-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765457596; x=1766062396; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tSU2plybhLrgyCN7UmWG+2960KnH0dAyA+3GYCfpQhE=;
        b=iA6SNDzQpmySuVes1yd1niVdYz2//SU+llsgSOiTuB8NTn+Gdo6eMEqqEc33B4o8No
         4aVhp82+B9OghwrYTR/FncfhYpWVaJQSO1szlXB9r4bP2JQTj00px+5D5BXUDXVjKruf
         HPq3SkV3UUS+GAfxDDe0vLtJDuTaryYrm7P25eQeGW7d0FpkrcF9SWNy70TBBGD2Lj8o
         qn2E/j7RW8e5XPerN7a6twKLfVbQegzK76ttKOSCVUWDca33QzDgz7RCac1JYwr7XgpL
         psR0ZPRvDcF1jnEWrgaZFWOJZcZR35YZpK7O7eTQ69AiKnZHe5GRoz+feH1EPimOBO52
         J2hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765457596; x=1766062396;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tSU2plybhLrgyCN7UmWG+2960KnH0dAyA+3GYCfpQhE=;
        b=XUan3tzm5iInJgoxw2N/s8cfjxz7ry557OJgKUK6ayQLjeqqhiT1iGO0RPTCKfup1e
         Hn34SUIEfAP2IDMxscTRZi/CjCeJkxP/8yfLDdSev1utE817XTWYzsr5CyzzN+ec+kwg
         xDK+OPICJ3Mq/GioJqKVFitIqvoE8qtVHXpABiYvIiHJcsBUt80eTAtfw6ohKyAWy474
         PzlaMJPheToGfvSxev3E+tLNmrA7ysIvnLxRsGa5tFAkQ9hGqVu7K6FA7xJGpI8eXoND
         bI+nrJk+nCwNatqrGOXGijElNDq/EfP6W9qHET7n5qCzNNP0qlYy7TKpE+4/GDWLnTDp
         nClg==
X-Gm-Message-State: AOJu0YxjF18lB7OXtFJwSpBHQEPknVXPFRgczVsHDIfMcoi0qq2eMAW4
	7gJmDYJLh79+2PTtY2HY66p4Iz7duB3PbY+VaHDbqsKp1Bhd1Mv++RrqlNanDzEKCnsrWLsw+Zn
	miyX1YL4kgTkk83iv6ftB+jLpONmmXw==
X-Gm-Gg: AY/fxX6Fh9visEoQTPTquKW+krq3Ulzoalb0lLXoMRI5/HzC0daTEVpI6IVE074HGw4
	TsTKCCpsAudm4YCOjlu3/GLyj7QvoirxjEMzUdH5OdJm0ihcYNR/CsjYBVBLwD6OeQjnVNnxYZQ
	45xqDF5ORWEu4/Nqc+KhJ2Kvy1RwrAA7Y5OpiE66L+5iGQ0yKzoNV7599ckANZVnVFsS1sXSFid
	eFi6yrGm4GPmiQLJwdcChjCjlapY0KIzQboRihpWyxMu1E4ixq75gUjflfagWPDHWCiudXihcug
	b0rETcf7rhYlgHhqetZO7nyO
X-Google-Smtp-Source: AGHT+IFUEUBOkjA3mCUzNTlRBT16P4XNRgwRuxDJ1n+ZVyV89wFdKoWb8TVyjpmZdom549cG2CdvMH0IxglPXZV0sr8=
X-Received: by 2002:a17:903:98d:b0:29e:9387:f2b7 with SMTP id
 d9443c01a7336-29ec229d253mr57583835ad.11.1765457596312; Thu, 11 Dec 2025
 04:53:16 -0800 (PST)
MIME-Version: 1.0
References: <bd6686e7fc0756e929334792b94ddd66bde125c4.1765239102.git.samaan.dehghan@gmail.com>
 <bb575726fe0ac783121e563b1c92f81f51e41f75.1765420376.git.samaan.dehghan@gmail.com>
 <ff441352-ee38-4357-9479-9398c7df356d@xen.org>
In-Reply-To: <ff441352-ee38-4357-9479-9398c7df356d@xen.org>
From: Saman Dehghan <samaan.dehghan@gmail.com>
Date: Thu, 11 Dec 2025 06:53:05 -0600
X-Gm-Features: AQt7F2ogxwumaI9N1aS8g7Y0ccorogLjZ0WcYzsKD__J15wB9qBGB7i-VaGlgOo
Message-ID: <CAHFNDNhVEdM9G3Lgx1mJfdKz2OntdVZ9Ja14GQHSjWvWOp09EA@mail.gmail.com>
Subject: Re: [PATCH v2] xen/arm64: Add support Clang build on arm64
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, 
	Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 11, 2025 at 3:33=E2=80=AFAM Julien Grall <julien@xen.org> wrote=
:
>
> Hi Saman,
>
> A bit of process first. Usually, when sending a v2, a new thread is
> started (IOW, this is not sent in reply to v1).

Hi Julien,

Thanks :)

>
> On 11/12/2025 02:39, Saman Dehghan wrote:
> > This patch enables building Xen on arm64 architecture using the Clang c=
ompiler.
> > Changes include:
> > - Add explicit -march=3Darmv8 flag for arm64 builds.
> > - Add `__attribute__((target("fp-armv8")))` to `vfp_save_state` and
> >    `vfp_restore_state` functions when building with Clang to allow
> >    FP instructions despite `-mgeneral-regs-only`.
> >
> > Signed-off-by: Saman Dehghan <samaan.dehghan@gmail.com>
> > ---
> >   README                   | 2 ++
> >   xen/arch/arm/arch.mk     | 1 +
> >   xen/arch/arm/arm64/vfp.c | 6 ++++++
> >   3 files changed, 9 insertions(+)
> >
> > diff --git a/README b/README
> > index 889a4ea906..67c1aa7fe6 100644
> > --- a/README
> > +++ b/README
> > @@ -45,6 +45,8 @@ provided by your OS distributor:
> >         - For ARM:
> >           - GCC 5.1 or later
> >           - GNU Binutils 2.25 or later
> > +        or
> > +        - Clang/LLVM 11 or later
> >         - For RISC-V 64-bit:
> >           - GCC 12.2 or later
> >           - GNU Binutils 2.39 or later
> > diff --git a/xen/arch/arm/arch.mk b/xen/arch/arm/arch.mk
> > index 9c4bedfb3b..bcf548069b 100644
> > --- a/xen/arch/arm/arch.mk
> > +++ b/xen/arch/arm/arch.mk
> > @@ -13,6 +13,7 @@ ifeq ($(CONFIG_MPU),y)
> >   CFLAGS-$(CONFIG_ARM_64) +=3D -march=3Darmv8-r
> >   else
> >   CFLAGS-$(CONFIG_ARM_64) +=3D -mcpu=3Dgeneric
> > +CFLAGS-$(CONFIG_ARM_64) +=3D -march=3Darmv8
> >   endif
> >   CFLAGS-$(CONFIG_ARM_64) +=3D -mgeneral-regs-only # No fp registers et=
c
> >   $(call cc-option-add,CFLAGS-$(CONFIG_ARM_64),CC,-mno-outline-atomics)
> > diff --git a/xen/arch/arm/arm64/vfp.c b/xen/arch/arm/arm64/vfp.c
> > index c4f89c7b0e..51fd2ddc54 100644
> > --- a/xen/arch/arm/arm64/vfp.c
> > +++ b/xen/arch/arm/arm64/vfp.c
> > @@ -46,6 +46,9 @@ static inline void restore_state(const uint64_t *fpre=
gs)
> >                    : : "Q" (*fpregs), "r" (fpregs));
> >   }
> >
> > +#if defined(CONFIG_CC_IS_CLANG)
> > +__attribute__((target("fp-armv8")))
> > +#endif
>
> Based on Jan's comment, I am a bit puzzled why adding #ifdef is
> sufficient. In fact, I do agree with Jan, my understanding of
> target(...) is this will impact the ABI.
>
> I haven't experienced any issue with the C side yet. But I know in the
> Rust world (they also have an LLVM backend), they decided to prevent
> enabling fp/neon [1] at the function level.
>
> Did you find any documentation that would suggest this is safe?
>
> Now regarding the issue you mentioned in v1:
>
>  > On top of those, `READ_SYSREG(FPSR)`, `READ_SYSREG(FPCR)`,
>  > `WRITE_SYSREG(v->arch.vfp.fpsr, FPSR)`and
>  > `WRITE_SYSREG(v->arch.vfp.fpcr, FPCR)` using FP.
>  > I think I cannot apply __attribute__ on statements.
>
> Do you mean the compiler will complain that you are trying to access
> FPCR/FPSR if you don't add the __atribute__ at the function level?
>
> If so, what you could possibly do is either rewriting the functions in
> assembly or open-code the "{WRITE, READ}_SYSREG()" and add a line
> ".arch_extension fp".

I couldn't find any documentation to suggest that it is safe. I will
do what you and Jan suggested and use ".arch_extension fp".

~Saman

>
> Cheers,
>
> [1] https://github.com/llvm/llvm-project/issues/110632
>
> --
> Julien Grall
>

