Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD322B7A00
	for <lists+xen-devel@lfdr.de>; Wed, 18 Nov 2020 10:09:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.29606.59151 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfJT9-0003Ts-P1; Wed, 18 Nov 2020 09:09:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 29606.59151; Wed, 18 Nov 2020 09:09:39 +0000
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
	id 1kfJT9-0003TW-Ln; Wed, 18 Nov 2020 09:09:39 +0000
Received: by outflank-mailman (input) for mailman id 29606;
 Wed, 18 Nov 2020 09:09:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nHbf=EY=linuxfoundation.org=gregkh@srs-us1.protection.inumbo.net>)
 id 1kfJT7-0003TL-75
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 09:09:37 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8bcd5b7e-4066-4796-9df4-0568ada297d5;
 Wed, 18 Nov 2020 09:09:36 +0000 (UTC)
Received: from localhost (unknown [89.205.136.214])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9917624654;
 Wed, 18 Nov 2020 09:09:34 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=nHbf=EY=linuxfoundation.org=gregkh@srs-us1.protection.inumbo.net>)
	id 1kfJT7-0003TL-75
	for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 09:09:37 +0000
X-Inumbo-ID: 8bcd5b7e-4066-4796-9df4-0568ada297d5
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 8bcd5b7e-4066-4796-9df4-0568ada297d5;
	Wed, 18 Nov 2020 09:09:36 +0000 (UTC)
Received: from localhost (unknown [89.205.136.214])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 9917624654;
	Wed, 18 Nov 2020 09:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1605690575;
	bh=rlMS1sadYjwrkOitszZnRWq9x8/FlFRlxO9KFeT4hXw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QvQ9CDWAZ+aCGrhuhHt3KiLNX56hdxRsHiHsSNxvbaUSHz6i1GWYU6j5V0JItZEcx
	 llhTvrS0/4DRQzsuq3ZQjlr2mZwhOCX6FAvymqM3x9Z9fA3EfhIfp/BEr9wBHSBMNx
	 c5aj9Y6nPE53BpvdaFfcqrxO6ubTxyi29A1Jsf3g=
Date: Wed, 18 Nov 2020 10:09:31 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: Christoph Hellwig <hch@lst.de>, Tejun Heo <tj@kernel.org>,
	Josef Bacik <josef@toxicpanda.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Coly Li <colyli@suse.de>, Mike Snitzer <snitzer@redhat.com>,
	dm-devel@redhat.com, Richard Weinberger <richard@nod.at>,
	Jan Kara <jack@suse.com>, linux-block@vger.kernel.org,
	xen-devel@lists.xenproject.org, linux-bcache@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org, Jens Axboe <axboe@kernel.dk>
Subject: Re: merge struct block_device and struct hd_struct
Message-ID: <X7Tky/6dDN8+DrU7@kroah.com>
References: <20201118084800.2339180-1-hch@lst.de>
 <22ca5396-0253-f286-9eab-d417b2e0b3ad@suse.com>
 <20201118085804.GA20384@lst.de>
 <1ded2079-f1be-6d5d-01df-65754447df78@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1ded2079-f1be-6d5d-01df-65754447df78@suse.com>

On Wed, Nov 18, 2020 at 10:04:04AM +0100, Jan Beulich wrote:
> On 18.11.2020 09:58, Christoph Hellwig wrote:
> > On Wed, Nov 18, 2020 at 09:56:11AM +0100, Jan Beulich wrote:
> >> since this isn't the first series from you recently spamming
> >> xen-devel, may I ask that you don't Cc entire series to lists
> >> which are involved with perhaps just one out of the many patches?
> >> IMO Cc lists should be compiled on a per-patch basis; the cover
> >> letter may of course be sent to the union of all of them.
> > 
> > No way.  Individual CCs are completely broken as they don't provide
> > the reviewer a context.
> 
> That's the view of some people, but not all. Context can be easily
> established by those who care going to one of the many archives on
> which the entire series lands. Getting spammed, however, can't be
> avoided by the dozens or hundreds of list subscribers.

kernel patches are never "spam", sorry, but for developers to try to
determine which lists/maintainers want to see the whole series and which
do not is impossible.

Patches in a series are easily deleted from sane mail clients with a
single click/keystroke all at once, they aren't a problem that needs to
be reduced in volume.

thanks,

greg k-h

