Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 382082B7A6C
	for <lists+xen-devel@lfdr.de>; Wed, 18 Nov 2020 10:32:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.29664.59258 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfJp8-0007Ix-Tc; Wed, 18 Nov 2020 09:32:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 29664.59258; Wed, 18 Nov 2020 09:32:22 +0000
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
	id 1kfJp8-0007IO-Pe; Wed, 18 Nov 2020 09:32:22 +0000
Received: by outflank-mailman (input) for mailman id 29664;
 Wed, 18 Nov 2020 09:32:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nHbf=EY=linuxfoundation.org=gregkh@srs-us1.protection.inumbo.net>)
 id 1kfJp7-0007H4-7R
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 09:32:21 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5ba75b7b-2f31-4ed3-aa37-e61f79eed017;
 Wed, 18 Nov 2020 09:32:17 +0000 (UTC)
Received: from localhost (unknown [89.205.136.214])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 651A320855;
 Wed, 18 Nov 2020 09:32:15 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=nHbf=EY=linuxfoundation.org=gregkh@srs-us1.protection.inumbo.net>)
	id 1kfJp7-0007H4-7R
	for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 09:32:21 +0000
X-Inumbo-ID: 5ba75b7b-2f31-4ed3-aa37-e61f79eed017
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 5ba75b7b-2f31-4ed3-aa37-e61f79eed017;
	Wed, 18 Nov 2020 09:32:17 +0000 (UTC)
Received: from localhost (unknown [89.205.136.214])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 651A320855;
	Wed, 18 Nov 2020 09:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1605691936;
	bh=z9AARqxEifx27ZSfSqyQtp5/QTEI/AENwIGCm/wc71c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fFTiyRf+lNKL9ST4txcSeaDrCIqy8sGZqtdcsNAnsGly1+5GYCQkd5b0dJtsVNXW7
	 Ty+UOKz4POaIjvZvW72SkGo52lChY2pkhIjug9dEhWmDqtz52fKjvNwDSvPQKw5/EX
	 XjQbNqUIRf7iTd7GfCLBQpWa8uhdec/9xDR/QuiU=
Date: Wed, 18 Nov 2020 10:32:12 +0100
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
Message-ID: <X7TqHNotTX6W/bmT@kroah.com>
References: <20201118084800.2339180-1-hch@lst.de>
 <22ca5396-0253-f286-9eab-d417b2e0b3ad@suse.com>
 <20201118085804.GA20384@lst.de>
 <1ded2079-f1be-6d5d-01df-65754447df78@suse.com>
 <X7Tky/6dDN8+DrU7@kroah.com>
 <61044f85-cd41-87b5-3f41-36e3dffb6f2a@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <61044f85-cd41-87b5-3f41-36e3dffb6f2a@suse.com>

On Wed, Nov 18, 2020 at 10:23:51AM +0100, Jan Beulich wrote:
> On 18.11.2020 10:09, Greg KH wrote:
> > On Wed, Nov 18, 2020 at 10:04:04AM +0100, Jan Beulich wrote:
> >> On 18.11.2020 09:58, Christoph Hellwig wrote:
> >>> On Wed, Nov 18, 2020 at 09:56:11AM +0100, Jan Beulich wrote:
> >>>> since this isn't the first series from you recently spamming
> >>>> xen-devel, may I ask that you don't Cc entire series to lists
> >>>> which are involved with perhaps just one out of the many patches?
> >>>> IMO Cc lists should be compiled on a per-patch basis; the cover
> >>>> letter may of course be sent to the union of all of them.
> >>>
> >>> No way.  Individual CCs are completely broken as they don't provide
> >>> the reviewer a context.
> >>
> >> That's the view of some people, but not all. Context can be easily
> >> established by those who care going to one of the many archives on
> >> which the entire series lands. Getting spammed, however, can't be
> >> avoided by the dozens or hundreds of list subscribers.
> > 
> > kernel patches are never "spam", sorry, but for developers to try to
> > determine which lists/maintainers want to see the whole series and which
> > do not is impossible.
> > 
> > Patches in a series are easily deleted from sane mail clients with a
> > single click/keystroke all at once, they aren't a problem that needs to
> > be reduced in volume.
> 
> This doesn't scale, neither in the dimension of recipients nor in
> the dimension of possible sources of such series.

Again, trying to figure out what subsystem does, and does not, want
stuff like this does not scale either.  Remember, we had 4000 developers
last year, how are you going to tell all of them what the special rules
are for your subsystem and how they differ from any other subsystem?

And why does it matter?  We are all working on the same project, why
wouldn't you want to see core block device handling patches?  What
hurts with that, someone might notice something in one of them that a
different developer did not.

> While it may seem small, it's also a waste of resources to have mails
> sent to hundreds of even thousands of people. So while from a
> technical content perspective I surely agree with you saying 'kernel
> patches are never "spam"', they still are from the perspective of
> what "spam mail" originally means: Mail the recipients did not want
> to receive.

Anyone on a kernel subsystem mailing list should expect to see kernel
patches, that's part of the process, and always has been.

Kernel subsystems are not silos, people on them should be aware of what
else is going on in order to stay informed.  And again, if it's a huge
problem, one click/keystroke and they are gone, no waste.

thanks,

greg k-h

