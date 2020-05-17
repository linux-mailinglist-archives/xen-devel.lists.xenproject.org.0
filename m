Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 756B51D6855
	for <lists+xen-devel@lfdr.de>; Sun, 17 May 2020 15:56:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jaJly-0000vX-Ho; Sun, 17 May 2020 13:56:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mSDI=67=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jaJlw-0000vP-VE
 for xen-devel@lists.xenproject.org; Sun, 17 May 2020 13:56:08 +0000
X-Inumbo-ID: 281b21e4-9846-11ea-b07b-bc764e2007e4
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 281b21e4-9846-11ea-b07b-bc764e2007e4;
 Sun, 17 May 2020 13:56:08 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id o14so7024483ljp.4
 for <xen-devel@lists.xenproject.org>; Sun, 17 May 2020 06:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=RaH2NXVxSetmRQwxowvpRUDcblAi66spguzDnjTLRSo=;
 b=G4G9Ue0ZF+jd2fEINAh1dk7pZmjYb5ZgAaWDB/ByBTqG7UIeg/LDLrW08Zj1ExUMmI
 tI1SKjxwKbE9hbNj9UoF3hBDTuPS59sDjd1TgyQcf3dbIX7VhCA/boznEATi+Wn5JkvR
 QcmHJ7yi71m3fRxxXUCBQiUPMI/ciZMKw2rYfB2GOW285UQQl+n/q9kGWRke+9I1Jd2t
 HRYlIQOfeg5yAZg1APP/08VgnyEmHJODQhsiMK4A/NlvQVRUdwdvlzf6d47sDgqIC6oa
 dVL9isWRJT3YhccSz2ehs+NFUUvIlmfOzDa78i7spzFkLSjKnhKjP5UCl9+c4CXqvX1d
 V8hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=RaH2NXVxSetmRQwxowvpRUDcblAi66spguzDnjTLRSo=;
 b=VfKYY403d6N4iBGJCpRC9G4VPLLz/CZGOsYMaOU49gjsBEeTnwbV5Ul/mMVMVjhUv0
 iw7aHQ6Yk0T1DmZuSt5H/hypKrvwkuQ3W/BL+LKGfyMPCpBkMEcjdYFWhMHwd41iZMX1
 HausA7lWQAPS8NoJ2P1cKYGNjRTzjnQ786GQWOibn9En//KIoEhlSGAnj/wUYRhB7yiZ
 8hvoqJ/HXvKykqCFs6aQ4aeVCA0Rb4Igkcd7nMCej610F+4dZB6QV+DZ0FW40ilSeqae
 usfiy/xv5+QrfqamxvtGxjyaU67c/XlMVP6S3PJY89k0KJjSY4kOZ1dKdXpWJMOoGqry
 eTGA==
X-Gm-Message-State: AOAM532HQ+YO7VeVR5W3KJLhzgxR7ojYyTY6iWAy3syOGK9SP4BSYRTW
 KPMjVU6aSkZduReAYCiY3iHc70UgrXwUMUhlSZE=
X-Google-Smtp-Source: ABdhPJw5xw7Qa6MR/gRnhQHpeNQBv2rxuIRdshlWdyC1UW0AL2GO5CFYyFV3dSY8RKkBlyuDqLelW60WFtGyOZ57o34=
X-Received: by 2002:a2e:9005:: with SMTP id h5mr1031947ljg.246.1589723767212; 
 Sun, 17 May 2020 06:56:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200428040433.23504-1-jandryuk@gmail.com>
 <20200428040433.23504-10-jandryuk@gmail.com>
 <24253.29524.798802.978257@mariner.uk.xensource.com>
In-Reply-To: <24253.29524.798802.978257@mariner.uk.xensource.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Sun, 17 May 2020 09:55:55 -0400
Message-ID: <CAKf6xpvJMovKMTWipC4gZuBD8FgmBEWbDbkm=ryRWSxNifQcJw@mail.gmail.com>
Subject: Re: [PATCH v5 09/21] libxl: add save/restore support for qemu-xen in
 stubdomain
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

On Thu, May 14, 2020 at 12:35 PM Ian Jackson <ian.jackson@citrix.com> wrote=
:
>
> Jason Andryuk writes ("[PATCH v5 09/21] libxl: add save/restore support f=
or qemu-xen in stubdomain"):
> > From: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>
> >
> > Rely on a wrapper script in stubdomain to attach FD 3/4 of qemu to
> > relevant consoles.
> >
> > Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblething=
slab.com>
> > Address TODO in dm_state_save_to_fdset: Only remove savefile for
> > non-stubdom.
> ...
> > +        if (is_stubdom) {
> > +            /* Linux stubdomain connects specific FD to STUBDOM_CONSOL=
E_RESTORE
> > +             */
> > +            flexarray_append(dm_args, "-incoming");
> > +            flexarray_append(dm_args, "fd:3");
>
> Would it be possible to use a different fixed fd number ?  Low numbers
> are particularly vulnerable to clashes with autoallocated numbers.
>
> I suggest randomly allocating one in the range [64,192>.  My random
> number generator picked 119.  So 118 and 119 ?

This makes sense and would be the easiest change.

> Also, why couldn't your wrapper script add this argument ?  If you do
> that there then there is one place that knows the fd number and a
> slightly less tortuous linkage between libxl and the script...

I like this idea, but there is a complication.  "-incoming" is only
added when performing a restore, so it cannot just be blindly added to
all qemu command lines in the stubdom.  Two options I see are to
either communicate a restore some other way (so the stubdom scripts
can add the appropriate option), or pass something though dm_args, but
let the script convert it into something usable.

There is "-incoming defer" where we can later specify
"migrate_incoming fd:119".  Another option is to `sed
s/defer/fd:119/`, but that is a little tricky since we need to look at
the preceding key to know if we should sed the second.  We could pass
only "-incoming" and require the stubdom script to modify that option.

I haven't tested any of this.

> It's not stated anywhere here that I can see but I think what is
> happening here is that your wrapper script knows the qemu savefile
> pathname and reads it directly.  Maybbe a comment would be
> worthwhile ?

The existing comment "Linux stubdomain connects specific FD to
STUBDOM_CONSOLE_RESTORE" is trying to state that.
STUBDOM_CONSOLE_RESTORE is defined as 2 for console 2 (/dev/hvc2), but
it is only a libxl_internal.h define.

Regards,
Jason

