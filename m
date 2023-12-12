Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 265DD80ED04
	for <lists+xen-devel@lfdr.de>; Tue, 12 Dec 2023 14:15:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.653120.1019385 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD2bQ-0006Re-Ew; Tue, 12 Dec 2023 13:15:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 653120.1019385; Tue, 12 Dec 2023 13:15:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD2bQ-0006PV-CC; Tue, 12 Dec 2023 13:15:12 +0000
Received: by outflank-mailman (input) for mailman id 653120;
 Tue, 12 Dec 2023 13:15:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O/80=HX=bombadil.srs.infradead.org=BATV+6f90c2f2ff3264e7ff81+7415+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1rD2bO-0006O8-HR
 for xen-devel@lists.xenproject.org; Tue, 12 Dec 2023 13:15:11 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:3::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 784dac41-98f0-11ee-9b0f-b553b5be7939;
 Tue, 12 Dec 2023 14:15:08 +0100 (CET)
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1rD2ae-00BldE-0K; Tue, 12 Dec 2023 13:14:24 +0000
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
X-Inumbo-ID: 784dac41-98f0-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=d9GOM1CReQqHO2Eq5TSJ+QFrtD+BDx0i0I5iG3RHOkc=; b=dT7hUcTdggq68z9eTLTpZvkowz
	o0hzxFtGP/1A5CdpXLfKR7IAabXtd6tscvW4EWJ7bqf73me/qP/EdG2B4FI3typytMvICOqncBaZB
	juLPQegmxMqcDjRUgDWRxj7eyVDzzLp60SQCJEDdgc0OscK42Z3kENibYVgGF0I1l4mcAYgv7Nega
	dtBKSq2W5Eht1hqZUznEkZjKNtAWvDjb82DMtqFruzGL7aQEKgH38NdlFfSSWk5+OxXcyVtpRNqmc
	NPwFb5zSyEEcKZJQSk14/2oMDYGzCgMBHQVgCHGvkAUHl3vAl4PoAud1hrwXpknFsKsviOKDCWU7T
	JzSMOq4g==;
Date: Tue, 12 Dec 2023 05:14:24 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Jan Kara <jack@suse.cz>
Cc: Yu Kuai <yukuai1@huaweicloud.com>, axboe@kernel.dk,
	roger.pau@citrix.com, colyli@suse.de, kent.overstreet@gmail.com,
	joern@lazybastard.org, miquel.raynal@bootlin.com, richard@nod.at,
	vigneshr@ti.com, sth@linux.ibm.com, hoeppner@linux.ibm.com,
	hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com,
	jejb@linux.ibm.com, martin.petersen@oracle.com, clm@fb.com,
	josef@toxicpanda.com, dsterba@suse.com, viro@zeniv.linux.org.uk,
	brauner@kernel.org, nico@fluxnic.net, xiang@kernel.org,
	chao@kernel.org, tytso@mit.edu, adilger.kernel@dilger.ca,
	agruenba@redhat.com, jack@suse.com, konishi.ryusuke@gmail.com,
	willy@infradead.org, akpm@linux-foundation.org,
	p.raghav@samsung.com, hare@suse.de, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
	linux-bcache@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org,
	linux-bcachefs@vger.kernel.org, linux-btrfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	linux-ext4@vger.kernel.org, gfs2@lists.linux.dev,
	linux-nilfs@vger.kernel.org, yukuai3@huawei.com,
	yi.zhang@huawei.com, yangerkun@huawei.com
Subject: Re: [PATCH RFC v2 for-6.8/block 01/18] block: add some bdev apis
Message-ID: <ZXhcsNbvzbArtBUj@infradead.org>
References: <20231211140552.973290-1-yukuai1@huaweicloud.com>
 <20231211140552.973290-2-yukuai1@huaweicloud.com>
 <20231211165217.fil437byq7w2vcp7@quack3>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231211165217.fil437byq7w2vcp7@quack3>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Mon, Dec 11, 2023 at 05:52:17PM +0100, Jan Kara wrote:
> > +void bdev_associated_mapping(struct block_device *bdev,
> > +			     struct address_space *mapping)
> > +{
> > +	mapping->host = bdev->bd_inode;
> > +}
> 
> Here I'm not sure - is the helper really a win? It seems a bit obscure to
> me. This initialization of another mapping for a bdev looks really special.

If we want to hide bd_inode we'll something like this helper even if
I don't particularly like it either.

But it might be a good idea to move out of this series and into the
follow on removing bd_inode, as it's rather pointless without that
context.

