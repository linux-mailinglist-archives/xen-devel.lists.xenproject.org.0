Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 047EC43287E
	for <lists+xen-devel@lfdr.de>; Mon, 18 Oct 2021 22:33:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.212542.370418 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcZJ2-0003cu-PT; Mon, 18 Oct 2021 20:32:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 212542.370418; Mon, 18 Oct 2021 20:32:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcZJ2-0003aC-ML; Mon, 18 Oct 2021 20:32:24 +0000
Received: by outflank-mailman (input) for mailman id 212542;
 Mon, 18 Oct 2021 20:32:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6TaT=PG=infradead.org=mcgrof@srs-us1.protection.inumbo.net>)
 id 1mcZJ1-0003a6-DY
 for xen-devel@lists.xenproject.org; Mon, 18 Oct 2021 20:32:23 +0000
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3158a153-5c1c-401e-a91f-c1dc55903999;
 Mon, 18 Oct 2021 20:32:20 +0000 (UTC)
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1mcZIX-00HDlV-C4; Mon, 18 Oct 2021 20:31:53 +0000
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
X-Inumbo-ID: 3158a153-5c1c-401e-a91f-c1dc55903999
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=OBMvbiCZ3mmK4xvpOD56mvuToBpo4s4ONuPdaMpMXso=; b=TIkzxO1O7vQd0T1PMQ31eP873s
	pPHNaKNwfjx7mTwD9RmpK0u2Dr52r7UfxNzSSDXj8Ur4f/57iSBP9syn65/BRLw+Qf0YqEROqC1+F
	/VG4vFcKrZ4lPNCkYzTKj7o2L7DwvWpMe/Cj9lb6MSKQzaI23JMePqdIEZskz+65OByIz865kTj2M
	S7C7JWy6K7A2w9h6miRNVROzQSV0cHn3nsz/ISMK8rBY/sbh7syYv+06of00RqsVQ7L8TnPZCsvnm
	bLR1p6dai2RCCksWMX0lknKUYeC/2U9k2JV7oYNMmdKjgqpOgr1yAHVsYweFfh4DDrfwCTLAV00Ez
	KwZhXR7g==;
Date: Mon, 18 Oct 2021 13:31:53 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: "Martin K. Petersen" <martin.petersen@oracle.com>, axboe@kernel.dk
Cc: jejb@linux.ibm.com, agk@redhat.com, snitzer@redhat.com, colyli@suse.de,
	kent.overstreet@gmail.com, boris.ostrovsky@oracle.com,
	jgross@suse.com, sstabellini@kernel.org, roger.pau@citrix.com,
	geert@linux-m68k.org, ulf.hansson@linaro.org, tj@kernel.org,
	hare@suse.de, jdike@addtoit.com, richard@nod.at,
	anton.ivanov@cambridgegreys.com, johannes.berg@intel.com,
	krisman@collabora.com, chris.obbard@collabora.com,
	thehajime@gmail.com, zhuyifei1999@gmail.com, haris.iqbal@ionos.com,
	jinpu.wang@ionos.com, miquel.raynal@bootlin.com, vigneshr@ti.com,
	linux-mtd@lists.infradead.org, linux-scsi@vger.kernel.org,
	dm-devel@redhat.com, linux-bcache@vger.kernel.org,
	xen-devel@lists.xenproject.org, linux-m68k@lists.linux-m68k.org,
	linux-um@lists.infradead.org, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 1/9] scsi/sd: add error handling support for add_disk()
Message-ID: <YW3ZuQv1qpIXkd5b@bombadil.infradead.org>
References: <20211015233028.2167651-1-mcgrof@kernel.org>
 <20211015233028.2167651-2-mcgrof@kernel.org>
 <yq1bl3ofjo5.fsf@ca-mkp.ca.oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq1bl3ofjo5.fsf@ca-mkp.ca.oracle.com>
Sender: Luis Chamberlain <mcgrof@infradead.org>

On Sat, Oct 16, 2021 at 10:51:48PM -0400, Martin K. Petersen wrote:
> 
> Luis,
> 
> > We never checked for errors on add_disk() as this function returned
> > void. Now that this is fixed, use the shiny new error handling.
> >
> > As with the error handling for device_add() we follow the same logic
> > and just put the device so that cleanup is done via the
> > scsi_disk_release().
> 
> Acked-by: Martin K. Petersen <martin.petersen@oracle.com>

Thanks, would you like Jens to pick this up and the other scsi/sr patch
or are you taking it through your tree?

  Luis

