Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D362AEE79
	for <lists+xen-devel@lfdr.de>; Wed, 11 Nov 2020 11:07:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.24594.51913 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcn1m-00070U-S3; Wed, 11 Nov 2020 10:06:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 24594.51913; Wed, 11 Nov 2020 10:06:58 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcn1m-000709-Os; Wed, 11 Nov 2020 10:06:58 +0000
Received: by outflank-mailman (input) for mailman id 24594;
 Wed, 11 Nov 2020 10:06:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DN9B=ER=cloud.ionos.com=jinpu.wang@srs-us1.protection.inumbo.net>)
 id 1kcn1k-000704-F2
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 10:06:56 +0000
Received: from mail-ej1-x642.google.com (unknown [2a00:1450:4864:20::642])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 31937f84-febf-464e-a45e-c4a4ffc3bf9a;
 Wed, 11 Nov 2020 10:06:54 +0000 (UTC)
Received: by mail-ej1-x642.google.com with SMTP id za3so1980655ejb.5
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2020 02:06:54 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=DN9B=ER=cloud.ionos.com=jinpu.wang@srs-us1.protection.inumbo.net>)
	id 1kcn1k-000704-F2
	for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 10:06:56 +0000
X-Inumbo-ID: 31937f84-febf-464e-a45e-c4a4ffc3bf9a
Received: from mail-ej1-x642.google.com (unknown [2a00:1450:4864:20::642])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 31937f84-febf-464e-a45e-c4a4ffc3bf9a;
	Wed, 11 Nov 2020 10:06:54 +0000 (UTC)
Received: by mail-ej1-x642.google.com with SMTP id za3so1980655ejb.5
        for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2020 02:06:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.ionos.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8BVYeCUTuKi3mlr+D1JejV3WQ4DReZqKao2un+osJdI=;
        b=EWvaurrQLE5Q4yXlmvtPWeVGE0dkpLilBhFACYcpJh5SLgD4k2LHFrfA3fg/phe+gw
         pOXsWhTko+6vmsPMUys1ydyafND8sfafc/BhJ0cLDqzJH5wv7CFdS4PBi4SJJirndEDo
         I3sopJwAoMSpcvKBGOBbJDfAHPo19nxrr5mYxmaUjZAtoeSEinoAPgcqf0tp4SGruWUm
         s+puyVNd/9QM59nJCHGxgwiF4Uhv/qkw3Bh4E6NoIJN/jPJN6bl5siKGHhBBHVdEhBTl
         i9cN1zoK+m/ZDFXKRJbDKDgS4Hb/xEaLU1cJNAhSo0nBcfuCpt/4xbdL/4qVB2KjPelC
         haxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8BVYeCUTuKi3mlr+D1JejV3WQ4DReZqKao2un+osJdI=;
        b=svGWB8hkvuTCnCQjuMwmsuzmr/iYoDvbK+qKuT0DBajRsrMWmO019xkfyS8oyeYz+g
         fnCo+tpYXma7mtOD/gbsHCYzcUvbgv6209WEHS4Fn97pozfj3VaYzFXaTu3qwMYM0L4y
         AKW/sMqzDWzou6TsTwRWYHDrQYkB5d8Qtg9s9AG5OX6pXRwq3SXk1CFyJpAJOGF/KCHB
         G5rQ/V1cpbjhifE5Kr1zqYDTp2uHAERVQz2HENkbpoMxebw8KgG0f/cbK30HufqgzOga
         rQyUFoz2P9Sre2Pp/0si1k6Pb0PmJSc+VsrVGqxfgtd70Q2MLKXTXKEjmXm+Ts8rJgbl
         rQSQ==
X-Gm-Message-State: AOAM531/7pY4UTLla6yOE6S5fCnFVVSJwzjdOtSdqyCak4HT4p64ojh1
	oq9XIF79xBbZ2K38YkepjWlWy+2/9wOIrW/cTsBkTg==
X-Google-Smtp-Source: ABdhPJzsSG4n+ejxAi7LIm+JtRF2XZ0Zmfdo/Dim1Bn2zjoT1vntwc6k1ciTHUd7GwTXoyYPdOeDF7UWMmfnel/IKPk=
X-Received: by 2002:a17:907:c05:: with SMTP id ga5mr19170455ejc.212.1605089213881;
 Wed, 11 Nov 2020 02:06:53 -0800 (PST)
MIME-Version: 1.0
References: <20201111082658.3401686-1-hch@lst.de> <20201111082658.3401686-18-hch@lst.de>
 <CAOi1vP-JjnNdAUqd9Gy6YdFgi8Ev4_Jt3zcB9DhAmdAvQhG7Eg@mail.gmail.com>
In-Reply-To: <CAOi1vP-JjnNdAUqd9Gy6YdFgi8Ev4_Jt3zcB9DhAmdAvQhG7Eg@mail.gmail.com>
From: Jinpu Wang <jinpu.wang@cloud.ionos.com>
Date: Wed, 11 Nov 2020 11:06:43 +0100
Message-ID: <CAMGffEmU1ezUo68zF8DS4CRZZMosqhmDw3h7uiWzh2nL8tUs9g@mail.gmail.com>
Subject: Re: [PATCH 17/24] rbd: use set_capacity_and_notify
To: Ilya Dryomov <idryomov@gmail.com>
Cc: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>, Justin Sanders <justin@coraid.com>, 
	Josef Bacik <josef@toxicpanda.com>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Minchan Kim <minchan@kernel.org>, Mike Snitzer <snitzer@redhat.com>, Song Liu <song@kernel.org>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, 
	device-mapper development <dm-devel@redhat.com>, linux-block <linux-block@vger.kernel.org>, 
	Lars Ellenberg <drbd-dev@lists.linbit.com>, nbd@other.debian.org, 
	Ceph Development <ceph-devel@vger.kernel.org>, xen-devel@lists.xenproject.org, 
	linux-raid <linux-raid@vger.kernel.org>, linux-nvme@lists.infradead.org, 
	Linux SCSI Mailinglist <linux-scsi@vger.kernel.org>, linux-fsdevel <linux-fsdevel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 11, 2020 at 10:55 AM Ilya Dryomov <idryomov@gmail.com> wrote:
>
> On Wed, Nov 11, 2020 at 9:27 AM Christoph Hellwig <hch@lst.de> wrote:
> >
> > Use set_capacity_and_notify to set the size of both the disk and block
> > device.  This also gets the uevent notifications for the resize for free.
> >
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> > Acked-by: Jack Wang <jinpu.wang@cloud.ionos.com>
> > ---
> >  drivers/block/rbd.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/drivers/block/rbd.c b/drivers/block/rbd.c
> > index f84128abade319..b7a194ffda55b4 100644
> > --- a/drivers/block/rbd.c
> > +++ b/drivers/block/rbd.c
> > @@ -4920,8 +4920,7 @@ static void rbd_dev_update_size(struct rbd_device *rbd_dev)
> >             !test_bit(RBD_DEV_FLAG_REMOVING, &rbd_dev->flags)) {
> >                 size = (sector_t)rbd_dev->mapping.size / SECTOR_SIZE;
> >                 dout("setting size to %llu sectors", (unsigned long long)size);
> > -               set_capacity(rbd_dev->disk, size);
> > -               revalidate_disk_size(rbd_dev->disk, true);
> > +               set_capacity_and_notify(rbd_dev->disk, size);
> >         }
> >  }
> >
> > --
> > 2.28.0
> >
>
> Hi Christoph,
>
> The Acked-by is wrong here.  I acked this patch (17/24, rbd), and Jack
> acked the next one (18/24, rnbd).
right. :)
>
> Thanks,
>
>                 Ilya

