Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C371A209E16
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jun 2020 14:06:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1joQcp-0004QT-25; Thu, 25 Jun 2020 12:05:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oVq+=AG=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1joQcn-0004QO-Rj
 for xen-devel@lists.xenproject.org; Thu, 25 Jun 2020 12:05:02 +0000
X-Inumbo-ID: 182eb868-b6dc-11ea-8496-bc764e2007e4
Received: from mail-lf1-x144.google.com (unknown [2a00:1450:4864:20::144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 182eb868-b6dc-11ea-8496-bc764e2007e4;
 Thu, 25 Jun 2020 12:05:01 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id g2so3083038lfb.0
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jun 2020 05:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TGe16ZbfddTf3KRBM/WlXgxyF2K+cWOwBxXn1q46L40=;
 b=uN4w6K85y3Mwq+2CuXJ5S/LmkwLXFkRQcqwpjCdFkTWkM+4flilBBGXx1P4IL7fzTi
 DJvcJiIWohJ9fHcYcm0sptr354UGbWzVOpZFJ3Fixa2R6hVh/0Dn/Mdbii9z4NrH2g47
 teNkR8QqkuWtCdLyuWJegaxyRZLjAov+3SfllCsTjo1CnRn4a4t0tuBLazDcdI8gQLbN
 y3Gwg7xOwgmac1t6iYEuaacrTgxVWsOzJQ8fT//9H5S+CM2imECKHN2OTgH7jPGOPOLh
 008xoT2h3nfoTvo6uZrw8KEem/lNUGwfu3XmdtI1vB7lwyEoyrWwkJqD6s81QbHoYu4k
 hGHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TGe16ZbfddTf3KRBM/WlXgxyF2K+cWOwBxXn1q46L40=;
 b=TonJWzM3m4wD+RWnXKEWXdIP3mtlmyLY0GuxxJNTjC37erHv739s4ocJaD7k+2ftzj
 OQLEgSBOdmJYmkvLvrDxG3y/Out/U1uGhtV8KbeHhHePDY+Oi2HM669COPyU+CtRfeEj
 2dr/DVh74t6qIucSdJlz3bY+5UtjTET808Gv8D4+mnllMmTf8u1XmDBxQsW8TuLcIvtY
 dnfTr/GW3scxuAmJ7j9S1qC+wMYOFeVxm2ksONVoT8apmnS6C90eD/jFGlJXs3feNrkC
 OBoESjko3meKLBvBjlRMz77tv2E5L4bOEbjfOWx+vgd/X0IIgrk+Hfav3OtkE6hg9RwE
 mkQQ==
X-Gm-Message-State: AOAM531Nv8EASbA8pUcS34saZi+hUE4ho1Zeo6tEMAzXHtzbrbjNO0Nk
 8XysNVoem2aJu7JjT8nyqMzvezYtw6UKc9rULH0=
X-Google-Smtp-Source: ABdhPJwQzWTmtHsT59xsPnwoyi/L/UC2u4L84f57b3bPrvOuJ4jiGDu92IBZqhGpOKim+VbqoDrNBZuKdCGBfZwKEck=
X-Received: by 2002:a19:7111:: with SMTP id m17mr13008468lfc.156.1593086699767; 
 Thu, 25 Jun 2020 05:04:59 -0700 (PDT)
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
 <CAKf6xpvLrXkBR6okFQ9u=9GfN-h_XHeLtwQV9pBRRAFXmbwVsQ@mail.gmail.com>
 <6cd9c568-84b9-8304-d56f-99d628d945a1@suse.com>
In-Reply-To: <6cd9c568-84b9-8304-d56f-99d628d945a1@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Thu, 25 Jun 2020 08:04:48 -0400
Message-ID: <CAKf6xptYKgDZ+Se_OY6SFVY-E1q5VWqgb60xryAqehBun6-JUA@mail.gmail.com>
Subject: Re: [XEN RFC for-4.14] Re: use of "stat -"
To: Jan Beulich <jbeulich@suse.com>
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
Cc: Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, Elliott Mitchell <ehem+xen@m5p.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Jun 25, 2020 at 3:05 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 25.06.2020 04:37, Jason Andryuk wrote:
> > On Wed, Jun 24, 2020 at 12:19 PM Ian Jackson <ian.jackson@citrix.com> wrote:
> >>
> >> Jan Beulich writes ("Re: use of "stat -""):
> >>> [CAUTION - EXTERNAL EMAIL] DO NOT reply, click links, or open attachments unless you have verified the sender and know the content is safe.
> >>> On 14.05.2020 13:02, Ian Jackson wrote:
> >>>> I've read this thread.  Jan, I'm sorry that this causes you
> >>>> inconvenience.  I'm hoping it won't come down to a choice between
> >>>> supporting people who want to ship a dom0 without perl, and people who
> >>>> want a dom0 using more-than-a-decade-old coreutils.
> >>>>
> >>>> Jan, can you tell me what the output is of this on your ancient
> >>>> system:
> >>>>
> >>>>   $ rm -f t
> >>>>   $ >t
> >>>>   $ exec 3<t
> >>>>   $ stat -L -c '%F %i' /dev/stdin <&3
> >>>>   regular empty file 393549
> >>>>   $ rm t
> >>>>   $ stat -L -c '%F %i' /dev/stdin <&3
> >>>>   regular empty file 393549
> >>>>   $ strace -ou stat -L -c '%F %i' /dev/stdin <&3
> >>>>   $
> >>>
> >>> $ rm -f t
> >>> $ >t
> >>> $ exec 3<t
> >>> $ stat -L -c '%F %i' /dev/stdin <&3
> >>> regular empty file 3380369
> >>> $ rm t
> >>> $ stat -L -c '%F %i' /dev/stdin <&3
> >>> regular empty file 3380369
> >>> $ strace -ou stat -L -c '%F %i' /dev/stdin <&3
> >>> regular empty file 3380369
> >>>
> >>>> Also, the contents of the file "u" afterwards, please.
> >>>
> >>> Attached.
> >>
> >> Thanks.
> >>
> >> I think this means that `stat -' can be replaced by `stat /dev/stdin'.
> >>
> >> This script is only run on Linux where /dev/stdin has existed
> >> basically forever.  The strace output shows
> >>   stat("/dev/stdin", {st_mode=S_IFREG|0644, st_size=0, ...}) = 0
> >> and the transcript shows that your stat(1) behaves as I hope.
> >>
> >> Jan, will you send a patch ?  It is best if someone else but me writes
> >> it and tests it because then I am a "clean" reviewer.
>
> I was about to, when I saw this reply from Jason.
>
> >> Paul, supposing I review such a patch and say it is low risk, and we
> >> commit it by Friday, can it have a release-ack ?
> >
> > I was going to just write a patch to replace - with /dev/stdin and ask
> > Jan to test it.  When I opened the script, this comment was staring at
> > me:
> >         # We can't just stat /dev/stdin or /proc/self/fd/$_lockfd or
> >         # use bash's test -ef because those all go through what is
> >         # actually a synthetic symlink in /proc and we aren't
> >         # guaranteed that our stat(2) won't lose the race with an
> >         # rm(1) between reading the synthetic link and traversing the
> >         # file system to find the inum.
> >
> > On my system:
> > $ ls -l /dev/stdin
> > lrwxrwxrwx 1 root root 15 Jun 24 21:13 /dev/stdin -> /proc/self/fd/0
> > $ ls -l /proc/self/fd/0 0<lockfile
> > lrwx------ 1 jason jason 64 Jun 24 21:26 /proc/self/fd/0 -> /home/jason/lockfile
> >
> > stat /dev/stdin will work around the lack of `stat -` support, but it
> > doesn't address the race in the comment.  Is the comment valid?  How
> > would we prove there is no race for /dev/stdin?  And as a refresher,
> > `stat -` does an fstat(0), so there is no symlink lookup.  Or is there
> > no race since `stat /proc/self/fd/0` isn't a symlink lookup but just
> > accessing the already open fd via the proc special file? i.e.
> > equivalent to fstat.
>
> Looking at vfs_statx() in the kernel, I can't see any provisions to
> get at the data without traversing the specified path.

Ian, you wrote the comment originally.  Would you please clarify the
scenario where there is a race?  Only the lock holder is allowed to rm
the lockfile, so how is there a race between rm and stat?

Regards,
Jason

