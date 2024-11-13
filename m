Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5119C6B80
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2024 10:31:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.835156.1251020 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tB9iR-0000Wa-H8; Wed, 13 Nov 2024 09:31:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 835156.1251020; Wed, 13 Nov 2024 09:31:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tB9iR-0000U9-DS; Wed, 13 Nov 2024 09:31:11 +0000
Received: by outflank-mailman (input) for mailman id 835156;
 Wed, 13 Nov 2024 09:31:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tB9iP-00009N-Nu
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2024 09:31:09 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tB9iP-003Bam-00;
 Wed, 13 Nov 2024 09:31:09 +0000
Received: from [2a02:8012:3a1:0:2c06:4644:c8a3:2b5e]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tB9iO-002qt2-2m;
 Wed, 13 Nov 2024 09:31:08 +0000
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
	bh=mQwr+T2baO7ZV9EdrJzGP44jU2Z1hpyt5kXf8y68Ijc=; b=nIMo6vu7MrpN+AxrEDW68MDXGF
	dfG8eEcPLA0i1lXKbiPGRyIg0bi7BRCJ0DT26YmfwbPuj3BqG/mfPfW6dNlQYJIyddF83HGaD3Wme
	OdU5M7F06sYA//DPlwLE6/1JHN1l+wgTqdWFJDt43acoizR1m5lpBUbgmMEOkNo9q8Fo=;
Message-ID: <4dbf2c4d-f7bd-4032-b52f-29c24e3ec055@xen.org>
Date: Wed, 13 Nov 2024 09:31:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: fusa: Add dom0less domain configuration
 requirements
Content-Language: en-GB
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Michal Orzel <michal.orzel@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Artem Mygaiev <artem_mygaiev@epam.com>,
 Munakata Hisao <hisao.munakata.vt@renesas.com>
References: <20241018155144.3433395-1-ayan.kumar.halder@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20241018155144.3433395-1-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 18/10/2024 16:51, Ayan Kumar Halder wrote:
> From: Michal Orzel <michal.orzel@amd.com>
> 
> Add requirements for dom0less domain creation.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
>   .../arm64/dom0less_domain_config.rst          | 267 ++++++++++++++++++
>   docs/fusa/reqs/market-reqs/reqs.rst           |  15 +
>   docs/fusa/reqs/product-reqs/arm64/reqs.rst    |  20 ++
>   3 files changed, 302 insertions(+)
>   create mode 100644 docs/fusa/reqs/design-reqs/arm64/dom0less_domain_config.rst
> 
> diff --git a/docs/fusa/reqs/design-reqs/arm64/dom0less_domain_config.rst b/docs/fusa/reqs/design-reqs/arm64/dom0less_domain_config.rst
> new file mode 100644
> index 0000000000..17b5f8962c
> --- /dev/null
> +++ b/docs/fusa/reqs/design-reqs/arm64/dom0less_domain_config.rst
> @@ -0,0 +1,267 @@
> +.. SPDX-License-Identifier: CC-BY-4.0
> +
> +Dom0less Domain configuration requirements
> +==========================================
> +
> +The following are the requirements related to dom0less domain configuration for
> +Arm64 domains.
> +
> +Specify Arm64 Linux kernel image
> +----------------------------------
> +
> +`XenSwdgn~arm64_specify_kernel_linux_image~1`
> +
> +Description:
> +Xen shall create a domain with a Arm64 Linux kernel image.

A link to the specification would be useful when you are referring to an 
external format.

> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~static_domains_configuration~1`
> +
> +Specify Arm64 Gzip Linux kernel image
> +---------------------------------------
> +
> +`XenSwdgn~arm64_specify_kernel_gzip_image~1`
> +
> +Description:
> +Xen shall create a domain with a Arm64 Gzip compressed Linux kernel image.
> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~static_domains_configuration~1`
> +
> +Specify kernel with uImage header
> +---------------------------------
> +
> +`XenSwdgn~arm64_specify_kernel_uimage~1`
> +
> +Description:
> +Xen shall create a domain with a kernel containing uImage header.
> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~static_domains_configuration~1`
> +
> +Specify Gzip kernel with uImage header
> +--------------------------------------
> +
> +`XenSwdgn~arm64_specify_gzip_kernel_uimage~1`
> +
> +Description:
> +Xen shall create a domain with a Gzip compressed kernel containing uImage
> +header.
> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~static_domains_configuration~1`
> +
> +Specify passthrough device tree
> +-------------------------------
> +
> +`XenSwdgn~arm64_specify_passthrough_dt~1`
> +
> +Description:
> +Xen shall support direct assignment of devices to a domain.
> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~static_domains_configuration~1`
> +
> +Specify kernel command line arguments
> +-------------------------------------
> +
> +`XenSwdgn~arm64_specify_kernel_cmd_line_args~1`
> +
> +Description:
> +Xen shall pass kernel command line arguments to a domain.
> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~static_domains_configuration~1`
> +
> +Specify initial ramdisk
> +-----------------------
> +
> +`XenSwdgn~arm64_specify_initial_ramdisk~1`
> +
> +Description:
> +Xen shall provide initial ramdisk to a domain.
> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~static_domains_configuration~1`
> +
> +Specify amount of memory
> +------------------------
> +
> +`XenSwdgn~arm64_specify_memory~1`
> +
> +Description:
> +Xen shall create a domain with specified amount of memory.
> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~static_domains_configuration~1`
> +
> +Assign a single vCPU
> +--------------------
> +
> +`XenSwdgn~arm64_assign_single_vcpu~1`
> +
> +Description:
> +Xen shall assign a single vCPU to a domain.

This wording is a bit ambiguous. You don't assign a vCPU to a domain. 
You create a domain with "N vCPUs". It is also not clear why we are 
making the distinction between one and ...

> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~static_domains_configuration~1`
> +
> +Assign multiple vCPUs
> +---------------------
> +
> +`XenSwdgn~arm64_assign_multiple_vcpus~1`
> +
> +Description:
> +Xen shall assign multiple vCPUs to a domain.

... multiple one. From Xen PoV there is no differences.

> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~static_domains_configuration~1`
> +
> +Assign vCPUs from CPU pool
> +--------------------------
> +
> +`XenSwdgn~arm64_assign_vcpus_cpu_pool~1`
> +
> +Description:
> +Xen shall assign vCPUs to a domain from a CPU pool.

Same remark about the wording. You create a domain with N vCPUs and 
*assign* a CPU pool to a domain. You also assign pCPU to a CPU pool.

But I am not sure about if this requirement is actually necessary given ...

> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~static_domains_configuration~1`
> +
> +Specify CPU pool scheduler
> +--------------------------
> +
> +`XenSwdgn~arm64_specify_cpu_pool_scheduler~1`
> +
> +Description:
> +Xen shall assign a CPU pool scheduler to a domain.

... you have th is one.

> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~static_domains_configuration~1`
> +
> +Assign virtual UART
> +-------------------
> +
> +`XenSwdgn~arm64_assign_virtual_uart~1`
> +
> +Description:
> +Xen shall assign a virtual UART to a domain.

Are we talking about the virtual PL011 or the fake emulation of the real 
UART we do?

> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~static_domains_configuration~1`
> +
> +Specify number of SPIs
> +----------------------
> +
> +`XenSwdgn~arm64_specify_num_spis~1`
> +
> +Description:
> +Xen shall allocate a specified number of shared peripheral interrupts for a
> +domain.
> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~static_domains_configuration~1`
> +
> +Specify grant table version for a domain
> +----------------------------------------
> +
> +`XenSwdgn~arm64_specify_grant_table_version~1`
> +
> +Description:
> +Xen shall create a domain with a specified version of grant table structure

Realistically grant table v2 is not supported for Arm and I am not 
convinced it makes any sense for x86 in embedded system. It is mainly 
useful when you have a guest with a large amount of address space (IIRC 
 > 4TB).

> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~static_domains_configuration~1`
> +
> +Specify number of grant table frames for a domain
> +-------------------------------------------------
> +
> +`XenSwdgn~arm64_specify_num_grant_table_frames~1`
> +
> +Description:
> +Xen shall create a domain with a specified number of grant table frames.
> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~static_domains_configuration~1`
> +
> +Specify number of grant maptrack frames for a domain
> +----------------------------------------------------
> +
> +`XenSwdgn~arm64_specify_num_grant_maptrack_frames~1`
> +
> +Description:
> +Xen shall create a domain with a specified number of grant maptrack frames.
> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~static_domains_configuration~1`
> +
> +| [1] https://xenbits.xenproject.org/gitweb/?p=xen.git;a=blob;f=docs/misc/arm/device-tree/booting.txt
> +| [2] https://xenbits.xenproject.org/gitweb/?p=xen.git;a=blob;f=docs/misc/arm/device-tree/cpupools.txt
> diff --git a/docs/fusa/reqs/market-reqs/reqs.rst b/docs/fusa/reqs/market-reqs/reqs.rst
> index f456788d96..ca020f9a33 100644
> --- a/docs/fusa/reqs/market-reqs/reqs.rst
> +++ b/docs/fusa/reqs/market-reqs/reqs.rst
> @@ -47,3 +47,18 @@ Comments:
>   
>   Needs:
>    - XenProd
> +
> +Static VM definition
> +--------------------
> +
> +`XenMkt~static_vm_definition~1`
> +
> +Description:
> +Xen shall support specifying resources for a domain.

Compare to the other requirements, this is quite a vague. Should we list 
the resources?

> +
> +Rationale:
> +
> +Comments:
> +
> +Needs:
> + - XenProd
> \ No newline at end of file
> diff --git a/docs/fusa/reqs/product-reqs/arm64/reqs.rst b/docs/fusa/reqs/product-reqs/arm64/reqs.rst
> index db91c47a02..0453dbb862 100644
> --- a/docs/fusa/reqs/product-reqs/arm64/reqs.rst
> +++ b/docs/fusa/reqs/product-reqs/arm64/reqs.rst
> @@ -40,3 +40,23 @@ Covers:
>   
>   Needs:
>    - XenSwdgn
> +
> +Configure static domains
> +------------------------
> +
> +`XenProd~static_domains_configuration~1`
> +
> +Description:
> +Xen shall support specifying the resources required for a domain.
> +
> +Rationale:
> +
> +Comments:
> +
> +Rationale:
> +
> +Covers:
> + - `XenMkt~static_vm_definition~1`
> +
> +Needs:
> + - XenSwdgn
> \ No newline at end of file

Missing a newline.

-- 
Julien Grall


