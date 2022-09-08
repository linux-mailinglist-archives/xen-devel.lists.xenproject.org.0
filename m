Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9FA35B280D
	for <lists+xen-devel@lfdr.de>; Thu,  8 Sep 2022 23:00:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.403613.645765 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWOcu-0007U6-Lx; Thu, 08 Sep 2022 20:59:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 403613.645765; Thu, 08 Sep 2022 20:59:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWOcu-0007SI-IK; Thu, 08 Sep 2022 20:59:56 +0000
Received: by outflank-mailman (input) for mailman id 403613;
 Thu, 08 Sep 2022 20:59:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5KOk=ZL=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oWOct-0007SC-8i
 for xen-devel@lists.xenproject.org; Thu, 08 Sep 2022 20:59:55 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2f3f94e4-2fb9-11ed-a31c-8f8a9ae3403f;
 Thu, 08 Sep 2022 22:59:53 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 93475CE20ED;
 Thu,  8 Sep 2022 20:59:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28140C433C1;
 Thu,  8 Sep 2022 20:59:48 +0000 (UTC)
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
X-Inumbo-ID: 2f3f94e4-2fb9-11ed-a31c-8f8a9ae3403f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662670789;
	bh=8T1i6CCzLZ9hUYkUdbtg+UbOOOEJxHWjzRDsHjyf2mA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=oK9Zd1FjG5S65yNpFBfc47cDrJ8t6EZw+HdQPkBHniC/RuIkMikESG9GJpebOdPLC
	 grrJ4VO49ugJs3K2669uK4aHuwYcs30ZYYfhKp69X6t39/gobinTBl/dMAjxChvn8P
	 Aqsh7EoiwwIzFxYN7MKlBW8bA/GY+lnbiMJR59Jfj7I/y0KGacsXhntWcNNQmLV1hR
	 0mDBMp8Lf+y74F+raoknnoa4mDbmu6+sfWTJ7tZOnMDz+GVeCNEQTtDaAkCz+6lwt3
	 N97eQgHyy42AbovMDYUPYOo5tekwHE/Fbims6A01C4kvIqzqMINJSTDX5LeADv/wVJ
	 0HEZB3c2lfekw==
Date: Thu, 8 Sep 2022 13:59:47 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Rahul Singh <rahul.singh@arm.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v5 2/2] xen/pci: replace call to is_memory_hole to
 pci_check_bar
In-Reply-To: <63a0010c1e0f6ffb86fce35e188d66bf4c0d57e7.1662637415.git.rahul.singh@arm.com>
Message-ID: <alpine.DEB.2.22.394.2209081350530.157835@ubuntu-linux-20-04-desktop>
References: <cover.1662637415.git.rahul.singh@arm.com> <63a0010c1e0f6ffb86fce35e188d66bf4c0d57e7.1662637415.git.rahul.singh@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 8 Sep 2022, Rahul Singh wrote:
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
> Acked-by: Jan Beulich <jbeulich@suse.com> # x86, common
> ---
> Changes in v5:
>  - drop use of PFN_UP and PF_DOWN in case addresses are not aligned.
>  - As we drop the PFN_UP and PFN_DOWN we need to use the mfn_to_maddr()
>    to get the BAR address without page shift.
>  - Add TODO comment for address alignment check for ranges.
>  - Added Jan Acked-by for x86 and common code.
> Changes in v4:
>  - check "s <= e" before callback
>  - Add TODO comment for revisiting the function pci_check_bar() when
>    ACPI PCI passthrough support is added.
>  - Not Added the Jan Acked-by as patch is modified.
> Changes in v3:
>  - fix minor comments
> ---
>  xen/arch/arm/include/asm/pci.h     |  2 ++
>  xen/arch/arm/pci/pci-host-common.c | 54 ++++++++++++++++++++++++++++++
>  xen/arch/x86/include/asm/pci.h     | 10 ++++++
>  xen/drivers/passthrough/pci.c      |  8 ++---
>  4 files changed, 70 insertions(+), 4 deletions(-)
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
> index 89ef30028e..d51cfdf352 100644
> --- a/xen/arch/arm/pci/pci-host-common.c
> +++ b/xen/arch/arm/pci/pci-host-common.c
> @@ -24,6 +24,16 @@
>  
>  #include <asm/setup.h>
>  
> +/*
> + * struct to hold pci device bar.
> + */
> +struct pdev_bar_check
> +{
> +    unsigned long start;
> +    unsigned long end;
> +    bool is_valid;
> +};
> +
>  /*
>   * List for all the pci host bridges.
>   */
> @@ -363,6 +373,50 @@ int __init pci_host_bridge_mappings(struct domain *d)
>      return 0;
>  }
>  
> +/*
> + * TODO: BAR addresses and Root Complex window addresses are not guaranteed
> + * to be page aligned. We should check for alignment but this is not the
> + * right place for alignment check.
> + */
> +static int is_bar_valid(const struct dt_device_node *dev,
> +                        uint64_t addr, uint64_t len, void *data)
> +{
> +    struct pdev_bar_check *bar_data = data;
> +    unsigned long s = bar_data->start;
> +    unsigned long e = bar_data->end;
> +
> +    if ( (s >= addr) && (e <= (addr + len - 1)) )
> +        bar_data->is_valid =  true;

"s" and "e" are "unsigned long" while "addr" and "len" are uint64_t. Is
that OK?

Specifically, considering a potential arm32 case, shouldn't "s" and "e"
be uint64_t as well? Which means pdev_bar_check.start and end should be
uint64_t?


> +    return 0;
> +}
> +
> +/* TODO: Revisit this function when ACPI PCI passthrough support is added. */
> +bool pci_check_bar(const struct pci_dev *pdev, mfn_t start, mfn_t end)
> +{
> +    int ret;
> +    const struct dt_device_node *dt_node;
> +    unsigned long s = mfn_to_maddr(start);
> +    unsigned long e = mfn_to_maddr(end);
> +    struct pdev_bar_check bar_data =  {
> +        .start = s,
> +        .end = e,
> +        .is_valid = false
> +    };
> +
> +    if ( s >= e )
> +        return false;
> +
> +    dt_node = pci_find_host_bridge_node(pdev);
> +    if ( !dt_node )
> +        return false;
> +
> +    ret = dt_for_each_range(dt_node, &is_bar_valid, &bar_data);
> +    if ( ret < 0 )
> +        return false;
> +
> +    return bar_data.is_valid;
> +}
>  /*
>   * Local variables:
>   * mode: C
> diff --git a/xen/arch/x86/include/asm/pci.h b/xen/arch/x86/include/asm/pci.h
> index c8e1a9ecdb..f4a58c8acf 100644
> --- a/xen/arch/x86/include/asm/pci.h
> +++ b/xen/arch/x86/include/asm/pci.h
> @@ -57,4 +57,14 @@ static always_inline bool is_pci_passthrough_enabled(void)
>  
>  void arch_pci_init_pdev(struct pci_dev *pdev);
>  
> +static inline bool pci_check_bar(const struct pci_dev *pdev,
> +                                 mfn_t start, mfn_t end)
> +{
> +    /*
> +     * Check if BAR is not overlapping with any memory region defined
> +     * in the memory map.
> +     */
> +    return is_memory_hole(start, end);
> +}
> +
>  #endif /* __X86_PCI_H__ */
> diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
> index cdaf5c247f..149f68bb6e 100644
> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -304,8 +304,8 @@ static void check_pdev(const struct pci_dev *pdev)
>          if ( rc < 0 )
>              /* Unable to size, better leave memory decoding disabled. */
>              return;
> -        if ( size && !is_memory_hole(maddr_to_mfn(addr),
> -                                     maddr_to_mfn(addr + size - 1)) )
> +        if ( size && !pci_check_bar(pdev, maddr_to_mfn(addr),
> +                                    maddr_to_mfn(addr + size - 1)) )
>          {
>              /*
>               * Return without enabling memory decoding if BAR position is not
> @@ -331,8 +331,8 @@ static void check_pdev(const struct pci_dev *pdev)
>  
>          if ( rc < 0 )
>              return;
> -        if ( size && !is_memory_hole(maddr_to_mfn(addr),
> -                                     maddr_to_mfn(addr + size - 1)) )
> +        if ( size && !pci_check_bar(pdev, maddr_to_mfn(addr),
> +                                    maddr_to_mfn(addr + size - 1)) )
>          {
>              printk(warn, &pdev->sbdf, "ROM ", PFN_DOWN(addr),
>                     PFN_DOWN(addr + size - 1));
> -- 
> 2.25.1
> 

