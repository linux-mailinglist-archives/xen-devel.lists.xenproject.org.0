Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B642680ED72
	for <lists+xen-devel@lfdr.de>; Tue, 12 Dec 2023 14:26:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.653137.1019424 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD2lv-000465-7n; Tue, 12 Dec 2023 13:26:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 653137.1019424; Tue, 12 Dec 2023 13:26:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD2lv-00043f-5B; Tue, 12 Dec 2023 13:26:03 +0000
Received: by outflank-mailman (input) for mailman id 653137;
 Tue, 12 Dec 2023 13:26:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O/80=HX=bombadil.srs.infradead.org=BATV+6f90c2f2ff3264e7ff81+7415+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1rD2lt-00043Z-SB
 for xen-devel@lists.xenproject.org; Tue, 12 Dec 2023 13:26:01 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:3::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fd67a8d8-98f1-11ee-98e8-6d05b1d4d9a1;
 Tue, 12 Dec 2023 14:26:01 +0100 (CET)
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1rD2lJ-00BnAr-2I; Tue, 12 Dec 2023 13:25:25 +0000
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
X-Inumbo-ID: fd67a8d8-98f1-11ee-98e8-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=b0EJSjGbwEr2b4Ml7A+chJ8+pEiLc4/B8ooSTDiYxzk=; b=picipgXFbvzoUhEoBG/zPnQX1q
	HE6smIRBy5a89R9akhr+qXOZgV2ZWsX5XPLxtAEgCavvFg2RD1Nd4bY6y3UtqlfS5bvjWd1FYs03a
	CEKxQcI96bW9kVZcHP+cYaV8hEgMc7fElg/c9Fc75ryish62M2PDTmzUmPs5fvjFZ8ka06osdMRpf
	ASMKxc6mHhCj37Uwwthec0X8EOQOG/hGGGWoR9QRV2Bnh4w97sL+F2xaXO4b3Qr1y31RDun14/d27
	LpamT9Qvnaapt6jca0mzWu9EovPM8+74IynFRKTN08S2sDe2pXO4Td8t8oHiM29FNbbe9flIcdz3n
	3xcYUrag==;
Date: Tue, 12 Dec 2023 05:25:25 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Yu Kuai <yukuai1@huaweicloud.com>
Cc: axboe@kernel.dk, roger.pau@citrix.com, colyli@suse.de,
	kent.overstreet@gmail.com, joern@lazybastard.org,
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	sth@linux.ibm.com, hoeppner@linux.ibm.com, hca@linux.ibm.com,
	gor@linux.ibm.com, agordeev@linux.ibm.com, jejb@linux.ibm.com,
	martin.petersen@oracle.com, clm@fb.com, josef@toxicpanda.com,
	dsterba@suse.com, viro@zeniv.linux.org.uk, brauner@kernel.org,
	nico@fluxnic.net, xiang@kernel.org, chao@kernel.org, tytso@mit.edu,
	adilger.kernel@dilger.ca, agruenba@redhat.com, jack@suse.com,
	konishi.ryusuke@gmail.com, willy@infradead.org,
	akpm@linux-foundation.org, p.raghav@samsung.com, hare@suse.de,
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org, linux-bcache@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org, linux-bcachefs@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, linux-ext4@vger.kernel.org,
	gfs2@lists.linux.dev, linux-nilfs@vger.kernel.org,
	yukuai3@huawei.com, yi.zhang@huawei.com, yangerkun@huawei.com
Subject: Re: [PATCH RFC v2 for-6.8/block 15/18] buffer: add a new helper to
 read sb block
Message-ID: <ZXhfRdocHfrViOos@infradead.org>
References: <20231211140552.973290-1-yukuai1@huaweicloud.com>
 <20231211140753.975297-1-yukuai1@huaweicloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231211140753.975297-1-yukuai1@huaweicloud.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Mon, Dec 11, 2023 at 10:07:53PM +0800, Yu Kuai wrote:
> +static __always_inline int buffer_uptodate_or_error(struct buffer_head *bh)
> +{
> +	/*
> +	 * If the buffer has the write error flag, data was failed to write
> +	 * out in the block. In this case, set buffer uptodate to prevent
> +	 * reading old data.
> +	 */
> +	if (buffer_write_io_error(bh))
> +		set_buffer_uptodate(bh);
> +	return buffer_uptodate(bh);
> +}

So - risking this blows up into a lot of nasty work: Why do we even
clear the uptodate flag on write errors?  Doing so makes not sense to
me as the data isn't any less uptodate just because we failed to write
it..


