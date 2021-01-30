Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C5E13097B0
	for <lists+xen-devel@lfdr.de>; Sat, 30 Jan 2021 19:54:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.79002.143796 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5vNZ-0002iM-80; Sat, 30 Jan 2021 18:53:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 79002.143796; Sat, 30 Jan 2021 18:53:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5vNZ-0002hx-4h; Sat, 30 Jan 2021 18:53:53 +0000
Received: by outflank-mailman (input) for mailman id 79002;
 Sat, 30 Jan 2021 18:53:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DC5f=HB=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1l5vNX-0002hs-CY
 for xen-devel@lists.xenproject.org; Sat, 30 Jan 2021 18:53:51 +0000
Received: from mail-qv1-xf2d.google.com (unknown [2607:f8b0:4864:20::f2d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 47698bc7-31fd-4cbf-9cd3-2870c3fcc1cd;
 Sat, 30 Jan 2021 18:53:50 +0000 (UTC)
Received: by mail-qv1-xf2d.google.com with SMTP id j13so6164798qvu.10
 for <xen-devel@lists.xenproject.org>; Sat, 30 Jan 2021 10:53:50 -0800 (PST)
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
X-Inumbo-ID: 47698bc7-31fd-4cbf-9cd3-2870c3fcc1cd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=zededa.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ygf5191TXY/ER33epdRheEnfGbESSDofM8QQmH5Dbgw=;
        b=SfOL9br/G19JG6chUHmt5g1W+RZUyH4f1c0BgsM56FLWb45WCMZnafGE2NtcxSsKmL
         NDoJN6R1DZjvs8YCxkycMmuO+6P/Jac5rpgHOC/N64I7/+tOoGbqO1MI1LOhJr5F/GUG
         c1Wyw11mPFETySVV9qTV+IkUGB6qW/vJOr53vgRjf70G7xjHpG8AtDSebbtsOHmkE8vx
         C4eaYAEEWXEZGOznbfL4dTewXImq0GozBu5gmFpzNHGk2QAyVBzMXpUfrleiSz+6hen4
         3xqSuUjzc7fOHsngMX/G1U/b2t3/uiGytzZq944TBB1cNoNdq+KeHMh1hfVpDHb8vzOW
         B3hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ygf5191TXY/ER33epdRheEnfGbESSDofM8QQmH5Dbgw=;
        b=Ao57fGe/7wpHu5BSJ8oJtX34W5hCPWIHEE8cP92lg8nT73MGEzbNYWzwRcCHaCBDCj
         6tPrGxSN4Kbd18NjaY4vLQtpnjVdZcmnhwvIthZtzaamexjN/1RUprDeJYDffTIr0URK
         pzdbK6/QCyTU9ts7eJjIUMdyLq3oLKQxvy2LShl9elIpZ8NJ/hVkFiTMtre1AQpERema
         kUfdsKJ0IJGBgS13vJXaobGc1dQT2Di57+BBPq6+zY7jvub5fvs+wc4UKdjE6+bBf2Yd
         xnvFOCP08j5yXzgEbnsXYeEDt5BxtA8wIrIPp0JyA4LXIN5T1BdAeDlHw9aTK27rvriY
         yQQg==
X-Gm-Message-State: AOAM533LE51mrJIYhbb8jVKnZxvw6tMXW0UmwuHSfUfQZOFvC4UFzGaJ
	862iSw/G6vewOEBVA1O6iyL1Vq92K4Q9drmbQHLwLPMRayk=
X-Google-Smtp-Source: ABdhPJzM+GqPVcNP6YM4c2kj8gOb1ArQCCZdOS33WDf568f25LZo3p2uh1dc4nTEcndZrzXwpe7MlUBFsTREROsQt8w=
X-Received: by 2002:a0c:f582:: with SMTP id k2mr8949485qvm.55.1612032829880;
 Sat, 30 Jan 2021 10:53:49 -0800 (PST)
MIME-Version: 1.0
References: <CAMmSBy-wXf+YHa_m1N37537EQfUrs8RVi2i=Ur6yXGtJV_bCgQ@mail.gmail.com>
 <91837fa8-1d57-8b37-bf66-9e021855348d@suse.com>
In-Reply-To: <91837fa8-1d57-8b37-bf66-9e021855348d@suse.com>
From: Roman Shaposhnik <roman@zededa.com>
Date: Sat, 30 Jan 2021 10:53:39 -0800
Message-ID: <CAMmSBy8vHstYXPUOZS1byK+JtcJRC_WqZXU8jtd4CJHUop3eGg@mail.gmail.com>
Subject: Re: Troubles analyzing crash dumps from xl dump-core
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 29, 2021 at 11:28 PM J=C3=BCrgen Gro=C3=9F <jgross@suse.com> wr=
ote:
>
> On 29.01.21 21:12, Roman Shaposhnik wrote:
> > Hi!
> >
> > I'm trying to see how much mileage I can get out of
> > crash(1) 7.2.8 (based on gdb 7.6) when it comes to
> > analyzing crash dumps taken via xl dump-core (this
> > is all on x86_64 with stock Xen v. 4.14).
> >
> > The good news is that the image actually does load
> > up but it throws the following WARNINGs in the process:
> >
> > WARNING: cannot access vmalloc'd module memory
> > crash: read error: kernel virtual address: ffffffff93613480  type:
> > "fill_task_struct"
> > WARNING: active task ffffffff93613480 on cpu 0 not found in PID hash
> > crash: read error: kernel virtual address: ffffffff93613480  type:
> > "fill_task_struct"
> > WARNING: cannot read log_buf contents
> >
> > And then the info that it gives me around basic things like
> > ps, mod, log, etc. is really super limited (and I am now suspecting
> > may even be wrong).
> >
> > Since I was primarily after dmesg/log initially, I tried:
> > crash> log
> > log: WARNING: cannot read log_buf contents
> >
> > Then I tried taking an xl dump-core from the domU that was still
> > very much alive and happy and got similar results -- so it clearly
> > doesn't seem to be related to the state domU is in.
> >
> > As matter of fact, I actually got to the desired dmesg output
> > by simply running strings(1) on the core file -- so the info is
> > definitely there -- but I guess some kind of index/reference maybe
> > broken.
> >
> > With all that in mind, if there's anyone on this ML who has recently
> > done Xen DomU crash dump analysis -- I would definitely appreciate
> > the pointers!
>
> For me it just works (openSUSE).

Can you please run:

crash --version and readelf -a XXXX (on the xl dump-core output)
and post the results?

also, what version of  Xen are you using?

> I tried a pv guest only with a 4.4 kernel, though.

I would really appreciate it if you could try it on HVM so that
I know whether it is an issue that only affects my setup or
other folks (especially after seeing answers to above).

Thanks,
Roman.

