Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E161EE8D0
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jun 2020 18:48:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgt2P-00054T-C0; Thu, 04 Jun 2020 16:48:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=06Bj=7R=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1jgt2N-00054M-Re
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2020 16:48:15 +0000
X-Inumbo-ID: 2f54d16c-a683-11ea-8993-bc764e2007e4
Received: from mail-qk1-x742.google.com (unknown [2607:f8b0:4864:20::742])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2f54d16c-a683-11ea-8993-bc764e2007e4;
 Thu, 04 Jun 2020 16:48:15 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id w3so6716444qkb.6
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2020 09:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zededa.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=49KSsDYfaMp0JAKGbfCbqPQmJSRNYHSOckrgHd5Fxvo=;
 b=jWpNIzthP0qLhfuehNGCu+QIAqxQyLqCwL+6+SUi/LjTu9sEEJuH5eQ7qLqHoyRFEZ
 mJzLlz4fyc/4s22fuWq1rwAqXQvwGLholFYXYbRoDD0Jh8/gaetWsjDOtW71jBKtKoo4
 vr4cFrJuz+Nw94ZHui+K4tuu0pvn/GI9hMwG6HtbzINex5YX/+ImMiSe1aIuBY6tmUyA
 EJY3OurwKLT14uYnw1yf8iIe0R+N1lOUlKMICByPFCE9b/9BB7sRQoc1I+6qC7rLgliq
 c/jS2NUddeKrZ5ohJTzs4Toj0v5JlRcY9xXmy4QYdOsluu1cKlQrwnWIg0y86ODt/pMW
 Q2OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=49KSsDYfaMp0JAKGbfCbqPQmJSRNYHSOckrgHd5Fxvo=;
 b=SjzgAcfhmNAp958FPe7DOuG9xFE6+9wL9MlQVNh6FGut+pgoeBi18ygmibgcyIA4XH
 fMForYjS71mIj4/4gzN9I022RbdpLFXyl2oivPw/dWU2vSEHAdEVRVC6jrWFGb0FrXUG
 ZYAs+yor0c7qFNgY9LN1nHoXaTa7n5we5i+jo7nu3ZJuLwZ4tTxabIBhkpxK/5v4sm4h
 LL/kMTHc7m9kwyQAJt3LfHKrUeZliA/Y+PIbBfNiYUkojk3p0GpF9YWqjqke9SyVbgwo
 pSCTPt5xCq5+qHHa7L9u51JO3gpvqxqfiQD/nfGijq45rCN/qJFp+HSnNmX7bEQBJs1Y
 imug==
X-Gm-Message-State: AOAM5313UJRsKWy+K5vMFslUmLHB9zjO87ktQKYInIonLG0PVSvcqEPY
 9YljCrj91qtZgYMK5y71/Abjb55u/CUCFChjIF6Qug==
X-Google-Smtp-Source: ABdhPJxcV9vSRJGX61CYXDUU/0OSP61BA6T5ErtCI79Y97YsQvB1NHlQc+dweLTtnV87JwpO6j4dSJ7Ft5Fn86/0j/4=
X-Received: by 2002:a05:620a:147:: with SMTP id
 e7mr5492235qkn.267.1591289295019; 
 Thu, 04 Jun 2020 09:48:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200603223156.12767-1-sstabellini@kernel.org>
 <3b3fa1cd-e50a-66f7-f5ac-eebc6f1d0953@xen.org>
 <24026a53-044b-843c-e548-22bb8325e5a7@arm.com>
 <alpine.DEB.2.21.2006040916370.6774@sstabellini-ThinkPad-T480s>
 <eed1064a-da3b-7c7c-7a1a-2e339db089cf@xen.org>
In-Reply-To: <eed1064a-da3b-7c7c-7a1a-2e339db089cf@xen.org>
From: Roman Shaposhnik <roman@zededa.com>
Date: Thu, 4 Jun 2020 09:48:03 -0700
Message-ID: <CAMmSBy-K8MRQsb1g5QX5aXH-SPGzBftTgK=kaJpwpJtxSsnr+g@mail.gmail.com>
Subject: Re: [PATCH] xen/rpi4: implement watchdog-based reset
To: Julien Grall <julien@xen.org>
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
Cc: Corey Minyard <cminyard@mvista.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Andr=C3=A9_Przywara?= <andre.przywara@arm.com>, tamas@tklengyel.com,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Jun 4, 2020 at 9:36 AM Julien Grall <julien@xen.org> wrote:
>
> Hi,
>
> On 04/06/2020 17:24, Stefano Stabellini wrote:
> > On Thu, 4 Jun 2020, Andr=C3=A9 Przywara wrote:
> >> On 04/06/2020 09:48, Julien Grall wrote:
> >>
> >> Hi,
> >>
> >>> On 03/06/2020 23:31, Stefano Stabellini wrote:
> >>>> Touching the watchdog is required to be able to reboot the board.
> >>>
> >>> In general the preferred method is PSCI. Does it mean RPI 4 doesn't
> >>> support PSCI at all?
> >>
> >> There is mainline Trusted Firmware (TF-A) support for the RPi4 for a f=
ew
> >> months now, which includes proper PSCI support (both for SMP bringup a=
nd
> >> system reset/shutdown). At least that should work, if not, it's a bug.
> >> An EDK-2 build for RPi4 bundles TF-A automatically, but you can use TF=
-A
> >> without it, with or without U-Boot: It works as a drop-in replacement
> >> for armstub.bin. Instruction for building it (one line!) are here:
> >> https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git/tree/docs/=
plat/rpi4.rst
> >>
> >>>>
> >>>> The implementation is based on
> >>>> drivers/watchdog/bcm2835_wdt.c:__bcm2835_restart in Linux.
> >>>
> >>> Can you give the baseline? This would allow us to track an issue and
> >>> port them.
> >>
> >> Given the above I don't think it's a good idea to add extra platform
> >> specific code to Xen.
> >
> > The RPi4, at least the one I have, doesn't come with any TF, and it
> > doesn't come with PSCI in device tree. As a user, I would rather have
> > this patch (even downstream) than having to introduce TF in my build an=
d
> > deployment just to be able to reboot.
>
> So what are you using for the firmware? Do you boot Xen directly?

You've got 3 options:
   1. booting directly (see Dornernerworks build:
https://github.com/dornerworks/xen-rpi4-builder/blob/master/rpixen.sh#L143)
   2. booting via u-boot (with efiboot)
   3. booting via honest, upstream UEFI
(https://github.com/pftf/RPi4/releases/tag/v1.5)

So far we've been mostly doing #2 since it is the most flexible one.

Thanks,
Roman.

