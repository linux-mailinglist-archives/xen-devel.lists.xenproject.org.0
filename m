Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C649840BD6F
	for <lists+xen-devel@lfdr.de>; Wed, 15 Sep 2021 03:54:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.187172.335947 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQK7w-0001d9-7X; Wed, 15 Sep 2021 01:54:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 187172.335947; Wed, 15 Sep 2021 01:54:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQK7w-0001aZ-3v; Wed, 15 Sep 2021 01:54:20 +0000
Received: by outflank-mailman (input) for mailman id 187172;
 Wed, 15 Sep 2021 01:54:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3+tO=OF=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mQK7u-0001aT-P5
 for xen-devel@lists.xenproject.org; Wed, 15 Sep 2021 01:54:18 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d61b2c30-15c7-11ec-b48b-12813bfff9fa;
 Wed, 15 Sep 2021 01:54:18 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 268A3600AA;
 Wed, 15 Sep 2021 01:54:17 +0000 (UTC)
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
X-Inumbo-ID: d61b2c30-15c7-11ec-b48b-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1631670857;
	bh=MqDbmijwQbGSZNaO6bnRJxyOp/mjLub5Df6jQIZhwdo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=fdw1xpnMmAZA7cwc4JwkDdxOK1Ood93KCC1NKZQMNArWCxBySC/614vrjkBhJ8tgP
	 Q9O9Ws4O8XX8tfEd/WOeTy75REHHK3vsBsO2HUf7aVGOo0iSeSotEZx7svfOdXVl9j
	 z95jluv5tsVxH0Lm8wezkptaCUavlWBE258hUHmDnldgy3EC+6wzollKQ0C7uwEdlW
	 qWEBluOz+xjG8yZWtXkLM1SDRkUT2dbTs9+M+6vNejCz3shyumHTdpEEQECyDz/EMb
	 CBCt9Q5Nms7OaO5uhbfocfIgWAfCssLrv6PQy1FJtY1KifnwJHYMX0S8eGWmSYaQg5
	 d57v3bdIK516w==
Date: Tue, 14 Sep 2021 18:54:16 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Stefano Stabellini <sstabellini@kernel.org>
cc: Jan Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>, 
    Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
    lkml <linux-kernel@vger.kernel.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 04/12] swiotlb-xen: ensure to issue well-formed
 XENMEM_exchange requests
In-Reply-To: <alpine.DEB.2.21.2109141817150.21985@sstabellini-ThinkPad-T480s>
Message-ID: <alpine.DEB.2.21.2109141853510.21985@sstabellini-ThinkPad-T480s>
References: <588b3e6d-2682-160c-468e-44ca4867a570@suse.com> <397bf325-f81e-e104-6142-e8c9c4955475@suse.com> <alpine.DEB.2.21.2109101613130.10523@sstabellini-ThinkPad-T480s> <d868bbcc-e800-ed30-3524-a30a5feb7e5a@suse.com> <alpine.DEB.2.21.2109131328130.10523@sstabellini-ThinkPad-T480s>
 <9819a6e9-93d5-e62a-7b4a-ffc2ecd996dc@suse.com> <alpine.DEB.2.21.2109141817150.21985@sstabellini-ThinkPad-T480s>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 14 Sep 2021, Stefano Stabellini wrote:
> On Tue, 14 Sep 2021, Jan Beulich wrote:
> > On 13.09.2021 22:31, Stefano Stabellini wrote:
> > > On Mon, 13 Sep 2021, Jan Beulich wrote:
> > >> On 11.09.2021 01:14, Stefano Stabellini wrote:
> > >>> On Tue, 7 Sep 2021, Jan Beulich wrote:
> > >>>> While the hypervisor hasn't been enforcing this, we would still better
> > >>>> avoid issuing requests with GFNs not aligned to the requested order.
> > >>>>
> > >>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > >>>> ---
> > >>>> I wonder how useful it is to include the alignment in the panic()
> > >>>> message.
> > >>>
> > >>> Not very useful given that it is static. I don't mind either way but you
> > >>> can go ahead and remove it if you prefer (and it would make the line
> > >>> shorter.)
> > >>>
> > >>>
> > >>>> I further wonder how useful it is to wrap "bytes" in
> > >>>> PAGE_ALIGN(), when it is a multiple of a segment's size anyway (or at
> > >>>> least was supposed to be, prior to "swiotlb-xen: maintain slab count
> > >>>> properly").
> > >>>
> > >>> This one I would keep, to make sure to print out the same amount passed
> > >>> to memblock_alloc.
> > >>
> > >> Oh - if I was to drop it from the printk(), I would have been meaning to
> > >> also drop it there. If it's useless, then it's useless everywhere.
> > > 
> > > That's fine too
> > 
> > Thanks, I'll see about dropping that then.
> > 
> > Another Arm-related question has occurred to me: Do you actually
> > mind the higher-than-necessary alignment there? If so, a per-arch
> > definition of the needed alignment would need introducing. Maybe
> > that could default to PAGE_SIZE, allowing Arm and alike to get away
> > without explicitly specifying a value ...
> 
> Certainly a patch like that could be good. Given that it is only one
> allocation I was assuming that the higher-than-necessary alignment
> wouldn't be a problem worth addressing (and I cannot completely rule out
> that one day we might have to use XENMEM_exchange on ARM too).

Also this code is currently #ifdef CONFIG_X86

