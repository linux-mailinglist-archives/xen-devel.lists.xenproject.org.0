Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F7B8067D6
	for <lists+xen-devel@lfdr.de>; Wed,  6 Dec 2023 07:56:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.648907.1012965 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAlpR-0002FE-TY; Wed, 06 Dec 2023 06:56:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 648907.1012965; Wed, 06 Dec 2023 06:56:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAlpR-0002CO-Qr; Wed, 06 Dec 2023 06:56:17 +0000
Received: by outflank-mailman (input) for mailman id 648907;
 Wed, 06 Dec 2023 06:56:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8sBq=HR=huaweicloud.com=yukuai1@srs-se1.protection.inumbo.net>)
 id 1rAlpQ-0002CI-7M
 for xen-devel@lists.xenproject.org; Wed, 06 Dec 2023 06:56:16 +0000
Received: from dggsgout11.his.huawei.com (unknown [45.249.212.51])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 89a02b55-9404-11ee-98e5-6d05b1d4d9a1;
 Wed, 06 Dec 2023 07:56:13 +0100 (CET)
Received: from mail.maildlp.com (unknown [172.19.163.235])
 by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4SlSqB4ff0z4f3kKP
 for <xen-devel@lists.xenproject.org>; Wed,  6 Dec 2023 14:56:06 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
 by mail.maildlp.com (Postfix) with ESMTP id B01611A0D02
 for <xen-devel@lists.xenproject.org>; Wed,  6 Dec 2023 14:56:07 +0800 (CST)
Received: from [10.174.176.73] (unknown [10.174.176.73])
 by APP1 (Coremail) with SMTP id cCh0CgA3iA4FG3Bl+7GDCw--.10511S3;
 Wed, 06 Dec 2023 14:56:07 +0800 (CST)
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
X-Inumbo-ID: 89a02b55-9404-11ee-98e5-6d05b1d4d9a1
Subject: Re: [PATCH -next RFC 02/14] xen/blkback: use bdev api in
 xen_update_blkif_status()
To: Christoph Hellwig <hch@infradead.org>, Yu Kuai <yukuai1@huaweicloud.com>
Cc: axboe@kernel.dk, roger.pau@citrix.com, colyli@suse.de,
 kent.overstreet@gmail.com, joern@lazybastard.org, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, sth@linux.ibm.com, hoeppner@linux.ibm.com,
 hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com,
 jejb@linux.ibm.com, martin.petersen@oracle.com, clm@fb.com,
 josef@toxicpanda.com, dsterba@suse.com, nico@fluxnic.net, xiang@kernel.org,
 chao@kernel.org, tytso@mit.edu, adilger.kernel@dilger.ca,
 agruenba@redhat.com, jack@suse.com, konishi.ryusuke@gmail.com,
 willy@infradead.org, akpm@linux-foundation.org, hare@suse.de,
 p.raghav@samsung.com, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-bcache@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-bcachefs@vger.kernel.org, linux-btrfs@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, linux-ext4@vger.kernel.org,
 gfs2@lists.linux.dev, linux-nilfs@vger.kernel.org, yi.zhang@huawei.com,
 yangerkun@huawei.com, "yukuai (C)" <yukuai3@huawei.com>
References: <20231205123728.1866699-1-yukuai1@huaweicloud.com>
 <20231205123728.1866699-3-yukuai1@huaweicloud.com>
 <ZXAMwBD8pd48qwX/@infradead.org>
From: Yu Kuai <yukuai1@huaweicloud.com>
Message-ID: <783b5515-db42-c77f-62ab-050f7cc8ef5e@huaweicloud.com>
Date: Wed, 6 Dec 2023 14:56:05 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <ZXAMwBD8pd48qwX/@infradead.org>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:cCh0CgA3iA4FG3Bl+7GDCw--.10511S3
X-Coremail-Antispam: 1UD129KBjvdXoW7JryDJrWDur4DGrWUZr1DZFb_yoWkGFX_Wr
	4UCrWqqr1kursYka9F9FsYy34qkFy8ZryruayIqFZIg34UWay2vrW7Xrn5CF43WayUKan0
	kF45Aa47trWrKjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbaAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
	6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kI
	c2xKxwCYjI0SjxkI62AI1cAE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4
	AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
	17CEb7AF67AKxVWrXVW8Jr1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCw
	CI42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWrJr0_
	WFyUJwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJr
	UvcSsGvfC2KfnxnUUI43ZEXa7VU1VOJ5UUUUU==
X-CM-SenderInfo: 51xn3trlr6x35dzhxuhorxvhhfrp/

Hi,

�� 2023/12/06 13:55, Christoph Hellwig д��:
> On Tue, Dec 05, 2023 at 08:37:16PM +0800, Yu Kuai wrote:
>> diff --git a/drivers/block/xen-blkback/xenbus.c b/drivers/block/xen-blkback/xenbus.c
>> index e34219ea2b05..e645afa4af57 100644
>> --- a/drivers/block/xen-blkback/xenbus.c
>> +++ b/drivers/block/xen-blkback/xenbus.c
>> @@ -104,8 +104,7 @@ static void xen_update_blkif_status(struct xen_blkif *blkif)
>>   		xenbus_dev_error(blkif->be->dev, err, "block flush");
>>   		return;
>>   	}
>> -	invalidate_inode_pages2(
>> -			blkif->vbd.bdev_handle->bdev->bd_inode->i_mapping);
>> +	invalidate_bdev(blkif->vbd.bdev_handle->bdev);
> 
> blkbak is a bdev exported.   I don't think it should ever call
> invalidate_inode_pages2, through a wrapper or not.

I'm not sure about this. I'm not familiar with xen/blkback, but I saw
that xen-blkback will open a bdev from xen_vbd_create(), hence this
looks like a dm/md for me, hence it sounds reasonable to sync +
invalidate the opened bdev while initialization. Please kindly correct
me if I'm wrong.

Thanks,
Kuai

> 
> .
> 


