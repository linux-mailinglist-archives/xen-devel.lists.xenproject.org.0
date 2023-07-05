Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C61BE7481FD
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jul 2023 12:21:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559029.873687 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGzdc-0002sU-85; Wed, 05 Jul 2023 10:21:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559029.873687; Wed, 05 Jul 2023 10:21:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGzdc-0002pw-4o; Wed, 05 Jul 2023 10:21:32 +0000
Received: by outflank-mailman (input) for mailman id 559029;
 Wed, 05 Jul 2023 10:21:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Sl8t=CX=suse.cz=jack@srs-se1.protection.inumbo.net>)
 id 1qGzda-0002n0-Hu
 for xen-devel@lists.xenproject.org; Wed, 05 Jul 2023 10:21:30 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b4d6a8be-1b1d-11ee-b237-6b7b168915f2;
 Wed, 05 Jul 2023 12:21:29 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 58F0C1F6E6;
 Wed,  5 Jul 2023 10:21:29 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 44C0D13460;
 Wed,  5 Jul 2023 10:21:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Xem5EClEpWRSCwAAMHmgww
 (envelope-from <jack@suse.cz>); Wed, 05 Jul 2023 10:21:29 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id C5467A0707; Wed,  5 Jul 2023 12:21:28 +0200 (CEST)
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
X-Inumbo-ID: b4d6a8be-1b1d-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1688552489; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qqER76PXnxWxMVZH46uY+IP0A7ISNxa4dFOpqm8Npig=;
	b=rK+eFTza2+XXgbRvOv5tQtV93F/4zZpu7norREAepZy5yow7baD/dvvqWhpeeItBt0IPcu
	Y5rwLWutv/on4mwv5EJraqTeqhb05mRkTW0yYXikGz/UA9AQcATVDIgxrBuvXRHMAszN6R
	RSIAN/j2D8s9RJrt3/Umhb+lT3pvazU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1688552489;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qqER76PXnxWxMVZH46uY+IP0A7ISNxa4dFOpqm8Npig=;
	b=0Ik5A3faiNr6MKUo0ZlFf0SVDy0zGGeX4x6PTOEnPlUJVjHk96v3tsbq/TGqKcufwhGJGx
	3sf2EXg0rHzUTICQ==
Date: Wed, 5 Jul 2023 12:21:28 +0200
From: Jan Kara <jack@suse.cz>
To: Keith Busch <kbusch@kernel.org>
Cc: Jan Kara <jack@suse.cz>, linux-block@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@infradead.org>,
	Alasdair Kergon <agk@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Anna Schumaker <anna@kernel.org>, Chao Yu <chao@kernel.org>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	"Darrick J. Wong" <djwong@kernel.org>,
	Dave Kleikamp <shaggy@kernel.org>, David Sterba <dsterba@suse.com>,
	dm-devel@redhat.com, drbd-dev@lists.linbit.com,
	Gao Xiang <xiang@kernel.org>, Jack Wang <jinpu.wang@ionos.com>,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	jfs-discussion@lists.sourceforge.net,
	Joern Engel <joern@lazybastard.org>,
	Joseph Qi <joseph.qi@linux.alibaba.com>,
	Kent Overstreet <kent.overstreet@gmail.com>,
	linux-bcache@vger.kernel.org, linux-btrfs@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, linux-ext4@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, linux-mm@kvack.org,
	linux-mtd@lists.infradead.org, linux-nfs@vger.kernel.org,
	linux-nilfs@vger.kernel.org, linux-nvme@lists.infradead.org,
	linux-pm@vger.kernel.org, linux-raid@vger.kernel.org,
	linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org,
	linux-xfs@vger.kernel.org,
	"Md. Haris Iqbal" <haris.iqbal@ionos.com>,
	Mike Snitzer <snitzer@kernel.org>, Minchan Kim <minchan@kernel.org>,
	ocfs2-devel@oss.oracle.com, reiserfs-devel@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Song Liu <song@kernel.org>, Sven Schnelle <svens@linux.ibm.com>,
	target-devel@vger.kernel.org, Ted Tso <tytso@mit.edu>,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 01/32] block: Provide blkdev_get_handle_* functions
Message-ID: <20230705102128.vquve4qencbbn2br@quack3>
References: <20230629165206.383-1-jack@suse.cz>
 <20230704122224.16257-1-jack@suse.cz>
 <ZKRItBRhm8f5Vba/@kbusch-mbp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZKRItBRhm8f5Vba/@kbusch-mbp>

On Tue 04-07-23 10:28:36, Keith Busch wrote:
> On Tue, Jul 04, 2023 at 02:21:28PM +0200, Jan Kara wrote:
> > +struct bdev_handle *blkdev_get_handle_by_dev(dev_t dev, blk_mode_t mode,
> > +		void *holder, const struct blk_holder_ops *hops)
> > +{
> > +	struct bdev_handle *handle = kmalloc(sizeof(struct bdev_handle),
> > +					     GFP_KERNEL);
> 
> I believe 'sizeof(*handle)' is the preferred style.

OK.

> > +	struct block_device *bdev;
> > +
> > +	if (!handle)
> > +		return ERR_PTR(-ENOMEM);
> > +	bdev = blkdev_get_by_dev(dev, mode, holder, hops);
> > +	if (IS_ERR(bdev))
> > +		return ERR_CAST(bdev);
> 
> Need a 'kfree(handle)' before the error return. Or would it be simpler
> to get the bdev first so you can check the mode settings against a
> read-only bdev prior to the kmalloc?

Yeah. Good point with kfree(). I'm not sure calling blkdev_get_by_dev()
first will be "simpler" - then we need blkdev_put() in case of kmalloc()
failure. Thanks for review!
 
								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

