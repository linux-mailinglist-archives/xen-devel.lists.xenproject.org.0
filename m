Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A163402506
	for <lists+xen-devel@lfdr.de>; Tue,  7 Sep 2021 10:20:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.180593.327320 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNWLJ-0004gj-O9; Tue, 07 Sep 2021 08:20:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 180593.327320; Tue, 07 Sep 2021 08:20:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNWLJ-0004en-Jq; Tue, 07 Sep 2021 08:20:33 +0000
Received: by outflank-mailman (input) for mailman id 180593;
 Tue, 07 Sep 2021 08:20:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mNWLI-0004eh-Bo
 for xen-devel@lists.xenproject.org; Tue, 07 Sep 2021 08:20:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mNWLH-0007kv-9O; Tue, 07 Sep 2021 08:20:31 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mNWLH-0000GH-2C; Tue, 07 Sep 2021 08:20:31 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=iPUVsAG9/4VmfVlRTjN/f3rMxYdXOSMmyOhnkZw4B9g=; b=bkNFcR2gBy2HkDwApzOo5UBl7S
	qMIgQzSHz22C3kvVFaGNDiLQzVKvbhLm2dG4P/AHWi6v7dxynbT6OcI0bPHtbagYD4S8efYzvkIJf
	GcCYNIoLXvzCwrIzOReI/u0WDjvCjk8BizmtY6KPU3dioXOWSiWgH01AXRTvw+oCH2c4=;
Subject: Re: [PATCH v1 04/14] xen/arm: Add support for PCI init to initialize
 the PCI driver.
To: Rahul Singh <rahul.singh@arm.com>, xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1629366665.git.rahul.singh@arm.com>
 <999887f9b4b2ea06ae99e1e003f9e43aa272a19c.1629366665.git.rahul.singh@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <9bbf553c-80ff-7a1a-a87e-e2162085caca@xen.org>
Date: Tue, 7 Sep 2021 09:20:29 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <999887f9b4b2ea06ae99e1e003f9e43aa272a19c.1629366665.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Rahul,

On 19/08/2021 13:02, Rahul Singh wrote:
> pci_init(..) will be called during xen startup to initialize and probe
> the PCI host-bridge driver.
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> ---
>   xen/arch/arm/pci/pci.c       | 54 ++++++++++++++++++++++++++++++++++++
>   xen/include/asm-arm/device.h |  1 +
>   2 files changed, 55 insertions(+)
> 
> diff --git a/xen/arch/arm/pci/pci.c b/xen/arch/arm/pci/pci.c
> index dc55d23778..d1c9cf997d 100644
> --- a/xen/arch/arm/pci/pci.c
> +++ b/xen/arch/arm/pci/pci.c
> @@ -14,13 +14,67 @@
>    * along with this program.  If not, see <http://www.gnu.org/licenses/>.
>    */
>   
> +#include <xen/acpi.h>
> +#include <xen/device_tree.h>
> +#include <xen/errno.h>
> +#include <xen/init.h>
>   #include <xen/pci.h>
> +#include <xen/param.h>

This include doesn't look to be necessary (yet?).

>   
>   int arch_pci_clean_pirqs(struct domain *d)
>   {
>       return 0;
>   }
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

Shouldn't this happen before the PCI initialization?

> +
> +    return 0;
> +}
> +__initcall(pci_init);
> +
>   /*
>    * Local variables:
>    * mode: C
> diff --git a/xen/include/asm-arm/device.h b/xen/include/asm-arm/device.h
> index ee7cff2d44..5ecd5e7bd1 100644
> --- a/xen/include/asm-arm/device.h
> +++ b/xen/include/asm-arm/device.h
> @@ -34,6 +34,7 @@ enum device_class
>       DEVICE_SERIAL,
>       DEVICE_IOMMU,
>       DEVICE_GIC,
> +    DEVICE_PCI,
>       /* Use for error */
>       DEVICE_UNKNOWN,
>   };
> 

Cheers,

-- 
Julien Grall

