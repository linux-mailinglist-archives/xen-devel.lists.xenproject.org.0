Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37BD139839A
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jun 2021 09:50:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.135809.252122 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loLe5-0006PG-3G; Wed, 02 Jun 2021 07:50:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 135809.252122; Wed, 02 Jun 2021 07:50:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loLe5-0006NK-0C; Wed, 02 Jun 2021 07:50:33 +0000
Received: by outflank-mailman (input) for mailman id 135809;
 Wed, 02 Jun 2021 07:49:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VmpI=K4=ionos.com=jinpu.wang@srs-us1.protection.inumbo.net>)
 id 1loLdE-0005e5-Ni
 for xen-devel@lists.xenproject.org; Wed, 02 Jun 2021 07:49:40 +0000
Received: from mail-ed1-x52b.google.com (unknown [2a00:1450:4864:20::52b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8d7431d4-17ab-4f56-a0fa-2a96f54c793a;
 Wed, 02 Jun 2021 07:49:38 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id b17so1849503ede.0
 for <xen-devel@lists.xenproject.org>; Wed, 02 Jun 2021 00:49:38 -0700 (PDT)
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
X-Inumbo-ID: 8d7431d4-17ab-4f56-a0fa-2a96f54c793a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IviQGHXbohDYlY4Kaxm/cxlbY44V3tAurEYksJ8dtbE=;
        b=jCNYXrovW1sUHaOT/+lw4PCDhP0eyRFf+ELw7YXWBCDBnLin+ptT9Qqbj9mRkWWaUg
         wGBYm/DlmYSjFuDFdCiAFeYUhwBx3bN1zWIfEq4U/R6NzUaRvMrhsPRnKTgM5MVFJVxB
         CmVxljvKTCN3ZyT1LwzUVWKZgE4x9cRuQaj0TjoJvUnlN68E3Mt+4zAfSoenpZB5Ofxb
         0XLwmhqFLm1lOHsISGA/CxlwAihZibid3kenEAmMklVKKOHOy1nSq3KrSTTjFuaKWHai
         u516kaTGPG4uhGM5WuZ/+lvOuzezIo89jko54Ak3T4r5ol1iQsDze8x0V5mTappbPtSr
         aaWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IviQGHXbohDYlY4Kaxm/cxlbY44V3tAurEYksJ8dtbE=;
        b=qBuXwlGxZNwWnVUzcerQDHisE1WetQkxcHtGE0Jjlp1WGRoZbUTY+/tApYJFX/waA3
         d2YMbwV+dwQTkfgYRm8Y8/FsnnEKOzW8CNwZaswJG+7FS+wOHsow2nRAdCpGUerf3kSm
         E0kVEPWVBuv4CHOl3Cv4mwd/oY7Cb+i9jRnJzJEt6RNYT4MRtxAi/Sr1p2vWWwSzg/hn
         QZIbPcPXvJM0sryKVDURvJCiX1BMt7nmsm0UHsQ89ymTmEyXpOjlQ+l3TFQgov6xXmDg
         Aja5ZKo/Zx2WPtAuuYYZVMyC7jUmArnOoWqe6Jo99A4dCxq45S5FD25HzL9qeA4aqF05
         OcLg==
X-Gm-Message-State: AOAM530Hz8jzmazHt4QU1V3/O3FZj9BEQwAVVI8VTzUFJW21kIPTEVPI
	XhZYkNxOUganVdUCsviWTc5HdyzAxiY3/dWGoZi4nA==
X-Google-Smtp-Source: ABdhPJzRCVGimPnGT3qQlEAMsZsY3IxcZZF186UcWgTyI7ay8iWe4IlRIEG5WowCojeDoPju71hCmgBQ+xR7PgbbWL0=
X-Received: by 2002:aa7:c693:: with SMTP id n19mr33130385edq.35.1622620178044;
 Wed, 02 Jun 2021 00:49:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210602065345.355274-1-hch@lst.de> <20210602065345.355274-24-hch@lst.de>
In-Reply-To: <20210602065345.355274-24-hch@lst.de>
From: Jinpu Wang <jinpu.wang@ionos.com>
Date: Wed, 2 Jun 2021 09:49:27 +0200
Message-ID: <CAMGffEn7aCmTOTsuzbSr=DwomFKfizkNhzsZnAONHBq1neW2Og@mail.gmail.com>
Subject: Re: [PATCH 23/30] rnbd: use blk_mq_alloc_disk and blk_cleanup_disk
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Justin Sanders <justin@coraid.com>, 
	Denis Efremov <efremov@linux.com>, Josef Bacik <josef@toxicpanda.com>, Tim Waugh <tim@cyberelk.net>, 
	Geoff Levand <geoff@infradead.org>, Ilya Dryomov <idryomov@gmail.com>, 
	"Md. Haris Iqbal" <haris.iqbal@ionos.com>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Mike Snitzer <snitzer@redhat.com>, Maxim Levitsky <maximlevitsky@gmail.com>, 
	Alex Dubov <oakad@yahoo.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Christian Borntraeger <borntraeger@de.ibm.com>, 
	device-mapper development <dm-devel@redhat.com>, linux-block <linux-block@vger.kernel.org>, nbd@other.debian.org, 
	linuxppc-dev@lists.ozlabs.org, Ceph Development <ceph-devel@vger.kernel.org>, 
	virtualization@lists.linux-foundation.org, xen-devel@lists.xenproject.org, 
	linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org, 
	linux-s390@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 2, 2021 at 8:55 AM Christoph Hellwig <hch@lst.de> wrote:
>
> Use blk_mq_alloc_disk and blk_cleanup_disk to simplify the gendisk and
> request_queue allocation.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/block/rnbd/rnbd-clt.c | 35 ++++++++---------------------------
>  1 file changed, 8 insertions(+), 27 deletions(-)
>
> diff --git a/drivers/block/rnbd/rnbd-clt.c b/drivers/block/rnbd/rnbd-clt.c
> index c604a402cd5c..f4fa45d24c0b 100644
> --- a/drivers/block/rnbd/rnbd-clt.c
> +++ b/drivers/block/rnbd/rnbd-clt.c
> @@ -1353,18 +1353,6 @@ static void rnbd_init_mq_hw_queues(struct rnbd_clt_dev *dev)
>         }
>  }
>
> -static int setup_mq_dev(struct rnbd_clt_dev *dev)
> -{
> -       dev->queue = blk_mq_init_queue(&dev->sess->tag_set);
> -       if (IS_ERR(dev->queue)) {
> -               rnbd_clt_err(dev, "Initializing multiqueue queue failed, err: %ld\n",
> -                             PTR_ERR(dev->queue));
> -               return PTR_ERR(dev->queue);
> -       }
> -       rnbd_init_mq_hw_queues(dev);
> -       return 0;
> -}
> -
>  static void setup_request_queue(struct rnbd_clt_dev *dev)
>  {
>         blk_queue_logical_block_size(dev->queue, dev->logical_block_size);
> @@ -1393,13 +1381,13 @@ static void setup_request_queue(struct rnbd_clt_dev *dev)
>         blk_queue_io_opt(dev->queue, dev->sess->max_io_size);
>         blk_queue_virt_boundary(dev->queue, SZ_4K - 1);
>         blk_queue_write_cache(dev->queue, dev->wc, dev->fua);
> -       dev->queue->queuedata = dev;
>  }
>
>  static void rnbd_clt_setup_gen_disk(struct rnbd_clt_dev *dev, int idx)
>  {
>         dev->gd->major          = rnbd_client_major;
>         dev->gd->first_minor    = idx << RNBD_PART_BITS;
> +       dev->gd->minors         = 1 << RNBD_PART_BITS;
>         dev->gd->fops           = &rnbd_client_ops;
>         dev->gd->queue          = dev->queue;
>         dev->gd->private_data   = dev;
> @@ -1426,24 +1414,18 @@ static void rnbd_clt_setup_gen_disk(struct rnbd_clt_dev *dev, int idx)
>
>  static int rnbd_client_setup_device(struct rnbd_clt_dev *dev)
>  {
> -       int err, idx = dev->clt_device_id;
> +       int idx = dev->clt_device_id;
>
>         dev->size = dev->nsectors * dev->logical_block_size;
>
> -       err = setup_mq_dev(dev);
> -       if (err)
> -               return err;
> +       dev->gd = blk_mq_alloc_disk(&dev->sess->tag_set, dev);
> +       if (IS_ERR(dev->gd))
> +               return PTR_ERR(dev->gd);
> +       dev->queue = dev->gd->queue;
> +       rnbd_init_mq_hw_queues(dev);
>
>         setup_request_queue(dev);
> -
> -       dev->gd = alloc_disk_node(1 << RNBD_PART_BITS,  NUMA_NO_NODE);
> -       if (!dev->gd) {
> -               blk_cleanup_queue(dev->queue);
> -               return -ENOMEM;
> -       }
> -
>         rnbd_clt_setup_gen_disk(dev, idx);
> -
>         return 0;
>  }
>
> @@ -1650,8 +1632,7 @@ struct rnbd_clt_dev *rnbd_clt_map_device(const char *sessname,
>  static void destroy_gen_disk(struct rnbd_clt_dev *dev)
>  {
>         del_gendisk(dev->gd);
> -       blk_cleanup_queue(dev->queue);
> -       put_disk(dev->gd);
> +       blk_cleanup_disk(dev->gd);
>  }
>
>  static void destroy_sysfs(struct rnbd_clt_dev *dev,
> --
> 2.30.2

Looks good to me, thx!
Reviewed-by: Jack Wang <jinpu.wang@ionos.com>
>

