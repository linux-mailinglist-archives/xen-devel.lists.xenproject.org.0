Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5A4269A6D
	for <lists+xen-devel@lfdr.de>; Tue, 15 Sep 2020 02:31:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kHys2-00080g-50; Tue, 15 Sep 2020 00:30:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9JNo=CY=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kHys1-00080Y-5i
 for xen-devel@lists.xenproject.org; Tue, 15 Sep 2020 00:30:53 +0000
X-Inumbo-ID: 86903d47-21c4-405b-ac2f-3920edad17a9
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 86903d47-21c4-405b-ac2f-3920edad17a9;
 Tue, 15 Sep 2020 00:30:52 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 321A5208DB;
 Tue, 15 Sep 2020 00:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600129851;
 bh=NksJh0i35Q3ZK7da5jHiIXLIBddwI/chv07MTo7zCzs=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=bXzegKdDLnI3bL5eFW2KoNU6mxe8KOjytDBd+njbG4TFIKTkP4nzd4ZLUftyPFU3u
 yW/JNvNjGi+2L11RjR1HrgQGak0H6T+5UeyUIvMWnjp4cnbsyT+B4YXzbblMl42gYj
 kTB4gc6BCwZQqplfUjvpSCSKon8Il8ee3yTbfJtM=
Date: Mon, 14 Sep 2020 17:30:50 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, 
 Jan Beulich <jbeulich@suse.com>, 
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
 George Dunlap <george.dunlap@citrix.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Ian Jackson <ian.jackson@citrix.com>, Wei Liu <wl@xen.org>, 
 Anthony Perard <anthony.perard@citrix.com>
Subject: Re: preparations for 4.13.2 and 4.12.4
In-Reply-To: <658b29f5-d68e-613b-5d53-c92eff1fde22@xen.org>
Message-ID: <alpine.DEB.2.21.2009141714520.28991@sstabellini-ThinkPad-T480s>
References: <427c2293-366d-2ab3-cfbb-b41db35bd8b6@suse.com>
 <A526A238-AEE2-4A8D-960C-AA15E75786C0@arm.com>
 <78572a41-a84b-0c1a-0f17-4e4b484fc6cd@xen.org>
 <675ED3A7-6C02-42FC-8CD9-717610143A82@arm.com>
 <658b29f5-d68e-613b-5d53-c92eff1fde22@xen.org>
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
> Hi Bertrand,
> 
> On 11/09/2020 14:56, Bertrand Marquis wrote:
> > 
> > 
> > > On 11 Sep 2020, at 14:51, Julien Grall <julien@xen.org> wrote:
> > > 
> > > Hi Bertrand,
> > > 
> > > On 11/09/2020 14:32, Bertrand Marquis wrote:
> > > > > On 11 Sep 2020, at 14:11, Jan Beulich <jbeulich@suse.com> wrote:
> > > > > 
> > > > > All,
> > > > > 
> > > > > the releases are about due, but will of course want to wait for the
> > > > > XSA fixes going public on the 22nd. Please point out backports
> > > > > you find missing from the respective staging branches, but which
> > > > > you consider relevant. (Ian, Julien, Stefano: I notice there once
> > > > > again haven't been any tools or Arm side backports at all so far
> > > > > since the most recent stable releases from these branches. But
> > > > > maybe there simply aren't any.)
> > > > > 
> > > > > One that I have queued already, but which first need to at least
> > > > > pass the push gate to master, are
> > > > > 
> > > > > 8efa46516c5f hvmloader: indicate ACPI tables with "ACPI data" type in
> > > > > e820
> > > > > e5a1b6f0d207 x86/mm: do not mark IO regions as Xen heap
> > > > > b4e41b1750d5 b4e41b1750d5 [4.14 only]
> > > > > 
> > > > > On the Arm side I'd also like to ask for
> > > > > 
> > > > > 5d45ecabe3c0 xen/arm64: force gcc 10+ to always inline generic atomics
> > > > > helpers
> > > > +1
> > > > Could those fixes also be considered:
> > > > 3b418b3326 arm: Add Neoverse N1 processor identification
> > > > 858c0be8c2 xen/arm: Enable CPU Erratum 1165522 for Neoverse
> > > > 1814a626fb xen/arm: Update silicon-errata.txt with the Neovers AT
> > > > erratum
> > > The processor is quite new so may I ask why we would want to backport on
> > > older Xen?
> > 
> > 4.14 at least would be good as it is the current stable and N1SDP is support
> > in Yocto which is based on 4.14.
> While I understand external project are often based on stable release, I don't
> want to always backport errata. Some of them are quite involved and this is a
> risk for others.

Yeah, I very much agree with this. Some of them are **very** involved,
we don't really want to backport them. Speaking of which, maybe we
should add some wording to SUPPORT.md about it? Currently it doesn't
say anything specific about errata.


> In this case, the erratum has already been implemented for other processors.
> So the risk is minimal.
> 
> > But as the official one will be on next Yocto release this would be ok to
> > consider only 4.14 here.
> 
> 4.14 only would be my preference.

These ones are so trivial that apply straight away to all trees. I
understand it is not your preference, but I'll backport them up until
4.12 unless you are strongly opposed to it.

