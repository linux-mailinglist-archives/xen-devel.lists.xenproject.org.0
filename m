Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C51E8066F8
	for <lists+xen-devel@lfdr.de>; Wed,  6 Dec 2023 07:07:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.648872.1012866 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAl3Y-0007gW-GJ; Wed, 06 Dec 2023 06:06:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 648872.1012866; Wed, 06 Dec 2023 06:06:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAl3Y-0007dv-Cz; Wed, 06 Dec 2023 06:06:48 +0000
Received: by outflank-mailman (input) for mailman id 648872;
 Wed, 06 Dec 2023 06:06:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8sBq=HR=huaweicloud.com=yukuai1@srs-se1.protection.inumbo.net>)
 id 1rAl3W-0007dp-PF
 for xen-devel@lists.xenproject.org; Wed, 06 Dec 2023 06:06:46 +0000
Received: from dggsgout11.his.huawei.com (unknown [45.249.212.51])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9f289fd7-93fd-11ee-9b0f-b553b5be7939;
 Wed, 06 Dec 2023 07:06:43 +0100 (CET)
Received: from mail.maildlp.com (unknown [172.19.93.142])
 by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4SlRk42wg1z4f3kKG
 for <xen-devel@lists.xenproject.org>; Wed,  6 Dec 2023 14:06:36 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
 by mail.maildlp.com (Postfix) with ESMTP id 76D301A0820
 for <xen-devel@lists.xenproject.org>; Wed,  6 Dec 2023 14:06:37 +0800 (CST)
Received: from [10.174.176.73] (unknown [10.174.176.73])
 by APP1 (Coremail) with SMTP id cCh0CgBXWhBpD3BlSn2ACw--.13338S3;
 Wed, 06 Dec 2023 14:06:36 +0800 (CST)
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
X-Inumbo-ID: 9f289fd7-93fd-11ee-9b0f-b553b5be7939
Subject: Re: [PATCH -next RFC 00/14] block: don't access bd_inode directly
 from other modules
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
 <ZXAMh02h4FAwt2FY@infradead.org>
From: Yu Kuai <yukuai1@huaweicloud.com>
Message-ID: <4b11a311-c121-1f44-0ccf-a3966a396994@huaweicloud.com>
Date: Wed, 6 Dec 2023 14:06:33 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <ZXAMh02h4FAwt2FY@infradead.org>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:cCh0CgBXWhBpD3BlSn2ACw--.13338S3
X-Coremail-Antispam: 1UD129KBjvdXoW7GrW3AFy7uF4rXry3Ary8uFg_yoWxuFc_XF
	ZYkrW0yw4rJFy0ka1UKF15A3yxCa40gan5ZrW8JFyxXF1rtFs5Ja9rWry5Z3srJrW0krZ7
	tF92gay7Cr4qvjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUba8FF20E14v26rWj6s0DM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
	6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kI
	c2xKxwCYjI0SjxkI62AI1cAE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4
	AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
	17CEb7AF67AKxVWrXVW8Jr1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCw
	CI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E
	3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcS
	sGvfC2KfnxnUUI43ZEXa7VUbJ73DUUUUU==
X-CM-SenderInfo: 51xn3trlr6x35dzhxuhorxvhhfrp/

Hi,

ÔÚ 2023/12/06 13:54, Christoph Hellwig Ð´µÀ:
> On Tue, Dec 05, 2023 at 08:37:14PM +0800, Yu Kuai wrote:
>> From: Yu Kuai <yukuai3@huawei.com>
>>
>> Patch 1 add some bdev apis, then follow up patches will use these apis
>> to avoid access bd_inode directly, and hopefully the field bd_inode can
>> be removed eventually(after figure out a way for fs/buffer.c).
> 
> What tree is this against?  It fails to apply to either Jens'
> for-6.8/block or Linus tree in the very first patch.

It was against linux-next branch, for the tag next-20231201, because I'm
not sure yet if this patchset should be applied to Jans' tree. Please
let me know if I should swith wo Jens' tree for v2.

Thanks,
Kuai
> 
> .
> 


