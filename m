Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A990189DC11
	for <lists+xen-devel@lfdr.de>; Tue,  9 Apr 2024 16:20:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.702465.1097497 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruCJt-0003fM-Rx; Tue, 09 Apr 2024 14:19:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 702465.1097497; Tue, 09 Apr 2024 14:19:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruCJt-0003cM-P8; Tue, 09 Apr 2024 14:19:29 +0000
Received: by outflank-mailman (input) for mailman id 702465;
 Tue, 09 Apr 2024 14:19:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MkVj=LO=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1ruCJr-0003cG-KI
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2024 14:19:27 +0000
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [2607:f8b0:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2b159e5f-f67c-11ee-b907-491648fe20b8;
 Tue, 09 Apr 2024 16:19:26 +0200 (CEST)
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-6ed0938cd1dso3537008b3a.2
 for <xen-devel@lists.xenproject.org>; Tue, 09 Apr 2024 07:19:26 -0700 (PDT)
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
X-Inumbo-ID: 2b159e5f-f67c-11ee-b907-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1712672365; x=1713277165; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZKNwH61ogJYZeuk308ZpQ6diRlo1mDu3aiO1U5w7UaQ=;
        b=ObI7K5IK/cDEZJKIS7lax9MAfaHIzpHkUu3Xqw275KL6QYWNJjaRVQvG85e4m+U0t8
         4m7HWecl2SJ+Lvu47W9LlSpkNvx1qgHrea+mmEg9H2ot36NAV74C+zgPjjJyHL7TgQNs
         MtLRJmN4Ml5AalUfRK9b+fnCwx7M+Su127TUw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712672365; x=1713277165;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZKNwH61ogJYZeuk308ZpQ6diRlo1mDu3aiO1U5w7UaQ=;
        b=EX2sIAVLnHjpLkBFmcsTbnrXAHu4VzEMzHfEos57BxFjdAFxf0sMg+tdcPXHP1CNaS
         r9xTboKq6cyTZQ4ZLI/6LzTF+cOdRR6lMZnQV+KdZXYUoah95g8vT+zBBEzKr3jzL7A2
         lyu5Zf3UKjGGApqHnOeI3scDIHmR3ond8ahMkFG+lIWn8lwaYkItNkXAOjLvt+lmqcFH
         tTRB+Llmwf585s5PghmtPBLC7fu5DQN3xG4xTg+xEOYVEqK2Nond8qvKQOpzz8rDBG91
         M9TK6T2GqHZNemXT0ZQh2YAUTzMFKHNh2sui3kOoePJRkRwfF6g261PsGnj7kwIIETVV
         Y2dw==
X-Forwarded-Encrypted: i=1; AJvYcCULxFnyn5+zJ+5mrpjtfLMS0VAPdFR72WDleXbZWyiFq1UncFa1HmYK8TbWey+kx6JKOTDev2k3LB1fepOQv2/CFRc3Y3eM8PkLiz3+mSY=
X-Gm-Message-State: AOJu0YwZS0UW1UABGuRLGVe5XJhPi+TV4DGmqKmDJxVjxxjsVqWlxm67
	Dicxh3MSC7BI0W/MyylZHHVWsDg0ZrmDdEnhDFrtUw3gGv2giDN6e7NBThSDnp6lcGL074qAjEt
	t8qXNoTmkC7LNRkTPFu1QT+i8S3JBuifgfeRG
X-Google-Smtp-Source: AGHT+IEYZXNObBVw3ngDHwROEzFvrdey38md44MZZx9KaPUyg5O0H88Zi9oOToDjnG+ra3FB9wi06t3tsYpNugg/X10=
X-Received: by 2002:a05:6a20:3241:b0:1a7:807:ca2 with SMTP id
 hm1-20020a056a20324100b001a708070ca2mr11980431pzc.29.1712672364737; Tue, 09
 Apr 2024 07:19:24 -0700 (PDT)
MIME-Version: 1.0
References: <20240404140833.1557953-1-ross.lagerwall@citrix.com> <90f07634-1600-4654-8e36-7ac9e2f457e8@perard>
In-Reply-To: <90f07634-1600-4654-8e36-7ac9e2f457e8@perard>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Date: Tue, 9 Apr 2024 15:19:12 +0100
Message-ID: <CAG7k0EqJvVZJUNaf31Jd1ZfwvOon8saNbtHofon=VvB6gpj9qw@mail.gmail.com>
Subject: Re: [PATCH] xen-hvm: Avoid livelock while handling buffered ioreqs
To: Anthony PERARD <anthony.perard@cloud.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org, 
	qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 9, 2024 at 11:20=E2=80=AFAM Anthony PERARD <anthony.perard@clou=
d.com> wrote:
>
> On Thu, Apr 04, 2024 at 03:08:33PM +0100, Ross Lagerwall wrote:
> > diff --git a/hw/xen/xen-hvm-common.c b/hw/xen/xen-hvm-common.c
> > index 1627da739822..1116b3978938 100644
> > --- a/hw/xen/xen-hvm-common.c
> > +++ b/hw/xen/xen-hvm-common.c
> > @@ -521,22 +521,30 @@ static bool handle_buffered_iopage(XenIOState *st=
ate)
> [...]
> >
> >  static void handle_buffered_io(void *opaque)
> >  {
> > +    unsigned int handled;
> >      XenIOState *state =3D opaque;
> >
> > -    if (handle_buffered_iopage(state)) {
> > +    handled =3D handle_buffered_iopage(state);
> > +    if (handled >=3D IOREQ_BUFFER_SLOT_NUM) {
> > +        /* We handled a full page of ioreqs. Schedule a timer to conti=
nue
> > +         * processing while giving other stuff a chance to run.
> > +         */
>
> ./scripts/checkpatch.pl report a style issue here:
>     WARNING: Block comments use a leading /* on a separate line
>
> I can try to remember to fix that on commit.

I copied the comment style from a few lines above but I guess it was
wrong.

>
> >          timer_mod(state->buffered_io_timer,
> > -                BUFFER_IO_MAX_DELAY + qemu_clock_get_ms(QEMU_CLOCK_REA=
LTIME));
> > -    } else {
> > +                qemu_clock_get_ms(QEMU_CLOCK_REALTIME));
> > +    } else if (handled =3D=3D 0) {
>
> Just curious, why did you check for `handled =3D=3D 0` here instead of
> `handled !=3D 0`? That would have avoided to invert the last 2 cases, and
> the patch would just have introduce a new case without changing the
> order of the existing ones. But not that important I guess.
>

In general I try to use conditionals with the least amount of negation
since I think it is easier to read. I can change it if you would prefer?

Ross

