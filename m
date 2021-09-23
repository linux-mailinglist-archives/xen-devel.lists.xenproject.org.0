Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F4F415462
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 02:04:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193199.344114 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTCDG-00089z-5b; Thu, 23 Sep 2021 00:03:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193199.344114; Thu, 23 Sep 2021 00:03:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTCDG-00086y-2B; Thu, 23 Sep 2021 00:03:42 +0000
Received: by outflank-mailman (input) for mailman id 193199;
 Thu, 23 Sep 2021 00:03:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/SRu=ON=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mTCDE-00086s-CR
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 00:03:40 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d9371d51-c5af-40e7-b69b-4a642f969a0e;
 Thu, 23 Sep 2021 00:03:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4FE1E61040;
 Thu, 23 Sep 2021 00:03:38 +0000 (UTC)
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
X-Inumbo-ID: d9371d51-c5af-40e7-b69b-4a642f969a0e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632355418;
	bh=0gLP7gQB9I4DdUjrcPOD3CPCp+uA/6+96tfHuOreojo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=irvutLhBTJuUOXs0e9g3SKNOuhiL+xgz0qC90rSc5wmL8chu0uddOMYuJzphwab5t
	 hgwH87KbhfguJQZew+GdTsfCLix9X/e3eZNkrPhiL1K4FuKenFIJGccLpFgU6ju2lu
	 aBz06swGzrU9jhGJkL5hf+nmxs9mzt7+Mc7Z31N9CHlMqIMfBLghQuAakKoLCiAdnF
	 elgEsrxsnQ0n8pyl1TAy8VZJirxaH1k/8Bwr3j9aR8X0hM1uAIcaOKEUKFIOoMzvDA
	 5+QdCKfNnyxwWxi2mBS66iuJ/krs06qK1OMtMTGqBcUgx/otrlhdDDPaIovwlHlkll
	 RjSooh4wWyaDw==
Date: Wed, 22 Sep 2021 17:03:37 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Rahul Singh <rahul.singh@arm.com>
cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com, 
    andre.przywara@arm.com, Stefano Stabellini <sstabellini@kernel.org>, 
    Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 09/17] xen/arm: Add support for PCI init to initialize
 the PCI driver.
In-Reply-To: <000832623dc7fb429db4b4517583f16affdba35b.1632307952.git.rahul.singh@arm.com>
Message-ID: <alpine.DEB.2.21.2109221657080.17979@sstabellini-ThinkPad-T480s>
References: <cover.1632307952.git.rahul.singh@arm.com> <000832623dc7fb429db4b4517583f16affdba35b.1632307952.git.rahul.singh@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 22 Sep 2021, Rahul Singh wrote:
> pci_init(..) will be called during xen startup to initialize and probe
> the PCI host-bridge driver.
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> ---
> Change in v2:
> - ACPI init function to return int
> - pci_segments_init() called before dt/acpi init
> ---
>  xen/arch/arm/pci/pci.c       | 54 ++++++++++++++++++++++++++++++++++++
>  xen/include/asm-arm/device.h |  1 +
>  2 files changed, 55 insertions(+)
> 
> diff --git a/xen/arch/arm/pci/pci.c b/xen/arch/arm/pci/pci.c
> index a7a7bc3213..71fa532842 100644
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
> @@ -22,6 +26,56 @@ int arch_pci_clean_pirqs(struct domain *d)
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

This is a NIT, so feel free to code it as you prefer, but I would write
it as follows for simplicity:


/* comment about EBADF and ENODEV */
if ( !rc || rc == -EBADF || rc == -ENODEV )
    continue;
return rc;


> +        /*
> +         * Ignore the following error codes:
> +         *   - EBADF: Indicate the current is not an pci
                                             ^ device ^a   ^ device


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
> +static int __init acpi_pci_init(void)
> +{
> +    printk(XENLOG_ERR "ACPI pci init not supported \n");
> +    return 0;

Should return ENOSYS or EOPNOTSUPP?


> +}
> +#else
> +static inline int __init acpi_pci_init(void)

Not sure I would inline it but OK either way


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

