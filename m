Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0DC9A999D2
	for <lists+xen-devel@lfdr.de>; Wed, 23 Apr 2025 22:59:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.965388.1355963 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7hC4-0005s1-I5; Wed, 23 Apr 2025 20:59:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 965388.1355963; Wed, 23 Apr 2025 20:59:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7hC4-0005po-EQ; Wed, 23 Apr 2025 20:59:44 +0000
Received: by outflank-mailman (input) for mailman id 965388;
 Wed, 23 Apr 2025 20:59:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UY1Q=XJ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1u7hC2-0005pi-MS
 for xen-devel@lists.xenproject.org; Wed, 23 Apr 2025 20:59:42 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id df4407ff-2085-11f0-9ffb-bf95429c2676;
 Wed, 23 Apr 2025 22:59:40 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 8AD7343677;
 Wed, 23 Apr 2025 20:59:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0ED2C4CEE2;
 Wed, 23 Apr 2025 20:59:37 +0000 (UTC)
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
X-Inumbo-ID: df4407ff-2085-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745441979;
	bh=JZ7XmHn3pzDAcXfsWzyaXgHwmQ1MRZvfmJRgYTdbILU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Y9ptOC5E5xHPIhRGoJMykQVn76XtstrW6b1lYFYSzt9ACd9oRg0F1V8C/pzod87yy
	 iWXug867qchFU9pIlASe/oo0SHeeLTZSo9PsQLVirxDOgKEAJUFhcCwfAZQQP4D+j8
	 b34ML35RVDToSQUeBGWTv1VOwYYfgdLhZ1qntuuS5JlHQJC9J3F6oDHbpftj0GMfjg
	 5JsLrHuGui9jm/HpbqV3vZ/wsDVQJyVJOtYhfytT+NMt7YF7Af32oRpTLJxF4iIp3f
	 o0c7YN0UG3IY2Nr0+wfRzM9uR3cbCJX+fTpwtWs1Q/mxdzxp3gl8IMSd+qYGhdPNQ3
	 6dw6E/kmIAxEg==
Date: Wed, 23 Apr 2025 13:59:37 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v4 3/4] xen/arm: add support for PCI child bus
In-Reply-To: <79bbb6705638445526bbd1fa299b7bfd0d087462.1745402473.git.mykyta_poturai@epam.com>
Message-ID: <alpine.DEB.2.22.394.2504231359190.785180@ubuntu-linux-20-04-desktop>
References: <cover.1745402473.git.mykyta_poturai@epam.com> <79bbb6705638445526bbd1fa299b7bfd0d087462.1745402473.git.mykyta_poturai@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 23 Apr 2025, Mykyta Poturai wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> PCI host bridges often have different ways to access the root and child
> bus configuration spaces. One of the examples is Designware's host bridge
> and its multiple clones [1].
> 
> Linux kernel implements this by instantiating a child bus when device
> drivers provide not only the usual pci_ops to access ECAM space (this is
> the case for the generic host bridge), but also means to access the child
> bus which has a dedicated configuration space and own implementation for
> accessing the bus, e.g. child_ops.
> 
> For Xen it is not feasible to fully implement PCI bus infrastructure as
> Linux kernel does, but still child bus can be supported.
> 
> Add support for the PCI child bus which includes the following changes:
> - introduce bus mapping functions depending on SBDF
> - assign bus start and end for the child bus and re-configure the same for
>   the parent (root) bus
> - make pci_find_host_bridge be aware of multiple busses behind the same bridge
> - update pci_host_bridge_mappings, so it also doesn't map to guest the memory
>   spaces belonging to the child bus
> - make pci_host_common_probe accept one more pci_ops structure for the child bus
> - install MMIO handlers for the child bus
> - re-work vpci_mmio_{write|read} with parent and child approach in mind
> 
> [1] https://elixir.bootlin.com/linux/v5.15/source/drivers/pci/controller/dwc
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>

I just wanted to say that pending Stewart's comment, this patch looks
good to me

