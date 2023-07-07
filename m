Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC52974B0AC
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jul 2023 14:25:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.560487.876433 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHkVs-0006uj-GQ; Fri, 07 Jul 2023 12:24:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 560487.876433; Fri, 07 Jul 2023 12:24:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHkVs-0006rY-Cx; Fri, 07 Jul 2023 12:24:40 +0000
Received: by outflank-mailman (input) for mailman id 560487;
 Fri, 07 Jul 2023 12:24:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AlIE=CZ=suse.cz=jack@srs-se1.protection.inumbo.net>)
 id 1qHkVq-0006rS-LI
 for xen-devel@lists.xenproject.org; Fri, 07 Jul 2023 12:24:38 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3bf22e9f-1cc1-11ee-b237-6b7b168915f2;
 Fri, 07 Jul 2023 14:24:35 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id F0C8D1FDB5;
 Fri,  7 Jul 2023 12:24:34 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D97F7139E0;
 Fri,  7 Jul 2023 12:24:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id rMQMNQIEqGT9NgAAMHmgww
 (envelope-from <jack@suse.cz>); Fri, 07 Jul 2023 12:24:34 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 6AC15A0717; Fri,  7 Jul 2023 14:24:34 +0200 (CEST)
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
X-Inumbo-ID: 3bf22e9f-1cc1-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1688732675; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=v97Z4h87RrabL7WLNBXHFysNCdL5KIt8mtxxyrwI0lE=;
	b=LqFRs1c1G67BsNNDLuNq3gTOMo8UAqFT+ZgX0/ce2GYyjoNTkNY3JvymPyQUIIgvdCfdfA
	wvYabjfbqON86k1PsUxAyhGKf+BANbZ0orxg0fUOS7bjyZ5ddpTiVyICESJEtA4U8iKIIb
	0Zu9Qq9rWpT0jHo3EjIE5diazY1476M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1688732675;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=v97Z4h87RrabL7WLNBXHFysNCdL5KIt8mtxxyrwI0lE=;
	b=WsVzOxtNAjI8cmGR5IMHwFDPJM5ZBawTTSTtFHjjnpb4nomNuwaP8lcoennzww9M9DfIc5
	k35MoJGFDmLh3vBw==
Date: Fri, 7 Jul 2023 14:24:34 +0200
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@infradead.org>
Cc: Jan Kara <jack@suse.cz>, linux-block@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
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
Message-ID: <20230707122434.s46ytxpne42hecni@quack3>
References: <20230629165206.383-1-jack@suse.cz>
 <20230704122224.16257-1-jack@suse.cz>
 <ZKbgAG5OoHVyUKOG@infradead.org>
 <20230706161433.lj4apushiwguzvdd@quack3>
 <ZKf26fYMDHnTCb29@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZKf26fYMDHnTCb29@infradead.org>

On Fri 07-07-23 04:28:41, Christoph Hellwig wrote:
> On Thu, Jul 06, 2023 at 06:14:33PM +0200, Jan Kara wrote:
> > > struct bdev_handle *bdev_open_by_path(dev_t dev, blk_mode_t mode,
> > > 		void *holder, const struct blk_holder_ops *hops);
> > > void bdev_release(struct bdev_handle *handle);
> > 
> > I'd maybe use bdev_close() instead of bdev_release() but otherwise I like
> > the new naming.
> 
> We're using release everywhese else, but if Jens is fine with that I
> can live with close.

Dunno, to me words pair like open-close, get-put, acquire-release.
Furthermore e.g. ->release() (and thus blkdev_release()) is called only
when the last file reference is dropped, not when each reference is
dropped, so that's why bdev_release() seems a bit confusing to me.

								Honza

-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

