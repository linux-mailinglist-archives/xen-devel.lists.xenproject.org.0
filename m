Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 381E83011CE
	for <lists+xen-devel@lfdr.de>; Sat, 23 Jan 2021 02:01:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.73178.131951 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l37ID-0003m1-Hd; Sat, 23 Jan 2021 01:00:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 73178.131951; Sat, 23 Jan 2021 01:00:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l37ID-0003k5-EO; Sat, 23 Jan 2021 01:00:45 +0000
Received: by outflank-mailman (input) for mailman id 73178;
 Sat, 23 Jan 2021 01:00:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eRYf=G2=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1l37IB-00039y-SS
 for xen-devel@lists.xenproject.org; Sat, 23 Jan 2021 01:00:44 +0000
Received: from mail-qv1-xf2f.google.com (unknown [2607:f8b0:4864:20::f2f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c7f0623c-e524-4f41-adc5-355e7b94d142;
 Sat, 23 Jan 2021 01:00:43 +0000 (UTC)
Received: by mail-qv1-xf2f.google.com with SMTP id 2so3611686qvd.0
 for <xen-devel@lists.xenproject.org>; Fri, 22 Jan 2021 17:00:43 -0800 (PST)
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
X-Inumbo-ID: c7f0623c-e524-4f41-adc5-355e7b94d142
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=zededa.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=o5ofyMLIm5Vp1y7UCN5TmlGjzJ3WLUaP8rGCWg7TXOc=;
        b=IKcfmmxfwogA6b2ioXys6KL0PSXP2rmduany7wiZcdRYvowHZqQPpaDPmpXsidl8Gj
         8mnKniVmY5usB8CUpyPnytpyNCsvbmqF2yabTAeqLU0129BkWGAdjuSA/sd6QR5c3PgD
         h7QJ5Gl6y7VmVFfsWQ+x+d+LAMBgq3v72NqOQJr0X61wB8N//cAoeJ//9NZLRw2zuW0H
         3V0lxU7mIhQG1P5yIElkk5ZD2wv9dH9paW9oBEMQs7fULGJaEvzcVfn80HdpAyFYoEGP
         c/2UgIN6yLadOrhzXT50fnMgN1gsIdTCeLXjf0+IjGoV5bJAJ6JnQwZ1LQGAImoEuGk3
         bxAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=o5ofyMLIm5Vp1y7UCN5TmlGjzJ3WLUaP8rGCWg7TXOc=;
        b=ii+oNzHHmgKLpGMimZZBGhlmoGyr0pgRbQqFttjNKqz3i6eNihqTVZ+6KiOVQ2jOaV
         8ajZO5rQiTMSlK5s53eayp4DU+n4QlfSeyrQqE/rlSA0AseCnAeV8dVfggnfU6qWMt2I
         dwY2ZNE86AShERPe9cATe5xpW0PiIbWEWKsDZMXpUM56547O9xTVTdflfO8MFC0sWsM/
         j6Jrj/ih2QnwBNKhctMbVdOGX9o+wEAxJW5fanEIm1h3Gh09y35Mq4Vh84m+M8MIgZA2
         3pmmSjUxoNolQ0qB1knUAb8EnH/Nf/UrHdZkDPAfwIPkMeLWgu8Gb1JNcXACL1u5fOgl
         Qing==
X-Gm-Message-State: AOAM531+D2VxnuE5CdtgGxuyIhoc/259bI4bk/2eyd9wciyyoiTstZkW
	Dr4f0DtZ4aPLrSO8AMlxGDLsxWLcxP2MoGXskfE4ww==
X-Google-Smtp-Source: ABdhPJwBGOWMXEjybLhp5Ud+wde3/+sWArlu5cK2RTdIiI9PLXcOcOsvKCwDd4MBtXu3oER7Xc5GmNLOn7jj0WR9rvQ=
X-Received: by 2002:ad4:5188:: with SMTP id b8mr237923qvp.55.1611363642693;
 Fri, 22 Jan 2021 17:00:42 -0800 (PST)
MIME-Version: 1.0
References: <CAFnJQOouOUox_kBB66sfSuriUiUSvmhSjPxucJjgrB9DdLOwkg@mail.gmail.com>
 <alpine.DEB.2.21.2101221449480.14612@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2101221449480.14612@sstabellini-ThinkPad-T480s>
From: Roman Shaposhnik <roman@zededa.com>
Date: Fri, 22 Jan 2021 17:00:31 -0800
Message-ID: <CAMmSBy9i7Ci98zd-NHs_KSRPwQq4mweBLOd__t=jQncXVYA5sw@mail.gmail.com>
Subject: Re: Question about xen and Rasp 4B
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Jukka Kaartinen <jukka.kaartinen@unikie.com>, Xen-devel <xen-devel@lists.xenproject.org>, 
	Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, Jan 22, 2021 at 4:27 PM Stefano Stabellini
<sstabellini@kernel.org> wrote:
>
> + xen-devel, Roman,
>
>
> On Fri, 22 Jan 2021, Jukka Kaartinen wrote:
> > Hi Stefano,
> > I'm Jukka Kaartinen a SW developer working on enabling hypervisors on mobile platforms. One of our HW that we use on development is
> > Raspberry Pi 4B. I wonder if you could help me a bit :).
> >
> > I'm trying to enable the GPU with Xen + Raspberry Pi for dom0. https://www.raspberrypi.org/forums/viewtopic.php?f=63&t=232323#p1797605
> >
> > I got so far that GPU drivers are loaded (v3d & vc4) without errors. But now Xen returns error when X is starting:
> > (XEN) traps.c:1986:d0v1 HSR=0x93880045 pc=0x00007f97b14e70 gva=0x7f7f817000 gpa=0x0000401315d000
> >  I tried to debug what causes this and looks like find_mmio_handler cannot find handler.
> > (See more here: https://www.raspberrypi.org/forums/viewtopic.php?f=63&t=232323&start=25#p1801691 )
> >
> > Any ideas why the handler is not found?
>
>
> Hi Jukka,
>
> I am glad to hear that you are interested in Xen on RaspberryPi :-)  I
> haven't tried the GPU yet, I have been using the serial only.
> Roman, did you ever get the GPU working?

I've never tested it with X -- sorry. But I have to ask what kernel is being
used? It made a lot of difference for me to actually STOP using RPi
supplied kernels and switch directly to 5.10.7.

Thanks,
Roman.

