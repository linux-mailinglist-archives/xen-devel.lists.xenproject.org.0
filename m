Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BAAD91501B
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jun 2024 16:38:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.746717.1153853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLkq1-000754-95; Mon, 24 Jun 2024 14:38:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 746717.1153853; Mon, 24 Jun 2024 14:38:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLkq1-00073a-6R; Mon, 24 Jun 2024 14:38:33 +0000
Received: by outflank-mailman (input) for mailman id 746717;
 Mon, 24 Jun 2024 14:38:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3xpo=N2=lst.de=hch@srs-se1.protection.inumbo.net>)
 id 1sLkpz-00073S-5Y
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2024 14:38:31 +0000
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6c1593d3-3237-11ef-b4bb-af5377834399;
 Mon, 24 Jun 2024 16:38:29 +0200 (CEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 5FF0068C4E; Mon, 24 Jun 2024 16:38:26 +0200 (CEST)
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
X-Inumbo-ID: 6c1593d3-3237-11ef-b4bb-af5377834399
Date: Mon, 24 Jun 2024 16:38:26 +0200
From: Christoph Hellwig <hch@lst.de>
To: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>
Cc: Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>,
	xen-devel <xen-devel@lists.xenproject.org>,
	Christoph Hellwig <hch@lst.de>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Jens Axboe <axboe@kernel.dk>
Subject: Re: Regression in xen-blkfront regarding sector sizes
Message-ID: <20240624143826.GA8973@lst.de>
References: <Znl5FYI9CC37jJLX@mail-itl> <1944dd3f-1ba8-4559-b71a-056b9309ab58@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1944dd3f-1ba8-4559-b71a-056b9309ab58@suse.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Mon, Jun 24, 2024 at 04:29:15PM +0200, Jürgen Groß wrote:
>> Rusty suspects it's related to
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/block/xen-blkfront.c?id=ba3f67c1163812b5d7ec33705c31edaa30ce6c51,
>> so I'm cc-ing people mentioned there too.
>
> I think the call of blkif_set_queue_limits() in this patch should NOT precede
> setting of info->sector_size and info->physical_sector_size, as those are
> needed by blkif_set_queue_limits().

Yes.  Something like the patch below should fix it.  We could also stop
passing sector_size and physіcal_sector_size to xlvbd_alloc_gendisk to
clean things up a bit more.

diff --git a/drivers/block/xen-blkfront.c b/drivers/block/xen-blkfront.c
index fd7c0ff2139cee..9f3d68044f8882 100644
--- a/drivers/block/xen-blkfront.c
+++ b/drivers/block/xen-blkfront.c
@@ -1133,6 +1133,8 @@ static int xlvbd_alloc_gendisk(blkif_sector_t capacity,
 	if (err)
 		goto out_release_minors;
 
+	info->sector_size = sector_size;
+	info->physical_sector_size = physical_sector_size;
 	blkif_set_queue_limits(info, &lim);
 	gd = blk_mq_alloc_disk(&info->tag_set, &lim, info);
 	if (IS_ERR(gd)) {
@@ -1159,8 +1161,6 @@ static int xlvbd_alloc_gendisk(blkif_sector_t capacity,
 
 	info->rq = gd->queue;
 	info->gd = gd;
-	info->sector_size = sector_size;
-	info->physical_sector_size = physical_sector_size;
 
 	xlvbd_flush(info);
 

