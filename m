Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3474D417BF7
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 21:53:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.195633.348413 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTrFa-0005AK-3k; Fri, 24 Sep 2021 19:52:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 195633.348413; Fri, 24 Sep 2021 19:52:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTrFZ-00058A-WA; Fri, 24 Sep 2021 19:52:49 +0000
Received: by outflank-mailman (input) for mailman id 195633;
 Fri, 24 Sep 2021 19:52:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UhVx=OO=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mTrFZ-000584-1T
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 19:52:49 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fd890765-1d70-11ec-bb18-12813bfff9fa;
 Fri, 24 Sep 2021 19:52:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A255B6103D;
 Fri, 24 Sep 2021 19:52:46 +0000 (UTC)
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
X-Inumbo-ID: fd890765-1d70-11ec-bb18-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632513166;
	bh=HYq8vef2T/Mz3Uqsl0mASy2K0c2VYjZ9WfF4zQs9xFw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=pqIhoB81gqaQ6sw1OdEROKxCCVxyql56qbRkTbbEKL50dO5FOpw9pPpl/FDRTx081
	 T8p0EVaRoVUaHM0NBuoWcnQXEmLZgOFKBEtVB0d76YmV0WlWORsDJszHKqKToLAjuW
	 qanxx45vJ/BKtAV8kmbcbdOO3pLcqxGGncUe57g+x0+nBlOZj5h338xzCHRWjMbXEv
	 dzE+h7qboDtMw5bpzOXuxVvMd9ch+sm3dK55vO7WO7EavUX1dDr6e7uIqWKwqzvhMf
	 wJq6yHLqaYb7zfY3cAPfoiAIJoBDdvV88vH1fXwELaxep1twQClvFsiNIJDSs6ACca
	 4r6GbCutjT2Ng==
Date: Fri, 24 Sep 2021 12:52:46 -0700 (PDT)
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
In-Reply-To: <PAXPR08MB686474BADD786E523EAC026B9EA49@PAXPR08MB6864.eurprd08.prod.outlook.com>
Message-ID: <alpine.DEB.2.21.2109241244070.17979@sstabellini-ThinkPad-T480s>
References: <20210923120236.3692135-1-wei.chen@arm.com> <20210923120236.3692135-9-wei.chen@arm.com> <alpine.DEB.2.21.2109231719410.17979@sstabellini-ThinkPad-T480s> <PAXPR08MB686474BADD786E523EAC026B9EA49@PAXPR08MB6864.eurprd08.prod.outlook.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-640249418-1632513166=:17979"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-640249418-1632513166=:17979
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 24 Sep 2021, Wei Chen wrote:
> > -----Original Message-----
> > From: Stefano Stabellini <sstabellini@kernel.org>
> > Sent: 2021年9月24日 8:26
> > To: Wei Chen <Wei.Chen@arm.com>
> > Cc: xen-devel@lists.xenproject.org; sstabellini@kernel.org; julien@xen.org;
> > Bertrand Marquis <Bertrand.Marquis@arm.com>; jbeulich@suse.com;
> > andrew.cooper3@citrix.com; roger.pau@citrix.com; wl@xen.org
> > Subject: Re: [PATCH 08/37] xen/x86: add detection of discontinous node
> > memory range
> > 
> > CC'ing x86 maintainers
> > 
> > On Thu, 23 Sep 2021, Wei Chen wrote:
> > > One NUMA node may contain several memory blocks. In current Xen
> > > code, Xen will maintain a node memory range for each node to cover
> > > all its memory blocks. But here comes the problem, in the gap of
> > > one node's two memory blocks, if there are some memory blocks don't
> > > belong to this node (remote memory blocks). This node's memory range
> > > will be expanded to cover these remote memory blocks.
> > >
> > > One node's memory range contains othe nodes' memory, this is obviously
> > > not very reasonable. This means current NUMA code only can support
> > > node has continous memory blocks. However, on a physical machine, the
> > > addresses of multiple nodes can be interleaved.
> > >
> > > So in this patch, we add code to detect discontinous memory blocks
> > > for one node. NUMA initializtion will be failed and error messages
> > > will be printed when Xen detect such hardware configuration.
> > 
> > At least on ARM, it is not just memory that can be interleaved, but also
> > MMIO regions. For instance:
> > 
> > node0 bank0 0-0x1000000
> > MMIO 0x1000000-0x1002000
> > Hole 0x1002000-0x2000000
> > node0 bank1 0x2000000-0x3000000
> > 
> > So I am not familiar with the SRAT format, but I think on ARM the check
> > would look different: we would just look for multiple memory ranges
> > under a device_type = "memory" node of a NUMA node in device tree.
> > 
> > 
> 
> Should I need to include/refine above message to commit log?

Let me ask you a question first.

With the NUMA implementation of this patch series, can we deal with
cases where each node has multiple memory banks, not interleaved?
An an example:

node0: 0x0        - 0x10000000
MMIO : 0x10000000 - 0x20000000
node0: 0x20000000 - 0x30000000
MMIO : 0x30000000 - 0x50000000
node1: 0x50000000 - 0x60000000
MMIO : 0x60000000 - 0x80000000
node2: 0x80000000 - 0x90000000


I assume we can deal with this case simply by setting node0 memory to
0x0-0x30000000 even if there is actually something else, a device, that
doesn't belong to node0 in between the two node0 banks?

Is it only other nodes' memory interleaved that cause issues? In other
words, only the following is a problematic scenario?

node0: 0x0        - 0x10000000
MMIO : 0x10000000 - 0x20000000
node1: 0x20000000 - 0x30000000
MMIO : 0x30000000 - 0x50000000
node0: 0x50000000 - 0x60000000

Because node1 is in between the two ranges of node0?


I am asking these questions because it is certainly possible to have
multiple memory ranges for each NUMA node in device tree, either by
specifying multiple ranges with a single "reg" property, or by
specifying multiple memory nodes with the same numa-node-id.
--8323329-640249418-1632513166=:17979--

