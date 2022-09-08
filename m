Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E76CB5B10DD
	for <lists+xen-devel@lfdr.de>; Thu,  8 Sep 2022 02:17:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.402393.644327 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oW5De-0008QQ-PO; Thu, 08 Sep 2022 00:16:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 402393.644327; Thu, 08 Sep 2022 00:16:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oW5De-0008OZ-Mm; Thu, 08 Sep 2022 00:16:34 +0000
Received: by outflank-mailman (input) for mailman id 402393;
 Thu, 08 Sep 2022 00:16:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5KOk=ZL=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oW5Dd-0008OT-Hi
 for xen-devel@lists.xenproject.org; Thu, 08 Sep 2022 00:16:33 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7d52aabe-2f0b-11ed-a016-b9edf5238543;
 Thu, 08 Sep 2022 02:16:31 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id AEE7AB81110;
 Thu,  8 Sep 2022 00:16:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E519C433C1;
 Thu,  8 Sep 2022 00:16:28 +0000 (UTC)
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
X-Inumbo-ID: 7d52aabe-2f0b-11ed-a016-b9edf5238543
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662596189;
	bh=oYKg/saTj3ss1K5fYPVkjbSJ1tvBQgbzWpCBEPUmWkM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=XMjOTW54rayu7IJn0vGAczu7fvV2REK/4nknD3jN24yPAUDm9jhdcpfGoExU3Jlec
	 m9UOwkp7NuQVPWsY3H/scIp7Mrfm3XuUtNz04nVS5iFuT4pwztJQvkDdfg3fSO1Ecq
	 6L0mCSDSDarhKfFuxcR/xnx2wUs+fhRD9z0GIxsxJJ6/HhFjPYMo2WwRr6rPDyXV4M
	 3vVZMVo1sRbnJuGpsyFJQVHKIhPLyR77msD+g71fBve3OJWc2PZPauBw5iwm9XeSUP
	 AQgTlVIScJ1sNqO//iHFM5DxudeDPqlrM/iTGvdD2fSFiC0sXVYekaaSwHtABQTzP9
	 LX1d+OYfSpSWQ==
Date: Wed, 7 Sep 2022 17:16:27 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Penny Zheng <Penny.Zheng@arm.com>, xen-devel@lists.xenproject.org, 
    wei.chen@arm.com, Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v7 7/9] xen/arm: create shared memory nodes in guest
 device tree
In-Reply-To: <ca8eeff8-f40f-0cf9-bde3-a733b61e3712@xen.org>
Message-ID: <alpine.DEB.2.22.394.2209071710470.157835@ubuntu-linux-20-04-desktop>
References: <20220906085941.944592-1-Penny.Zheng@arm.com> <20220906085941.944592-8-Penny.Zheng@arm.com> <ca8eeff8-f40f-0cf9-bde3-a733b61e3712@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 7 Sep 2022, Julien Grall wrote:
> On 06/09/2022 09:59, Penny Zheng wrote:
> > We expose the shared memory to the domU using the "xen,shared-memory-v1"
> > reserved-memory binding. See
> > Documentation/devicetree/bindings/reserved-memory/xen,shared-memory.txt
> > in Linux for the corresponding device tree binding.
> > 
> > To save the cost of re-parsing shared memory device tree configuration when
> > creating shared memory nodes in guest device tree, this commit adds new
> > field
> > "shm_mem" to store shm-info per domain.
> > 
> > For each shared memory region, a range is exposed under
> > the /reserved-memory node as a child node. Each range sub-node is
> > named xen-shmem@<address> and has the following properties:
> > - compatible:
> >          compatible = "xen,shared-memory-v1"
> > - reg:
> >          the base guest physical address and size of the shared memory
> > region
> > - xen,id:
> >          a string that identifies the shared memory region.
> 
> So technically, there is a property "xen,offset" that should be specified for
> the borrowers.
> 
> TBH, I don't quite understand what this property is used for. So it is not
> quite clear why this is skipped.
> 
> The Stefano is the author of the binding. So maybe he can explain the purpose
> of the property and help to document it in the commit message why this is
> ignored.

It looks like it is something we introduced to handle the case where
memory from the owner is shared with multiple borrowers. Each borrower
would have its own offset within the region shared by the owner:

https://marc.info/?l=xen-devel&m=154110446604365&w=2


The use-case is a bit of a corner case but it looks valid. If I had to
do it now, I would at least mark "xen,offset" as "optional".

I think we have two options here and I am happy with either one:

1) we add xen,offset = <0x0>;

2) we do *not* add xen,offset and instead send a patch to the LKML to
fix
Documentation/devicetree/bindings/reserved-memory/xen,shared-memory.txt
so that it clearly states that xen,offset is optional. I don't know if
Rob would accept such a patch without changing the version in the
compatible string.

Given the release deadline, I would go with 1). We can always remove it
once it becomes clearly optional.

