Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF1F97E9A4
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2024 12:15:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.801838.1211864 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssg5s-00087i-Ph; Mon, 23 Sep 2024 10:15:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 801838.1211864; Mon, 23 Sep 2024 10:15:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssg5s-00086A-MI; Mon, 23 Sep 2024 10:15:00 +0000
Received: by outflank-mailman (input) for mailman id 801838;
 Mon, 23 Sep 2024 10:14:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h+ia=QV=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1ssg5r-000864-Fb
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2024 10:14:59 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id afd5c79b-7994-11ef-a0b9-8be0dac302b0;
 Mon, 23 Sep 2024 12:14:58 +0200 (CEST)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-5366fd6fdf1so4427193e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 23 Sep 2024 03:14:58 -0700 (PDT)
Received: from localhost ([52.166.251.127]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a90610f445fsm1197181966b.68.2024.09.23.03.14.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Sep 2024 03:14:57 -0700 (PDT)
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
X-Inumbo-ID: afd5c79b-7994-11ef-a0b9-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1727086498; x=1727691298; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eTirfxNozOftdqCV+6rsJEWrCM6q0Ix40mnr2lXL2Qg=;
        b=Oi2Iq8vhtGng4pG93XiR/OHpmAJK8xKhENhn86W+f2+SmCxg/IEJFyd0TQM5P0JFbx
         aJJKpDmcA7TeJPYl/NYDE2Rd5EkbTzi/nXOTC0+Bz7UyOF4/1gfjek72ZM9hmAdgGCXc
         PzPre1gHETIYkrmqVq9KSGVAJ+Oe+i7CW0BnU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727086498; x=1727691298;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eTirfxNozOftdqCV+6rsJEWrCM6q0Ix40mnr2lXL2Qg=;
        b=wlvAF940T1/DcImKdn++5MaGMm+58PSec/HQq+IBZw/rUmXpW01viLoMgawqrsepox
         vLnxLDTlQ2SLyycdb0cVhYfy5DGCMHR2s/ioP6ioYqd3+c1nxu7UAU46AOi941LCoLlA
         y32HH2KO0PrOZbq5F7Hr/H9N+NB4WPuq8lKP0hwbPX/yGiIXLaZ0qaAIa/EywezmUyT5
         t0aqqgbRjFfhIG9E58Nwtim+UwgiDCg7mZOfY08xHJYrXVWHRFaUDfoboT42NxLTsCLK
         97Qof3DMi67ARcISFdo3fV4bMd5p0CFKk4/rcfHJmysCzPDD7egfE/bwTRtRWqtXtk9V
         YLcw==
X-Gm-Message-State: AOJu0YzpgQSEW491nP59KQ4akPP0eiH7e2kZ1mMcBFzytlTeNQX+WRne
	bJN0yErvCLkR0urhxYMBePtZTuBXccYbR9YQOnA4wAFWRvVQt8hJTWomPhRqSYc=
X-Google-Smtp-Source: AGHT+IGbPpeZ1/GE4BFjsxYDZ48BmWkk9EUm4XC4RJED53KSgXDFYRzrGZsqQqVfjy+KyHOJlhokpw==
X-Received: by 2002:a05:6512:3b86:b0:536:554a:24c2 with SMTP id 2adb3069b0e04-536ad1645d9mr5140019e87.13.1727086497810;
        Mon, 23 Sep 2024 03:14:57 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Sep 2024 11:14:56 +0100
Message-Id: <D4DL2FFRNE6R.XTS6NS9L1PHX@cloud.com>
Cc: "Xen-devel" <xen-devel@lists.xenproject.org>, "Jan Beulich"
 <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2] x86/traps: Re-enable interrupts after reading cr2 in
 the #PF handler
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
X-Mailer: aerc 0.18.2
References: <20240918130554.97345-1-alejandro.vallejo@cloud.com>
 <Zu2Cyan46VVs2oef@macbook.local>
In-Reply-To: <Zu2Cyan46VVs2oef@macbook.local>

On Fri Sep 20, 2024 at 3:12 PM BST, Roger Pau Monn=C3=A9 wrote:
> On Wed, Sep 18, 2024 at 02:05:54PM +0100, Alejandro Vallejo wrote:
> > Moves sti directly after the cr2 read and immediately after the #PF
> > handler.
>
> I think you need to add some context about why this is needed, iow:
> avoid corrupting %cr2 if a nested 3PF happens.

I can send a v3 with:

```
  Hitting a page fault clobbers %cr2, so if a page fault is handled while
  handling a previous page fault then %cr2 will hold the address of the lat=
ter
  fault rather than the former. This patch makes the page fault path delay
  re-enabling IRQs until %cr2 has been read in order to ensure it stays
  consistent.

  Furthermore, the patch preserves the invariant of "IRQs are only re-enabl=
ed
  if they were enabled in the interrupted context" in order to not break
  IRQs-off faulting contexts.
```

>
> > While in the area, remove redundant q suffix to a movq in entry.S
> >=20
> > Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
>
> Acked-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Thanks

>
> One nit below.
>
> > ---
> > Got lost alongside other patches. Here's the promised v2.
> >=20
> > pipeline: https://gitlab.com/xen-project/people/agvallejo/xen/-/pipelin=
es/1458699639
> > v1: https://lore.kernel.org/xen-devel/20240911145823.12066-1-alejandro.=
vallejo@cloud.com/
> >=20
> > v2:
> >   * (cosmetic), add whitespace after comma
> >   * Added ASSERT(local_irq_is_enabled()) to do_page_fault()
> >   * Only re-enable interrupts if they were enabled in the interrupted
> >     context.
> > ---
> >  xen/arch/x86/traps.c        |  8 ++++++++
> >  xen/arch/x86/x86_64/entry.S | 20 ++++++++++++++++----
> >  2 files changed, 24 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
> > index 708136f62558..a9c2c607eb08 100644
> > --- a/xen/arch/x86/traps.c
> > +++ b/xen/arch/x86/traps.c
> > @@ -1600,6 +1600,14 @@ void asmlinkage do_page_fault(struct cpu_user_re=
gs *regs)
> > =20
> >      addr =3D read_cr2();
> > =20
> > +    /*
> > +     * Don't re-enable interrupts if we were running an IRQ-off region=
 when
> > +     * we hit the page fault, or we'll break that code.
> > +     */
> > +    ASSERT(!local_irq_is_enabled());
> > +    if ( regs->flags & X86_EFLAGS_IF )
> > +        local_irq_enable();
> > +
> >      /* fixup_page_fault() might change regs->error_code, so cache it h=
ere. */
> >      error_code =3D regs->error_code;
> > =20
> > diff --git a/xen/arch/x86/x86_64/entry.S b/xen/arch/x86/x86_64/entry.S
> > index b8482de8ee5b..218e5ea85efb 100644
> > --- a/xen/arch/x86/x86_64/entry.S
> > +++ b/xen/arch/x86/x86_64/entry.S
> > @@ -844,9 +844,9 @@ handle_exception_saved:
> >  #elif !defined(CONFIG_PV)
> >          ASSERT_CONTEXT_IS_XEN
> >  #endif /* CONFIG_PV */
> > -        sti
> > -1:      movq  %rsp,%rdi
> > -        movzbl UREGS_entry_vector(%rsp),%eax
> > +.Ldispatch_handlers:
>
> Maybe 'dispatch_exception', since it's only exceptions that are
> handled here? dispatch_handlers seems a bit too generic, but no strong
> opinion.

Sure, anything would be better than "1:"

>
> Thanks, Roger.

Cheers,
Alejandro

