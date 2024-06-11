Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D0FD9034D8
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2024 10:06:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.738022.1144585 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGwWg-0000So-3j; Tue, 11 Jun 2024 08:06:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 738022.1144585; Tue, 11 Jun 2024 08:06:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGwWg-0000Pw-0g; Tue, 11 Jun 2024 08:06:42 +0000
Received: by outflank-mailman (input) for mailman id 738022;
 Tue, 11 Jun 2024 08:06:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7xGt=NN=kernel.org=dlemoal@srs-se1.protection.inumbo.net>)
 id 1sGwWf-0000Ow-0s
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2024 08:06:41 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 86b65d7b-27c9-11ef-90a3-e314d9c70b13;
 Tue, 11 Jun 2024 10:06:40 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id A0AEDCE193F;
 Tue, 11 Jun 2024 08:06:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59A7BC2BD10;
 Tue, 11 Jun 2024 08:06:30 +0000 (UTC)
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
X-Inumbo-ID: 86b65d7b-27c9-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718093195;
	bh=jCn0oX3HrJ6Qlcw/LuQoAhJRxhLaDvFIki6GqIikVDs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=d/4pmxeJzHoEeQ+g2h36PLWMNipYFVLUgldUlVqiJ/oHVrEeGGWvSVD8Qj0WOLs1h
	 W+bfZgsci1Mj1j7xr+uUvjowbUTryqU8M7niWdxvm06YM2JVc8jmnbjYFRmHHcrBjc
	 35EtrgT1CO5oyRbn/EfIn5kNPHJPwVOwHupvi057HyipWOQnDb4p6IBWsy9PJTe2z7
	 aguwef6PSD/S3jnHhAFsQmA+8/MCfLVtbrqTe0OoYvK6gaKfrbg4IMTS8YbzdTrpnX
	 ruwuQZ89i04k1WQRZE0wdLm48U3gwb4DUnNOpOrrhv3eKIrI6XQd7uuU3njn1J65js
	 90POvgbQ696Tw==
Message-ID: <0f01ed9c-6f85-427c-9690-1551e67e46a9@kernel.org>
Date: Tue, 11 Jun 2024 17:06:29 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/26] block: move the add_random flag to queue_limits
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
References: <20240611051929.513387-1-hch@lst.de>
 <20240611051929.513387-16-hch@lst.de>
Content-Language: en-US
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <20240611051929.513387-16-hch@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/11/24 2:19 PM, Christoph Hellwig wrote:
> Move the add_random flag into the queue_limits feature field so that it
> can be set atomically and all I/O is frozen when changing the flag.

Same remark as the previous patches for the end of this sentence.c

> 
> Note that this also removes code from dm to clear the flag based on
> the underlying devices, which can't be reached as dm devices will
> always start out without the flag set.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Other than that, looks OK to me.

Reviewed-by: Damien Le Moal <dlemoal@kernel.org>

-- 
Damien Le Moal
Western Digital Research


