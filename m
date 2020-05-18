Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1CF81D7D46
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2020 17:49:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jai0h-0005ur-A3; Mon, 18 May 2020 15:48:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tJLm=7A=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jai0f-0005uh-Hi
 for xen-devel@lists.xenproject.org; Mon, 18 May 2020 15:48:57 +0000
X-Inumbo-ID: 14cc2744-991f-11ea-ae69-bc764e2007e4
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 14cc2744-991f-11ea-ae69-bc764e2007e4;
 Mon, 18 May 2020 15:48:56 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id o14so10415921ljp.4
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2020 08:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=T/0JXutgb5uv3kHR9Zj9p+h6EdPHwSs1XSdCNi7BT1Y=;
 b=LhCuswHDjSeumcXuDr1jBauIopcfv+qPOx5ieZtIc4Fh9X06nq0a5WfdG7dBj+lbwc
 Y1iYSHrRZczphyKTA7RlxTAACp2C8eOEk4nJfcAjIY0YHL5PBkOnB74SUuouYOy98tRr
 3qf8MrZpXdqLEplwxT/DdTSTOb0f1XQYg02HBrMBDvfk+sKNHHOxSUMmykcVVK7Ml1uv
 hdiGzqCHBAtWOPHx9lGRnAT5PDlRAD6YDc8HtnYhElbZjTRps9njUp+9ixB8RTUiIXPk
 /6g6BxV3th74Rq4ubqO+dParMIey9OFiW7jfWivhH7cXF329nNein09H205AJCkcsRzV
 WJ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=T/0JXutgb5uv3kHR9Zj9p+h6EdPHwSs1XSdCNi7BT1Y=;
 b=SrW+wtFA1AKP9y68xNQhBuKbMP0ydvhkxQixeGoC2W8QaAK00/rQbJneKz6ufm8Ehv
 rbGk+joUSvEcTWXKDaPtISuVuBFC1th/ub/GcXxVRzq2LW/qJsv43yhfEU9H9C6upvtn
 R1vPvFYANOPtoC2Bwuafm3gprROt4qSNTr8WQg51/D50u/rab6xfWgsnFk2sBRAgxwIt
 Kgb7k3D4zqloTs6/Fv+ZzaIwRgkeGVHW1uQRe9RFTWHcwwML02NOS6nEx0abqD0jzG4B
 +cKrUxYptCKE8plUrpFZrqSVSQsKCqKMbrolx5/PalAJq+748gcJxxTmnXWD1DkOj6/I
 ZKvA==
X-Gm-Message-State: AOAM530UiCJ0OIS0Oy62+BWkA+gMA9QWJ8dQnVaQxuE5TjeU5kYU8fZd
 BsHNYvDFvsCqQDgzb9yFBxzM+SYpzNEbDpL2tG4=
X-Google-Smtp-Source: ABdhPJz5ECz3tbhHkf6OeL44VHAJG8Zj3gNR6q05FbODkB+mGj0IhrClYSgYstwWupjkDeJAjRXa+uyIzBq4eE6vhTQ=
X-Received: by 2002:a2e:9b10:: with SMTP id u16mr1872153lji.210.1589816935489; 
 Mon, 18 May 2020 08:48:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200428040433.23504-1-jandryuk@gmail.com>
 <24253.29524.798802.978257@mariner.uk.xensource.com>
 <CAKf6xpvJMovKMTWipC4gZuBD8FgmBEWbDbkm=ryRWSxNifQcJw@mail.gmail.com>
 <24258.39029.788968.419649@mariner.uk.xensource.com>
 <20200428040433.23504-10-jandryuk@gmail.com>
 <20200518145028.GD98582@mail-itl>
 <24258.42794.136081.367565@mariner.uk.xensource.com>
In-Reply-To: <24258.42794.136081.367565@mariner.uk.xensource.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Mon, 18 May 2020 11:48:44 -0400
Message-ID: <CAKf6xpvdSb=fSebzpHaLb1F9zNqsUn3dA03wYoXaZtxSLn0K+w@mail.gmail.com>
Subject: Re: [PATCH v5 09/21] libxl: add save/restore support for qemu-xen in
 stubdomain [and 1 more messages]
To: Ian Jackson <ian.jackson@citrix.com>
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, May 18, 2020 at 11:18 AM Ian Jackson <ian.jackson@citrix.com> wrote=
:
>
> >
> Marek Marczykowski-G=C3=B3recki writes ("Re: [PATCH v5 09/21] libxl: add =
save/restore support for qemu-xen in stubdomain"):
> > On Mon, May 18, 2020 at 03:15:17PM +0100, Ian Jackson wrote:
> > > Err, by "the qemu savefile pathname" I meant the pathname in dom0.
> > > I assume your wrapper script opens that and feeds it to the console.
> > > Is that right ?
> >
> > Not really a wrapper script. On dom0 side it is console backend (qemu)
> > instructed to connect the console to a file, instead of pty. I have
> > implemented similar feature in my xenconsoled patch series sent a while
> > ago (sent along with v2 of this series), but that series needs some mor=
e
> > love.
> >
> > On the stubdomain side, it is a script that launches qemu - opens a
> > /dev/hvc2, then pass the FD to qemu via -incoming option (which is
> > really constructed by libxl).
>
> Hi.  Thanks for trying to help me understand.  I was still confused
> though.  I tried to explain another way and that helped me see what's
> going on.
>
> I think I understand now.
>
> For reference, my confusion was this:
>
> Jason Andryuk writes ("[PATCH v5 09/21] libxl: add save/restore support f=
or qemu-xen in stubdomain"):
> > index bdc23554eb..45d0dd56f5 100644
> > --- a/tools/libxl/libxl_dm.c
> > +++ b/tools/libxl/libxl_dm.c
> > @@ -1744,10 +1744,17 @@ static int libxl__build_device_model_args_new(l=
ibxl__gc *gc,
> >      }
> >
> >      if (state->saved_state) {
> > -        /* This file descriptor is meant to be used by QEMU */
> > -        *dm_state_fd =3D open(state->saved_state, O_RDONLY);
> > -        flexarray_append(dm_args, "-incoming");
> > -        flexarray_append(dm_args, GCSPRINTF("fd:%d",*dm_state_fd));
> > +        if (is_stubdom) {
> > +            /* Linux stubdomain connects specific FD to STUBDOM_CONSOL=
E_RESTORE
> > +             */
> > +            flexarray_append(dm_args, "-incoming");
> > +            flexarray_append(dm_args, "fd:3");
> > +        } else {
> > +            /* This file descriptor is meant to be used by QEMU */
> > +            *dm_state_fd =3D open(state->saved_state, O_RDONLY);
> > +            flexarray_append(dm_args, "-incoming");
> > +            flexarray_append(dm_args, GCSPRINTF("fd:%d",*dm_state_fd))=
;
> > +        }
>
> In this hunk, the call
>            *dm_state_fd =3D open(state->saved_state, O_RDONLY);
> becomes conditional.  It is no longer executed in the stubdomain
> case.
>
> So then, who opens state->saved_state ?  And how do they get told
> where it is ?  If it's somewhere else in libxl, why doesn't it show up
> in this patch ?
>
> Posing the question liked that allowed me to see that the answer is
>
>            console[i].output =3D GCSPRINTF("file:%s",
>                            libxl__device_model_savefile(gc, guest_domid))=
;
>
> in spawn_stub_launch_dm.  And it doesn't appear in the patch because
> it's already used for minios stub trad qemu and the same code is
> now going to be executed for linux stub moderm qemu.

Do you want the commit message to add a blurb about this?  So the
message becomes:
"""
Rely on a wrapper script in stubdomain to attach relevant consoles to
qemu.  The save console (1) must be attached to fdset/1.  When
performing a restore, $STUBDOM_RESTORE_INCOMING_ARG must be replaced on
the qemu command line by "fd:$FD", where $FD is an open file descriptor
number to the restore console (2).

Existing libxl code (for dom0) already connects the stubdom's save &
restore console outputs to the save & restore files.
"""

-Jason

