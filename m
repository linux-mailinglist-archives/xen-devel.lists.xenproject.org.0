Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F18B7419695
	for <lists+xen-devel@lfdr.de>; Mon, 27 Sep 2021 16:43:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.197024.349955 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUrqj-0003QF-2d; Mon, 27 Sep 2021 14:43:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 197024.349955; Mon, 27 Sep 2021 14:43:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUrqi-0003O2-Vo; Mon, 27 Sep 2021 14:43:20 +0000
Received: by outflank-mailman (input) for mailman id 197024;
 Mon, 27 Sep 2021 14:43:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mUrqh-0003Nw-6X
 for xen-devel@lists.xenproject.org; Mon, 27 Sep 2021 14:43:19 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mUrqh-0001XX-5V
 for xen-devel@lists.xenproject.org; Mon, 27 Sep 2021 14:43:19 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mUrqh-0005M7-4E
 for xen-devel@lists.xenproject.org; Mon, 27 Sep 2021 14:43:19 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mUrqd-0000lG-LW; Mon, 27 Sep 2021 15:43:15 +0100
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=1TRhJg8PYLjD3J6NES3KkqVbp7A6faSg0tvEFu/PVEQ=; b=WzE9SKC+WjHQCmbRwBVZVOaQrl
	FLmTGsgmoyU0C3XPPU3cBeGHSTX+VkFvjzhOahoKZZ6iQhLvwH2q+SQgdAZJqF9k/mbAvBDDztDen
	E+/DYAUCICKAttZO7ITriW1L0+nSqpwhS8WHYArGJ5iuuPexj6E5c+42vuSd6bEMN+mY=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24913.55427.402592.660538@mariner.uk.xensource.com>
Date: Mon, 27 Sep 2021 15:43:15 +0100
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org,
    Andrew Cooper  <andrew.cooper3@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Jan Beulich <jbeulich@suse.com>,
    Julien Grall <julien@xen.org>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Wei Liu <wl@xen.org>,
    Samuel Thibault <samuel.thibault@ens-lyon.org>,
    Community Manager <community.manager@xenproject.org>
Subject: Re: [PATCH v3 0/3] disable building of pv-grub and qemu-trad per
 default
In-Reply-To: <d894799e-27c6-bbbd-8d65-3e32c1aff843@suse.com>
References: <20210910055518.562-1-jgross@suse.com>
	<24891.31480.165445.521062@mariner.uk.xensource.com>
	<d894799e-27c6-bbbd-8d65-3e32c1aff843@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Juergen Gross writes ("Re: [PATCH v3 0/3] disable building of pv-grub and qemu-trad per default"):
> On 10.09.21 17:34, Ian Jackson wrote:
> > Juergen Gross writes ("[PATCH v3 0/3] disable building of pv-grub and qemu-trad per default"):
> >> This is a first step of deprecating pv-grub and qemu-trad including
> >> ioemu-stubdom. Switch the default to not building it.
> > 
> > This is now fully acked.  But can we wait with committing it until we
> > have a decision about whether to (a) have osstest explicitly enable
> > the pv-grub and qemu-trad builds (b) have osstest stop testing these
> > configurations ?
> 
> Any decisions made?

No-one seems to have had any opinions.   I'll take ...

> FWIW I'd be fine dropping pv-grub builds and tests in OSStets, but I'd
> rather keep testing qemu-trad stubdom tests.

... that as a proposal :-).  think that is probably the right tradeoff.

I think that means that means we need osstest patches to edit
make-flight and ts-xen-build which

 * Explictly enables stubdom qemu build
 * Drops the pv-grub tests

and those need to go in first.

With my RM hat on, I think those changes to osstest may need a release
ack since they have missed the LPD, but I will grant such an ack.

As for the patches themselves, I may get to that tomorrow, but
contributions would be very welcome.

Thanks,
Ian.

