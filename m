Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA90206A88
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2020 05:25:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jnw1H-0005Wz-A6; Wed, 24 Jun 2020 03:24:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sbuU=AF=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jnw1F-0005Wu-DZ
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2020 03:24:13 +0000
X-Inumbo-ID: 2c5ffa62-b5ca-11ea-8496-bc764e2007e4
Received: from mail-lj1-x22d.google.com (unknown [2a00:1450:4864:20::22d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2c5ffa62-b5ca-11ea-8496-bc764e2007e4;
 Wed, 24 Jun 2020 03:24:12 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id s9so913394ljm.11
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jun 2020 20:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zATyIOC89HCqUhnBoh+lwkWVcOVUh3I8uyFWbAFlEoM=;
 b=k/aYoqRJ6SpGM7scsWsZcHmoGIprlLyky0mNM0bxVvdwLKy7eXzAEQ9NkP3DtYw4nR
 TQdxap2VMFzlvJc7mxNU9NWuXuXo5x8vtFKx9/V4b3tNDZxagESQhGTJczG19Q8YY6pc
 uxKztahkcSYM4f6IttOB9q3iydH3d5QA7exX04t9tE3uHt0j4C3Kqcvsb55J4iaX+Qkk
 4M0nebTMRqMXKY7ztHXRVnjgh5uRdSx151SPeFLRE4pWVpI1TIVl8Dgqd+1LqN4gCOjn
 u1NnUMYIC9EmRj03AjoXYn0652bEEFgYbrJQB/4DvvFy3zS7yBXHKheNulZi3P4nzlpd
 jz8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zATyIOC89HCqUhnBoh+lwkWVcOVUh3I8uyFWbAFlEoM=;
 b=DilgtoI/HCHSB7bx3sKXWwbCH4094dnTApo0+M6oCUczfQ+tIdArYxeOuXFliCvt0q
 25KD81Kpwi0UWHxX4XAoQj91RD8YgNy7bzHErpyA2zae2bMFd8W2BKb1V2PLcy9/auvr
 liIHKaLSCn1O7SrrXrcY6+o/zPvQo1SpAquMOjJs/3fnIgRDrLlCF6Q9Q0+q8zAa+84D
 DztPoSoOFn6f3k8CK982DWu1Y/HacPjoK1baX8Z8uHX94oC0MVN8Xti7DQGrwh/qjV0T
 haK7Y8xNo53jecWZ5V6Av5JOyYuMZkzH23ZsEkSXNhGYZ+ASLP4Qpk6lKe+tv23NYEPG
 Bs9Q==
X-Gm-Message-State: AOAM533FtArzv76b/fzVXkRQHVRW6xJqtaqeNJM7bIaRlYhMSA7ib1tM
 yGzJcDiFb1nWigPIGwWN2ubG4tj6Nvx+h8PVmIU=
X-Google-Smtp-Source: ABdhPJy82cR6TDBLKeUrr7BsPQumqJX34a+ZGAf4Ewtmd6TzkP5ojuvgG5SLPlkHR12eACs2CaeuiXrWP9f+JXzNVZY=
X-Received: by 2002:a2e:b8c2:: with SMTP id s2mr13599176ljp.368.1592969051504; 
 Tue, 23 Jun 2020 20:24:11 -0700 (PDT)
MIME-Version: 1.0
References: <CAKf6xpuSD3NC2bLPQN75e2pR8asu9Ey1xTGxTNeCR_1MGsnPOg@mail.gmail.com>
 <ac4dfe3b-7981-49bb-25a2-08578da150d5@ilande.co.uk>
 <CAKf6xpvs6mNowsiAzbfQGLGp0aY0zKgUD=DVpSorWHycm--J8g@mail.gmail.com>
 <87k0zykwdl.fsf@dusky.pond.sub.org> <000001d64953$f67a1f00$e36e5d00$@xen.org>
In-Reply-To: <000001d64953$f67a1f00$e36e5d00$@xen.org>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 23 Jun 2020 23:23:59 -0400
Message-ID: <CAKf6xpt02SndxVkhqy52z7ZPCHtOhX1R5d7JQbeC8tVauBRm4Q@mail.gmail.com>
Subject: Re: sysbus failed assert for xen_sysdev
To: Paul Durrant <paul@xen.org>
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Markus Armbruster <armbru@redhat.com>, QEMU <qemu-devel@nongnu.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Jun 23, 2020 at 7:46 AM Paul Durrant <xadimgnik@gmail.com> wrote:
>
> > -----Original Message-----
> > From: Markus Armbruster <armbru@redhat.com>
> > Sent: 23 June 2020 09:41
> > To: Jason Andryuk <jandryuk@gmail.com>
> > Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>; Anthony PERARD <anthony.perard@citrix.com>; xen-
> > devel <xen-devel@lists.xenproject.org>; Paul Durrant <paul@xen.org>; QEMU <qemu-devel@nongnu.org>
> > Subject: Re: sysbus failed assert for xen_sysdev
> >
> > Jason Andryuk <jandryuk@gmail.com> writes:
> > > Then it gets farther... until
> > > qemu-system-i386: hw/core/qdev.c:439: qdev_assert_realized_properly:
> > > Assertion `dev->realized' failed.
> > >
> > > dev->id is NULL. The failing device is:
> > > (gdb) p *dev.parent_obj.class.type
> > > $12 = {name = 0x555556207770 "cfi.pflash01",
> > >
>
> Having commented out the call to xen_be_init() entirely (and xen_bus_init() for good measure) I also get this assertion failure, so
> I don't think is related.

Yes, this is something different.  pc_pflash_create() calls
qdev_new(TYPE_PFLASH_CFI01), but it is only realized in
pc_system_flash_map()...  and pc_system_flash_map() isn't called for
Xen.

Removing the call to pc_system_flash_create() from pc_machine_initfn()
lets QEMU startup and run a Xen HVM again.  xen_enabled() doesn't work
there since accelerators have not been initialized yes, I guess?

Regards,
Jason

