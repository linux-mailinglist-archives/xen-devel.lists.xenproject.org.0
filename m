Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F038E74763F
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jul 2023 18:15:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558546.872747 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGig7-00043B-FJ; Tue, 04 Jul 2023 16:14:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558546.872747; Tue, 04 Jul 2023 16:14:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGig7-00041S-CN; Tue, 04 Jul 2023 16:14:59 +0000
Received: by outflank-mailman (input) for mailman id 558546;
 Tue, 04 Jul 2023 16:14:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P5qr=CW=infradead.org=willy@srs-se1.protection.inumbo.net>)
 id 1qGig5-00041M-JB
 for xen-devel@lists.xenproject.org; Tue, 04 Jul 2023 16:14:58 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ea1c686f-1a85-11ee-b237-6b7b168915f2;
 Tue, 04 Jul 2023 18:14:56 +0200 (CEST)
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1qGifB-009I83-IW; Tue, 04 Jul 2023 16:14:01 +0000
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
X-Inumbo-ID: ea1c686f-1a85-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=R1W87rnlNGGe3O62ySITe0WV/TkO13M6jrCnVpdBC/M=; b=ma0abi+l8BKnWZyE2Bm6SMUpzA
	GY/Sg9bKM4QGi5Fi3SxYqWXxJ46oHMzkk2XTYG6szPrdjaFZvCOeUvh2qeA+qFPnGTya2tgZ0Czoo
	anlh0yET7VOr2nReXBjhvXLbethMJyMQRtOEtJdxTJlnJDQLzVkEFxU1z6LlHa+R1Svpz+R+Zi/2e
	EbHE+jMBvtLJPxFFKggvC8J4kNKoPgnxYJ08D38bFVgefZT0kn05//LL45wE920g1ut/XHRnJF4Ur
	2JcraLDAhTPQ+qGFyYF+arcI4MuDDkahpy1OJ1ZV5vzT8Q6c9E3mK76aIjApGP0H0G7MQh7QY3lZI
	j0pVBAMA==;
Date: Tue, 4 Jul 2023 17:14:01 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Bart Van Assche <bvanassche@acm.org>
Cc: Jan Kara <jack@suse.cz>, linux-block@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@infradead.org>,
	Alasdair Kergon <agk@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Anna Schumaker <anna@kernel.org>, Chao Yu <chao@kernel.org>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	"Darrick J. Wong" <djwong@kernel.org>,
	Dave Kleikamp <shaggy@kernel.org>, David Sterba <dsterba@suse.com>,
	dm-devel@redhat.com, drbd-dev@lists.linbit.com,
	Gao Xiang <xiang@kernel.org>, Jack Wang <jinpu.wang@ionos.com>,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	jfs-discussion@lists.sourceforge.net,
	Joern Engel <joern@lazybastard.org>,
	Joseph Qi <joseph.qi@linux.alibaba.com>,
	Kent Overstreet <kent.overstreet@gmail.com>,
	linux-bcache@vger.kernel.org, linux-btrfs@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, linux-ext4@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, linux-mm@kvack.org,
	linux-mtd@lists.infradead.org, linux-nfs@vger.kernel.org,
	linux-nilfs@vger.kernel.org, linux-nvme@lists.infradead.org,
	linux-pm@vger.kernel.org, linux-raid@vger.kernel.org,
	linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org,
	linux-xfs@vger.kernel.org,
	"Md. Haris Iqbal" <haris.iqbal@ionos.com>,
	Mike Snitzer <snitzer@kernel.org>, Minchan Kim <minchan@kernel.org>,
	ocfs2-devel@oss.oracle.com, reiserfs-devel@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Song Liu <song@kernel.org>, Sven Schnelle <svens@linux.ibm.com>,
	target-devel@vger.kernel.org, Ted Tso <tytso@mit.edu>,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 01/32] block: Provide blkdev_get_handle_* functions
Message-ID: <ZKRFSZQglwCba9/i@casper.infradead.org>
References: <20230629165206.383-1-jack@suse.cz>
 <20230704122224.16257-1-jack@suse.cz>
 <bb91e76b-0bd8-a949-f8b9-868f919ebcb9@acm.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bb91e76b-0bd8-a949-f8b9-868f919ebcb9@acm.org>

On Tue, Jul 04, 2023 at 07:06:26AM -0700, Bart Van Assche wrote:
> On 7/4/23 05:21, Jan Kara wrote:
> > +struct bdev_handle {
> > +	struct block_device *bdev;
> > +	void *holder;
> > +};
> 
> Please explain in the patch description why a holder pointer is introduced
> in struct bdev_handle and how it relates to the bd_holder pointer in struct
> block_device. Is one of the purposes of this patch series perhaps to add
> support for multiple holders per block device?

That is all in patch 0/32.  Why repeat it?

