Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A6D8CD0CD
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2024 13:02:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.728342.1133226 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA6C7-00038P-NI; Thu, 23 May 2024 11:01:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 728342.1133226; Thu, 23 May 2024 11:01:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA6C7-00036I-KP; Thu, 23 May 2024 11:01:11 +0000
Received: by outflank-mailman (input) for mailman id 728342;
 Thu, 23 May 2024 11:01:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jOX+=M2=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1sA6C6-00036C-ON
 for xen-devel@lists.xenproject.org; Thu, 23 May 2024 11:01:10 +0000
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [2607:f8b0:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c24037ef-18f3-11ef-90a1-e314d9c70b13;
 Thu, 23 May 2024 13:01:09 +0200 (CEST)
Received: by mail-pg1-x52d.google.com with SMTP id
 41be03b00d2f7-657a07878easo2008340a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 23 May 2024 04:01:09 -0700 (PDT)
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
X-Inumbo-ID: c24037ef-18f3-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1716462068; x=1717066868; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=91U11pUevJarFFJNYMAR2AcdGvDfJkQNRP9NpdObBVA=;
        b=F5vR/AUognyK2RXfKWuN4eyFi0Sw+mC/Z+mOkPMpT9iUs2yFTHusUVuyQzeHD0LX8l
         djsQK6pqOkw5OCAJZaDh5FKuqVxWb3jR2mq6tbAmnxhLRdc/dzxrTFCZez1D9aDoqpv1
         32Yr5YWiW9Fn9ZTKxi+0sXg47ivGb1bK1dYCc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716462068; x=1717066868;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=91U11pUevJarFFJNYMAR2AcdGvDfJkQNRP9NpdObBVA=;
        b=CEqBS4Az6Ira1rbY4vU47o+8e1xF/J+ViG6/TnYK+DKQC8Yii0/6N7KRaTEhzfVcQH
         ks+U3p1zzXEem2WPqkCl3wZ1E25KUxzTa+LmDNtGDKbmaa1Ln4ZiIS8MW3uJC6rkgCTw
         nXWnfN/HCjqTp1NDrKLrgtf9vz1igKt4N3eGWjY/bDcHcqVd/FuqjWqHrZhAKuKmMGc8
         ZCI/zN+bps9JTTkE0X3ewzWidJQl5KMRwGVwgOp/8aQCQ1FIhOn5XfDzUbc0p0tbecM6
         MrIshulqQOY5tS2KBTOWrSQKV1S8tsNfHyuUGc120htWF+64gU3fxCRLu6xLTi9E9mT4
         rqQA==
X-Forwarded-Encrypted: i=1; AJvYcCUHd+E0eLB3zuQ31PJqK5I6Kt32dn01DUWW9Dflra3BmE3IH0nkfUblYNOTuMu/SFxQcUYp8YG2h837il8MWBYBS8h+x8BOLpGAdIzEOOY=
X-Gm-Message-State: AOJu0YwUqvrLanD46Fd9He5g2YItJBel3leDlPyoW3kRMwI1spJh2xLh
	C6XVMEg13FfMeGkQulJhFhYXCRlrhc5R0XuH3tXSMz9fmkGgiUJUZAjhcK/YvdB2O0yXBSt7qD7
	aJd0LCAjhLGwB+EfqqSRvnLEfB5N/lE1sB5kw
X-Google-Smtp-Source: AGHT+IGvuyeyuzWjiUToY5J16n8njwnJeOg1DbjbIwk+JKoOUqhMoTuOFFBMO1x/lFU8L5/TrbpAdDsGw6w6Iw9iSQY=
X-Received: by 2002:a17:90b:1003:b0:2b3:79ad:856d with SMTP id
 98e67ed59e1d1-2bd9f5d6291mr5469546a91.48.1716462067785; Thu, 23 May 2024
 04:01:07 -0700 (PDT)
MIME-Version: 1.0
References: <20240404140833.1557953-1-ross.lagerwall@citrix.com>
 <90f07634-1600-4654-8e36-7ac9e2f457e8@perard> <CAG7k0EqJvVZJUNaf31Jd1ZfwvOon8saNbtHofon=VvB6gpj9qw@mail.gmail.com>
In-Reply-To: <CAG7k0EqJvVZJUNaf31Jd1ZfwvOon8saNbtHofon=VvB6gpj9qw@mail.gmail.com>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Date: Thu, 23 May 2024 12:00:56 +0100
Message-ID: <CAG7k0Eo29eoZc+vgH+uDYe=YKiHM0a3jm6hoW5j+Wyc5kEh8tg@mail.gmail.com>
Subject: Re: [PATCH] xen-hvm: Avoid livelock while handling buffered ioreqs
To: Anthony PERARD <anthony.perard@cloud.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org, 
	qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 9, 2024 at 3:19=E2=80=AFPM Ross Lagerwall <ross.lagerwall@citri=
x.com> wrote:
>
> On Tue, Apr 9, 2024 at 11:20=E2=80=AFAM Anthony PERARD <anthony.perard@cl=
oud.com> wrote:
> >
> > On Thu, Apr 04, 2024 at 03:08:33PM +0100, Ross Lagerwall wrote:
> > > diff --git a/hw/xen/xen-hvm-common.c b/hw/xen/xen-hvm-common.c
> > > index 1627da739822..1116b3978938 100644
> > > --- a/hw/xen/xen-hvm-common.c
> > > +++ b/hw/xen/xen-hvm-common.c
> > > @@ -521,22 +521,30 @@ static bool handle_buffered_iopage(XenIOState *=
state)
> > [...]
> > >
> > >  static void handle_buffered_io(void *opaque)
> > >  {
> > > +    unsigned int handled;
> > >      XenIOState *state =3D opaque;
> > >
> > > -    if (handle_buffered_iopage(state)) {
> > > +    handled =3D handle_buffered_iopage(state);
> > > +    if (handled >=3D IOREQ_BUFFER_SLOT_NUM) {
> > > +        /* We handled a full page of ioreqs. Schedule a timer to con=
tinue
> > > +         * processing while giving other stuff a chance to run.
> > > +         */
> >
> > ./scripts/checkpatch.pl report a style issue here:
> >     WARNING: Block comments use a leading /* on a separate line
> >
> > I can try to remember to fix that on commit.
>
> I copied the comment style from a few lines above but I guess it was
> wrong.
>
> >
> > >          timer_mod(state->buffered_io_timer,
> > > -                BUFFER_IO_MAX_DELAY + qemu_clock_get_ms(QEMU_CLOCK_R=
EALTIME));
> > > -    } else {
> > > +                qemu_clock_get_ms(QEMU_CLOCK_REALTIME));
> > > +    } else if (handled =3D=3D 0) {
> >
> > Just curious, why did you check for `handled =3D=3D 0` here instead of
> > `handled !=3D 0`? That would have avoided to invert the last 2 cases, a=
nd
> > the patch would just have introduce a new case without changing the
> > order of the existing ones. But not that important I guess.
> >
>
> In general I try to use conditionals with the least amount of negation
> since I think it is easier to read. I can change it if you would prefer?

It looks like this hasn't been committed anywhere. Were you expecting
an updated version with the style issue fixed or has it fallen through
the cracks?

Thanks,
Ross

