Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94302418DEC
	for <lists+xen-devel@lfdr.de>; Mon, 27 Sep 2021 05:26:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.196281.349054 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUhGz-0005m5-Oc; Mon, 27 Sep 2021 03:25:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 196281.349054; Mon, 27 Sep 2021 03:25:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUhGz-0005kH-LZ; Mon, 27 Sep 2021 03:25:45 +0000
Received: by outflank-mailman (input) for mailman id 196281;
 Mon, 27 Sep 2021 03:25:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bXng=OR=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mUhGy-0005kB-9k
 for xen-devel@lists.xenproject.org; Mon, 27 Sep 2021 03:25:44 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 988b2f6c-1f42-11ec-bc3d-12813bfff9fa;
 Mon, 27 Sep 2021 03:25:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 825CF60FED;
 Mon, 27 Sep 2021 03:25:42 +0000 (UTC)
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
X-Inumbo-ID: 988b2f6c-1f42-11ec-bc3d-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632713142;
	bh=6ZAemB+n9XgH6FGRuRLlgBbacK01h5ysUjv5fAYyDi0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=S5dK702KQ89G+93xNqPSAPNJgOqRz7Q9qBLCthmpUXT550pZHUr3NmM5rSuDWeyKD
	 1pPypqSMPaJhxgk6Eig4wH7iWqllJ451o6lByfuZl7BxuuabwvlNxoIUaWOLDP3m+C
	 5KMd7csnsIlDPXkuaStFjCmgvaEBPbergNyNx7n4fb4vccFFtWH1VlwlyhpfvnTAlY
	 KF66xXIKYkJm3KUyjpz1mdxmvmletp/KhPeDZ562TjpfESNp70d1ac2Dw0e23UcGc3
	 grlfFaW0t/S/hiYut8ZBZrqWf/clZ2xg49NF2vrSfU1NJ+ejjHxI5swT7ian2sAqzs
	 JaLFsZbY5znYQ==
Date: Sun, 26 Sep 2021 20:25:42 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Wei Chen <Wei.Chen@arm.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    "julien@xen.org" <julien@xen.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: RE: [PATCH 22/37] xen/arm: use NR_MEM_BANKS to override default
 NR_NODE_MEMBLKS
In-Reply-To: <DB9PR08MB685744A06D7C014DAE9BE73F9EA69@DB9PR08MB6857.eurprd08.prod.outlook.com>
Message-ID: <alpine.DEB.2.21.2109262021200.5022@sstabellini-ThinkPad-T480s>
References: <20210923120236.3692135-1-wei.chen@arm.com> <20210923120236.3692135-23-wei.chen@arm.com> <alpine.DEB.2.21.2109231828310.17979@sstabellini-ThinkPad-T480s> <DB9PR08MB685744A06D7C014DAE9BE73F9EA69@DB9PR08MB6857.eurprd08.prod.outlook.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1750427606-1632713142=:5022"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1750427606-1632713142=:5022
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Sun, 26 Sep 2021, Wei Chen wrote:
> > -----Original Message-----
> > From: Stefano Stabellini <sstabellini@kernel.org>
> > Sent: 2021年9月24日 9:35
> > To: Wei Chen <Wei.Chen@arm.com>
> > Cc: xen-devel@lists.xenproject.org; sstabellini@kernel.org; julien@xen.org;
> > Bertrand Marquis <Bertrand.Marquis@arm.com>
> > Subject: Re: [PATCH 22/37] xen/arm: use NR_MEM_BANKS to override default
> > NR_NODE_MEMBLKS
> > 
> > On Thu, 23 Sep 2021, Wei Chen wrote:
> > > As a memory range described in device tree cannot be split across
> > > multiple nodes. So we define NR_NODE_MEMBLKS as NR_MEM_BANKS in
> > > arch header.
> > 
> > This statement is true but what is the goal of this patch? Is it to
> > reduce code size and memory consumption?
> > 
> 
> No, when Julien and I discussed this in last version[1], we hadn't thought
> so deeply. We just thought a memory range described in DT cannot be split
> across multiple nodes. So NR_MEM_BANKS should be equal to NR_MEM_BANKS.
> 
> https://lists.xenproject.org/archives/html/xen-devel/2021-08/msg00974.html 
> 
> > I am asking because NR_MEM_BANKS is 128 and
> > NR_NODE_MEMBLKS=2*MAX_NUMNODES which is 64 by default so again
> > NR_NODE_MEMBLKS is 128 before this patch.
> > 
> > In other words, this patch alone doesn't make any difference; at least
> > doesn't make any difference unless CONFIG_NR_NUMA_NODES is increased.
> > 
> > So, is the goal to reduce memory usage when CONFIG_NR_NUMA_NODES is
> > higher than 64?
> > 
> 
> I also thought about this problem when I was writing this patch.
> CONFIG_NR_NUMA_NODES is increasing, but NR_MEM_BANKS is a fixed
> value, then NR_MEM_BANKS can be smaller than CONFIG_NR_NUMA_NODES
> at one point.
> 
> But I agree with Julien's suggestion, NR_MEM_BANKS and NR_NODE_MEMBLKS
> must be aware of each other. I had thought to add some ASSERT check,
> but I don't know how to do it better. So I post this patch for more
> suggestion.

OK. In that case I'd say to get rid of the previous definition of
NR_NODE_MEMBLKS as it is probably not necessary, see below.



> > 
> > > And keep default NR_NODE_MEMBLKS in common header
> > > for those architectures NUMA is disabled.
> > 
> > This last sentence is not accurate: on x86 NUMA is enabled and
> > NR_NODE_MEMBLKS is still defined in xen/include/xen/numa.h (there is no
> > x86 definition of it)
> > 
> 
> Yes.
> 
> > 
> > > Signed-off-by: Wei Chen <wei.chen@arm.com>
> > > ---
> > >  xen/include/asm-arm/numa.h | 8 +++++++-
> > >  xen/include/xen/numa.h     | 2 ++
> > >  2 files changed, 9 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/xen/include/asm-arm/numa.h b/xen/include/asm-arm/numa.h
> > > index 8f1c67e3eb..21569e634b 100644
> > > --- a/xen/include/asm-arm/numa.h
> > > +++ b/xen/include/asm-arm/numa.h
> > > @@ -3,9 +3,15 @@
> > >
> > >  #include <xen/mm.h>
> > >
> > > +#include <asm/setup.h>
> > > +
> > >  typedef u8 nodeid_t;
> > >
> > > -#ifndef CONFIG_NUMA
> > > +#ifdef CONFIG_NUMA
> > > +
> > > +#define NR_NODE_MEMBLKS NR_MEM_BANKS
> > > +
> > > +#else
> > >
> > >  /* Fake one node for now. See also node_online_map. */
> > >  #define cpu_to_node(cpu) 0
> > > diff --git a/xen/include/xen/numa.h b/xen/include/xen/numa.h
> > > index 1978e2be1b..1731e1cc6b 100644
> > > --- a/xen/include/xen/numa.h
> > > +++ b/xen/include/xen/numa.h
> > > @@ -12,7 +12,9 @@
> > >  #define MAX_NUMNODES    1
> > >  #endif
> > >
> > > +#ifndef NR_NODE_MEMBLKS
> > >  #define NR_NODE_MEMBLKS (MAX_NUMNODES*2)
> > > +#endif

This one we can remove it completely right?
--8323329-1750427606-1632713142=:5022--

