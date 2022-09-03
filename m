Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B35F25ABB9F
	for <lists+xen-devel@lfdr.de>; Sat,  3 Sep 2022 02:25:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.398005.638757 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oUGxL-0005bZ-Bq; Sat, 03 Sep 2022 00:24:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 398005.638757; Sat, 03 Sep 2022 00:24:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oUGxL-0005Yw-8d; Sat, 03 Sep 2022 00:24:15 +0000
Received: by outflank-mailman (input) for mailman id 398005;
 Sat, 03 Sep 2022 00:24:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o1Rx=ZG=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oUGxJ-0005Yq-AT
 for xen-devel@lists.xenproject.org; Sat, 03 Sep 2022 00:24:13 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bb1a7e45-2b1e-11ed-82f2-63bd783d45fa;
 Sat, 03 Sep 2022 02:24:11 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1FA0FB82E29;
 Sat,  3 Sep 2022 00:24:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DB65C433C1;
 Sat,  3 Sep 2022 00:24:08 +0000 (UTC)
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
X-Inumbo-ID: bb1a7e45-2b1e-11ed-82f2-63bd783d45fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662164648;
	bh=17z6o1CQ36/VMrWC+vGRVK+1nGFALftB9WB0YaVAIvQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=UTZ3qEJIKVD+2vJ9uNrYN9dAul/E9PymIbODiXbRhCQoPN0VhRe5PkazBXQEGlA2H
	 fRxY0uU+KTcbKkTqfpWtM9tqNgvnAtfkUgnKjUTMty7RD14Y2t/6sEFniIl1eqz4BR
	 K2LEs9jdZk9pxWhFHM5l/Q27OawI2654uqyurZTmVN7R4t/ycEZs4ga6IJeVeBl/Jn
	 Vuvf+P1GslJIYVcx45zS6jIGAUkYJPKyJVNH5s9KX/W9Fu1o3aTdNXWPyxBKYPnITB
	 EfQfYXi/lrOv7wSJT0Qn26KHoi9VgJGX+ZxQG0igMRoXiwx8qCEqkmdXZrpe1zlaSD
	 v2yjCvdEwV49Q==
Date: Fri, 2 Sep 2022 17:24:06 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Rahul Singh <rahul.singh@arm.com>
cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v3 2/2] xen/pci: replace call to is_memory_hole to
 pci_check_bar
In-Reply-To: <e30beac1480f03b51933d8016ad9aed8855ffc18.1662024325.git.rahul.singh@arm.com>
Message-ID: <alpine.DEB.2.22.394.2209021719270.3931@ubuntu-linux-20-04-desktop>
References: <cover.1662024325.git.rahul.singh@arm.com> <e30beac1480f03b51933d8016ad9aed8855ffc18.1662024325.git.rahul.singh@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 1 Sep 2022, Rahul Singh wrote:
> Replace is_memory_hole call to pci_check_bar as function should check
> if device BAR is in defined memory range. Also, add an implementation
> for ARM which is required for PCI passthrough.
> 
> On x86, pci_check_bar will call is_memory_hole which will check if BAR
> is not overlapping with any memory region defined in the memory map.
> 
> On ARM, pci_check_bar will go through the host bridge ranges and check
> if the BAR is in the range of defined ranges.
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> ---
> Changes in v3:
>  - fix minor comments
> ---
>  xen/arch/arm/include/asm/pci.h     |  2 ++
>  xen/arch/arm/pci/pci-host-common.c | 43 ++++++++++++++++++++++++++++++
>  xen/arch/x86/include/asm/pci.h     | 10 +++++++
>  xen/drivers/passthrough/pci.c      |  8 +++---
>  4 files changed, 59 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/pci.h b/xen/arch/arm/include/asm/pci.h
> index 80a2431804..8cb46f6b71 100644
> --- a/xen/arch/arm/include/asm/pci.h
> +++ b/xen/arch/arm/include/asm/pci.h
> @@ -126,6 +126,8 @@ int pci_host_iterate_bridges_and_count(struct domain *d,
>  
>  int pci_host_bridge_mappings(struct domain *d);
>  
> +bool pci_check_bar(const struct pci_dev *pdev, mfn_t start, mfn_t end);
> +
>  #else   /*!CONFIG_HAS_PCI*/
>  
>  struct arch_pci_dev { };
> diff --git a/xen/arch/arm/pci/pci-host-common.c b/xen/arch/arm/pci/pci-host-common.c
> index 89ef30028e..0eb121666d 100644
> --- a/xen/arch/arm/pci/pci-host-common.c
> +++ b/xen/arch/arm/pci/pci-host-common.c
> @@ -24,6 +24,16 @@
>  
>  #include <asm/setup.h>
>  
> +/*
> + * struct to hold pci device bar.
> + */
> +struct pdev_bar
> +{
> +    mfn_t start;
> +    mfn_t end;
> +    bool is_valid;
> +};
> +
>  /*
>   * List for all the pci host bridges.
>   */
> @@ -363,6 +373,39 @@ int __init pci_host_bridge_mappings(struct domain *d)
>      return 0;
>  }
>  
> +static int is_bar_valid(const struct dt_device_node *dev,
> +                        uint64_t addr, uint64_t len, void *data)
> +{
> +    struct pdev_bar *bar_data = data;
> +    unsigned long s = mfn_x(bar_data->start);
> +    unsigned long e = mfn_x(bar_data->end);
> +
> +    if ( (s <= e) && (s >= PFN_DOWN(addr)) && (e <= PFN_UP(addr + len - 1)) )
> +        bar_data->is_valid =  true;


This patch looks good and you addressed all Jan's comment well. Before I
ack it, one question.

I know that you made this change to address Jan's comment but using
PFN_DOWN for the (s >= PFN_DOWN(addr)) check and PFN_UP for the (e <=
PFN_UP(addr + len - 1)) check means that we are relaxing the
requirements, aren't we?

I know that this discussion is a bit pointless because addr and len should
always be page aligned, and if they weren't it would be a mistake. But
assuming that they are not page aligned, wouldn't we want this check to
be a strict as possible?

Wouldn't we want to ensure that the [s,e] range is a strict subset of
[addr,addr+len-1] ? If so we would need to do the following instead:

    if ( (s <= e) && (s >= PFN_UP(addr)) && (e <= PFN_DOWN(addr + len - 1)) )
        bar_data->is_valid =  true;

