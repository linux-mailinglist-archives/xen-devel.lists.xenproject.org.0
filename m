Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4CC22521D8
	for <lists+xen-devel@lfdr.de>; Tue, 25 Aug 2020 22:20:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAfQL-0002D1-8c; Tue, 25 Aug 2020 20:20:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uQdE=CD=kernel.org=helgaas@srs-us1.protection.inumbo.net>)
 id 1kAfQK-00024L-44
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2020 20:20:04 +0000
X-Inumbo-ID: 803fd444-918c-454b-946b-eb8ac55825cd
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 803fd444-918c-454b-946b-eb8ac55825cd;
 Tue, 25 Aug 2020 20:20:03 +0000 (UTC)
Received: from localhost (104.sub-72-107-126.myvzw.com [72.107.126.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 01E6D2074D;
 Tue, 25 Aug 2020 20:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598386802;
 bh=SS+t45IQlef2ZNO8GZOFRl2+c25Lro4JNuNwmNwc8zQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=UeuOVm1ZSIo+ErhE6OlxewMDFPnV4NsWvJxM77q2rQm3Y6ZJ+3mnLIcJH7jIXO4EC
 /XE+2wmGjyHazKgT/AJKml79ce5k1iC5Q8WKAKcLKlgCau+LQEJi/95s8aaS2ETMil
 Wsikip6rcjjaxBoIOlqOC42TYjOKJ7dhkIDcMCCw=
Date: Tue, 25 Aug 2020 15:20:00 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, x86@kernel.org,
 linux-pci@vger.kernel.org, Joerg Roedel <joro@8bytes.org>,
 iommu@lists.linux-foundation.org, linux-hyperv@vger.kernel.org,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Jon Derrick <jonathan.derrick@intel.com>,
 Lu Baolu <baolu.lu@linux.intel.com>, Wei Liu <wei.liu@kernel.org>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 Steve Wahl <steve.wahl@hpe.com>,
 Dimitri Sivanich <sivanich@hpe.com>, Russ Anderson <rja@hpe.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Megha Dey <megha.dey@intel.com>, Jason Gunthorpe <jgg@mellanox.com>,
 Dave Jiang <dave.jiang@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Jacob Pan <jacob.jun.pan@intel.com>, Baolu Lu <baolu.lu@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Dan Williams <dan.j.williams@intel.com>
Subject: Re: [patch RFC 17/38] x86/pci: Reducde #ifdeffery in PCI init code
Message-ID: <20200825202000.GA1925088@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200821002946.982695529@linutronix.de>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

s/Reducde/Reduce/ (in subject)

On Fri, Aug 21, 2020 at 02:24:41AM +0200, Thomas Gleixner wrote:
> Adding a function call before the first #ifdef in arch_pci_init() triggers
> a 'mixed declarations and code' warning if PCI_DIRECT is enabled.
> 
> Use stub functions and move the #ifdeffery to the header file where it is
> not in the way.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Cc: linux-pci@vger.kernel.org

Nice cleanup, thanks.  Glad to get rid of the useless initializer,
too.

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

> ---
>  arch/x86/include/asm/pci_x86.h |   11 +++++++++++
>  arch/x86/pci/init.c            |   10 +++-------
>  2 files changed, 14 insertions(+), 7 deletions(-)
> 
> --- a/arch/x86/include/asm/pci_x86.h
> +++ b/arch/x86/include/asm/pci_x86.h
> @@ -114,9 +114,20 @@ extern const struct pci_raw_ops pci_dire
>  extern bool port_cf9_safe;
>  
>  /* arch_initcall level */
> +#ifdef CONFIG_PCI_DIRECT
>  extern int pci_direct_probe(void);
>  extern void pci_direct_init(int type);
> +#else
> +static inline int pci_direct_probe(void) { return -1; }
> +static inline  void pci_direct_init(int type) { }
> +#endif
> +
> +#ifdef CONFIG_PCI_BIOS
>  extern void pci_pcbios_init(void);
> +#else
> +static inline void pci_pcbios_init(void) { }
> +#endif
> +
>  extern void __init dmi_check_pciprobe(void);
>  extern void __init dmi_check_skip_isa_align(void);
>  
> --- a/arch/x86/pci/init.c
> +++ b/arch/x86/pci/init.c
> @@ -8,11 +8,9 @@
>     in the right sequence from here. */
>  static __init int pci_arch_init(void)
>  {
> -#ifdef CONFIG_PCI_DIRECT
> -	int type = 0;
> +	int type;
>  
>  	type = pci_direct_probe();
> -#endif
>  
>  	if (!(pci_probe & PCI_PROBE_NOEARLY))
>  		pci_mmcfg_early_init();
> @@ -20,18 +18,16 @@ static __init int pci_arch_init(void)
>  	if (x86_init.pci.arch_init && !x86_init.pci.arch_init())
>  		return 0;
>  
> -#ifdef CONFIG_PCI_BIOS
>  	pci_pcbios_init();
> -#endif
> +
>  	/*
>  	 * don't check for raw_pci_ops here because we want pcbios as last
>  	 * fallback, yet it's needed to run first to set pcibios_last_bus
>  	 * in case legacy PCI probing is used. otherwise detecting peer busses
>  	 * fails.
>  	 */
> -#ifdef CONFIG_PCI_DIRECT
>  	pci_direct_init(type);
> -#endif
> +
>  	if (!raw_pci_ops && !raw_pci_ext_ops)
>  		printk(KERN_ERR
>  		"PCI: Fatal: No config space access function found\n");
> 

