Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F6DC7DFDC8
	for <lists+xen-devel@lfdr.de>; Fri,  3 Nov 2023 02:42:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.627039.977893 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyjCt-0006P9-Lu; Fri, 03 Nov 2023 01:42:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 627039.977893; Fri, 03 Nov 2023 01:42:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyjCt-0006MG-JI; Fri, 03 Nov 2023 01:42:43 +0000
Received: by outflank-mailman (input) for mailman id 627039;
 Fri, 03 Nov 2023 01:42:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wEjK=GQ=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1qyjCs-0006MA-NZ
 for xen-devel@lists.xenproject.org; Fri, 03 Nov 2023 01:42:42 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 47072ed0-79ea-11ee-98d7-6d05b1d4d9a1;
 Fri, 03 Nov 2023 02:42:41 +0100 (CET)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-53e2308198eso2659417a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 02 Nov 2023 18:42:41 -0700 (PDT)
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
X-Inumbo-ID: 47072ed0-79ea-11ee-98d7-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698975761; x=1699580561; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j6S6moRFxcwEt/aWKWcecyTl87JrHJdjfXdVy+KY5ks=;
        b=Hv4HJjPwYuOTXR+AHn1wr/9/y8it9dv5Z8EbmY2LWiKETE3ajhP7VDd8xRpgZDBwJb
         MiaOpPOYW0dT1DVlDdeqnKNHSj8QMQq8Y/iV4JujHSVgTDUBDrRxqB7zjUcu0PmwDMth
         H6HNYd6MgKl/wj0NrjGmeHt41MuqfIP4MXEDQvsuC4q4esPFGV41CSX0Arsdy36sE91t
         ayRy9TAsWOuE3PTC1GnM2f8Q21bG5kTmzXYmy2vBi6bXDVO/0J8ERDBwuWkOwwMhojcW
         OjheOlf5KIjBlHFBKgL/dXYJ3hd1m/o4Qa6v3jhzdw+TmivjMxxcWaJnTmOEyZvhXmnK
         WNdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698975761; x=1699580561;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j6S6moRFxcwEt/aWKWcecyTl87JrHJdjfXdVy+KY5ks=;
        b=D8VyDnspFLQFccWfFm13Li0Dsas5ePnG4qQ6K8tZMhDMry7Z0qzSnwr3Z9gNbNCJB1
         +f2a9NXu8QHZzDks+3KxUFxruP4dvgrn8tPclvdOPVQqG7rG89n+C1gWEbtzTnsjQ+ty
         iEpJ9u/TqtHTHXDZ7j/5q3VYmcad3S2OQh6cwGygmiT4DjSx3zer/41RauZax8H6hoda
         jah4rszfwdaJ/dEpz/oOMqzQtGw/epAVjN8YsvPlG6dlgVpxHw0Femv/8bFVMb3rywLQ
         RPzXUbfbg4uOBD7szx8SfVVlJWZYx+gZ2O3r3pLWTs/bTR8APnirIzl5Z7TUYD109icB
         40Sg==
X-Gm-Message-State: AOJu0Yw6Id9Hg7j8gFQVGjBtmMw4MLMt3f4sqMCFkbBQZHEYlTHEASoH
	IvWPsChELakuoprEI1KwLlODI++L8YV4CdTTfCA=
X-Google-Smtp-Source: AGHT+IH/RMDuS0RSONPu0TdYz0dMW8TwE1sPNukKwwofLVl4AtZMFqyw9c2bW1R2F4+/bkhs8WK6VA/3LfhymdLKXSg=
X-Received: by 2002:aa7:d941:0:b0:531:a63:cf25 with SMTP id
 l1-20020aa7d941000000b005310a63cf25mr16400765eds.33.1698975760988; Thu, 02
 Nov 2023 18:42:40 -0700 (PDT)
MIME-Version: 1.0
References: <20231101093325.30302-1-jgross@suse.com> <20231101093325.30302-4-jgross@suse.com>
 <CAKf6xptkUPBSTsij=CAWaiYxTCtGH4zpZWiLuvb=teX3i_sjrA@mail.gmail.com> <30b8cb38-ecc8-4d4e-bf18-512e893de153@suse.com>
In-Reply-To: <30b8cb38-ecc8-4d4e-bf18-512e893de153@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Thu, 2 Nov 2023 21:42:29 -0400
Message-ID: <CAKf6xpumCFYor9uE8Km2M24vvpko4RmA+Vm-qRdLoFLCkxmhfw@mail.gmail.com>
Subject: Re: [PATCH 03/29] tools/xenlogd: connect to frontend
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 2, 2023 at 4:23=E2=80=AFAM Juergen Gross <jgross@suse.com> wrot=
e:
>
> On 01.11.23 20:21, Jason Andryuk wrote:
> > On Wed, Nov 1, 2023 at 5:34=E2=80=AFAM Juergen Gross <jgross@suse.com> =
wrote:
> >>
> >> Add the code for connecting to frontends to xenlogd.
> >>
> >> Signed-off-by: Juergen Gross <jgross@suse.com>
> >
> >> diff --git a/tools/xenlogd/xenlogd.c b/tools/xenlogd/xenlogd.c
> >> index 792d1026a3..da0a09a122 100644
> >> --- a/tools/xenlogd/xenlogd.c
> >> +++ b/tools/xenlogd/xenlogd.c
> >
> >> +static void connect_device(device *device)
> >> +{
> >> +    unsigned int val;
> >> +    xenevtchn_port_or_error_t evtchn;
> > 1.> +
> >> +    val =3D read_frontend_node_uint(device, "version", 0);
> >> +    if ( val !=3D 1 )
> >> +        return connect_err(device, "frontend specifies illegal versio=
n");
> >> +    val =3D read_frontend_node_uint(device, "num-rings", 0);
> >> +    if ( val !=3D 1 )
> >> +        return connect_err(device, "frontend specifies illegal ring n=
umber");
> >
> > Linux uses 2 rings (XEN_9PFS_NUM_RINGS), and it doesn't connect when
> > max-rings is less than that.
> >
> > max_rings =3D xenbus_read_unsigned(dev->otherend, "max-rings", 0);
> > if (max_rings < XEN_9PFS_NUM_RINGS)
> >      return -EINVAL;
> >
> > new_device() writes max-rings as 1.  So this works for mini-os, but
> > not Linux.  I'm not requesting you to change it - just noting it.
>
> Thanks for the note. I'll change it to allow more rings.

I'm happy to work on Linux compatibility as a follow up, if you just
want to focus on your Mini-OS use case.

Regards,
Jason

