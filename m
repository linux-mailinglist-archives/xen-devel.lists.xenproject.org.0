Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8DDB39A4B8
	for <lists+xen-devel@lfdr.de>; Thu,  3 Jun 2021 17:37:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.136479.253010 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lopPO-00068F-JE; Thu, 03 Jun 2021 15:37:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 136479.253010; Thu, 03 Jun 2021 15:37:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lopPO-00065d-FX; Thu, 03 Jun 2021 15:37:22 +0000
Received: by outflank-mailman (input) for mailman id 136479;
 Thu, 03 Jun 2021 15:37:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=012H=K5=linaro.org=ulf.hansson@srs-us1.protection.inumbo.net>)
 id 1lopPM-00065X-5Y
 for xen-devel@lists.xenproject.org; Thu, 03 Jun 2021 15:37:20 +0000
Received: from mail-vs1-xe35.google.com (unknown [2607:f8b0:4864:20::e35])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7ae02d19-7fa9-4830-b9b5-a1820ce5dbbc;
 Thu, 03 Jun 2021 15:37:19 +0000 (UTC)
Received: by mail-vs1-xe35.google.com with SMTP id u188so3214264vsu.8
 for <xen-devel@lists.xenproject.org>; Thu, 03 Jun 2021 08:37:19 -0700 (PDT)
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
X-Inumbo-ID: 7ae02d19-7fa9-4830-b9b5-a1820ce5dbbc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+W0QahdA5jm5lLp4qGqziVkevJrOYYIsAeli4hbSoMY=;
        b=Sczm7Uhat9CAttKCKONsBvTvpdWX5VANaO58Cd0mJFcJ+A28Gj9YspGmhSWIpVtNS9
         gufvY+CGT5FXDIQfjOQ4ExwQIrmSjUqzpGxTG/ZkK/nXRMIOjYsW6gd0+0ljDlvbLbq6
         AyHgMcG1V7VrDrAancwHixbwlfPPPcOtQ/Us++pps4NpXbaz33l8+avCCapAkCFya/10
         FcaqevmvQJz8RurkVjboQlMdJ4KLmCFgJ9aWml7eHxoV4e7eWIKwWiCmbJjrhvsDE5K2
         PLLnqagHSU8ORkIhfE1C9Sx6ZNkln7FGogf+yyT7tKXsIRL7oAHDTXDC0cZ4GcZV2dc7
         4ZRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+W0QahdA5jm5lLp4qGqziVkevJrOYYIsAeli4hbSoMY=;
        b=i60Y25ESG5hw+gh+qPIGtLA0x3jd9mdIbrShBa85y77VNfoyXpN00yQHTZ1TlB2x1s
         FUfYL5HXCb8wmGn++90wwebaF81bnDBK7YlxpfRsNz891CDksl7inOsrYv2W0bGXl9jw
         ZdyITimHinfUMH5IRUXkQcJ1tO126aZTrBCnQrt/j8SHzVJFW/gkGbBFeqXgi98iZ9jQ
         UVcSddGUKt1PMJxsDHzv3CegjED7QC92LyeahdsFfpF76P5ZiLD7n37bsKf8hvCl99Zj
         SeURqbRd+a6ktyhJnTJv9cTGawmonRpqOW1+xjL7UL9CvDmG3F3IIo7LGqGpOBY75pfh
         eb/w==
X-Gm-Message-State: AOAM5302cNBaQr/Ok/YOIFIyeVkLAU68IKLEGNXjzizHl/iyr2gg7NcR
	yco5A85CYfNkocYhVg6G0jZtmtqH7DTcmad47v5djg==
X-Google-Smtp-Source: ABdhPJzM3LSrPJI4FkB0laodTTeEei+m50SowhpqaGtsNgUdvieHcvbYUQloJUD/a79xzNmd816023E4d1PORKHhPJg=
X-Received: by 2002:a05:6102:3023:: with SMTP id v3mr756919vsa.19.1622734639015;
 Thu, 03 Jun 2021 08:37:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210602065345.355274-1-hch@lst.de> <20210602065345.355274-8-hch@lst.de>
In-Reply-To: <20210602065345.355274-8-hch@lst.de>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 3 Jun 2021 17:36:42 +0200
Message-ID: <CAPDyKFoJssCnHv5tmG4vJJ9m0Zj5HkMEVYvnsjamvyemusZaUg@mail.gmail.com>
Subject: Re: [PATCH 07/30] ms_block: use blk_mq_alloc_disk
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Justin Sanders <justin@coraid.com>, 
	Denis Efremov <efremov@linux.com>, Josef Bacik <josef@toxicpanda.com>, Tim Waugh <tim@cyberelk.net>, 
	Geoff Levand <geoff@infradead.org>, Ilya Dryomov <idryomov@gmail.com>, 
	"Md. Haris Iqbal" <haris.iqbal@ionos.com>, Jack Wang <jinpu.wang@ionos.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Mike Snitzer <snitzer@redhat.com>, Maxim Levitsky <maximlevitsky@gmail.com>, 
	Alex Dubov <oakad@yahoo.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Christian Borntraeger <borntraeger@de.ibm.com>, dm-devel@redhat.com, 
	linux-block <linux-block@vger.kernel.org>, nbd@other.debian.org, 
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, ceph-devel@vger.kernel.org, 
	virtualization@lists.linux-foundation.org, xen-devel@lists.xenproject.org, 
	linux-mmc <linux-mmc@vger.kernel.org>, linux-mtd@lists.infradead.org, 
	linux-s390@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 2 Jun 2021 at 08:54, Christoph Hellwig <hch@lst.de> wrote:
>
> Use the blk_mq_alloc_disk API to simplify the gendisk and request_queue
> allocation.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe


> ---
>  drivers/memstick/core/ms_block.c | 25 ++++++++++---------------
>  1 file changed, 10 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/memstick/core/ms_block.c b/drivers/memstick/core/ms_block.c
> index 0bacf4268f83..dac258d12aca 100644
> --- a/drivers/memstick/core/ms_block.c
> +++ b/drivers/memstick/core/ms_block.c
> @@ -2110,21 +2110,17 @@ static int msb_init_disk(struct memstick_dev *card)
>         if (msb->disk_id  < 0)
>                 return msb->disk_id;
>
> -       msb->disk = alloc_disk(0);
> -       if (!msb->disk) {
> -               rc = -ENOMEM;
> +       rc = blk_mq_alloc_sq_tag_set(&msb->tag_set, &msb_mq_ops, 2,
> +                                    BLK_MQ_F_SHOULD_MERGE);
> +       if (rc)
>                 goto out_release_id;
> -       }
>
> -       msb->queue = blk_mq_init_sq_queue(&msb->tag_set, &msb_mq_ops, 2,
> -                                               BLK_MQ_F_SHOULD_MERGE);
> -       if (IS_ERR(msb->queue)) {
> -               rc = PTR_ERR(msb->queue);
> -               msb->queue = NULL;
> -               goto out_put_disk;
> +       msb->disk = blk_mq_alloc_disk(&msb->tag_set, card);
> +       if (IS_ERR(msb->disk)) {
> +               rc = PTR_ERR(msb->disk);
> +               goto out_free_tag_set;
>         }
> -
> -       msb->queue->queuedata = card;
> +       msb->queue = msb->disk->queue;
>
>         blk_queue_max_hw_sectors(msb->queue, MS_BLOCK_MAX_PAGES);
>         blk_queue_max_segments(msb->queue, MS_BLOCK_MAX_SEGS);
> @@ -2135,7 +2131,6 @@ static int msb_init_disk(struct memstick_dev *card)
>         sprintf(msb->disk->disk_name, "msblk%d", msb->disk_id);
>         msb->disk->fops = &msb_bdops;
>         msb->disk->private_data = msb;
> -       msb->disk->queue = msb->queue;
>
>         capacity = msb->pages_in_block * msb->logical_block_count;
>         capacity *= (msb->page_size / 512);
> @@ -2155,8 +2150,8 @@ static int msb_init_disk(struct memstick_dev *card)
>         dbg("Disk added");
>         return 0;
>
> -out_put_disk:
> -       put_disk(msb->disk);
> +out_free_tag_set:
> +       blk_mq_free_tag_set(&msb->tag_set);
>  out_release_id:
>         mutex_lock(&msb_disk_lock);
>         idr_remove(&msb_disk_idr, msb->disk_id);
> --
> 2.30.2
>

