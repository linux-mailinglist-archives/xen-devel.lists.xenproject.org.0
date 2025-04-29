Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E345AA3BEA
	for <lists+xen-devel@lfdr.de>; Wed, 30 Apr 2025 01:06:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.973211.1361394 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9u1Y-0004Ac-Ap; Tue, 29 Apr 2025 23:06:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 973211.1361394; Tue, 29 Apr 2025 23:06:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9u1Y-00047q-6m; Tue, 29 Apr 2025 23:06:00 +0000
Received: by outflank-mailman (input) for mailman id 973211;
 Tue, 29 Apr 2025 23:05:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZtOk=XP=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1u9u1W-00047k-C1
 for xen-devel@lists.xenproject.org; Tue, 29 Apr 2025 23:05:58 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 81060cc2-254e-11f0-9ffb-bf95429c2676;
 Wed, 30 Apr 2025 01:05:56 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 02E3D5C3E76;
 Tue, 29 Apr 2025 23:03:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BBE3C4CEE3;
 Tue, 29 Apr 2025 23:05:51 +0000 (UTC)
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
X-Inumbo-ID: 81060cc2-254e-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745967953;
	bh=VqWYX0Ufeo293T3v2UtbGlHxnyXxQxwmWNnnbxBhxSw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=oxle5jdsm5FSB8XJ+wFS/3lRrRPGXFNZWcHQMepnriGE4LvaoceKBnIVmyF7u+Nt8
	 KKxwyHKg7Tp0cXfiBRebh1ZHlNNfwZAXUHvCfFzRmuzGOwUcXuUPH9cDqWdF6j6Sur
	 tEL/cqEpLYx2QUm8fA6ipVZW+5aXqiLQgEDzDqKMugtvZomNdmyBxZwy1NL9BvT0Ef
	 2xsUQcfdOdyLwRPNKoAEQ857nqd0K5lRZ32o/oAQ0PUq49a2kMN6qckG9fmVoJmERr
	 ULr1uIIluf3rTDE4up6VRr8vG4aSkdvVK/dgiWwrMW0smFmarhjNVT5L69HPApGBOG
	 Gw4fC+XD0Ghig==
Date: Tue, 29 Apr 2025 16:05:49 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Jan Beulich <jbeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stewart Hildebrand <stewart.hildebrand@amd.com>
Subject: Re: [PATCH v10 1/7] iommu/arm: Introduce iommu_add_dt_pci_sideband_ids
 API
In-Reply-To: <8110a8fd8648b1e40a47c51d68bf5cab5a46468d.1745918678.git.mykyta_poturai@epam.com>
Message-ID: <alpine.DEB.2.22.394.2504291605380.3879245@ubuntu-linux-20-04-desktop>
References: <cover.1745918678.git.mykyta_poturai@epam.com> <8110a8fd8648b1e40a47c51d68bf5cab5a46468d.1745918678.git.mykyta_poturai@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 29 Apr 2025, Mykyta Poturai wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> The main purpose of this patch is to add a way to register PCI device
> (which is behind the IOMMU) using the generic PCI-IOMMU DT bindings [1]
> before assigning that device to a domain.
> 
> This behaves similarly to the existing iommu_add_dt_device API, except it
> handles PCI devices, and it is to be invoked from the add_device hook in the
> SMMU driver.
> 
> The function dt_map_id to translate an ID through a downstream mapping
> (which is also suitable for mapping Requester ID) was borrowed from Linux
> (v5.10-rc6) and updated according to the Xen code base.
> 
> [1] https://www.kernel.org/doc/Documentation/devicetree/bindings/pci/pci-iommu.txt
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


