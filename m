Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E0A67FA055
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 14:07:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642071.1001175 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7bKq-0005cj-CQ; Mon, 27 Nov 2023 13:07:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642071.1001175; Mon, 27 Nov 2023 13:07:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7bKq-0005Zb-9T; Mon, 27 Nov 2023 13:07:36 +0000
Received: by outflank-mailman (input) for mailman id 642071;
 Mon, 27 Nov 2023 13:07:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f6Ye=HI=huaweicloud.com=yukuai1@srs-se1.protection.inumbo.net>)
 id 1r7bKp-0005ZV-4X
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 13:07:35 +0000
Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com
 [45.249.212.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eb211ad3-8d25-11ee-98e2-6d05b1d4d9a1;
 Mon, 27 Nov 2023 14:07:32 +0100 (CET)
Received: from mail.maildlp.com (unknown [172.19.163.216])
 by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4Sf5Tl37q5z4f3jHj
 for <xen-devel@lists.xenproject.org>; Mon, 27 Nov 2023 21:07:23 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
 by mail.maildlp.com (Postfix) with ESMTP id 43A0F1A0A64
 for <xen-devel@lists.xenproject.org>; Mon, 27 Nov 2023 21:07:26 +0800 (CST)
Received: from [10.174.176.73] (unknown [10.174.176.73])
 by APP1 (Coremail) with SMTP id cCh0CgDX2hCKlGRldTJXCA--.14854S3;
 Mon, 27 Nov 2023 21:07:25 +0800 (CST)
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
X-Inumbo-ID: eb211ad3-8d25-11ee-98e2-6d05b1d4d9a1
Subject: Re: [PATCH block/for-next v2 01/16] block: add a new helper to get
 inode from block_device
To: Christoph Hellwig <hch@infradead.org>, Yu Kuai <yukuai1@huaweicloud.com>
Cc: ming.lei@redhat.com, axboe@kernel.dk, roger.pau@citrix.com,
 colyli@suse.de, kent.overstreet@gmail.com, joern@lazybastard.org,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 sth@linux.ibm.com, hoeppner@linux.ibm.com, hca@linux.ibm.com,
 gor@linux.ibm.com, agordeev@linux.ibm.com, jejb@linux.ibm.com,
 martin.petersen@oracle.com, clm@fb.com, josef@toxicpanda.com,
 dsterba@suse.com, viro@zeniv.linux.org.uk, brauner@kernel.org,
 nico@fluxnic.net, xiang@kernel.org, chao@kernel.org, tytso@mit.edu,
 adilger.kernel@dilger.ca, agruenba@redhat.com, jack@suse.com,
 konishi.ryusuke@gmail.com, dchinner@redhat.com, linux@weissschuh.net,
 min15.li@samsung.com, dlemoal@kernel.org, willy@infradead.org,
 akpm@linux-foundation.org, hare@suse.de, p.raghav@samsung.com,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-bcache@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-bcachefs@vger.kernel.org,
 linux-btrfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, linux-ext4@vger.kernel.org,
 gfs2@lists.linux.dev, linux-nilfs@vger.kernel.org, yi.zhang@huawei.com,
 yangerkun@huawei.com, "yukuai (C)" <yukuai3@huawei.com>
References: <20231127062116.2355129-1-yukuai1@huaweicloud.com>
 <20231127062116.2355129-2-yukuai1@huaweicloud.com>
 <ZWRDeQ4K8BiYnV+X@infradead.org>
From: Yu Kuai <yukuai1@huaweicloud.com>
Message-ID: <6acdeece-7163-3219-95e2-827e54eadd0c@huaweicloud.com>
Date: Mon, 27 Nov 2023 21:07:22 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <ZWRDeQ4K8BiYnV+X@infradead.org>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:cCh0CgDX2hCKlGRldTJXCA--.14854S3
X-Coremail-Antispam: 1UD129KBjvJXoW7KF1fWFWkJw1kuFy8XF43KFg_yoW8KrWDp3
	y7KFn8tw1DJryFgan7tw1jqrn0g3W7GrWUZ34rZrsxurZ8WFy2qF10krsrXFyIyr48Jw4I
	qF45AF43Xry2grJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9214x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka
	0xkIwI1lc7I2V7IY0VAS07AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7x
	kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
	67AF67kF1VAFwI0_Wrv_Gr1UMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF
	4lIxAIcVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_WFyU
	JVCq3wCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26rxl6s0DYx
	BIdaVFxhVjvjDU0xZFpf9x0JUd8n5UUUUU=
X-CM-SenderInfo: 51xn3trlr6x35dzhxuhorxvhhfrp/

Hi,

�� 2023/11/27 15:21, Christoph Hellwig д��:
> On Mon, Nov 27, 2023 at 02:21:01PM +0800, Yu Kuai wrote:
>> From: Yu Kuai <yukuai3@huawei.com>
>>
>> block_devcie is allocated from bdev_alloc() by bdev_alloc_inode(), and
>> currently block_device contains a pointer that point to the address of
>> inode, while such inode is allocated together:
> 
> This is going the wrong way.  Nothing outside of core block layer code
> should ever directly use the bdev inode.  We've been rather sloppy
> and added a lot of direct reference to it, but they really need to
> go away and be replaced with well defined high level operation on
> struct block_device.  Once that is done we can remove the bd_inode
> pointer, but replacing it with something that pokes even more deeply
> into bdev internals is a bad idea.

Thanks for the advice, however, after collecting how other modules are
using bdev inode, I got two main questions:

1) Is't okay to add a new helper to pass in bdev for following apis?
If so, then almost all the fs and driver can avoid to access bd_inode
dirctly.

errseq_check(&bdev->bd_inode->i_mapping->wb_err, wb_err);
errseq_check_and_advance(&bdev->bd_inode->i_mapping->wb_err, &wb_err);
mapping_gfp_constraint(bdev->bd_inode->i_mapping, gfp);
i_size_read(bdev->bd_inode)
find_get_page(bdev->bd_inode->i_mapping, offset);
find_or_create_page(bdev->bd_inode->i_mapping, index, gfp);
read_cache_page_gfp(bdev->bd_inode->i_mapping, index, gfp);
invalidate_inode_pages2(bdev->bd_inode->i_mapping);
invalidate_inode_pages2_range(bdev->bd_inode->i_mapping, start, end);
read_mapping_folio(bdev->bd_inode->i_mapping, index, file);
read_mapping_page(bdev->bd_inode->i_mapping, index, file);
balance_dirty_pages_ratelimited(bdev->bd_inode->i_mapping)
file_ra_state_init(ra, bdev->bd_inode->i_mapping);
page_cache_sync_readahead(bdev->bd_inode->i_mapping, ra, file, index, 
req_count);
inode_to_bdi(bdev->bd_inode)

2) For the file fs/buffer.c, there are some special usage like
following that I don't think it's good to add a helper:

spin_lock(&bd_inode->i_mapping->private_lock);

Is't okay to move following apis from fs/buffer.c directly to
block/bdev.c?

__find_get_block
bdev_getblk

Thanks,
Kuai

> .
> 


