Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE6E1B129DA
	for <lists+xen-devel@lfdr.de>; Sat, 26 Jul 2025 11:23:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1059173.1426360 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufb7k-0004HM-SU; Sat, 26 Jul 2025 09:23:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1059173.1426360; Sat, 26 Jul 2025 09:23:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufb7k-0004EQ-PS; Sat, 26 Jul 2025 09:23:24 +0000
Received: by outflank-mailman (input) for mailman id 1059173;
 Sat, 26 Jul 2025 09:23:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ufb7j-0004EG-D6
 for xen-devel@lists.xenproject.org; Sat, 26 Jul 2025 09:23:23 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ufb7j-002FBH-0H;
 Sat, 26 Jul 2025 09:23:23 +0000
Received: from [2a02:8012:3a1:0:c403:8a80:39a7:bf21]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ufb7i-00Ca5Y-2s;
 Sat, 26 Jul 2025 09:23:22 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=XTOSzJDhsf6Qunh2IQp5z0UwpmGCr6zN528G5ys2QZk=; b=0NazFmHwr0uLHoqZNBNBW8kGKa
	XM0h/vMqP4nL1qnecTjsU6A16A+thknOOvqJ+BkLoNpVkB3TSd8zI5zEptowPDk4p7RNEg8EbE9wH
	abelO5b+btvBuKD7FDufF9/fPBXd8sxHEvloJ51lwleIyHf9AsAru4wpTnSYJ2oWD1bU=;
Message-ID: <5fab90b6-7cae-45d0-bb8e-b1ffa0390b6f@xen.org>
Date: Sat, 26 Jul 2025 10:23:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] xen/arm: fix arm_iommu_map_page after f9f6b22abf1d
Content-Language: en-GB
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <stefano.stabellini@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250725140130.4008-1-stewart.hildebrand@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20250725140130.4008-1-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 25/07/2025 15:01, Stewart Hildebrand wrote:
> From: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> Up until f9f6b22abf1d "xen/arm: Map ITS doorbell register to IOMMU page
> tables" the only caller of iommu_map on ARM was grant_table.c which has
> a specific usage model and restrictions as described by the in-code
> comment in arm_iommu_map_page.
> 
> f9f6b22abf1d introduced a second caller to iommu_map on ARM:
> vgic_v3_its_init_virtual. This specific statement in the
> f9f6b22abf1d commit message is partially wrong:
> 
> "Note that the 1:1 check in arm_iommu_map_page remains for now, as
> virtual ITSes are currently only created for hwdom where the doorbell
> mapping is always 1:1."
> 
> Leading to crashes any time the hardware domain is not direct-mapped
> (e.g. cache coloring and non-Dom0 hardware domain):
> 
> (XEN) Xen BUG at drivers/passthrough/arm/iommu_helpers.c:47
> [...]
> (XEN) Xen call trace:
> (XEN)    [<00000a000024c758>] arm_iommu_map_page+0x80/0x90 (PC)
> (XEN)    [<00000a000024c750>] arm_iommu_map_page+0x78/0x90 (LR)
> (XEN)    [<00000a0000250884>] iommu_map+0xcc/0x29c
> (XEN)    [<00000a0000288024>] vgic_v3_its_init_domain+0x18c/0x1e8
> (XEN)    [<00000a0000285228>] vgic-v3.c#vgic_v3_domain_init+0x168/0x21c
> (XEN)    [<00000a0000281dcc>] domain_vgic_init+0x14c/0x210
> (XEN)    [<00000a00002705a4>] arch_domain_create+0x150/0x1f0
> (XEN)    [<00000a00002055e8>] domain_create+0x47c/0x6c0
> (XEN)    [<00000a00002cf090>] create_domUs+0x7f8/0x8cc
> (XEN)    [<00000a00002eb588>] start_xen+0x8f4/0x998
> (XEN)    [<00000a000020018c>] head.o#primary_switched+0x4/0x10
> 
> Specifically, non-1:1 hardware domain exists with cache coloring
> enabled. For that, is_domain_direct_mapped(d) is false but
> domain_use_host_layout(d) is true.
> 
> Change the is_domain_direct_mapped(d) checks in arm_iommu_map_page and
> arm_iommu_unmap_page into domain_use_host_layout(d) checks.
> 
> Drop stale in-code comment specific to grant table mappings.
> 
> Fixes: f9f6b22abf1d ("xen/arm: Map ITS doorbell register to IOMMU page tables")
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall


