Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BBE480E0D2
	for <lists+xen-devel@lfdr.de>; Tue, 12 Dec 2023 02:26:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.652581.1018495 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCrWj-0003pD-9e; Tue, 12 Dec 2023 01:25:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 652581.1018495; Tue, 12 Dec 2023 01:25:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCrWj-0003mX-71; Tue, 12 Dec 2023 01:25:37 +0000
Received: by outflank-mailman (input) for mailman id 652581;
 Tue, 12 Dec 2023 01:25:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rggv=HX=huaweicloud.com=yukuai1@srs-se1.protection.inumbo.net>)
 id 1rCrWi-0003mR-Ah
 for xen-devel@lists.xenproject.org; Tue, 12 Dec 2023 01:25:36 +0000
Received: from dggsgout11.his.huawei.com (unknown [45.249.212.51])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 56b26fdd-988d-11ee-98e8-6d05b1d4d9a1;
 Tue, 12 Dec 2023 02:25:33 +0100 (CET)
Received: from mail.maildlp.com (unknown [172.19.93.142])
 by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4Sq1Bt71hjz4f3jZT
 for <xen-devel@lists.xenproject.org>; Tue, 12 Dec 2023 09:25:26 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
 by mail.maildlp.com (Postfix) with ESMTP id 2D3711A01C8
 for <xen-devel@lists.xenproject.org>; Tue, 12 Dec 2023 09:25:28 +0800 (CST)
Received: from [10.174.176.73] (unknown [10.174.176.73])
 by APP1 (Coremail) with SMTP id cCh0CgDn6hCEtndlu5ydDQ--.58697S3;
 Tue, 12 Dec 2023 09:25:27 +0800 (CST)
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
X-Inumbo-ID: 56b26fdd-988d-11ee-98e8-6d05b1d4d9a1
Subject: Re: [PATCH RFC v2 for-6.8/block 01/18] block: add some bdev apis
To: Jan Kara <jack@suse.cz>, Yu Kuai <yukuai1@huaweicloud.com>
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
 <20231211165217.fil437byq7w2vcp7@quack3>
From: Yu Kuai <yukuai1@huaweicloud.com>
Message-ID: <7d2bfa29-f93d-def2-80a3-72af063b36b3@huaweicloud.com>
Date: Tue, 12 Dec 2023 09:25:24 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20231211165217.fil437byq7w2vcp7@quack3>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:cCh0CgDn6hCEtndlu5ydDQ--.58697S3
X-Coremail-Antispam: 1UD129KBjvdXoW7JF4fJw47CF1rCry7Ww4DJwb_yoWfGrc_ZF
	nakrWkWw1fJa18Kr4qyFs0vr1kWayrWr42vry8tanrX3yrXa92kFsrKr1Fkr45G3yqkrnx
	uFn2gFyxJr10qjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
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

�� 2023/12/12 0:52, Jan Kara д��:
> On Mon 11-12-23 22:05:35, Yu Kuai wrote:
>> From: Yu Kuai <yukuai3@huawei.com>
>>
>> Those apis will be used for other modules, so that bd_inode won't be
>> accessed directly from other modules.
>>
>> Signed-off-by: Yu Kuai <yukuai3@huawei.com>
> 
> ...
> 
>> +void bdev_associated_mapping(struct block_device *bdev,
>> +			     struct address_space *mapping)
>> +{
>> +	mapping->host = bdev->bd_inode;
>> +}
> 
> Here I'm not sure - is the helper really a win? It seems a bit obscure to
> me. This initialization of another mapping for a bdev looks really special.

Yes, I don't like this helper at all, but gfs2 is used this way, and I
need this helper to remove 'bd_inode' from block_devcie later. I'm not
familiar with gfs2 at all but perhaps it worth to dig deeper and figure
out a proper way for gfs2.

Thanks,
Kuai
> 
> 								Honza
> 


