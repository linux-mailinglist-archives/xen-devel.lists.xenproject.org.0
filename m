Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6565184D7C3
	for <lists+xen-devel@lfdr.de>; Thu,  8 Feb 2024 03:27:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.677975.1054943 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXu6s-0003WJ-Cl; Thu, 08 Feb 2024 02:25:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 677975.1054943; Thu, 08 Feb 2024 02:25:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXu6s-0003Tg-A1; Thu, 08 Feb 2024 02:25:54 +0000
Received: by outflank-mailman (input) for mailman id 677975;
 Thu, 08 Feb 2024 02:25:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+jwf=JR=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1rXu6q-0003Ta-PU
 for xen-devel@lists.xenproject.org; Thu, 08 Feb 2024 02:25:52 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5f47dbd6-c629-11ee-98f5-efadbce2ee36;
 Thu, 08 Feb 2024 03:25:49 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-33b4b121e28so684663f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 07 Feb 2024 18:25:49 -0800 (PST)
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
X-Inumbo-ID: 5f47dbd6-c629-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707359148; x=1707963948; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rykO7zXEcMv/WhsHVZTU+YRtV6PJ4UtB6DcUCziOnBk=;
        b=Cjkd3l8gz9OjmrwG8IcPF+xmgJ/iwiKVzjnKqjaxWzklh+nnOcl3JyTRsgDHdeXhlX
         dob3tof70NhMOXjyXKJfO7RtENRtyVaM0zRI1shPX8RIQTiF9TRWJ515963oFrIwrpto
         VhD6CzVTfUsIwJKF9IZb/Bnvunm5mv/wLWX1QI/OEKIkVVvq7BeBRjHwliTR4bXZL4fm
         0GcQyK7quO9w+RhBsZFzD6Nhml1AaLV6lYVhH5WNdPRtKn1XtEAdNZTUzK6WWv9T6URe
         7ZMCgQofMH+/cAvRIY6F3IYbnolBlHmYWw8RmIZ58KWifVQElhTyKTx8hSzyqhQ9Icdp
         9G+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707359148; x=1707963948;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rykO7zXEcMv/WhsHVZTU+YRtV6PJ4UtB6DcUCziOnBk=;
        b=d/tuJXpQBSH39ms2JaRDYc8m7jAFNOYQWSPwUK8hySUQdnJnBLvFCC96Y7TxhO7/6d
         PjikpXRe6J2ApT4uh4sivlMWw30kJY0R3pr4txTK4N2BKDjSw1YPt40FnTbuQbDtas9v
         aRB+REgF5nC0DnaGmj/3ymE4jpDdl3NnwMXZoqFVxHSijpCvU6/jHT9ciZom4jA9iDkw
         XAi7I0QMYY3H/xvsudI6SSRUDn6UZOWbdTpJ/j0g3EHnAdvqKgjy+xPGFL+SVS3A8ttz
         aJLT5MqO3Is+CdT2AhyGCovbWau8bqf8vUpJgnZ/1A8vCYpDtKlOpqpmVA033yFiyO5a
         SY7w==
X-Forwarded-Encrypted: i=1; AJvYcCWhr55pKOKGl3c1VXnwsax+fdZ6ydLm3gzIIEgre3obqRR8ixz5xsdG7/LHd7lzEwpJkcNpm7NKUjMeSPNbHfiFSAQM+/1hO9QkzjRZo6s=
X-Gm-Message-State: AOJu0YztRfUPB//Pa1mQZYGU1H+D5yeguKBDkyIOf2zkwZKpvxdCwj3g
	REA6Qj7H3TH/2JHw11lz9+nSs/A5B/B0V+/sXP5v131ZJEU4BdhEbDjxg17Ah98FEA7IsUxxoQq
	eUyDBkAa7QGGPJafCEK+pv5Ey27g=
X-Google-Smtp-Source: AGHT+IFcrjZG7MB3VPHR1I9O032xb/tXtJbmdYzG4p0U+Y7TJbh86vq64pppfUltlW8JQdXVmlyIAuUCe9Swx1vGdPs=
X-Received: by 2002:a5d:5f85:0:b0:33b:4acb:9999 with SMTP id
 dr5-20020a5d5f85000000b0033b4acb9999mr5329371wrb.44.1707359148390; Wed, 07
 Feb 2024 18:25:48 -0800 (PST)
MIME-Version: 1.0
References: <20240201183024.145424-1-jandryuk@gmail.com> <20240201183024.145424-2-jandryuk@gmail.com>
 <cd9e0194-5814-4735-bca4-df2577102c19@perard> <a0145f9d-654d-4336-b5bb-69883543b919@suse.com>
In-Reply-To: <a0145f9d-654d-4336-b5bb-69883543b919@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 7 Feb 2024 21:25:36 -0500
Message-ID: <CAKf6xptDuYr2mT0w39Ezb3gTETYoZBpFUQ1Zqe6Kb9UeRQw7EQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] block-common: Fix same_vm for no targets
To: Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, 
	Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 7, 2024 at 7:50=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wrot=
e:
>
> On 06.02.2024 12:45, Anthony PERARD wrote:
> > On Thu, Feb 01, 2024 at 01:30:21PM -0500, Jason Andryuk wrote:
> >> same_vm is broken when the two main domains do not have targets.  otvm
> >> and targetvm are both missing, which means they get set to -1 and then
> >> converted to empty strings:
> >>
> >> ++10697+ local targetvm=3D-1
> >> ++10697+ local otvm=3D-1
> >> ++10697+ otvm=3D
> >> ++10697+ othervm=3D/vm/cc97bc2f-3a91-43f7-8fbc-4cb92f90b4e4
> >> ++10697+ targetvm=3D
> >> ++10697+ local frontend_uuid=3D/vm/844dea4e-44f8-4e3e-8145-325132a31ca=
5
> >>
> >> The final comparison returns true since the two empty strings match:
> >>
> >> ++10697+ '[' /vm/844dea4e-44f8-4e3e-8145-325132a31ca5 =3D /vm/cc97bc2f=
-3a91-43f7-8fbc-4cb92f90b4e4 -o '' =3D /vm/cc97bc2f-3a91-43f7-8fbc-4cb92f90=
b4e4 -o /vm/844dea4e-44f8-4e3e-8145-325132a31ca5 =3D '' -o '' =3D '' ']'
> >>
> >> Replace -1 with distinct strings indicating the lack of a value and
> >> remove the collescing to empty stings.  The strings themselves will no
> >> longer match, and that is correct.
> >>
> >> ++12364+ '[' /vm/844dea4e-44f8-4e3e-8145-325132a31ca5 =3D /vm/cc97bc2f=
-3a91-43f7-8fbc-4cb92f90b4e4 -o 'No target' =3D /vm/cc97bc2f-3a91-43f7-8fbc=
-4cb92f90b4e4 -o /vm/844dea4e-44f8-4e3e-8145-325132a31ca5 =3D 'No other tar=
get' -o 'No target' =3D 'No other target' ']'
> >>
> >> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> >
> > Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
>
> I've committed this, but I take the absence of a Fixes: tag as indication
> that this doesn't want/need backporting.

Hmmm, maybe this should have a Fixes.  Sorry I didn't investigate that
better before submission.

Looks like this would be the commit:
https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dcommitdiff;h=3Df3a7ca02400d=
1c416e97451b4aebfaf608fc8192

f3a7ca02400d1 ("hotplug/Linux: fix same_vm check in block script")

I need to circle back on this.  IIRC, when I set up a conflicting
assignment of a writable disk to two VMs with block-tap, it was
allowed and not denied.  That is what prompted this change.

I'll have to double check there isn't something in the regular block
that might prevent that.

Regards,
Jason

