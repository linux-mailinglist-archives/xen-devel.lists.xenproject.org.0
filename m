Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0DDF7FAFA2
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 02:36:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642691.1002338 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7n1K-0007dX-50; Tue, 28 Nov 2023 01:36:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642691.1002338; Tue, 28 Nov 2023 01:36:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7n1K-0007ck-1X; Tue, 28 Nov 2023 01:36:14 +0000
Received: by outflank-mailman (input) for mailman id 642691;
 Tue, 28 Nov 2023 01:36:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3GcI=HJ=huaweicloud.com=yukuai1@srs-se1.protection.inumbo.net>)
 id 1r7n1I-0007ce-Lr
 for xen-devel@lists.xenproject.org; Tue, 28 Nov 2023 01:36:12 +0000
Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com
 [45.249.212.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7dd318b7-8d8e-11ee-98e3-6d05b1d4d9a1;
 Tue, 28 Nov 2023 02:36:05 +0100 (CET)
Received: from mail.maildlp.com (unknown [172.19.163.216])
 by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4SfQ5T24WRz4f3k5c
 for <xen-devel@lists.xenproject.org>; Tue, 28 Nov 2023 09:35:57 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
 by mail.maildlp.com (Postfix) with ESMTP id 227771A0AA0
 for <xen-devel@lists.xenproject.org>; Tue, 28 Nov 2023 09:36:00 +0800 (CST)
Received: from [10.174.176.73] (unknown [10.174.176.73])
 by APP1 (Coremail) with SMTP id cCh0CgDn6hD8Q2VlfLiHCA--.59632S3;
 Tue, 28 Nov 2023 09:35:59 +0800 (CST)
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
X-Inumbo-ID: 7dd318b7-8d8e-11ee-98e3-6d05b1d4d9a1
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
 <6acdeece-7163-3219-95e2-827e54eadd0c@huaweicloud.com>
 <ZWTErvnMf7HiO1Wj@infradead.org>
From: Yu Kuai <yukuai1@huaweicloud.com>
Message-ID: <bc64da80-e9bd-84cb-f173-876623303131@huaweicloud.com>
Date: Tue, 28 Nov 2023 09:35:56 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <ZWTErvnMf7HiO1Wj@infradead.org>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:cCh0CgDn6hD8Q2VlfLiHCA--.59632S3
X-Coremail-Antispam: 1UD129KBjvJXoW7KF1rGFWkXF1DXFy3WF45ZFb_yoW8Wry7pF
	Wjkan8GF1DAFnrur4kWa1xK3yFy3sFkrW7GFy8CryxA3y5WF9FgFyfKw4UJFyDGr4DJr4q
	qa10vFy3Xa48WaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9I14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
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
	JVCq3wCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJb
	IYCTnIWIevJa73UjIFyTuYvjfUojjgUUUUU
X-CM-SenderInfo: 51xn3trlr6x35dzhxuhorxvhhfrp/

Hi,

ÔÚ 2023/11/28 0:32, Christoph Hellwig Ð´µÀ:
> On Mon, Nov 27, 2023 at 09:07:22PM +0800, Yu Kuai wrote:
>> 1) Is't okay to add a new helper to pass in bdev for following apis?
> 
> 
> For some we already have them (e.g. bdev_nr_bytes to read the bdev)
> size, for some we need to add them.  The big thing that seems to
> stick out is page cache API, and I think that is where we need to
> define maintainable APIs for file systems and others to use the
> block device page cache.  Probably only in folio versions and not
> pages once if we're touching the code anyay

Thanks for the advice! In case I'm understanding correctly, do you mean
that all other fs/drivers that is using pages versions can safely switch
to folio versions now?

By the way, my orginal idea was trying to add a new field 'bd_flags'
in block_devcie, and then add a new bit so that bio_check_ro() will
only warn once for each partition. Now that this patchset will be quite
complex, I'll add a new bool field 'bd_ro_warned' to fix the above
problem first, and then add 'bd_flags' once this patchset is done.

Thanks,
Kuai

> 
>> 2) For the file fs/buffer.c, there are some special usage like
>> following that I don't think it's good to add a helper:
>>
>> spin_lock(&bd_inode->i_mapping->private_lock);
>>
>> Is't okay to move following apis from fs/buffer.c directly to
>> block/bdev.c?
>>
>> __find_get_block
>> bdev_getblk
> 
> I'm not sure moving is a good idea, but we might end up the
> some kind of low-level access from buffer.c, be that special
> helpers, a separate header or something else.  Let's sort out
> the rest of the kernel first.
> 
> .
> 


