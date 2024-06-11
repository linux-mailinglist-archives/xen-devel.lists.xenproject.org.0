Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF059035CF
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2024 10:21:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.738108.1144735 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGwkl-0004nd-J8; Tue, 11 Jun 2024 08:21:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 738108.1144735; Tue, 11 Jun 2024 08:21:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGwkl-0004kt-G1; Tue, 11 Jun 2024 08:21:15 +0000
Received: by outflank-mailman (input) for mailman id 738108;
 Tue, 11 Jun 2024 08:21:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7xGt=NN=kernel.org=dlemoal@srs-se1.protection.inumbo.net>)
 id 1sGwkk-0004OI-DM
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2024 08:21:14 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9093f3c9-27cb-11ef-90a3-e314d9c70b13;
 Tue, 11 Jun 2024 10:21:13 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9FE0660C54;
 Tue, 11 Jun 2024 08:21:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC86FC2BD10;
 Tue, 11 Jun 2024 08:21:07 +0000 (UTC)
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
X-Inumbo-ID: 9093f3c9-27cb-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718094072;
	bh=JnxwCboQk8q7RlLZlW4EySiyxLKgUjk778Traf3fmoA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=T4lYpc9oPKzbZgXNScRXj6fCCJuF2imMpVDO2TmKoprDVoEMAifMh8yJGso4Vfp5y
	 OgmplPRZ+vOoc/3W5Z2/vvUR59B9dvvmiJ3TXlfZjt80a4a+B616vcQsbnQtB8TQlx
	 hCCsxl7ULUCU4AFz7+jEuDHX9a+L+WI83HnZLceoWGeScqnvdznMEcmPFZA+cvHULW
	 tsWbQ1wsp08S3pZw6QSDKAzAlfLw76qcbODE/Rb62WAcCaMIMds4nLrdbgO640++hO
	 MSBTvFYh9It5CVDUDafarknsby40aO62VVd0BASXyBUwrOv7fDEDdarOIcY3IX1DTf
	 +T3qkIPPHiYZg==
Message-ID: <d1775d3f-daaa-4193-9f68-06ec47563b35@kernel.org>
Date: Tue, 11 Jun 2024 17:21:07 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 21/26] block: move the poll flag to queue_limits
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
 <20240611051929.513387-22-hch@lst.de>
Content-Language: en-US
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <20240611051929.513387-22-hch@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/11/24 2:19 PM, Christoph Hellwig wrote:
> Move the poll flag into the queue_limits feature field so that it
> can be set atomically and all I/O is frozen when changing the flag.
> 
> Stacking drivers are simplified in that they now can simply set the
> flag, and blk_stack_limits will clear it when the features is not
> supported by any of the underlying devices.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Kind of the same remark as for io_stat about this not really being a device
feature. But I guess seeing "features" as a queue feature rather than just a
device feature makes it OK to have poll (and io_stat) as a feature rather than
a flag.

So:

Reviewed-by: Damien Le Moal <dlemoal@kernel.org>

-- 
Damien Le Moal
Western Digital Research


