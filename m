Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6570725628
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jun 2023 09:44:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.544416.850198 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6nqI-0007mM-Fo; Wed, 07 Jun 2023 07:44:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 544416.850198; Wed, 07 Jun 2023 07:44:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6nqI-0007it-CG; Wed, 07 Jun 2023 07:44:30 +0000
Received: by outflank-mailman (input) for mailman id 544416;
 Wed, 07 Jun 2023 07:44:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H/6g=B3=bombadil.srs.infradead.org=BATV+e57f13fd7911cf5fc1b0+7227+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1q6nqG-0007ht-O1
 for xen-devel@lists.xenproject.org; Wed, 07 Jun 2023 07:44:29 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:3::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2099ec7c-0507-11ee-b232-6b7b168915f2;
 Wed, 07 Jun 2023 09:44:27 +0200 (CEST)
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1q6nqB-004n5l-03; Wed, 07 Jun 2023 07:44:23 +0000
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
X-Inumbo-ID: 2099ec7c-0507-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=4Sx6PZ8z7yUHSRyrSyhfNlQuLMPtcylN+zdcdoTWpXg=; b=KEHhRRtM/7119LZoHZ21PYKQvf
	oxQ3RW7h1hm22BBehjrTIxZs+Hq4vNo2r7l6s04yZHqhXriMF63WHd9i5/zDyUJLhCmuIXXizFHjF
	4Jsv/ky6uLqB5DrYaMtEapqpJJHQIp+5COiFf/fjdAb68jrejI06b4/3yOXZm25RDROV2sLsCI7/M
	LzYuzlMAcsstPZ3ok7GYLmLvIlnHuHYvruYjB+JVdJQz2zhH7pKYEIBJ1kQdE+vY6qsnVevIkJy2M
	ta9L6kYnOflYPdvVBtihfIYaqAzWLOjNSQvLp3cM2kFEDfgTrtzUdL7vORwRcQ+gVauExyOPeEpbw
	JiOgiSfQ==;
Date: Wed, 7 Jun 2023 00:44:22 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Jens Axboe <axboe@kernel.dk>,
	Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>,
	xen-devel@lists.xenproject.org, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] xen-blkback: Implement diskseq checks
Message-ID: <ZIA1VkDdgt5kmqEt@infradead.org>
References: <20230601214823.1701-1-demi@invisiblethingslab.com>
 <20230601214823.1701-2-demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230601214823.1701-2-demi@invisiblethingslab.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Thu, Jun 01, 2023 at 05:48:22PM -0400, Demi Marie Obenour wrote:
> +	if (diskseq) {
> +		struct gendisk *disk = bdev->bd_disk;
> +
> +		if (unlikely(disk == NULL)) {
> +			pr_err("%s: device %08x has no gendisk\n",
> +			       __func__, vbd->pdevice);
> +			xen_vbd_free(vbd);
> +			return -EFAULT;
> +		}

bdev->bd_disk is never NULL.

> +	diskseq_str = xenbus_read(XBT_NIL, dev->nodename, "diskseq", &diskseq_len);

Please avoid the overly long line.

> +	if (IS_ERR(diskseq_str)) {
> +		int err = PTR_ERR(diskseq_str);
> +		diskseq_str = NULL;
> +
> +		/*
> +		 * If this does not exist, it means legacy userspace that does not

.. even more so in comments.

> +		 * support diskseq.
> +		 */
> +		if (unlikely(!XENBUS_EXIST_ERR(err))) {
> +			xenbus_dev_fatal(dev, err, "reading diskseq");
> +			return;
> +		}
> +		diskseq = 0;
> +	} else if (diskseq_len <= 0) {
> +		xenbus_dev_fatal(dev, -EFAULT, "diskseq must not be empty");
> +		goto fail;
> +	} else if (diskseq_len > 16) {

No need for a else after a return.

> +		xenbus_dev_fatal(dev, -ERANGE, "diskseq too long: got %d but limit is 16",
> +				 diskseq_len);
> +		goto fail;
> +	} else if (diskseq_str[0] == '0') {
> +		xenbus_dev_fatal(dev, -ERANGE, "diskseq must not start with '0'");
> +		goto fail;
> +	} else {
> +		char *diskseq_end;
> +		diskseq = simple_strtoull(diskseq_str, &diskseq_end, 16);
> +		if (diskseq_end != diskseq_str + diskseq_len) {
> +			xenbus_dev_fatal(dev, -EINVAL, "invalid diskseq");
> +			goto fail;
> +		}
> +		kfree(diskseq_str);
> +		diskseq_str = NULL;
> +	}

And I suspect the code will be a lot easier to follow if you move
the diskseq validation into a separate helper.

