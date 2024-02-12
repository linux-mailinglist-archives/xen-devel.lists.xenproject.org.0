Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B61850D13
	for <lists+xen-devel@lfdr.de>; Mon, 12 Feb 2024 04:55:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.679143.1056622 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZNPP-0007Ou-WA; Mon, 12 Feb 2024 03:55:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 679143.1056622; Mon, 12 Feb 2024 03:55:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZNPP-0007N9-TP; Mon, 12 Feb 2024 03:55:07 +0000
Received: by outflank-mailman (input) for mailman id 679143;
 Mon, 12 Feb 2024 03:55:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lYCt=JV=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1rZNPO-0007Mx-2e
 for xen-devel@lists.xenproject.org; Mon, 12 Feb 2024 03:55:06 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7facc492-c95a-11ee-98f5-efadbce2ee36;
 Mon, 12 Feb 2024 04:55:02 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-55a035669d5so4005002a12.2
 for <xen-devel@lists.xenproject.org>; Sun, 11 Feb 2024 19:55:02 -0800 (PST)
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
X-Inumbo-ID: 7facc492-c95a-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707710102; x=1708314902; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qxZerN7J+zgn6JEepd90bhcVWF4c3VwoeTHfy8Xj0xw=;
        b=m7bb+paexxUW2Et7fsRmGpFIXZrTCY7xrL7ZILQPb23t49rikfEwOdz6eyGrWryof8
         wcTDVnwdAJRxsEHdbmb0kx7EINDis4mVewOWqfdQpfHhn+PIzWHJR96604h6r2d+kvju
         4tdG/KFxxWpkr+yTwvQtub+Zez0D/HrqgqIYqsUnvUSTTS7wd8Ubd8QMoZ2YdxEWrtl2
         kwHOC0LPlGFzjnN5xD32kqILpUwqkEpVuPKJW/Gs8gQXwrtrvvwx9lxRxty3B133FlJk
         lozOkD9ybFGlDkeLg/F2EYARVhWv6i7EYr4QwHn2IhluugYAgvRodROQ/XCkTacD3VnW
         odgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707710102; x=1708314902;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qxZerN7J+zgn6JEepd90bhcVWF4c3VwoeTHfy8Xj0xw=;
        b=dR9LTSzW+2E8s/JSp/tKbaxCRrboiHU8F9mcMDGkMT9vRbVPWCOSDxn3WbZwKS8aCg
         YYdLD7/TdMnY4gs8l2aO2P98+C9UQsqQs7XNkwyvV3oUw0393MXMIKWt37c2rNj0ZUSg
         CON4IfI6kdptmxqzJDxg/wuzXfrqzgn1M4TnCcNA4E1uiB/XhNk/FV8hqSbHuCwMBhfB
         OXFTyVBUIrxo/2O2TQJn/LCsoXAJm6gV6SwgaXhAKfbv2TDD4eYP9c8EqhPyEXUU6TBZ
         fx7NfHXO6nl61lQcoZF1GZYnDQj7O9Pz19nm0q7v5yawwCbnaZjandUObtGf1plrpw1T
         wYIQ==
X-Gm-Message-State: AOJu0YwS+Sira9+fLx+Nm/B6d2FlaizViljxp564y3+g6mCrI1WM1Oub
	6xcYyGLVtmLDc8C16KLJ41tgIFy0L86ZNV/Dhnn4GYaoRBKnwzfrTS2fi1tabr8G9sqRvwNc381
	BxVzSUlqkN+KC8te2ZiTaPRtN+QQ=
X-Google-Smtp-Source: AGHT+IERMDd1vAiNLNAWk93evwyJt0ttAqbO00uciJjOSmu2gVKfz0QGiuGwgjYZ9lK/+Rjp4AOkdlQrvrrWf9jG7FA=
X-Received: by 2002:aa7:d685:0:b0:55f:c930:8b8a with SMTP id
 d5-20020aa7d685000000b0055fc9308b8amr3488671edr.6.1707710101436; Sun, 11 Feb
 2024 19:55:01 -0800 (PST)
MIME-Version: 1.0
References: <20240201183024.145424-1-jandryuk@gmail.com> <20240201183024.145424-2-jandryuk@gmail.com>
 <cd9e0194-5814-4735-bca4-df2577102c19@perard> <a0145f9d-654d-4336-b5bb-69883543b919@suse.com>
 <CAKf6xptDuYr2mT0w39Ezb3gTETYoZBpFUQ1Zqe6Kb9UeRQw7EQ@mail.gmail.com> <714d7de9-5a6e-4d30-bd2d-5b84ae24f3dd@suse.com>
In-Reply-To: <714d7de9-5a6e-4d30-bd2d-5b84ae24f3dd@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Sun, 11 Feb 2024 22:54:49 -0500
Message-ID: <CAKf6xptMs8TRmFnOMiCFaMZ8aiNnaNdgmtxk+bT8-MDsSJ4yjw@mail.gmail.com>
Subject: Re: [PATCH 1/4] block-common: Fix same_vm for no targets
To: Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, 
	Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 8, 2024 at 2:50=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wrot=
e:
>
> On 08.02.2024 03:25, Jason Andryuk wrote:
> > On Wed, Feb 7, 2024 at 7:50=E2=80=AFAM Jan Beulich <jbeulich@suse.com> =
wrote:
> >>
> >> On 06.02.2024 12:45, Anthony PERARD wrote:
> >>> On Thu, Feb 01, 2024 at 01:30:21PM -0500, Jason Andryuk wrote:
> >>>> same_vm is broken when the two main domains do not have targets.  ot=
vm
> >>>> and targetvm are both missing, which means they get set to -1 and th=
en
> >>>> converted to empty strings:
> >>>>
> >>>> ++10697+ local targetvm=3D-1
> >>>> ++10697+ local otvm=3D-1
> >>>> ++10697+ otvm=3D
> >>>> ++10697+ othervm=3D/vm/cc97bc2f-3a91-43f7-8fbc-4cb92f90b4e4
> >>>> ++10697+ targetvm=3D
> >>>> ++10697+ local frontend_uuid=3D/vm/844dea4e-44f8-4e3e-8145-325132a31=
ca5
> >>>>
> >>>> The final comparison returns true since the two empty strings match:
> >>>>
> >>>> ++10697+ '[' /vm/844dea4e-44f8-4e3e-8145-325132a31ca5 =3D /vm/cc97bc=
2f-3a91-43f7-8fbc-4cb92f90b4e4 -o '' =3D /vm/cc97bc2f-3a91-43f7-8fbc-4cb92f=
90b4e4 -o /vm/844dea4e-44f8-4e3e-8145-325132a31ca5 =3D '' -o '' =3D '' ']'
> >>>>
> >>>> Replace -1 with distinct strings indicating the lack of a value and
> >>>> remove the collescing to empty stings.  The strings themselves will =
no
> >>>> longer match, and that is correct.
> >>>>
> >>>> ++12364+ '[' /vm/844dea4e-44f8-4e3e-8145-325132a31ca5 =3D /vm/cc97bc=
2f-3a91-43f7-8fbc-4cb92f90b4e4 -o 'No target' =3D /vm/cc97bc2f-3a91-43f7-8f=
bc-4cb92f90b4e4 -o /vm/844dea4e-44f8-4e3e-8145-325132a31ca5 =3D 'No other t=
arget' -o 'No target' =3D 'No other target' ']'
> >>>>
> >>>> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> >>>
> >>> Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
> >>
> >> I've committed this, but I take the absence of a Fixes: tag as indicat=
ion
> >> that this doesn't want/need backporting.
> >
> > Hmmm, maybe this should have a Fixes.  Sorry I didn't investigate that
> > better before submission.
> >
> > Looks like this would be the commit:
> > https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dcommitdiff;h=3Df3a7ca02=
400d1c416e97451b4aebfaf608fc8192
> >
> > f3a7ca02400d1 ("hotplug/Linux: fix same_vm check in block script")
> >
> > I need to circle back on this.  IIRC, when I set up a conflicting
> > assignment of a writable disk to two VMs with block-tap, it was
> > allowed and not denied.  That is what prompted this change.
> >
> > I'll have to double check there isn't something in the regular block
> > that might prevent that.
>
> Okay, I'll wait for a result here before deciding whether to queue.

Yes, it should be backported.  This patch prevents sharing writable
block devs.  Files are still broken because of issues identified
previously here:
https://lore.kernel.org/xen-devel/CAKf6xpv-U91nF2Fik7GRN3SFeOWWcdR5R+ZcK5fg=
ojE+-D43sg@mail.gmail.com/

Regards,
Jason

