Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E08B14042B0
	for <lists+xen-devel@lfdr.de>; Thu,  9 Sep 2021 03:16:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.182545.330152 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mO8fq-0004BV-2G; Thu, 09 Sep 2021 01:16:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 182545.330152; Thu, 09 Sep 2021 01:16:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mO8fp-00049R-VC; Thu, 09 Sep 2021 01:16:17 +0000
Received: by outflank-mailman (input) for mailman id 182545;
 Thu, 09 Sep 2021 01:16:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ArGz=N7=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mO8fo-00049L-Ez
 for xen-devel@lists.xenproject.org; Thu, 09 Sep 2021 01:16:16 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 87243880-110b-11ec-b192-12813bfff9fa;
 Thu, 09 Sep 2021 01:16:15 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9FB9C61041;
 Thu,  9 Sep 2021 01:16:14 +0000 (UTC)
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
X-Inumbo-ID: 87243880-110b-11ec-b192-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1631150174;
	bh=5hoIVC8+6r3rj3BgWbn+kgdUpMZoWk4zh27+6RX9yrk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=fmwEPgFzw+ajEBOXu/nlBmQvzwv+6cLJGjGT85w34gBxXGeR2VOenNx+IE2psodFL
	 LVBB1wuDXgHC2CYgxDcN5WrNUO/K28ZJZiJtDBV8ZVqA2/Ngg7SFDZorK0GPLad0Nm
	 sbhZrY1FH8fDZdxrbG5Xk2l6uRlikBuD8Ii8IDmOfXsT/TR1tYtHgyTpH/EysaClZ1
	 MZmUBY1xdFO97kg4NtkVkOjrtR1nH4mplgpyk+JMKp2Krd4hw8J+yfq3Z3mNEUSMze
	 KWjulgKM14TfTXgQCC4EOlBObbW1tvFTlBRE+rtrQaOiJ0b1x/vuDzxYHja/bcoQj9
	 d8bwGG6xleisg==
Date: Wed, 8 Sep 2021 18:16:13 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Rahul Singh <rahul.singh@arm.com>
cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v1 04/14] xen/arm: Add support for PCI init to initialize
 the PCI driver.
In-Reply-To: <999887f9b4b2ea06ae99e1e003f9e43aa272a19c.1629366665.git.rahul.singh@arm.com>
Message-ID: <alpine.DEB.2.21.2109081814120.10523@sstabellini-ThinkPad-T480s>
References: <cover.1629366665.git.rahul.singh@arm.com> <999887f9b4b2ea06ae99e1e003f9e43aa272a19c.1629366665.git.rahul.singh@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 19 Aug 2021, Rahul Singh wrote:
> pci_init(..) will be called during xen startup to initialize and probe
> the PCI host-bridge driver.
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> ---
>  xen/arch/arm/pci/pci.c       | 54 ++++++++++++++++++++++++++++++++++++
>  xen/include/asm-arm/device.h |  1 +
>  2 files changed, 55 insertions(+)
> 
> diff --git a/xen/arch/arm/pci/pci.c b/xen/arch/arm/pci/pci.c
> index dc55d23778..d1c9cf997d 100644
> --- a/xen/arch/arm/pci/pci.c
> +++ b/xen/arch/arm/pci/pci.c
> @@ -14,13 +14,67 @@
>   * along with this program.  If not, see <http://www.gnu.org/licenses/>.
>   */
>  
> +#include <xen/acpi.h>
> +#include <xen/device_tree.h>
> +#include <xen/errno.h>
> +#include <xen/init.h>
>  #include <xen/pci.h>
> +#include <xen/param.h>
>  
>  int arch_pci_clean_pirqs(struct domain *d)
>  {
>      return 0;
>  }
>  
> +static int __init dt_pci_init(void)
> +{
> +    struct dt_device_node *np;
> +    int rc;
> +
> +    dt_for_each_device_node(dt_host, np)
> +    {
> +        rc = device_init(np, DEVICE_PCI, NULL);
> +        if( !rc )
> +            continue;
> +        /*
> +         * Ignore the following error codes:
> +         *   - EBADF: Indicate the current is not an pci
                                                     ^ a

> +         *   - ENODEV: The pci device is not present or cannot be used by
> +         *     Xen.
> +         */
> +        else if ( rc != -EBADF && rc != -ENODEV )
> +        {
> +            printk(XENLOG_ERR "No driver found in XEN or driver init error.\n");
> +            return rc;
> +        }
> +    }
> +
> +    return 0;
> +}
> +
> +#ifdef CONFIG_ACPI
> +static void __init acpi_pci_init(void)

If the DT init function returns int, then it would make sense for the
ACPI init function to return int as well?


> +{
> +    printk(XENLOG_ERR "ACPI pci init not supported \n");
> +    return;
> +}
> +#else
> +static inline void __init acpi_pci_init(void) { }
> +#endif
> +
> +static int __init pci_init(void)
> +{
> +    if ( acpi_disabled )
> +        dt_pci_init();
> +    else
> +        acpi_pci_init();
> +
> +    pci_segments_init();
> +
> +    return 0;
> +}
> +__initcall(pci_init);
> +
>  /*
>   * Local variables:
>   * mode: C
> diff --git a/xen/include/asm-arm/device.h b/xen/include/asm-arm/device.h
> index ee7cff2d44..5ecd5e7bd1 100644
> --- a/xen/include/asm-arm/device.h
> +++ b/xen/include/asm-arm/device.h
> @@ -34,6 +34,7 @@ enum device_class
>      DEVICE_SERIAL,
>      DEVICE_IOMMU,
>      DEVICE_GIC,
> +    DEVICE_PCI,
>      /* Use for error */
>      DEVICE_UNKNOWN,
>  };
> -- 
> 2.17.1
> 

