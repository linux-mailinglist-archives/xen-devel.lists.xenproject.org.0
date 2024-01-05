Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63EA0824E73
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jan 2024 07:10:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.661944.1031765 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLdOi-0005HX-Jk; Fri, 05 Jan 2024 06:09:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 661944.1031765; Fri, 05 Jan 2024 06:09:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLdOi-0005F4-GB; Fri, 05 Jan 2024 06:09:36 +0000
Received: by outflank-mailman (input) for mailman id 661944;
 Fri, 05 Jan 2024 06:09:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0sKf=IP=bombadil.srs.infradead.org=BATV+47ea59da63ebb99efca2+7439+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1rLdOd-0005Ey-Lp
 for xen-devel@lists.xenproject.org; Fri, 05 Jan 2024 06:09:34 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:3::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fa2196ac-ab90-11ee-9b0f-b553b5be7939;
 Fri, 05 Jan 2024 07:09:27 +0100 (CET)
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1rLdNq-00G2Lb-1Y; Fri, 05 Jan 2024 06:08:42 +0000
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
X-Inumbo-ID: fa2196ac-ab90-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=MfpbILepFAZMB7h2HpBoL7ju9YNJfneelNa0zdsWGTE=; b=e70OEnapxROCnryMJ+/p/ZRb6q
	Co5Z26/TzQb4j3uqh1HZXPyKmCgH2RwmGzkFPqv/2KSdkod23+EEjl5k+gUFVeqhE5cLIgjhrZRln
	/TXAnczuvmS/5fv3lonygpNZAr1rkpjLeOKpUo4IcO+WT8eqyhpsxuK7Ezd7daqbCvaeMhieEDC36
	2YdiX92FOcKP4zmjzJggSzAOI+XBEn3tUqKwk8TRuVaK3ZW0yVd/FMa71m8GX6rJkaQu4CkxJRsNW
	K9G8CtK6Nzof6XV0ra5vX4twK05qlkoQTCHmArqOs9K34hsqfqleQt54ZZt7JnrErtkJGz1qKQ4DI
	JcEjMrNg==;
Date: Thu, 4 Jan 2024 22:08:42 -0800
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
	jack@suse.com, konishi.ryusuke@gmail.com, willy@infradead.org,
	akpm@linux-foundation.org, hare@suse.de, p.raghav@samsung.com,
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org, linux-bcache@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org, linux-bcachefs@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, linux-ext4@vger.kernel.org,
	linux-nilfs@vger.kernel.org, yukuai3@huawei.com,
	yi.zhang@huawei.com, yangerkun@huawei.com
Subject: Re: [PATCH RFC v3 for-6.8/block 02/17] xen/blkback: use bdev api in
 xen_update_blkif_status()
Message-ID: <ZZec6mX1vz4ayRq1@infradead.org>
References: <20231221085712.1766333-1-yukuai1@huaweicloud.com>
 <20231221085712.1766333-3-yukuai1@huaweicloud.com>
 <20240104110631.3vspsvxbbvcpdqdu@quack3>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240104110631.3vspsvxbbvcpdqdu@quack3>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Thu, Jan 04, 2024 at 12:06:31PM +0100, Jan Kara wrote:
> This function uses invalidate_inode_pages2() while invalidate_bdev() ends
> up using mapping_try_invalidate() and there are subtle behavioral
> differences between these two (for example invalidate_inode_pages2() tries
> to clean dirty pages using the ->launder_folio method). So I think you'll
> need helper like invalidate_bdev2() for this.

That assues that the existing code actually does this intentionally,
which seems doubtful.  But the change in behavior does not to be
documented and explained.


