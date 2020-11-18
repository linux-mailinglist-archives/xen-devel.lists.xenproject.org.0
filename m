Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB01C2B81B3
	for <lists+xen-devel@lfdr.de>; Wed, 18 Nov 2020 17:25:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.30085.59809 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfQGL-0001Gr-TU; Wed, 18 Nov 2020 16:24:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 30085.59809; Wed, 18 Nov 2020 16:24:53 +0000
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
	id 1kfQGL-0001GS-Pm; Wed, 18 Nov 2020 16:24:53 +0000
Received: by outflank-mailman (input) for mailman id 30085;
 Wed, 18 Nov 2020 16:24:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VXpI=EY=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1kfQGJ-0001GN-Tr
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 16:24:51 +0000
Received: from verein.lst.de (unknown [213.95.11.211])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b0725eb9-ccbf-4c9f-90e4-bcd5756588d5;
 Wed, 18 Nov 2020 16:24:50 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id E61A068B05; Wed, 18 Nov 2020 17:24:48 +0100 (CET)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=VXpI=EY=lst.de=hch@srs-us1.protection.inumbo.net>)
	id 1kfQGJ-0001GN-Tr
	for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 16:24:51 +0000
X-Inumbo-ID: b0725eb9-ccbf-4c9f-90e4-bcd5756588d5
Received: from verein.lst.de (unknown [213.95.11.211])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id b0725eb9-ccbf-4c9f-90e4-bcd5756588d5;
	Wed, 18 Nov 2020 16:24:50 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id E61A068B05; Wed, 18 Nov 2020 17:24:48 +0100 (CET)
Date: Wed, 18 Nov 2020 17:24:47 +0100
From: Christoph Hellwig <hch@lst.de>
To: Coly Li <colyli@suse.de>
Cc: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
	Tejun Heo <tj@kernel.org>, Josef Bacik <josef@toxicpanda.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Mike Snitzer <snitzer@redhat.com>, dm-devel@redhat.com,
	Richard Weinberger <richard@nod.at>, Jan Kara <jack@suse.com>,
	linux-block@vger.kernel.org, xen-devel@lists.xenproject.org,
	linux-bcache@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH 19/20] bcache: remove a superflous lookup_bdev all
Message-ID: <20201118162447.GB16753@lst.de>
References: <20201118084800.2339180-1-hch@lst.de> <20201118084800.2339180-20-hch@lst.de> <e7f826fd-cb9c-b4ab-fae8-dad398c14eed@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e7f826fd-cb9c-b4ab-fae8-dad398c14eed@suse.de>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Wed, Nov 18, 2020 at 04:54:51PM +0800, Coly Li wrote:
> On 11/18/20 4:47 PM, Christoph Hellwig wrote:
> > Don't bother to call lookup_bdev for just a slightly different error
> > message without any functional change.
> > 
> > Signed-off-by: Christoph Hellwig <hch@lst.de>ist
> 
> Hi Christoph,
> 
> NACK. This removing error message is frequently triggered and observed,
> and distinct a busy device and an already registered device is important
> (the first one is critical error and second one is not).
> 
> Remove such error message will be a functional regression.

I can probably keep it, the amount of code to prettiefy an error message
seems excessive, though.

