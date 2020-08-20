Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D2A24C5C1
	for <lists+xen-devel@lfdr.de>; Thu, 20 Aug 2020 20:42:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k8pVu-0007qx-Oe; Thu, 20 Aug 2020 18:42:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eCh+=B6=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1k8pVt-0007qs-1C
 for xen-devel@lists.xenproject.org; Thu, 20 Aug 2020 18:42:13 +0000
X-Inumbo-ID: 88fa5900-e7ff-480b-9ca5-610a058c8be7
Received: from mail-qt1-x844.google.com (unknown [2607:f8b0:4864:20::844])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 88fa5900-e7ff-480b-9ca5-610a058c8be7;
 Thu, 20 Aug 2020 18:42:11 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id x12so1953718qtp.1
 for <xen-devel@lists.xenproject.org>; Thu, 20 Aug 2020 11:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zededa.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qmLsthoivadHhJSlkqVIUqWfQFbA2tU4OCnlfAeEmCI=;
 b=S9ZWEvVCIVCBxEKBq0oJ/3uMVo/+N+pFbTpW42S2Ta0/RGcjeIqaFlBdnJxLCt14Vb
 y5vVV+nbg3DgloMaWfDdFcLP9Y6zETdwRXd3YwoAosUz/Kv+WMBQJCpehqtB6L65V4ok
 cXoWXD7bi26LN0uWXw0HaWtOocif7+Fs6YWoG/ucZhAiEIm2RrqNWnEZdgIiTKqNiagm
 Vzb45cyxVuqxCH2zVEZTLuJZFpcYnam5kL+bMhqp1DD466H2IlEkIRzZkEvPFQhN++4M
 +6dwvoaSXwuYcg7teIij4COJG3csfIlLAI+7FSHeLtU/XAH8a5eISbmV78XHwkAdgZN5
 E6/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qmLsthoivadHhJSlkqVIUqWfQFbA2tU4OCnlfAeEmCI=;
 b=uC8bSdnppj/fjSXqNasZ+40J9kbTrOU8Yqdf8QNovmbsyQCSxOSn7PKZRH6nzhg980
 G0MowarQUWZ+OrrJ0c+qsEdo6D/b5yE5P9XA7IsWf/DN+SZ/kVK58he0KOEDe42OLO2M
 qovkfxlsfO9hatxDKhcpEv66DWb5WdpkzpfRAo3DBumgsDVFRt+awmrofjDbG61cq2ak
 1KtpvgkBCRP9UrMJe9gTOTr3k+t7oQdS+9nQMwkSiTQG+zClpBmcvSELb/uP1DgQVC0g
 QxKFnSvOdTRIj/9nZ4Eq+3HJc2FDhzmTw+rhc2Jk18QWBO/I68oZYS5+0bwu8R/fZOVF
 p+FA==
X-Gm-Message-State: AOAM531eTmjcEEB+ZCW/hzDZJp6Lf7n9X1yp/O8k2ubzkYaJA91cN3At
 N4oeaZ++ZblS6JEuHTzMW2OYYp+7YlHvwRtCvEtaGw==
X-Google-Smtp-Source: ABdhPJyTCCioU3H7Zx8BLRmc4vvlPIaKd2O87jhuyJpAwKPPhrkvW0C1wNk9rJSVxzOZoeNq65bN8Z4KMLPzQd+m6rw=
X-Received: by 2002:ac8:528b:: with SMTP id s11mr3886990qtn.63.1597948929998; 
 Thu, 20 Aug 2020 11:42:09 -0700 (PDT)
MIME-Version: 1.0
References: <CAMmSBy-EduiWV-rZfykc8Xh6GyOBAe5VNF44p6HjR8kn_bDZjA@mail.gmail.com>
 <8a01a6e3-a786-2d68-5640-343bcc084b45@xen.org>
 <CAMmSBy92Aiz8btqkEbU9oVJifJ3ft0htPpjObGz-wYVjXuwvoQ@mail.gmail.com>
 <af097943-89fe-76db-54f4-89a3e534d586@xen.org>
 <d921de55-e26a-e5e7-2a4d-b34fca2e8875@epam.com>
In-Reply-To: <d921de55-e26a-e5e7-2a4d-b34fca2e8875@epam.com>
From: Roman Shaposhnik <roman@zededa.com>
Date: Thu, 20 Aug 2020 11:41:58 -0700
Message-ID: <CAMmSBy9Yr5GnTtckKNDkZn7AL7cAg6OqvV7PWyMTgwqUoim-LA@mail.gmail.com>
Subject: Re: u-boot vs. uefi as boot loaders on ARM
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Cc: Julien Grall <julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>, 
 "vicooodin@gmail.com" <vicooodin@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Aug 20, 2020 at 4:27 AM Oleksandr Andrushchenko
<Oleksandr_Andrushchenko@epam.com> wrote:
>
>
> On 8/20/20 1:50 PM, Julien Grall wrote:
> > Hi Roman,
> >
> > On 16/08/2020 21:45, Roman Shaposhnik wrote:
> >> On Sun, Aug 16, 2020 at 7:54 AM Julien Grall <julien@xen.org> wrote:
> >>> On 15/08/2020 21:43, Roman Shaposhnik wrote:
> >>>> Hi!
> >>>
> >>> Hi,
> >>>
> >>>> with the recent excellent work by Anastasiia committed to the u-boot's
> >>>> main line, we now have two different ways of bringing ARM DomUs.
> >>>>
> >>>> Is there any chance someone can educate the general public on pros
> >>>> and cons of both approaches?
> >>>>
> >>>> In Project EVE we're still using uefi on ARM (to stay closer to the more
> >>>> "ARM in the cloud" use case) but perhaps the situation now is more
> >>>> nuanced?
> >>>
> >>> UEFI is just standard, so I am guessing you are referring to
> >>> Tianocore/EDK2. am I correct?
> >>
> >> Yes, but I was actually referring to both in a way (I should've been
> >> clearer tho).
> >> To be more explicit my question was around trying to compare a "standardized"
> >> way of botting a generic DomU on ARM (and that standard is UEFI with one
> >> particular implementation that works out of the box with Xen being TC/EDK2) with
> >> a more ad-hoc u-boot style of booting.
> >>
> >>> Recent version of U-boot are also able to partially UEFI. This means you
> >>> could easily use GRUB with U-boot.
> >>
> >> Yup -- which complicated things even more. And it is funny you should mention
> >> it, since we actually started with TC/EDK2 for RaspberryPi4 as a board
> >> bootloader,
> >> but quickly switched to u-boot with UEFI shim layer, since it was much smaller,
> >> better supported (still?) and gave us all we needed to boot Xen on RPi4 as a
> >> UEFI payload.
> >>
> >>>  From my understanding, U-boot is just a bootloader. Therefore it will
> >>> not provide runtime services (such as date & time).
> >>
> >> It actually does provide some of that (see below)
> >
> > Cool! Although, it looks mostly related to the environment variable though.
> >
> >>
> >>> Furthermore, the
> >>> interface is less user friendly, you will have to know the memory layout
> >>> in order to load binaries.
> >>>
> >>> On the other hand, Tianocore/EDK2 is very similar to what non-embedded
> >>> may be used to. It will not require you to know your memory layout. But
> >>> this comes at the cost of a more complex bootloader to debug.
> >>
> >> That's literally the crux of my question -- trying to understand what use cases
> >> either one of them is meant for. Especially given that this shim layer is now
> >> quite capable:
> >> https://github.com/ARM-software/u-boot/blob/master/doc/README.uefi#L127
> >
> > While I can see major differences when using either on baremetal (you have better control on the Device-Tree with U-boot), it is much less clear in a guest. Maybe Anastasiia can explain why they decided to add support in U-boot? :).
>
> Well, there are many SoC vendors provide u-boot as their boot loader,
>
> so it was natural for us to add pvblock to it (Renesas, Xilinx, iMX, RPi, you name it).
>
> So this is the only reason I guess

What I am wondering about (perhaps selfishly because of Project EVE)
is the availability
of VMs for u-boot.

IOW, with UEFI I can pick up a random "cloud" (or any other one
really) ARM VM image
and boot it as DomU simply because it seems that 99% of existing VMs
are packaged
with a EFI partition setup for a UEFI boot.

Stefano and I actually talked about availability of VMs that are
pre-set with u-boot, but
it seems that the only place where you can find something like that is
Xilinx (for their
Petalinux). Stefano also brought up a point that Yocto would generate
u-boot's boot.scr
scripts -- but I have no experience with that and would appreciate
other commenting.

All of that said, it would be simply awesome if we can have a wiki
page with examples
of where to get (or how to build) DomUs that would be setup for u-boot
sequence on ARM.

Thanks,
Roman.

