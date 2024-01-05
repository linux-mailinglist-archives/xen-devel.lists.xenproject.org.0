Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 642F2824DB6
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jan 2024 05:44:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.661938.1031755 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLc41-0004Jn-Nz; Fri, 05 Jan 2024 04:44:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 661938.1031755; Fri, 05 Jan 2024 04:44:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLc41-0004HY-KD; Fri, 05 Jan 2024 04:44:09 +0000
Received: by outflank-mailman (input) for mailman id 661938;
 Fri, 05 Jan 2024 04:44:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ItCV=IP=linux.alibaba.com=hsiangkao@srs-se1.protection.inumbo.net>)
 id 1rLc3z-0004HS-Mm
 for xen-devel@lists.xenproject.org; Fri, 05 Jan 2024 04:44:07 +0000
Received: from out30-111.freemail.mail.aliyun.com
 (out30-111.freemail.mail.aliyun.com [115.124.30.111])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0acaf808-ab85-11ee-9b0f-b553b5be7939;
 Fri, 05 Jan 2024 05:44:02 +0100 (CET)
Received: from 30.222.33.160(mailfrom:hsiangkao@linux.alibaba.com
 fp:SMTPD_---0VzzUQHt_1704429833) by smtp.aliyun-inc.com;
 Fri, 05 Jan 2024 12:43:56 +0800
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
X-Inumbo-ID: 0acaf808-ab85-11ee-9b0f-b553b5be7939
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R881e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046060;MF=hsiangkao@linux.alibaba.com;NM=1;PH=DS;RN=49;SR=0;TI=SMTPD_---0VzzUQHt_1704429833;
Message-ID: <a2c7910c-4c2f-4290-a895-1c4255b2ee62@linux.alibaba.com>
Date: Fri, 5 Jan 2024 12:43:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v3 for-6.8/block 11/17] erofs: use bdev api
To: Yu Kuai <yukuai1@huaweicloud.com>, Jan Kara <jack@suse.cz>
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
 <20231221085826.1768395-1-yukuai1@huaweicloud.com>
 <20240104120207.ig7tfc3mgckwkp2n@quack3>
 <7f868579-f993-aaa1-b7d7-eccbe0b0173c@huaweicloud.com>
From: Gao Xiang <hsiangkao@linux.alibaba.com>
In-Reply-To: <7f868579-f993-aaa1-b7d7-eccbe0b0173c@huaweicloud.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2024/1/4 20:32, Yu Kuai wrote:
> Hi, Jan!
> 
> 在 2024/01/04 20:02, Jan Kara 写道:
>> On Thu 21-12-23 16:58:26, Yu Kuai wrote:
>>> From: Yu Kuai <yukuai3@huawei.com>
>>>
>>> Avoid to access bd_inode directly, prepare to remove bd_inode from
>>> block_device.
>>>
>>> Signed-off-by: Yu Kuai <yukuai3@huawei.com>
>>
>> I'm not erofs maintainer but IMO this is quite ugly and grows erofs_buf
>> unnecessarily. I'd rather store 'sb' pointer in erofs_buf and then do the
>> right thing in erofs_bread() which is the only place that seems to care
>> about the erofs_is_fscache_mode() distinction... Also blkszbits is then
>> trivially sb->s_blocksize_bits so it would all seem much more
>> straightforward.
> 
> Thanks for your suggestion, I'll follow this unless Gao Xiang has other
> suggestions.

Yes, that would be better, I'm fine with that.  Yet in the future we
may support a seperate large dirblocksize more than block size, but
we could revisit later.

Thanks,
Gao Xiang

> 
> Kuai
>>
>>                                 Honza
>>

