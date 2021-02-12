Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A583231A1F5
	for <lists+xen-devel@lfdr.de>; Fri, 12 Feb 2021 16:45:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.84332.158150 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAadf-0001tw-7m; Fri, 12 Feb 2021 15:45:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 84332.158150; Fri, 12 Feb 2021 15:45:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAadf-0001tX-4e; Fri, 12 Feb 2021 15:45:47 +0000
Received: by outflank-mailman (input) for mailman id 84332;
 Fri, 12 Feb 2021 15:45:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pKAX=HO=gmail.com=snitzer@srs-us1.protection.inumbo.net>)
 id 1lAadd-0001tS-HP
 for xen-devel@lists.xenproject.org; Fri, 12 Feb 2021 15:45:45 +0000
Received: from mail-pl1-f180.google.com (unknown [209.85.214.180])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id aed3b706-dc8a-43af-b503-f19b77648660;
 Fri, 12 Feb 2021 15:45:44 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id s15so49589plr.9
 for <xen-devel@lists.xenproject.org>; Fri, 12 Feb 2021 07:45:44 -0800 (PST)
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
X-Inumbo-ID: aed3b706-dc8a-43af-b503-f19b77648660
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=M8C1yZZgp4rNPfghNpxWN41GpCK1+InKLAelhxbvplw=;
        b=j0utPCU15ZdF4aMvuBalv8kNhluW4XUid0Ei0j/wrOqVu0XNhoipRGtO3JBrPg80T2
         QBHZaYU0lWlGoAW9xFSnkZEnych3aJgHqJKITskkg6jPsoqo7Uy9q5ocRd2MsmVWflSw
         CPjQWvrW/A2rW4ST9apzwhp4BkY+j728CBjuBrxLW4seYUI4S/8pjpOEEDgnaLFc8PFC
         G+3YiClxb8+mWtYDrzIxsn/gX75xIG2o5sbwXip11ECwRGm/bP2aBfCDsX38uk30FdeW
         Jnoynsw/+sYPsv1JtGlGVf6gFlVeK5BF+I2kePfYK3BHMuPjsll7XHZeRwSYA9Ax/8yk
         kNiw==
X-Gm-Message-State: AOAM533In0NeOFkBRyCDblgAB5Vz/FtLS7u1eb1b5G3Mg3FvuJxxAuXZ
	/5ixh/HCtNRi3oWnX7Sfu8iCD1PYbA1hAoI8Pj8=
X-Google-Smtp-Source: ABdhPJyYCXBmQgiV5syIf5Cv8mFWKTwy1gjS5Yhyhg4Qi/jYzZasdmgfRgJp2ybsEGtlgybQDIghy8J0Yy2+jaKx2kI=
X-Received: by 2002:a17:90a:4e1:: with SMTP id g88mr3222886pjg.7.1613144743400;
 Fri, 12 Feb 2021 07:45:43 -0800 (PST)
MIME-Version: 1.0
References: <20201116145809.410558-1-hch@lst.de> <20201116145809.410558-13-hch@lst.de>
In-Reply-To: <20201116145809.410558-13-hch@lst.de>
From: Mike Snitzer <snitzer@redhat.com>
Date: Fri, 12 Feb 2021 10:45:32 -0500
Message-ID: <CAMM=eLfD0_Am3--X+PsKPTfc9qzejxpMNjYwEh=WtjSa-iSncg@mail.gmail.com>
Subject: Re: [PATCH 12/78] dm: use set_capacity_and_notify
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Justin Sanders <justin@coraid.com>, 
	Josef Bacik <josef@toxicpanda.com>, Ilya Dryomov <idryomov@gmail.com>, 
	Jack Wang <jinpu.wang@cloud.ionos.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Stefan Hajnoczi <stefanha@redhat.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Minchan Kim <minchan@kernel.org>, Song Liu <song@kernel.org>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, 
	device-mapper development <dm-devel@redhat.com>, linux-block <linux-block@vger.kernel.org>, 
	drbd-dev@lists.linbit.com, nbd@other.debian.org, ceph-devel@vger.kernel.org, 
	xen-devel@lists.xenproject.org, 
	"linux-raid@vger.kernel.org" <linux-raid@vger.kernel.org>, linux-nvme@lists.infradead.org, 
	"linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>, linux-fsdevel <linux-fsdevel@vger.kernel.org>, 
	Hannes Reinecke <hare@suse.de>
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 16, 2020 at 10:05 AM Christoph Hellwig <hch@lst.de> wrote:
>
> Use set_capacity_and_notify to set the size of both the disk and block
> device.  This also gets the uevent notifications for the resize for free.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Hannes Reinecke <hare@suse.de>
> ---
>  drivers/md/dm.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/md/dm.c b/drivers/md/dm.c
> index c18fc25485186d..62ad44925e73ec 100644
> --- a/drivers/md/dm.c
> +++ b/drivers/md/dm.c
> @@ -1971,8 +1971,7 @@ static struct dm_table *__bind(struct mapped_device *md, struct dm_table *t,
>         if (size != dm_get_size(md))
>                 memset(&md->geometry, 0, sizeof(md->geometry));
>
> -       set_capacity(md->disk, size);
> -       bd_set_nr_sectors(md->bdev, size);
> +       set_capacity_and_notify(md->disk, size);
>
>         dm_table_event_callback(t, event_callback, md);
>

Not yet pinned down _why_ DM is calling set_capacity_and_notify() with
a size of 0 but, when running various DM regression tests, I'm seeing
a lot of noise like:

[  689.240037] dm-2: detected capacity change from 2097152 to 0

Is this pr_info really useful?  Should it be moved to below: if
(!capacity || !size) so that it only prints if a uevent is sent?

Mike

