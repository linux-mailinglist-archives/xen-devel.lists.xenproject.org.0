Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C698C252347
	for <lists+xen-devel@lfdr.de>; Wed, 26 Aug 2020 00:04:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAh3F-0003h0-0y; Tue, 25 Aug 2020 22:04:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qmWW=CD=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1kAh3E-0003gt-ET
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2020 22:04:20 +0000
X-Inumbo-ID: a79e0a2e-1f8c-4726-af2e-2db54827f397
Received: from mail-qt1-x842.google.com (unknown [2607:f8b0:4864:20::842])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a79e0a2e-1f8c-4726-af2e-2db54827f397;
 Tue, 25 Aug 2020 22:04:19 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id n18so252306qtw.0
 for <xen-devel@lists.xenproject.org>; Tue, 25 Aug 2020 15:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zededa.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=270xgSHJxMXCxTteQ8w6gUZFua9iGmmUs3OIsWle/Uo=;
 b=GtgdRhfSMbKGvrq9rshTN+9KYOcA7QdYx/sFw3M2CFyMxVSGXN3eoGEUQy+yNXZhS3
 rypXbOs4MZeMoG3EpdxWPUZLt2YrdCK3mKonKVO8ON169HbBY4X2WS9t2hhRQ3qlI/L5
 S49IEG2oNmLHOWZgIHgl4Xo3z9pBYzej9gF7yaJfql5gm/9jvas3y+f4tWtXbAXlRqik
 RDDwn0BRFLMXfIIg3otPyrcxcpYOGOfN6FHJ7UsumiHZBVpU+E7HL0z8jlPdMImdweCI
 ovustdn1RMFYoL7nljA5pfpdyB6ww7AGtpw6U0NV7s/Erf2pjyHZibfDDpjGmfI75uNi
 iFvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=270xgSHJxMXCxTteQ8w6gUZFua9iGmmUs3OIsWle/Uo=;
 b=K6tVQk4p64gJMuAgTd14jEh12JFju/cgkyujWW0RqYbx6WZXNR6w2vvJL/gJ77ToeD
 94RaRS/7+IvSEHT1t34wcm1VcZKlrSHGn1D68uSoGxjhn4xtjvPbDgM7/fwP0mB4s9YC
 qsXG7FaTReIsxD56N+ziOgKmS7NiateptTIA3co+d+Ng6CMLwMZvCDOq92eL3q5Cf+/j
 +X/QNgFvNzKvHuU4QxIrUcay02Qj4yJWtAxB6neneKaao6ZOSE3BuVFlsA6aYPukY1N0
 8aq4Wd/glw1XR+UVDu7GjHugR98CHYgKMPJ7lPM0SbgCXzkhGog3lfuuQfTPqHxMJ/ST
 Wvig==
X-Gm-Message-State: AOAM530JrT0iTsfbbs7f4v36RMXHlIlkLfzZy8dJFfQs5UzjMjLip8ou
 f9pYEzqodj7UnrQy+mJF/KB/hQUunSvR7R7CTY5QCQ==
X-Google-Smtp-Source: ABdhPJygkO2tSmEeWRaw6IjxDbdl2X1s4uumq4PmMiTGpBuAJwOHwIv297q6ixzzGX+GepEonn0ID9TuKYcd+O4IzVk=
X-Received: by 2002:aed:3b24:: with SMTP id p33mr11633720qte.365.1598393059448; 
 Tue, 25 Aug 2020 15:04:19 -0700 (PDT)
MIME-Version: 1.0
References: <CAMmSBy9-cJuxC0jLPh6O-UCraThzg2wvNO29ZvxrBmVkatt_sg@mail.gmail.com>
 <20200821071547.18894-1-s.temerkhanov@gmail.com>
 <ccc1883f-876f-c1ea-bd68-b3c8ab267a8f@suse.com>
 <CAPEA6dYXaw=ZYv1jJqK=8twVpKXQ8bG0erABKC6HiQh-DcZ-DQ@mail.gmail.com>
 <b2917f59-d101-659d-1704-8d2a294bb2a1@suse.com>
 <871rjzsqyy.fsf@nanos.tec.linutronix.de>
 <alpine.DEB.2.21.2008241959510.24407@sstabellini-ThinkPad-T480s>
 <87k0xn5cgl.fsf@nanos.tec.linutronix.de>
 <cb64e4e9-2ed3-fb15-8c20-d49e47cbff34@suse.com>
 <87lfi2yckt.fsf@nanos.tec.linutronix.de>
 <0f85eadf-f13b-97a2-2a82-0d0018a72e9e@suse.com>
In-Reply-To: <0f85eadf-f13b-97a2-2a82-0d0018a72e9e@suse.com>
From: Roman Shaposhnik <roman@zededa.com>
Date: Tue, 25 Aug 2020 15:04:08 -0700
Message-ID: <CAMmSBy-yZaihj+w+KcQ=sTodjGC4dWuD6Jx+CUqoQ-+exuEFPg@mail.gmail.com>
Subject: Re: [PATCH] xen/events: Use chip data for storing per IRQ XEN data
 pointer
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
 Sergei Temerkhanov <s.temerkhanov@gmail.com>, 
 Xen-devel <xen-devel@lists.xenproject.org>, 
 Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Aug 25, 2020 at 8:43 AM J=C3=BCrgen Gro=C3=9F <jgross@suse.com> wro=
te:
>
> On 25.08.20 17:22, Thomas Gleixner wrote:
> > XEN uses irqdesc::irq_data_common::handler_data to store a per interrup=
t
> > XEN data pointer which contains XEN specific information.
> >
> > handler data is meant for interrupt handlers and not for storing irq ch=
ip
> > specific information as some devices require handler data to store inte=
rnal
> > per interrupt information, e.g. pinctrl/GPIO chained interrupt handlers=
.
> >
> > This obviously creates a conflict of interests and crashes the machine
> > because the XEN pointer is overwritten by the driver pointer.
> >
> > As the XEN data is not handler specific it should be stored in
> > irqdesc::irq_data::chip_data instead.
> >
> > A simple sed s/irq_[sg]et_handler_data/irq_[sg]et_chip_data/ cures that=
.
> >
> > Reported-by: Roman Shaposhnik <roman@zededa.com>
> > Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
>
> Reviewed-by: Juergen Gross <jgross@suse.com>

Tested-by: Roman Shaposhnik <roman@zededa.com>

Thank you everyone for coming up with the fix so quickly! I tested it out
and it appears to be functional with and without Xen.

Thanks,
Roman.

