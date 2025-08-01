Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB87B17FAC
	for <lists+xen-devel@lfdr.de>; Fri,  1 Aug 2025 11:54:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1067058.1432016 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhmSj-0003kI-ON; Fri, 01 Aug 2025 09:54:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1067058.1432016; Fri, 01 Aug 2025 09:54:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhmSj-0003hD-Lj; Fri, 01 Aug 2025 09:54:05 +0000
Received: by outflank-mailman (input) for mailman id 1067058;
 Fri, 01 Aug 2025 09:54:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3S8h=2N=cloud.com=edwin.torok@srs-se1.protection.inumbo.net>)
 id 1uhmSi-0003h7-Vb
 for xen-devel@lists.xenproject.org; Fri, 01 Aug 2025 09:54:04 +0000
Received: from mail-vk1-xa30.google.com (mail-vk1-xa30.google.com
 [2607:f8b0:4864:20::a30])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6e7d2c7d-6ebd-11f0-b895-0df219b8e170;
 Fri, 01 Aug 2025 11:53:53 +0200 (CEST)
Received: by mail-vk1-xa30.google.com with SMTP id
 71dfb90a1353d-5393d190351so671748e0c.1
 for <xen-devel@lists.xenproject.org>; Fri, 01 Aug 2025 02:53:53 -0700 (PDT)
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
X-Inumbo-ID: 6e7d2c7d-6ebd-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1754042032; x=1754646832; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rLxdK62h5Z5+hXxH7sgLi5WNFN/I/fN31BLN7hMZ91Y=;
        b=bGhLghtIO4JWBwFQVP1LZEUUXX67vaRIck/FxZMPCquCOST/k91b5yg2I6/RbmEhyF
         p1RT1YRuJMYGcTjySGz1Wybe4BWYTOoVqzs/uTHN7nJG3PlF6sr27NQ0Ej6rLj0Hs0cv
         4THgfLlNb3BnlQN+Cy7umX/OEhyBl8wTq/Rdg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754042032; x=1754646832;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rLxdK62h5Z5+hXxH7sgLi5WNFN/I/fN31BLN7hMZ91Y=;
        b=Li4sowgEJVMq0eRbbdv0663KPfVQ5vws1MAwStaQHlgOr3tcNtFS+fNmXHgeWbQsNI
         5FsqAu8T+yDufLLB8WeKs6539Uy3ER18HkwZK+E4LPmREqGW5n5Rwn8IKXJ12K8pJoTi
         fWzAX6TRhSpRAg+gNilNA+uiGwAgNW5T5Co4cW1vdBIjqM3Vspa2tkmvezNxV4C2CJgk
         c9kpGr2jaufPo3VPg/IbekWbwaJXOD7uoCyxvdoJH576KGEsfem1Ov05ycEUQLRuAOet
         LUb1kcdeMOoTyFuVFzCy9VLRN3sBXEEC845ePucsYBasmTRNqyr6hQ0ACH7wuMOkHbG/
         eLkg==
X-Forwarded-Encrypted: i=1; AJvYcCUufS4mYGSFJDZ4XrALiLzatSnVh9CZL+V+PVuzP6+KtuehuoWUfJduU2WwGkxvwiny8kn4eTG0odg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxEYg860a5rM6/getLWGnJDYP+VLNfGFqSxvg6X7jVm0IVWvmwf
	0p7tJC3ShXd8oBhRGU3c+4Tbowf3SqztnjK5oVlxgaVN9vDE024PaZesjOKFY8SNigeuxVNpN8P
	hRvhJLBm9o/YFZ3IIcZU548s7FhmihHBpMH0RT6cSlw==
X-Gm-Gg: ASbGncv+/YF8JnBcvY4y/2xVj4iyxrXyQs70wepN0aQCC5VwhK9tmfZhtw+OOUxhgX3
	YTqDiN5VfdGhGXMAnsiAq54WnUMdiHe1K2MaIgrGjjmiwO1gWTHLnvDtocrgYodDFKcGvvUAsOH
	24t8kXDj658xslM5YAAtlM1rViqq2Sy8Fa0CUtUH1jH0CYWone7DKxP2uc1E4YJZxzC1jPF2Z0H
	rTJ6NSdTg==
X-Google-Smtp-Source: AGHT+IFGMUFapmrZBzfTS/pSe/Orn6DNsdKFDQj1claoZubANUQT5ioNoRvTciRcGrRoMV2CpcDi9gwfn6PCfVkZVww=
X-Received: by 2002:a05:6122:2513:b0:539:1a61:9058 with SMTP id
 71dfb90a1353d-5391ce96bc1mr6908804e0c.3.1754042032134; Fri, 01 Aug 2025
 02:53:52 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1753372928.git.edwin.torok@cloud.com> <8d7f3eb14bee79c63af02b228fa02761ae2db6c5.1753372928.git.edwin.torok@cloud.com>
 <1b8a754f-608f-4439-9dca-1e18e12af1b4@suse.com>
In-Reply-To: <1b8a754f-608f-4439-9dca-1e18e12af1b4@suse.com>
From: Edwin Torok <edwin.torok@cloud.com>
Date: Fri, 1 Aug 2025 10:53:41 +0100
X-Gm-Features: Ac12FXxVlupEbgZ8QkTw163mDQQX0fj3oCeaV9xB18ST-ae4N_204fUPmkpOfys
Message-ID: <CAEfZLv=PH2d5JRTA_pcU1vaeuc2rshsYMxiDM-5PcBep4iA+_g@mail.gmail.com>
Subject: Re: [RFC PATCH v1 06/10] arch-x86/pmu.h: convert ascii art diagram to Unicode
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, andriy.sultanov@vates.tech, 
	boris.ostrovsky@oracle.com, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 31, 2025 at 4:35=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 25.07.2025 17:06, Edwin T=C3=B6r=C3=B6k wrote:
> > Using `aa2u` tool.
> >
> > Signed-off-by: Edwin T=C3=B6r=C3=B6k <edwin.torok@cloud.com>
>
> How come the use of that tool made ...
>
> > --- a/xen/include/public/arch-x86/pmu.h
> > +++ b/xen/include/public/arch-x86/pmu.h
> > @@ -75,8 +75,10 @@ DEFINE_XEN_GUEST_HANDLE(xen_pmu_regs_t);
> >  #define PMU_SAMPLE_PV      (1<<3) /* Sample from a PV guest */
> >
> >  /*
> > - * Architecture-specific information describing the state of the guest=
 at
> > - * the time of a PMU interrupt.
> > + * Architecture-specific information describing state of the guest at
> > + * the time of PMU interrupt.
> > + * Even if the interrupt arrived while inside Xen, this will always co=
ntain
> > + * the guest's state.
> >   */
> >  struct xen_pmu_arch_guest {

Thanks for spotting, according to my evolog this one ended up here
while fixing a rebase conflict:
```
=E2=97=8B  lrwoxosk hidden edwin.torok@cloud.com 2025-07-24 13:20:56 215f9e=
58
=E2=94=82  arch-x86/pmu.h: convert ascii art diagram to Unicode
=E2=94=82  -- operation 073584199528 (2025-07-24 13:20:56) snapshot working=
 copy
=E2=94=82  diff --git a/xen/include/public/arch-x86/pmu.h
b/xen/include/public/arch-x86/pmu.h
=E2=94=82  index 0000000000..4dc3d9a20a 100644
=E2=94=82  --- a/xen/include/public/arch-x86/pmu.h
=E2=94=82  +++ b/xen/include/public/arch-x86/pmu.h
=E2=94=82  @@ -75,8 +75,10 @@
=E2=94=82   #define PMU_SAMPLE_PV      (1<<3) /* Sample from a PV guest */
=E2=94=82
=E2=94=82   /*
=E2=94=82  - * Architecture-specific information describing the state of th=
e guest at
=E2=94=82  - * the time of a PMU interrupt.
=E2=94=82  + * Architecture-specific information describing state of the gu=
est at
=E2=94=82  + * the time of PMU interrupt.
=E2=94=82  + * Even if the interrupt arrived while inside Xen, this will al=
ways contain
=E2=94=82  + * the guest's state.
=E2=94=82    */
=E2=94=82   struct xen_pmu_arch_guest {
=E2=94=82       union {
=E2=94=82  @@ -149,178 +151,89 @@
=E2=94=82   typedef struct xen_pmu_arch xen_pmu_arch_t;
=E2=94=82   DEFINE_XEN_GUEST_HANDLE(xen_pmu_arch_t);
=E2=94=82
=E2=94=82  -
=E2=94=82   /* Memory layout:
=E2=94=82  -<<<<<<< Conflict 1 of 1
=E2=94=82  -+++++++ Contents of side #1
```

>
> ... this comment change, or yet more interesting, ...
>
> > --- a/xen/include/public/pmu.h
> > +++ b/xen/include/public/pmu.h
> > @@ -148,7 +148,7 @@ struct xen_pmu_hv_stacktrace {
> >      * arrives while in Xen.
> >      * */
> >      struct xen_pmu_arch_guest guest;
> > -#define XEN_PMU_STACKTRACE_PAD 48
> > +#define XEN_PMU_STACKTRACE_PAD 56
> >      uint8_t pad2[XEN_PMU_STACKTRACE_PAD];
> >  };
>
> ... this value in the public interface?

Thanks for spotting, it doesn't belong in this commit.

I would assume that this happened by squashing a commit into the wrong
place, or by editing the wrong commit while rebasing.
Luckily I use 'jj', and it has an evolog that stores the full history
of how a commit changed over split/squash/rebase, so I don't have to
guess, but can give you a precise answer.

My evolog says that this change came from editing the source code
while having the wrong commit checked out (I kept tweaking those
values):
```
=E2=97=8B  lrwoxosk hidden edwin.torok@cloud.com 2025-07-24 13:46:44 bfa295=
64
=E2=94=82  arch-x86/pmu.h: convert ascii art diagram to Unicode
=E2=94=82  -- operation 3f48136a1b6a (2025-07-24 13:46:44) snapshot working=
 copy
=E2=94=82  diff --git a/xen/include/public/pmu.h b/xen/include/public/pmu.h
=E2=94=82  index 1879914ea6..6366a79169 100644
=E2=94=82  --- a/xen/include/public/pmu.h
=E2=94=82  +++ b/xen/include/public/pmu.h
=E2=94=82  @@ -148,7 +148,7 @@
=E2=94=82       * arrives while in Xen.
=E2=94=82       * */
=E2=94=82       struct xen_pmu_arch_guest guest;
=E2=94=82  -#define XEN_PMU_STACKTRACE_PAD 48
=E2=94=82  +#define XEN_PMU_STACKTRACE_PAD 56
=E2=94=82       uint8_t pad2[XEN_PMU_STACKTRACE_PAD];
=E2=94=82   };
```

Before I submit the next version I'll check whether the other hunks
ended up in the right place  after all the
squashing/rebasing/splitting

Best regards,
--Edwin
>
> Jan

