Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0E7C1F7FE8
	for <lists+xen-devel@lfdr.de>; Sat, 13 Jun 2020 02:25:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjtyB-0000L8-Iq; Sat, 13 Jun 2020 00:24:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M5F9=72=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jjty9-0000L3-Ib
 for xen-devel@lists.xenproject.org; Sat, 13 Jun 2020 00:24:21 +0000
X-Inumbo-ID: 3940eb90-ad0c-11ea-b62a-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3940eb90-ad0c-11ea-b62a-12813bfff9fa;
 Sat, 13 Jun 2020 00:24:20 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 283A820739;
 Sat, 13 Jun 2020 00:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592007859;
 bh=WtYzOAGm8F6NDuTj6ACYHcybAzqMxQYB6yVaeujxXg4=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=UMVjGDNQNPjMH6f6ROfdzAO4EotnlBf2VCN+udDI481c5B5qjkpBQX6JqG/kWucua
 ZhrRLDORFSFoOJgY47b1nZLIv+TCtD3el6xMv11aLIIYrNVBFdel/VYz4w7lMccRpt
 7xKAP7xKU4qKtsoFVbCFFNGaRTQnvk7kaN4vLDyg=
Date: Fri, 12 Jun 2020 17:24:18 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
Subject: Re: [PATCH 1/2] xen/arm: Convert runstate address during hypcall
In-Reply-To: <a8379e95-3f9c-1ee3-61fd-741bb9c41d4b@xen.org>
Message-ID: <alpine.DEB.2.21.2006120925070.2815@sstabellini-ThinkPad-T480s>
References: <cover.1591806713.git.bertrand.marquis@arm.com>
 <8b450dddb2c855225c97741dce66453a80b9add2.1591806713.git.bertrand.marquis@arm.com>
 <alpine.DEB.2.21.2006111055360.2815@sstabellini-ThinkPad-T480s>
 <CAJ=z9a3u7ztgSmJbhjVATrfJEBBVkHbZei6ydBQeV8nzdDFA3Q@mail.gmail.com>
 <alpine.DEB.2.21.2006111143530.2815@sstabellini-ThinkPad-T480s>
 <74475748-e884-1e6e-633d-bf67d5ed32fe@xen.org>
 <alpine.DEB.2.21.2006111250180.2815@sstabellini-ThinkPad-T480s>
 <a8379e95-3f9c-1ee3-61fd-741bb9c41d4b@xen.org>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Julien Grall <julien.grall.oss@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, 12 Jun 2020, Julien Grall wrote:
> > Writing byte by byte is a different case. That is OK. In that case, the
> > guest could see the state after 3 bytes written and it would be fine and
> > consistent.
> 
> Why? What does actually prevent a guest to see an in-between value?
> 
> To give a concrete example, if the original value is 0xabc and you want to
> write 0xdef. Why would the guest never see 0xabf or 0xaec?

That is a good question, but the minimum granularity is 1 byte, so if

  current: 0xaabbcc
  new: 0xddeeff

Can the guest see one of the following?

  0xaabbff
  0xaaeecc

Yes, it can. I don't think it is a problem in this case because we only
change 1 byte, so to continue with the example:

  current: 0xaabbcc
  new: 0xffbbcc

So the only values the VM can see are either 0xaabbcc or 0xffbbcc.


> > If this hadn't been the case, then yes, the existing code
> > would also be buggy.
> > 
> > So if we did the write with a memcpy, it would be fine, no need for
> > atomics:
> > 
> >    memcpy(&guest_runstate->state_entry_time,
> >           &v->runstate.state_entry_time,
> >           XXX);
> > 
> > 
> > The |= case is different: GCC could implement it in any way it likes,
> > including going through a zero-write to any of the bytes in the word, or
> > doing an addition then a subtraction. GCC doesn't make any guarantees.
> > If we want guarantees we need to use atomics.
> 
> Yes GCC can generate assembly for |= in any way it likes. But so does for
> memcpy(). So I still don't understand why one would be fine for you and not
> the other...

It is down to the implementation of memcpy to guarantee that the only
thing memcpy does is memory copies. memcpy doesn't specify whether it is
going to use byte-copies or word-copies, but it should only do copies.
If we have to write memcpy in assembly to make it so, so be it :-)

