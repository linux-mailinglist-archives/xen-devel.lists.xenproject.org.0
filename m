Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A46A8D5A0F
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2024 07:55:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.733269.1139403 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCvEF-0001Y2-DK; Fri, 31 May 2024 05:55:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 733269.1139403; Fri, 31 May 2024 05:55:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCvEF-0001Uq-Ai; Fri, 31 May 2024 05:55:03 +0000
Received: by outflank-mailman (input) for mailman id 733269;
 Fri, 31 May 2024 05:55:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ULw3=NC=lst.de=hch@srs-se1.protection.inumbo.net>)
 id 1sCvEE-0001Uk-DO
 for xen-devel@lists.xenproject.org; Fri, 31 May 2024 05:55:02 +0000
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 50f0194f-1f12-11ef-b4bb-af5377834399;
 Fri, 31 May 2024 07:55:00 +0200 (CEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id D3CD568BFE; Fri, 31 May 2024 07:54:56 +0200 (CEST)
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
X-Inumbo-ID: 50f0194f-1f12-11ef-b4bb-af5377834399
Date: Fri, 31 May 2024 07:54:56 +0200
From: Christoph Hellwig <hch@lst.de>
To: Ilya Dryomov <idryomov@gmail.com>
Cc: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Josef Bacik <josef@toxicpanda.com>,
	Dongsheng Yang <dongsheng.yang@easystack.cn>,
	Roger Pau Monn?? <roger.pau@citrix.com>,
	linux-um@lists.infradead.org, linux-block@vger.kernel.org,
	nbd@other.debian.org, ceph-devel@vger.kernel.org,
	xen-devel@lists.xenproject.org, linux-scsi@vger.kernel.org
Subject: Re: [PATCH 02/12] block: take io_opt and io_min into account for
 max_sectors
Message-ID: <20240531055456.GC17396@lst.de>
References: <20240529050507.1392041-1-hch@lst.de> <20240529050507.1392041-3-hch@lst.de> <CAOi1vP-F0FO4WTnrEt7FC-uu2C8NTbejvJQQGdZqT475c2G1jA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOi1vP-F0FO4WTnrEt7FC-uu2C8NTbejvJQQGdZqT475c2G1jA@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Thu, May 30, 2024 at 09:48:06PM +0200, Ilya Dryomov wrote:
> For rbd, this change effectively lowers max_sectors from 4M to 64K or
> less and that is definitely not desirable.  From previous interactions
> with users we want max_sectors to match max_hw_sectors -- this has come
> up a quite a few times over the years.  Some people just aren't aware
> of the soft cap and the fact that it's adjustable and get frustrated
> over the time poured into debugging their iostat numbers for workloads
> that can send object (set) size I/Os.
> 
> Looking at the git history, we lowered io_opt from objset_bytes to
> opts->alloc_size in commit [1], but I guess io_opt was lowered just
> along for the ride.  What that commit was concerned with is really
> discard_granularity and to a smaller extent io_min.
> 
> How much difference does io_opt make in the real world?  If what rbd
> does stands in the way of a tree-wide cleanup, I would much rather bump
> io_opt back to objset_bytes (i.e. what max_user_sectors is currently
> set to).

The only existing in-kernel usage is to set the readahead size.
Based on your comments I seems like we should revert io_opt to
objset to ->alloc_size in a prep patch?


