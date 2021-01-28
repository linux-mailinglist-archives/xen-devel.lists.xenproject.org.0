Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93BF430763B
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jan 2021 13:39:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76978.139191 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l56Yu-0001Po-7e; Thu, 28 Jan 2021 12:38:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76978.139191; Thu, 28 Jan 2021 12:38:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l56Yu-0001PP-3f; Thu, 28 Jan 2021 12:38:12 +0000
Received: by outflank-mailman (input) for mailman id 76978;
 Thu, 28 Jan 2021 12:13:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7iPv=G7=linux.alibaba.com=joseph.qi@srs-us1.protection.inumbo.net>)
 id 1l56BB-0007sL-0r
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 12:13:41 +0000
Received: from out30-131.freemail.mail.aliyun.com (unknown [115.124.30.131])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 10eb5a45-45de-4782-9780-d87b4522a68e;
 Thu, 28 Jan 2021 12:13:38 +0000 (UTC)
Received: from B-D1K7ML85-0059.local(mailfrom:joseph.qi@linux.alibaba.com
 fp:SMTPD_---0UN8ZMkY_1611836008) by smtp.aliyun-inc.com(127.0.0.1);
 Thu, 28 Jan 2021 20:13:29 +0800
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
X-Inumbo-ID: 10eb5a45-45de-4782-9780-d87b4522a68e
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R261e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04357;MF=joseph.qi@linux.alibaba.com;NM=1;PH=DS;RN=56;SR=0;TI=SMTPD_---0UN8ZMkY_1611836008;
Subject: Re: [RFC PATCH 25/34] ocfs/cluster: use bio_new in dm-log-writes
To: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>,
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 dm-devel@redhat.com, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, drbd-dev@lists.linbit.com,
 xen-devel@lists.xenproject.org, linux-nvme@lists.infradead.org,
 linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, jfs-discussion@lists.sourceforge.net,
 linux-nilfs@vger.kernel.org, ocfs2-devel@oss.oracle.com,
 linux-pm@vger.kernel.org, linux-mm@kvack.org
Cc: axboe@kernel.dk, philipp.reisner@linbit.com, lars.ellenberg@linbit.com,
 konrad.wilk@oracle.com, roger.pau@citrix.com, minchan@kernel.org,
 ngupta@vflare.org, sergey.senozhatsky.work@gmail.com, agk@redhat.com,
 snitzer@redhat.com, hch@lst.de, sagi@grimberg.me,
 martin.petersen@oracle.com, viro@zeniv.linux.org.uk, tytso@mit.edu,
 jaegeuk@kernel.org, ebiggers@kernel.org, djwong@kernel.org,
 shaggy@kernel.org, konishi.ryusuke@gmail.com, mark@fasheh.com,
 jlbec@evilplan.org, damien.lemoal@wdc.com, naohiro.aota@wdc.com,
 jth@kernel.org, rjw@rjwysocki.net, len.brown@intel.com, pavel@ucw.cz,
 akpm@linux-foundation.org, hare@suse.de, gustavoars@kernel.org,
 tiwai@suse.de, alex.shi@linux.alibaba.com, asml.silence@gmail.com,
 ming.lei@redhat.com, tj@kernel.org, osandov@fb.com, bvanassche@acm.org,
 jefflexu@linux.alibaba.com
References: <20210128071133.60335-1-chaitanya.kulkarni@wdc.com>
 <20210128071133.60335-26-chaitanya.kulkarni@wdc.com>
From: Joseph Qi <joseph.qi@linux.alibaba.com>
Message-ID: <8ba2c461-6042-757d-a3c1-0490932e749e@linux.alibaba.com>
Date: Thu, 28 Jan 2021 20:13:28 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210128071133.60335-26-chaitanya.kulkarni@wdc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

I think you send a wrong subject by mistake.

Thanks,
Joseph

On 1/28/21 3:11 PM, Chaitanya Kulkarni wrote:
> Signed-off-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
> ---
>  fs/ocfs2/cluster/heartbeat.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/ocfs2/cluster/heartbeat.c b/fs/ocfs2/cluster/heartbeat.c
> index 0179a73a3fa2..b34518036446 100644
> --- a/fs/ocfs2/cluster/heartbeat.c
> +++ b/fs/ocfs2/cluster/heartbeat.c
> @@ -515,12 +515,13 @@ static struct bio *o2hb_setup_one_bio(struct o2hb_region *reg,
>  	unsigned int cs = *current_slot;
>  	struct bio *bio;
>  	struct page *page;
> +	sector_t sect = (reg->hr_start_block + cs) << (bits - 9);
>  
>  	/* Testing has shown this allocation to take long enough under
>  	 * GFP_KERNEL that the local node can get fenced. It would be
>  	 * nicest if we could pre-allocate these bios and avoid this
>  	 * all together. */
> -	bio = bio_alloc(GFP_ATOMIC, 16);
> +	bio = bio_new(reg->hr_bdev, sect, op, op_flags, 16, GFP_ATOMIC);
>  	if (!bio) {
>  		mlog(ML_ERROR, "Could not alloc slots BIO!\n");
>  		bio = ERR_PTR(-ENOMEM);
> @@ -528,11 +529,8 @@ static struct bio *o2hb_setup_one_bio(struct o2hb_region *reg,
>  	}
>  
>  	/* Must put everything in 512 byte sectors for the bio... */
> -	bio->bi_iter.bi_sector = (reg->hr_start_block + cs) << (bits - 9);
> -	bio_set_dev(bio, reg->hr_bdev);
>  	bio->bi_private = wc;
>  	bio->bi_end_io = o2hb_bio_end_io;
> -	bio_set_op_attrs(bio, op, op_flags);
>  
>  	vec_start = (cs << bits) % PAGE_SIZE;
>  	while(cs < max_slots) {
> 

