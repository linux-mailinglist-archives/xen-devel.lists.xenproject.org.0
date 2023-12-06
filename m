Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD3A807703
	for <lists+xen-devel@lfdr.de>; Wed,  6 Dec 2023 18:53:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649380.1013839 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAw4i-000362-OR; Wed, 06 Dec 2023 17:52:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649380.1013839; Wed, 06 Dec 2023 17:52:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAw4i-00034R-Le; Wed, 06 Dec 2023 17:52:44 +0000
Received: by outflank-mailman (input) for mailman id 649380;
 Wed, 06 Dec 2023 17:52:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ej6Q=HR=mit.edu=tytso@srs-se1.protection.inumbo.net>)
 id 1rAw4g-00034L-Vr
 for xen-devel@lists.xenproject.org; Wed, 06 Dec 2023 17:52:43 +0000
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3e69df6c-9460-11ee-98e5-6d05b1d4d9a1;
 Wed, 06 Dec 2023 18:52:39 +0100 (CET)
Received: from cwcc.thunk.org (pool-173-48-122-214.bstnma.fios.verizon.net
 [173.48.122.214]) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 3B6Hodj2022646
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 6 Dec 2023 12:50:40 -0500
Received: by cwcc.thunk.org (Postfix, from userid 15806)
 id F04EC15C057B; Wed,  6 Dec 2023 12:50:38 -0500 (EST)
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
X-Inumbo-ID: 3e69df6c-9460-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1701885052; bh=VZDVHdtsTza1iBjsN4e9taxM8QQIzumJOYNTH51fhro=;
	h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
	b=BH8TRkxS2KVaitLmv0fUh5MfTnRi8kxhm2QxRnobVHqRnCkm5tdQJ4YU7KzmgN2o9
	 OrT5ijrdbqD+8Tpl+UWv5WlzoZ4FfBRwcoZtXGHipfp3BKDuVw8Wb3OV8JHdDL++WR
	 fchowN0SphtUdvT2S+alJWDJDljYoM4HhCP8Oe9wGQPXflEuR9UupnRUlKWI1Qe2kg
	 kWiBMGCDi9IQPUcNW0bRqxHb1k7h5ks+vYGOrOHkVBn6CgZz1YTgrm04q9GDpzs5AE
	 AW77xm7xSTCpwyFB4QBf7egNa0Hpu3J4Iea+sXKNE2nV9yZ8sAlE3vS7vnXmXBUfDj
	 Vli7wjfFyI1og==
Date: Wed, 6 Dec 2023 12:50:38 -0500
From: "Theodore Ts'o" <tytso@mit.edu>
To: Christoph Hellwig <hch@infradead.org>
Cc: Yu Kuai <yukuai1@huaweicloud.com>, axboe@kernel.dk, roger.pau@citrix.com,
        colyli@suse.de, kent.overstreet@gmail.com, joern@lazybastard.org,
        miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
        sth@linux.ibm.com, hoeppner@linux.ibm.com, hca@linux.ibm.com,
        gor@linux.ibm.com, agordeev@linux.ibm.com, jejb@linux.ibm.com,
        martin.petersen@oracle.com, clm@fb.com, josef@toxicpanda.com,
        dsterba@suse.com, nico@fluxnic.net, xiang@kernel.org, chao@kernel.org,
        adilger.kernel@dilger.ca, agruenba@redhat.com, jack@suse.com,
        konishi.ryusuke@gmail.com, willy@infradead.org,
        akpm@linux-foundation.org, hare@suse.de, p.raghav@samsung.com,
        linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
        xen-devel@lists.xenproject.org, linux-bcache@vger.kernel.org,
        linux-mtd@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-bcachefs@vger.kernel.org,
        linux-btrfs@vger.kernel.org, linux-erofs@lists.ozlabs.org,
        linux-ext4@vger.kernel.org, gfs2@lists.linux.dev,
        linux-nilfs@vger.kernel.org, yukuai3@huawei.com, yi.zhang@huawei.com,
        yangerkun@huawei.com
Subject: Re: [PATCH -next RFC 01/14] block: add some bdev apis
Message-ID: <20231206175038.GJ509422@mit.edu>
References: <20231205123728.1866699-1-yukuai1@huaweicloud.com>
 <20231205123728.1866699-2-yukuai1@huaweicloud.com>
 <ZXARKD0OmjLrvHmU@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZXARKD0OmjLrvHmU@infradead.org>

On Tue, Dec 05, 2023 at 10:14:00PM -0800, Christoph Hellwig wrote:
> > +/*
> > + * The del_gendisk() function uninitializes the disk-specific data
> > + * structures, including the bdi structure, without telling anyone
> > + * else.  Once this happens, any attempt to call mark_buffer_dirty()
> > + * (for example, by ext4_commit_super), will cause a kernel OOPS.
> > + * This is a kludge to prevent these oops until we can put in a proper
> > + * hook in del_gendisk() to inform the VFS and file system layers.
> > + */
> > +int bdev_ejected(struct block_device *bdev)
> > +{
> > +	struct backing_dev_info *bdi = inode_to_bdi(bdev->bd_inode);
> > +
> > +	return bdi->dev == NULL;
> > +}
> > +EXPORT_SYMBOL_GPL(bdev_ejected);
> 
> And this code in ext4 should just go away entirely.  The bdi should
> always be valid for a live bdev for years.

This was added because pulling a mounted a USB thumb drive (or a HDD
drops off the SATA bus) while the file system is mounted and actively
in use, would result in a kernel OOPS.  If that's no longer true,
that's great, but it would be good to test to make sure this is the
case....

If we really want to remove it, I'd suggest doing this as a separate
commit, so that after we see syzbot reports, or users complaining
about kernel crashes, we can revert the removal if necessary.

Cheers,

					- Ted

