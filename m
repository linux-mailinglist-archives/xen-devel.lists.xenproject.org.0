Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A6C889FEBA
	for <lists+xen-devel@lfdr.de>; Wed, 10 Apr 2024 19:37:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.703516.1099156 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rubro-0007ny-Sb; Wed, 10 Apr 2024 17:36:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 703516.1099156; Wed, 10 Apr 2024 17:36:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rubro-0007lg-Q0; Wed, 10 Apr 2024 17:36:12 +0000
Received: by outflank-mailman (input) for mailman id 703516;
 Wed, 10 Apr 2024 17:36:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NMnl=LP=suse.cz=dsterba@srs-se1.protection.inumbo.net>)
 id 1rubrm-0007lU-DQ
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2024 17:36:10 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d046695a-f760-11ee-94a3-07e782e9044d;
 Wed, 10 Apr 2024 19:36:08 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3395033A89;
 Wed, 10 Apr 2024 17:36:07 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EFAAD13691;
 Wed, 10 Apr 2024 17:36:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 20hgOgbOFmZrWQAAD6G6ig
 (envelope-from <dsterba@suse.cz>); Wed, 10 Apr 2024 17:36:06 +0000
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
X-Inumbo-ID: d046695a-f760-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1712770567;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0ZHHE5aOwQ1Ezn/ab1buAuDtcCLPcpIIchKLIUxoBbM=;
	b=Wo/su6uxAz3KDCet7sG1IMbLmZNu/s492NxBN+stUG6oo2qYtuABn+4iFfLZA7KwEty81H
	IdrOqxowTjwdMcGmvVJuVhd3KhUwlHGwlvUKUWet7620GxVeKx3CiehY9/HodlAMarXBGu
	QKA3ILsUtN07gfz8aoS5W8ffx3zw7mU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1712770567;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0ZHHE5aOwQ1Ezn/ab1buAuDtcCLPcpIIchKLIUxoBbM=;
	b=pwQ8usD0NAyGD6U1k6UXV+bVfsviAAMcwHC0rXMTXFxYTDSQht5I5OMD0LYFtofyWnG5ZB
	JIolcEC5hlnuCvCg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1712770567;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0ZHHE5aOwQ1Ezn/ab1buAuDtcCLPcpIIchKLIUxoBbM=;
	b=Wo/su6uxAz3KDCet7sG1IMbLmZNu/s492NxBN+stUG6oo2qYtuABn+4iFfLZA7KwEty81H
	IdrOqxowTjwdMcGmvVJuVhd3KhUwlHGwlvUKUWet7620GxVeKx3CiehY9/HodlAMarXBGu
	QKA3ILsUtN07gfz8aoS5W8ffx3zw7mU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1712770567;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0ZHHE5aOwQ1Ezn/ab1buAuDtcCLPcpIIchKLIUxoBbM=;
	b=pwQ8usD0NAyGD6U1k6UXV+bVfsviAAMcwHC0rXMTXFxYTDSQht5I5OMD0LYFtofyWnG5ZB
	JIolcEC5hlnuCvCg==
Date: Wed, 10 Apr 2024 19:28:37 +0200
From: David Sterba <dsterba@suse.cz>
To: Jan Kara <jack@suse.cz>
Cc: Matthew Wilcox <willy@infradead.org>, Yu Kuai <yukuai1@huaweicloud.com>,
	axboe@kernel.dk, roger.pau@citrix.com, colyli@suse.de,
	kent.overstreet@gmail.com, joern@lazybastard.org,
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	sth@linux.ibm.com, hoeppner@linux.ibm.com, hca@linux.ibm.com,
	gor@linux.ibm.com, agordeev@linux.ibm.com, jejb@linux.ibm.com,
	martin.petersen@oracle.com, clm@fb.com, josef@toxicpanda.com,
	dsterba@suse.com, viro@zeniv.linux.org.uk, brauner@kernel.org,
	nico@fluxnic.net, xiang@kernel.org, chao@kernel.org, tytso@mit.edu,
	adilger.kernel@dilger.ca, jack@suse.com, konishi.ryusuke@gmail.com,
	akpm@linux-foundation.org, hare@suse.de, p.raghav@samsung.com,
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org, linux-bcache@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org, linux-bcachefs@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, linux-ext4@vger.kernel.org,
	linux-nilfs@vger.kernel.org, yukuai3@huawei.com,
	yi.zhang@huawei.com, yangerkun@huawei.com
Subject: Re: [PATCH RFC v3 for-6.8/block 09/17] btrfs: use bdev apis
Message-ID: <20240410172837.GO3492@suse.cz>
Reply-To: dsterba@suse.cz
References: <20231221085712.1766333-1-yukuai1@huaweicloud.com>
 <20231221085712.1766333-10-yukuai1@huaweicloud.com>
 <ZYcZi5YYvt5QHrG9@casper.infradead.org>
 <20240104114958.f3cit5q7syp3tn3a@quack3>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240104114958.f3cit5q7syp3tn3a@quack3>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
X-Spam-Flag: NO
X-Spam-Score: -2.50
X-Spam-Level: 
X-Spamd-Result: default: False [-2.50 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	HAS_REPLYTO(0.30)[dsterba@suse.cz];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[49];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLtpaten8pmzgjg419jubxqoa7)];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[infradead.org,huaweicloud.com,kernel.dk,citrix.com,suse.de,gmail.com,lazybastard.org,bootlin.com,nod.at,ti.com,linux.ibm.com,oracle.com,fb.com,toxicpanda.com,suse.com,zeniv.linux.org.uk,kernel.org,fluxnic.net,mit.edu,dilger.ca,linux-foundation.org,samsung.com,vger.kernel.org,lists.xenproject.org,lists.infradead.org,lists.ozlabs.org,huawei.com];
	RCVD_COUNT_TWO(0.00)[2];
	TAGGED_RCPT(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]

On Thu, Jan 04, 2024 at 12:49:58PM +0100, Jan Kara wrote:
> On Sat 23-12-23 17:31:55, Matthew Wilcox wrote:
> > On Thu, Dec 21, 2023 at 04:57:04PM +0800, Yu Kuai wrote:
> > > @@ -3674,16 +3670,17 @@ struct btrfs_super_block *btrfs_read_dev_one_super(struct block_device *bdev,
> > >  		 * Drop the page of the primary superblock, so later read will
> > >  		 * always read from the device.
> > >  		 */
> > > -		invalidate_inode_pages2_range(mapping,
> > > -				bytenr >> PAGE_SHIFT,
> > > +		invalidate_bdev_range(bdev, bytenr >> PAGE_SHIFT,
> > >  				(bytenr + BTRFS_SUPER_INFO_SIZE) >> PAGE_SHIFT);
> > >  	}
> > >  
> > > -	page = read_cache_page_gfp(mapping, bytenr >> PAGE_SHIFT, GFP_NOFS);
> > > -	if (IS_ERR(page))
> > > -		return ERR_CAST(page);
> > > +	nofs_flag = memalloc_nofs_save();
> > > +	folio = bdev_read_folio(bdev, bytenr);
> > > +	memalloc_nofs_restore(nofs_flag);
> > 
> > This is the wrong way to use memalloc_nofs_save/restore.  They should be
> > used at the point that the filesystem takes/releases whatever lock is
> > also used during reclaim.  I don't know btrfs well enough to suggest
> > what lock is missing these annotations.
> 
> In principle I agree with you but in this particular case I agree the ask
> is just too big. I suspect it is one of btrfs btree locks or maybe
> chunk_mutex but I doubt even btrfs developers know and maybe it is just a
> cargo cult. And it is not like this would be the first occurence of this
> anti-pattern in btrfs - see e.g. device_list_add(), add_missing_dev(),
> btrfs_destroy_delalloc_inodes() (here the wrapping around
> invalidate_inode_pages2() looks really weird), and many others...

The pattern is intentional and a temporary solution before we could
implement the scoped NOFS. Functions calling allocations get converted
from GFP_NOFS to GFP_KERNEL but in case they're called from a context
that either holds big locks or can recursively enter the filesystem then
it's protected by the memalloc calls. This should not be surprising.
What may not be obvious is which locks or kmalloc calling functions it
could be, this depends on the analysis of the function call chain and
usually there's enough evidence why it's needed.

