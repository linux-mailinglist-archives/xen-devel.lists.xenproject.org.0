Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB39C3FBDEE
	for <lists+xen-devel@lfdr.de>; Mon, 30 Aug 2021 23:09:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.175290.319408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKoWj-0007zW-Bk; Mon, 30 Aug 2021 21:09:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 175290.319408; Mon, 30 Aug 2021 21:09:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKoWj-0007wd-8N; Mon, 30 Aug 2021 21:09:09 +0000
Received: by outflank-mailman (input) for mailman id 175290;
 Mon, 30 Aug 2021 21:09:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rU8s=NV=infradead.org=mcgrof@srs-us1.protection.inumbo.net>)
 id 1mKoWh-0007wX-4x
 for xen-devel@lists.xenproject.org; Mon, 30 Aug 2021 21:09:07 +0000
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ef5ee8cc-a35d-4b6d-b75c-d9613d9b1e06;
 Mon, 30 Aug 2021 21:09:05 +0000 (UTC)
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1mKoWS-000bKI-22; Mon, 30 Aug 2021 21:08:52 +0000
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
X-Inumbo-ID: ef5ee8cc-a35d-4b6d-b75c-d9613d9b1e06
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=xFWTIefdsBbNHRGePjMVKB25ot+nXFfcxkVreKDH86Y=; b=FgSmTd/fRmS0xbTiIlIubbvcQF
	l8NXkScGBRAvafpu0rVHoH9iy35oqe0ZVhZrGw9F+vPsXmVAXAHRi9bLTOz/vVwm017PysQxzjdwR
	2Z7yKblSpY23X+mBYcbPR7HSt5+du9vMR0yd4OGtU//TsQa3L9dQPWUzn+aBwsb7TTLrFsa5Z1yBC
	cHAjsVtZF1FFvy5cgIFuUbxSa/UXcDJEnINnwNpFBMc/dx4nsSKskeqvJF2m/6ZEJ/y+wT83/RDx5
	Pxwk7umAbXCBGozfp+iGo+sUQFP9mBj3TSyahaTBMA85l5Ypzlz3qTA3rqa10UKRTSgpCacUNkUG2
	tjolFDlQ==;
Date: Mon, 30 Aug 2021 14:08:52 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Keith Busch <kbusch@kernel.org>
Cc: axboe@kernel.dk, colyli@suse.de, kent.overstreet@gmail.com,
	sagi@grimberg.me, vishal.l.verma@intel.com,
	dan.j.williams@intel.com, dave.jiang@intel.com, ira.weiny@intel.com,
	konrad.wilk@oracle.com, roger.pau@citrix.com,
	boris.ostrovsky@oracle.com, jgross@suse.com, sstabellini@kernel.org,
	minchan@kernel.org, ngupta@vflare.org, senozhatsky@chromium.org,
	xen-devel@lists.xenproject.org, nvdimm@lists.linux.dev,
	linux-nvme@lists.infradead.org, linux-bcache@vger.kernel.org,
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/10] nvme-multipath: add error handling support for
 add_disk()
Message-ID: <YS1I5DuGr0q7/uow@bombadil.infradead.org>
References: <20210827191809.3118103-1-mcgrof@kernel.org>
 <20210827191809.3118103-4-mcgrof@kernel.org>
 <20210827202932.GA82376@dhcp-10-100-145-180.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210827202932.GA82376@dhcp-10-100-145-180.wdc.com>
Sender: Luis Chamberlain <mcgrof@infradead.org>

On Fri, Aug 27, 2021 at 01:29:32PM -0700, Keith Busch wrote:
> On Fri, Aug 27, 2021 at 12:18:02PM -0700, Luis Chamberlain wrote:
> > @@ -479,13 +479,17 @@ int nvme_mpath_alloc_disk(struct nvme_ctrl *ctrl, struct nvme_ns_head *head)
> >  static void nvme_mpath_set_live(struct nvme_ns *ns)
> >  {
> >  	struct nvme_ns_head *head = ns->head;
> > +	int rc;
> >  
> >  	if (!head->disk)
> >  		return;
> >  
> > -	if (!test_and_set_bit(NVME_NSHEAD_DISK_LIVE, &head->flags)) {
> > -		device_add_disk(&head->subsys->dev, head->disk,
> > -				nvme_ns_id_attr_groups);
> > +	if (!test_bit(NVME_NSHEAD_DISK_LIVE, &head->flags)) {
> 
> This should still be test_and_set_bit() because it is protecting against
> two nvme paths simultaneously calling device_add_disk() on the same
> namespace head.

Interesting, I'll add a comment as well, as this was not clear with the drive
by effort.

  Luis

