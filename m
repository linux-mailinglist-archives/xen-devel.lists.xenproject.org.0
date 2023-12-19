Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFEDF8190F0
	for <lists+xen-devel@lfdr.de>; Tue, 19 Dec 2023 20:36:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657133.1025864 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFftG-0005Zq-Tz; Tue, 19 Dec 2023 19:36:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657133.1025864; Tue, 19 Dec 2023 19:36:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFftG-0005YB-RF; Tue, 19 Dec 2023 19:36:30 +0000
Received: by outflank-mailman (input) for mailman id 657133;
 Tue, 19 Dec 2023 19:36:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rFftF-0005Y5-Ad
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2023 19:36:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rFftE-0001Bn-Qz; Tue, 19 Dec 2023 19:36:28 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=[192.168.3.234]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rFftE-0004o5-Hw; Tue, 19 Dec 2023 19:36:28 +0000
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
	bh=QtdIDwp3mCiyvhKBetvG6anKSmXwoSMdZPJ9RleON/8=; b=tKpa1ttUVnLLpE9nNfDeys3WE6
	JiImrHH02oXWr496vuf3csCHQiBHlAOttFnmwEA598H6pgKx1hBGF6W0m58s/fGWxN/9C6fmLHad8
	wHuRw07+S8k4C3Y6mnc6O0F7Fj9rATZ541IO3kPgSwIG/DElkUwFC0cSVfaJHNUv0PvI=;
Message-ID: <915a8f2c-9e6e-435a-89fe-5966edea88a3@xen.org>
Date: Tue, 19 Dec 2023 19:36:26 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 8/9] xen/arm: enable dom0 to use PCI devices with
 pci-passthrough=no
Content-Language: en-GB
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>
References: <20231109182716.367119-1-stewart.hildebrand@amd.com>
 <20231109182716.367119-9-stewart.hildebrand@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20231109182716.367119-9-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stewart,

On 09/11/2023 18:27, Stewart Hildebrand wrote:
> Enable the use of IOMMU + PCI in dom0 without having to specify
> "pci-passthrough=yes". We rely on dom0 to initialize the PCI controller
> and perform a PHYSDEVOP_pci_device_add call to add each device to SMMU.
> 
> Enable pci_init() for initializing Xen's internal PCI subsystem, and
> allow PHYSDEVOP_pci_device_add when pci-passthrough is disabled.
> 
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> ---
> v5->v6:
> * new patch - this effectively replaces
>    ("Revert "xen/arm: Add cmdline boot option "pci-passthrough = <boolean>""")
> ---
>   xen/arch/arm/pci/pci.c    | 3 ++-
>   xen/drivers/pci/physdev.c | 6 ------
>   2 files changed, 2 insertions(+), 7 deletions(-)
> 
> diff --git a/xen/arch/arm/pci/pci.c b/xen/arch/arm/pci/pci.c
> index 78b97beaef12..ba72fbaf1dfc 100644
> --- a/xen/arch/arm/pci/pci.c
> +++ b/xen/arch/arm/pci/pci.c
> @@ -16,6 +16,7 @@
>   #include <xen/device_tree.h>
>   #include <xen/errno.h>
>   #include <xen/init.h>
> +#include <xen/iommu.h>
>   #include <xen/param.h>
>   #include <xen/pci.h>
>   
> @@ -85,7 +86,7 @@ static int __init pci_init(void)
>        * Enable PCI passthrough when has been enabled explicitly
>        * (pci-passthrough=on).
>        */

The comment needs to be updated after ...
> -    if ( !pci_passthrough_enabled )
> +    if ( !is_pci_passthrough_enabled() && !iommu_enabled )

... this change.

>           return 0;
>   
>       pci_segments_init();
> diff --git a/xen/drivers/pci/physdev.c b/xen/drivers/pci/physdev.c
> index 42db3e6d133c..4f3e1a96c0fd 100644
> --- a/xen/drivers/pci/physdev.c
> +++ b/xen/drivers/pci/physdev.c
> @@ -18,9 +18,6 @@ ret_t pci_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>           struct pci_dev_info pdev_info;
>           nodeid_t node = NUMA_NO_NODE;
>   
> -        if ( !is_pci_passthrough_enabled() )
> -            return -EOPNOTSUPP;
> -

AFAIU, this means that pci_add_device() can now be reached even if 
pci_segments_init() is not called (this can happen when iommu=false). 
What error will now be returned and how dom0 will behave?

Cheers,

-- 
Julien Grall

