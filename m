Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7ED2B52674
	for <lists+xen-devel@lfdr.de>; Thu, 11 Sep 2025 04:29:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1119110.1464626 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwX45-0002xT-4i; Thu, 11 Sep 2025 02:29:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1119110.1464626; Thu, 11 Sep 2025 02:29:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwX45-0002um-13; Thu, 11 Sep 2025 02:29:37 +0000
Received: by outflank-mailman (input) for mailman id 1119110;
 Thu, 11 Sep 2025 02:29:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5SW2=3W=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uwX43-0002uc-AK
 for xen-devel@lists.xenproject.org; Thu, 11 Sep 2025 02:29:35 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 268accc4-8eb7-11f0-9809-7dc792cee155;
 Thu, 11 Sep 2025 04:29:33 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 6788C6013D;
 Thu, 11 Sep 2025 02:29:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D1E4C4CEEB;
 Thu, 11 Sep 2025 02:29:30 +0000 (UTC)
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
X-Inumbo-ID: 268accc4-8eb7-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757557772;
	bh=ps6VYtCKung9s6vYdHewRXmxP4ek7Iv6t9sxH4jBa7M=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Gzcd8j18ZzUDiHOK2ogFvH3ZrPCkGHqVhk4XCHpqCvLu5cqt9zcbAFMJGK3t5Yvcv
	 ATOP/85dYNuv3qIJdrZTWAFy458UQh5PpS02o8dBVcZn6VPjIneyxPBO1XsNp7D+dn
	 1M0AIHJvg70jqus7rZ88R5Le0RDoWe2GptK7ylPCuzWyRZwEXiutoVLesuCxLcpZDa
	 IO+OJSXMDLumCfSPyjkIyncH4Xz5TBZsbQX1deipRRpv/W5dT0AyJ/XVIBhwYPgnJg
	 HlHPMBaQmkeiVyxdVguSNrsSrHEo9wctLjldErYafgu0HZEhb0eMjzFiW+5dZ5LcXp
	 qYcnStLZzG51Q==
Date: Wed, 10 Sep 2025 19:29:29 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Penny Zheng <Penny.Zheng@amd.com>
cc: xen-devel@lists.xenproject.org, ray.huang@amd.com, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Jan Beulich <jbeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: [PATCH v2 10/26] xen/domctl: wrap domain_kill() with
 CONFIG_MGMT_HYPERCALLS
In-Reply-To: <20250910073827.3622177-11-Penny.Zheng@amd.com>
Message-ID: <alpine.DEB.2.22.394.2509101928400.52703@ubuntu-linux-20-04-desktop>
References: <20250910073827.3622177-1-Penny.Zheng@amd.com> <20250910073827.3622177-11-Penny.Zheng@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 10 Sep 2025, Penny Zheng wrote:
> Function domain_kill() is responsible for killing domain and relinquish
> domain-held resources. and it is only invoked under
> XEN_DOMCTL_destroydomain-case. So it shall be wrapped with
> CONFIG_MGMT_HYPERCALLS.
> Tracking its calling chain, the following functions could also be wrapped with
> CONFIG_MGMT_HYPERCALLS:
> - domain_relinquish_resource
>   - pci_release_device
>   - relinquish_shared_pages
>   - paging_teardown
>     - p2m_pod_empty_cache
>   - relinquish_memory
>   - pit_deinit
>   - iommu_release_dt_devices
>   - tee_relinquish_resources
>     - ffa_relinquish_resources/optee_relinquish_resources
>   - relinquish_p2m_mapping
>   - p2m_clear_root_pages
> Wrap XEN_DOMCTL_destroydomain-case transiently with CONFIG_MGMT_HYPERCALLS,
> and it will be removed when introducing CONFIG_MGMT_HYPERCALLS on the
> common/domctl.c in the last.
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>

There are RISC-V and PPC functions we could #ifdef out, although they are
only stubs. Given that:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


