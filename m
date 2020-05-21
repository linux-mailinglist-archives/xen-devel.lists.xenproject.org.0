Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 885B21DD76F
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2020 21:41:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbr4C-0003Un-BU; Thu, 21 May 2020 19:41:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nal7=7D=kernel.org=helgaas@srs-us1.protection.inumbo.net>)
 id 1jbr4B-0003Ui-CD
 for xen-devel@lists.xenproject.org; Thu, 21 May 2020 19:41:19 +0000
X-Inumbo-ID: 0a3434e2-9b9b-11ea-ab5e-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0a3434e2-9b9b-11ea-ab5e-12813bfff9fa;
 Thu, 21 May 2020 19:41:18 +0000 (UTC)
Received: from localhost (mobile-166-175-190-200.mycingular.net
 [166.175.190.200])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 74A8A2065F;
 Thu, 21 May 2020 19:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590090077;
 bh=V7Rxedh2MenOwI8XK4KoWriB9ieXIxOg9p/fYNUmu6o=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=DGrKWPYF4T61W/bPMJjljuNf8dXTHk0f6MkZK2ldwJgILEIsVJksvKR9Ef0tXf/Mm
 /v1VApdxpv0cJTjhytbqfnysZVkWTwx8Gte2VacSGA8MWFcyB34b+jg8pX6rCQInJz
 56CdXIhZgakIXA9UioojzKLvEfweY5Zp+71czsoo=
Date: Thu, 21 May 2020 14:41:15 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Wei Liu <wei.liu@kernel.org>
Subject: Re: [PATCH] x86/xen: drop an unused parameter gsi_override
Message-ID: <20200521194115.GA1169412@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200428153640.76476-1-wei.liu@kernel.org>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>, sstabellini@kernel.org,
 konrad.wilk@oracle.com, linux-pci@vger.kernel.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, Michael Kelley <mikelley@microsoft.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 boris.ostrovsky@oracle.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Apr 28, 2020 at 03:36:40PM +0000, Wei Liu wrote:
> All callers within the same file pass in -1 (no override).
> 
> Signed-off-by: Wei Liu <wei.liu@kernel.org>

Applied to pci/virtualization for v5.8, thanks!

I don't see anything else in linux-next that touches this file, but if
somebody wants to merge this via another tree, just let me know.

> ---
>  arch/x86/pci/xen.c | 16 ++++++----------
>  1 file changed, 6 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/x86/pci/xen.c b/arch/x86/pci/xen.c
> index 91220cc25854..e3f1ca316068 100644
> --- a/arch/x86/pci/xen.c
> +++ b/arch/x86/pci/xen.c
> @@ -60,8 +60,7 @@ static int xen_pcifront_enable_irq(struct pci_dev *dev)
>  }
>  
>  #ifdef CONFIG_ACPI
> -static int xen_register_pirq(u32 gsi, int gsi_override, int triggering,
> -			     bool set_pirq)
> +static int xen_register_pirq(u32 gsi, int triggering, bool set_pirq)
>  {
>  	int rc, pirq = -1, irq = -1;
>  	struct physdev_map_pirq map_irq;
> @@ -94,9 +93,6 @@ static int xen_register_pirq(u32 gsi, int gsi_override, int triggering,
>  		name = "ioapic-level";
>  	}
>  
> -	if (gsi_override >= 0)
> -		gsi = gsi_override;
> -
>  	irq = xen_bind_pirq_gsi_to_irq(gsi, map_irq.pirq, shareable, name);
>  	if (irq < 0)
>  		goto out;
> @@ -112,12 +108,12 @@ static int acpi_register_gsi_xen_hvm(struct device *dev, u32 gsi,
>  	if (!xen_hvm_domain())
>  		return -1;
>  
> -	return xen_register_pirq(gsi, -1 /* no GSI override */, trigger,
> +	return xen_register_pirq(gsi, trigger,
>  				 false /* no mapping of GSI to PIRQ */);
>  }
>  
>  #ifdef CONFIG_XEN_DOM0
> -static int xen_register_gsi(u32 gsi, int gsi_override, int triggering, int polarity)
> +static int xen_register_gsi(u32 gsi, int triggering, int polarity)
>  {
>  	int rc, irq;
>  	struct physdev_setup_gsi setup_gsi;
> @@ -128,7 +124,7 @@ static int xen_register_gsi(u32 gsi, int gsi_override, int triggering, int polar
>  	printk(KERN_DEBUG "xen: registering gsi %u triggering %d polarity %d\n",
>  			gsi, triggering, polarity);
>  
> -	irq = xen_register_pirq(gsi, gsi_override, triggering, true);
> +	irq = xen_register_pirq(gsi, triggering, true);
>  
>  	setup_gsi.gsi = gsi;
>  	setup_gsi.triggering = (triggering == ACPI_EDGE_SENSITIVE ? 0 : 1);
> @@ -148,7 +144,7 @@ static int xen_register_gsi(u32 gsi, int gsi_override, int triggering, int polar
>  static int acpi_register_gsi_xen(struct device *dev, u32 gsi,
>  				 int trigger, int polarity)
>  {
> -	return xen_register_gsi(gsi, -1 /* no GSI override */, trigger, polarity);
> +	return xen_register_gsi(gsi, trigger, polarity);
>  }
>  #endif
>  #endif
> @@ -491,7 +487,7 @@ int __init pci_xen_initial_domain(void)
>  		if (acpi_get_override_irq(irq, &trigger, &polarity) == -1)
>  			continue;
>  
> -		xen_register_pirq(irq, -1 /* no GSI override */,
> +		xen_register_pirq(irq,
>  			trigger ? ACPI_LEVEL_SENSITIVE : ACPI_EDGE_SENSITIVE,
>  			true /* Map GSI to PIRQ */);
>  	}
> -- 
> 2.20.1
> 

