Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E114B2EA40
	for <lists+xen-devel@lfdr.de>; Thu, 21 Aug 2025 03:14:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1087706.1445581 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uotrc-0001NQ-8M; Thu, 21 Aug 2025 01:13:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1087706.1445581; Thu, 21 Aug 2025 01:13:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uotrc-0001Kd-20; Thu, 21 Aug 2025 01:13:12 +0000
Received: by outflank-mailman (input) for mailman id 1087706;
 Thu, 21 Aug 2025 01:13:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JTf3=3B=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uotra-0001KX-G7
 for xen-devel@lists.xenproject.org; Thu, 21 Aug 2025 01:13:10 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fea78aa4-7e2b-11f0-b898-0df219b8e170;
 Thu, 21 Aug 2025 03:13:07 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 45F8561446;
 Thu, 21 Aug 2025 01:13:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0DB5C4CEE7;
 Thu, 21 Aug 2025 01:13:04 +0000 (UTC)
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
X-Inumbo-ID: fea78aa4-7e2b-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755738786;
	bh=0lsMR/auYfp0PZak8kqYkmhybqftIu9gTSwQiWM9MNI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=JKyEUgf2BkUtuPdfcq36EDwxTpPqMEzBZolORugGPEbCrb65rvYs5LBjr2rQssfA1
	 QNLwxQihCiPOZQ8sZPbEIdm5k8mS6oGCl3M325//iXb5aS+YCQHtiuLyuLta454/8R
	 3PI+Meh1umdxOd2KHj8c0HidH4xbpdL20KyMiv1txMOCOZ94HO5sRLCm3kAB4m17Y7
	 fO87bf7zA+lBZgtEUhC0uAFOWzMBsm70eaIWk+A7bbAm+mapyr5N1SmwAvLfcLapcz
	 PqzgrESp4lzhGhL7iMbStnjofcGIhSey85jSyqj8kEvTWlQR2YaxjBHJmvGKdrRSQE
	 vX7FD0Md5NgPA==
Date: Wed, 20 Aug 2025 18:12:43 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 3/3] iommu/ipmmu-vmsa: Implement basic PCIE-IPMMU OSID
 support
In-Reply-To: <8d0e16b6cb439000571ab6771a6c0e61627825ce.1752482857.git.mykyta_poturai@epam.com>
Message-ID: <alpine.DEB.2.22.394.2508201812370.2743087@ubuntu-linux-20-04-desktop>
References: <cover.1752482857.git.mykyta_poturai@epam.com> <8d0e16b6cb439000571ab6771a6c0e61627825ce.1752482857.git.mykyta_poturai@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 14 Jul 2025, Mykyta Poturai wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> Program PCIE BDF-OSID assignment according to the S4_PCIe_IPMMU-OSID
> when adding PCI device to the IOMMU in ipmmu_add_device callback.
> This is needed for being able to assign PCI devices to different
> domains at the same time. Programmed OSID is emmited as sideband data on
> the AXI bus during PCI DMA transactions and then used by IPMMU to match
> the transaction to the corresponding uTLB.
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

