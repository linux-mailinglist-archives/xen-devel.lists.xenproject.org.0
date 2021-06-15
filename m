Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E45A93A8470
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jun 2021 17:48:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.142246.262527 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltBIB-0004HE-Jl; Tue, 15 Jun 2021 15:47:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 142246.262527; Tue, 15 Jun 2021 15:47:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltBIB-0004E8-Fx; Tue, 15 Jun 2021 15:47:55 +0000
Received: by outflank-mailman (input) for mailman id 142246;
 Tue, 15 Jun 2021 15:47:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PsWs=LJ=samsung.com=m.szyprowski@srs-us1.protection.inumbo.net>)
 id 1ltBI9-0004Dy-6D
 for xen-devel@lists.xenproject.org; Tue, 15 Jun 2021 15:47:53 +0000
Received: from mailout2.w1.samsung.com (unknown [210.118.77.12])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f8c8a821-dea1-488e-ac0d-5cf2f3287418;
 Tue, 15 Jun 2021 15:47:49 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20210615154748euoutp025393b0ef1c05766c8964ff08effcb737~IzBfLeirf0708407084euoutp02U;
 Tue, 15 Jun 2021 15:47:48 +0000 (GMT)
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20210615154747eucas1p10fc0c489f6b2b99ec3ee3c0d1d182386~IzBerCabW2052020520eucas1p1O;
 Tue, 15 Jun 2021 15:47:47 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 25.05.09439.3ABC8C06; Tue, 15
 Jun 2021 16:47:47 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20210615154746eucas1p1321b6f1cf38d21899632e132cf025e61~IzBeAseUp3082930829eucas1p1T;
 Tue, 15 Jun 2021 15:47:46 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20210615154746eusmtrp2ae9e870f68d5a24f27850c8ddaf7c3b5~IzBd-erfP0310203102eusmtrp2N;
 Tue, 15 Jun 2021 15:47:46 +0000 (GMT)
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 42.91.08705.2ABC8C06; Tue, 15
 Jun 2021 16:47:46 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20210615154744eusmtip131f3ea0c677d37e629dba0cc864eb86e~IzBb_60KM0958409584eusmtip1b;
 Tue, 15 Jun 2021 15:47:44 +0000 (GMT)
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
X-Inumbo-ID: f8c8a821-dea1-488e-ac0d-5cf2f3287418
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20210615154748euoutp025393b0ef1c05766c8964ff08effcb737~IzBfLeirf0708407084euoutp02U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1623772068;
	bh=X0hoPpP4PG9rXwI/rCRN/9SSp3Kx8sxGj31M98xjvfU=;
	h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
	b=qJZOgWIWUXl8lnnt9+IxTIfAKH+yJbdmf6G9NWvHS3NKPvKBD8A1zhdMrs0dBTpCw
	 TTJcqahuR4hMHCgWD3qx7YlIWRXqLQmQ4kQliMh/gkWXrGBG6YhpegstqWuOg6QjHs
	 zghIbtOv7f2Sl4wFEzFd3MNi3/gfanhjgq/L45XU=
X-AuditID: cbfec7f5-c03ff700000024df-5c-60c8cba39819
Subject: Re: [PATCH 09/30] mtd_blkdevs: use blk_mq_alloc_disk
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Cc: Justin Sanders <justin@coraid.com>, Denis Efremov <efremov@linux.com>,
	Josef Bacik <josef@toxicpanda.com>, Tim Waugh <tim@cyberelk.net>, Geoff
	Levand <geoff@infradead.org>, Ilya Dryomov <idryomov@gmail.com>, "Md. Haris
 Iqbal" <haris.iqbal@ionos.com>, Jack Wang <jinpu.wang@ionos.com>, "Michael
 S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, Konrad
	Rzeszutek Wilk <konrad.wilk@oracle.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>, Mike Snitzer <snitzer@redhat.com>, Maxim Levitsky
	<maximlevitsky@gmail.com>, Alex Dubov <oakad@yahoo.com>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
	Raghavendra <vigneshr@ti.com>, Heiko Carstens <hca@linux.ibm.com>, Vasily
	Gorbik <gor@linux.ibm.com>, Christian Borntraeger <borntraeger@de.ibm.com>,
	dm-devel@redhat.com, linux-block@vger.kernel.org, nbd@other.debian.org,
	linuxppc-dev@lists.ozlabs.org, ceph-devel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, xen-devel@lists.xenproject.org,
	linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-s390@vger.kernel.org, Bartlomiej Zolnierkiewicz
	<b.zolnierkie@samsung.com>
From: Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <13b21a07-b7c7-37db-fdc9-77bf174b6f8f@samsung.com>
Date: Tue, 15 Jun 2021 17:47:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0)
	Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210602065345.355274-10-hch@lst.de>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa0xTZxjH855zenrapXgoKK/KhqvTZGWCzC2+CQ4vY3DiB0S2+IEt0gZO
	AIVqWphuy5SAE22GVEqkazcucimTi1puAlOkjJtAZVAmVhgpgiLCBnLbEOgohY1vv+f/f573
	ef7JS+FCM7mFipbFsXKZNEZE8onKpn9Mu3LbWiS7Uy57oKL+VBLd1tzkoIzCKgJNPE7D0N0/
	dRxkflALUN4LP9SpneWgyrZbXPQy8wZAPxc1YmggM5lEBV1TGBo3pBNoweqDzAk7UUHuMEB3
	LZ7oV1sqQLWJBVykyknC0eu5JQ4aa73ORQ3J9zjINj/KQa+HSzBkbSrCkbp6DCDNw1wOunh7
	BqDBfD2ObB0TXKTvyCTRXLkaOyBiMou/YV6qVYBpfdFOMI0N9VymftBIMtXafi5TVihm2sb6
	MKa7I54ZMmdgjOr6fcCU5Z1n1L16wDzU5ACmYcJMMLWPE8jgzaH8fRFsTPSXrNzbT8KPSsu6
	T5x+6nlW89vWBGDYrgQ8CtIfQMtIO1ACPiWkCwFsNtlwRzENYNGUcrWYWnbSdWBtpGAxHbez
	kNYD+HuH1NE0CWDxcB9mN1zoj+BgqYljZ1f6ANTdyiftTTidx4OPTImE3SBpH6gcVy4bFCWg
	/WBKjbtdJugdcMx6lbTzRjoc/pWpWXlHQDvD1h+GVkZ59PvwQZ1thXHaAyZV6HAHu0HLUBZm
	3wXpIT68ZOnFHFf7Q7M+lXSwCxxtLuc62B3aqtcGkgC0mkq4juJ7ALsTNauZfWGfaX7lUpx+
	F96s8XbIB+EF5R3cLkPaCfaOOzuOcIJplRmrsgBeuih0dO+E2ubS/9bWd3bhKiDSroumXRdH
	uy6O9v+92YC4AdzYeEVsJKvYI2PPeCmksYp4WaRX+KlYA1j++G1LzTN3QOHopJcRYBQwAkjh
	IlfBLkWLRCiIkH71NSs/FSaPj2EVRrCVIkRugpqK4jAhHSmNY0+y7GlWvuZiFG9LAiZNenOA
	91nluZmjE82fuxiajs+W+Zs/je/6IzrLemK3qTfkO3d5NRUaZ9nb8/yLeZPR3+TtNiIJrko7
	UTHicczvSonhvSD3zopXruqze62zXYq6HZ7RsQPeHPMbf9/ruXDcqWnTj7KynpDAKnVIpa86
	Oyk/efJg8DXLtvyRw6Pftsqm0o4U6558eDJIwVzpf7Kg5UdiAZuf/zQksUU9Dd0n1B9++61p
	7wiLpj3gWGjgonYpfSFAnnL+qFg19/EnYs2zwP3Xlq6eyfY9FFjX8mjD9ukw57xt4tCmd+a4
	3ZJfgjz3h5/jPts4sFjaIDF6ZFQX5ZSVHyIbDSXDG46o6Fd7XC/PbxIRiiipjxiXK6T/AgrX
	tBBnBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa0xTdxjG+Z9bC6Tk0JZ4hpiZLkMDo9AC9c8C1C/bzrIsUaaJUxxt8HAR
	KK6Xpduy2YiKdi5UWgYrrlxbqsBALjpuU6l1AkOGY2YSmFBgC1gUr4xx6WjZEr798r7P70ne
	5GWj3Bk8lJ2tUDNKhTxXQARgA2s/jUdVD9yWxXT/FQvrx4sIeLmsCYel9qsYXLhfjMCeR+U4
	HOnvArB2Nhn+Yn6JwysDzSz40HIJwIv1TgQ+sBQS0Hb3GQLnW0wYXJkUwRFdOLTVzADYMxoJ
	b3qKAOw6YWNBQ1UBCpcX13Do7qtmQUfhjzj0/DOHw+WZRgRO3qpHobHDDWDZUA0OT19+AaDL
	WodCz+ACC9YNWgi42GZEdgtoS8Pn9EOjAdB9sz9jtNNxg0XfcPUSdId5nEW32iPoAfcYQv86
	qKGnR0oR2lB9HdCttcdp4+91gB4qqwK0Y2EEo7vu64g9rxwUJirzNWpme1a+Sp0kOCSCYqEo
	AQrFcQlCUeyuw2+K4wXRyYlHmNzsTxhldLJMmFVccR07NhWpLRveqgMtr+mBP5si4yjbqgn1
	Mpe0Aur5hP/GPIzq+0aHbzCPWrmnJ/QgYD3zGFC/TX1FeBc8MolyfX/HF+KTu6nyZqsvhJI2
	f2p0eJy10XqAWio45WOCFFH6eW8Tm80hk6mvO8O8Y4x8nXJPnvd1hpDp1FJToY85ZDDV9+00
	5mV/Ukz1X/P4GCUllKV1Et3gV6mC9vL/eAs1Ol2BGADXvEk3b1LMmxTzJqUSYJcAn9Go8jLz
	VCKhSp6n0igyhen5eS1g/d+u3Fpq/QFY5p4IewHCBr2AYqMCPidKdVvG5RyRf/oZo8xPU2py
	GVUviF+/5zwaGpKev/6wCnWaSBITL4qTJMTEJ0hiBVs47d81pHHJTLmayWGYY4zyfw9h+4fq
	kNS43HOz8asBOc8aX3QWHdI2B9szLmRI91hXnU/3HnVlVa2IU6TbwAcmtd8ux0SkNkJnr8zo
	3Pruny9Loi0V147ST2oJSebQO4q7N7e5+NgfbfwKrTnxcXRgqeSjKb+9y3/Lz+akLrIP0MPZ
	jtTjYcXZ+/AvwkOGrMbnNU1BTNC8VvrxNO9DnnQqiCdlC9z7A9faL8pOTtRuX+wcHtP3Ne54
	dLjh5E6TM5A01r5ve3vsTkp/lMMkqzI0vReZ4GfYGZKUcoLz5VvwzOmOC0/5SzOERRlc2Xau
	lMc45SV27X7rG0EZptUzJVcPeuDZsHqsslvnyuspnet4EH6K6Q6/J8BUWXJRBKpUyf8FChkx
	W/gDAAA=
X-CMS-MailID: 20210615154746eucas1p1321b6f1cf38d21899632e132cf025e61
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20210615154746eucas1p1321b6f1cf38d21899632e132cf025e61
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210615154746eucas1p1321b6f1cf38d21899632e132cf025e61
References: <20210602065345.355274-1-hch@lst.de>
	<20210602065345.355274-10-hch@lst.de>
	<CGME20210615154746eucas1p1321b6f1cf38d21899632e132cf025e61@eucas1p1.samsung.com>

Hi,

On 02.06.2021 08:53, Christoph Hellwig wrote:
> Use the blk_mq_alloc_disk API to simplify the gendisk and request_queue
> allocation.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

This patch landed in linux-next as commit 6966bb921def ("mtd_blkdevs: 
use blk_mq_alloc_disk"). It causes the following regression on my QEMU 
arm64 setup:

  Using buffer write method
  Concatenating MTD devices:
  (0): "0.flash"
  (1): "0.flash"
  into device "0.flash"
  Unable to handle kernel NULL pointer dereference at virtual address 
0000000000000068
  Mem abort info:
    ESR = 0x96000004
    EC = 0x25: DABT (current EL), IL = 32 bits
    SET = 0, FnV = 0
    EA = 0, S1PTW = 0
  Data abort info:
    ISV = 0, ISS = 0x00000004
    CM = 0, WnR = 0
  [0000000000000068] user address but active_mm is swapper
  Internal error: Oops: 96000004 [#1] PREEMPT SMP
  Modules linked in:
  CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.13.0-rc3+ #10492
  Hardware name: linux,dummy-virt (DT)
  pstate: 00000005 (nzcv daif -PAN -UAO -TCO BTYPE=--)
  pc : blk_finish_plug+0x5c/0x268
  lr : blk_queue_write_cache+0x28/0x70
...
  Call trace:
   blk_finish_plug+0x5c/0x268
   add_mtd_blktrans_dev+0x270/0x420
   mtdblock_add_mtd+0x68/0x98
   blktrans_notify_add+0x44/0x70
   add_mtd_device+0x41c/0x490
   mtd_device_parse_register+0xf4/0x1c8
   physmap_flash_probe+0x44c/0x780
   platform_probe+0x90/0xd8
   really_probe+0x108/0x3c0
   driver_probe_device+0x60/0xc0
   device_driver_attach+0x6c/0x78
   __driver_attach+0xc0/0x100
   bus_for_each_dev+0x68/0xc8
   driver_attach+0x20/0x28
   bus_add_driver+0x168/0x1f8
   driver_register+0x60/0x110
   __platform_driver_register+0x24/0x30
   physmap_init+0x18/0x20
   do_one_initcall+0x84/0x450
   kernel_init_freeable+0x2dc/0x334
   kernel_init+0x10/0x110
   ret_from_fork+0x10/0x18
  Code: 88027c01 35ffffa2 17fff079 f9800031 (c85f7c22)
  ---[ end trace b774518e0766cc92 ]---
  Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
  SMP: stopping secondary CPUs
  Kernel Offset: 0x594d1fa00000 from 0xffff800010000000
  PHYS_OFFSET: 0xffffea7300000000
  CPU features: 0x11000671,00000846
  Memory Limit: none
  ---[ end Kernel panic - not syncing: Attempted to kill init! 
exitcode=0x0000000b ]---

> ---
>   drivers/mtd/mtd_blkdevs.c | 48 ++++++++++++++++++---------------------
>   1 file changed, 22 insertions(+), 26 deletions(-)
>
> diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
> index fb8e12d590a1..5dc4c966ea73 100644
> --- a/drivers/mtd/mtd_blkdevs.c
> +++ b/drivers/mtd/mtd_blkdevs.c
> @@ -30,11 +30,9 @@ static void blktrans_dev_release(struct kref *kref)
>   	struct mtd_blktrans_dev *dev =
>   		container_of(kref, struct mtd_blktrans_dev, ref);
>   
> -	dev->disk->private_data = NULL;
> -	blk_cleanup_queue(dev->rq);
> +	blk_cleanup_disk(dev->disk);
>   	blk_mq_free_tag_set(dev->tag_set);
>   	kfree(dev->tag_set);
> -	put_disk(dev->disk);
>   	list_del(&dev->list);
>   	kfree(dev);
>   }
> @@ -354,7 +352,7 @@ int add_mtd_blktrans_dev(struct mtd_blktrans_dev *new)
>   	if (new->devnum > (MINORMASK >> tr->part_bits) ||
>   	    (tr->part_bits && new->devnum >= 27 * 26)) {
>   		mutex_unlock(&blktrans_ref_mutex);
> -		goto error1;
> +		return ret;
>   	}
>   
>   	list_add_tail(&new->list, &tr->devs);
> @@ -366,17 +364,28 @@ int add_mtd_blktrans_dev(struct mtd_blktrans_dev *new)
>   	if (!tr->writesect)
>   		new->readonly = 1;
>   
> -	/* Create gendisk */
>   	ret = -ENOMEM;
> -	gd = alloc_disk(1 << tr->part_bits);
> +	new->tag_set = kzalloc(sizeof(*new->tag_set), GFP_KERNEL);
> +	if (!new->tag_set)
> +		goto out_list_del;
>   
> -	if (!gd)
> -		goto error2;
> +	ret = blk_mq_alloc_sq_tag_set(new->tag_set, &mtd_mq_ops, 2,
> +			BLK_MQ_F_SHOULD_MERGE | BLK_MQ_F_BLOCKING);
> +	if (ret)
> +		goto out_kfree_tag_set;
> +
> +	/* Create gendisk */
> +	gd = blk_mq_alloc_disk(new->tag_set, new);
> +	if (IS_ERR(gd)) {
> +		ret = PTR_ERR(gd);
> +		goto out_free_tag_set;
> +	}
>   
>   	new->disk = gd;
>   	gd->private_data = new;
>   	gd->major = tr->major;
>   	gd->first_minor = (new->devnum) << tr->part_bits;
> +	gd->minors = 1 << tr->part_bits;
>   	gd->fops = &mtd_block_ops;
>   
>   	if (tr->part_bits)
> @@ -398,22 +407,9 @@ int add_mtd_blktrans_dev(struct mtd_blktrans_dev *new)
>   	spin_lock_init(&new->queue_lock);
>   	INIT_LIST_HEAD(&new->rq_list);
>   
> -	new->tag_set = kzalloc(sizeof(*new->tag_set), GFP_KERNEL);
> -	if (!new->tag_set)
> -		goto error3;
> -
> -	new->rq = blk_mq_init_sq_queue(new->tag_set, &mtd_mq_ops, 2,
> -				BLK_MQ_F_SHOULD_MERGE | BLK_MQ_F_BLOCKING);
> -	if (IS_ERR(new->rq)) {
> -		ret = PTR_ERR(new->rq);
> -		new->rq = NULL;
> -		goto error4;
> -	}
> -
>   	if (tr->flush)
>   		blk_queue_write_cache(new->rq, true, false);
>   
> -	new->rq->queuedata = new;
>   	blk_queue_logical_block_size(new->rq, tr->blksize);
>   
>   	blk_queue_flag_set(QUEUE_FLAG_NONROT, new->rq);
> @@ -437,13 +433,13 @@ int add_mtd_blktrans_dev(struct mtd_blktrans_dev *new)
>   		WARN_ON(ret);
>   	}
>   	return 0;
> -error4:
> +
> +out_free_tag_set:
> +	blk_mq_free_tag_set(new->tag_set);
> +out_kfree_tag_set:
>   	kfree(new->tag_set);
> -error3:
> -	put_disk(new->disk);
> -error2:
> +out_list_del:
>   	list_del(&new->list);
> -error1:
>   	return ret;
>   }
>   

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


