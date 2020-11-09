Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD7D2ABEA6
	for <lists+xen-devel@lfdr.de>; Mon,  9 Nov 2020 15:26:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.22581.48954 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kc86c-00052m-KU; Mon, 09 Nov 2020 14:25:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 22581.48954; Mon, 09 Nov 2020 14:25:14 +0000
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
	id 1kc86c-00052N-Go; Mon, 09 Nov 2020 14:25:14 +0000
Received: by outflank-mailman (input) for mailman id 22581;
 Mon, 09 Nov 2020 13:52:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pbKN=EP=gmail.com=idryomov@srs-us1.protection.inumbo.net>)
 id 1kc7aa-0002Nb-NH
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 13:52:08 +0000
Received: from mail-il1-x142.google.com (unknown [2607:f8b0:4864:20::142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dbf31a08-1e92-4de7-83df-b791fa8008ea;
 Mon, 09 Nov 2020 13:52:08 +0000 (UTC)
Received: by mail-il1-x142.google.com with SMTP id g7so8304442ilr.12
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2020 05:52:08 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=pbKN=EP=gmail.com=idryomov@srs-us1.protection.inumbo.net>)
	id 1kc7aa-0002Nb-NH
	for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 13:52:08 +0000
X-Inumbo-ID: dbf31a08-1e92-4de7-83df-b791fa8008ea
Received: from mail-il1-x142.google.com (unknown [2607:f8b0:4864:20::142])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id dbf31a08-1e92-4de7-83df-b791fa8008ea;
	Mon, 09 Nov 2020 13:52:08 +0000 (UTC)
Received: by mail-il1-x142.google.com with SMTP id g7so8304442ilr.12
        for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2020 05:52:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kU2Lz6FCVrZiuEoHabGbCYI8mZi4aQygf2Kr0fLfGG4=;
        b=Lb/BkUcVIcd6xhv8oVONfECjW/ZB+eIGRHnh0dm3V/Dcve1CHMxGnjqr8op+1v76K7
         BboZLuIC9lFoWJc8zRN7ckG8JYkUCEMrBXYH3LeqwWaeQw6FiksBZKkC4/rY+nMcbUOP
         mcyx+jHFLBCXxcHO2RHq4/pyA2nmEefVK9oOy9OsQ2fr8vLqz43v1yvxxZclHh7D+k2N
         Qw7b/fXaJ5trjyicYsioOneOxQN4Qzfe8MAWER1MvLiN60BX2gzHW6baJIDiu8cGcvYG
         BbC7br0UMOuvYPQzgHxuAO2xrcgSSEORe8jj2L4/gatFyG+wbhw19VFJICOjyYa/QKXf
         TWnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kU2Lz6FCVrZiuEoHabGbCYI8mZi4aQygf2Kr0fLfGG4=;
        b=QEXn6pV9Ghqq9xvC0wewmKcCsFxs/qqTMBjh45D+YJIMIk7Ai1ET7mO2CF4NOfm4s8
         qvQYfiYT3m4DyQvVQ4KmtyZXjorfXGqnHOyjopzOTWeJe9TX/iV7RHtw5d9P29zgLoJu
         Hrgl0qDboD96AEzGF5dprhz6IBeySEH+QUxF/jeK3V4PrtwXJJ2eZoCK5glqaGHuHbKY
         4wR7sdsZWmgEdMCoAHY/e+2PhmdPm/NG9VGi/AMpVW6Row2FCeWDbM6XBU8hamBaBvTx
         rMr3nYouumGHaSJRk16GnpXrkQzF0BCG8gUTYDA2HwKFL+/l9yUJhXOnax/5eITymtmJ
         xcuA==
X-Gm-Message-State: AOAM530pCitRxlqtFIszk+LihMS83RTfRfjqOzP/BRR+zFSCUdm2oh0G
	OXiq1CfcCWIZzWvqq7N0RCPKpQF5NqcRLiHKd/0=
X-Google-Smtp-Source: ABdhPJyXm5ijaiShQDd7Xj0k0fsOvCm3U5j3JctcQpIY73kNN30YAUsNc9VfJ5DemzskInCCw4oOffcooZ/r5dSiKD8=
X-Received: by 2002:a05:6e02:c:: with SMTP id h12mr10623495ilr.177.1604929927708;
 Mon, 09 Nov 2020 05:52:07 -0800 (PST)
MIME-Version: 1.0
References: <20201106190337.1973127-1-hch@lst.de> <20201106190337.1973127-18-hch@lst.de>
In-Reply-To: <20201106190337.1973127-18-hch@lst.de>
From: Ilya Dryomov <idryomov@gmail.com>
Date: Mon, 9 Nov 2020 14:52:08 +0100
Message-ID: <CAOi1vP83cOt_FOFLXQmgBpDgmaq8o8OQcUYWOb97jzkgOw6r4A@mail.gmail.com>
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

On Fri, Nov 6, 2020 at 8:04 PM Christoph Hellwig <hch@lst.de> wrote:
>
> Use set_capacity_and_notify to set the size of both the disk and block
> device.  This also gets the uevent notifications for the resize for free.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
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

Acked-by: Ilya Dryomov <idryomov@gmail.com>

Thanks,

                Ilya

