Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9BD17F9AE3
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 08:24:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.641626.1000342 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7Vyg-0003Ys-1x; Mon, 27 Nov 2023 07:24:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 641626.1000342; Mon, 27 Nov 2023 07:24:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7Vyf-0003W8-Um; Mon, 27 Nov 2023 07:24:21 +0000
Received: by outflank-mailman (input) for mailman id 641626;
 Mon, 27 Nov 2023 07:24:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gtR5=HI=linux.dev=kent.overstreet@srs-se1.protection.inumbo.net>)
 id 1r7Vye-0003Vm-72
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 07:24:20 +0000
Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com
 [91.218.175.178]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f976a16d-8cf5-11ee-9b0e-b553b5be7939;
 Mon, 27 Nov 2023 08:24:17 +0100 (CET)
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
X-Inumbo-ID: f976a16d-8cf5-11ee-9b0e-b553b5be7939
Date: Mon, 27 Nov 2023 02:24:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1701069856;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sJC7JnCdDMwVJE2Gwk1C0vFk6Py1BaDljTucatOpxXs=;
	b=kgGJDb1VLCucuD5e2hQjWQ+XC++egZdZLhAJ5iSZ9utvVrf0CyMvQhrYx/JyB6n/L7fH3e
	GiEbFbqY39IEtBXghxm0L08GSy6BnG8399HEFLMWDdDhP3apLoaek5QzUTk74RqX4T/nLt
	6aKmIt20r4fDMRbnYCLJEPsYwvQ8600=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Damien Le Moal <dlemoal@kernel.org>
Cc: Yu Kuai <yukuai1@huaweicloud.com>, hch@infradead.org,
	ming.lei@redhat.com, axboe@kernel.dk, roger.pau@citrix.com,
	colyli@suse.de, kent.overstreet@gmail.com, joern@lazybastard.org,
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	sth@linux.ibm.com, hoeppner@linux.ibm.com, hca@linux.ibm.com,
	gor@linux.ibm.com, agordeev@linux.ibm.com, jejb@linux.ibm.com,
	martin.petersen@oracle.com, clm@fb.com, josef@toxicpanda.com,
	dsterba@suse.com, viro@zeniv.linux.org.uk, brauner@kernel.org,
	nico@fluxnic.net, xiang@kernel.org, chao@kernel.org, tytso@mit.edu,
	adilger.kernel@dilger.ca, agruenba@redhat.com, jack@suse.com,
	konishi.ryusuke@gmail.com, dchinner@redhat.com,
	linux@weissschuh.net, min15.li@samsung.com, yukuai3@huawei.com,
	willy@infradead.org, akpm@linux-foundation.org, hare@suse.de,
	p.raghav@samsung.com, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
	linux-bcache@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org,
	linux-bcachefs@vger.kernel.org, linux-btrfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	linux-ext4@vger.kernel.org, gfs2@lists.linux.dev,
	linux-nilfs@vger.kernel.org, yi.zhang@huawei.com,
	yangerkun@huawei.com
Subject: Re: [PATCH block/for-next v2 07/16] bcachefs: use new helper to get
 inode from block_device
Message-ID: <20231127072409.y22jkynrchm4tkd2@moria.home.lan>
References: <20231127062116.2355129-1-yukuai1@huaweicloud.com>
 <20231127062116.2355129-8-yukuai1@huaweicloud.com>
 <d3b87b87-2ca7-43ca-9fb4-ee3696561eb5@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d3b87b87-2ca7-43ca-9fb4-ee3696561eb5@kernel.org>
X-Migadu-Flow: FLOW_OUT

On Mon, Nov 27, 2023 at 04:09:47PM +0900, Damien Le Moal wrote:
> On 11/27/23 15:21, Yu Kuai wrote:
> > From: Yu Kuai <yukuai3@huawei.com>
> > 
> > Which is more efficiency, and also prepare to remove the field
> > 'bd_inode' from block_device.
> > 
> > Signed-off-by: Yu Kuai <yukuai3@huawei.com>
> > ---
> >  fs/bcachefs/util.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/fs/bcachefs/util.h b/fs/bcachefs/util.h
> > index 2984b57b2958..fe7ccb3a3517 100644
> > --- a/fs/bcachefs/util.h
> > +++ b/fs/bcachefs/util.h
> > @@ -518,7 +518,7 @@ int bch2_bio_alloc_pages(struct bio *, size_t, gfp_t);
> >  
> >  static inline sector_t bdev_sectors(struct block_device *bdev)
> >  {
> > -	return bdev->bd_inode->i_size >> 9;
> > +	return bdev_inode(bdev)->i_size >> 9;
> 
> shouldn't this use i_size_read() ?
> 
> I missed the history with this but why not use bdev_nr_sectors() and delete this
> helper ?

Actually, this helper seems to be dead code.

