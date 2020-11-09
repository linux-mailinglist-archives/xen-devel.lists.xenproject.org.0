Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A7B2AB6D4
	for <lists+xen-devel@lfdr.de>; Mon,  9 Nov 2020 12:31:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.22402.48700 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kc5NR-0004px-Fj; Mon, 09 Nov 2020 11:30:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 22402.48700; Mon, 09 Nov 2020 11:30:25 +0000
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
	id 1kc5NR-0004pX-Bq; Mon, 09 Nov 2020 11:30:25 +0000
Received: by outflank-mailman (input) for mailman id 22402;
 Mon, 09 Nov 2020 11:30:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RfH0=EP=redhat.com=mst@srs-us1.protection.inumbo.net>)
 id 1kc5NP-0004pS-P1
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 11:30:23 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 6fb7b241-17ff-490c-82b9-b0dcd1ae93b5;
 Mon, 09 Nov 2020 11:30:21 +0000 (UTC)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-495-r8JCfLz1M1mLEP_3X3BFuQ-1; Mon, 09 Nov 2020 06:30:20 -0500
Received: by mail-wm1-f71.google.com with SMTP id k128so778437wme.7
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2020 03:30:20 -0800 (PST)
Received: from redhat.com (bzq-79-181-34-244.red.bezeqint.net. [79.181.34.244])
 by smtp.gmail.com with ESMTPSA id 35sm10972366wro.71.2020.11.09.03.30.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 03:30:17 -0800 (PST)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=RfH0=EP=redhat.com=mst@srs-us1.protection.inumbo.net>)
	id 1kc5NP-0004pS-P1
	for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 11:30:23 +0000
X-Inumbo-ID: 6fb7b241-17ff-490c-82b9-b0dcd1ae93b5
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
	id 6fb7b241-17ff-490c-82b9-b0dcd1ae93b5;
	Mon, 09 Nov 2020 11:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1604921421;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qJPHU79Z9aFII+RXhVTkpUcHO9yLNqjEBCGqyvXY310=;
	b=V995cmrSEl54zDxw55HTc5LkSVBjkP2bV0TQekN9COsw8YV5x1PRZoXTiOQWYGIU7qeB/F
	S4Jatc89SsaTrYA2XyRpHprinR8Gwv4zs3Vt/5nvJ4nLkVnzBzM/M3xEYu8X8hmCleZFtk
	XB3dlRLouPrOoTfOtSq1W/8EfJ7ljA0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-495-r8JCfLz1M1mLEP_3X3BFuQ-1; Mon, 09 Nov 2020 06:30:20 -0500
X-MC-Unique: r8JCfLz1M1mLEP_3X3BFuQ-1
Received: by mail-wm1-f71.google.com with SMTP id k128so778437wme.7
        for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2020 03:30:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qJPHU79Z9aFII+RXhVTkpUcHO9yLNqjEBCGqyvXY310=;
        b=PifFVATXj5hQjm5ltdmK7YCX6TH3cMPn7zmuH1EDoLyxUWOU7dsEW6q9/khvSKkpgl
         qfNpaqiN5rQf0NGW4r2wMmuA8gHNXRG1pqyvvFSJanovwQdhwG1KJ7U30yfErzxW+i8V
         8QpA4//KjPYys3ii23TUPxaEVy12J+VjuRb5o6IOpJ888yCJ3L5b/XGECE35QaCijZn2
         FB0kpQiW+NZCdSzjrfWW+H6F+Aru4G+KvcVx/NDReuE4GrUojr5tmFKSXsEbXHNV3Wzx
         9epchv4J3luEHdVT3OMcBBKzZlcjDTNzbEwSyqcbQ5leMRPuVC5n6y4e5kiLTA85M6c4
         93dw==
X-Gm-Message-State: AOAM533ee9up/tAw/5XmMVc9emn0Th3tYCkI997lHIc71+WGheaItELd
	8E4CCxkn68h66CkUITTxNCn1wedDx9DBAACoPU/ZjvaBlkVg63J50GL+CW0PIeduTqv7hcO1pob
	T5hkcfNGCSiohfbyfV8qIwLB0Nm8=
X-Received: by 2002:a05:6000:1005:: with SMTP id a5mr10320355wrx.425.1604921419107;
        Mon, 09 Nov 2020 03:30:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxfMfmWa9Cv9HNLSs0dLMrckBnIhQ+LX5gsNBfqeNBoHRKN7zV/cjWgtINNh6h724r5DlDOEA==
X-Received: by 2002:a05:6000:1005:: with SMTP id a5mr10320328wrx.425.1604921418961;
        Mon, 09 Nov 2020 03:30:18 -0800 (PST)
Received: from redhat.com (bzq-79-181-34-244.red.bezeqint.net. [79.181.34.244])
        by smtp.gmail.com with ESMTPSA id 35sm10972366wro.71.2020.11.09.03.30.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 03:30:17 -0800 (PST)
Date: Mon, 9 Nov 2020 06:30:10 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Justin Sanders <justin@coraid.com>,
	Josef Bacik <josef@toxicpanda.com>,
	Ilya Dryomov <idryomov@gmail.com>,
	Jack Wang <jinpu.wang@cloud.ionos.com>,
	Jason Wang <jasowang@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Minchan Kim <minchan@kernel.org>, Mike Snitzer <snitzer@redhat.com>,
	Song Liu <song@kernel.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	dm-devel@redhat.com, linux-block@vger.kernel.org,
	drbd-dev@lists.linbit.com, nbd@other.debian.org,
	ceph-devel@vger.kernel.org, xen-devel@lists.xenproject.org,
	linux-raid@vger.kernel.org, linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 23/24] virtio-blk: remove a spurious call to
 revalidate_disk_size
Message-ID: <20201109063004-mutt-send-email-mst@kernel.org>
References: <20201106190337.1973127-1-hch@lst.de>
 <20201106190337.1973127-24-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20201106190337.1973127-24-hch@lst.de>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 06, 2020 at 08:03:35PM +0100, Christoph Hellwig wrote:
> revalidate_disk_size just updates the block device size from the disk
> size.  Thus calling it from revalidate_disk_size doesn't actually do
> anything.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: Michael S. Tsirkin <mst@redhat.com>

> ---
>  drivers/block/virtio_blk.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/block/virtio_blk.c b/drivers/block/virtio_blk.c
> index 3e812b4c32e669..145606dc52db1e 100644
> --- a/drivers/block/virtio_blk.c
> +++ b/drivers/block/virtio_blk.c
> @@ -598,7 +598,6 @@ static void virtblk_update_cache_mode(struct virtio_device *vdev)
>  	struct virtio_blk *vblk = vdev->priv;
>  
>  	blk_queue_write_cache(vblk->disk->queue, writeback, false);
> -	revalidate_disk_size(vblk->disk, true);
>  }
>  
>  static const char *const virtblk_cache_types[] = {
> -- 
> 2.28.0


