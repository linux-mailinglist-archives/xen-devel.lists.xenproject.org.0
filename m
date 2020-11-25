Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EBF62C38F6
	for <lists+xen-devel@lfdr.de>; Wed, 25 Nov 2020 07:10:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.37288.69569 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kho0d-0004II-3l; Wed, 25 Nov 2020 06:10:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 37288.69569; Wed, 25 Nov 2020 06:10:31 +0000
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
	id 1kho0d-0004Ht-0d; Wed, 25 Nov 2020 06:10:31 +0000
Received: by outflank-mailman (input) for mailman id 37288;
 Wed, 25 Nov 2020 06:10:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BRGr=E7=huawei.com=yuchao0@srs-us1.protection.inumbo.net>)
 id 1kho0a-0004Hk-Nm
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 06:10:28 +0000
Received: from szxga06-in.huawei.com (unknown [45.249.212.32])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a6a15f69-22b0-469a-8dd1-466efade4452;
 Wed, 25 Nov 2020 06:10:26 +0000 (UTC)
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4Cgr8c4ZrLzhYVP;
 Wed, 25 Nov 2020 14:10:08 +0800 (CST)
Received: from [10.136.114.67] (10.136.114.67) by smtp.huawei.com
 (10.3.19.209) with Microsoft SMTP Server (TLS) id 14.3.487.0; Wed, 25 Nov
 2020 14:10:21 +0800
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=BRGr=E7=huawei.com=yuchao0@srs-us1.protection.inumbo.net>)
	id 1kho0a-0004Hk-Nm
	for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 06:10:28 +0000
X-Inumbo-ID: a6a15f69-22b0-469a-8dd1-466efade4452
Received: from szxga06-in.huawei.com (unknown [45.249.212.32])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id a6a15f69-22b0-469a-8dd1-466efade4452;
	Wed, 25 Nov 2020 06:10:26 +0000 (UTC)
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.59])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4Cgr8c4ZrLzhYVP;
	Wed, 25 Nov 2020 14:10:08 +0800 (CST)
Received: from [10.136.114.67] (10.136.114.67) by smtp.huawei.com
 (10.3.19.209) with Microsoft SMTP Server (TLS) id 14.3.487.0; Wed, 25 Nov
 2020 14:10:21 +0800
Subject: Re: [PATCH 30/45] block: remove the nr_sects field in struct
 hd_struct
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
CC: Tejun Heo <tj@kernel.org>, Josef Bacik <josef@toxicpanda.com>, "Konrad
 Rzeszutek Wilk" <konrad.wilk@oracle.com>, Coly Li <colyli@suse.de>, "Mike
 Snitzer" <snitzer@redhat.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Jan Kara <jack@suse.cz>, Johannes Thumshirn
	<johannes.thumshirn@wdc.com>, <dm-devel@redhat.com>, Richard Weinberger
	<richard@nod.at>, Jan Kara <jack@suse.com>, <linux-block@vger.kernel.org>,
	<xen-devel@lists.xenproject.org>, <linux-bcache@vger.kernel.org>,
	<linux-mtd@lists.infradead.org>, <linux-fsdevel@vger.kernel.org>,
	<linux-mm@kvack.org>
References: <20201124132751.3747337-1-hch@lst.de>
 <20201124132751.3747337-31-hch@lst.de>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <fe5b2763-a7c7-98dd-d87e-d3fa6767eebb@huawei.com>
Date: Wed, 25 Nov 2020 14:10:20 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20201124132751.3747337-31-hch@lst.de>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.136.114.67]
X-CFilter-Loop: Reflected

On 2020/11/24 21:27, Christoph Hellwig wrote:
> Now that the hd_struct always has a block device attached to it, there is
> no need for having two size field that just get out of sync.
> 
> Additional the field in hd_struct did not use proper serializiation,
> possibly allowing for torn writes.  By only using the block_device field
> this problem also gets fixed.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
>   block/bio.c                        |  4 +-
>   block/blk-core.c                   |  2 +-
>   block/blk.h                        | 53 ----------------------
>   block/genhd.c                      | 55 +++++++++++-----------
>   block/partitions/core.c            | 17 ++++---
>   drivers/block/loop.c               |  1 -
>   drivers/block/nbd.c                |  2 +-
>   drivers/block/xen-blkback/common.h |  4 +-
>   drivers/md/bcache/super.c          |  2 +-
>   drivers/s390/block/dasd_ioctl.c    |  4 +-
>   drivers/target/target_core_pscsi.c |  7 +--
>   fs/block_dev.c                     | 73 +-----------------------------
>   fs/f2fs/super.c                    |  2 +-

For f2fs part,

Acked-by: Chao Yu <yuchao0@huawei.com>

Thanks,

>   fs/pstore/blk.c                    |  2 +-
>   include/linux/genhd.h              | 29 +++---------
>   kernel/trace/blktrace.c            |  2 +-
>   16 files changed, 60 insertions(+), 199 deletions(-)

