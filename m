Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2A88D5AE9
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2024 08:56:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.733298.1139452 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCwBM-0002aS-KC; Fri, 31 May 2024 06:56:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 733298.1139452; Fri, 31 May 2024 06:56:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCwBM-0002YX-GP; Fri, 31 May 2024 06:56:08 +0000
Received: by outflank-mailman (input) for mailman id 733298;
 Fri, 31 May 2024 06:56:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ULw3=NC=lst.de=hch@srs-se1.protection.inumbo.net>)
 id 1sCwBK-0002YA-PP
 for xen-devel@lists.xenproject.org; Fri, 31 May 2024 06:56:06 +0000
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d8bbd908-1f1a-11ef-90a1-e314d9c70b13;
 Fri, 31 May 2024 08:56:03 +0200 (CEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id CC83168BEB; Fri, 31 May 2024 08:56:00 +0200 (CEST)
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
X-Inumbo-ID: d8bbd908-1f1a-11ef-90a1-e314d9c70b13
Date: Fri, 31 May 2024 08:56:00 +0200
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
Message-ID: <20240531065600.GA18681@lst.de>
References: <20240529050507.1392041-1-hch@lst.de> <20240529050507.1392041-3-hch@lst.de> <CAOi1vP-F0FO4WTnrEt7FC-uu2C8NTbejvJQQGdZqT475c2G1jA@mail.gmail.com> <20240531055456.GC17396@lst.de> <CAOi1vP-VXeOH-kShRKv-b=id1zN9tLiqOo8EKpOWoJuQp_Pm1g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOi1vP-VXeOH-kShRKv-b=id1zN9tLiqOo8EKpOWoJuQp_Pm1g@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Fri, May 31, 2024 at 08:48:12AM +0200, Ilya Dryomov wrote:
> We should revert io_opt from opts->alloc_size to objset_bytes (I think
> it's what you meant to say but typoed).

Yes, sorry.

> How do you want to handle it?  I can put together a patch, send it to
> ceph-devel and it will be picked by linux-next sometime next week.  Then
> this patch would grow a contextual conflict and the description would
> need to be updated to not mention a behavior change for rbd anymore.

If that works for you I'd much prefer to include it with this series.
I'd be happy to write it myself.


