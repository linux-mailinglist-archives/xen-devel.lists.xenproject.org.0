Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6486D807EE9
	for <lists+xen-devel@lfdr.de>; Thu,  7 Dec 2023 03:45:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649530.1014128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rB4OH-0006Hp-AD; Thu, 07 Dec 2023 02:45:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649530.1014128; Thu, 07 Dec 2023 02:45:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rB4OH-0006Fd-7X; Thu, 07 Dec 2023 02:45:29 +0000
Received: by outflank-mailman (input) for mailman id 649530;
 Thu, 07 Dec 2023 02:45:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=siPQ=HS=huaweicloud.com=yukuai1@srs-se1.protection.inumbo.net>)
 id 1rB4OF-0006FX-GJ
 for xen-devel@lists.xenproject.org; Thu, 07 Dec 2023 02:45:27 +0000
Received: from dggsgout12.his.huawei.com (unknown [45.249.212.56])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a95b4707-94aa-11ee-98e6-6d05b1d4d9a1;
 Thu, 07 Dec 2023 03:45:23 +0100 (CET)
Received: from mail.maildlp.com (unknown [172.19.93.142])
 by dggsgout12.his.huawei.com (SkyGuard) with ESMTP id 4SlzCG5yj0z4f3jXS
 for <xen-devel@lists.xenproject.org>; Thu,  7 Dec 2023 10:45:14 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
 by mail.maildlp.com (Postfix) with ESMTP id 19F081A0904
 for <xen-devel@lists.xenproject.org>; Thu,  7 Dec 2023 10:45:17 +0800 (CST)
Received: from [10.174.176.73] (unknown [10.174.176.73])
 by APP1 (Coremail) with SMTP id cCh0CgCnqxG5MXFllH3QCw--.13955S3;
 Thu, 07 Dec 2023 10:45:16 +0800 (CST)
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
X-Inumbo-ID: a95b4707-94aa-11ee-98e6-6d05b1d4d9a1
Subject: Re: [PATCH -next RFC 01/14] block: add some bdev apis
To: Matthew Wilcox <willy@infradead.org>, Yu Kuai <yukuai1@huaweicloud.com>
Cc: axboe@kernel.dk, roger.pau@citrix.com, colyli@suse.de,
 kent.overstreet@gmail.com, joern@lazybastard.org, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, sth@linux.ibm.com, hoeppner@linux.ibm.com,
 hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com,
 jejb@linux.ibm.com, martin.petersen@oracle.com, clm@fb.com,
 josef@toxicpanda.com, dsterba@suse.com, nico@fluxnic.net, xiang@kernel.org,
 chao@kernel.org, tytso@mit.edu, adilger.kernel@dilger.ca,
 agruenba@redhat.com, jack@suse.com, konishi.ryusuke@gmail.com,
 akpm@linux-foundation.org, hare@suse.de, p.raghav@samsung.com,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-bcache@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-bcachefs@vger.kernel.org,
 linux-btrfs@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 linux-ext4@vger.kernel.org, gfs2@lists.linux.dev,
 linux-nilfs@vger.kernel.org, yi.zhang@huawei.com, yangerkun@huawei.com,
 "yukuai (C)" <yukuai3@huawei.com>
References: <20231205123728.1866699-1-yukuai1@huaweicloud.com>
 <20231205123728.1866699-2-yukuai1@huaweicloud.com>
 <ZXCMJ9skAAgPm4z3@casper.infradead.org>
From: Yu Kuai <yukuai1@huaweicloud.com>
Message-ID: <d195aba8-7b89-698f-b7a0-06b87ae01c21@huaweicloud.com>
Date: Thu, 7 Dec 2023 10:45:13 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <ZXCMJ9skAAgPm4z3@casper.infradead.org>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:cCh0CgCnqxG5MXFllH3QCw--.13955S3
X-Coremail-Antispam: 1UD129KBjvJXoWxuF4Dury5Kr13Aw47Gr4Uurg_yoW5Ar4DpF
	W8KFZ8JrW8Gr18ursrJa15Z3WFg34UJFW5ZrWxG343C3s0yr9akFWYgws0kayIv3yUJFs7
	ZFWjvrW8WF1j9FJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
	4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWrJr0_
	WFyUJwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJb
	IYCTnIWIevJa73UjIFyTuYvjfUojjgUUUUU
X-CM-SenderInfo: 51xn3trlr6x35dzhxuhorxvhhfrp/

Hi,

�� 2023/12/06 22:58, Matthew Wilcox д��:
> On Tue, Dec 05, 2023 at 08:37:15PM +0800, Yu Kuai wrote:
>> +struct folio *bdev_read_folio(struct block_device *bdev, pgoff_t index)
>> +{
>> +	return read_mapping_folio(bdev->bd_inode->i_mapping, index, NULL);
>> +}
>> +EXPORT_SYMBOL_GPL(bdev_read_folio);
> 
> I'm coming to the opinion that 'index' is the wrong parameter here.
> Looking through all the callers of bdev_read_folio() in this patchset,
> they all have a position in bytes, and they all convert it to
> index for this call.  The API should probably be:
> 
> struct folio *bdev_read_folio(struct block_device *bdev, loff_t pos)
> {
> 	return read_mapping_folio(bdev->bd_inode->i_mapping,
> 			pos / PAGE_SIZE, NULL);
> }

Thanks for reviewing this patchset! Okay, I'll convert to pass in "pos"
in v2.
> 
> ... and at some point, we'll get round to converting read_mapping_folio()
> to take its argument in loff_t.
> 
> Similiarly for these two APIs:
> 
>> +struct folio *bdev_read_folio_gfp(struct block_device *bdev, pgoff_t index,
>> +				  gfp_t gfp)
>> +struct folio *bdev_get_folio(struct block_device *bdev, pgoff_t index)
> 
>> +struct folio *bdev_find_or_create_folio(struct block_device *bdev,
>> +					pgoff_t index, gfp_t gfp)
>> +{
>> +	return __filemap_get_folio(bdev->bd_inode->i_mapping, index,
>> +				   FGP_LOCK | FGP_ACCESSED | FGP_CREAT, gfp);
>> +}
>> +EXPORT_SYMBOL_GPL(bdev_find_or_create_folio);
> 
> This one probably shouldn't exist.  I've been converting callers of
> find_or_create_page() to call __filemap_get_folio; I suspect we
> should expose a __bdev_get_folio and have the callers use the FGP
> arguments directly, but I'm open to other opinions here.

If nobody against this, I will expose single __bdev_get_folio() to use
in v2.
> 
>> +void bdev_sync_readahead(struct block_device *bdev, struct file_ra_state *ra,
>> +			 struct file *file, pgoff_t index,
>> +			 unsigned long req_count)
>> +{
>> +	struct file_ra_state tmp_ra = {};
>> +
>> +	if (!ra) {
>> +		ra = &tmp_ra;
>> +		file_ra_state_init(ra, bdev->bd_inode->i_mapping);
>> +	}
>> +	page_cache_sync_readahead(bdev->bd_inode->i_mapping, ra, file, index,
>> +				  req_count);
>> +}
> 
> I think the caller should always be passing in a valid file_ra_state.
> It's only cramfs that doesn't have one, and it really should!
> Not entirely sure about the arguments here; part of me says "bytes",
> but this is weird enough to maybe take arguments in pages.

In fact, bdev_sync_readahead() is only called for cramfs and ext4.

For ext4 it's used in ext4_readdir() so there is valid file_ra_state.

Hoever, for cramfs it's used in cramfs_read(), and cramfs_read() is used
for:

1) cramfs_read_folio
2) cramfs_readdir
3) cramfs_lookup
4) cramfs_read_super

Looks like it's easy to pass in valid file_ra_state() for 1) and 2),
however, I don't see an easy way to do this for 3) and 4).

Thanks,
Kuai

> 
> .
> 


