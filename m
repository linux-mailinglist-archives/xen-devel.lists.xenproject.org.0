Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E9D12AA1DA
	for <lists+xen-devel@lfdr.de>; Sat,  7 Nov 2020 01:40:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.21210.47508 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kbCGu-0003aP-VJ; Sat, 07 Nov 2020 00:40:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 21210.47508; Sat, 07 Nov 2020 00:40:00 +0000
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
	id 1kbCGu-0003a0-Rv; Sat, 07 Nov 2020 00:40:00 +0000
Received: by outflank-mailman (input) for mailman id 21210;
 Sat, 07 Nov 2020 00:39:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eQUk=EN=kernel.org=song@srs-us1.protection.inumbo.net>)
 id 1kbCGt-0003Zv-Ey
 for xen-devel@lists.xenproject.org; Sat, 07 Nov 2020 00:39:59 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0dbf14de-ad00-4b4c-ab54-d49b39ca2c70;
 Sat, 07 Nov 2020 00:39:58 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A8B4C22202
 for <xen-devel@lists.xenproject.org>; Sat,  7 Nov 2020 00:39:57 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id l2so4418438lfk.0
 for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2020 16:39:57 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=eQUk=EN=kernel.org=song@srs-us1.protection.inumbo.net>)
	id 1kbCGt-0003Zv-Ey
	for xen-devel@lists.xenproject.org; Sat, 07 Nov 2020 00:39:59 +0000
X-Inumbo-ID: 0dbf14de-ad00-4b4c-ab54-d49b39ca2c70
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 0dbf14de-ad00-4b4c-ab54-d49b39ca2c70;
	Sat, 07 Nov 2020 00:39:58 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id A8B4C22202
	for <xen-devel@lists.xenproject.org>; Sat,  7 Nov 2020 00:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604709598;
	bh=yHGYGCtLswTDWsVV8G7btJ2YrfbhRJpoj/2QQHMNku0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=JaraML33QnlELqv9b1nVGycC8TqrN2CO3mYGqYHHPbzpftbxLrgkNlDLzNuVKBnOA
	 +2GGCnIf2S6SmvnOXWVOrneIGjkyT+jTAQmqF3CZZVfU2qqbBMNpn6QobIOWbu07iq
	 qAPvrSntweEuYizqycf91KNQI82ZEYM27rTtgZAw=
Received: by mail-lf1-f54.google.com with SMTP id l2so4418438lfk.0
        for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2020 16:39:57 -0800 (PST)
X-Gm-Message-State: AOAM532JSiOqqS9zILphQelElLI0YHC1sQWXruVh0n26ofkk99DwghHI
	ZqyhjDi78rxejhAYWfhBPwLr0Ew8dtI1iGmvz0k=
X-Google-Smtp-Source: ABdhPJxa7Wve2F+59EP4hPqinvAbRhF4pNbwqT8FgL1QaPoOKbDOM27LB1KUwtpCP4KuABwtVBcs7qNXSe7PRXbnm/0=
X-Received: by 2002:a19:4b45:: with SMTP id y66mr1708840lfa.482.1604709595815;
 Fri, 06 Nov 2020 16:39:55 -0800 (PST)
MIME-Version: 1.0
References: <20201106190337.1973127-1-hch@lst.de> <20201106190337.1973127-23-hch@lst.de>
In-Reply-To: <20201106190337.1973127-23-hch@lst.de>
From: Song Liu <song@kernel.org>
Date: Fri, 6 Nov 2020 16:39:44 -0800
X-Gmail-Original-Message-ID: <CAPhsuW4TjGZYpf-Ad4sk5WMq8BLGTpxaCd-FnMfmqo49pX1Z9w@mail.gmail.com>
Message-ID: <CAPhsuW4TjGZYpf-Ad4sk5WMq8BLGTpxaCd-FnMfmqo49pX1Z9w@mail.gmail.com>
Subject: Re: [PATCH 22/24] md: remove a spurious call to revalidate_disk_size
 in update_size
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Justin Sanders <justin@coraid.com>, 
	Josef Bacik <josef@toxicpanda.com>, Ilya Dryomov <idryomov@gmail.com>, 
	Jack Wang <jinpu.wang@cloud.ionos.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Stefan Hajnoczi <stefanha@redhat.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Minchan Kim <minchan@kernel.org>, Mike Snitzer <snitzer@redhat.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, dm-devel@redhat.com, 
	linux-block@vger.kernel.org, drbd-dev@lists.linbit.com, nbd@other.debian.org, 
	ceph-devel@vger.kernel.org, xen-devel@lists.xenproject.org, 
	linux-raid <linux-raid@vger.kernel.org>, linux-nvme@lists.infradead.org, 
	linux-scsi@vger.kernel.org, Linux-Fsdevel <linux-fsdevel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 6, 2020 at 11:04 AM Christoph Hellwig <hch@lst.de> wrote:
>
> None of the ->resize methods updates the disk size, so calling
> revalidate_disk_size here won't do anything.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: Song Liu <song@kernel.org>

> ---
>  drivers/md/md-cluster.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/md/md-cluster.c b/drivers/md/md-cluster.c
> index 87442dc59f6ca3..35e2690c1803dd 100644
> --- a/drivers/md/md-cluster.c
> +++ b/drivers/md/md-cluster.c
> @@ -1299,8 +1299,6 @@ static void update_size(struct mddev *mddev, sector_t old_dev_sectors)
>         } else {
>                 /* revert to previous sectors */
>                 ret = mddev->pers->resize(mddev, old_dev_sectors);
> -               if (!ret)
> -                       revalidate_disk_size(mddev->gendisk, true);
>                 ret = __sendmsg(cinfo, &cmsg);
>                 if (ret)
>                         pr_err("%s:%d: failed to send METADATA_UPDATED msg\n",
> --
> 2.28.0
>

