Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B93D308978
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 15:14:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.78173.142089 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5UX4-0000Na-Bu; Fri, 29 Jan 2021 14:13:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 78173.142089; Fri, 29 Jan 2021 14:13:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5UX4-0000N9-8H; Fri, 29 Jan 2021 14:13:54 +0000
Received: by outflank-mailman (input) for mailman id 78173;
 Fri, 29 Jan 2021 14:13:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rA00=HA=gmail.com=michael.d.labriola@srs-us1.protection.inumbo.net>)
 id 1l5UX1-0000N4-UW
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 14:13:51 +0000
Received: from mail-wr1-x431.google.com (unknown [2a00:1450:4864:20::431])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id efd15429-65fe-4efb-9a48-9eb6112b61fc;
 Fri, 29 Jan 2021 14:13:51 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id g10so8993177wrx.1
 for <xen-devel@lists.xenproject.org>; Fri, 29 Jan 2021 06:13:50 -0800 (PST)
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
X-Inumbo-ID: efd15429-65fe-4efb-9a48-9eb6112b61fc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=/2hCLinPJNgQBv6zSIhEEGCF3003/VIqkT79ZqD45s4=;
        b=qY/Ka+h6/GDh2EFiTqmmVIPUCJhFXofLbwIqDtpbZAk5gO/WrqHpk9k0loGbcUZUmt
         T/CKZNhZy9GPoY0Xm5npHaMIMQDbmAkmaD4dthDsUpZly0WceTLwHdmahfPMXWZEzJTw
         9cBPu/yF25LZvIi1AKdHcGFTcABqtBwZzDX0tKpa1QvqqqnrnBDuBqgVfDg/JegLcUST
         +FxpDjTDJCyObgeolgxsQNFp54GKsb8yKv7sReeXtavQ2iExyqcoD2u7Dvz1rJoUdZ02
         ecvY9TnfN0LFe7a1TshaDzL3jXV+eX48MYZrZsjM9xFns8LPRah7IY7dwBty6kyVNJXi
         fmaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=/2hCLinPJNgQBv6zSIhEEGCF3003/VIqkT79ZqD45s4=;
        b=Fe8ZN3IyjCnjmxRbJK8FvjnBVnq7hGaoDQ6i65YXM8ARC2OcatjCAcEQbWkhZWYkUK
         Au9aSLXLA8e1VLEKeL67Es6XDxT3odPczmv4gcwR0oJ3SnACIPlR2HD76SY+MS1M2Ljb
         9FZlcPbkLCywwsczpk5QbRMD55BdxLuU+UzIk5NJ2fGDkdsmNmgWNp+hS68jlFRBjtnB
         /2RVNolsge5o/0z59HtW/Uc3hviRgaP79lsvkQJwAH5Id64925XRzEVR1AtSg2uLHjLf
         SnBLlt6nEIQMgdxQmWG2A9DpLz8hVl3c3fUjPytMYK2vC0WruSUe3tjHZdV1RRpAoShC
         RoFA==
X-Gm-Message-State: AOAM531LiCjJW8Q5tc6BV8wnGRK0HmCNkcTYQwRPRx+eFp7r0sKCSUV6
	RebsXcCmLZEfA/yVqLynguGGfxDil6EFzKF9e9I=
X-Google-Smtp-Source: ABdhPJzJKt7LcxvasjvV+lhO4PZMR0Eg1i6xlL7jOdXUzlPXOc7tx7QIEJujHlxMebW3S3kD/jXnimy3Jn4Ffezh810=
X-Received: by 2002:a05:6000:104f:: with SMTP id c15mr4714357wrx.239.1611929630061;
 Fri, 29 Jan 2021 06:13:50 -0800 (PST)
MIME-Version: 1.0
References: <2nft2kipqg.fsf@aragorn.infrastructure.cah> <983b87d6-edb8-21ea-7d6f-f653f5c0d048@oracle.com>
 <20210129005129.GA2452@mail-itl> <44068a70-8940-824b-9e39-b800635b92c7@suse.com>
In-Reply-To: <44068a70-8940-824b-9e39-b800635b92c7@suse.com>
From: Michael Labriola <michael.d.labriola@gmail.com>
Date: Fri, 29 Jan 2021 09:13:37 -0500
Message-ID: <CAOQxz3w-2aJn1dKbQRG8_m8f3_pN0zSXzYkfyU7cvo34vF6P=g@mail.gmail.com>
Subject: Re: Problems starting Xen domU after latest stable update
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, David Woodhouse <dwmw@amazon.co.uk>, 
	Sasha Levin <sashal@kernel.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, 
	Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 29, 2021 at 12:26 AM J=C3=BCrgen Gro=C3=9F <jgross@suse.com> wr=
ote:
>
> On 29.01.21 01:51, Marek Marczykowski-G=C3=B3recki wrote:
> > On Thu, Jan 28, 2021 at 07:03:00PM -0500, Boris Ostrovsky wrote:
> >>
> >> On 1/28/21 6:52 PM, Michael D Labriola wrote:
> >>> Hey, everyone.  I've run into problems starting up my Xen domUs as of
> >>> the latest batch of stable updates.  Whenever I try to create one, I
> >>> get a bunch of block device errors like this:
> >>>
> >>> libxl: error: libxl_device.c:1105:device_backend_callback: Domain 4:u=
nable to add device with path /local/domain/0/backend/vbd/4/51712
> >>> libxl: error: libxl_device.c:1105:device_backend_callback: Domain 4:u=
nable to add device with path /local/domain/0/backend/vbd/4/51728
> >>> libxl: error: libxl_device.c:1105:device_backend_callback: Domain 4:u=
nable to add device with path /local/domain/0/backend/vbd/4/51744
> >>> libxl: error: libxl_device.c:1105:device_backend_callback: Domain 4:u=
nable to add device with path /local/domain/0/backend/vbd/4/51760
> >>> libxl: error: libxl_device.c:1105:device_backend_callback: Domain 4:u=
nable to add device with path /local/domain/0/backend/vbd/4/51776
> >>> libxl: error: libxl_create.c:1452:domcreate_launch_dm: Domain 4:unabl=
e to add disk devices
> >>> libxl: error: libxl_device.c:1105:device_backend_callback: Domain 4:u=
nable to remove device with path /local/domain/0/backend/vbd/4/51712
> >>> libxl: error: libxl_device.c:1105:device_backend_callback: Domain 4:u=
nable to remove device with path /local/domain/0/backend/vbd/4/51728
> >>> libxl: error: libxl_device.c:1105:device_backend_callback: Domain 4:u=
nable to remove device with path /local/domain/0/backend/vbd/4/51744
> >>> libxl: error: libxl_device.c:1105:device_backend_callback: Domain 4:u=
nable to remove device with path /local/domain/0/backend/vbd/4/51760
> >>> libxl: error: libxl_device.c:1105:device_backend_callback: Domain 4:u=
nable to remove device with path /local/domain/0/backend/vbd/4/51776
> >>> libxl: error: libxl_domain.c:1290:devices_destroy_cb: Domain 4:libxl_=
_devices_destroy failed
> >>> libxl: error: libxl_domain.c:1177:libxl__destroy_domid: Domain 4:Non-=
existant domain
> >>> libxl: error: libxl_domain.c:1131:domain_destroy_callback: Domain 4:U=
nable to destroy guest
> >>> libxl: error: libxl_domain.c:1058:domain_destroy_cb: Domain 4:Destruc=
tion of domain failed
> >>>
> >>> I'm using Xen 4.13.1 on the box I've been testing with.
> >>>
> >>> I bisected down to this commit, and reverting it does indeed fix my
> >>> problem.  Well, this commit upstream and it's cherry-picked variants
> >>> on linux-5.4.y and linux-5.10.y.
> >>
> >>
> >> You most likely need 5f46400f7a6a4fad635d5a79e2aa5a04a30ffea1. It hit =
Linus tree a few hours ago.
> >
> > I can confirm this fixes the same issue for me (too?), thanks!
> > Shouldn't this patch have Cc: stable?
>
> No, I don't think so.
>
> The issue being fixed by the patch has been introduced only in 5.11

For the record, the issue is also in the latest stable 5.4.y and
5.10.y releases (I assume older ones as well, but those are the only 2
I tested).  That's where I ran into it initially.

> and the fixing patch references the buggy patch via a Fixes: tag.
>
> If the buggy patch has been put into stable this Fixes: tag should
> result in the fix being put into the same stable branches as well.

I've never done this before...  does this happen automatically?  Or is
there somebody we should ping to make sure it happens?

Thanks!

-Mike

