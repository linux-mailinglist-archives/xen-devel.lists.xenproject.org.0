Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B0B334277
	for <lists+xen-devel@lfdr.de>; Wed, 10 Mar 2021 17:08:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.96197.181804 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lK1Ny-00048H-Gx; Wed, 10 Mar 2021 16:08:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96197.181804; Wed, 10 Mar 2021 16:08:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lK1Ny-00047r-Dn; Wed, 10 Mar 2021 16:08:34 +0000
Received: by outflank-mailman (input) for mailman id 96197;
 Wed, 10 Mar 2021 16:08:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MZas=II=gmail.com=akihiko.odaki@srs-us1.protection.inumbo.net>)
 id 1lK1Nx-00047k-6y
 for xen-devel@lists.xenproject.org; Wed, 10 Mar 2021 16:08:33 +0000
Received: from mail-ed1-x534.google.com (unknown [2a00:1450:4864:20::534])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9c662e29-b27d-474e-95f8-2f16dc4e3697;
 Wed, 10 Mar 2021 16:08:32 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id h10so28880345edl.6
 for <xen-devel@lists.xenproject.org>; Wed, 10 Mar 2021 08:08:32 -0800 (PST)
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
X-Inumbo-ID: 9c662e29-b27d-474e-95f8-2f16dc4e3697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=tQKjpBbeAGvVs6+wLD13+b80I0XRG1ErL3vCY11jAQ8=;
        b=fdE5vTpiprs9YgRwlunxA9uEI9O0zmGuFBxCn/Y9h/HRt6y0fhl74xYB2ZmtpNEHNT
         VxAsHzhVii1AMqO8frlqoZbLGCcaipV4uY9aEp7JqIlq26FHy3mUq4JH/gvGBd3q4Yr0
         +WTS9QP00tSkjkXPQcvXXC1gp712WR93L2inQ9WO4BguThQpbse6wjrzs8dZxEwYOmsE
         NOxUaufrJdib3LkMMUAbBIdDrw7FYZ32PakrNuuXa/e0k+zvpCQvxDX26kEkt5t9J+AT
         LwJ+lRYYx2V1UCGdP2umMrH3g8NbqHwO1EFKxcKTHjvdK+ai5oWKbi+A/e3/bGrd9drX
         Hiqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=tQKjpBbeAGvVs6+wLD13+b80I0XRG1ErL3vCY11jAQ8=;
        b=MrMRQf+SaMiSV6wm+naxrDJqgX/UGs4jpdLH5KGOxDUvkI3a+mbo4yDQCHLpONhBaY
         yRQj3ODqK3vDcrKCjbmlLAo6BIpIku86fErE66FUIJTc4gB46sEyPU/4shTfMUR3rI38
         KvnflPObhzk5kxFZsEk9/rh/Z/bUfBh5R5gifu31UmHZp2BtaMFNMeWT9sF8YK8aSNvp
         VuSyaWHgSKt6pFdRw8m7vNCJaE8rJ5d4niaREt7c6QsybQAmDMPjy5p4+2jsr/OdyRu8
         kzLgc+iGMk5DKe5dFFkD2pejG/cnV/asj+IsSvAB3gq+8ANCMonX+jB8yBtHzZu0evuB
         Zfqw==
X-Gm-Message-State: AOAM532o0r8VpYGBiIcA+37Q23qX4cSbgOf5nijy+/HjvPYCXPyslPT5
	eHIA1pn8bOtGhfhZop/9eH3QTywNVGOa3v1caac=
X-Google-Smtp-Source: ABdhPJymb2jto6uErJnYtWurPU9cGbyu9Ua1yZmFZ3/d2gFzamREE3Ee/fVojMDSuRSGbqjKgURDFzCJyhkmYPEsreU=
X-Received: by 2002:a50:fa42:: with SMTP id c2mr4195637edq.159.1615392511620;
 Wed, 10 Mar 2021 08:08:31 -0800 (PST)
MIME-Version: 1.0
References: <20210303152948.59943-1-akihiko.odaki@gmail.com>
 <20210303152948.59943-2-akihiko.odaki@gmail.com> <20210310132920.6rv5f62ineowzscq@sirius.home.kraxel.org>
In-Reply-To: <20210310132920.6rv5f62ineowzscq@sirius.home.kraxel.org>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
Date: Thu, 11 Mar 2021 01:08:20 +0900
Message-ID: <CAMVc7JUjkXRyfd0-ak6ovOzfitNE6Qke2x3twXiLXMR7b3whcw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] virtio-gpu: Respect UI refresh rate for EDID
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu Developers <qemu-devel@nongnu.org>, xen-devel@lists.xenproject.org, 
	"Michael S . Tsirkin" <mst@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2021=E5=B9=B43=E6=9C=8810=E6=97=A5(=E6=B0=B4) 22:29 Gerd Hoffmann <kraxel@r=
edhat.com>:
>
>   Hi,
>
> > -static void xenfb_update_interval(void *opaque, uint64_t interval)
> > +static void xenfb_ui_info(void *opaque, uint32_t idx, QemuUIInfo *info=
)
>
> > -    .update_interval =3D xenfb_update_interval,
> > +    .ui_info     =3D xenfb_ui_info,
>
> Hmm, I suspect xenfb really wants the actual refresh rate, even in case
> vnc/sdl change it dynamically.  Anthony?  Stefano?
>
> I guess we should just leave the update_interval callback as-is, for
> those who want know, and use ui_info->refresh_rate for the virtual edid
> refresh rate (which may not match the actual update interval in case of
> dynamic changes).  Adding a comment explaining the difference to
> console.h is a good idea too.

sdl shortens update_interval to respond to user inputs, but it has
nothing to do with frame buffer. Using ui_info->refresh_rate will
eliminate worthless frame updates even for xenfb in such cases.

xenfb has a behavior similar to virtio-gpu. Instead of generating
interrupts, they just tell the refresh rate to the guest and expect
the guest to provide a frame buffer by itself. I think the dynamic
display mode change is also problematic for xenfb if the guest driver
uses the information (although the Linux driver does not use it at
least.) It is possible to have both of the refresh rate member in
QemuUIInfo and update_interval, but I don't see a difference
justifying that.

Anyway, I'd also like to hear opinions from Xen developers.

>
> Otherwise looks good to me overall.  Splitting the ui/gtk update to a
> separate patch is probably a good idea.
>

I'll do so when submitting the next version.

Regards,
Akihiko Odaki

