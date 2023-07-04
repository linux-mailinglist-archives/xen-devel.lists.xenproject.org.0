Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7668A74721D
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jul 2023 15:04:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558343.872347 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGfhI-0004NC-Kh; Tue, 04 Jul 2023 13:04:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558343.872347; Tue, 04 Jul 2023 13:04:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGfhI-0004Kd-HL; Tue, 04 Jul 2023 13:04:00 +0000
Received: by outflank-mailman (input) for mailman id 558343;
 Tue, 04 Jul 2023 13:03:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fUi4=CW=suse.cz=jack@srs-se1.protection.inumbo.net>)
 id 1qGfhH-0004KR-A7
 for xen-devel@lists.xenproject.org; Tue, 04 Jul 2023 13:03:59 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3cb022d0-1a6b-11ee-b237-6b7b168915f2;
 Tue, 04 Jul 2023 15:03:58 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id F0F5F20573;
 Tue,  4 Jul 2023 13:03:56 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DC3001346D;
 Tue,  4 Jul 2023 13:03:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id kueeNbwYpGTARwAAMHmgww
 (envelope-from <jack@suse.cz>); Tue, 04 Jul 2023 13:03:56 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 6B4A7A0722; Tue,  4 Jul 2023 15:03:56 +0200 (CEST)
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
X-Inumbo-ID: 3cb022d0-1a6b-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1688475837; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rY6MxLY5e9SVa1+4BCCd7ntNwV9Px5uEGT5nvi2Xw9M=;
	b=ejRwbAIwZQbMrOxksN9aG/ZDDESpKoHA5R/d85WHYyhF32Si43PFRfl6mcCR9WYB3Qv5Xb
	bFzVFYQ3692eypLdUzJN5qIXY9S2kweTJplS9sF53SAyJ7HvtNyhlweUs2wFtrS+zKSTOj
	TegqbmWrWk4Vs0DZGSAEKRmheCwdTpE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1688475837;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rY6MxLY5e9SVa1+4BCCd7ntNwV9Px5uEGT5nvi2Xw9M=;
	b=T7VmytPRSDJUviPwV6lejrGCKn7KjlWBXNR5Weqcyul/51HqsbD9tiSRFlJo/bbQX+dGnV
	08LOGAmrpvM1ddAQ==
Date: Tue, 4 Jul 2023 15:03:56 +0200
From: Jan Kara <jack@suse.cz>
To: Matthew Wilcox <willy@infradead.org>
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
Message-ID: <20230704130356.xwdlxvgvi4l6sruc@quack3>
References: <20230629165206.383-1-jack@suse.cz>
 <20230704122224.16257-1-jack@suse.cz>
 <ZKQUB4rU8Gebhq6R@casper.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZKQUB4rU8Gebhq6R@casper.infradead.org>

On Tue 04-07-23 13:43:51, Matthew Wilcox wrote:
> On Tue, Jul 04, 2023 at 02:21:28PM +0200, Jan Kara wrote:
> > +struct bdev_handle *blkdev_get_handle_by_dev(dev_t dev, blk_mode_t mode,
> > +		void *holder, const struct blk_holder_ops *hops)
> > +{
> > +	struct bdev_handle *handle = kmalloc(sizeof(struct bdev_handle),
> > +					     GFP_KERNEL);
> > +	struct block_device *bdev;
> > +
> > +	if (!handle)
> > +		return ERR_PTR(-ENOMEM);
> > +	bdev = blkdev_get_by_dev(dev, mode, holder, hops);
> > +	if (IS_ERR(bdev))
> > +		return ERR_CAST(bdev);
> 
> Would we be better off with a handle->error (and a NULL return from this
> function means "we couldn't allocate a handle")?  I have no objection
> to what you've done here, just wondering if it might end up nicer for
> the users.

Hum, I've checked a couple of users and it seems it would be more
complicated for the users to handle this convention than the one I've
chosen. And that one is also pretty standard so I think by the principle of
least surprise it is also better.

								Honza

> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

