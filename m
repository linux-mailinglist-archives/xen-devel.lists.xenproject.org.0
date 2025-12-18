Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE2ECC9DC2
	for <lists+xen-devel@lfdr.de>; Thu, 18 Dec 2025 01:07:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1189172.1510066 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vW1X2-0000Sx-Uu; Thu, 18 Dec 2025 00:06:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1189172.1510066; Thu, 18 Dec 2025 00:06:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vW1X2-0000Pt-OF; Thu, 18 Dec 2025 00:06:12 +0000
Received: by outflank-mailman (input) for mailman id 1189172;
 Thu, 18 Dec 2025 00:06:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=awYi=6Y=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1vW1X1-0000Pn-Ab
 for xen-devel@lists.xenproject.org; Thu, 18 Dec 2025 00:06:11 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 52fa295f-dba5-11f0-9cce-f158ae23cfc8;
 Thu, 18 Dec 2025 01:05:56 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 0683F434ED;
 Thu, 18 Dec 2025 00:05:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2DABC4CEF5;
 Thu, 18 Dec 2025 00:05:53 +0000 (UTC)
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
X-Inumbo-ID: 52fa295f-dba5-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766016354;
	bh=9B5Vw0UI5tTVOVwyVumPQ9v2VLtNnkTCPoQEfIIQGUE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Nz38DxwPDZUux4xKLujRoATvRvi8zfejFtHVRGTt7RxJxy3+yj8kSKKkZ4oF4AY9t
	 Gv1EWo3zb7/aKw57DWDsyZr+Mx9MBRZGUO9KryW2wf3HcYsg7uiTMJYIxN6ixspcUV
	 XmD3+COcXsf5XFfr1XuHyzSNStrD+b0FOhEjUNXsF6eF+3VwcgkBzkMDEhDfOcUAgY
	 KYh3hSjShDqdH8BVEmM5sOe67y/gwo6A13S4U1SgLwVXBjSNIaljvSqoXs43CouvO+
	 +n56nObkWyhAgvLcTW79SEk7e0HySevUYhL3Eu9oVS+Rw7b3OGeQTXOfUDv1NPVyLT
	 2TJtQkjO0O9pw==
Date: Wed, 17 Dec 2025 16:05:46 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Grygorii Strashko <grygorii_strashko@epam.com>, 
    Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
    Harry Ramsey <harry.ramsey@arm.com>
Subject: Re: [PATCH V3] xen/dom0less: Calculate guest DTB size based on
 MAX_VIRT_CPUS
In-Reply-To: <20251217081248.2807849-1-oleksandr_tyshchenko@epam.com>
Message-ID: <alpine.DEB.2.22.394.2512171605420.21522@ubuntu-linux-20-04-desktop>
References: <20251217081248.2807849-1-oleksandr_tyshchenko@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 17 Dec 2025, Oleksandr Tyshchenko wrote:
> Creating a dom0less guest with a high vCPU count (e.g., >32) fails
> because the fixed 4KiB device tree buffer (DOMU_DTB_SIZE) overflows
> during creation.
> 
> The FDT nodes for each vCPU are the primary consumer of space,
> and the previous fixed-size buffer was insufficient.
> 
> This patch replaces the fixed size with a formula that calculates
> the required buffer size based on a fixed baseline plus a scalable
> portion for each potential vCPU up to the MAX_VIRT_CPUS limit.
> 
> Please note, the change to DOMU_DTB_SIZE formula would result in
> a smaller buffer size of 3072 bytes compared to the original 4096 bytes
> on Arm32 platforms where MAX_VIRT_CPUS is 8.

I am OK with this patch I would only ask to retain the minimum size of
4KB due to the possible presence of passthrough device nodes.


> ***
> 
> The following tests were done to confirm that the proposed formula
> fits:
> 
> 1. Arm64 testing with varying vCPU counts (MAX_VIRT_CPUS=128),
>    final compacted FDT size:
> 
>    - 1 vCPU: 1586 bytes (with 18432 byte buffer)
>    - 2 vCPUs: 1698 bytes
>    - 32 vCPUs: 5058 bytes
>    - 128 vCPUs: 15810 bytes
> 
> 2. Arm64 testing with simulated Arm32 conditions (MAX_VIRT_CPUS=8),
>    final compacted FDT size:
> 
>    - 1 vCPU: 1586 bytes (with 3072 byte buffer)
>    - 8 vCPUs: 2370 bytes
> 
> 3. Arm32 testing (MAX_VIRT_CPUS=8),
>    final compacted FDT size:
> 
>    - 8 vCPUs: 1127 bytes (with 3072 byte buffer)
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Reviewed-by: Grygorii Strashko <grygorii_strashko@epam.com>
> Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Tested-by: Harry Ramsey <harry.ramsey@arm.com>
>
> ---
> V1: https://patchew.org/Xen/20251202193246.3357821-1-oleksandr._5Ftyshchenko@epam.com/
> V2: https://patchew.org/Xen/20251203185817.3722903-1-oleksandr._5Ftyshchenko@epam.com/
> 
>   V2:
>    - update commit subj/desc
>    - use a formula that accounts MAX_VIRT_CPUS
>    - add BUILD_BUG_ON
> 
>   V3:
>    - add R-b and T-b
>    - add more info to commmit desc
> ---
> ---
>  xen/common/device-tree/dom0less-build.c | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
> index 2600350a3c..0c271d4ca3 100644
> --- a/xen/common/device-tree/dom0less-build.c
> +++ b/xen/common/device-tree/dom0less-build.c
> @@ -439,15 +439,25 @@ static int __init domain_handle_dtb_boot_module(struct domain *d,
>  
>  /*
>   * The max size for DT is 2MB. However, the generated DT is small (not including
> - * domU passthrough DT nodes whose size we account separately), 4KB are enough
> - * for now, but we might have to increase it in the future.
> + * domU passthrough DT nodes whose size we account separately). The size is
> + * calculated from a fixed baseline plus a scalable portion for each potential
> + * vCPU node up to the system limit (MAX_VIRT_CPUS), as the vCPU nodes are
> + * the primary consumer of space.
> + *
> + * The baseline of 2KiB is a safe buffer for all non-vCPU FDT content.
> + * Empirical testing with the maximum number of other device tree nodes shows
> + * a final compacted base size of ~1.5KiB. The 128 bytes per vCPU is derived
> + * from a worst-case analysis of the FDT construction-time size for a single
> + * vCPU node.
>   */
> -#define DOMU_DTB_SIZE 4096
> +#define DOMU_DTB_SIZE (2048 + (MAX_VIRT_CPUS * 128))

Something along the lines of:

#define DOMU_DTB_SIZE MIN(4096, (2048 + (MAX_VIRT_CPUS * 128)))


>  static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
>  {
>      int addrcells, sizecells;
>      int ret, fdt_size = DOMU_DTB_SIZE;
>  
> +    BUILD_BUG_ON(DOMU_DTB_SIZE > SZ_2M);
> +
>      kinfo->phandle_intc = GUEST_PHANDLE_GIC;
>  
>  #ifdef CONFIG_GRANT_TABLE
> -- 
> 2.34.1
> 

