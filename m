Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 153BB85C063
	for <lists+xen-devel@lfdr.de>; Tue, 20 Feb 2024 16:54:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.683615.1063216 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcSRD-0000v9-QY; Tue, 20 Feb 2024 15:53:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 683615.1063216; Tue, 20 Feb 2024 15:53:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcSRD-0000sR-Ns; Tue, 20 Feb 2024 15:53:43 +0000
Received: by outflank-mailman (input) for mailman id 683615;
 Tue, 20 Feb 2024 15:53:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vPn8=J5=lst.de=hch@srs-se1.protection.inumbo.net>)
 id 1rcSRB-0000sE-T8
 for xen-devel@lists.xenproject.org; Tue, 20 Feb 2024 15:53:41 +0000
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 36dfb430-d008-11ee-98f5-efadbce2ee36;
 Tue, 20 Feb 2024 16:53:39 +0100 (CET)
Received: by verein.lst.de (Postfix, from userid 2407)
 id B777D68D07; Tue, 20 Feb 2024 16:53:36 +0100 (CET)
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
X-Inumbo-ID: 36dfb430-d008-11ee-98f5-efadbce2ee36
Date: Tue, 20 Feb 2024 16:53:36 +0100
From: Christoph Hellwig <hch@lst.de>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: Christoph Hellwig <hch@lst.de>, Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Jens Axboe <axboe@kernel.dk>, xen-devel@lists.xenproject.org,
	linux-block@vger.kernel.org
Subject: Re: [PATCH 4/4] xen-blkfront: atomically update queue limits
Message-ID: <20240220155336.GB17393@lst.de>
References: <20240220084935.3282351-1-hch@lst.de> <20240220084935.3282351-5-hch@lst.de> <ZdScey8AJvBykWa8@macbook>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZdScey8AJvBykWa8@macbook>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Tue, Feb 20, 2024 at 01:35:07PM +0100, Roger Pau Monné wrote:
> On Tue, Feb 20, 2024 at 09:49:35AM +0100, Christoph Hellwig wrote:
> > Pass the initial queue limits to blk_mq_alloc_disk and use the
> > blkif_set_queue_limits API to update the limits on reconnect.
> 
> Allocating queue_limits on the stack might be a bit risky, as I fear
> this struct is likely to grow?

It might grow a little bit, but it's not actually that large, epecially
in a simple probe context that isn't in memory reclaim or similar.

> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> 
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Just one addition while you are already modifying a line.
> 
> > ---
> >  drivers/block/xen-blkfront.c | 41 ++++++++++++++++++++----------------
> >  1 file changed, 23 insertions(+), 18 deletions(-)
> > 
> > diff --git a/drivers/block/xen-blkfront.c b/drivers/block/xen-blkfront.c
> > index 7664638a0abbfa..b77707ca2c5aa6 100644
> > --- a/drivers/block/xen-blkfront.c
> > +++ b/drivers/block/xen-blkfront.c
> > @@ -941,37 +941,35 @@ static const struct blk_mq_ops blkfront_mq_ops = {
> >  	.complete = blkif_complete_rq,
> >  };
> >  
> > -static void blkif_set_queue_limits(struct blkfront_info *info)
> > +static void blkif_set_queue_limits(struct blkfront_info *info,
> 
> While there, could you also constify info?

Sure.

