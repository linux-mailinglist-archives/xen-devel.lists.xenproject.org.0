Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7390E8D61A5
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2024 14:24:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.733688.1140010 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sD1Ii-0003DF-N7; Fri, 31 May 2024 12:24:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 733688.1140010; Fri, 31 May 2024 12:24:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sD1Ii-0003AT-Jt; Fri, 31 May 2024 12:24:04 +0000
Received: by outflank-mailman (input) for mailman id 733688;
 Fri, 31 May 2024 12:24:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ULw3=NC=lst.de=hch@srs-se1.protection.inumbo.net>)
 id 1sD1Ih-0003AN-Ea
 for xen-devel@lists.xenproject.org; Fri, 31 May 2024 12:24:03 +0000
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a893a0cc-1f48-11ef-b4bb-af5377834399;
 Fri, 31 May 2024 14:24:00 +0200 (CEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 5085768BFE; Fri, 31 May 2024 14:23:56 +0200 (CEST)
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
X-Inumbo-ID: a893a0cc-1f48-11ef-b4bb-af5377834399
Date: Fri, 31 May 2024 14:23:56 +0200
From: Christoph Hellwig <hch@lst.de>
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Josef Bacik <josef@toxicpanda.com>,
	Ilya Dryomov <idryomov@gmail.com>,
	Dongsheng Yang <dongsheng.yang@easystack.cn>,
	Roger Pau Monn?? <roger.pau@citrix.com>,
	linux-um@lists.infradead.org, linux-block@vger.kernel.org,
	nbd@other.debian.org, ceph-devel@vger.kernel.org,
	xen-devel@lists.xenproject.org, linux-scsi@vger.kernel.org
Subject: Re: convert the SCSI ULDs to the atomic queue limits API v2
Message-ID: <20240531122356.GA24343@lst.de>
References: <20240531074837.1648501-1-hch@lst.de> <yq17cfadwd0.fsf@ca-mkp.ca.oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq17cfadwd0.fsf@ca-mkp.ca.oracle.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Fri, May 31, 2024 at 08:07:54AM -0400, Martin K. Petersen wrote:
> If you have other block layer changes depending on this series we'll
> probably need a shared branch. I'll need to make several changes to sd.c
> to fix reported issues, including a couple in the zeroing/discard
> department.

Yes, I also want to move the various feature flags that currently
abususe queue->flags into the queue limits.  In the worst case I could
delay that for another merge window, but a shared branch would be
a lot nicer.


