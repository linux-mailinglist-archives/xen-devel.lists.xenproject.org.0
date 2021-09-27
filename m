Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF20418E8F
	for <lists+xen-devel@lfdr.de>; Mon, 27 Sep 2021 07:05:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.196314.349100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUipB-0002VY-PI; Mon, 27 Sep 2021 05:05:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 196314.349100; Mon, 27 Sep 2021 05:05:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUipB-0002Tk-Lq; Mon, 27 Sep 2021 05:05:09 +0000
Received: by outflank-mailman (input) for mailman id 196314;
 Mon, 27 Sep 2021 05:05:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bXng=OR=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mUipA-0002Te-7L
 for xen-devel@lists.xenproject.org; Mon, 27 Sep 2021 05:05:08 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 43984053-ad26-46e7-9bfe-3f9bb271f388;
 Mon, 27 Sep 2021 05:05:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3B0B461186;
 Mon, 27 Sep 2021 05:05:06 +0000 (UTC)
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
X-Inumbo-ID: 43984053-ad26-46e7-9bfe-3f9bb271f388
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632719106;
	bh=YxjL18L7J/nUxzaioAUHwuE1udmqAzgXu2YMU786K8s=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=opB9hHPoTvK7Jbhk+UUNEu2GXKAgm8RgqAG5BYtib2DZDX7hbW1QbN1385RdOkoZj
	 0OEZxrR6PjCm5xqy/Zb9mRxKczHyU5yOt1SrMYRg3BH2u97Z9PSJzjxk5c4G8NY4p/
	 7MMLUAAyjTt+sKy3O67QRmMV98oPnZeeQ70n9mPUXFTosy/jNum4dHt/kn2HPOTD4V
	 q0++tMI6PLlqr9ke/hNjZYZBkEh3vhQEvBSesNdccsEMaUd5s9R3aYMq+QtlkaOkIG
	 izzYYLoyLK8GlBJj5VqKJ4x0Z7KxsgZR7rMbVlFoE8BmxkdwV9B77E8t0afg5AmNdc
	 qyxXnu9Lv/hHw==
Date: Sun, 26 Sep 2021 22:05:06 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Stefano Stabellini <sstabellini@kernel.org>
cc: Wei Chen <Wei.Chen@arm.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    "julien@xen.org" <julien@xen.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    "jbeulich@suse.com" <jbeulich@suse.com>, 
    "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, 
    "roger.pau@citrix.com" <roger.pau@citrix.com>, "wl@xen.org" <wl@xen.org>
Subject: RE: [PATCH 08/37] xen/x86: add detection of discontinous node memory
 range
In-Reply-To: <alpine.DEB.2.21.2109262002390.5022@sstabellini-ThinkPad-T480s>
Message-ID: <alpine.DEB.2.21.2109262159500.5022@sstabellini-ThinkPad-T480s>
References: <20210923120236.3692135-1-wei.chen@arm.com> <20210923120236.3692135-9-wei.chen@arm.com> <alpine.DEB.2.21.2109231719410.17979@sstabellini-ThinkPad-T480s> <PAXPR08MB686474BADD786E523EAC026B9EA49@PAXPR08MB6864.eurprd08.prod.outlook.com>
 <alpine.DEB.2.21.2109241244070.17979@sstabellini-ThinkPad-T480s> <DB9PR08MB6857A3176752B3E08EAE4D739EA69@DB9PR08MB6857.eurprd08.prod.outlook.com> <alpine.DEB.2.21.2109262002390.5022@sstabellini-ThinkPad-T480s>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1993594964-1632719106=:5022"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1993594964-1632719106=:5022
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Sun, 26 Sep 2021, Stefano Stabellini wrote:
> On Sun, 26 Sep 2021, Wei Chen wrote:
> > > -----Original Message-----
> > > From: Stefano Stabellini <sstabellini@kernel.org>
> > > Sent: 2021年9月25日 3:53
> > > To: Wei Chen <Wei.Chen@arm.com>
> > > Cc: Stefano Stabellini <sstabellini@kernel.org>; xen-
> > > devel@lists.xenproject.org; julien@xen.org; Bertrand Marquis
> > > <Bertrand.Marquis@arm.com>; jbeulich@suse.com; andrew.cooper3@citrix.com;
> > > roger.pau@citrix.com; wl@xen.org
> > > Subject: RE: [PATCH 08/37] xen/x86: add detection of discontinous node
> > > memory range
> > > 
> > > On Fri, 24 Sep 2021, Wei Chen wrote:
> > > > > -----Original Message-----
> > > > > From: Stefano Stabellini <sstabellini@kernel.org>
> > > > > Sent: 2021年9月24日 8:26
> > > > > To: Wei Chen <Wei.Chen@arm.com>
> > > > > Cc: xen-devel@lists.xenproject.org; sstabellini@kernel.org;
> > > julien@xen.org;
> > > > > Bertrand Marquis <Bertrand.Marquis@arm.com>; jbeulich@suse.com;
> > > > > andrew.cooper3@citrix.com; roger.pau@citrix.com; wl@xen.org
> > > > > Subject: Re: [PATCH 08/37] xen/x86: add detection of discontinous node
> > > > > memory range
> > > > >
> > > > > CC'ing x86 maintainers
> > > > >
> > > > > On Thu, 23 Sep 2021, Wei Chen wrote:
> > > > > > One NUMA node may contain several memory blocks. In current Xen
> > > > > > code, Xen will maintain a node memory range for each node to cover
> > > > > > all its memory blocks. But here comes the problem, in the gap of
> > > > > > one node's two memory blocks, if there are some memory blocks don't
> > > > > > belong to this node (remote memory blocks). This node's memory range
> > > > > > will be expanded to cover these remote memory blocks.
> > > > > >
> > > > > > One node's memory range contains othe nodes' memory, this is
> > > obviously
> > > > > > not very reasonable. This means current NUMA code only can support
> > > > > > node has continous memory blocks. However, on a physical machine,
> > > the
> > > > > > addresses of multiple nodes can be interleaved.
> > > > > >
> > > > > > So in this patch, we add code to detect discontinous memory blocks
> > > > > > for one node. NUMA initializtion will be failed and error messages
> > > > > > will be printed when Xen detect such hardware configuration.
> > > > >
> > > > > At least on ARM, it is not just memory that can be interleaved, but
> > > also
> > > > > MMIO regions. For instance:
> > > > >
> > > > > node0 bank0 0-0x1000000
> > > > > MMIO 0x1000000-0x1002000
> > > > > Hole 0x1002000-0x2000000
> > > > > node0 bank1 0x2000000-0x3000000
> > > > >
> > > > > So I am not familiar with the SRAT format, but I think on ARM the
> > > check
> > > > > would look different: we would just look for multiple memory ranges
> > > > > under a device_type = "memory" node of a NUMA node in device tree.
> > > > >
> > > > >
> > > >
> > > > Should I need to include/refine above message to commit log?
> > > 
> > > Let me ask you a question first.
> > > 
> > > With the NUMA implementation of this patch series, can we deal with
> > > cases where each node has multiple memory banks, not interleaved?
> > 
> > Yes.
> > 
> > > An an example:
> > > 
> > > node0: 0x0        - 0x10000000
> > > MMIO : 0x10000000 - 0x20000000
> > > node0: 0x20000000 - 0x30000000
> > > MMIO : 0x30000000 - 0x50000000
> > > node1: 0x50000000 - 0x60000000
> > > MMIO : 0x60000000 - 0x80000000
> > > node2: 0x80000000 - 0x90000000
> > > 
> > > 
> > > I assume we can deal with this case simply by setting node0 memory to
> > > 0x0-0x30000000 even if there is actually something else, a device, that
> > > doesn't belong to node0 in between the two node0 banks?
> > 
> > While this configuration is rare in SoC design, but it is not impossible. 
> 
> Definitely, I have seen it before.
> 
> 
> > > Is it only other nodes' memory interleaved that cause issues? In other
> > > words, only the following is a problematic scenario?
> > > 
> > > node0: 0x0        - 0x10000000
> > > MMIO : 0x10000000 - 0x20000000
> > > node1: 0x20000000 - 0x30000000
> > > MMIO : 0x30000000 - 0x50000000
> > > node0: 0x50000000 - 0x60000000
> > > 
> > > Because node1 is in between the two ranges of node0?
> > > 
> > 
> > But only device_type="memory" can be added to allocation.
> > For mmio there are two cases:
> > 1. mmio doesn't have NUMA id property.
> > 2. mmio has NUMA id property, just like some PCIe controllers.
> >    But we don’t need to handle these kinds of MMIO devices
> >    in memory block parsing. Because we don't need to allocate
> >    memory from these mmio ranges. And for accessing, we need
> >    a NUMA-aware PCIe controller driver or a generic NUMA-aware
> >    MMIO accessing APIs.
> 
> Yes, I am not too worried about devices with a NUMA id property because
> they are less common and this series doesn't handle them at all, right?
> I imagine they would be treated like any other device without NUMA
> awareness.
> 
> I am thinking about the case where the memory of each NUMA node is made
> of multiple banks. I understand that this patch adds an explicit check
> for cases where these banks are interleaving, however there are many
> other cases where NUMA memory nodes are *not* interleaving but they are
> still made of multiple discontinuous banks, like in the two example
> above.
> 
> My question is whether this patch series in its current form can handle
> the two cases above correctly. If so, I am wondering how it works given
> that we only have a single "start" and "size" parameter per node.
> 
> On the other hand if this series cannot handle the two cases above, my
> question is whether it would fail explicitly or not. The new
> check is_node_memory_continuous doesn't seem to be able to catch them.


Looking at numa_update_node_memblks, it is clear that the code is meant
to increase the range of each numa node to cover even MMIO regions in
between memory banks. Also see the comment at the top of the file:

 * Assumes all memory regions belonging to a single proximity domain
 * are in one chunk. Holes between them will be included in the node.

So if there are multiple banks for each node, start and end are
stretched to cover the holes between them, and it works as long as
memory banks of different NUMA nodes don't interleave.

I would appreciate if you could add an in-code comment to explain this
on top of numa_update_node_memblk.

Have you had a chance to test this? If not it would be fantastic if you
could give it a quick test to make sure it works as intended: for
instance by creating multiple memory banks for each NUMA node by
splitting an real bank into two smaller banks with a hole in between in
device tree, just for the sake of testing.
--8323329-1993594964-1632719106=:5022--

