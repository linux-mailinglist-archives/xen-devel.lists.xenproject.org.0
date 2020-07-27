Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F9922EA1B
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jul 2020 12:34:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k00SS-0003gJ-NB; Mon, 27 Jul 2020 10:34:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1WzZ=BG=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1k00SR-0003gE-C4
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2020 10:34:11 +0000
X-Inumbo-ID: b42a652e-cff4-11ea-a77c-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b42a652e-cff4-11ea-a77c-12813bfff9fa;
 Mon, 27 Jul 2020 10:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595846049;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=M+Mu8E2fuwPU/oncrBjE+zkk6QEy8SNkzt0ZiW48cAg=;
 b=HRFH86PpCPOi4bWX1+XeJPCN172akGNRyqZQvhlVibgytPt7MLjbjx/C
 m8LTcZoZifAxcExxX10sJI6Ls4wFRvbN1S9BvmXfd/Jih0NjQBzlf3cQj
 E3HZuFKqWQE6mf9qHEL1B/9TV5gzZfA7XBvuDgkAUD5CSyrCrB94YEHLG g=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 6e6ewNdSYbd4plujjhsGgCQ5H6vxkWeP9ylTamwaSVM+is1Cn+l5iHu+MhZxJnXbH8FLGADftS
 XsR0roq3z7sNbjXxfb9kioino+/MqNTBTSPlvKXNpQkJCt9BPz4YnfY148x/NXggugE6Kw8uqD
 RrXkRBvbw35oNUD7eGHNWcDwlfoVA2yBgKk+UJGFM6nzTaYP+FLn9eavBro5HrfYjDXbEW7I3l
 Anb0hSTXhfrRkXLMNbKrWZPxyjr+ngzDzaVOWGoI9XRa9TsTariKPYKqrQKNSKBhQXrBD4cWXK
 2jQ=
X-SBRS: 2.7
X-MesageID: 23569533
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,402,1589256000"; d="scan'208";a="23569533"
Date: Mon, 27 Jul 2020 12:34:02 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Julien Grall <julien@xen.org>
Subject: Re: [RFC PATCH v1 1/4] arm/pci: PCI setup and PCI host bridge
 discovery within XEN on ARM.
Message-ID: <20200727103402.GP7191@Air-de-Roger>
References: <cover.1595511416.git.rahul.singh@arm.com>
 <64ebd4ef614b36a5844c52426a4a6a4a23b1f087.1595511416.git.rahul.singh@arm.com>
 <20200724144404.GJ7191@Air-de-Roger>
 <0c53b2cb-47e9-f34e-8922-7095669175be@xen.org>
 <980fc583-edb6-b536-f211-f6b8ea6d21a7@suse.com>
 <3e15d186-e323-613f-05a2-ee02480d74cf@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3e15d186-e323-613f-05a2-ee02480d74cf@xen.org>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: Rahul Singh <rahul.singh@arm.com>, Bertrand.Marquis@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org, nd@arm.com,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, Jul 24, 2020 at 05:54:20PM +0100, Julien Grall wrote:
> Hi Jan,
> 
> On 24/07/2020 17:01, Jan Beulich wrote:
> > On 24.07.2020 17:15, Julien Grall wrote:
> > > On 24/07/2020 15:44, Roger Pau Monné wrote:
> > > > > +
> > > > > +    struct pci_host_bridge *bridge = pci_find_host_bridge(sbdf.seg, sbdf.bus);
> > > > > +
> > > > > +    if ( unlikely(!bridge) )
> > > > > +    {
> > > > > +        printk(XENLOG_ERR "Unable to find bridge for "PRI_pci"\n",
> > > > > +                sbdf.seg, sbdf.bus, sbdf.dev, sbdf.fn);
> > > > 
> > > > I had a patch to add a custom modifier to out printf format in
> > > > order to handle pci_sbdf_t natively:
> > > > 
> > > > https://patchew.org/Xen/20190822065132.48200-1-roger.pau@citrix.com/
> > > > 
> > > > It missed maintainers Acks and was never committed. Since you are
> > > > doing a bunch of work here, and likely adding a lot of SBDF related
> > > > prints, feel free to import the modifier (%pp) and use in your code
> > > > (do not attempt to switch existing users, or it's likely to get
> > > > stuck again).
> > > 
> > > I forgot about this patch :/. It would be good to revive it. Which acks
> > > are you missing?
> > 
> > It wasn't so much missing acks, but a controversy. And that not so much
> > about switching existing users, but whether to indeed derive this from
> > %p (which I continue to consider inefficient).
> 
> Looking at the thread, I can see you (relunctantly) acked any components
> that you are the sole maintainers. Kevin gave his acked for the vtd code and
> I gave it mine for the common code.
> 
> I would suggest to not rehash the argument unless another maintainer agree
> with your position. It loosk like to me the next step is for Roger (or
> someone else) to resend the patch so we could collect the missing ack (I
> think there is only one missing from Andrew).

I've rebased and sent the updated patch with the collected Acks.

Roger.

