Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B047631CA12
	for <lists+xen-devel@lfdr.de>; Tue, 16 Feb 2021 12:46:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.85511.160359 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lByoI-0005sy-0T; Tue, 16 Feb 2021 11:46:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 85511.160359; Tue, 16 Feb 2021 11:46:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lByoH-0005sZ-Sr; Tue, 16 Feb 2021 11:46:29 +0000
Received: by outflank-mailman (input) for mailman id 85511;
 Tue, 16 Feb 2021 11:46:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=miGH=HS=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1lByoG-0005sU-O7
 for xen-devel@lists.xenproject.org; Tue, 16 Feb 2021 11:46:28 +0000
Received: from verein.lst.de (unknown [213.95.11.211])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7764075b-d0a5-473f-8e57-2b4a13ade34a;
 Tue, 16 Feb 2021 11:46:27 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 5738667373; Tue, 16 Feb 2021 12:46:24 +0100 (CET)
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
X-Inumbo-ID: 7764075b-d0a5-473f-8e57-2b4a13ade34a
Date: Tue, 16 Feb 2021 12:46:24 +0100
From: Christoph Hellwig <hch@lst.de>
To: Mike Snitzer <snitzer@redhat.com>
Cc: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
	Justin Sanders <justin@coraid.com>,
	Josef Bacik <josef@toxicpanda.com>,
	Ilya Dryomov <idryomov@gmail.com>,
	Jack Wang <jinpu.wang@cloud.ionos.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Minchan Kim <minchan@kernel.org>, Song Liu <song@kernel.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	device-mapper development <dm-devel@redhat.com>,
	linux-block <linux-block@vger.kernel.org>,
	drbd-dev@lists.linbit.com, nbd@other.debian.org,
	ceph-devel@vger.kernel.org, xen-devel@lists.xenproject.org,
	"linux-raid@vger.kernel.org" <linux-raid@vger.kernel.org>,
	linux-nvme@lists.infradead.org,
	"linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Hannes Reinecke <hare@suse.de>
Subject: Re: [PATCH 12/78] dm: use set_capacity_and_notify
Message-ID: <20210216114624.GA1221@lst.de>
References: <20201116145809.410558-1-hch@lst.de> <20201116145809.410558-13-hch@lst.de> <CAMM=eLfD0_Am3--X+PsKPTfc9qzejxpMNjYwEh=WtjSa-iSncg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMM=eLfD0_Am3--X+PsKPTfc9qzejxpMNjYwEh=WtjSa-iSncg@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Fri, Feb 12, 2021 at 10:45:32AM -0500, Mike Snitzer wrote:
> On Mon, Nov 16, 2020 at 10:05 AM Christoph Hellwig <hch@lst.de> wrote:
> >
> > Use set_capacity_and_notify to set the size of both the disk and block
> > device.  This also gets the uevent notifications for the resize for free.
> >
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> > Reviewed-by: Hannes Reinecke <hare@suse.de>
> > ---
> >  drivers/md/dm.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/drivers/md/dm.c b/drivers/md/dm.c
> > index c18fc25485186d..62ad44925e73ec 100644
> > --- a/drivers/md/dm.c
> > +++ b/drivers/md/dm.c
> > @@ -1971,8 +1971,7 @@ static struct dm_table *__bind(struct mapped_device *md, struct dm_table *t,
> >         if (size != dm_get_size(md))
> >                 memset(&md->geometry, 0, sizeof(md->geometry));
> >
> > -       set_capacity(md->disk, size);
> > -       bd_set_nr_sectors(md->bdev, size);
> > +       set_capacity_and_notify(md->disk, size);
> >
> >         dm_table_event_callback(t, event_callback, md);
> >
> 
> Not yet pinned down _why_ DM is calling set_capacity_and_notify() with
> a size of 0 but, when running various DM regression tests, I'm seeing
> a lot of noise like:
> 
> [  689.240037] dm-2: detected capacity change from 2097152 to 0
> 
> Is this pr_info really useful?  Should it be moved to below: if
> (!capacity || !size) so that it only prints if a uevent is sent?

In general I suspect such a size change might be interesting to users
if it e.g. comes from a remote event.  So I'd be curious why this happens
with DM, and if we can detect some higher level gendisk state to supress
it if it is indeed spurious.

