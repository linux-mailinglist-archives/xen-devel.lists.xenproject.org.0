Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1940280D2DB
	for <lists+xen-devel@lfdr.de>; Mon, 11 Dec 2023 17:53:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.652398.1018202 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCjW1-0004vP-VI; Mon, 11 Dec 2023 16:52:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 652398.1018202; Mon, 11 Dec 2023 16:52:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCjW1-0004sL-Si; Mon, 11 Dec 2023 16:52:21 +0000
Received: by outflank-mailman (input) for mailman id 652398;
 Mon, 11 Dec 2023 16:52:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=El9v=HW=suse.cz=jack@srs-se1.protection.inumbo.net>)
 id 1rCjW0-0004sF-OF
 for xen-devel@lists.xenproject.org; Mon, 11 Dec 2023 16:52:20 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a54482a1-9845-11ee-98e8-6d05b1d4d9a1;
 Mon, 11 Dec 2023 17:52:19 +0100 (CET)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3A65722413;
 Mon, 11 Dec 2023 16:52:18 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 26D01134B0;
 Mon, 11 Dec 2023 16:52:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap2.dmz-prg2.suse.org with ESMTPSA id 1uB1CUI+d2XzFAAAn2gu4w
 (envelope-from <jack@suse.cz>); Mon, 11 Dec 2023 16:52:18 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id A24EDA07E3; Mon, 11 Dec 2023 17:52:17 +0100 (CET)
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
X-Inumbo-ID: a54482a1-9845-11ee-98e8-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1702313538; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rKyChubYQOLUssFrI8/z8khe3/ZNZIgTAEz8GE5ZHf8=;
	b=KF7fZ16GGZSNVIercO+eYb/zdHDuObhA9Onxa81BeqL3LeXtWEzJu+HqGO1kfleK3MMb9x
	jUugKN6DhI5mx4QzBnf4JH10nshySFJYQzot/cnv9bMAHLqxdYshFuHfymm3WHOgnJ+pWp
	7mgLY2fOp0ANNoP3kZ8g+YQPQxBLCuM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1702313538;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rKyChubYQOLUssFrI8/z8khe3/ZNZIgTAEz8GE5ZHf8=;
	b=55atrZPOIWUHCEdWSl7m1h0isEhBA3PJTsKW7m5NfRjFtXZtvlPhx1kYCCQxQNMKERbIiQ
	03X5sRIKKKs3qZCg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1702313538; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rKyChubYQOLUssFrI8/z8khe3/ZNZIgTAEz8GE5ZHf8=;
	b=KF7fZ16GGZSNVIercO+eYb/zdHDuObhA9Onxa81BeqL3LeXtWEzJu+HqGO1kfleK3MMb9x
	jUugKN6DhI5mx4QzBnf4JH10nshySFJYQzot/cnv9bMAHLqxdYshFuHfymm3WHOgnJ+pWp
	7mgLY2fOp0ANNoP3kZ8g+YQPQxBLCuM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1702313538;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rKyChubYQOLUssFrI8/z8khe3/ZNZIgTAEz8GE5ZHf8=;
	b=55atrZPOIWUHCEdWSl7m1h0isEhBA3PJTsKW7m5NfRjFtXZtvlPhx1kYCCQxQNMKERbIiQ
	03X5sRIKKKs3qZCg==
Date: Mon, 11 Dec 2023 17:52:17 +0100
From: Jan Kara <jack@suse.cz>
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
Subject: Re: [PATCH RFC v2 for-6.8/block 01/18] block: add some bdev apis
Message-ID: <20231211165217.fil437byq7w2vcp7@quack3>
References: <20231211140552.973290-1-yukuai1@huaweicloud.com>
 <20231211140552.973290-2-yukuai1@huaweicloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231211140552.973290-2-yukuai1@huaweicloud.com>
X-Spam-Level: 
X-Spam-Score: -1.58
X-Spam-Flag: NO
X-Spamd-Result: default: False [-1.26 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 BAYES_HAM(-1.96)[94.82%];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 TAGGED_RCPT(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 R_RATELIMIT(0.00)[to_ip_from(RLg7z3ka1nnoi3zj4x13ixbdfk)];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 RCPT_COUNT_GT_50(0.00)[50];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 MID_RHS_NOT_FQDN(0.50)[];
	 FREEMAIL_CC(0.00)[kernel.dk,citrix.com,suse.de,gmail.com,lazybastard.org,bootlin.com,nod.at,ti.com,linux.ibm.com,oracle.com,fb.com,toxicpanda.com,suse.com,zeniv.linux.org.uk,kernel.org,fluxnic.net,mit.edu,dilger.ca,redhat.com,infradead.org,linux-foundation.org,samsung.com,vger.kernel.org,lists.xenproject.org,lists.infradead.org,lists.ozlabs.org,lists.linux.dev,huawei.com];
	 RCVD_TLS_ALL(0.00)[];
	 SUSPICIOUS_RECIPS(1.50)[]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -1.26
Authentication-Results: smtp-out1.suse.de;
	none

On Mon 11-12-23 22:05:35, Yu Kuai wrote:
> From: Yu Kuai <yukuai3@huawei.com>
> 
> Those apis will be used for other modules, so that bd_inode won't be
> accessed directly from other modules.
> 
> Signed-off-by: Yu Kuai <yukuai3@huawei.com>

...

> +void bdev_associated_mapping(struct block_device *bdev,
> +			     struct address_space *mapping)
> +{
> +	mapping->host = bdev->bd_inode;
> +}

Here I'm not sure - is the helper really a win? It seems a bit obscure to
me. This initialization of another mapping for a bdev looks really special.

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

