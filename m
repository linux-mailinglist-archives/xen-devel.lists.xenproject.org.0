Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ECA741BEF9
	for <lists+xen-devel@lfdr.de>; Wed, 29 Sep 2021 08:11:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.198633.352218 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVSnq-0004Zg-8f; Wed, 29 Sep 2021 06:10:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 198633.352218; Wed, 29 Sep 2021 06:10:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVSnq-0004WD-4F; Wed, 29 Sep 2021 06:10:50 +0000
Received: by outflank-mailman (input) for mailman id 198633;
 Wed, 29 Sep 2021 06:10:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=arYX=OT=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mVSno-0004W2-C9
 for xen-devel@lists.xenproject.org; Wed, 29 Sep 2021 06:10:48 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fcbb5b4c-20eb-11ec-bcde-12813bfff9fa;
 Wed, 29 Sep 2021 06:10:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B7D506124B;
 Wed, 29 Sep 2021 06:10:46 +0000 (UTC)
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
X-Inumbo-ID: fcbb5b4c-20eb-11ec-bcde-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632895846;
	bh=UlUjuhgKaaH7cczSJ/gLOUPfURWGnqJjL+P6NuLpDsw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=g+WjhMve5LmikvavwcKQfTH8+k20DHGoyB3sWIVGww/P01DrvxzLb0krgToOYWMVw
	 BTZmBffDd8uqybX0D6Kt3WIPdHtrnYGOFmlFv0lc3WKFMgBpAXXWK4ag/1imH+HjTY
	 M9ByPYlUxIlOwKujVgg/w7MHcUQbeQ08ntbDzcvos4SblfLEgMbvSGhCtV719O7WR5
	 B1Oz4WWLQnSitpYIEoX3BLltsDm2AKi7lXxLkS/wiOdzhQ12YeRz4xd9WhKCOV7aWv
	 rbQBSlkdBBr9o1rVfsRp2fUjx8ZDA66jsXo2IMFWF7BnOr/cCIMAr43xD1NunfSpXm
	 LX1jUYKfOIGBQ==
Date: Tue, 28 Sep 2021 23:10:46 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Rahul Singh <rahul.singh@arm.com>
cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com, 
    Andre.Przywara@arm.com, Stefano Stabellini <sstabellini@kernel.org>, 
    Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 09/17] xen/arm: Add support for PCI init to initialize
 the PCI driver.
In-Reply-To: <31f2e3baf45f059a8ddac22fefc7cdfe1bc63ef5.1632847120.git.rahul.singh@arm.com>
Message-ID: <alpine.DEB.2.21.2109281625430.5022@sstabellini-ThinkPad-T480s>
References: <cover.1632847120.git.rahul.singh@arm.com> <31f2e3baf45f059a8ddac22fefc7cdfe1bc63ef5.1632847120.git.rahul.singh@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 28 Sep 2021, Rahul Singh wrote:
> pci_init(..) will be called during xen startup to initialize and probe
> the PCI host-bridge driver.
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Change in v3:
> - Some nit for device_init(..) return logic
> - Remove inline from acpi_pci_init(..)
> - Modify return value for apci_pci_init(..) to return -EOPNOTSUPP
> Change in v2:
> - ACPI init function to return int
> - pci_segments_init() called before dt/acpi init
> ---
>  xen/arch/arm/pci/pci.c       | 51 ++++++++++++++++++++++++++++++++++++
>  xen/include/asm-arm/device.h |  1 +
>  2 files changed, 52 insertions(+)
> 
> diff --git a/xen/arch/arm/pci/pci.c b/xen/arch/arm/pci/pci.c
> index a7a7bc3213..e359bab9ea 100644
> --- a/xen/arch/arm/pci/pci.c
> +++ b/xen/arch/arm/pci/pci.c
> @@ -12,6 +12,10 @@
>   * along with this program.  If not, see <http://www.gnu.org/licenses/>.
>   */
>  
> +#include <xen/acpi.h>
> +#include <xen/device_tree.h>
> +#include <xen/errno.h>
> +#include <xen/init.h>
>  #include <xen/pci.h>
>  
>  /*
> @@ -22,6 +26,53 @@ int arch_pci_clean_pirqs(struct domain *d)
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
> +        /*
> +         * Ignore the following error codes:
> +         *   - EBADF: Indicate the current device is not a pci device.
> +         *   - ENODEV: The pci device is not present or cannot be used by
> +         *     Xen.
> +         */
> +        if( !rc || rc == -EBADF || rc == -ENODEV )
> +            continue;
> +
> +        return rc;
> +    }
> +
> +    return 0;
> +}
> +
> +#ifdef CONFIG_ACPI
> +static int __init acpi_pci_init(void)
> +{
> +    printk(XENLOG_ERR "ACPI pci init not supported \n");
> +    return -EOPNOTSUPP;
> +}
> +#else
> +static int __init acpi_pci_init(void)
> +{
> +    return -EINVAL;
> +}
> +#endif
> +
> +static int __init pci_init(void)
> +{
> +    pci_segments_init();
> +
> +    if ( acpi_disabled )
> +        return dt_pci_init();
> +    else
> +        return acpi_pci_init();
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

