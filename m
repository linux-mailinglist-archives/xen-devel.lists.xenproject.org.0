Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D38781075B
	for <lists+xen-devel@lfdr.de>; Wed, 13 Dec 2023 02:10:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.653683.1020118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDDke-0000CB-AK; Wed, 13 Dec 2023 01:09:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 653683.1020118; Wed, 13 Dec 2023 01:09:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDDke-00007j-71; Wed, 13 Dec 2023 01:09:28 +0000
Received: by outflank-mailman (input) for mailman id 653683;
 Wed, 13 Dec 2023 01:09:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8FWX=HY=huaweicloud.com=yukuai1@srs-se1.protection.inumbo.net>)
 id 1rDDkc-0008VR-D0
 for xen-devel@lists.xenproject.org; Wed, 13 Dec 2023 01:09:26 +0000
Received: from dggsgout11.his.huawei.com (unknown [45.249.212.51])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3e649cb0-9954-11ee-9b0f-b553b5be7939;
 Wed, 13 Dec 2023 02:09:22 +0100 (CET)
Received: from mail.maildlp.com (unknown [172.19.163.216])
 by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4Sqcnm0qcBz4f3jZ0
 for <xen-devel@lists.xenproject.org>; Wed, 13 Dec 2023 09:09:16 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
 by mail.maildlp.com (Postfix) with ESMTP id 54B1D1A093E
 for <xen-devel@lists.xenproject.org>; Wed, 13 Dec 2023 09:09:17 +0800 (CST)
Received: from [10.174.176.73] (unknown [10.174.176.73])
 by APP1 (Coremail) with SMTP id cCh0CgBntQs5BHllRkz5DQ--.6696S3;
 Wed, 13 Dec 2023 09:09:16 +0800 (CST)
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
X-Inumbo-ID: 3e649cb0-9954-11ee-9b0f-b553b5be7939
Subject: Re: [PATCH RFC v2 for-6.8/block 01/18] block: add some bdev apis
To: Christoph Hellwig <hch@infradead.org>, Yu Kuai <yukuai1@huaweicloud.com>
Cc: axboe@kernel.dk, roger.pau@citrix.com, colyli@suse.de,
 kent.overstreet@gmail.com, joern@lazybastard.org, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, sth@linux.ibm.com, hoeppner@linux.ibm.com,
 hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com,
 jejb@linux.ibm.com, martin.petersen@oracle.com, clm@fb.com,
 josef@toxicpanda.com, dsterba@suse.com, viro@zeniv.linux.org.uk,
 brauner@kernel.org, nico@fluxnic.net, xiang@kernel.org, chao@kernel.org,
 tytso@mit.edu, adilger.kernel@dilger.ca, agruenba@redhat.com, jack@suse.com,
 konishi.ryusuke@gmail.com, willy@infradead.org, akpm@linux-foundation.org,
 p.raghav@samsung.com, hare@suse.de, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-bcache@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-bcachefs@vger.kernel.org, linux-btrfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 linux-ext4@vger.kernel.org, gfs2@lists.linux.dev,
 linux-nilfs@vger.kernel.org, yi.zhang@huawei.com, yangerkun@huawei.com,
 "yukuai (C)" <yukuai3@huawei.com>
References: <20231211140552.973290-1-yukuai1@huaweicloud.com>
 <20231211140552.973290-2-yukuai1@huaweicloud.com>
 <ZXhdRhfr+JoWdhyj@infradead.org>
From: Yu Kuai <yukuai1@huaweicloud.com>
Message-ID: <893e2764-65a6-ef73-5ddf-95cd9f97cb19@huaweicloud.com>
Date: Wed, 13 Dec 2023 09:09:13 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <ZXhdRhfr+JoWdhyj@infradead.org>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:cCh0CgBntQs5BHllRkz5DQ--.6696S3
X-Coremail-Antispam: 1UD129KBjvdXoW7Gw4fJw1rAF1UKF4fJrWDJwb_yoWfurcEqr
	n7Cryv9w1jvws5Wr4UKFy5JrWrJFWYyr43Xay8ta4Iq3s8Xa18Ar92ka48uas8Ww47Z3ZI
	9FsxuFy8uF4fujkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbaxFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
	6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kI
	c2xKxwCYjI0SjxkI62AI1cAE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4
	AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
	17CEb7AF67AKxVWrXVW8Jr1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCw
	CI42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j
	6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYx
	BIdaVFxhVjvjDU0xZFpf9x0JUd8n5UUUUU=
X-CM-SenderInfo: 51xn3trlr6x35dzhxuhorxvhhfrp/

Hi,

�� 2023/12/12 21:16, Christoph Hellwig д��:
>> +void invalidate_bdev_range(struct block_device *bdev, pgoff_t start,
>> +			   pgoff_t end)
>> +{
>> +	invalidate_mapping_pages(bdev->bd_inode->i_mapping, start, end);
>> +}
>> +EXPORT_SYMBOL_GPL(invalidate_bdev_range);
> 
> Can we have kerneldoc comments for the new helpers please?

Of course, will definitely do this in v3.
> 
>> +struct folio *__bdev_get_folio(struct block_device *bdev, loff_t pos,
>> +			       fgf_t fgp_flags, gfp_t gfp)
>> +{
>> +	return __filemap_get_folio(bdev->bd_inode->i_mapping, pos >> PAGE_SHIFT,
>> +				   fgp_flags, gfp);
>> +}
>> +EXPORT_SYMBOL_GPL(__bdev_get_folio);
> 
> It's a bit silly to have a __-prefixed API without a version that
> doesn't have the prefix, so I'd prefer to drop it.  Unless willy has
> a good argument for keeping it the same as the filemap API.

Ok, I'll drop it if willy doesn't against this.

Thanks,
Kuai
> 
> .
> 


