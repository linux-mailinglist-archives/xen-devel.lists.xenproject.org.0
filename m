Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74DB390A0AB
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2024 01:02:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.741539.1148150 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sIysD-0003Kw-30; Sun, 16 Jun 2024 23:01:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 741539.1148150; Sun, 16 Jun 2024 23:01:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sIysD-0003JN-0M; Sun, 16 Jun 2024 23:01:21 +0000
Received: by outflank-mailman (input) for mailman id 741539;
 Sun, 16 Jun 2024 23:01:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SkS0=NS=kernel.org=dlemoal@srs-se1.protection.inumbo.net>)
 id 1sIysA-0003JH-UB
 for xen-devel@lists.xenproject.org; Sun, 16 Jun 2024 23:01:19 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 53b15056-2c34-11ef-b4bb-af5377834399;
 Mon, 17 Jun 2024 01:01:15 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 522C7CE0E5D;
 Sun, 16 Jun 2024 23:01:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CAA0C2BD10;
 Sun, 16 Jun 2024 23:01:05 +0000 (UTC)
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
X-Inumbo-ID: 53b15056-2c34-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718578869;
	bh=K48GiByJehCmQjwi20pmfnU+WsCyr4S6WxHNS+fcYIA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gczAGXT2JgNBboue0aH6XDCajaGt0Tn9T6RNwUC8NdBoTEgjtTbwpmUfCPkjFQ9wM
	 MM968k+DIaMHgn73yxqDo9X2C3EJ5/755Y+99nXMZx497l32DWuxyKEgkUS1Mfauzi
	 zlSFlVj6tWpctoPTJ+wOY0xCMexSj4HtxdjXI3+rZfPjj6bie6Cukz6u7sVo5A7bEU
	 9rKTuHOjY9Tr5Ii5b3jprMmIgspdDlLslR4qSbgMPqGu86/2ypBmGpS+m4Lh9tPaWA
	 jbUd1obFjKTKufNm0BQAftChaDznmaK4Iq8S3q+7ZRNQrBkFu3/tvjG2xwv4gQQlB4
	 JHm9Ls++1gm6g==
Message-ID: <5a697233-0611-459d-b889-2e0133bbb541@kernel.org>
Date: Mon, 17 Jun 2024 08:01:04 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/26] sd: move zone limits setup out of
 sd_read_block_characteristics
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Richard Weinberger <richard@nod.at>,
 Philipp Reisner <philipp.reisner@linbit.com>,
 Lars Ellenberg <lars.ellenberg@linbit.com>,
 =?UTF-8?Q?Christoph_B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>,
 Josef Bacik <josef@toxicpanda.com>, Ming Lei <ming.lei@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>,
 Mikulas Patocka <mpatocka@redhat.com>, Song Liu <song@kernel.org>,
 Yu Kuai <yukuai3@huawei.com>, Vineeth Vijayan <vneethv@linux.ibm.com>,
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
 <20240613093918.GA27629@lst.de>
From: Damien Le Moal <dlemoal@kernel.org>
Content-Language: en-US
Organization: Western Digital Research
In-Reply-To: <20240613093918.GA27629@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/13/24 18:39, Christoph Hellwig wrote:
> On Tue, Jun 11, 2024 at 02:51:24PM +0900, Damien Le Moal wrote:
>>> +	if (sdkp->device->type == TYPE_ZBC)
>>
>> Nit: use sd_is_zoned() here ?
> 
> Actually - is there much in even keeping sd_is_zoned now that the
> host aware support is removed?  Just open coding the type check isn't
> any more code, and probably easier to follow.

Removing this helper is fine by me. There are only 2 call sites in sd.c and the
some of 4 calls in sd_zbc.c are not really needed:
1) The call in sd_zbc_print_zones() is not needed at all since this function is
called only for a zoned drive from sd_zbc_revalidate_zones().
2) The calls in sd_zbc_report_zones() and sd_zbc_cmnd_checks() are probably
useless as these are called only for zoned drives in the first place. The checks
would be useful only for passthrough commands, but then we do not really care
about these and the user will get a failure anyway if it tries to do ZBC
commands on non-ZBC drives.
3) That leaves only the call in sd_zbc_read_zones() but that check can probably
be moved to sd.c to conditionally call  sd_zbc_read_zones().

-- 
Damien Le Moal
Western Digital Research


