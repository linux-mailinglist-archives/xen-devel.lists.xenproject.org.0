Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1990A748902
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jul 2023 18:12:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559414.874368 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH57F-00008p-Kv; Wed, 05 Jul 2023 16:12:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559414.874368; Wed, 05 Jul 2023 16:12:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH57F-00005d-IA; Wed, 05 Jul 2023 16:12:29 +0000
Received: by outflank-mailman (input) for mailman id 559414;
 Wed, 05 Jul 2023 16:12:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Sl8t=CX=suse.cz=jack@srs-se1.protection.inumbo.net>)
 id 1qH57E-00005T-DD
 for xen-devel@lists.xenproject.org; Wed, 05 Jul 2023 16:12:28 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bb92eaad-1b4e-11ee-b237-6b7b168915f2;
 Wed, 05 Jul 2023 18:12:26 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id CB46921E20;
 Wed,  5 Jul 2023 16:12:25 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A8D5D134F3;
 Wed,  5 Jul 2023 16:12:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id p7ssKWmWpWRbQAAAMHmgww
 (envelope-from <jack@suse.cz>); Wed, 05 Jul 2023 16:12:25 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 1C3A6A0707; Wed,  5 Jul 2023 18:12:25 +0200 (CEST)
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
X-Inumbo-ID: bb92eaad-1b4e-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1688573545; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=laJnl7HhQK/Tv/PqzUYoidR/wXDE+WAIJVPIFf2lcfQ=;
	b=pVxtRSYxDum30xk4c2JQyuaRHFNvjqGI5pa+1l9TjK2H7ROMjo7EdIGdDlzQXwaIwGyi0D
	MYHnvgKqRst/eyFC+Okrc961iU1V/Mr8qyrvjiZzwHXWReUpWSrhSFOpe79t3kyTfJeQAV
	Hf2p1cnNnsYhDEREwuHH1JI7foWXj1M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1688573545;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=laJnl7HhQK/Tv/PqzUYoidR/wXDE+WAIJVPIFf2lcfQ=;
	b=6GnGLv2MGHnmlspZbI9IPcwZjE0UgNGbJUyuJME/ujhWk8XPp6xGrnnDrvfBxv6bSto5fw
	0j8hz2dNTzGg/WAQ==
Date: Wed, 5 Jul 2023 18:12:25 +0200
From: Jan Kara <jack@suse.cz>
To: Bart Van Assche <bvanassche@acm.org>
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
Message-ID: <20230705161225.cwig5a3mo6oz7lew@quack3>
References: <20230629165206.383-1-jack@suse.cz>
 <20230704122224.16257-1-jack@suse.cz>
 <bb91e76b-0bd8-a949-f8b9-868f919ebcb9@acm.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bb91e76b-0bd8-a949-f8b9-868f919ebcb9@acm.org>

On Tue 04-07-23 07:06:26, Bart Van Assche wrote:
> On 7/4/23 05:21, Jan Kara wrote:
> > +struct bdev_handle {
> > +	struct block_device *bdev;
> > +	void *holder;
> > +};
> 
> Please explain in the patch description why a holder pointer is introduced
> in struct bdev_handle and how it relates to the bd_holder pointer in struct
> block_device. Is one of the purposes of this patch series perhaps to add
> support for multiple holders per block device?

No. The reason for adding holder to struct bdev_handle is that it is an
argument blkdev_put() needs. Currently, every user of blkdev_put() has to
remember what it has passed as 'holder' to blkdev_get_by_*() call and pass
that to blkdev_put(). With struct bdev_handle this will happen
automatically. This is already explained in the changelog of this patch:

"Create struct bdev_handle that contains all parameters that need to be
passed to blkdev_put()..."

If it was only about holder, the intrusive patches would not be warranted
but as the description also says:

"This will eventually allow us to pass one more argument to blkdev_put()
without too much hassle."

Because we will additionaly need to propagate the 'mode' argument used at
open to blkdev_put().

								Honza

-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

