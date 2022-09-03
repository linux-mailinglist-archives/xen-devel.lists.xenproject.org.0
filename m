Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8205ABDA4
	for <lists+xen-devel@lfdr.de>; Sat,  3 Sep 2022 09:20:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.398062.638825 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oUNQk-0003Pd-3i; Sat, 03 Sep 2022 07:19:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 398062.638825; Sat, 03 Sep 2022 07:19:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oUNQk-0003Nc-0b; Sat, 03 Sep 2022 07:19:02 +0000
Received: by outflank-mailman (input) for mailman id 398062;
 Sat, 03 Sep 2022 07:19:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oUNQi-0003ND-Et
 for xen-devel@lists.xenproject.org; Sat, 03 Sep 2022 07:19:00 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oUNQh-00008J-MY; Sat, 03 Sep 2022 07:18:59 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oUNQh-0003x4-Ep; Sat, 03 Sep 2022 07:18:59 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=C8J9W6O0KlfOfOALc3DIYjJw189AZ5F+T/9iAqEN80E=; b=3oyZyt3XRQx4AQHhhFNvC7QTvi
	rMWGLWAplCUVYaoYvLGx4CYGjt665rK86YmSpzgvgRDn9iXXZ0oeQ//y3Yv5DJOYzJlL+821Fr08A
	dRozJ7Fdqlw5bp0ckhMZzLeyeqBVbkkoHFc7xN6ImkT1FuM8vbvyqXo3Yp/4VgKyozOw=;
Message-ID: <be43a751-2ceb-df74-7525-b84505d341b8@xen.org>
Date: Sat, 3 Sep 2022 08:18:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
To: Rahul Singh <rahul.singh@arm.com>, xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Paul Durrant <paul@xen.org>
References: <cover.1662024325.git.rahul.singh@arm.com>
 <e30beac1480f03b51933d8016ad9aed8855ffc18.1662024325.git.rahul.singh@arm.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH v3 2/2] xen/pci: replace call to is_memory_hole to
 pci_check_bar
In-Reply-To: <e30beac1480f03b51933d8016ad9aed8855ffc18.1662024325.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Rahul,

On 01/09/2022 10:29, Rahul Singh wrote:
> is_memory_hole was implemented for x86 and not for ARM when introduced.
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
>   - fix minor comments
> ---
>   xen/arch/arm/include/asm/pci.h     |  2 ++
>   xen/arch/arm/pci/pci-host-common.c | 43 ++++++++++++++++++++++++++++++
>   xen/arch/x86/include/asm/pci.h     | 10 +++++++
>   xen/drivers/passthrough/pci.c      |  8 +++---
>   4 files changed, 59 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/pci.h b/xen/arch/arm/include/asm/pci.h
> index 80a2431804..8cb46f6b71 100644
> --- a/xen/arch/arm/include/asm/pci.h
> +++ b/xen/arch/arm/include/asm/pci.h
> @@ -126,6 +126,8 @@ int pci_host_iterate_bridges_and_count(struct domain *d,
>   
>   int pci_host_bridge_mappings(struct domain *d);
>   
> +bool pci_check_bar(const struct pci_dev *pdev, mfn_t start, mfn_t end);
> +
>   #else   /*!CONFIG_HAS_PCI*/
>   
>   struct arch_pci_dev { };
> diff --git a/xen/arch/arm/pci/pci-host-common.c b/xen/arch/arm/pci/pci-host-common.c
> index 89ef30028e..0eb121666d 100644
> --- a/xen/arch/arm/pci/pci-host-common.c
> +++ b/xen/arch/arm/pci/pci-host-common.c
> @@ -24,6 +24,16 @@
>   
>   #include <asm/setup.h>
>   
> +/*
> + * struct to hold pci device bar.
> + */

I find this comment a bit misleading. What you are storing is a
candidate region. IOW, this may or may not be a PCI device bar.

Given the current use below, I would rename the structure to something 
more specific like: pdev_bar_check.

> +struct pdev_bar
> +{
> +    mfn_t start;
> +    mfn_t end;
> +    bool is_valid;
> +};
> +
>   /*
>    * List for all the pci host bridges.
>    */
> @@ -363,6 +373,39 @@ int __init pci_host_bridge_mappings(struct domain *d)
>       return 0;
>   }
>   
> +static int is_bar_valid(const struct dt_device_node *dev,
> +                        uint64_t addr, uint64_t len, void *data)
> +{
> +    struct pdev_bar *bar_data = data;
> +    unsigned long s = mfn_x(bar_data->start);
> +    unsigned long e = mfn_x(bar_data->end);
> +
> +    if ( (s <= e) && (s >= PFN_DOWN(addr)) && (e <= PFN_UP(addr + len - 1)) )

AFAICT 's'  and 'e' are provided by pci_check_bar() and will never 
change. So can we move the check 's <= e' outside of the callback?

> +        bar_data->is_valid =  true;
> +
> +    return 0;
> +}
> +
> +bool pci_check_bar(const struct pci_dev *pdev, mfn_t start, mfn_t end)
> +{

Other than the current calls in check_pdev(), do you have plan to use it 
in more places? The reason I am asking it is this function is 
non-trivial on Arm (dt_for_each_range() is quite complex).

Cheers,

-- 
Julien Grall

