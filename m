Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54FE7B526EA
	for <lists+xen-devel@lfdr.de>; Thu, 11 Sep 2025 05:12:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1119209.1464706 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwXja-0005Ml-Mm; Thu, 11 Sep 2025 03:12:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1119209.1464706; Thu, 11 Sep 2025 03:12:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwXja-0005Jv-Jr; Thu, 11 Sep 2025 03:12:30 +0000
Received: by outflank-mailman (input) for mailman id 1119209;
 Thu, 11 Sep 2025 03:12:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5SW2=3W=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uwXjZ-0005Jp-NE
 for xen-devel@lists.xenproject.org; Thu, 11 Sep 2025 03:12:29 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 21feb5d7-8ebd-11f0-9809-7dc792cee155;
 Thu, 11 Sep 2025 05:12:23 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 23BB2442B7;
 Thu, 11 Sep 2025 03:12:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C66CC4CEEB;
 Thu, 11 Sep 2025 03:12:19 +0000 (UTC)
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
X-Inumbo-ID: 21feb5d7-8ebd-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757560341;
	bh=G4n2aqrx8Vhln81QzvIPRQ5ETDRj1hAQAVSyMqRNW1c=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=rvGNSELuYmxGOxMekZACfk9RT50OCAFLn/41bQTGy+IcNloHgwE18W74+3h8cLHws
	 exCrLi4Ovf7mrRjXOzriRO4WE5MAU6FbOc+r+SB2UeaYiYnxGml7/8nSrDg8D0yLP+
	 MdIH8zeYaxTj0y6Am7brQhJrBe5abJURVSpyA7kMLfLhNIB3UCCmA0QjCEQoJRz0z4
	 /FjzDKDA/PArhyHv0YzL+o87nRoFe1WJP3qwBh+/C9QibVjm4zTYuA8ECD5nfKVW+J
	 WWXEk3/ZtngvOtYfhPRSpagfl5DkDm8RDMk9WniwV2O8OvajLd0DzNonE/4mpAZhKy
	 AMDojZNdnTJjw==
Date: Wed, 10 Sep 2025 20:12:17 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Penny Zheng <Penny.Zheng@amd.com>
cc: xen-devel@lists.xenproject.org, ray.huang@amd.com, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Jan Beulich <jbeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Rahul Singh <rahul.singh@arm.com>
Subject: Re: [PATCH v2 20/26] xen/domctl: wrap iommu-related domctl op with
 CONFIG_MGMT_HYPERCALLS
In-Reply-To: <20250910073827.3622177-21-Penny.Zheng@amd.com>
Message-ID: <alpine.DEB.2.22.394.2509102012110.52703@ubuntu-linux-20-04-desktop>
References: <20250910073827.3622177-1-Penny.Zheng@amd.com> <20250910073827.3622177-21-Penny.Zheng@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1924521499-1757560340=:52703"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1924521499-1757560340=:52703
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 10 Sep 2025, Penny Zheng wrote:
> Function iommu_do_domctl() is the main entry for all iommu-related domctl-op,
> and shall be wrapped with CONFIG_MGMT_HYPERCALLS.
> Tracking its calling chain, the following functions shall all be wrapped
> with CONFIG_MGMT_HYPERCALLS:
> - iommu_do_pci_domctl
>   - iommu_get_device_group
>     - amd_iommu_group_id/intel_iommu_group_id
>   - device_assigned
>   - assign_device
>     - intel_iommu_assign_device/amd_iommu_assign_device
>   - deassign_device
>     - reassign_device_ownership/reassign_device
> - iommu_do_dt_domctl
>   - iommu_deassign_dt_device
>     - arm_smmu_reassign_dev/arm_smmu_reassign_dev
>     - ipmmu_reassign_dev
>       - ipmmu_deassign_dev
>         - ipmmu_detach_dev
>   - dt_find_node_by_gpath
> Wrap XEN_DOMCTL_assign_device{test_assign_device,deassign_device,
> get_device_group}-case transiently with CONFIG_MGMT_HYPERCALLS,
> and it will be removed when introducing CONFIG_MGMT_HYPERCALLS on the whole
> domctl.c in the last.
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>

drivers/passthrough/arm/smmu.c:2852:12: error: ‘arm_smmu_deassign_dev’ defined but not used [-Werror=unused-function]
 2852 | static int arm_smmu_deassign_dev(struct domain *d, uint8_t devfn,
      |            ^~~~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors

--8323329-1924521499-1757560340=:52703--

