Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 491508244CF
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jan 2024 16:17:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.661835.1031565 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLPSu-0006kA-MK; Thu, 04 Jan 2024 15:17:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 661835.1031565; Thu, 04 Jan 2024 15:17:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLPSu-0006iN-JJ; Thu, 04 Jan 2024 15:17:00 +0000
Received: by outflank-mailman (input) for mailman id 661835;
 Thu, 04 Jan 2024 15:16:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BdYS=IO=suse.cz=jack@srs-se1.protection.inumbo.net>)
 id 1rLPSt-0006iH-8Y
 for xen-devel@lists.xenproject.org; Thu, 04 Jan 2024 15:16:59 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4c66696b-ab14-11ee-9b0f-b553b5be7939;
 Thu, 04 Jan 2024 16:16:56 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B3CFB21D82;
 Thu,  4 Jan 2024 15:16:55 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 88C6E13722;
 Thu,  4 Jan 2024 15:16:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id CnlcIefLlmUgTAAAD6G6ig
 (envelope-from <jack@suse.cz>); Thu, 04 Jan 2024 15:16:55 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 21D02A07EF; Thu,  4 Jan 2024 16:16:55 +0100 (CET)
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
X-Inumbo-ID: 4c66696b-ab14-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1704381415; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FMPvsZKYHk+D5kb1N2CM5rR4TjKGNh05qKhD/IuVB8c=;
	b=mHk6v/mPh0nrF36XeRd9n1G+3dVH07YiQx9gWm/SG7NmXFbckEmPHT+psVuS+Q55O5Ewmm
	fzZp736IzVr5FNkauue7PYolsCdGhN9oZfdxiUjjwUo5SvRhYKG4JdOSw0VhUWvKC+wi2H
	9fs2A0RPq42k8lt/8HUXEBH2gHBffpc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1704381415;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FMPvsZKYHk+D5kb1N2CM5rR4TjKGNh05qKhD/IuVB8c=;
	b=6J4uw5uqBb70vbWXOXdU9583F4KrmBOAGYenVBa6jTwgLx70IbxaS5CKgObceVLtg+Uuvf
	BlSynn3hFCWD0KCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1704381415; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FMPvsZKYHk+D5kb1N2CM5rR4TjKGNh05qKhD/IuVB8c=;
	b=mHk6v/mPh0nrF36XeRd9n1G+3dVH07YiQx9gWm/SG7NmXFbckEmPHT+psVuS+Q55O5Ewmm
	fzZp736IzVr5FNkauue7PYolsCdGhN9oZfdxiUjjwUo5SvRhYKG4JdOSw0VhUWvKC+wi2H
	9fs2A0RPq42k8lt/8HUXEBH2gHBffpc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1704381415;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FMPvsZKYHk+D5kb1N2CM5rR4TjKGNh05qKhD/IuVB8c=;
	b=6J4uw5uqBb70vbWXOXdU9583F4KrmBOAGYenVBa6jTwgLx70IbxaS5CKgObceVLtg+Uuvf
	BlSynn3hFCWD0KCQ==
Date: Thu, 4 Jan 2024 16:16:55 +0100
From: Jan Kara <jack@suse.cz>
To: Yu Kuai <yukuai1@huaweicloud.com>
Cc: Jan Kara <jack@suse.cz>, axboe@kernel.dk, roger.pau@citrix.com,
	colyli@suse.de, kent.overstreet@gmail.com, joern@lazybastard.org,
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	sth@linux.ibm.com, hoeppner@linux.ibm.com, hca@linux.ibm.com,
	gor@linux.ibm.com, agordeev@linux.ibm.com, jejb@linux.ibm.com,
	martin.petersen@oracle.com, clm@fb.com, josef@toxicpanda.com,
	dsterba@suse.com, viro@zeniv.linux.org.uk, brauner@kernel.org,
	nico@fluxnic.net, xiang@kernel.org, chao@kernel.org, tytso@mit.edu,
	adilger.kernel@dilger.ca, jack@suse.com, konishi.ryusuke@gmail.com,
	willy@infradead.org, akpm@linux-foundation.org, hare@suse.de,
	p.raghav@samsung.com, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
	linux-bcache@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org,
	linux-bcachefs@vger.kernel.org, linux-btrfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	linux-ext4@vger.kernel.org, linux-nilfs@vger.kernel.org,
	yi.zhang@huawei.com, yangerkun@huawei.com,
	"yukuai (C)" <yukuai3@huawei.com>
Subject: Re: [PATCH RFC v3 for-6.8/block 02/17] xen/blkback: use bdev api in
 xen_update_blkif_status()
Message-ID: <20240104151655.oiqtn6onge2etlcn@quack3>
References: <20231221085712.1766333-1-yukuai1@huaweicloud.com>
 <20231221085712.1766333-3-yukuai1@huaweicloud.com>
 <20240104110631.3vspsvxbbvcpdqdu@quack3>
 <29bfcfc7-62b0-3876-78ce-f7ebe3506eb6@huaweicloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <29bfcfc7-62b0-3876-78ce-f7ebe3506eb6@huaweicloud.com>
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Score: 1.90
X-Spam-Level: *
X-Spam-Flag: NO
X-Spamd-Result: default: False [1.90 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 URIBL_BLOCKED(0.00)[suse.com:email,huawei.com:email];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 TAGGED_RCPT(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 R_RATELIMIT(0.00)[to_ip_from(RLdan9jouj5dxnqx1npfmn4ucx)];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	 RCPT_COUNT_TWELVE(0.00)[49];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,huawei.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 MID_RHS_NOT_FQDN(0.50)[];
	 FREEMAIL_CC(0.00)[suse.cz,kernel.dk,citrix.com,suse.de,gmail.com,lazybastard.org,bootlin.com,nod.at,ti.com,linux.ibm.com,oracle.com,fb.com,toxicpanda.com,suse.com,zeniv.linux.org.uk,kernel.org,fluxnic.net,mit.edu,dilger.ca,infradead.org,linux-foundation.org,samsung.com,vger.kernel.org,lists.xenproject.org,lists.infradead.org,lists.ozlabs.org,huawei.com];
	 RCVD_TLS_ALL(0.00)[];
	 SUSPICIOUS_RECIPS(1.50)[]

Hi Kuai!

On Thu 04-01-24 20:19:05, Yu Kuai wrote:
> 在 2024/01/04 19:06, Jan Kara 写道:
> > On Thu 21-12-23 16:56:57, Yu Kuai wrote:
> > > From: Yu Kuai <yukuai3@huawei.com>
> > > 
> > > Avoid to access bd_inode directly, prepare to remove bd_inode from
> > > block_devcie.
> > > 
> > > Signed-off-by: Yu Kuai <yukuai3@huawei.com>
> > > ---
> > >   drivers/block/xen-blkback/xenbus.c | 3 +--
> > >   1 file changed, 1 insertion(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/block/xen-blkback/xenbus.c b/drivers/block/xen-blkback/xenbus.c
> > > index e34219ea2b05..e645afa4af57 100644
> > > --- a/drivers/block/xen-blkback/xenbus.c
> > > +++ b/drivers/block/xen-blkback/xenbus.c
> > > @@ -104,8 +104,7 @@ static void xen_update_blkif_status(struct xen_blkif *blkif)
> > >   		xenbus_dev_error(blkif->be->dev, err, "block flush");
> > >   		return;
> > >   	}
> > > -	invalidate_inode_pages2(
> > > -			blkif->vbd.bdev_handle->bdev->bd_inode->i_mapping);
> > > +	invalidate_bdev(blkif->vbd.bdev_handle->bdev);
> > 
> > This function uses invalidate_inode_pages2() while invalidate_bdev() ends
> > up using mapping_try_invalidate() and there are subtle behavioral
> > differences between these two (for example invalidate_inode_pages2() tries
> > to clean dirty pages using the ->launder_folio method). So I think you'll
> > need helper like invalidate_bdev2() for this.
> 
> Thanks for reviewing this patch, I know the differenct between then,
> what I don't understand is that why using invalidate_inode_pages2()
> here.

Well, then the change in behavior should be at least noted in the
changelog.

> sync_blockdev() is just called and 0 is returned, I think in this
> case it's safe to call invalidate_bdev() directly, or am I missing
> other things?

I still think there's a difference. invalidate_inode_pages2() also unmaps
memory mappings which mapping_try_invalidate() does not do. That being said
in xen_update_blkif_status() we seem to be bringing up a virtual block
device so before this function is called, anybody would have hard time
using anything in it. But this definitely needs a confirmation from Xen
maintainers and a good documentation of the behavioral change in the
changelog.

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

