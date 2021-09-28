Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E39C141A6DA
	for <lists+xen-devel@lfdr.de>; Tue, 28 Sep 2021 06:59:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.197443.350488 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mV5Cr-0008Jm-5l; Tue, 28 Sep 2021 04:59:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 197443.350488; Tue, 28 Sep 2021 04:59:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mV5Cr-0008Gz-2C; Tue, 28 Sep 2021 04:59:05 +0000
Received: by outflank-mailman (input) for mailman id 197443;
 Tue, 28 Sep 2021 04:59:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gf2A=OS=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mV5Cp-0008Gt-JB
 for xen-devel@lists.xenproject.org; Tue, 28 Sep 2021 04:59:03 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 58372ca8-302d-487d-a4b1-17afe1e1918d;
 Tue, 28 Sep 2021 04:59:01 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3238360FC0;
 Tue, 28 Sep 2021 04:59:01 +0000 (UTC)
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
X-Inumbo-ID: 58372ca8-302d-487d-a4b1-17afe1e1918d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632805141;
	bh=8G5ud11qkyImUnBMBEMnayTKRHjNRpiwBh3dxN+opXM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=GWOjfdcBYA8wnTt8HVz+U/3i8I3lE2Ru1x0ltjHeVgPpXcVFm/6BpmTZ+IQSFGdHJ
	 xQZxzY5arFo6rDlDhTA4DDJfuN1tkmKHjFfCjjcEDGsVvoUVG45vhbr1ulompg3PKB
	 02+xgmjT0vl9kt6C7Sm6g41VVVfk/6eUGR31MhochK/l1S5XTTr39EfZ44mLJp54H3
	 AZBw7JTqrdH3BO9EzjYWHjPCgorJWTp7ElT9S95DxKYpOOsvVUm5joQ/UNFeVyS5sx
	 vgHu+xysrHysxK8r5BydHUuPhUDt8nLvGh7GsIbnVeNXBJ1sS3RlUKb4+ZOGIKkF9O
	 hCb84C0IHiwQQ==
Date: Mon, 27 Sep 2021 21:59:00 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Wei Chen <Wei.Chen@arm.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    "julien@xen.org" <julien@xen.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    "jbeulich@suse.com" <jbeulich@suse.com>, 
    "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, 
    "roger.pau@citrix.com" <roger.pau@citrix.com>, "wl@xen.org" <wl@xen.org>
Subject: RE: [PATCH 08/37] xen/x86: add detection of discontinous node memory
 range
In-Reply-To: <DB9PR08MB68573F34B7B9A73B976D4E4C9EA89@DB9PR08MB6857.eurprd08.prod.outlook.com>
Message-ID: <alpine.DEB.2.21.2109272158390.5022@sstabellini-ThinkPad-T480s>
References: <20210923120236.3692135-1-wei.chen@arm.com> <20210923120236.3692135-9-wei.chen@arm.com> <alpine.DEB.2.21.2109231719410.17979@sstabellini-ThinkPad-T480s> <PAXPR08MB686474BADD786E523EAC026B9EA49@PAXPR08MB6864.eurprd08.prod.outlook.com>
 <alpine.DEB.2.21.2109241244070.17979@sstabellini-ThinkPad-T480s> <DB9PR08MB6857A3176752B3E08EAE4D739EA69@DB9PR08MB6857.eurprd08.prod.outlook.com> <alpine.DEB.2.21.2109262002390.5022@sstabellini-ThinkPad-T480s> <alpine.DEB.2.21.2109262159500.5022@sstabellini-ThinkPad-T480s>
 <DB9PR08MB685772C5CDE9DF885A063F479EA79@DB9PR08MB6857.eurprd08.prod.outlook.com> <alpine.DEB.2.21.2109271018220.5022@sstabellini-ThinkPad-T480s> <DB9PR08MB68573F34B7B9A73B976D4E4C9EA89@DB9PR08MB6857.eurprd08.prod.outlook.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1263762048-1632805141=:5022"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1263762048-1632805141=:5022
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 28 Sep 2021, Wei Chen wrote:
> Hi Stefano,
> 
> > -----Original Message-----
> > From: Stefano Stabellini <sstabellini@kernel.org>
> > Sent: 2021年9月28日 1:19
> > To: Wei Chen <Wei.Chen@arm.com>
> > Cc: Stefano Stabellini <sstabellini@kernel.org>; xen-
> > devel@lists.xenproject.org; julien@xen.org; Bertrand Marquis
> > <Bertrand.Marquis@arm.com>; jbeulich@suse.com; andrew.cooper3@citrix.com;
> > roger.pau@citrix.com; wl@xen.org
> > Subject: RE: [PATCH 08/37] xen/x86: add detection of discontinous node
> > memory range
> > 
> > On Mon, 27 Sep 2021, Wei Chen wrote:
> > > > -----Original Message-----
> > > > From: Stefano Stabellini <sstabellini@kernel.org>
> > > > Sent: 2021年9月27日 13:05
> > > > To: Stefano Stabellini <sstabellini@kernel.org>
> > > > Cc: Wei Chen <Wei.Chen@arm.com>; xen-devel@lists.xenproject.org;
> > > > julien@xen.org; Bertrand Marquis <Bertrand.Marquis@arm.com>;
> > > > jbeulich@suse.com; andrew.cooper3@citrix.com; roger.pau@citrix.com;
> > > > wl@xen.org
> > > > Subject: RE: [PATCH 08/37] xen/x86: add detection of discontinous node
> > > > memory range
> > > >
> > > > On Sun, 26 Sep 2021, Stefano Stabellini wrote:
> > > > > On Sun, 26 Sep 2021, Wei Chen wrote:
> > > > > > > -----Original Message-----
> > > > > > > From: Stefano Stabellini <sstabellini@kernel.org>
> > > > > > > Sent: 2021年9月25日 3:53
> > > > > > > To: Wei Chen <Wei.Chen@arm.com>
> > > > > > > Cc: Stefano Stabellini <sstabellini@kernel.org>; xen-
> > > > > > > devel@lists.xenproject.org; julien@xen.org; Bertrand Marquis
> > > > > > > <Bertrand.Marquis@arm.com>; jbeulich@suse.com;
> > > > andrew.cooper3@citrix.com;
> > > > > > > roger.pau@citrix.com; wl@xen.org
> > > > > > > Subject: RE: [PATCH 08/37] xen/x86: add detection of
> > discontinous
> > > > node
> > > > > > > memory range
> > > > > > >
> > > > > > > On Fri, 24 Sep 2021, Wei Chen wrote:
> > > > > > > > > -----Original Message-----
> > > > > > > > > From: Stefano Stabellini <sstabellini@kernel.org>
> > > > > > > > > Sent: 2021年9月24日 8:26
> > > > > > > > > To: Wei Chen <Wei.Chen@arm.com>
> > > > > > > > > Cc: xen-devel@lists.xenproject.org; sstabellini@kernel.org;
> > > > > > > julien@xen.org;
> > > > > > > > > Bertrand Marquis <Bertrand.Marquis@arm.com>;
> > jbeulich@suse.com;
> > > > > > > > > andrew.cooper3@citrix.com; roger.pau@citrix.com; wl@xen.org
> > > > > > > > > Subject: Re: [PATCH 08/37] xen/x86: add detection of
> > > > discontinous node
> > > > > > > > > memory range
> > > > > > > > >
> > > > > > > > > CC'ing x86 maintainers
> > > > > > > > >
> > > > > > > > > On Thu, 23 Sep 2021, Wei Chen wrote:
> > > > > > > > > > One NUMA node may contain several memory blocks. In
> > current
> > > > Xen
> > > > > > > > > > code, Xen will maintain a node memory range for each node
> > to
> > > > cover
> > > > > > > > > > all its memory blocks. But here comes the problem, in the
> > gap
> > > > of
> > > > > > > > > > one node's two memory blocks, if there are some memory
> > blocks
> > > > don't
> > > > > > > > > > belong to this node (remote memory blocks). This node's
> > memory
> > > > range
> > > > > > > > > > will be expanded to cover these remote memory blocks.
> > > > > > > > > >
> > > > > > > > > > One node's memory range contains othe nodes' memory, this
> > is
> > > > > > > obviously
> > > > > > > > > > not very reasonable. This means current NUMA code only can
> > > > support
> > > > > > > > > > node has continous memory blocks. However, on a physical
> > > > machine,
> > > > > > > the
> > > > > > > > > > addresses of multiple nodes can be interleaved.
> > > > > > > > > >
> > > > > > > > > > So in this patch, we add code to detect discontinous
> > memory
> > > > blocks
> > > > > > > > > > for one node. NUMA initializtion will be failed and error
> > > > messages
> > > > > > > > > > will be printed when Xen detect such hardware
> > configuration.
> > > > > > > > >
> > > > > > > > > At least on ARM, it is not just memory that can be
> > interleaved,
> > > > but
> > > > > > > also
> > > > > > > > > MMIO regions. For instance:
> > > > > > > > >
> > > > > > > > > node0 bank0 0-0x1000000
> > > > > > > > > MMIO 0x1000000-0x1002000
> > > > > > > > > Hole 0x1002000-0x2000000
> > > > > > > > > node0 bank1 0x2000000-0x3000000
> > > > > > > > >
> > > > > > > > > So I am not familiar with the SRAT format, but I think on
> > ARM
> > > > the
> > > > > > > check
> > > > > > > > > would look different: we would just look for multiple memory
> > > > ranges
> > > > > > > > > under a device_type = "memory" node of a NUMA node in device
> > > > tree.
> > > > > > > > >
> > > > > > > > >
> > > > > > > >
> > > > > > > > Should I need to include/refine above message to commit log?
> > > > > > >
> > > > > > > Let me ask you a question first.
> > > > > > >
> > > > > > > With the NUMA implementation of this patch series, can we deal
> > with
> > > > > > > cases where each node has multiple memory banks, not interleaved?
> > > > > >
> > > > > > Yes.
> > > > > >
> > > > > > > An an example:
> > > > > > >
> > > > > > > node0: 0x0        - 0x10000000
> > > > > > > MMIO : 0x10000000 - 0x20000000
> > > > > > > node0: 0x20000000 - 0x30000000
> > > > > > > MMIO : 0x30000000 - 0x50000000
> > > > > > > node1: 0x50000000 - 0x60000000
> > > > > > > MMIO : 0x60000000 - 0x80000000
> > > > > > > node2: 0x80000000 - 0x90000000
> > > > > > >
> > > > > > >
> > > > > > > I assume we can deal with this case simply by setting node0
> > memory
> > > > to
> > > > > > > 0x0-0x30000000 even if there is actually something else, a
> > device,
> > > > that
> > > > > > > doesn't belong to node0 in between the two node0 banks?
> > > > > >
> > > > > > While this configuration is rare in SoC design, but it is not
> > > > impossible.
> > > > >
> > > > > Definitely, I have seen it before.
> > > > >
> > > > >
> > > > > > > Is it only other nodes' memory interleaved that cause issues? In
> > > > other
> > > > > > > words, only the following is a problematic scenario?
> > > > > > >
> > > > > > > node0: 0x0        - 0x10000000
> > > > > > > MMIO : 0x10000000 - 0x20000000
> > > > > > > node1: 0x20000000 - 0x30000000
> > > > > > > MMIO : 0x30000000 - 0x50000000
> > > > > > > node0: 0x50000000 - 0x60000000
> > > > > > >
> > > > > > > Because node1 is in between the two ranges of node0?
> > > > > > >
> > > > > >
> > > > > > But only device_type="memory" can be added to allocation.
> > > > > > For mmio there are two cases:
> > > > > > 1. mmio doesn't have NUMA id property.
> > > > > > 2. mmio has NUMA id property, just like some PCIe controllers.
> > > > > >    But we don’t need to handle these kinds of MMIO devices
> > > > > >    in memory block parsing. Because we don't need to allocate
> > > > > >    memory from these mmio ranges. And for accessing, we need
> > > > > >    a NUMA-aware PCIe controller driver or a generic NUMA-aware
> > > > > >    MMIO accessing APIs.
> > > > >
> > > > > Yes, I am not too worried about devices with a NUMA id property
> > because
> > > > > they are less common and this series doesn't handle them at all,
> > right?
> > > > > I imagine they would be treated like any other device without NUMA
> > > > > awareness.
> > > > >
> > > > > I am thinking about the case where the memory of each NUMA node is
> > made
> > > > > of multiple banks. I understand that this patch adds an explicit
> > check
> > > > > for cases where these banks are interleaving, however there are many
> > > > > other cases where NUMA memory nodes are *not* interleaving but they
> > are
> > > > > still made of multiple discontinuous banks, like in the two example
> > > > > above.
> > > > >
> > > > > My question is whether this patch series in its current form can
> > handle
> > > > > the two cases above correctly. If so, I am wondering how it works
> > given
> > > > > that we only have a single "start" and "size" parameter per node.
> > > > >
> > > > > On the other hand if this series cannot handle the two cases above,
> > my
> > > > > question is whether it would fail explicitly or not. The new
> > > > > check is_node_memory_continuous doesn't seem to be able to catch
> > them.
> > > >
> > > >
> > > > Looking at numa_update_node_memblks, it is clear that the code is
> > meant
> > > > to increase the range of each numa node to cover even MMIO regions in
> > > > between memory banks. Also see the comment at the top of the file:
> > > >
> > > >  * Assumes all memory regions belonging to a single proximity domain
> > > >  * are in one chunk. Holes between them will be included in the node.
> > > >
> > > > So if there are multiple banks for each node, start and end are
> > > > stretched to cover the holes between them, and it works as long as
> > > > memory banks of different NUMA nodes don't interleave.
> > > >
> > > > I would appreciate if you could add an in-code comment to explain this
> > > > on top of numa_update_node_memblk.
> > >
> > > Yes, I will do it.
> > 
> > Thank you
> > 
> > 
> > > > Have you had a chance to test this? If not it would be fantastic if
> > you
> > > > could give it a quick test to make sure it works as intended: for
> > > > instance by creating multiple memory banks for each NUMA node by
> > > > splitting an real bank into two smaller banks with a hole in between
> > in
> > > > device tree, just for the sake of testing.
> > >
> > > Yes, I have created some fake NUMA nodes in FVP device tree to test it.
> > > The intertwine of nodes' address can be detected.
> > >
> > > (XEN) SRAT: Node 0 0000000080000000-00000000ff000000
> > > (XEN) SRAT: Node 1 0000000880000000-00000008c0000000
> > > (XEN) NODE 0: (0000000080000000-00000008d0000000) intertwine with NODE 1
> > (0000000880000000-00000008c0000000)
> > 
> > Great thanks! And what if there are multiple non-contiguous memory banks
> > per node, but *not* intertwined. Does that all work correctly as
> > expected?
> 
> Yes, I am using a device tree setting like this:

Perfect! Thank you!


>     memory@80000000 {
>         device_type = "memory";
>         reg = <0x0 0x80000000 0x0 0x80000000>;
>         numa-node-id = <0>;
>     };
> 
>     memory@880000000 {
>         device_type = "memory";
>         reg = <0x8 0x80000000 0x0 0x8000000>;
>         numa-node-id = <0>;
>     };
> 
>     memory@890000000 {
>         device_type = "memory";
>         reg = <0x8 0x90000000 0x0 0x8000000>;
>         numa-node-id = <0>;
>     };
> 
>     memory@8A0000000 {
>         device_type = "memory";
>         reg = <0x8 0xA0000000 0x0 0x8000000>;
>         numa-node-id = <0>;
>     };
> 
>     memory@8B0000000 {
>         device_type = "memory";
>         reg = <0x8 0xB0000000 0x0 0x8000000>;
>         numa-node-id = <0>;
>     };
> 
>     memory@8C0000000 {
>         device_type = "memory";
>         reg = <0x8 0xC0000000 0x0 0x8000000>;
>         numa-node-id = <1>;
>     };
> 
>     memory@8D0000000 {
>         device_type = "memory";
>         reg = <0x8 0xD0000000 0x0 0x8000000>;
>         numa-node-id = <1>;
>     };
> 
>     memory@8E0000000 {
>         device_type = "memory";
>         reg = <0x8 0xE0000000 0x0 0x8000000>;
>         numa-node-id = <1>;
>     };
> 
>     memory@8F0000000 {
>         device_type = "memory";
>         reg = <0x8 0xF0000000 0x0 0x8000000>;
>         numa-node-id = <1>;
>     };
> 
> And in Xen we got the output:
> 
> (XEN) DT: NUMA node 0 processor parsed
> (XEN) DT: NUMA node 0 processor parsed
> (XEN) DT: NUMA node 1 processor parsed
> (XEN) DT: NUMA node 1 processor parsed
> (XEN) SRAT: Node 0 0000000080000000-00000000ff000000
> (XEN) SRAT: Node 0 0000000880000000-0000000888000000
> (XEN) SRAT: Node 0 0000000890000000-0000000898000000
> (XEN) SRAT: Node 0 00000008a0000000-00000008a8000000
> (XEN) SRAT: Node 0 00000008b0000000-00000008b8000000
> (XEN) SRAT: Node 1 00000008c0000000-00000008c8000000
> (XEN) SRAT: Node 1 00000008d0000000-00000008d8000000
> (XEN) SRAT: Node 1 00000008e0000000-00000008e8000000
> (XEN) SRAT: Node 1 00000008f0000000-00000008f8000000
> (XEN) NUMA: parsing numa-distance-map
> (XEN) NUMA: distance: NODE#0->NODE#0:10
> (XEN) NUMA: distance: NODE#0->NODE#1:20
> (XEN) NUMA: distance: NODE#1->NODE#1:10
> (XEN) NUMA: Using 16 for the hash shift.
> (XEN) Domain heap initialised
> (XEN) Booting using Device Tree
> 
> Dom0 can be boot successfully, xl info got:
> xl info
> host                   : X-Dom0
> release                : 5.12.0
> version                : #20 SMP PREEMPT Wed Jul 28 13:41:28 CST 2021
> machine                : aarch64
> nr_cpus                : 4
> max_cpu_id             : 3
> nr_nodes               : 2
> cores_per_socket       : 1
> threads_per_core       : 1
> 
> Xen debug console to dump numa info, we got:
> 
> (XEN) 'u' pressed -> dumping numa info (now = 13229372281010)
> (XEN) NODE0 start->524288 size->8617984 free->388741
> (XEN) NODE1 start->9175040 size->229376 free->106460
> (XEN) CPU0...1 -> NODE0
> (XEN) CPU2...3 -> NODE1
> (XEN) Memory location of each domain:
> (XEN) Domain 0 (total: 262144):
> (XEN)     Node 0: 262144
> (XEN)     Node 1: 0
> 
> 
--8323329-1263762048-1632805141=:5022--

