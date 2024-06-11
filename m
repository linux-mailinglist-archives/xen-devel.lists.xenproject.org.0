Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA8890335F
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2024 09:22:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.737912.1144414 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGvoe-0006rI-4X; Tue, 11 Jun 2024 07:21:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 737912.1144414; Tue, 11 Jun 2024 07:21:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGvoe-0006pK-1w; Tue, 11 Jun 2024 07:21:12 +0000
Received: by outflank-mailman (input) for mailman id 737912;
 Tue, 11 Jun 2024 07:21:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7xGt=NN=kernel.org=dlemoal@srs-se1.protection.inumbo.net>)
 id 1sGvoc-0006on-Rm
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2024 07:21:10 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 28d5b08b-27c3-11ef-b4bb-af5377834399;
 Tue, 11 Jun 2024 09:21:03 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5EAFE60C76;
 Tue, 11 Jun 2024 07:21:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B857C2BD10;
 Tue, 11 Jun 2024 07:20:55 +0000 (UTC)
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
X-Inumbo-ID: 28d5b08b-27c3-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718090461;
	bh=SxGiXC2eXjeuicvqjgmxBbbuRkQDAALVXqGltltCvpM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=J9t/JghW0gR/ETwdzjpl7VD7KnwAlMW8rRhwZr9kxWhQ6tl8Phg9WjO76NiKxxgu8
	 fLxeqF9M5t6BVVC5kK/sKL3zR1K2qLPoyVha6i0EJluUzp1kNJ5g2TNKh8g+EJPN33
	 hrljcXVnUuN8Lr5KlIujiAJZzEJDuCsFcPLl3jPutPmhKf9R0GeNiPNem29bg2OBO7
	 a1cFWzw0qNt9DSnc6yLqLEresNea8LBs8q7/++QEaUosyu+AjkSi/+C9VElPN9n7PP
	 XlPsIxsXYvBqYod+WVUBRRvW1FiyVSTv+Mlz8E7DodnwczmTJdbU3tnt32fP5VZhAs
	 3tDYxoJTsEL7w==
Message-ID: <6bf90562-0ff9-46b6-8a58-7381332e3beb@kernel.org>
Date: Tue, 11 Jun 2024 16:20:54 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/26] sd: move zone limits setup out of
 sd_read_block_characteristics
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Richard Weinberger <richard@nod.at>,
 Philipp Reisner <philipp.reisner@linbit.com>,
 Lars Ellenberg <lars.ellenberg@linbit.com>,
 Christoph B??hmwalder <christoph.boehmwalder@linbit.com>,
 Josef Bacik <josef@toxicpanda.com>, Ming Lei <ming.lei@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Roger Pau Monn?? <roger.pau@citrix.com>, Alasdair Kergon <agk@redhat.com>,
 Mike Snitzer <snitzer@kernel.org>, Mikulas Patocka <mpatocka@redhat.com>,
 Song Liu <song@kernel.org>, Yu Kuai <yukuai3@huawei.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 linux-m68k@lists.linux-m68k.org, linux-um@lists.infradead.org,
 drbd-dev@lists.linbit.com, nbd@other.debian.org,
 linuxppc-dev@lists.ozlabs.org, ceph-devel@vger.kernel.org,
 virtualization@lists.linux.dev, xen-devel@lists.xenproject.org,
 linux-bcache@vger.kernel.org, dm-devel@lists.linux.dev,
 linux-raid@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-mtd@lists.infradead.org, nvdimm@lists.linux.dev,
 linux-nvme@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-block@vger.kernel.org
References: <20240611051929.513387-1-hch@lst.de>
 <20240611051929.513387-3-hch@lst.de>
 <40ca8052-6ac1-4c1b-8c39-b0a7948839f8@kernel.org>
 <20240611055239.GA3141@lst.de>
Content-Language: en-US
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <20240611055239.GA3141@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/11/24 2:52 PM, Christoph Hellwig wrote:
> On Tue, Jun 11, 2024 at 02:51:24PM +0900, Damien Le Moal wrote:
>>> -	if (lim->zoned)
>>> +	if (sdkp->device->type == TYPE_ZBC)
>>
>> Nit: use sd_is_zoned() here ?
> 
> Yes.
> 
>>> -	if (!sd_is_zoned(sdkp))
>>> +	if (!sd_is_zoned(sdkp)) {
>>> +		lim->zoned = false;
>>
>> Maybe we should clear the other zone related limits here ? If the drive is
>> reformatted/converted from SMR to CMR (FORMAT WITH PRESET), the other zone
>> limits may be set already, no ?
> 
> blk_validate_zoned_limits already takes care of that.

I do not think it does:

static int blk_validate_zoned_limits(struct queue_limits *lim)
{
        if (!lim->zoned) {
                if (WARN_ON_ONCE(lim->max_open_zones) ||
                    WARN_ON_ONCE(lim->max_active_zones) ||
                    WARN_ON_ONCE(lim->zone_write_granularity) ||
                    WARN_ON_ONCE(lim->max_zone_append_sectors))
                        return -EINVAL;
                return 0;
        }
	...

So setting lim->zoned to false without clearing the other limits potentially
will trigger warnings...

-- 
Damien Le Moal
Western Digital Research


