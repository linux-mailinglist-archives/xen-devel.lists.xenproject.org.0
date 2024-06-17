Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EFD690A599
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2024 08:25:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.741851.1148520 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJ5ny-0003u3-C7; Mon, 17 Jun 2024 06:25:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 741851.1148520; Mon, 17 Jun 2024 06:25:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJ5ny-0003ry-96; Mon, 17 Jun 2024 06:25:26 +0000
Received: by outflank-mailman (input) for mailman id 741851;
 Mon, 17 Jun 2024 06:25:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sOKI=NT=kernel.org=dlemoal@srs-se1.protection.inumbo.net>)
 id 1sJ5nw-0003rs-VQ
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2024 06:25:24 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 60a7607a-2c72-11ef-90a3-e314d9c70b13;
 Mon, 17 Jun 2024 08:25:24 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3B2916114E;
 Mon, 17 Jun 2024 06:25:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64B3DC2BD10;
 Mon, 17 Jun 2024 06:25:17 +0000 (UTC)
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
X-Inumbo-ID: 60a7607a-2c72-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718605521;
	bh=b4C7oWXm6AiByOywGcEEC3GnqcHjFi/qcKpmuC4GSl4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LEnK17zFqe+hZOSDUj/tOYJPTbrEr/iyN4UNL0SmIILaSKuqTSJ4sjLsh83tbNp98
	 xMaGs3z4bHthSiIVUGgn6p6k1Hp4OFwjqTvBViQ5r26ZmMaTUT3kdJYmUDeoTb8K+4
	 jT0vLs8Spfa7yPWU+yf5YKwUzdEIRo48lJNdqGhIlmZTb6k7761bMjs2rcyd0Hfqhj
	 Vpk+ileeXJ565Q23YPjftwlXpdj9Xgx1bQhDcK36W/6YmID+8NvWJsHJ8cIkaSJCt0
	 a65W2bmG0g0iV3m+rrO4imip0sJi5o8S5QSdLa4VJ1pKGoVgY8bkQ22MoITZxj7f6K
	 IsTYJ2fK4dlcQ==
Message-ID: <dd4ca62c-fc36-4439-a1ad-c55250f8d1a8@kernel.org>
Date: Mon, 17 Jun 2024 15:25:16 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/26] block: move the io_stat flag setting to
 queue_limits
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Richard Weinberger <richard@nod.at>,
 Philipp Reisner <philipp.reisner@linbit.com>,
 Lars Ellenberg <lars.ellenberg@linbit.com>,
 =?UTF-8?Q?Christoph_B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>,
 Josef Bacik <josef@toxicpanda.com>, Ming Lei <ming.lei@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>,
 Mikulas Patocka <mpatocka@redhat.com>, Song Liu <song@kernel.org>,
 Yu Kuai <yukuai3@huawei.com>, Vineeth Vijayan <vneethv@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 linux-m68k@lists.linux-m68k.org, linux-um@lists.infradead.org,
 drbd-dev@lists.linbit.com, nbd@other.debian.org,
 linuxppc-dev@lists.ozlabs.org, ceph-devel@vger.kernel.org,
 virtualization@lists.linux.dev, xen-devel@lists.xenproject.org,
 linux-bcache@vger.kernel.org, dm-devel@lists.linux.dev,
 linux-raid@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-mtd@lists.infradead.org, nvdimm@lists.linux.dev,
 linux-nvme@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-block@vger.kernel.org
References: <20240617060532.127975-1-hch@lst.de>
 <20240617060532.127975-17-hch@lst.de>
From: Damien Le Moal <dlemoal@kernel.org>
Content-Language: en-US
Organization: Western Digital Research
In-Reply-To: <20240617060532.127975-17-hch@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/17/24 15:04, Christoph Hellwig wrote:
> Move the io_stat flag into the queue_limits feature field so that it can
> be set atomically with the queue frozen.
> 
> Simplify md and dm to set the flag unconditionally instead of avoiding
> setting a simple flag for cases where it already is set by other means,
> which is a bit pointless.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Damien Le Moal <dlemoal@kernel.org>

-- 
Damien Le Moal
Western Digital Research


