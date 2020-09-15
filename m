Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15003269A6C
	for <lists+xen-devel@lfdr.de>; Tue, 15 Sep 2020 02:31:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kHys7-00081o-Hx; Tue, 15 Sep 2020 00:30:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9JNo=CY=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kHys6-00081b-CO
 for xen-devel@lists.xenproject.org; Tue, 15 Sep 2020 00:30:58 +0000
X-Inumbo-ID: 3bb16024-b2ae-4581-9726-706e0b88af17
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3bb16024-b2ae-4581-9726-706e0b88af17;
 Tue, 15 Sep 2020 00:30:57 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D107A208DB;
 Tue, 15 Sep 2020 00:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600129857;
 bh=dnBgHfY3VUCwUfEP769nXi6v6jNrbhjZikwfEmFl8o8=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=CUKf2JaCON/1Hm32/d3UYxzDzQRjZlt7EevOSYVSZpbiOVzdXXGRr9xUJazcOtjvT
 QVdaubb+5U0mYc7W1vh06g6OwJrDDOHEflqqUmI6Yg9mpEYcIU2jrirQt2Gf61DJlj
 qxX5mnlqT/AQFvX5nOrKHvWYEOomJ/zMQ1RXOJG8=
Date: Mon, 14 Sep 2020 17:30:56 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: Jan Beulich <jbeulich@suse.com>, 
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
 George Dunlap <george.dunlap@citrix.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Ian Jackson <ian.jackson@citrix.com>, Wei Liu <wl@xen.org>, 
 Anthony Perard <anthony.perard@citrix.com>, 
 Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: preparations for 4.13.2 and 4.12.4
In-Reply-To: <c4e43118-38e6-19d4-c91b-4a7ed45853b5@xen.org>
Message-ID: <alpine.DEB.2.21.2009141721140.28991@sstabellini-ThinkPad-T480s>
References: <427c2293-366d-2ab3-cfbb-b41db35bd8b6@suse.com>
 <c4e43118-38e6-19d4-c91b-4a7ed45853b5@xen.org>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, 11 Sep 2020, Julien Grall wrote:
> On 11/09/2020 14:11, Jan Beulich wrote:
> > All,
> > 
> > the releases are about due, but will of course want to wait for the
> > XSA fixes going public on the 22nd. Please point out backports
> > you find missing from the respective staging branches, but which
> > you consider relevant. (Ian, Julien, Stefano: I notice there once
> > again haven't been any tools or Arm side backports at all so far
> > since the most recent stable releases from these branches. But
> > maybe there simply aren't any.)
> > 
> > One that I have queued already, but which first need to at least
> > pass the push gate to master, are
> > 
> > 8efa46516c5f hvmloader: indicate ACPI tables with "ACPI data" type in e820
> > e5a1b6f0d207 x86/mm: do not mark IO regions as Xen heap
> > b4e41b1750d5 b4e41b1750d5 [4.14 only]
> > 
> > On the Arm side I'd also like to ask for
> > 
> > 5d45ecabe3c0 xen/arm64: force gcc 10+ to always inline generic atomics
> > helpers
> 
> Sounds good to me.
> 
> I would also add:
> 
> d501ef90ae7f xen/arm: cmpxchg: Add missing memory barriers in
> __cmpxchg_mb_timeout() [4.12+]

OK

