Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC6B190B237
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2024 16:35:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.742376.1149170 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJDRw-0004RG-V3; Mon, 17 Jun 2024 14:35:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 742376.1149170; Mon, 17 Jun 2024 14:35:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJDRw-0004PP-SM; Mon, 17 Jun 2024 14:35:12 +0000
Received: by outflank-mailman (input) for mailman id 742376;
 Mon, 17 Jun 2024 14:35:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=e5mD=NT=kernel.org=kbusch@srs-se1.protection.inumbo.net>)
 id 1sJDRv-0004PJ-Ci
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2024 14:35:11 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cb541614-2cb6-11ef-b4bb-af5377834399;
 Mon, 17 Jun 2024 16:35:09 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7CA6C60F73;
 Mon, 17 Jun 2024 14:35:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7346C2BD10;
 Mon, 17 Jun 2024 14:35:04 +0000 (UTC)
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
X-Inumbo-ID: cb541614-2cb6-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718634907;
	bh=zR4PmzG8eM11uEea9QT6dpcyWJEpQ/sobqtYRuY7p2o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eD5n/nvWPH0mROLi1mYqjLG+6CkIkCxCEDr7KHYv5mCJ6cJ3axvL3iUR8FSfF/NAJ
	 aWF+hMFp26+MYq12L40CvD0LxAzWJTFIpFvJFlT/13JJ1EJCWWsc/XXuMYInx3fYPk
	 PVqFFZp9qinzyqQ1wbJp1uQUpFSEgZjA7/AJ/D87BnMG71EbVAfG4CFQOyKDe6kjS2
	 0qjhzv59DCAwJqh60nhssiSotn3a1GiLXJljndQUFTrzdMkRj7pO46aG6KaDjyXOpw
	 MXJnwDrZxtrM68cj9z93ToW3XbCMjuJFfQuHw/qbhAPx1AOR5+hjUoIbpzcdxhC3Vq
	 UbiPTmWDLBjCA==
Date: Mon, 17 Jun 2024 08:35:02 -0600
From: Keith Busch <kbusch@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Geert Uytterhoeven <geert@linux-m68k.org>,
	Richard Weinberger <richard@nod.at>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	Christoph =?iso-8859-1?Q?B=F6hmwalder?= <christoph.boehmwalder@linbit.com>,
	Josef Bacik <josef@toxicpanda.com>, Ming Lei <ming.lei@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>,
	Mikulas Patocka <mpatocka@redhat.com>, Song Liu <song@kernel.org>,
	Yu Kuai <yukuai3@huawei.com>,
	Vineeth Vijayan <vneethv@linux.ibm.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	linux-m68k@lists.linux-m68k.org, linux-um@lists.infradead.org,
	drbd-dev@lists.linbit.com, nbd@other.debian.org,
	linuxppc-dev@lists.ozlabs.org, ceph-devel@vger.kernel.org,
	virtualization@lists.linux.dev, xen-devel@lists.xenproject.org,
	linux-bcache@vger.kernel.org, dm-devel@lists.linux.dev,
	linux-raid@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-mtd@lists.infradead.org, nvdimm@lists.linux.dev,
	linux-nvme@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org, linux-block@vger.kernel.org,
	Damien Le Moal <dlemoal@kernel.org>
Subject: Re: [PATCH 26/26] block: move the bounce flag into the features field
Message-ID: <ZnBJlix63Fj_G1px@kbusch-mbp.dhcp.thefacebook.com>
References: <20240617060532.127975-1-hch@lst.de>
 <20240617060532.127975-27-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240617060532.127975-27-hch@lst.de>

On Mon, Jun 17, 2024 at 08:04:53AM +0200, Christoph Hellwig wrote:
> @@ -352,7 +355,6 @@ enum blk_bounce {

No more users of "enum blk_bounce" after this, so you can delete that
too.

>  struct queue_limits {
>  	unsigned int		features;
>  	unsigned int		flags;
> -	enum blk_bounce		bounce;

