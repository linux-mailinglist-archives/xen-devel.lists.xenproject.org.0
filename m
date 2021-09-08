Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC00540410C
	for <lists+xen-devel@lfdr.de>; Thu,  9 Sep 2021 00:33:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.182396.329924 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mO66u-0007It-IT; Wed, 08 Sep 2021 22:32:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 182396.329924; Wed, 08 Sep 2021 22:32:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mO66u-0007GB-FN; Wed, 08 Sep 2021 22:32:04 +0000
Received: by outflank-mailman (input) for mailman id 182396;
 Wed, 08 Sep 2021 22:32:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IK88=N6=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mO66s-0007G5-DN
 for xen-devel@lists.xenproject.org; Wed, 08 Sep 2021 22:32:02 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 954d0cc8-10f4-11ec-b18a-12813bfff9fa;
 Wed, 08 Sep 2021 22:32:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E519060F5B;
 Wed,  8 Sep 2021 22:31:59 +0000 (UTC)
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
X-Inumbo-ID: 954d0cc8-10f4-11ec-b18a-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1631140320;
	bh=dWob8UzTP/GdFG9k8M2M0wr2Pyydbr6toPp0fjLQU3k=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=OpNHIu7F+1sUxUIWNOeJM1LzdOH8Xv/CP6ChtErTxekbmpFXx+FnXvsi0ij/tJmqS
	 c3M7JVgaIjGfzRltTgMWvHqzlss/gJScVNLY3oGke0NMxE70SsfaUVhP1haqYbM7Hl
	 9Qky0SQrubycuODG8LfzZL+MvL9bZEybcTS439KYEqJZ/vIajBlA+uW9n1EYuSLmmn
	 VK2IotCUIJIhs99RekzVV3W9+VmwaI14uBmbTL4K7C0NwKmADBajAzzrk713xvqO2W
	 Cldfel+FeR7CMdiyuZQIAJGNV/cXfj8Nh7TgOrH2a/2NtzzIqHaNNiT3GSgaBZ4rIx
	 3N1I73IYhVBoQ==
Date: Wed, 8 Sep 2021 15:31:53 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Wei Chen <Wei.Chen@arm.com>
cc: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Jan Beulich <jbeulich@suse.com>
Subject: RE: [XEN RFC PATCH 23/40] xen/arm: introduce a helper to parse device
 tree memory node
In-Reply-To: <DB9PR08MB68572B980E3E688F3E946C329ED49@DB9PR08MB6857.eurprd08.prod.outlook.com>
Message-ID: <alpine.DEB.2.21.2109081458300.10523@sstabellini-ThinkPad-T480s>
References: <20210811102423.28908-1-wei.chen@arm.com> <20210811102423.28908-24-wei.chen@arm.com> <alpine.DEB.2.21.2108271757250.17851@sstabellini-ThinkPad-T480s> <DB9PR08MB6857618112DC045293A449699EC99@DB9PR08MB6857.eurprd08.prod.outlook.com>
 <5c9a196a-8ac3-1173-f402-01d99ccc23e4@xen.org> <AS8PR08MB68531741D1035B35A19EF34F9EC99@AS8PR08MB6853.eurprd08.prod.outlook.com> <DB9PR08MB68572B980E3E688F3E946C329ED49@DB9PR08MB6857.eurprd08.prod.outlook.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 8 Sep 2021, Wei Chen wrote:
> > > >>> @@ -55,6 +57,79 @@ static int __init
> > > >> dtb_numa_processor_affinity_init(nodeid_t node)
> > > >>>       return 0;
> > > >>>   }
> > > >>>
> > > >>> +/* Callback for parsing of the memory regions affinity */
> > > >>> +static int __init dtb_numa_memory_affinity_init(nodeid_t node,
> > > >>> +                                paddr_t start, paddr_t size)
> > > >>> +{
> > > >>> +    struct node *nd;
> > > >>> +    paddr_t end;
> > > >>> +    int i;
> > > >>> +
> > > >>> +    if ( srat_disabled() )
> > > >>> +        return -EINVAL;
> > > >>> +
> > > >>> +    end = start + size;
> > > >>> +    if ( num_node_memblks >= NR_NODE_MEMBLKS )
> > > >>> +    {
> > > >>> +        dprintk(XENLOG_WARNING,
> > > >>> +                "Too many numa entry, try bigger NR_NODE_MEMBLKS
> > \n");
> > > >>> +        bad_srat();
> > > >>> +        return -EINVAL;
> > > >>> +    }
> > > >>> +
> > > >>> +    /* It is fine to add this area to the nodes data it will be
> > used
> > > >> later */
> > > >>> +    i = conflicting_memblks(start, end);
> > > >>> +    /* No conflicting memory block, we can save it for later usage
> > */;
> > > >>> +    if ( i < 0 )
> > > >>> +        goto save_memblk;
> > > >>> +
> > > >>> +    if ( memblk_nodeid[i] == node ) {
> > > >>> +        /*
> > > >>> +         * Overlaps with other memblk in the same node, warning
> > here.
> > > >>> +         * This memblk will be merged with conflicted memblk later.
> > > >>> +         */
> > > >>> +        printk(XENLOG_WARNING
> > > >>> +               "DT: NUMA NODE %u (%"PRIx64
> > > >>> +               "-%"PRIx64") overlaps with itself (%"PRIx64"-
> > > >> %"PRIx64")\n",
> > > >>> +               node, start, end,
> > > >>> +               node_memblk_range[i].start,
> > node_memblk_range[i].end);
> > > >>> +    } else {
> > > >>> +        /*
> > > >>> +         * Conflict with memblk in other node, this is an error.
> > > >>> +         * The NUMA information is invalid, NUMA will be turn off.
> > > >>> +         */
> > > >>> +        printk(XENLOG_ERR
> > > >>> +               "DT: NUMA NODE %u (%"PRIx64"-%"
> > > >>> +               PRIx64") overlaps with NODE %u (%"PRIx64"-
> > > %"PRIx64")\n",
> > > >>> +               node, start, end, memblk_nodeid[i],
> > > >>> +               node_memblk_range[i].start,
> > node_memblk_range[i].end);
> > > >>> +        bad_srat();
> > > >>> +        return -EINVAL;
> > > >>> +    }
> > > >>> +
> > > >>> +save_memblk:
> > > >>> +    nd = &nodes[node];
> > > >>> +    if ( !node_test_and_set(node, memory_nodes_parsed) ) {
> > > >>> +        nd->start = start;
> > > >>> +        nd->end = end;
> > > >>> +    } else {
> > > >>> +        if ( start < nd->start )
> > > >>> +            nd->start = start;
> > > >>> +        if ( nd->end < end )
> > > >>> +            nd->end = end;
> > > >>> +    }
> > > >>> +
> > > >>> +    printk(XENLOG_INFO "DT: NUMA node %u %"PRIx64"-%"PRIx64"\n",
> > > >>> +           node, start, end);
> > > >>> +
> > > >>> +    node_memblk_range[num_node_memblks].start = start;
> > > >>> +    node_memblk_range[num_node_memblks].end = end;
> > > >>> +    memblk_nodeid[num_node_memblks] = node;
> > > >>> +    num_node_memblks++;
> > > >>
> > > >>
> > > >> Is it possible to have non-contigous ranges of memory for a single
> > NUMA
> > > >> node?
> > > >>
> > > >> Looking at the DT bindings and Linux implementation, it seems
> > possible.
> > > >> Here, it seems that node_memblk_range/memblk_nodeid could handle it,
> > > >> but nodes couldn't.
> > > >
> > > > Yes, you're right. I copied this code for x86 ACPI NUMA. Does ACPI
> > allow
> > > > non-contiguous ranges of memory for a single NUMA node too?
> > >
> > > I couldn't find any restriction for ACPI. Although, I only briefly
> > > looked at the spec.
> > >
> > > > If yes, I think
> > > > this will affect x86 ACPI NUMA too. In next version, we plan to merge
> > > > dtb_numa_memory_affinity_init and acpi_numa_memory_affinity_init into
> > a
> > > > neutral function. So we can fix them at the same time.
> > > >
> > > > If not, maybe we have to keep the diversity for dtb and ACPI here.
> > >
> > > I am not entirely sure what you mean. Are you saying if ACPI doesn't
> > > allow non-contiguous ranges of memory, then we should keep the
> > > implementation separated?
> > >
> > > If so, then I disagree with that. It is fine to have code that supports
> > > more than what a firmware table supports. The main benefit is less code
> > > and therefore less long term maintenance (with the current solution we
> > > would need to check both the ACPI and DT implementation if there is a
> > > bug in one).
> > >
> > 
> > Yes, I agree.
> > 
> 
> I am looking for some methods to address this comment. Current "nodes"
> has not considered the situation of memory addresses of different NUMA
> nodes can be interleaved.
> 
> This code exists in x86 NUMA implementation. I think it may be based on
> one early version of Linux x86 NUMA implementation. In recent Linux
> code, both ACPI/numa/srat.c[1] and x86 NUMA code[2] are not using
> "nodes" to record NUMA memory address boundary. They don't depend
> on "nodes" to do sanity check.
> 
> To fix it, we'd better to upgrade the x86 NUMA driver. It will make
> a great affect for Xen-x86. And I think it might out of this series
> scope. Can we create another thread to discuss about it?
> 
> Or could you give me suggestions that we can use some simple ways
> to fix it?

It looks like that we would have to replace all the node->start /
node->end checks with node_memblk_range checks. There are a few of them
in valid_numa_range, conflicting_memblks, cutoff_node,
nodes_cover_memory. It wouldn't be trivial.

Although I do think that non-contiguous memory for NUMA nodes is
important to support, the patch series is already 40 patches. I don't
think it is a good idea to add other significant changes to it. I
wouldn't upgrade the x86 NUMA driver now. If we can't find a better way,
we can proceed as you are doing in this version, with the known gap that
we can't deal with non-contigious memory for NUMA nodes, and fix it with
a follow-up series later. In that case we would want to have an explicit
check for non-contiguous memory for NUMA nodes in
dtb_numa_memory_affinity_init and error out if found.


> Also, on Linux, NUMA implementations for x86 are different from Arm64
> and RISC-V implementations.[3]
> 
> [1] https://github.com/torvalds/linux/blob/master/drivers/acpi/numa/srat.c
> [2] https://github.com/torvalds/linux/blob/master/arch/x86/mm/numa.c
> [3] https://github.com/torvalds/linux/blob/master/drivers/base/arch_numa.c


In general, I like the idea of sharing code as much as possible between
architectures (x86, ARM, etc.) and between DT/ACPI because it makes the
code maintainance easier and one might even gain certain features for
free.

However, the excercise of sharing code shouldn't take significant
additional efforts. In fact, it should decrease the overall effort:
instead of writing new code one just take existing code and move it to
common.

In this instance, I think it would be good to be able to share the NUMA
initialization code between x86/ARM and ACPI/DT if it doesn't cause
extra efforts.

Here the extra effort that my previous comment might cause doesn't
derive from x86/ARM or DT/ACPI code sharing. It derives from the fact
that our existing code doesn't deal with non-contigous memory for NUMA
nodes unfortunately. That is something we need to find a way to cope
with anyway.

