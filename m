Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E89138D5A03
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2024 07:49:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.733262.1139392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCv84-0008Ud-P8; Fri, 31 May 2024 05:48:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 733262.1139392; Fri, 31 May 2024 05:48:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCv84-0008SO-Lf; Fri, 31 May 2024 05:48:40 +0000
Received: by outflank-mailman (input) for mailman id 733262;
 Fri, 31 May 2024 05:48:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ULw3=NC=lst.de=hch@srs-se1.protection.inumbo.net>)
 id 1sCv83-0008SI-00
 for xen-devel@lists.xenproject.org; Fri, 31 May 2024 05:48:39 +0000
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6c22bc1e-1f11-11ef-90a1-e314d9c70b13;
 Fri, 31 May 2024 07:48:38 +0200 (CEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 0721C68BEB; Fri, 31 May 2024 07:48:33 +0200 (CEST)
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
X-Inumbo-ID: 6c22bc1e-1f11-11ef-90a1-e314d9c70b13
Date: Fri, 31 May 2024 07:48:32 +0200
From: Christoph Hellwig <hch@lst.de>
To: John Garry <john.g.garry@oracle.com>
Cc: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Josef Bacik <josef@toxicpanda.com>,
	Ilya Dryomov <idryomov@gmail.com>,
	Dongsheng Yang <dongsheng.yang@easystack.cn>,
	Roger Pau Monn?? <roger.pau@citrix.com>,
	linux-um@lists.infradead.org, linux-block@vger.kernel.org,
	nbd@other.debian.org, ceph-devel@vger.kernel.org,
	xen-devel@lists.xenproject.org, linux-scsi@vger.kernel.org
Subject: Re: [PATCH 09/12] sd: convert to the atomic queue limits API
Message-ID: <20240531054832.GB17396@lst.de>
References: <20240529050507.1392041-1-hch@lst.de> <20240529050507.1392041-10-hch@lst.de> <1a1854bb-1f28-44d1-a4ac-30872bd6c3c8@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1a1854bb-1f28-44d1-a4ac-30872bd6c3c8@oracle.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Thu, May 30, 2024 at 10:16:33AM +0100, John Garry wrote:
>> -static void sd_config_write_same(struct scsi_disk *);
>> +static void sd_config_discard(struct scsi_disk *sdkp, struct queue_limits *lim,
>> +		unsigned int mode);
>
> Are there any reasons why we keep forward declarations like this? AFAICS, 
> this sd_config_discard forward declaration could be removed.

Mostly to avoid churn.  This is a series that needs to feed into the
block tree, so I don't want major churn in sd.c.  Maybe after the dust
has settled it would be nice to bring sd.c into a natural order.

>> -	blk_queue_max_write_zeroes_sectors(q, sdkp->max_ws_blocks *
>> -					 (logical_block_size >> 9));
>> +	lim->max_write_zeroes_sectors =
>> +		sdkp->max_ws_blocks * (logical_block_size >> 9);
>
> Would it be ok to use SECTOR_SHIFT here? A similar change is made in 
> sd_config_discard(), above

Sure.

>> +		sd_config_discard(sdkp, lim, sd_discard_mode(sdkp));
>>   	}
>>      out:
>> @@ -3278,10 +3290,10 @@ static void sd_read_block_limits_ext(struct scsi_disk *sdkp)
>>   }
>>     /**
>
> below is not a kernel doc comment

And that is on the one hand intentional to avoid documenting all the
obvious paramters in a local function, but on the other hand requires
removing the double *. Fixed.

>>   @@ -3683,28 +3696,33 @@ static int sd_revalidate_disk(struct gendisk 
>> *disk)
>>   	q->limits.max_dev_sectors = logical_to_sectors(sdp, dev_max);
>
>
> is setting q->limits.max_dev_sectors directly proper?

No, and I've already fixed it in my local tree.


