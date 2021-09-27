Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CECA0418E8B
	for <lists+xen-devel@lfdr.de>; Mon, 27 Sep 2021 07:00:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.196308.349089 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUijw-0000oh-5j; Mon, 27 Sep 2021 04:59:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 196308.349089; Mon, 27 Sep 2021 04:59:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUijw-0000mO-2U; Mon, 27 Sep 2021 04:59:44 +0000
Received: by outflank-mailman (input) for mailman id 196308;
 Mon, 27 Sep 2021 04:59:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bXng=OR=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mUiju-0000mI-Ff
 for xen-devel@lists.xenproject.org; Mon, 27 Sep 2021 04:59:42 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b900a602-1f4f-11ec-bc3d-12813bfff9fa;
 Mon, 27 Sep 2021 04:59:41 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 667CE6113A;
 Mon, 27 Sep 2021 04:59:40 +0000 (UTC)
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
X-Inumbo-ID: b900a602-1f4f-11ec-bc3d-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632718780;
	bh=dmimcsQBlHFvXBdlXV0yfmz4bzwPaYAThfZ1hy3CUzk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=UKCRTpwKD3Viim1hdu57c15cb/Shyq3nom9DpgfS4p9fp/UmlXn2ZItYoh+cytsQ2
	 jwzz6c27SAuimLY+WvuAq/PcSDL2QF+8jUmvh/2+1rklDI6BPq8nhSk2KYuUlLbcUZ
	 0bLXTysvGx0dg1rIq5FDkVCovE28nNP9hP6Od1WkS/d7XPYAa0HG4HVbW3DoAI7V91
	 +848HbZKwfi7PT8BtIntkoBBNzXxolFrk+EWHHwxnAyLMyjgcFIhyOhqMuZgzwOHeb
	 oyg+L9HbA9yAZOEvzZJlW8pCaq9SsapFAaKxBivkG+0D0c3sfdEbZ5XNmBvkl+ixjx
	 4mzbA1d1ACsHg==
Date: Sun, 26 Sep 2021 21:59:40 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Wei Chen <Wei.Chen@arm.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    "julien@xen.org" <julien@xen.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, jbeulich@suse.com, 
    roger.pau@citrix.com, andrew.cooper3@citrix.com
Subject: RE: [PATCH 22/37] xen/arm: use NR_MEM_BANKS to override default
 NR_NODE_MEMBLKS
In-Reply-To: <DB9PR08MB6857AD295D692F962AD76C219EA79@DB9PR08MB6857.eurprd08.prod.outlook.com>
Message-ID: <alpine.DEB.2.21.2109262123140.5022@sstabellini-ThinkPad-T480s>
References: <20210923120236.3692135-1-wei.chen@arm.com> <20210923120236.3692135-23-wei.chen@arm.com> <alpine.DEB.2.21.2109231828310.17979@sstabellini-ThinkPad-T480s> <DB9PR08MB685744A06D7C014DAE9BE73F9EA69@DB9PR08MB6857.eurprd08.prod.outlook.com>
 <alpine.DEB.2.21.2109262021200.5022@sstabellini-ThinkPad-T480s> <DB9PR08MB6857AD295D692F962AD76C219EA79@DB9PR08MB6857.eurprd08.prod.outlook.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1296240553-1632717348=:5022"
Content-ID: <alpine.DEB.2.21.2109262135590.5022@sstabellini-ThinkPad-T480s>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1296240553-1632717348=:5022
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.2109262135591.5022@sstabellini-ThinkPad-T480s>

+x86 maintainers

On Mon, 27 Sep 2021, Wei Chen wrote:
> > -----Original Message-----
> > From: Stefano Stabellini <sstabellini@kernel.org>
> > Sent: 2021年9月27日 11:26
> > To: Wei Chen <Wei.Chen@arm.com>
> > Cc: Stefano Stabellini <sstabellini@kernel.org>; xen-
> > devel@lists.xenproject.org; julien@xen.org; Bertrand Marquis
> > <Bertrand.Marquis@arm.com>
> > Subject: RE: [PATCH 22/37] xen/arm: use NR_MEM_BANKS to override default
> > NR_NODE_MEMBLKS
> > 
> > On Sun, 26 Sep 2021, Wei Chen wrote:
> > > > -----Original Message-----
> > > > From: Stefano Stabellini <sstabellini@kernel.org>
> > > > Sent: 2021年9月24日 9:35
> > > > To: Wei Chen <Wei.Chen@arm.com>
> > > > Cc: xen-devel@lists.xenproject.org; sstabellini@kernel.org;
> > julien@xen.org;
> > > > Bertrand Marquis <Bertrand.Marquis@arm.com>
> > > > Subject: Re: [PATCH 22/37] xen/arm: use NR_MEM_BANKS to override
> > default
> > > > NR_NODE_MEMBLKS
> > > >
> > > > On Thu, 23 Sep 2021, Wei Chen wrote:
> > > > > As a memory range described in device tree cannot be split across
> > > > > multiple nodes. So we define NR_NODE_MEMBLKS as NR_MEM_BANKS in
> > > > > arch header.
> > > >
> > > > This statement is true but what is the goal of this patch? Is it to
> > > > reduce code size and memory consumption?
> > > >
> > >
> > > No, when Julien and I discussed this in last version[1], we hadn't
> > thought
> > > so deeply. We just thought a memory range described in DT cannot be
> > split
> > > across multiple nodes. So NR_MEM_BANKS should be equal to NR_MEM_BANKS.
> > >
> > > https://lists.xenproject.org/archives/html/xen-devel/2021-
> > 08/msg00974.html
> > >
> > > > I am asking because NR_MEM_BANKS is 128 and
> > > > NR_NODE_MEMBLKS=2*MAX_NUMNODES which is 64 by default so again
> > > > NR_NODE_MEMBLKS is 128 before this patch.
> > > >
> > > > In other words, this patch alone doesn't make any difference; at least
> > > > doesn't make any difference unless CONFIG_NR_NUMA_NODES is increased.
> > > >
> > > > So, is the goal to reduce memory usage when CONFIG_NR_NUMA_NODES is
> > > > higher than 64?
> > > >
> > >
> > > I also thought about this problem when I was writing this patch.
> > > CONFIG_NR_NUMA_NODES is increasing, but NR_MEM_BANKS is a fixed
> > > value, then NR_MEM_BANKS can be smaller than CONFIG_NR_NUMA_NODES
> > > at one point.
> > >
> > > But I agree with Julien's suggestion, NR_MEM_BANKS and NR_NODE_MEMBLKS
> > > must be aware of each other. I had thought to add some ASSERT check,
> > > but I don't know how to do it better. So I post this patch for more
> > > suggestion.
> > 
> > OK. In that case I'd say to get rid of the previous definition of
> > NR_NODE_MEMBLKS as it is probably not necessary, see below.
> > 
> > 
> > 
> > > >
> > > > > And keep default NR_NODE_MEMBLKS in common header
> > > > > for those architectures NUMA is disabled.
> > > >
> > > > This last sentence is not accurate: on x86 NUMA is enabled and
> > > > NR_NODE_MEMBLKS is still defined in xen/include/xen/numa.h (there is
> > no
> > > > x86 definition of it)
> > > >
> > >
> > > Yes.
> > >
> > > >
> > > > > Signed-off-by: Wei Chen <wei.chen@arm.com>
> > > > > ---
> > > > >  xen/include/asm-arm/numa.h | 8 +++++++-
> > > > >  xen/include/xen/numa.h     | 2 ++
> > > > >  2 files changed, 9 insertions(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/xen/include/asm-arm/numa.h b/xen/include/asm-arm/numa.h
> > > > > index 8f1c67e3eb..21569e634b 100644
> > > > > --- a/xen/include/asm-arm/numa.h
> > > > > +++ b/xen/include/asm-arm/numa.h
> > > > > @@ -3,9 +3,15 @@
> > > > >
> > > > >  #include <xen/mm.h>
> > > > >
> > > > > +#include <asm/setup.h>
> > > > > +
> > > > >  typedef u8 nodeid_t;
> > > > >
> > > > > -#ifndef CONFIG_NUMA
> > > > > +#ifdef CONFIG_NUMA
> > > > > +
> > > > > +#define NR_NODE_MEMBLKS NR_MEM_BANKS
> > > > > +
> > > > > +#else
> > > > >
> > > > >  /* Fake one node for now. See also node_online_map. */
> > > > >  #define cpu_to_node(cpu) 0
> > > > > diff --git a/xen/include/xen/numa.h b/xen/include/xen/numa.h
> > > > > index 1978e2be1b..1731e1cc6b 100644
> > > > > --- a/xen/include/xen/numa.h
> > > > > +++ b/xen/include/xen/numa.h
> > > > > @@ -12,7 +12,9 @@
> > > > >  #define MAX_NUMNODES    1
> > > > >  #endif
> > > > >
> > > > > +#ifndef NR_NODE_MEMBLKS
> > > > >  #define NR_NODE_MEMBLKS (MAX_NUMNODES*2)
> > > > > +#endif
> > 
> > This one we can remove it completely right?
> 
> How about define NR_MEM_BANKS to:
> #ifdef CONFIG_NR_NUMA_NODES
> #define NR_MEM_BANKS (CONFIG_NR_NUMA_NODES * 2)
> #else
> #define NR_MEM_BANKS 128
> #endif
> for both x86 and Arm. For those architectures do not support or enable
> NUMA, they can still use "NR_MEM_BANKS 128". And replace all NR_NODE_MEMBLKS
> in NUMA code to NR_MEM_BANKS to remove NR_NODE_MEMBLKS completely.
> In this case, NR_MEM_BANKS can be aware of the changes of CONFIG_NR_NUMA_NODES.

x86 doesn't have NR_MEM_BANKS as far as I can tell. I guess you also
meant to rename NR_NODE_MEMBLKS to NR_MEM_BANKS?

But NR_MEM_BANKS is not directly related to CONFIG_NR_NUMA_NODES because
there can be many memory banks for each numa node, certainly more than
2. The existing definition on x86:

#define NR_NODE_MEMBLKS (MAX_NUMNODES*2)

Doesn't make a lot of sense to me. Was it just an arbitrary limit for
the lack of a better way to set a maximum?


On the other hand, NR_MEM_BANKS and NR_NODE_MEMBLKS seem to be related.
In fact, what's the difference?

NR_MEM_BANKS is the max number of memory banks (with or without
numa-node-id).

NR_NODE_MEMBLKS is the max number of memory banks with NUMA support
(with numa-node-id)?

They are basically the same thing. On ARM I would just do:

#define NR_NODE_MEMBLKS MAX(NR_MEM_BANKS, (CONFIG_NR_NUMA_NODES * 2))


And maybe the definition could be common with x86 if we define
NR_MEM_BANKS to 128 on x86 too.
--8323329-1296240553-1632717348=:5022--

