Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C953248A9
	for <lists+xen-devel@lfdr.de>; Thu, 25 Feb 2021 02:53:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89573.168805 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lF5pL-0005Ei-Hn; Thu, 25 Feb 2021 01:52:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89573.168805; Thu, 25 Feb 2021 01:52:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lF5pL-0005EM-EO; Thu, 25 Feb 2021 01:52:27 +0000
Received: by outflank-mailman (input) for mailman id 89573;
 Thu, 25 Feb 2021 01:52:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9UWr=H3=gmail.com=akihiko.odaki@srs-us1.protection.inumbo.net>)
 id 1lF5pK-0005EH-2U
 for xen-devel@lists.xenproject.org; Thu, 25 Feb 2021 01:52:26 +0000
Received: from mail-ed1-x52e.google.com (unknown [2a00:1450:4864:20::52e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9f81563d-3900-4cb4-aa14-f9ee2f567d68;
 Thu, 25 Feb 2021 01:52:25 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id w21so4913023edc.7
 for <xen-devel@lists.xenproject.org>; Wed, 24 Feb 2021 17:52:25 -0800 (PST)
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
X-Inumbo-ID: 9f81563d-3900-4cb4-aa14-f9ee2f567d68
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=dGiiq1qTA8h7U4ksveba+s3Z2W3HyPoZ51+8t/LGa6k=;
        b=AiZocE9+2KmDjXFF1Otxg1ESyS8qMdcP3ccaR6kbasOh2o+a3It/yOWBaGRRdoO/xR
         ogXC6jHXb80ZN4JsJjydJeTIoOMXTp1UpM5xM59RjYREeDUbThOKbgDx63i9BaQrX5h5
         lSJU3tcSP3rc4BP2WOUivjh1O6On6XAIW0b5tvrSVrRWfFx1KlwMfSWu20oEGkUHFYqZ
         3yLo+LTpDIk4BwkvZdbcLusWvJ3jM/be0kx7Ys+KL6qmi1fUtOwGYzd0+1UnDhJC9G3o
         sehZD3o8AHj6L9f4HIa3j6i/vjEva1JcEBpVQ40NUGZLzF2ehrpE1kXzTZ/kEk6cAk3e
         ZSvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=dGiiq1qTA8h7U4ksveba+s3Z2W3HyPoZ51+8t/LGa6k=;
        b=lRMsTtzJaMWirUOQz56g/qfThDcSU5EFrEOiZpVN6/0rBv433b8DI0pzJMmrI1V8Ui
         Vq+k/OCw+xO9O1jJPY+oY7yFNwJGtLl7PJnBKnpmJp3ShFeZgq0jvaRRJ18RVv/0E60P
         xcmSeVwT7WffyYhs5CVhffSvUWXONbEkVLxGBHtr1HMHYCloQ9GxNR3ptXBEaCSe7lI1
         HD+aj5sHAxMTPV5nCgzGgI5578V37IN1wGhyVYsy6fZKuDghvJM+7C/GLxSQ2/hSRoYI
         +pWwQASpiZumkDCvtCRyOS4s64/f24Xw/mIQrQv9lfvmdgphI6GoJ0NY4JlNUCL38UbG
         XGQg==
X-Gm-Message-State: AOAM533WbPEvxPhyehV9VCHOHkho0lN8MaVkLPOnMMNqOjOvrAYDcqpG
	+8SFMVQi6p49M2VIKXgKeh5lf2duVg2VoCWFUuQ=
X-Google-Smtp-Source: ABdhPJwXsXozY2MjY+nQylemcT8qXc8qQfaT+5U0yTvgiHcDlMSIOMfof4stMgqCSfEnmzp/Bfq+WphWjCM1nPDycD4=
X-Received: by 2002:a50:8a90:: with SMTP id j16mr641510edj.334.1614217944282;
 Wed, 24 Feb 2021 17:52:24 -0800 (PST)
MIME-Version: 1.0
References: <20210221133414.7262-1-akihiko.odaki@gmail.com>
 <20210222105738.w2q6vp5pi4p6bx5m@sirius.home.kraxel.org> <CAMVc7JVo_XJcGcxW0Wmqje3Y40fRZDY6T8dnQTc2=Ehasz4UHw@mail.gmail.com>
 <20210224111540.xd5a6yszql6wln7m@sirius.home.kraxel.org>
In-Reply-To: <20210224111540.xd5a6yszql6wln7m@sirius.home.kraxel.org>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
Date: Thu, 25 Feb 2021 10:52:13 +0900
Message-ID: <CAMVc7JXUXnrK_amhQsy=paMeqjMU_8r86Hj4UF5haZ+Oq15JkA@mail.gmail.com>
Subject: Re: [PATCH] virtio-gpu: Respect graphics update interval for EDID
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu Developers <qemu-devel@nongnu.org>, xen-devel@lists.xenproject.org, 
	"Michael S. Tsirkin" <mst@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2021=E5=B9=B42=E6=9C=8824=E6=97=A5(=E6=B0=B4) 20:17 Gerd Hoffmann <kraxel@r=
edhat.com>:
>
> On Tue, Feb 23, 2021 at 01:50:51PM +0900, Akihiko Odaki wrote:
> > 2021=E5=B9=B42=E6=9C=8822=E6=97=A5(=E6=9C=88) 19:57 Gerd Hoffmann <krax=
el@redhat.com>:
> > >
> > > On Sun, Feb 21, 2021 at 10:34:14PM +0900, Akihiko Odaki wrote:
> > > > This change introduces an additional member, refresh_rate to
> > > > qemu_edid_info in include/hw/display/edid.h.
> > > >
> > > > This change also isolates the graphics update interval from the
> > > > display update interval. The guest will update the frame buffer
> > > > in the graphics update interval, but displays can be updated in a
> > > > dynamic interval, for example to save update costs aggresively
> > > > (vnc) or to respond to user-generated events (sdl).
> > > > It stabilizes the graphics update interval and prevents the guest
> > > > from being confused.
> > >
> > > Hmm.  What problem you are trying to solve here?
> > >
> > > The update throttle being visible by the guest was done intentionally=
,
> > > so the guest can throttle the display updates too in case nobody is
> > > watching those display updated anyway.
> >
> > Indeed, we are throttling the update for vnc to avoid some worthless
> > work. But typically a guest cannot respond to update interval changes
> > so often because real display devices the guest is designed for does
> > not change the update interval in that way.
>
> What is the problem you are seeing?
>
> Some guest software raising timeout errors when they see only
> one vblank irq every 3 seconds?  If so: which software is this?
> Any chance we can fix this on the guest side?
>
> > That is why we have to
> > tell the guest a stable update interval even if it results in wasted
> > frames.
>
> Because of the wasted frames I'd like this to be an option you can
> enable when needed.  For the majority of use cases this seems to be
> no problem ...

I see blinks with GNOME on Wayland on Ubuntu 20.04 and virtio-gpu with
the EDID change included in this patch. The only devices inspecting
the variable, xenfb and modified virtio-gpu, do not yield vblank irq,
but they report the refresh rate to the guest, and the guest
proactively requests them to switch the surface.

I suspect Linux's kernel mode setting causes blinks and other guests
have similar problems.

>
> Also: the EDID changes should go to a separate patch.

That makes sense. I'll isolate it to a seperate patch in a series.

Regards,
Akihiko Odaki

>
> take care,
>   Gerd
>

