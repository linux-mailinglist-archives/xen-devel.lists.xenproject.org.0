Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F632B7A25
	for <lists+xen-devel@lfdr.de>; Wed, 18 Nov 2020 10:14:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.29619.59175 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfJWp-0004da-KY; Wed, 18 Nov 2020 09:13:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 29619.59175; Wed, 18 Nov 2020 09:13:27 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfJWp-0004d7-G6; Wed, 18 Nov 2020 09:13:27 +0000
Received: by outflank-mailman (input) for mailman id 29619;
 Wed, 18 Nov 2020 09:13:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nHbf=EY=linuxfoundation.org=gregkh@srs-us1.protection.inumbo.net>)
 id 1kfJWo-0004d1-FV
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 09:13:26 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7488384b-880e-45ec-9950-8e3bdb54a4f0;
 Wed, 18 Nov 2020 09:13:26 +0000 (UTC)
Received: from localhost (unknown [89.205.136.214])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 080C124656;
 Wed, 18 Nov 2020 09:13:24 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=nHbf=EY=linuxfoundation.org=gregkh@srs-us1.protection.inumbo.net>)
	id 1kfJWo-0004d1-FV
	for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 09:13:26 +0000
X-Inumbo-ID: 7488384b-880e-45ec-9950-8e3bdb54a4f0
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 7488384b-880e-45ec-9950-8e3bdb54a4f0;
	Wed, 18 Nov 2020 09:13:26 +0000 (UTC)
Received: from localhost (unknown [89.205.136.214])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 080C124656;
	Wed, 18 Nov 2020 09:13:24 +0000 (UTC)
Date: Wed, 18 Nov 2020 10:13:21 +0100
From: Greg KH <greg@kroah.com>
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Tejun Heo <tj@kernel.org>,
	Josef Bacik <josef@toxicpanda.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Coly Li <colyli@suse.de>, Mike Snitzer <snitzer@redhat.com>,
	dm-devel@redhat.com, Richard Weinberger <richard@nod.at>,
	Jan Kara <jack@suse.com>, linux-block@vger.kernel.org,
	xen-devel@lists.xenproject.org, linux-bcache@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: merge struct block_device and struct hd_struct
Message-ID: <X7TlsaY2vWQceNAI@kroah.com>
References: <20201118084800.2339180-1-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201118084800.2339180-1-hch@lst.de>

On Wed, Nov 18, 2020 at 09:47:40AM +0100, Christoph Hellwig wrote:
> Hi Jens,
> 
> this series cleans up our main per-device node data structure by merging
> the block_device and hd_struct data structures that have the same scope,
> but different life times.  The main effect (besides removing lots of
> code) is that instead of having two device sizes that need complex
> synchronization there is just one now.
> 
> Note that it depends on the previous "misc cleanups" series.
> 
> A git tree is available here:
> 
>     git://git.infradead.org/users/hch/block.git bdev-lookup
> 
> Gitweb:
> 
>     http://git.infradead.org/users/hch/block.git/shortlog/refs/heads/bdev-lookup

Nice cleanups, thanks for doing this.

Series is:
	Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

