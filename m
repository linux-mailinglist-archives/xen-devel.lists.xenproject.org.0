Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF69B13CCE
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jul 2025 16:18:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1061618.1427215 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugOfc-000167-Bp; Mon, 28 Jul 2025 14:17:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1061618.1427215; Mon, 28 Jul 2025 14:17:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugOfc-00014g-8x; Mon, 28 Jul 2025 14:17:40 +0000
Received: by outflank-mailman (input) for mailman id 1061618;
 Mon, 28 Jul 2025 14:17:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+J0z=2J=cloud.com=edwin.torok@srs-se1.protection.inumbo.net>)
 id 1ugOfb-00014a-4m
 for xen-devel@lists.xenproject.org; Mon, 28 Jul 2025 14:17:39 +0000
Received: from mail-vk1-xa2a.google.com (mail-vk1-xa2a.google.com
 [2607:f8b0:4864:20::a2a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9a8870ab-6bbd-11f0-b895-0df219b8e170;
 Mon, 28 Jul 2025 16:17:34 +0200 (CEST)
Received: by mail-vk1-xa2a.google.com with SMTP id
 71dfb90a1353d-53140c33563so2891776e0c.3
 for <xen-devel@lists.xenproject.org>; Mon, 28 Jul 2025 07:17:34 -0700 (PDT)
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
X-Inumbo-ID: 9a8870ab-6bbd-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1753712253; x=1754317053; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gClXliXh3WUc+gxYVgWTIQydh9qLyZqFB8msC5WNDao=;
        b=ecDBMRfFwkC2Y/z7B0/ipOfXlRrW0NV5Sbv+g3UGZP33aKxU6atWRGpoxtIiz3WALD
         F9k+35D3DcQ6is55kVPyOuzOEJ8rkJkwEK9MwZ6l8OhA7Vz3HvKKrnUZWwrUFU5kwQ9h
         vl7pGvxsAIAMuRYRvIXWiDpgqDaLwYP/AZTek=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753712253; x=1754317053;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gClXliXh3WUc+gxYVgWTIQydh9qLyZqFB8msC5WNDao=;
        b=rlfmMvhYicZr08rPgrUu6SJr5vz7fvMcoNmomknwTbFL2C7TeDoVqxLpgr6wp7JyvJ
         QarpaA4pSP02U9A2TdT4Kpy/eJeic1YAPa3npHRVWu3M71k3ziYWFjy0DDOmrNWEHbcq
         Ps9vSxkTP+LfxhCxXGIm3+pESAyXUThyYsGQm86IEZ0V0MvKkwb1RSsrqLMKM53gKrJh
         iY2N7Mon6NXXs0rBbnKLKzn/BmZirDNKZZxeeNxdehcj5jev8UIbKiqEVR3oXInKNIJc
         2uAIuGAMEZDOiagBYbUuU0WLaxLN3Ommzq5VB+bkZ429f71NNoeT0VcjYX24sAB4duiT
         Z5pw==
X-Gm-Message-State: AOJu0YwH8mLYDnX8sWvp+gWpxjbxucyPnYsFR6spw6ZObTIvHdIr1tz3
	OpdYab3SblLjP7wqEBPtXi23yzudhL8wFPNtaDn741yExM7CDJIRlohIWMHvc7eyENdGSVZGTgj
	bfzqr/ruGrlfJz51Mhly43BABPHeYs1aiUYctGilQuQ==
X-Gm-Gg: ASbGncsyaME6KUy9Gg/wJkWJJB0+ePWexyoZsxXonffw8b6dfBQ3jkgY/73LHuFmfIr
	9jxIwxmqH7bLhTbz+Lg3RiMTuJfFgeFSNobbstuTUruFDnH9aH2+ET6+xF4+Rah46y4PYHrVP86
	ZLZvzFqWT4F2WQrI2Ru6b9C7XIOVNDVz51kTND2QCwmQpAH6rdJYelOeKUsSuL3Kqd5vI/+eiIj
	1GoYyMdIw==
X-Google-Smtp-Source: AGHT+IHnmoCyjKkf+YHXZS7uo+6bP46IaNQfnAfYdthIFrlgGjapPvt92CRnM1K9mATM7VoU59IXkrmhrv0OYQCTYwE=
X-Received: by 2002:a05:6122:2a4f:b0:534:765a:8c3c with SMTP id
 71dfb90a1353d-538db529f15mr4482003e0c.5.1753712252723; Mon, 28 Jul 2025
 07:17:32 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1753372928.git.edwin.torok@cloud.com> <ce2375387dcc5e00c3d55e903d9a2180eadb8685.1753372928.git.edwin.torok@cloud.com>
 <2874ee13-a978-4331-9c7e-70d4fcd11727@citrix.com>
In-Reply-To: <2874ee13-a978-4331-9c7e-70d4fcd11727@citrix.com>
From: Edwin Torok <edwin.torok@cloud.com>
Date: Mon, 28 Jul 2025 15:17:21 +0100
X-Gm-Features: Ac12FXziJSm4cCw9awo9NLk68KeoEfB96RxbABW30G0rlCUddQxLeEA0ojCYODE
Message-ID: <CAEfZLvkFCMq8snNOEOKjH0x=QDcnYJx2XrGOi+rUO+XPw-pRVw@mail.gmail.com>
Subject: Re: [RFC PATCH v1 04/10] vpmu.c: factor out register conversion
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	andriy.sultanov@vates.tech, boris.ostrovsky@oracle.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 28, 2025 at 11:25=E2=80=AFAM Andrew Cooper
<andrew.cooper3@citrix.com> wrote:
>
> On 25/07/2025 4:06 pm, Edwin T=C3=B6r=C3=B6k wrote:
> > diff --git a/xen/arch/x86/cpu/vpmu.c b/xen/arch/x86/cpu/vpmu.c
> > index 7be79c2d00..713311a1ac 100644
> > --- a/xen/arch/x86/cpu/vpmu.c
> > +++ b/xen/arch/x86/cpu/vpmu.c
> > @@ -160,6 +160,31 @@ static inline struct vcpu *choose_hwdom_vcpu(void)
> >      return hardware_domain->vcpu[idx];
> >  }
> >
> > +static inline void vpmu_convert_regs(struct xen_pmu_regs *r, uint64_t =
*flags,
> > +                                     struct vcpu *sampled,
> > +                                     const struct cpu_user_regs *cur_r=
egs) {
> > +  r->ip =3D cur_regs->rip;
> > +  r->sp =3D cur_regs->rsp;
> > +  r->flags =3D cur_regs->rflags;
> > +
> > +  if (!is_hvm_vcpu(sampled)) {
> > +    r->ss =3D cur_regs->ss;
> > +    r->cs =3D cur_regs->cs;
> > +    if (!(sampled->arch.flags & TF_kernel_mode))
> > +      *flags |=3D PMU_SAMPLE_USER;
> > +  } else {
> > +    struct segment_register seg;
> > +
> > +    hvm_get_segment_register(sampled, x86_seg_cs, &seg);
> > +    r->cs =3D seg.sel;
> > +    hvm_get_segment_register(sampled, x86_seg_ss, &seg);
> > +    r->ss =3D seg.sel;
> > +    r->cpl =3D seg.dpl;
> > +    if (!(sampled->arch.hvm.guest_cr[0] & X86_CR0_PE))
> > +      *flags |=3D PMU_SAMPLE_REAL;
> > +  }
> > +}
> > +
>
> This is fine in principle, except that you're changing the style away
> from Xen style.

Ah looks like we lack a .clang-format file, so `gq` reformatted the
code with Clang's default settings.
I'll avoid using `gq` for now, and have redone the commit using '<' instead=
.

>
> I can fix it on commit, but it's going to collide massively later in the
> series.

I've pushed a WiP branch which contains this change, and fixed the
rebase conflicts in the followup patches:
https://gitlab.com/xen-project/people/edwintorok/xen/-/commits/pmustack-nex=
t?ref_type=3Dheads

Best regards,
--Edwin
>
> ~Andrew

