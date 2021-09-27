Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA8054199CD
	for <lists+xen-devel@lfdr.de>; Mon, 27 Sep 2021 18:58:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.197107.350054 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUtxD-0005dV-0C; Mon, 27 Sep 2021 16:58:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 197107.350054; Mon, 27 Sep 2021 16:58:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUtxC-0005b2-TK; Mon, 27 Sep 2021 16:58:10 +0000
Received: by outflank-mailman (input) for mailman id 197107;
 Mon, 27 Sep 2021 16:58:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bXng=OR=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mUtxA-0005as-W6
 for xen-devel@lists.xenproject.org; Mon, 27 Sep 2021 16:58:09 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 15fe2906-1fb4-11ec-bc54-12813bfff9fa;
 Mon, 27 Sep 2021 16:58:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 19BC160F3A;
 Mon, 27 Sep 2021 16:58:06 +0000 (UTC)
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
X-Inumbo-ID: 15fe2906-1fb4-11ec-bc54-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632761886;
	bh=rqOK66Cvl2zrztemjN1qedLXqxCBOjzSu4R65OLMYQA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=hq5yyhZlbXUE/OzPmuXxpnMBDrqtzOFzNW7o0IIIp6PV66OM8SFg3Mr2K2IHMn8aW
	 o1Qsx2qzb0ECSEBfGM0FMQw78Wvfo49iskglyNlTOFIloCzxhEaiR+F+7r9kU4bZ9l
	 Z5+JoPiWUKq4XPKlK3nP9Xu5I/ghLBN44gk6fEAZXMWx06FccqhmUPFC2Dv0Yq6WSt
	 Vo/hcMBw+3c9pKEOClhLX1F3rzL/fhdcir1Pw7zWLqSPHXxsYYmmPMI5njgcUKLEfv
	 iLaSaQk4RdGok4tFnFoZB9PwhymCAPY8jPxJdybkH6Pgl/913JKJNBXBzxV8JPLi8w
	 GYvPtwcstC9wQ==
Date: Mon, 27 Sep 2021 09:58:05 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@gmail.com>
cc: Wei Chen <Wei.Chen@arm.com>, Julien Grall <julien.grall.oss@gmail.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel <xen-devel@lists.xenproject.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Jan Beulich <jbeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 22/37] xen/arm: use NR_MEM_BANKS to override default
 NR_NODE_MEMBLKS
In-Reply-To: <CAF3u54BNbPPo4_ezC2ft36NwodKDFSdtv_ekT-FFyvRrU3gQaA@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2109270956270.5022@sstabellini-ThinkPad-T480s>
References: <20210923120236.3692135-1-wei.chen@arm.com> <20210923120236.3692135-23-wei.chen@arm.com> <alpine.DEB.2.21.2109231828310.17979@sstabellini-ThinkPad-T480s> <DB9PR08MB685744A06D7C014DAE9BE73F9EA69@DB9PR08MB6857.eurprd08.prod.outlook.com>
 <alpine.DEB.2.21.2109262021200.5022@sstabellini-ThinkPad-T480s> <DB9PR08MB6857AD295D692F962AD76C219EA79@DB9PR08MB6857.eurprd08.prod.outlook.com> <alpine.DEB.2.21.2109262123140.5022@sstabellini-ThinkPad-T480s> <DB9PR08MB6857603316C2C808BAD8CD709EA79@DB9PR08MB6857.eurprd08.prod.outlook.com>
 <DB9PR08MB685744B09307DFCA38C0635C9EA79@DB9PR08MB6857.eurprd08.prod.outlook.com> <CAJ=z9a1D2ROHRyvRM7=kgnU_J2RkuHC_htYEWtqznUxtq=vZHA@mail.gmail.com> <DB9PR08MB6857316DC540769819C8155E9EA79@DB9PR08MB6857.eurprd08.prod.outlook.com>
 <CAF3u54BNbPPo4_ezC2ft36NwodKDFSdtv_ekT-FFyvRrU3gQaA@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-741841233-1632761885=:5022"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-741841233-1632761885=:5022
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 27 Sep 2021, Julien Grall wrote:
> On Mon, 27 Sep 2021, 12:22 Wei Chen, <Wei.Chen@arm.com> wrote:
>       Hi Julien,
> 
>       From: Julien Grall <julien.grall.oss@gmail.com>
>       Sent: 2021年9月27日 15:36
>       To: Wei Chen <Wei.Chen@arm.com>
>       Cc: Stefano Stabellini <sstabellini@kernel.org>; xen-devel <xen-devel@lists.xenproject.org>; Bertrand Marquis
>       <Bertrand.Marquis@arm.com>; Jan Beulich <jbeulich@suse.com>; Roger Pau Monné <roger.pau@citrix.com>; Andrew Cooper
>       <andrew.cooper3@citrix.com>
>       Subject: Re: [PATCH 22/37] xen/arm: use NR_MEM_BANKS to override default NR_NODE_MEMBLKS
> 
> 
>       On Mon, 27 Sep 2021, 08:53 Wei Chen, <mailto:Wei.Chen@arm.com> wrote:
>       Hi Julien,
> 
>       > -----Original Message-----
>       > From: Xen-devel <mailto:xen-devel-bounces@lists.xenproject.org> On Behalf Of Wei
>       > Chen
>       > Sent: 2021年9月27日 14:46
>       > To: Stefano Stabellini <mailto:sstabellini@kernel.org>
>       > Cc: mailto:xen-devel@lists.xenproject.org; mailto:julien@xen.org; Bertrand Marquis
>       > <mailto:Bertrand.Marquis@arm.com>; mailto:jbeulich@suse.com; mailto:roger.pau@citrix.com;
>       > mailto:andrew.cooper3@citrix.com
>       > Subject: RE: [PATCH 22/37] xen/arm: use NR_MEM_BANKS to override default
>       > NR_NODE_MEMBLKS
>       >
>       > Hi Stefano, Julien,
>       >
>       > > -----Original Message-----
>       > > From: Stefano Stabellini <mailto:sstabellini@kernel.org>
>       > > Sent: 2021年9月27日 13:00
>       > > To: Wei Chen <mailto:Wei.Chen@arm.com>
>       > > Cc: Stefano Stabellini <mailto:sstabellini@kernel.org>; xen-
>       > > mailto:devel@lists.xenproject.org; mailto:julien@xen.org; Bertrand Marquis
>       > > <mailto:Bertrand.Marquis@arm.com>; mailto:jbeulich@suse.com; mailto:roger.pau@citrix.com;
>       > > mailto:andrew.cooper3@citrix.com
>       > > Subject: RE: [PATCH 22/37] xen/arm: use NR_MEM_BANKS to override default
>       > > NR_NODE_MEMBLKS
>       > >
>       > > +x86 maintainers
>       > >
>       > > On Mon, 27 Sep 2021, Wei Chen wrote:
>       > > > > -----Original Message-----
>       > > > > From: Stefano Stabellini <mailto:sstabellini@kernel.org>
>       > > > > Sent: 2021年9月27日 11:26
>       > > > > To: Wei Chen <mailto:Wei.Chen@arm.com>
>       > > > > Cc: Stefano Stabellini <mailto:sstabellini@kernel.org>; xen-
>       > > > > mailto:devel@lists.xenproject.org; mailto:julien@xen.org; Bertrand Marquis
>       > > > > <mailto:Bertrand.Marquis@arm.com>
>       > > > > Subject: RE: [PATCH 22/37] xen/arm: use NR_MEM_BANKS to override
>       > > default
>       > > > > NR_NODE_MEMBLKS
>       > > > >
>       > > > > On Sun, 26 Sep 2021, Wei Chen wrote:
>       > > > > > > -----Original Message-----
>       > > > > > > From: Stefano Stabellini <mailto:sstabellini@kernel.org>
>       > > > > > > Sent: 2021年9月24日 9:35
>       > > > > > > To: Wei Chen <mailto:Wei.Chen@arm.com>
>       > > > > > > Cc: mailto:xen-devel@lists.xenproject.org; mailto:sstabellini@kernel.org;
>       > > > > mailto:julien@xen.org;
>       > > > > > > Bertrand Marquis <mailto:Bertrand.Marquis@arm.com>
>       > > > > > > Subject: Re: [PATCH 22/37] xen/arm: use NR_MEM_BANKS to override
>       > > > > default
>       > > > > > > NR_NODE_MEMBLKS
>       > > > > > >
>       > > > > > > On Thu, 23 Sep 2021, Wei Chen wrote:
>       > > > > > > > As a memory range described in device tree cannot be split
>       > > across
>       > > > > > > > multiple nodes. So we define NR_NODE_MEMBLKS as NR_MEM_BANKS
>       > in
>       > > > > > > > arch header.
>       > > > > > >
>       > > > > > > This statement is true but what is the goal of this patch? Is it
>       > > to
>       > > > > > > reduce code size and memory consumption?
>       > > > > > >
>       > > > > >
>       > > > > > No, when Julien and I discussed this in last version[1], we hadn't
>       > > > > thought
>       > > > > > so deeply. We just thought a memory range described in DT cannot
>       > be
>       > > > > split
>       > > > > > across multiple nodes. So NR_MEM_BANKS should be equal to
>       > > NR_MEM_BANKS.
>       > > > > >
>       > > > > > https://lists.xenproject.org/archives/html/xen-devel/2021-
>       > > > > 08/msg00974.html
>       > > > > >
>       > > > > > > I am asking because NR_MEM_BANKS is 128 and
>       > > > > > > NR_NODE_MEMBLKS=2*MAX_NUMNODES which is 64 by default so again
>       > > > > > > NR_NODE_MEMBLKS is 128 before this patch.
>       > > > > > >
>       > > > > > > In other words, this patch alone doesn't make any difference; at
>       > > least
>       > > > > > > doesn't make any difference unless CONFIG_NR_NUMA_NODES is
>       > > increased.
>       > > > > > >
>       > > > > > > So, is the goal to reduce memory usage when CONFIG_NR_NUMA_NODES
>       > > is
>       > > > > > > higher than 64?
>       > > > > > >
>       > > > > >
>       > > > > > I also thought about this problem when I was writing this patch.
>       > > > > > CONFIG_NR_NUMA_NODES is increasing, but NR_MEM_BANKS is a fixed
>       > > > > > value, then NR_MEM_BANKS can be smaller than CONFIG_NR_NUMA_NODES
>       > > > > > at one point.
>       > > > > >
>       > > > > > But I agree with Julien's suggestion, NR_MEM_BANKS and
>       > > NR_NODE_MEMBLKS
>       > > > > > must be aware of each other. I had thought to add some ASSERT
>       > check,
>       > > > > > but I don't know how to do it better. So I post this patch for
>       > more
>       > > > > > suggestion.
>       > > > >
>       > > > > OK. In that case I'd say to get rid of the previous definition of
>       > > > > NR_NODE_MEMBLKS as it is probably not necessary, see below.
>       > > > >
>       > > > >
>       > > > >
>       > > > > > >
>       > > > > > > > And keep default NR_NODE_MEMBLKS in common header
>       > > > > > > > for those architectures NUMA is disabled.
>       > > > > > >
>       > > > > > > This last sentence is not accurate: on x86 NUMA is enabled and
>       > > > > > > NR_NODE_MEMBLKS is still defined in xen/include/xen/numa.h
>       > (there
>       > > is
>       > > > > no
>       > > > > > > x86 definition of it)
>       > > > > > >
>       > > > > >
>       > > > > > Yes.
>       > > > > >
>       > > > > > >
>       > > > > > > > Signed-off-by: Wei Chen <mailto:wei.chen@arm.com>
>       > > > > > > > ---
>       > > > > > > >  xen/include/asm-arm/numa.h | 8 +++++++-
>       > > > > > > >  xen/include/xen/numa.h     | 2 ++
>       > > > > > > >  2 files changed, 9 insertions(+), 1 deletion(-)
>       > > > > > > >
>       > > > > > > > diff --git a/xen/include/asm-arm/numa.h b/xen/include/asm-
>       > > arm/numa.h
>       > > > > > > > index 8f1c67e3eb..21569e634b 100644
>       > > > > > > > --- a/xen/include/asm-arm/numa.h
>       > > > > > > > +++ b/xen/include/asm-arm/numa.h
>       > > > > > > > @@ -3,9 +3,15 @@
>       > > > > > > >
>       > > > > > > >  #include <xen/mm.h>
>       > > > > > > >
>       > > > > > > > +#include <asm/setup.h>
>       > > > > > > > +
>       > > > > > > >  typedef u8 nodeid_t;
>       > > > > > > >
>       > > > > > > > -#ifndef CONFIG_NUMA
>       > > > > > > > +#ifdef CONFIG_NUMA
>       > > > > > > > +
>       > > > > > > > +#define NR_NODE_MEMBLKS NR_MEM_BANKS
>       > > > > > > > +
>       > > > > > > > +#else
>       > > > > > > >
>       > > > > > > >  /* Fake one node for now. See also node_online_map. */
>       > > > > > > >  #define cpu_to_node(cpu) 0
>       > > > > > > > diff --git a/xen/include/xen/numa.h b/xen/include/xen/numa.h
>       > > > > > > > index 1978e2be1b..1731e1cc6b 100644
>       > > > > > > > --- a/xen/include/xen/numa.h
>       > > > > > > > +++ b/xen/include/xen/numa.h
>       > > > > > > > @@ -12,7 +12,9 @@
>       > > > > > > >  #define MAX_NUMNODES    1
>       > > > > > > >  #endif
>       > > > > > > >
>       > > > > > > > +#ifndef NR_NODE_MEMBLKS
>       > > > > > > >  #define NR_NODE_MEMBLKS (MAX_NUMNODES*2)
>       > > > > > > > +#endif
>       > > > >
>       > > > > This one we can remove it completely right?
>       > > >
>       > > > How about define NR_MEM_BANKS to:
>       > > > #ifdef CONFIG_NR_NUMA_NODES
>       > > > #define NR_MEM_BANKS (CONFIG_NR_NUMA_NODES * 2)
>       > > > #else
>       > > > #define NR_MEM_BANKS 128
>       > > > #endif
>       > > > for both x86 and Arm. For those architectures do not support or enable
>       > > > NUMA, they can still use "NR_MEM_BANKS 128". And replace all
>       > > NR_NODE_MEMBLKS
>       > > > in NUMA code to NR_MEM_BANKS to remove NR_NODE_MEMBLKS completely.
>       > > > In this case, NR_MEM_BANKS can be aware of the changes of
>       > > CONFIG_NR_NUMA_NODES.
>       > >
>       > > x86 doesn't have NR_MEM_BANKS as far as I can tell. I guess you also
>       > > meant to rename NR_NODE_MEMBLKS to NR_MEM_BANKS?
>       > >
>       >
>       > Yes.
>       >
>       > > But NR_MEM_BANKS is not directly related to CONFIG_NR_NUMA_NODES because
>       > > there can be many memory banks for each numa node, certainly more than
>       > > 2. The existing definition on x86:
>       > >
>       > > #define NR_NODE_MEMBLKS (MAX_NUMNODES*2)
>       > >
>       > > Doesn't make a lot of sense to me. Was it just an arbitrary limit for
>       > > the lack of a better way to set a maximum?
>       > >
>       >
>       > At that time, this was probably the most cost-effective approach.
>       > Enough and easy. But, if more nodes need to be supported in the
>       > future, it may bring more memory blocks. And this maximum value
>       > might not apply. The maximum may need to support dynamic extension.
>       >
>       > >
>       > > On the other hand, NR_MEM_BANKS and NR_NODE_MEMBLKS seem to be related.
>       > > In fact, what's the difference?
>       > >
>       > > NR_MEM_BANKS is the max number of memory banks (with or without
>       > > numa-node-id).
>       > >
>       > > NR_NODE_MEMBLKS is the max number of memory banks with NUMA support
>       > > (with numa-node-id)?
>       > >
>       > > They are basically the same thing. On ARM I would just do:
>       > >
>       >
>       > Probably not, NR_MEM_BANKS will count those memory ranges without
>       > numa-node-id in boot memory parsing stage (process_memory_node or
>       > EFI parser). But NR_NODE_MEMBLKS will only count those memory ranges
>       > with numa-node-id.
>       >
>       > > #define NR_NODE_MEMBLKS MAX(NR_MEM_BANKS, (CONFIG_NR_NUMA_NODES * 2))
>       > >
>       > >
> 
>       > Quote Julien's comment from HTML email to here:
>       > " As you wrote above, the second part of the MAX is totally arbitrary.
>       > In fact, it is very likely than if you have more than 64 nodes, you may
>       > need a lot more than 2 regions per node.
>       >
>       > So, for Arm, I would just define NR_NODE_MEMBLKS as an alias to NR_MEM_BANKS
>       > so it can be used by common code.
>       > "
>       >
>       > > But here comes the problem:
>       > > How can we set the NR_MEM_BANKS maximum value, 128 seems an arbitrary too?
>       >
>       > This is based on hardware we currently support (the last time we bumped the value was, IIRC, for Thunder-X). In the case of
>       booting UEFI, we can get a lot of small ranges as we discover the RAM using the UEFI memory map.
>       >
> 
>       Thanks for the background.
> 
>       >
>       > > If #define NR_MEM_BANKS (CONFIG_NR_NUMA_NODES * N)? And what N should be.
>       >
>       > N would have to be the maximum number of ranges you can find in a NUMA node.
>       >
>       > We would also need to make sure this doesn't break existing platforms. So N would have to be quite large or we need a MAX as
>       Stefano suggested.
>       >
>       > But I would prefer to keep the existing 128 and allow to configure it at build time (not necessarily in this series). This
>       avoid to have different way to define the value based NUMA vs non-NUMA.
> 
>       In this case, can we use Stefano's
>       "#define NR_NODE_MEMBLKS MAX(NR_MEM_BANKS, (CONFIG_NR_NUMA_NODES * 2))"
>       in next version. If yes, should we change x86 part? Because NR_MEM_BANKS
>       has not been defined in x86.
> 
> 
> What I meant by configuring dynamically is allowing NR_MEM_BANKS to be set by the user.
> 
> The second part of the MAX makes no sense to me (at least on Arm). So I really prefer if this is not part of the initial version.
> 
> We can refine the value, or introduce the MAX in the future if we have a justification for it.

OK, so for clarity the suggestion is:

- define NR_NODE_MEMBLKS as NR_MEM_BANKS on ARM in this series
- in the future make NR_MEM_BANKS user-configurable via kconfig
- for now leave NR_MEM_BANKS as 128 on ARM

That's fine by me.
--8323329-741841233-1632761885=:5022--

