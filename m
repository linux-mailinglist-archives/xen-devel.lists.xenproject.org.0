Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A8C82419F
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jan 2024 13:23:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.661755.1031455 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLMkG-0002By-Tz; Thu, 04 Jan 2024 12:22:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 661755.1031455; Thu, 04 Jan 2024 12:22:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLMkG-00029N-Qk; Thu, 04 Jan 2024 12:22:44 +0000
Received: by outflank-mailman (input) for mailman id 661755;
 Thu, 04 Jan 2024 12:22:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=riih=IO=huaweicloud.com=yukuai1@srs-se1.protection.inumbo.net>)
 id 1rLMkF-0001Pm-Iz
 for xen-devel@lists.xenproject.org; Thu, 04 Jan 2024 12:22:43 +0000
Received: from dggsgout12.his.huawei.com (unknown [45.249.212.56])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f3d2e302-aafb-11ee-98ef-6d05b1d4d9a1;
 Thu, 04 Jan 2024 13:22:42 +0100 (CET)
Received: from mail.maildlp.com (unknown [172.19.93.142])
 by dggsgout12.his.huawei.com (SkyGuard) with ESMTP id 4T5QhT54zTz4f3jRG
 for <xen-devel@lists.xenproject.org>; Thu,  4 Jan 2024 20:22:33 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
 by mail.maildlp.com (Postfix) with ESMTP id 08D561A02FD
 for <xen-devel@lists.xenproject.org>; Thu,  4 Jan 2024 20:22:37 +0800 (CST)
Received: from [10.174.176.73] (unknown [10.174.176.73])
 by APP1 (Coremail) with SMTP id cCh0CgAXZgwKo5ZlregEFg--.33832S3;
 Thu, 04 Jan 2024 20:22:36 +0800 (CST)
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
X-Inumbo-ID: f3d2e302-aafb-11ee-98ef-6d05b1d4d9a1
Subject: Re: [PATCH RFC v3 for-6.8/block 04/17] mtd: block2mtd: use bdev apis
To: Jan Kara <jack@suse.cz>, Yu Kuai <yukuai1@huaweicloud.com>
Cc: axboe@kernel.dk, roger.pau@citrix.com, colyli@suse.de,
 kent.overstreet@gmail.com, joern@lazybastard.org, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, sth@linux.ibm.com, hoeppner@linux.ibm.com,
 hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com,
 jejb@linux.ibm.com, martin.petersen@oracle.com, clm@fb.com,
 josef@toxicpanda.com, dsterba@suse.com, viro@zeniv.linux.org.uk,
 brauner@kernel.org, nico@fluxnic.net, xiang@kernel.org, chao@kernel.org,
 tytso@mit.edu, adilger.kernel@dilger.ca, jack@suse.com,
 konishi.ryusuke@gmail.com, willy@infradead.org, akpm@linux-foundation.org,
 hare@suse.de, p.raghav@samsung.com, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-bcache@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-bcachefs@vger.kernel.org, linux-btrfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 linux-ext4@vger.kernel.org, linux-nilfs@vger.kernel.org,
 yi.zhang@huawei.com, yangerkun@huawei.com, "yukuai (C)" <yukuai3@huawei.com>
References: <20231221085712.1766333-1-yukuai1@huaweicloud.com>
 <20231221085712.1766333-5-yukuai1@huaweicloud.com>
 <20240104112855.uci45hhqaiitmsir@quack3>
From: Yu Kuai <yukuai1@huaweicloud.com>
Message-ID: <b97810e9-c1bc-9198-c0d2-e132dde3e1f6@huaweicloud.com>
Date: Thu, 4 Jan 2024 20:22:34 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20240104112855.uci45hhqaiitmsir@quack3>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:cCh0CgAXZgwKo5ZlregEFg--.33832S3
X-Coremail-Antispam: 1UD129KBjvJXoW7CFWUCFyfWw48WrW7Wr1ftFb_yoW8JFWUpF
	WIk3Z5Ars0ywnrCrs2q3ZrZF1xKasxXayxJ3W3Gw1rAF15WryfKr1fC34kCw4IkF18ArWv
	9F4jyF1ku3Z8KrDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9214x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka
	0xkIwI1lc7I2V7IY0VAS07AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7x
	kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
	67AF67kF1VAFwI0_Wrv_Gr1UMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF
	4lIxAIcVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Zr0_
	Wr1UMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYx
	BIdaVFxhVjvjDU0xZFpf9x0JUCXdbUUUUU=
X-CM-SenderInfo: 51xn3trlr6x35dzhxuhorxvhhfrp/

Hi,

�� 2024/01/04 19:28, Jan Kara д��:
> On Thu 21-12-23 16:56:59, Yu Kuai wrote:
>> From: Yu Kuai <yukuai3@huawei.com>
>>
>> On the one hand covert to use folio while reading bdev inode, on the
>> other hand prevent to access bd_inode directly.
>>
>> Signed-off-by: Yu Kuai <yukuai3@huawei.com>
> ...
>> +		for (p = folio_address(folio); p < max; p++)
>>   			if (*p != -1UL) {
>> -				lock_page(page);
>> -				memset(page_address(page), 0xff, PAGE_SIZE);
>> -				set_page_dirty(page);
>> -				unlock_page(page);
>> -				balance_dirty_pages_ratelimited(mapping);
>> +				folio_lock(folio);
>> +				memset(folio_address(folio), 0xff,
>> +				       folio_size(folio));
>> +				folio_mark_dirty(folio);
>> +				folio_unlock(folio);
>> +				bdev_balance_dirty_pages_ratelimited(bdev);
> 
> Rather then creating this bdev_balance_dirty_pages_ratelimited() just for
> MTD perhaps we can have here (and in other functions):
> 
> 				...
> 				mapping = folio_mapping(folio);
> 				folio_unlock(folio);
> 				if (mapping)
> 					balance_dirty_pages_ratelimited(mapping);
> 
> What do you think? Because when we are working with the folios it is rather
> natural to use their mapping for dirty balancing?

I think this is a great idea! And bdev_balance_dirty_pages_ratelimited()
can be removed as well.

Thanks,
Kuai

> 
> 								Honza
> 


