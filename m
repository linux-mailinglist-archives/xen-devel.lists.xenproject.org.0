Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 065BF34A7CB
	for <lists+xen-devel@lfdr.de>; Fri, 26 Mar 2021 14:05:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101784.194883 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPm8l-0002vA-C9; Fri, 26 Mar 2021 13:04:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101784.194883; Fri, 26 Mar 2021 13:04:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPm8l-0002ul-8k; Fri, 26 Mar 2021 13:04:39 +0000
Received: by outflank-mailman (input) for mailman id 101784;
 Fri, 26 Mar 2021 13:04:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PDWI=IY=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1lPm8j-0002ug-Cl
 for xen-devel@lists.xenproject.org; Fri, 26 Mar 2021 13:04:37 +0000
Received: from mail-wr1-x42d.google.com (unknown [2a00:1450:4864:20::42d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9562b249-3f54-4c5e-ac60-5e67ac6dc2fb;
 Fri, 26 Mar 2021 13:04:36 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id e18so5583359wrt.6
 for <xen-devel@lists.xenproject.org>; Fri, 26 Mar 2021 06:04:36 -0700 (PDT)
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
X-Inumbo-ID: 9562b249-3f54-4c5e-ac60-5e67ac6dc2fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=m2UYKX1/6zIOYAC/KKX0/ymawhTpBnOIv7CFkEyzlSs=;
        b=mUgplqPkaKnxTdy+5bVbhxtwFpI2yllZmXNBDMXneawgbOOevyOsmtkJQ0afiJPwpa
         r1gFvIi/zCnz5dMtoegJ6imdKk+KbK9m8S/AKFbICLYPqEJc7ZkpPuBwmSPKl+wLsgja
         /5P09PgsBYWbeTeEHjK+6QybBwIpwkJXdbF+ohHMxYsn9QT0Kwt8NspA1WJQbiKgeqiR
         JPSCHnfamjXUCu5S4PdFm9sLvCXBOAI6eQWMvgc5QkavM7tozvV/jeZkoa8/HFnvau3M
         kr+aJ/OgazC2hECGKGhDEe/mQ8En4e47T8GzwuI/ke3rTGX9XsqHzUbWowg/Gz9dGj3r
         pKxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=m2UYKX1/6zIOYAC/KKX0/ymawhTpBnOIv7CFkEyzlSs=;
        b=YMquWsgvt2wzUhozCPSkrhktmdNME8NS+r4dbkM//k6C5cJK/bR9fgJEwZeUv8ZIrW
         kJiKFtadC1EzPTwOeXZMpQQFV1buu2K+QgpWdocs+miuWGCynncDkr+Gbswmbz9UeeUi
         FiuK1BqGNwruFI5x6zqNxyLuY8QhTg5Yf0H3mcQIM7kYKM0o2lzG/+9Sdv7ugU9O2wOL
         lhF2J/suHl4xku9KzlRcm6WEuAPEagJ6BTJWpSBMTz0EylCQGjfvFJjKNCGfMVwrXC/J
         nQ3bnjxhU6vKg05PcJ3S+Tb9W8t3vK00HmO/qZMmE/buTswnkksUUx3wpaHEnuMjhCTD
         F7ug==
X-Gm-Message-State: AOAM531u5oDZHfHWektbrUo1HGoQLAHldz61WF4jAwZRPqOR23OJHzCO
	+Hzn21qQ2cPulqycrFPUPQEy7vfynkznpIKuhfM3atWUUHA=
X-Google-Smtp-Source: ABdhPJwiPTI5KGtfazkuvGAbZ/9IvwFCYq5OC14Lvik92Rp1JDazoRkeeM+GvVblBdcqvIm43p0IxB6dD39u6tCUyXw=
X-Received: by 2002:a5d:4bcb:: with SMTP id l11mr11477696wrt.390.1616763875399;
 Fri, 26 Mar 2021 06:04:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210325165224.10306-3-andrew.cooper3@citrix.com>
 <20210325172132.14980-1-andrew.cooper3@citrix.com> <24669.52641.499147.88002@mariner.uk.xensource.com>
 <24669.54213.173154.400771@mariner.uk.xensource.com>
In-Reply-To: <24669.54213.173154.400771@mariner.uk.xensource.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Fri, 26 Mar 2021 09:03:59 -0400
Message-ID: <CABfawh=O1hdycEr0+=JXU6USZ8DAzQvKoXQOnRnoWL643FTa+g@mail.gmail.com>
Subject: Re: [PATCH v1.1 2/2] x86/hpet: Don't enable legacy replacement mode unconditionally
To: Ian Jackson <iwj@xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>, 
	Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	=?UTF-8?B?RnLDqWTDqXJpYyBQaWVycmV0?= <frederic.pierret@qubes-os.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 26, 2021 at 8:30 AM Ian Jackson <iwj@xenproject.org> wrote:
>
> I wrote:
> > I'm sorry, but I think it is too late for 4.15 to do this.  I prefer
> > Jan's patch which I have alread release-acked.
> >
> > Can someone qualified please provide a maintainer review for this,
> > ideally today ?
>
> I asked Andrew on IRC:
>
> 12:08 <Diziet> andyhhp__: Are you prepared to maintainer-ack Jan's
>                more-minimal hpet workaround approach ?
> 12:16 <andyhhp__> Diziet: honestly, no.  I don't consider that
>                   acceptable behaviour, and it is a fairly big "f you"
>                   (this was literally feedback I got in private) to
>                   the downstreams who've spent years trying to get us
>                   to fix this bug, and have now backported the first
>                   version.
> 12:16 <andyhhp__> I'm looking into the feedback on my series
> 12:17 <andyhhp__> one way or another, the moment we enter the fallback
>                   path for interrupt routing, something is very broken
>                   on the system
> 12:19 <andyhhp__> so the tradeoff is an unspecified bug on one ancient
>                   laptop which can't be tested now, vs 5 years of Atom
>                   CPUs, 2 years of latop CPUs, and the forthcoming
>                   Server line of Intel CPUs
> 12:19 <andyhhp__> or whatever other compromise we can work on
>
> I'm sorry that this bug is going to continue to be not properly fixed.
> As I understand it the practical impact is that users of those
> affected systems (the newer ones you mention) will have to add a
> command-line option.  That is, unfortunately, the downside of
> time-based releases.  If we had been having this conversation two
> weeks ago I would have very likely had a different answer.

The problem from my perspective is that the end-users have no way to
determine when that boot option is needing to be set. Having an
installation step of "check if things explode when you reboot" is just
plain bad. Many times you don't even have access to a remote serial
console to check why Xen didn't boot. So that's not a realistic route
that can be taken. If Jan's patch is applied then the only thing I'll
be able to do is make all installations always-enable this option even
on systems that would have booted fine otherwise without it. It is
unclear if that has any downsides of its own and could very well just
kick the can down the road and lead to other issues.

Tamas

