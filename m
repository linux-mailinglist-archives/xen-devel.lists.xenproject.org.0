Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5404E20988D
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jun 2020 04:38:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1joHmJ-0006Wi-Py; Thu, 25 Jun 2020 02:38:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oVq+=AG=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1joHmH-0006Wc-RV
 for xen-devel@lists.xenproject.org; Thu, 25 Jun 2020 02:38:13 +0000
X-Inumbo-ID: e9e04f8e-b68c-11ea-bca7-bc764e2007e4
Received: from mail-lj1-x244.google.com (unknown [2a00:1450:4864:20::244])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e9e04f8e-b68c-11ea-bca7-bc764e2007e4;
 Thu, 25 Jun 2020 02:38:13 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id 9so4787169ljv.5
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2020 19:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=h0aax/W+hPyh1wto9kh47ORvApsOtay8uUSNvlfQm5c=;
 b=OoKbiIiyeix93l2WqzTKQ5Naay5CV/aSOvgTRB50yJQOAjz7Rrko5wq38ijI1njEw9
 sKP8ESdLTmQqcNQ8tSrKwzJTlEzMM6NWG+SinmVPSNrI73TpkNk7pgLVy1C31exoUD9e
 EkUDxGJs1DvgqYjYlh5ByJkqUltV4p330Co3ZR2FWCQh3aT+OeHCHmnuhsiCWxx9jRoJ
 fMwGyScncIMKBZjHNntX60Bznj0nnS2g2cW8NJ/F8BksMXSDuGQ8m1PtMM8xv67EIEWv
 w4QQ3nsWcvNnp4DPQc13D+PM3LaZG7BvNhn3EH02kKbQ1nn+qAsTUBWOfHH2VoGwnDxV
 ZXTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h0aax/W+hPyh1wto9kh47ORvApsOtay8uUSNvlfQm5c=;
 b=gLwH1pZcmSdfKzVcoWLwIRO3v26B9So563zdIPW+zqzt7flmCn9fAR+XbRXHOacn26
 GuL7qv4AdlTZrrcSGYbEMYbaz5vvEnyGFQ9Px0u/SfKZE1NSisFONDul2sfsakKRzGc/
 tmLAvEloXAD1ZwubeAb2h/L9Uyj3JslYMckLypsDEKsU04cOkazx2luLvXBmAn5q7BIi
 FBGa31m0AC/jnnySG/hm7pqD+niHIafOEAKPU37raf4w0hZU8Mk6BXRNz8xW4mLAWwD5
 CdfXm8aghBxI07Lzb1LNQ0TXieu4sLBDOeN2I+IaLYorLHqMQi1OqSWbhcZ/UjBaXzo8
 tYPA==
X-Gm-Message-State: AOAM532uPVWOehsx79L3bLlALspAq3lZWvcLxq9OuPOErB1SowMZUame
 otguznh4P0scttW9mKhp3OvASnOcxqSPwhtHdLU=
X-Google-Smtp-Source: ABdhPJw41r6Hj8uhqS/iUICTysk3gLFkOcYY7waiJe6R75sR4fpwPf8XaOK7+6tG59wIupxd8FNjV74lOTVd7c5NhlM=
X-Received: by 2002:a2e:9141:: with SMTP id q1mr14768939ljg.196.1593052691722; 
 Wed, 24 Jun 2020 19:38:11 -0700 (PDT)
MIME-Version: 1.0
References: <3bfd6384-fcaf-c74a-e560-a35aafa06a43@suse.com>
 <20200512141947.yqx4gmbvqs4grx5g@liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
 <fa507eab-547a-c0fb-9620-825aba5f55b2@suse.com>
 <4b90b635-84bb-e827-d52e-dfe1ebdb4e4d@citrix.com>
 <814db557-4f6a-020d-9f71-4ee3724981e3@suse.com>
 <CAKf6xps0XDRTUJsbE1zHpn=h98yTN+Y1DzaNpVGzhhJGVccRRw@mail.gmail.com>
 <20200512195005.GA96154@mattapan.m5p.com>
 <049e0022-f9c1-6dc9-3360-d25d88eeb97f@citrix.com>
 <20200512225458.GA1530@mattapan.m5p.com>
 <24253.9543.974853.499775@mariner.uk.xensource.com>
 <0b449d5a-9629-8e41-5354-b985a063eba4@suse.com>
 <24307.32018.502303.817846@mariner.uk.xensource.com>
In-Reply-To: <24307.32018.502303.817846@mariner.uk.xensource.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 24 Jun 2020 22:37:59 -0400
Message-ID: <CAKf6xpvLrXkBR6okFQ9u=9GfN-h_XHeLtwQV9pBRRAFXmbwVsQ@mail.gmail.com>
Subject: Re: [XEN RFC for-4.14] Re: use of "stat -"
To: Ian Jackson <ian.jackson@citrix.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Elliott Mitchell <ehem+xen@m5p.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Jun 24, 2020 at 12:19 PM Ian Jackson <ian.jackson@citrix.com> wrote:
>
> Jan Beulich writes ("Re: use of "stat -""):
> > [CAUTION - EXTERNAL EMAIL] DO NOT reply, click links, or open attachments unless you have verified the sender and know the content is safe.
> > On 14.05.2020 13:02, Ian Jackson wrote:
> > > I've read this thread.  Jan, I'm sorry that this causes you
> > > inconvenience.  I'm hoping it won't come down to a choice between
> > > supporting people who want to ship a dom0 without perl, and people who
> > > want a dom0 using more-than-a-decade-old coreutils.
> > >
> > > Jan, can you tell me what the output is of this on your ancient
> > > system:
> > >
> > >   $ rm -f t
> > >   $ >t
> > >   $ exec 3<t
> > >   $ stat -L -c '%F %i' /dev/stdin <&3
> > >   regular empty file 393549
> > >   $ rm t
> > >   $ stat -L -c '%F %i' /dev/stdin <&3
> > >   regular empty file 393549
> > >   $ strace -ou stat -L -c '%F %i' /dev/stdin <&3
> > >   $
> >
> > $ rm -f t
> > $ >t
> > $ exec 3<t
> > $ stat -L -c '%F %i' /dev/stdin <&3
> > regular empty file 3380369
> > $ rm t
> > $ stat -L -c '%F %i' /dev/stdin <&3
> > regular empty file 3380369
> > $ strace -ou stat -L -c '%F %i' /dev/stdin <&3
> > regular empty file 3380369
> >
> > > Also, the contents of the file "u" afterwards, please.
> >
> > Attached.
>
> Thanks.
>
> I think this means that `stat -' can be replaced by `stat /dev/stdin'.
>
> This script is only run on Linux where /dev/stdin has existed
> basically forever.  The strace output shows
>   stat("/dev/stdin", {st_mode=S_IFREG|0644, st_size=0, ...}) = 0
> and the transcript shows that your stat(1) behaves as I hope.
>
> Jan, will you send a patch ?  It is best if someone else but me writes
> it and tests it because then I am a "clean" reviewer.
>
> Paul, supposing I review such a patch and say it is low risk, and we
> commit it by Friday, can it have a release-ack ?

I was going to just write a patch to replace - with /dev/stdin and ask
Jan to test it.  When I opened the script, this comment was staring at
me:
        # We can't just stat /dev/stdin or /proc/self/fd/$_lockfd or
        # use bash's test -ef because those all go through what is
        # actually a synthetic symlink in /proc and we aren't
        # guaranteed that our stat(2) won't lose the race with an
        # rm(1) between reading the synthetic link and traversing the
        # file system to find the inum.

On my system:
$ ls -l /dev/stdin
lrwxrwxrwx 1 root root 15 Jun 24 21:13 /dev/stdin -> /proc/self/fd/0
$ ls -l /proc/self/fd/0 0<lockfile
lrwx------ 1 jason jason 64 Jun 24 21:26 /proc/self/fd/0 -> /home/jason/lockfile

stat /dev/stdin will work around the lack of `stat -` support, but it
doesn't address the race in the comment.  Is the comment valid?  How
would we prove there is no race for /dev/stdin?  And as a refresher,
`stat -` does an fstat(0), so there is no symlink lookup.  Or is there
no race since `stat /proc/self/fd/0` isn't a symlink lookup but just
accessing the already open fd via the proc special file? i.e.
equivalent to fstat.

I've mentioned it before, but maybe we should just use the Qubes
patch.  It leaves the lockfile even when no-one is holding the lock,
but it simplifies the code and sidesteps the issues we are discussing
here.
https://github.com/QubesOS/qubes-vmm-xen/blob/xen-4.13/patch-tools-hotplug-drop-perl-usage-in-locking-mechanism.patch

Regards,
Jason

