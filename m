Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61902B58FDD
	for <lists+xen-devel@lfdr.de>; Tue, 16 Sep 2025 10:01:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1124528.1466833 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uyQbz-00078J-Fc; Tue, 16 Sep 2025 08:00:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1124528.1466833; Tue, 16 Sep 2025 08:00:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uyQbz-00075n-Cw; Tue, 16 Sep 2025 08:00:27 +0000
Received: by outflank-mailman (input) for mailman id 1124528;
 Tue, 16 Sep 2025 08:00:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gL7b=33=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1uyQbx-00075f-Kd
 for xen-devel@lists.xenproject.org; Tue, 16 Sep 2025 08:00:25 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 31677c26-92d3-11f0-9809-7dc792cee155;
 Tue, 16 Sep 2025 10:00:21 +0200 (CEST)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-570d0c280e4so4936815e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 16 Sep 2025 01:00:21 -0700 (PDT)
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
X-Inumbo-ID: 31677c26-92d3-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758009621; x=1758614421; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KouwesFlgNsfi6ZAeLHccS36bPkCPn/8z9o1uRe7qGM=;
        b=JchCTBO1VhCxeqiqaO+AaLqATiHwmAq3SY6c3NtD/mk4czXhYp3TtA4BfKk7F2NUzf
         +MEiZmuHPt8L4N3JRW6TVCL5ZExqpksOWSbNEFz/RUjy6ojTyLXIKpxmYFBZvrBpSdhU
         mq67xfLvWXe2HlfzzFOQ8e2ZRTtNbDsGXPdyW5z4GSdEqMWtvdSxS7l4dD5rc7lqWmTy
         ezfVlkVML/VDRHe+Bh6eGLxU08jAJ0tGKKka8IBgXTRGtlY9zH9feHrKUPNN2x0a/yzB
         o5S0L/e1dCXLEfbI/A/ZR3ISvoPa9yACGBGu99odFLoupYwc/ay6ULbWsWMuYyoab9Pw
         ciIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758009621; x=1758614421;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KouwesFlgNsfi6ZAeLHccS36bPkCPn/8z9o1uRe7qGM=;
        b=MFpyXX3VQnsfUGOeejJXx+YBbsaNwn514nqYadQNoHXvGzUzCCe8reiU0vkmMjqCZ1
         pB5956yC4r9bLB2qVqBTRCbB50IExXjrcjhu+/6mUpdUFumZfQ4q4yNA/E3KYV85aN9Z
         4DG5+GkYXUkI8MBbz2fMkXGYEq4diwqYtNzSz3/LOpysr7mx73AhvDfl5IAbMBx6Fk4S
         ZN2JbyuvjvIWZI3HpHU41f3cY6yrT9BtL0S85uMfTmVuU8J3SUoPALACURKlrxGJTSAp
         NwJiNA/5NprOvSqdRvxl77GCFULcw5jsRvqdPj0XJvuA7D8BgsDUv0FokiuqVdNcfCVY
         nY1A==
X-Gm-Message-State: AOJu0Yzih26Me6HTUuYkfRe6qffWgQ/YyEHdS2Kb6urXjHfCRdMJgIYT
	oRXtuGsOZPpsHEaJFZfESj+3SsyeZnoMQ3SaUb34t51H6rWp2b5DIFcT6qEkCPxdifZ0HFX+7yr
	WKUdgrFSoneUyudkWqkv3EOCbPTBAHpw=
X-Gm-Gg: ASbGncuS2Ngsx9/gcI5VlQXvXg5PxDHVoY3AginL7de2Wj+7V+WYuNzhTrDBpGgZr+L
	jLg0H8cCGNpOE7Tt/sGe1Y0s53UshcaugjYanZnMYrNwkvHTRIuq9Qr6F2VEiROofRJ2OkoqT3I
	LDwwG8jVKb/IQSaMzbdaHZ/tUu67t+8pgqSPwSgODBnTn2ZQQCpByzUUzql9idV41LWTFVrhUZt
	E12bQ==
X-Google-Smtp-Source: AGHT+IEJrFZoMW7PmfVoWSINU4I3HTGnlRnflqU8TM/JJ21hH/uIwpZeNizqRloY1Ku3PrMZkcKn2al9cAtez+w3dGA=
X-Received: by 2002:a05:651c:211b:b0:32a:6eea:5c35 with SMTP id
 38308e7fff4ca-3513c8db849mr40085881fa.15.1758009620350; Tue, 16 Sep 2025
 01:00:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250908211149.279143-1-dmukhin@ford.com> <20250908211149.279143-9-dmukhin@ford.com>
 <CAGeoDV8iL374T7n=f_AQTA5VPfKThcEq-fN4X3kzWLzbjCzjew@mail.gmail.com> <9d55721e-bd95-4354-b839-f8896eedab24@suse.com>
In-Reply-To: <9d55721e-bd95-4354-b839-f8896eedab24@suse.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Tue, 16 Sep 2025 11:00:09 +0300
X-Gm-Features: AS18NWCfWk7FtPLvfHN8_wjN3-wtq_vXU4WVFhLiUY-DdOAnW_zEPy5DbArYNG0
Message-ID: <CAGeoDV-wzvRe=jmeKdr7=ectxiUVViLm_n4GvKdiCoFTwyoRrQ@mail.gmail.com>
Subject: Re: [PATCH v7 08/16] emul/ns16x50: implement MCR/MSR registers
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
	anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com, 
	roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com, 
	dmukhin@xen.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jan,

On Mon, Sep 15, 2025 at 5:49=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 15.09.2025 08:00, Mykola Kvach wrote:
> > On Tue, Sep 9, 2025 at 12:12=E2=80=AFAM <dmukhin@xen.org> wrote:
> >> --- a/xen/common/emul/vuart/ns16x50.c
> >> +++ b/xen/common/emul/vuart/ns16x50.c
> >> @@ -107,7 +107,7 @@ static bool cf_check ns16x50_iir_check_thr(const s=
truct vuart_ns16x50 *vdev)
> >>
> >>  static bool cf_check ns16x50_iir_check_msi(const struct vuart_ns16x50=
 *vdev)
> >>  {
> >> -    return false;
> >> +    return vdev->regs[UART_MSR] & UART_MSR_CHANGE;
> >>  }
> >>
> >>  /*
> >> @@ -232,12 +232,63 @@ static int ns16x50_io_write8(
> >>              regs[UART_LCR] =3D val;
> >>              break;
> >>
> >> +        case UART_MCR: {
> >
> > Probably the opening brace should be moved to the next line.
> > See CODING_STYLE:
> >
> > Braces ('{' and '}') are usually placed on a line of their own, except
> > for:
> >
> > - the do/while loop
> > - the opening brace in definitions of enum, struct, and union
> > - the opening brace in initializers
> > - compound literals
>

Thanks for clarifying.

> strictly by the wording of the doc you're right, yet if you go look then
> you'll see that we really permit both forms (and apparently prefer the
> one used here).

I just want to make sure I understand the expectation correctly.
The CODING_STYLE document has wording about brace placement, but as
you noted, the actual code in this subsystem uses both styles, and the
one used here seems to be preferred in practice.

To get a better sense, I did a quick search in the repository. The
pattern with the brace on the next line after case appears roughly
340 times, while the variant with the brace on the same line as case
appears about 75 times. So overall the first form seems to be much
more common.

That makes me think the choice here is more a matter of maintainer
preference than a global convention. My main concern is consistency:
if in one place both forms are accepted, but in another case reviewers
point back to the document and ask for strict compliance, it could
create confusion for contributors.

I'm fine if Denis leaves it as is. I just wanted to note the
misalignment with the CODING_STYLE doc.

>
> Jan

Best regard,
Mykola

