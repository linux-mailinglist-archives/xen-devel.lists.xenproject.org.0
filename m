Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E37506390
	for <lists+xen-devel@lfdr.de>; Tue, 19 Apr 2022 06:52:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.307730.522996 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngfqB-0001Y2-6Z; Tue, 19 Apr 2022 04:51:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 307730.522996; Tue, 19 Apr 2022 04:51:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngfqB-0001W8-3W; Tue, 19 Apr 2022 04:51:51 +0000
Received: by outflank-mailman (input) for mailman id 307730;
 Tue, 19 Apr 2022 04:51:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o/kj=U5=ionos.com=jinpu.wang@srs-se1.protection.inumbo.net>)
 id 1ngfq9-0001W2-NG
 for xen-devel@lists.xenproject.org; Tue, 19 Apr 2022 04:51:49 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6b43b879-bf9c-11ec-a405-831a346695d4;
 Tue, 19 Apr 2022 06:51:47 +0200 (CEST)
Received: by mail-lf1-x12f.google.com with SMTP id x33so27387339lfu.1
 for <xen-devel@lists.xenproject.org>; Mon, 18 Apr 2022 21:51:47 -0700 (PDT)
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
X-Inumbo-ID: 6b43b879-bf9c-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BI9yKDogyA9J1nIp2A5DqA5VrUzX8xmulCW+rbuq8PY=;
        b=SJ+jl8otuJP8V2SgmRrkKx5N5mzchzJWNs3wHGu/KEMaBtHJMlOSyPwEwTYRCJOsK0
         +ub417XW+OB47SmEbjExHhWdvjVWNP6f4maHx7wpcQ/meMLPTDZio2MhC3cJJ+CFcG7A
         WyaAXMErjpaI/XL4ZkxN4ZoByVo51Plmy8MlzTn6CKA4kPvTL6QPTM/FElDnmxz/4bAo
         dNPevLcXfcZa94Hc/QRZN/ahpyGhXVxqtHvMswx1d+ioXM8CH8EB0Ocsp4CDYa7mfCxx
         3EMIYtoYuS9+fNRK0znetQsYbQBpHaSNFwuzb6Pw3NmrbbAzHjf8OVLAsic0niCU/6Hj
         1cWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BI9yKDogyA9J1nIp2A5DqA5VrUzX8xmulCW+rbuq8PY=;
        b=JmYgMdh6yK5pcAWWiDKkM6IEN5jxFXcn4NvAQOtcKwT06b23Uq1xcdQoguO2pKA5xv
         ubqcNZm+Tjh/Ll0FszJm+WclobsRAYgJJT9vq0Anhx7TRn7DGx8bXjdw5B3mSN27DJOe
         1kpOYPS0S42b02RdwA9xeDLFaUPRdexnEOT620yiptDxHjawLdh15AD/i1WEncVIkTR/
         L12YHizmlyCyFQY7eL3FofjGSL9gXSECVCqzblwS+WHDw6yM6+Brfl2AzEZJ4bwliFIX
         olsUpLW4opemtBpQL9+FHshX79o3IaBAXnzdZcbA+U3i1Lh1XkJH7iC7moTDTvg+dshm
         rIdQ==
X-Gm-Message-State: AOAM531UWN6r7x4ft8/0H3I5upm4TlDC3pq28VyyzbJPKebM+IGSGIw8
	n4f0uujAVQysqN+7OzljtWGN5HaDHlY4eR9RKDKofQ==
X-Google-Smtp-Source: ABdhPJyLR4ZusRr2xSa6FgTHa9kgMMN14+gTuhXJUl7advlAotvmYnqJxqDiVIivr0X1ZGDx839mhVaChBp2powMkIg=
X-Received: by 2002:a05:6512:10c5:b0:471:a703:bca4 with SMTP id
 k5-20020a05651210c500b00471a703bca4mr1289967lfg.581.1650343907228; Mon, 18
 Apr 2022 21:51:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220418045314.360785-1-hch@lst.de> <20220418045314.360785-11-hch@lst.de>
In-Reply-To: <20220418045314.360785-11-hch@lst.de>
From: Jinpu Wang <jinpu.wang@ionos.com>
Date: Tue, 19 Apr 2022 06:51:12 +0200
Message-ID: <CAMGffEnxwHE_QgN2OS93BHe6U+XdYc_R5OmSROmF5F-HXK_E4A@mail.gmail.com>
Subject: Re: [PATCH 10/11] rnbd-srv: use bdev_discard_alignment
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Richard Weinberger <richard@nod.at>, 
	Johannes Berg <johannes@sipsolutions.net>, Josef Bacik <josef@toxicpanda.com>, 
	"Md. Haris Iqbal" <haris.iqbal@ionos.com>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Mike Snitzer <snitzer@kernel.org>, Song Liu <song@kernel.org>, 
	Stefan Haberland <sth@linux.ibm.com>, Jan Hoeppner <hoeppner@linux.ibm.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, linux-um@lists.infradead.org, 
	linux-block@vger.kernel.org, nbd@other.debian.org, 
	virtualization@lists.linux-foundation.org, xen-devel@lists.xenproject.org, 
	linux-raid@vger.kernel.org, linux-nvme@lists.infradead.org, 
	linux-s390@vger.kernel.org, dm-devel@redhat.com
Content-Type: text/plain; charset="UTF-8"

On Mon, Apr 18, 2022 at 6:53 AM Christoph Hellwig <hch@lst.de> wrote:
>
> Use bdev_discard_alignment to calculate the correct discard alignment
> offset even for partitions instead of just looking at the queue limit.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
Thx!
Acked-by: Jack Wang <jinpu.wang@ionos.com>
> ---
>  drivers/block/rnbd/rnbd-srv-dev.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/block/rnbd/rnbd-srv-dev.h b/drivers/block/rnbd/rnbd-srv-dev.h
> index d080a0de59225..4309e52524691 100644
> --- a/drivers/block/rnbd/rnbd-srv-dev.h
> +++ b/drivers/block/rnbd/rnbd-srv-dev.h
> @@ -59,7 +59,7 @@ static inline int rnbd_dev_get_discard_granularity(const struct rnbd_dev *dev)
>
>  static inline int rnbd_dev_get_discard_alignment(const struct rnbd_dev *dev)
>  {
> -       return bdev_get_queue(dev->bdev)->limits.discard_alignment;
> +       return bdev_discard_alignment(dev->bdev);
>  }
>
>  #endif /* RNBD_SRV_DEV_H */
> --
> 2.30.2
>

