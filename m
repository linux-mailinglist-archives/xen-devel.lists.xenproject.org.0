Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBBB7824105
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jan 2024 12:50:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.661662.1031355 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLMEh-0003Fe-SC; Thu, 04 Jan 2024 11:50:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 661662.1031355; Thu, 04 Jan 2024 11:50:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLMEh-0003Co-OX; Thu, 04 Jan 2024 11:50:07 +0000
Received: by outflank-mailman (input) for mailman id 661662;
 Thu, 04 Jan 2024 11:50:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BdYS=IO=suse.cz=jack@srs-se1.protection.inumbo.net>)
 id 1rLMEg-0003Cg-EZ
 for xen-devel@lists.xenproject.org; Thu, 04 Jan 2024 11:50:06 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 65e1655e-aaf7-11ee-9b0f-b553b5be7939;
 Thu, 04 Jan 2024 12:50:04 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 160C121EF5;
 Thu,  4 Jan 2024 11:50:03 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 05B81137E8;
 Thu,  4 Jan 2024 11:50:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id N5lgAWublmUQDAAAD6G6ig
 (envelope-from <jack@suse.cz>); Thu, 04 Jan 2024 11:50:03 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id A9CF6A07EF; Thu,  4 Jan 2024 12:49:58 +0100 (CET)
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
X-Inumbo-ID: 65e1655e-aaf7-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1704369003; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XeXpcnQhc7k5wPj1KeDdzxd8IqzZglYqdEMHG+1v698=;
	b=LPy9kLPa52w1LTjGtPYNG0ddRTaUsK2l/chyWjlrzN9YlPHEcnuQYee5oABFJTvAftkB9q
	FjI0zQ5uCaFFznkd94synnqXs7uXb8cRAAI7EO6ytDym9jLmWBPX0BO4sb7N9wbnW2+LFu
	0aOzGcbzAFq+5BQ61moeUz08HE5ZlKs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1704369003;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XeXpcnQhc7k5wPj1KeDdzxd8IqzZglYqdEMHG+1v698=;
	b=RfDu2tLAXy86TXl7DP8sQxwxqulz8lo88WAB157ByWrDk4aXKD88/w5gosTD/z+q/d5Hzm
	g3+FRHbpwvRn6XCg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1704369003; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XeXpcnQhc7k5wPj1KeDdzxd8IqzZglYqdEMHG+1v698=;
	b=LPy9kLPa52w1LTjGtPYNG0ddRTaUsK2l/chyWjlrzN9YlPHEcnuQYee5oABFJTvAftkB9q
	FjI0zQ5uCaFFznkd94synnqXs7uXb8cRAAI7EO6ytDym9jLmWBPX0BO4sb7N9wbnW2+LFu
	0aOzGcbzAFq+5BQ61moeUz08HE5ZlKs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1704369003;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XeXpcnQhc7k5wPj1KeDdzxd8IqzZglYqdEMHG+1v698=;
	b=RfDu2tLAXy86TXl7DP8sQxwxqulz8lo88WAB157ByWrDk4aXKD88/w5gosTD/z+q/d5Hzm
	g3+FRHbpwvRn6XCg==
Date: Thu, 4 Jan 2024 12:49:58 +0100
From: Jan Kara <jack@suse.cz>
To: Matthew Wilcox <willy@infradead.org>
Cc: Yu Kuai <yukuai1@huaweicloud.com>, axboe@kernel.dk,
	roger.pau@citrix.com, colyli@suse.de, kent.overstreet@gmail.com,
	joern@lazybastard.org, miquel.raynal@bootlin.com, richard@nod.at,
	vigneshr@ti.com, sth@linux.ibm.com, hoeppner@linux.ibm.com,
	hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com,
	jejb@linux.ibm.com, martin.petersen@oracle.com, clm@fb.com,
	josef@toxicpanda.com, dsterba@suse.com, viro@zeniv.linux.org.uk,
	brauner@kernel.org, nico@fluxnic.net, xiang@kernel.org,
	chao@kernel.org, tytso@mit.edu, adilger.kernel@dilger.ca,
	jack@suse.com, konishi.ryusuke@gmail.com, akpm@linux-foundation.org,
	hare@suse.de, p.raghav@samsung.com, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
	linux-bcache@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org,
	linux-bcachefs@vger.kernel.org, linux-btrfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	linux-ext4@vger.kernel.org, linux-nilfs@vger.kernel.org,
	yukuai3@huawei.com, yi.zhang@huawei.com, yangerkun@huawei.com
Subject: Re: [PATCH RFC v3 for-6.8/block 09/17] btrfs: use bdev apis
Message-ID: <20240104114958.f3cit5q7syp3tn3a@quack3>
References: <20231221085712.1766333-1-yukuai1@huaweicloud.com>
 <20231221085712.1766333-10-yukuai1@huaweicloud.com>
 <ZYcZi5YYvt5QHrG9@casper.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZYcZi5YYvt5QHrG9@casper.infradead.org>
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: 1.65
X-Spamd-Bar: +
X-Spam-Flag: NO
X-Spamd-Result: default: False [1.65 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	 BAYES_HAM(-0.04)[57.99%];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 TAGGED_RCPT(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 R_RATELIMIT(0.00)[to_ip_from(RLhr85cyeg3mfw7iggddtjdkgs)];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	 DKIM_TRACE(0.00)[suse.cz:+];
	 MX_GOOD(-0.01)[];
	 RCPT_COUNT_TWELVE(0.00)[48];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.cz:dkim];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 MID_RHS_NOT_FQDN(0.50)[];
	 FREEMAIL_CC(0.00)[huaweicloud.com,kernel.dk,citrix.com,suse.de,gmail.com,lazybastard.org,bootlin.com,nod.at,ti.com,linux.ibm.com,oracle.com,fb.com,toxicpanda.com,suse.com,zeniv.linux.org.uk,kernel.org,fluxnic.net,mit.edu,dilger.ca,linux-foundation.org,samsung.com,vger.kernel.org,lists.xenproject.org,lists.infradead.org,lists.ozlabs.org,huawei.com];
	 RCVD_TLS_ALL(0.00)[];
	 SUSPICIOUS_RECIPS(1.50)[];
	 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=LPy9kLPa;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=RfDu2tLA
X-Spam-Level: *
X-Rspamd-Queue-Id: 160C121EF5

On Sat 23-12-23 17:31:55, Matthew Wilcox wrote:
> On Thu, Dec 21, 2023 at 04:57:04PM +0800, Yu Kuai wrote:
> > @@ -3674,16 +3670,17 @@ struct btrfs_super_block *btrfs_read_dev_one_super(struct block_device *bdev,
> >  		 * Drop the page of the primary superblock, so later read will
> >  		 * always read from the device.
> >  		 */
> > -		invalidate_inode_pages2_range(mapping,
> > -				bytenr >> PAGE_SHIFT,
> > +		invalidate_bdev_range(bdev, bytenr >> PAGE_SHIFT,
> >  				(bytenr + BTRFS_SUPER_INFO_SIZE) >> PAGE_SHIFT);
> >  	}
> >  
> > -	page = read_cache_page_gfp(mapping, bytenr >> PAGE_SHIFT, GFP_NOFS);
> > -	if (IS_ERR(page))
> > -		return ERR_CAST(page);
> > +	nofs_flag = memalloc_nofs_save();
> > +	folio = bdev_read_folio(bdev, bytenr);
> > +	memalloc_nofs_restore(nofs_flag);
> 
> This is the wrong way to use memalloc_nofs_save/restore.  They should be
> used at the point that the filesystem takes/releases whatever lock is
> also used during reclaim.  I don't know btrfs well enough to suggest
> what lock is missing these annotations.

In principle I agree with you but in this particular case I agree the ask
is just too big. I suspect it is one of btrfs btree locks or maybe
chunk_mutex but I doubt even btrfs developers know and maybe it is just a
cargo cult. And it is not like this would be the first occurence of this
anti-pattern in btrfs - see e.g. device_list_add(), add_missing_dev(),
btrfs_destroy_delalloc_inodes() (here the wrapping around
invalidate_inode_pages2() looks really weird), and many others...

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

