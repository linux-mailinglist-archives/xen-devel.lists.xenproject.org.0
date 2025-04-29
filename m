Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F4EAA3C00
	for <lists+xen-devel@lfdr.de>; Wed, 30 Apr 2025 01:19:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.973239.1361412 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9uE0-0006gJ-L7; Tue, 29 Apr 2025 23:18:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 973239.1361412; Tue, 29 Apr 2025 23:18:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9uE0-0006e3-IX; Tue, 29 Apr 2025 23:18:52 +0000
Received: by outflank-mailman (input) for mailman id 973239;
 Tue, 29 Apr 2025 23:18:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZtOk=XP=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1u9uDz-0006dx-Dy
 for xen-devel@lists.xenproject.org; Tue, 29 Apr 2025 23:18:51 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org
 [2600:3c0a:e001:78e:0:1991:8:25])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4e79fa5b-2550-11f0-9eb4-5ba50f476ded;
 Wed, 30 Apr 2025 01:18:50 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 4B3BD4A8BD;
 Tue, 29 Apr 2025 23:18:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18D09C4CEE3;
 Tue, 29 Apr 2025 23:18:46 +0000 (UTC)
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
X-Inumbo-ID: 4e79fa5b-2550-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745968728;
	bh=U6BueKjq2zk7F4nJquL2yI7DyCitzxGc4GFuZgnRae8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=RPxnu1WrHrapbni0IWkS48jRBHcaCxBNEZs0rvgJZE/i0SAFcQdxDrWIY3FV3LZo+
	 TIEV6uTa7VBrM6880bMZeslkAwfh51MTt4NTagzGSS/q5nPA2n02CuiWIDyjkvXeD4
	 nbxq2Njst/hfnzUlm8An/Yq3e0p8YomLMpsIaakbFhxkerHO0G3nlHibLe8wybZoRr
	 cH+7mOByydW0sJolF7AWDB1bm+kyF6ieK+c/jaVizlHrF7mBbM9nD1oxLk0PDIKeRp
	 x+x2m/fm9mITGyDznx3aYQduMSFkqvtwsBeDX0kJDKPtrrdDDyqnCoTdEWyHTyvxlj
	 K1g/kgO9GmMcA==
Date: Tue, 29 Apr 2025 16:18:45 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Rahul Singh <rahul.singh@arm.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Stewart Hildebrand <stewart.hildebrand@amd.com>
Subject: Re: [PATCH v10 7/7] xen/arm: Map ITS doorbell register to IOMMU page
 tables
In-Reply-To: <c425567d767e30a7750c0f93cb618d3e3381e039.1745918678.git.mykyta_poturai@epam.com>
Message-ID: <alpine.DEB.2.22.394.2504291618340.3879245@ubuntu-linux-20-04-desktop>
References: <cover.1745918678.git.mykyta_poturai@epam.com> <c425567d767e30a7750c0f93cb618d3e3381e039.1745918678.git.mykyta_poturai@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 29 Apr 2025, Mykyta Poturai wrote:
> From: Rahul Singh <rahul.singh@arm.com>
> 
> When ITS is enabled and PCI devices that are behind an SMMU generate an
> MSI interrupt, SMMU fault will be observed as there is currently no
> mapping in p2m table for the ITS translation register (GITS_TRANSLATER).
> 
> A mapping is required in the iommu page tables so that the device can
> generate the MSI interrupt writing to the GITS_TRANSLATER register.
> 
> The GITS_TRANSLATER register is a 32-bit register, and there is nothing
> else in a page containing it, so map that page.
> 
> Add new host_addr parameter to vgic_v3_its_init_virtual to prepare the
> foundation for DomU MSI support where guest doorbell address can differ
> for the host's. Note that the 1:1 check in arm_iommu_map_page remains
> for now, as virtual ITSes are currently only created for hwdom where the
> doorbell mapping is always 1:1.
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


