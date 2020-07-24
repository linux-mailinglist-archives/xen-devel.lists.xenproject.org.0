Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 860BE22CDCA
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jul 2020 20:32:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jz2UX-0005bU-Nt; Fri, 24 Jul 2020 18:32:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fOER=BD=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jz2UW-0005bP-HZ
 for xen-devel@lists.xenproject.org; Fri, 24 Jul 2020 18:32:20 +0000
X-Inumbo-ID: 01d82bd2-cddc-11ea-a45b-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 01d82bd2-cddc-11ea-a45b-12813bfff9fa;
 Fri, 24 Jul 2020 18:32:20 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C29EE206F0;
 Fri, 24 Jul 2020 18:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595615539;
 bh=edzJ0zO5I70t7wGG5vAuUCZOGjGxj2xutns/fJYnx64=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=DWiaD/PYL6DTyiNtfZga4WXYYdArgvsHGz9FUo9BhDK96Con/hc8CNV8pGtJM0veC
 S6K40lR07tmsCIbDnAPgSnH0GHZ1xZ49KbUBK2vgBMOci/LRlN815BDDDF7gxZ1FyR
 ME6aFIdXcYwWDzscDQJRn8HFJqGPGf1kdnBA0jOw=
Date: Fri, 24 Jul 2020 11:32:18 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
Subject: Re: [RFC PATCH v1 1/4] arm/pci: PCI setup and PCI host bridge
 discovery within XEN on ARM.
In-Reply-To: <40582d63-49c7-4a51-b35b-8248dfa34b66@xen.org>
Message-ID: <alpine.DEB.2.21.2007241127480.17562@sstabellini-ThinkPad-T480s>
References: <cover.1595511416.git.rahul.singh@arm.com>
 <64ebd4ef614b36a5844c52426a4a6a4a23b1f087.1595511416.git.rahul.singh@arm.com>
 <alpine.DEB.2.21.2007231055230.17562@sstabellini-ThinkPad-T480s>
 <9f09ff42-a930-e4e3-d1c8-612ad03698ae@xen.org>
 <alpine.DEB.2.21.2007241036460.17562@sstabellini-ThinkPad-T480s>
 <40582d63-49c7-4a51-b35b-8248dfa34b66@xen.org>
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
Cc: nd@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 andrew.cooper3@citrix.com, Bertrand.Marquis@arm.com, jbeulich@suse.com,
 xen-devel@lists.xenproject.org, Rahul Singh <rahul.singh@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, roger.pau@citrix.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, 24 Jul 2020, Julien Grall wrote:
> On 24/07/2020 18:41, Stefano Stabellini wrote:
> > On Fri, 24 Jul 2020, Julien Grall wrote:
> > > On 24/07/2020 00:38, Stefano Stabellini wrote:
> > > The segment number is just a value defined by the software. So as long as
> > > Linux and Xen agrees with the number, then we should be ok.
> > 
> > As far as I understand a Linux "domain" (linux,pci-domain in device
> > tree) is a value defined by the software. The PCI segment has a
> > definition in the PCI spec and it is returned by _SEG on ACPI systems.
> > 
> > The link above suggests that a Linux domain corresponds to (_SEG,
> > _BBN) where _SEG is the segment and _BBN is the "Bus Number".
> > 
> > I just would like to be precise with the terminology: if we are talking
> > about domains in the linux sense of the word, as it looks like we are
> > doing, then let's call them domain instead of segments which seem to
> > have a different definition.
> 
> You seem to argue on the name but this doesn't resolve the underlying problem.
> Indeed, all our external interfaces are expecting a segment number.

Yes, you are right, that is a bigger problem.


> If they are not equal, then I fail to see why it would be useful to have this
> value in Xen.

I think that's because the domain is actually more convenient to use
because a segment can span multiple PCI host bridges. So my
understanding is that a segment alone is not sufficient to identify a
host bridge. From a software implementation point of view it would be
better to use domains.


> In which case, we need to use PHYSDEVOP_pci_mmcfg_reserved so
> Dom0 and Xen can synchronize on the segment number.

I was hoping we could write down the assumption somewhere that for the
cases we care about domain == segment, and error out if it is not the
case.

