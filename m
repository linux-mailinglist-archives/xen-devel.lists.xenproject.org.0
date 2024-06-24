Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56903915E92
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2024 08:01:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.746929.1154537 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLzFH-000522-8K; Tue, 25 Jun 2024 06:01:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 746929.1154537; Tue, 25 Jun 2024 06:01:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLzFH-0004zm-53; Tue, 25 Jun 2024 06:01:35 +0000
Received: by outflank-mailman (input) for mailman id 746929;
 Mon, 24 Jun 2024 20:57:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1jEd=N2=net-c.com=rustybird@srs-se1.protection.inumbo.net>)
 id 1sLqkj-0006zn-6X
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2024 20:57:29 +0000
Received: from mailo.com (msg-2.mailo.com [213.182.54.12])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5c99ac83-326c-11ef-90a3-e314d9c70b13;
 Mon, 24 Jun 2024 22:57:26 +0200 (CEST)
Received: by b221-6.in.mailobj.net [192.168.90.26] with ESMTP
 via ip-20.mailobj.net [213.182.54.20]
 Mon, 24 Jun 2024 22:57:20 +0200 (CEST)
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
X-Inumbo-ID: 5c99ac83-326c-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=net-c.com; s=mailo;
	t=1719262640; bh=yL7RpNY0mzppYqKUJ2NLIHNEkbd+z2/jheYt/lByE0Q=;
	h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To;
	b=ycobJ/XxK0lDNyvZvZCfaF/btBqESLa79LJON+en38+TZ5XySXnaVs5mNa1/MRD2a
	 tD1DREkGBe/iWEGVSuGy064aZ2vRdsa/ONJfc/EvmgFprCoiXXhV6mWjWdlbIkWB2b
	 jHkLNWF/zIrChcDH2ju8hnv8d1oWiu8pAYe/YaMU=
X-EA-Auth: jzlao6B10w7KC8fjYHfmgbgCFNZVbCjLZL2oGthHEOwT9J4UezSzTA5LoR/1Goq85PA6kQAuzA2C6Nltm+C0R3RF7t21KtGhRHp48tIVmqI=
Date: Mon, 24 Jun 2024 20:56:47 +0000
From: Rusty Bird <rustybird@net-c.com>
To: Christoph Hellwig <hch@lst.de>
Cc: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>,
	Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>,
	xen-devel <xen-devel@lists.xenproject.org>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Jens Axboe <axboe@kernel.dk>
Subject: Re: Regression in xen-blkfront regarding sector sizes
Message-ID: <Znndj9W_bCsFTxkz@mutt>
References: <Znl5FYI9CC37jJLX@mail-itl>
 <1944dd3f-1ba8-4559-b71a-056b9309ab58@suse.com>
 <20240624143826.GA8973@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240624143826.GA8973@lst.de>

Christoph Hellwig:
> On Mon, Jun 24, 2024 at 04:29:15PM +0200, Jürgen Groß wrote:
> >> Rusty suspects it's related to
> >> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/block/xen-blkfront.c?id=ba3f67c1163812b5d7ec33705c31edaa30ce6c51,
> >> so I'm cc-ing people mentioned there too.
> >
> > I think the call of blkif_set_queue_limits() in this patch should NOT precede
> > setting of info->sector_size and info->physical_sector_size, as those are
> > needed by blkif_set_queue_limits().
> 
> Yes.  Something like the patch below should fix it.  We could also stop
> passing sector_size and physіcal_sector_size to xlvbd_alloc_gendisk to
> clean things up a bit more.
> 
> diff --git a/drivers/block/xen-blkfront.c b/drivers/block/xen-blkfront.c
> index fd7c0ff2139cee..9f3d68044f8882 100644
> --- a/drivers/block/xen-blkfront.c
> +++ b/drivers/block/xen-blkfront.c
> @@ -1133,6 +1133,8 @@ static int xlvbd_alloc_gendisk(blkif_sector_t capacity,
>  	if (err)
>  		goto out_release_minors;
>  
> +	info->sector_size = sector_size;
> +	info->physical_sector_size = physical_sector_size;
>  	blkif_set_queue_limits(info, &lim);
>  	gd = blk_mq_alloc_disk(&info->tag_set, &lim, info);
>  	if (IS_ERR(gd)) {
> @@ -1159,8 +1161,6 @@ static int xlvbd_alloc_gendisk(blkif_sector_t capacity,
>  
>  	info->rq = gd->queue;
>  	info->gd = gd;
> -	info->sector_size = sector_size;
> -	info->physical_sector_size = physical_sector_size;
>  
>  	xlvbd_flush(info);
>  
> 
> 

With this patch applied on top of v6.9.4, I get the correct
logical/physical block sizes and the issue is fixed. Thank you!

Rusty



