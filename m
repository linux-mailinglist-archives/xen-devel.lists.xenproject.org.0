Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E73E02B7A12
	for <lists+xen-devel@lfdr.de>; Wed, 18 Nov 2020 10:11:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.29612.59163 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfJUX-0004Ox-4i; Wed, 18 Nov 2020 09:11:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 29612.59163; Wed, 18 Nov 2020 09:11:05 +0000
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
	id 1kfJUX-0004OY-16; Wed, 18 Nov 2020 09:11:05 +0000
Received: by outflank-mailman (input) for mailman id 29612;
 Wed, 18 Nov 2020 09:11:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nHbf=EY=linuxfoundation.org=gregkh@srs-us1.protection.inumbo.net>)
 id 1kfJUW-0004OT-6q
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 09:11:04 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7072fdae-d980-4f8c-b2da-ad8d23c7c655;
 Wed, 18 Nov 2020 09:11:03 +0000 (UTC)
Received: from localhost (unknown [89.205.136.214])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B78812463B;
 Wed, 18 Nov 2020 09:11:01 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=nHbf=EY=linuxfoundation.org=gregkh@srs-us1.protection.inumbo.net>)
	id 1kfJUW-0004OT-6q
	for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 09:11:04 +0000
X-Inumbo-ID: 7072fdae-d980-4f8c-b2da-ad8d23c7c655
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 7072fdae-d980-4f8c-b2da-ad8d23c7c655;
	Wed, 18 Nov 2020 09:11:03 +0000 (UTC)
Received: from localhost (unknown [89.205.136.214])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id B78812463B;
	Wed, 18 Nov 2020 09:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1605690662;
	bh=Bue2zB2N2pWeoRPAFrKwsKTqFelMoJ7u0NZ6+qsm2lg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AUVDTnsv/loeevWqNPhDEkXzwfiVWRnXETQJyNJXKc5mWs6sh2/R+S+4LQ/OFGnQM
	 mOBEBCOR8sMcPnpugDJC5+SsVWCCE8mnORUdyAcVNy/d+rccVY9fUSts6rTlPUQzCj
	 zWFg0HoHn1XdWsg1BSMcc/c8vCuPf8k8NOKoeBhI=
Date: Wed, 18 Nov 2020 10:10:59 +0100
From: Greg KH <gregkh@linuxfoundation.org>
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
Message-ID: <X7TlIzxJPfa2p+Da@kroah.com>
References: <20201118084800.2339180-1-hch@lst.de>
 <20201118084800.2339180-20-hch@lst.de>
 <e7f826fd-cb9c-b4ab-fae8-dad398c14eed@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e7f826fd-cb9c-b4ab-fae8-dad398c14eed@suse.de>

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

What normal operation causes this error message to be emitted?  And what
can a user do with it?

thanks,

greg k-h

