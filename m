Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04DD64F831C
	for <lists+xen-devel@lfdr.de>; Thu,  7 Apr 2022 17:27:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.300903.513404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncU2M-0008Cf-2N; Thu, 07 Apr 2022 15:27:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 300903.513404; Thu, 07 Apr 2022 15:27:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncU2L-00089o-VC; Thu, 07 Apr 2022 15:27:05 +0000
Received: by outflank-mailman (input) for mailman id 300903;
 Thu, 07 Apr 2022 15:27:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QPCU=UR=lst.de=hch@srs-se1.protection.inumbo.net>)
 id 1ncU2K-0007h8-20
 for xen-devel@lists.xenproject.org; Thu, 07 Apr 2022 15:27:04 +0000
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2c8abfed-b687-11ec-8fbc-03012f2f19d4;
 Thu, 07 Apr 2022 17:27:03 +0200 (CEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id AE08468AFE; Thu,  7 Apr 2022 17:26:59 +0200 (CEST)
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
X-Inumbo-ID: 2c8abfed-b687-11ec-8fbc-03012f2f19d4
Date: Thu, 7 Apr 2022 17:26:59 +0200
From: Christoph Hellwig <hch@lst.de>
To: dsterba@suse.cz, Christoph Hellwig <hch@lst.de>,
	Jens Axboe <axboe@kernel.dk>, dm-devel@redhat.com,
	linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-um@lists.infradead.org, linux-block@vger.kernel.org,
	drbd-dev@lists.linbit.com, nbd@other.debian.org,
	ceph-devel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	xen-devel@lists.xenproject.org, linux-bcache@vger.kernel.org,
	linux-raid@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-nvme@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org,
	target-devel@vger.kernel.org, linux-btrfs@vger.kernel.org,
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	cluster-devel@redhat.com, jfs-discussion@lists.sourceforge.net,
	linux-nilfs@vger.kernel.org, ntfs3@lists.linux.dev,
	ocfs2-devel@oss.oracle.com, linux-mm@kvack.org
Subject: Re: [PATCH 07/27] btrfs: use bdev_max_active_zones instead of open
 coding it
Message-ID: <20220407152659.GA15200@lst.de>
References: <20220406060516.409838-1-hch@lst.de> <20220406060516.409838-8-hch@lst.de> <20220407152049.GH15609@twin.jikos.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220407152049.GH15609@twin.jikos.cz>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Thu, Apr 07, 2022 at 05:20:49PM +0200, David Sterba wrote:
> On Wed, Apr 06, 2022 at 08:04:56AM +0200, Christoph Hellwig wrote:
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> 
> As it's a standalone patch I can take it (possibly with other similar
> prep btrfs patches) in current development cycle to relieve the
> inter-tree dependencies.

Unless there's a conflict in other btrfs patches it would probably be
easiest to merge everything through the block tree.

