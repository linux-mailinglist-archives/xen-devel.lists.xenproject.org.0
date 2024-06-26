Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26EB8919B35
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jun 2024 01:37:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.749562.1157755 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMcCX-00007U-Ph; Wed, 26 Jun 2024 23:37:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 749562.1157755; Wed, 26 Jun 2024 23:37:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMcCX-0008WS-N4; Wed, 26 Jun 2024 23:37:21 +0000
Received: by outflank-mailman (input) for mailman id 749562;
 Wed, 26 Jun 2024 23:37:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dBdT=N4=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sMcCV-0008WL-SM
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2024 23:37:19 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0554fb0e-3415-11ef-90a3-e314d9c70b13;
 Thu, 27 Jun 2024 01:37:18 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id D657ACE2CB6;
 Wed, 26 Jun 2024 23:37:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C9B5C116B1;
 Wed, 26 Jun 2024 23:37:13 +0000 (UTC)
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
X-Inumbo-ID: 0554fb0e-3415-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719445034;
	bh=6/kCuEt6MAEYKBkd9O118P4oub3DIuxgn/yMV/Kw7gw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=P7wGZUlJQ8VHey2LH9f4yjQg78EQ0fN1TitTl8QNt0EBC4r+2AgGKhD92LOOFiqRN
	 H1wrThqx5tH8461hw7RAYCBYBkLgiOucmtb98FuI2ShQvJtjFpmS+L9iyaI91AV12w
	 6j1Qkqbz37wXQC44EeUp5IV9trtEfqGhjakTUET5D/6/kKSILodoMbYXxcpyoQE/Sv
	 kvMOdxm2RGvd2BzNVclfpEg1Lb3UN1BO8kQxApUKfy3xRhwtnAIEhQPosBUwQgOrwD
	 /+w/7jF03OH0l2pIMkW/noGwLPhMwgHWNWE2QQRI5Wo7ppGk0fbYwDzUR8NjtILxTz
	 Upn97C+iSQftQ==
Date: Wed, 26 Jun 2024 16:37:11 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, oleksii.kurochko@gmail.com
Subject: Re: [PATCH for-4.19(?)] xen/arm: bootfdt: Fix device tree memory
 node probing
In-Reply-To: <766b260e-204c-423f-b0e1-c21957b6d169@xen.org>
Message-ID: <alpine.DEB.2.22.394.2406261633240.3635@ubuntu-linux-20-04-desktop>
References: <20240626080428.18480-1-michal.orzel@amd.com> <766b260e-204c-423f-b0e1-c21957b6d169@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 26 Jun 2024, Julien Grall wrote:
> Hi Michal,
> 
> On 26/06/2024 09:04, Michal Orzel wrote:
> > Memory node probing is done as part of early_scan_node() that is called
> > for each node with depth >= 1 (root node is at depth 0). According to
> > Devicetree Specification v0.4, chapter 3.4, /memory node can only exists
> > as a top level node. However, Xen incorrectly considers all the nodes with
> > unit node name "memory" as RAM. This buggy behavior can result in a
> > failure if there are other nodes in the device tree (at depth >= 2) with
> > "memory" as unit node name. An example can be a "memory@xxx" node under
> > /reserved-memory. Fix it by introducing device_tree_is_memory_node() to
> > perform all the required checks to assess if a node is a proper /memory
> > node.
> > 
> > Fixes: 3e99c95ba1c8 ("arm, device tree: parse the DTB for RAM location and
> > size")
> > Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> > ---
> > 4.19: This patch is fixing a possible early boot Xen failure (before main
> > console is initialized). In my case it results in a warning "Shattering
> > superpage is not supported" and panic "Unable to setup the directmap
> > mappings".
> > 
> > If this is too late for this patch to go in, we can backport it after the
> > tree
> > re-opens.
> 
> The code looks correct to me, but I am not sure about merging it to 4.19.
> 
> This is not a new bug (in fact has been there since pretty much Xen on Arm was
> created) and we haven't seen any report until today. So in some way it would
> be best to merge it after 4.19 so it can get more testing.

First it was found on a new board, but then the issue appeared also on
an old board (the Ultrascale+). I think the reason is that a
reserved-memory node was added triggering the bug.


> In the other hand, I guess this will block you. Is this a new platform? Is it
> available?

Yes the platform is available so I would be more concerned about Xen
4.19 not booting on newer Ultrascale+ device trees. That said, we can
also backport the fix later to staging-4.19. I'll leave the decision to
you.

