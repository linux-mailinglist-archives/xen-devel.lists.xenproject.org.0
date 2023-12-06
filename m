Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC97806826
	for <lists+xen-devel@lfdr.de>; Wed,  6 Dec 2023 08:21:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.648933.1013035 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAmDY-0002Fr-6A; Wed, 06 Dec 2023 07:21:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 648933.1013035; Wed, 06 Dec 2023 07:21:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAmDY-0002DQ-3T; Wed, 06 Dec 2023 07:21:12 +0000
Received: by outflank-mailman (input) for mailman id 648933;
 Wed, 06 Dec 2023 07:21:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sruh=HR=bombadil.srs.infradead.org=BATV+2d31c4bdfe93494595b7+7409+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1rAmDV-0002DK-Jy
 for xen-devel@lists.xenproject.org; Wed, 06 Dec 2023 07:21:10 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:3::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0537c21f-9408-11ee-9b0f-b553b5be7939;
 Wed, 06 Dec 2023 08:21:07 +0100 (CET)
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1rAmCo-009HjE-0N; Wed, 06 Dec 2023 07:20:26 +0000
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
X-Inumbo-ID: 0537c21f-9408-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=3qSq0ZgSYyFQdhkNKKx+ay2VTuWMWagkFjN44scFJGI=; b=Hj7ctWdUPYGChKSXbjiG3ceuLC
	qJJdvlVYftwJ0JmFiiq7KgA3kS4RlnIA/MDhNrvJyEEBExXyzpZoszMTkmDa/0AcbWk3X3RegC55V
	7demvhkD/2Vm6MNZiLt23BUpT9dBqEkmj0CKPAbAJm+oIUuXhDVeLjwJaZkW3WPEmdGuSLkwjyd9+
	YyBHijcvKAnO2bAVJAUvyMRdWxJKRyTYJ1uvpasFg0q82cLUXzhXq4Wu/L7v1jx64IWttFDdMu/ca
	3J1JyfBFyObPGWrCPbNdP80bglMjq75SOxMB3QIX6GX/sagc2ovosgUjghAazuSh7ZC/geNc3PWxS
	jsvebKrQ==;
Date: Tue, 5 Dec 2023 23:20:26 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Yu Kuai <yukuai1@huaweicloud.com>
Cc: Christoph Hellwig <hch@infradead.org>, axboe@kernel.dk,
	roger.pau@citrix.com, colyli@suse.de, kent.overstreet@gmail.com,
	joern@lazybastard.org, miquel.raynal@bootlin.com, richard@nod.at,
	vigneshr@ti.com, sth@linux.ibm.com, hoeppner@linux.ibm.com,
	hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com,
	jejb@linux.ibm.com, martin.petersen@oracle.com, clm@fb.com,
	josef@toxicpanda.com, dsterba@suse.com, nico@fluxnic.net,
	xiang@kernel.org, chao@kernel.org, tytso@mit.edu,
	adilger.kernel@dilger.ca, agruenba@redhat.com, jack@suse.com,
	konishi.ryusuke@gmail.com, willy@infradead.org,
	akpm@linux-foundation.org, hare@suse.de, p.raghav@samsung.com,
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org, linux-bcache@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org, linux-bcachefs@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	linux-ext4@vger.kernel.org, gfs2@lists.linux.dev,
	linux-nilfs@vger.kernel.org, yi.zhang@huawei.com,
	yangerkun@huawei.com, "yukuai (C)" <yukuai3@huawei.com>
Subject: Re: [PATCH -next RFC 01/14] block: add some bdev apis
Message-ID: <ZXAgut2MTKw50OLI@infradead.org>
References: <20231205123728.1866699-1-yukuai1@huaweicloud.com>
 <20231205123728.1866699-2-yukuai1@huaweicloud.com>
 <ZXARKD0OmjLrvHmU@infradead.org>
 <aafabc6e-fd98-f927-44d7-3ef76e2acaf8@huaweicloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aafabc6e-fd98-f927-44d7-3ef76e2acaf8@huaweicloud.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Wed, Dec 06, 2023 at 02:50:56PM +0800, Yu Kuai wrote:
> I'm a litter confused, so there are 3 use cases:
> 1) use GFP_USER, default gfp from bdev_alloc.
> 2) use GFP_KERNEL
> 3) use GFP_NOFS
> 
> I understand that you're suggesting memalloc_nofs_save() to distinguish
> 2 and 3, but how can I distinguish 1?

You shouldn't.  Diverging from the default flags except for clearing
the FS or IO flags is simply a bug.  Note that things like block2mtd
should probably also ensure a noio allocation if they aren't doing that
yet.

> >   - use memalloc_nofs_save in extet instead of using
> >     mapping_gfp_constraint to clear it from the mapping flags
> >   - remove __ext4_sb_bread_gfp and just have buffer.c helper that does
> >     the right thing (either by changing the calling conventions of an
> >     existing one, or adding a new one).
> 
> Thanks for the suggestions, but I'm not sure how to do this yet, I must
> read more ext4 code.

the nofs save part should be trivial.  You can just skip the rest for
now as it's not needed for this patch series.


