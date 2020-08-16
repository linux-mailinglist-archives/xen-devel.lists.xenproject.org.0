Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 467B9245983
	for <lists+xen-devel@lfdr.de>; Sun, 16 Aug 2020 22:47:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k7PWz-0006iY-JS; Sun, 16 Aug 2020 20:45:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kWRi=B2=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1k7PWx-0006iN-Rc
 for xen-devel@lists.xenproject.org; Sun, 16 Aug 2020 20:45:27 +0000
X-Inumbo-ID: 5ccdbe91-9fff-4baf-afdb-dcc805cec0bc
Received: from mail-qv1-xf44.google.com (unknown [2607:f8b0:4864:20::f44])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5ccdbe91-9fff-4baf-afdb-dcc805cec0bc;
 Sun, 16 Aug 2020 20:45:26 +0000 (UTC)
Received: by mail-qv1-xf44.google.com with SMTP id x7so6878358qvi.5
 for <xen-devel@lists.xenproject.org>; Sun, 16 Aug 2020 13:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zededa.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vDv7HRDav72kN7D0JJEG2yjArA9EkfCHlHS4m6hVg+I=;
 b=AOn0GY5FZT+G5xs80SwOkAhPq4rYjjh68jkCkSw9MrRRs7d+HUDoqaKjgRi/W4Xyc3
 zDNwmrFsdVE/J4JCxkecu11n8IXhUgmZ9dMxXkA2QYOaHaGhDmbbgYSPmdunvkOiCOH3
 fsN0zLlNHhMF6k4AUsh4EIRyJMLWg0Dz1ASxfHnQeHht8RLkXrFO1NwY5UaW0CNASjR4
 ZmgaNGTlbOpNmN/Xot4cok5XbYCgLua+7pjHSMaFVJufcjzLIGqcWf1rHhn0/VqcKwQx
 RViuEhfGIonqXAMcba2Q38g1qlurBsFJl9RNq5Tf0EsuSxBvNX4CVD/guKwFIZqebrFA
 AKfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vDv7HRDav72kN7D0JJEG2yjArA9EkfCHlHS4m6hVg+I=;
 b=BMXGmoeRyG33NTTq4egKVL8aPOJeOA+neyUJOQu/E8cDRiE7g0GtqtByYPATV5/neU
 eli/6yrEA5LMiIPwugO8B7tebDON5EQoNCwJsTnpFkyDjUEe6TlV2lH9adoHYaGDiosW
 gzToQkuZUa+OI3eKSaZx1tKunADd3CUTj0mX8FVeLdJmxFyBlcXsUIdktr8dTL9PwvWx
 XzpZd85bMYTeeWP0MeVR8DNnFvVj0W9wb1z933acMBj5mWYuOVNklyiH3jqpPjo4104B
 H30wak25lUoGJ3sYTQBHmgph+4p9ZkiCjVSMGb6aZHSUmeymv05QRWPeHMthWcAPAS48
 wUcw==
X-Gm-Message-State: AOAM532HYbivqfHpxO1SFSsPR8Gob/0khGqRpitdiDX4h4p+xdt9nCtI
 axWI+vNn7aFazw6PeFcDQncxJHSudhYg8vdcvShHPA==
X-Google-Smtp-Source: ABdhPJzfTyl6tkZLvbVTlFRULdLyzTHmWBV3dg5jufeDGIb+9a0G2UuNN5/sDCGTvPc2gVAmDzbv+YD5wtXVtg0vhEs=
X-Received: by 2002:ad4:4992:: with SMTP id t18mr11076376qvx.193.1597610725187; 
 Sun, 16 Aug 2020 13:45:25 -0700 (PDT)
MIME-Version: 1.0
References: <CAMmSBy-EduiWV-rZfykc8Xh6GyOBAe5VNF44p6HjR8kn_bDZjA@mail.gmail.com>
 <8a01a6e3-a786-2d68-5640-343bcc084b45@xen.org>
In-Reply-To: <8a01a6e3-a786-2d68-5640-343bcc084b45@xen.org>
From: Roman Shaposhnik <roman@zededa.com>
Date: Sun, 16 Aug 2020 13:45:14 -0700
Message-ID: <CAMmSBy92Aiz8btqkEbU9oVJifJ3ft0htPpjObGz-wYVjXuwvoQ@mail.gmail.com>
Subject: Re: u-boot vs. uefi as boot loaders on ARM
To: Julien Grall <julien@xen.org>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, vicooodin@gmail.com, 
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

On Sun, Aug 16, 2020 at 7:54 AM Julien Grall <julien@xen.org> wrote:
> On 15/08/2020 21:43, Roman Shaposhnik wrote:
> > Hi!
>
> Hi,
>
> > with the recent excellent work by Anastasiia committed to the u-boot's
> > main line, we now have two different ways of bringing ARM DomUs.
> >
> > Is there any chance someone can educate the general public on pros
> > and cons of both approaches?
> >
> > In Project EVE we're still using uefi on ARM (to stay closer to the more
> > "ARM in the cloud" use case) but perhaps the situation now is more
> > nuanced?
>
> UEFI is just standard, so I am guessing you are referring to
> Tianocore/EDK2. am I correct?

Yes, but I was actually referring to both in a way (I should've been
clearer tho).
To be more explicit my question was around trying to compare a "standardized"
way of botting a generic DomU on ARM (and that standard is UEFI with one
particular implementation that works out of the box with Xen being TC/EDK2) with
a more ad-hoc u-boot style of booting.

> Recent version of U-boot are also able to partially UEFI. This means you
> could easily use GRUB with U-boot.

Yup -- which complicated things even more. And it is funny you should mention
it, since we actually started with TC/EDK2 for RaspberryPi4 as a board
bootloader,
but quickly switched to u-boot with UEFI shim layer, since it was much smaller,
better supported (still?) and gave us all we needed to boot Xen on RPi4 as a
UEFI payload.

> From my understanding, U-boot is just a bootloader. Therefore it will
> not provide runtime services (such as date & time).

It actually does provide some of that (see below)

> Furthermore, the
> interface is less user friendly, you will have to know the memory layout
> in order to load binaries.
>
> On the other hand, Tianocore/EDK2 is very similar to what non-embedded
> may be used to. It will not require you to know your memory layout. But
> this comes at the cost of a more complex bootloader to debug.

That's literally the crux of my question -- trying to understand what use cases
either one of them is meant for. Especially given that this shim layer is now
quite capable:
    https://github.com/ARM-software/u-boot/blob/master/doc/README.uefi#L127

Thanks,
Roman.

