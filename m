Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB482C38F3
	for <lists+xen-devel@lfdr.de>; Wed, 25 Nov 2020 07:09:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.37281.69557 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khnyz-0003W8-Na; Wed, 25 Nov 2020 06:08:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 37281.69557; Wed, 25 Nov 2020 06:08:49 +0000
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
	id 1khnyz-0003Vj-KL; Wed, 25 Nov 2020 06:08:49 +0000
Received: by outflank-mailman (input) for mailman id 37281;
 Wed, 25 Nov 2020 06:08:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BRGr=E7=huawei.com=yuchao0@srs-us1.protection.inumbo.net>)
 id 1khnyJ-0003T3-DC
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 06:08:07 +0000
Received: from szxga06-in.huawei.com (unknown [45.249.212.32])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4f30ffd3-5820-4535-afad-a436ca0be133;
 Wed, 25 Nov 2020 06:07:59 +0000 (UTC)
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4Cgr5m3R7Vzhh8Q;
 Wed, 25 Nov 2020 14:07:40 +0800 (CST)
Received: from [10.136.114.67] (10.136.114.67) by smtp.huawei.com
 (10.3.19.212) with Microsoft SMTP Server (TLS) id 14.3.487.0; Wed, 25 Nov
 2020 14:07:42 +0800
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=BRGr=E7=huawei.com=yuchao0@srs-us1.protection.inumbo.net>)
	id 1khnyJ-0003T3-DC
	for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 06:08:07 +0000
X-Inumbo-ID: 4f30ffd3-5820-4535-afad-a436ca0be133
Received: from szxga06-in.huawei.com (unknown [45.249.212.32])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 4f30ffd3-5820-4535-afad-a436ca0be133;
	Wed, 25 Nov 2020 06:07:59 +0000 (UTC)
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4Cgr5m3R7Vzhh8Q;
	Wed, 25 Nov 2020 14:07:40 +0800 (CST)
Received: from [10.136.114.67] (10.136.114.67) by smtp.huawei.com
 (10.3.19.212) with Microsoft SMTP Server (TLS) id 14.3.487.0; Wed, 25 Nov
 2020 14:07:42 +0800
Subject: Re: [PATCH 04/45] fs: simplify freeze_bdev/thaw_bdev
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
 <20201124132751.3747337-5-hch@lst.de>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <4ae2d8ca-e858-e5df-67ef-d14852978976@huawei.com>
Date: Wed, 25 Nov 2020 14:07:41 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20201124132751.3747337-5-hch@lst.de>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.136.114.67]
X-CFilter-Loop: Reflected

On 2020/11/24 21:27, Christoph Hellwig wrote:
> Store the frozen superblock in struct block_device to avoid the awkward
> interface that can return a sb only used a cookie, an ERR_PTR or NULL.
> 
> Signed-off-by: Christoph Hellwig<hch@lst.de>
> ---
>   drivers/md/dm-core.h      |  5 -----
>   drivers/md/dm.c           | 20 ++++++--------------
>   fs/block_dev.c            | 39 ++++++++++++++++-----------------------
>   fs/buffer.c               |  2 +-
>   fs/ext4/ioctl.c           |  2 +-
>   fs/f2fs/file.c            | 14 +++++---------

For f2fs part,

Acked-by: Chao Yu <yuchao0@huawei.com>

Thanks,

>   fs/xfs/xfs_fsops.c        |  7 ++-----
>   include/linux/blk_types.h |  1 +
>   include/linux/blkdev.h    |  4 ++--
>   9 files changed, 34 insertions(+), 60 deletions(-)

