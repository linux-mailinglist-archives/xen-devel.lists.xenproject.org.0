Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4312019E9
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2020 20:05:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jmLNQ-00017h-8k; Fri, 19 Jun 2020 18:04:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hXJh=AA=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jmLNP-00017c-4Z
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2020 18:04:31 +0000
X-Inumbo-ID: 51e3471b-b257-11ea-bbdb-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 51e3471b-b257-11ea-bbdb-12813bfff9fa;
 Fri, 19 Jun 2020 18:04:30 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1CA2E20DD4;
 Fri, 19 Jun 2020 18:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592589869;
 bh=9U29+BVl1swW9146VN/4P8eJUSjGnGmPDxuGpmJAwn4=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=wsJfZ2CZWiF2NBGJ6InL8H0prHLWWBwKcuIk4gxNAM4AHD7aPPNxqLljqGgZr49oh
 /UDQucoBDhr/RqBLzcKn9/mtJa1ttxbZiufVVeNonXm9GKXkallzOSkhX42atnl4OI
 8b+6yvE5TkApoFQmFwKpT5qbcQSkuNp55uBqd4Bk=
Date: Fri, 19 Jun 2020 11:04:28 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
Subject: Re: [PATCH] xen/arm: optee: allow plain TMEM buffers with NULL address
In-Reply-To: <c872a437-b698-55b4-36f4-4aa10cf3bba2@xen.org>
Message-ID: <alpine.DEB.2.21.2006191101570.12730@sstabellini-ThinkPad-T480s>
References: <2a32c7c2048333169c9378194d6a435e2e7ed2d7.camel@epam.com>
 <1b596a11-95b5-3e87-bbf5-c0c4dceb6489@xen.org> <878sgk2bst.fsf@epam.com>
 <8d2f3475-4191-fa80-f476-e72af73e0559@xen.org> <87h7v71ixf.fsf@epam.com>
 <c5af5b0c-eb18-04a5-80e9-99054eeb192e@xen.org>
 <alpine.DEB.2.21.2006191012540.12730@sstabellini-ThinkPad-T480s>
 <c872a437-b698-55b4-36f4-4aa10cf3bba2@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, "paul@xen.org" <paul@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, 19 Jun 2020, Julien Grall wrote:
> On 19/06/2020 18:15, Stefano Stabellini wrote:
> > On Fri, 19 Jun 2020, Julien Grall wrote:
> > > Hi Volodymyr,
> > > 
> > > On 19/06/2020 10:52, Volodymyr Babchuk wrote:
> > > > > > > > OP-TEE represents this null memory reference as a TMEM parameter
> > > > > > > > with
> > > > > > > > buf_ptr == NULL. This is the only case when we should allow TMEM
> > > > > > > > buffer without the OPTEE_MSG_ATTR_NONCONTIG flag.
> > > > > > > 
> > > > > > > IIUC, 0 with OPTEE_MSG_ATTR_NONCONTIG set would mean "use the
> > > > > > > buffer
> > > > > > > at address 0" but with the flag cleared, it would mean "return the
> > > > > > > size". Am I correct?
> > > > > > 
> > > > > > Not exactly. This flag does not affect behavior for buffers with
> > > > > > address
> > > > > > NULL. In any case, this would not mean "return the size" to
> > > > > > OP-TEE. This is because OP-TEE works as a transport between CA and
> > > > > > TA
> > > > > > and it does not assign any meaning to client buffers. But certainly,
> > > > > > null buffer will mean "return the size" for some TAs, as described
> > > > > > in
> > > > > > GlobalPlatform specification.
> > > > > 
> > > > > Does it mean a guest TA may potentially access address 0?
> > > > 
> > > > TA is running in S-EL0. That buffer with PA=0x0 will be not mapped in TA
> > > > address space at all. So, if TA will try to access address 0, it
> > > > will be terminated with data abort.
> > > > 
> > > > > I am asking that because 0 can be a valid host physical address. We
> > > > > are currently carving out 0 from the heap allocator to workaround a
> > > > > bug, but there is no promise this address will be used by the boot
> > > > > allocator and therefore Xen.
> > > > > 
> > > > 
> > > > Well, this is a potential issue in OP-TEE. It does not treat 0 as a
> > > > valid address. So, in that rare case, when REE will try to use 0
> > > > as a correct address for data buffer, OP-TEE will not map it into
> > > > TA address space, instead it will pass NULL to TA, so TA will think that
> > > > no buffer was provided.
> > > 
> > > Thanks! That's reassuring. Although, I think we may still need to prevent
> > > MFN
> > > 0 to be allocated for a guest using OP-TEE. So they don't end up with
> > > weird
> > > failure.
> > > 
> > > I don't think this is an issue so far, but this may change with Stefano's
> > > dom0less series to support direct mapping.
> > 
> > Yes, it is interesting to know about this limitation.
> > 
> > In regards to this patch, it looks OK as-is in terms of code changes.
> 
> I would disagree here. NULL has never been handled correctly for TMEM buffers
> (see [1]). I would argue this needs to be folded within this patch rather than
> be a separate one.

I am OK with that too.


> > Aside from a link to this conversation in the xen-devel archives, is
> > there anything else you would like to add to the commit message?
> +1 for the link. However, I don't think the commit message fully
> match/summarize the discussion here.
> 
> What needs to be clearly spell out is that existing OP-TEEs will never map MFN
> 0.

That would be nice


> Cheers,
> 
> [1]  <87h7v71ixf.fsf@epam.com>


