Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABDC82AEE41
	for <lists+xen-devel@lfdr.de>; Wed, 11 Nov 2020 10:56:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.24571.51875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcmqx-0005ex-BF; Wed, 11 Nov 2020 09:55:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 24571.51875; Wed, 11 Nov 2020 09:55:47 +0000
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
	id 1kcmqx-0005eY-8B; Wed, 11 Nov 2020 09:55:47 +0000
Received: by outflank-mailman (input) for mailman id 24571;
 Wed, 11 Nov 2020 09:55:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bkR8=ER=gmail.com=idryomov@srs-us1.protection.inumbo.net>)
 id 1kcmqw-0005eT-Ar
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 09:55:46 +0000
Received: from mail-il1-x144.google.com (unknown [2607:f8b0:4864:20::144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 78c4218d-4f87-4165-a964-dc4f714c7bb2;
 Wed, 11 Nov 2020 09:55:45 +0000 (UTC)
Received: by mail-il1-x144.google.com with SMTP id y17so1444714ilg.4
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2020 01:55:45 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=bkR8=ER=gmail.com=idryomov@srs-us1.protection.inumbo.net>)
	id 1kcmqw-0005eT-Ar
	for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 09:55:46 +0000
X-Inumbo-ID: 78c4218d-4f87-4165-a964-dc4f714c7bb2
Received: from mail-il1-x144.google.com (unknown [2607:f8b0:4864:20::144])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 78c4218d-4f87-4165-a964-dc4f714c7bb2;
	Wed, 11 Nov 2020 09:55:45 +0000 (UTC)
Received: by mail-il1-x144.google.com with SMTP id y17so1444714ilg.4
        for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2020 01:55:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qfEf7xRtwJh6vel7ndE10SMbjF6zTEFOWV8RA9xu3eI=;
        b=Flu0kG/G8H5tmdzF22ns+x1T3WixC4FBs0RbA9YeGx20Pw3IL573gomPOrRSgLhidi
         jxm4xXdraWCqe23Uz/lTRF5Gzul+neu0ZW5SRlL8rLtuRaQOMWWnKLr+e1J5E2f/IB4R
         iaO9iEipyz2F49FzVbspMmUTamyYBNigOi7Hq45S5vTkNhsbMM69J9bWbbawzfmKvyaE
         prBgh+sprAAWuhDKQzcpJRm9c4LoRmjW0z3OGufy4OEk4vgw7impUerADJ8+P1l4Evs/
         gUeZGg6Qzu0m4oCwYhIr6na+Ay9Hq4ATHKFwzo1XQC1pmqP6NOhCJ7ijtefRPRR/Tb4r
         FFHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qfEf7xRtwJh6vel7ndE10SMbjF6zTEFOWV8RA9xu3eI=;
        b=CXYE1MdLuUdSFrvEij2himZ1IWbumtTsROc58EoPTqpoPBNgOWyzSRxkWzVGbnNn8S
         fUMLwUXDKykaSDpPUgVIYiMAwXF959D8uiFc0NNv0Rmvtci19Ndfz649W5h1+5uPXmrs
         DuN7Zf2+EZ/YhqW7Iuf6wLwgru74TCxT/fs0TzHIkkphOphaoHrrW3/yC1qaFkmbq7vi
         L++MI1ILOj3X38BO/pWV3Ar1jplwWqmkpnpLRW40SptBO2sF1n7yCbG0kD8karTn6Q/6
         EI/MF/MM/7sIGYfjPcko//OEp1SBn1T1uoTqFNnWOoZ80pxaBWAd/3gAxDaspW6k0eKQ
         iagA==
X-Gm-Message-State: AOAM530OpRB8G73nvRWiXxVBCT+xG51FD1Tj/wtV+px1AbjjVGkFG8KK
	N+6BMKblwMBCA5+xtD7pWZa/YEh28wfohCFn5xo=
X-Google-Smtp-Source: ABdhPJy9ZPoku1YjH4P5V9sTrbXGNc0TDLR8E4ST1Mn4KA5kvu+HvwpbOUC5MO/5tCHlTeWvzQ658Y1GM8zrKYsupSY=
X-Received: by 2002:a92:1f43:: with SMTP id i64mr17516886ile.281.1605088545285;
 Wed, 11 Nov 2020 01:55:45 -0800 (PST)
MIME-Version: 1.0
References: <20201111082658.3401686-1-hch@lst.de> <20201111082658.3401686-18-hch@lst.de>
In-Reply-To: <20201111082658.3401686-18-hch@lst.de>
From: Ilya Dryomov <idryomov@gmail.com>
Date: Wed, 11 Nov 2020 10:55:45 +0100
Message-ID: <CAOi1vP-JjnNdAUqd9Gy6YdFgi8Ev4_Jt3zcB9DhAmdAvQhG7Eg@mail.gmail.com>
Subject: Re: [PATCH 17/24] rbd: use set_capacity_and_notify
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Justin Sanders <justin@coraid.com>, 
	Josef Bacik <josef@toxicpanda.com>, Jack Wang <jinpu.wang@cloud.ionos.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Minchan Kim <minchan@kernel.org>, Mike Snitzer <snitzer@redhat.com>, Song Liu <song@kernel.org>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, dm-devel@redhat.com, 
	linux-block <linux-block@vger.kernel.org>, Lars Ellenberg <drbd-dev@lists.linbit.com>, 
	nbd@other.debian.org, Ceph Development <ceph-devel@vger.kernel.org>, 
	xen-devel@lists.xenproject.org, linux-raid@vger.kernel.org, 
	linux-nvme@lists.infradead.org, linux-scsi@vger.kernel.org, 
	linux-fsdevel <linux-fsdevel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 11, 2020 at 9:27 AM Christoph Hellwig <hch@lst.de> wrote:
>
> Use set_capacity_and_notify to set the size of both the disk and block
> device.  This also gets the uevent notifications for the resize for free.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Acked-by: Jack Wang <jinpu.wang@cloud.ionos.com>
> ---
>  drivers/block/rbd.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/block/rbd.c b/drivers/block/rbd.c
> index f84128abade319..b7a194ffda55b4 100644
> --- a/drivers/block/rbd.c
> +++ b/drivers/block/rbd.c
> @@ -4920,8 +4920,7 @@ static void rbd_dev_update_size(struct rbd_device *rbd_dev)
>             !test_bit(RBD_DEV_FLAG_REMOVING, &rbd_dev->flags)) {
>                 size = (sector_t)rbd_dev->mapping.size / SECTOR_SIZE;
>                 dout("setting size to %llu sectors", (unsigned long long)size);
> -               set_capacity(rbd_dev->disk, size);
> -               revalidate_disk_size(rbd_dev->disk, true);
> +               set_capacity_and_notify(rbd_dev->disk, size);
>         }
>  }
>
> --
> 2.28.0
>

Hi Christoph,

The Acked-by is wrong here.  I acked this patch (17/24, rbd), and Jack
acked the next one (18/24, rnbd).

Thanks,

                Ilya

