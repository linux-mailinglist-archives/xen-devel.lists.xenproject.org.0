Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E60129CCC1
	for <lists+xen-devel@lfdr.de>; Wed, 28 Oct 2020 00:56:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.13190.33769 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXYom-0007c0-PM; Tue, 27 Oct 2020 23:55:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 13190.33769; Tue, 27 Oct 2020 23:55:56 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXYom-0007bb-Lz; Tue, 27 Oct 2020 23:55:56 +0000
Received: by outflank-mailman (input) for mailman id 13190;
 Tue, 27 Oct 2020 23:55:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C1L6=EC=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kXYol-0007bW-Dj
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 23:55:55 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d84f8bc1-5e67-4e09-84c5-1a75d37e38a3;
 Tue, 27 Oct 2020 23:55:54 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net
 [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2E24721D91;
 Tue, 27 Oct 2020 23:55:53 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=C1L6=EC=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1kXYol-0007bW-Dj
	for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 23:55:55 +0000
X-Inumbo-ID: d84f8bc1-5e67-4e09-84c5-1a75d37e38a3
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id d84f8bc1-5e67-4e09-84c5-1a75d37e38a3;
	Tue, 27 Oct 2020 23:55:54 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 2E24721D91;
	Tue, 27 Oct 2020 23:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603842953;
	bh=SXf5Z5Usu2gveD/0mUvQaH6q3rziOWLpQl68mdCRxwE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=1c/HZ1ozl7Lkp9FCUsjJtiJUVRFEYiOUbqpFhFRTOQlxQTnkAWVpccHkpSVsqxBoU
	 rIglBm+ZE/+RjHbjR/jZzypwUhKxsldFiSNNnY2n/mT52Qm/dZFkdaa/ltO1mmujau
	 92KUBSkT0kLsq65z79XEaPDWKxpIz73HD59b4BG8=
Date: Tue, 27 Oct 2020 16:55:52 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Rahul Singh <rahul.singh@arm.com>
cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, 
    Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>, 
    Kevin Tian <kevin.tian@intel.com>
Subject: Re: [PATCH v1 2/4] xen/pci: Introduce new CONFIG_HAS_PCI_ATS flag
 for PCI ATS functionality.
In-Reply-To: <1bb971bed3f5a56b0691fbcfd0346ae721ba049f.1603731279.git.rahul.singh@arm.com>
Message-ID: <alpine.DEB.2.21.2010271640280.12247@sstabellini-ThinkPad-T480s>
References: <cover.1603731279.git.rahul.singh@arm.com> <1bb971bed3f5a56b0691fbcfd0346ae721ba049f.1603731279.git.rahul.singh@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 26 Oct 2020, Rahul Singh wrote:
> PCI ATS functionality is not enabled and tested for ARM architecture
> but it is enabled for x86 and referenced in common passthrough/pci.c
> code.
> 
> Therefore introducing the new flag to enable the ATS functionality for
> x86 only to avoid issues for ARM architecture.
> 
> No functional change.
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> ---
>  xen/arch/x86/Kconfig                     |  1 +
>  xen/drivers/passthrough/ats.h            | 24 ++++++++++++++++++++++++
>  xen/drivers/passthrough/vtd/x86/Makefile |  2 +-
>  xen/drivers/passthrough/x86/Makefile     |  2 +-
>  xen/drivers/pci/Kconfig                  |  3 +++
>  5 files changed, 30 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
> index 24868aa6ad..31906e9c97 100644
> --- a/xen/arch/x86/Kconfig
> +++ b/xen/arch/x86/Kconfig
> @@ -20,6 +20,7 @@ config X86
>  	select HAS_NS16550
>  	select HAS_PASSTHROUGH
>  	select HAS_PCI
> +	select HAS_PCI_ATS
>  	select HAS_PDX
>  	select HAS_SCHED_GRANULARITY
>  	select HAS_UBSAN
> diff --git a/xen/drivers/passthrough/ats.h b/xen/drivers/passthrough/ats.h
> index 22ae209b37..a0af07b287 100644
> --- a/xen/drivers/passthrough/ats.h
> +++ b/xen/drivers/passthrough/ats.h
> @@ -17,6 +17,8 @@
>  
>  #include <xen/pci_regs.h>
>  
> +#ifdef CONFIG_HAS_PCI_ATS
> +
>  #define ATS_REG_CAP    4
>  #define ATS_REG_CTL    6
>  #define ATS_QUEUE_DEPTH_MASK     0x1f
> @@ -48,5 +50,27 @@ static inline int pci_ats_device(int seg, int bus, int devfn)
>      return pci_find_ext_capability(seg, bus, devfn, PCI_EXT_CAP_ID_ATS);
>  }
>  
> +#else
> +
> +static inline int enable_ats_device(struct pci_dev *pdev,
> +                                    struct list_head *ats_list)
> +{
> +    return -ENODEV;
> +}
> +
> +static inline void disable_ats_device(struct pci_dev *pdev) { }
> +
> +static inline int pci_ats_enabled(int seg, int bus, int devfn)
> +{
> +    return -ENODEV;
> +}

pci_ats_enabled returns 0 when ATS is not enabled


> +static inline int pci_ats_device(int seg, int bus, int devfn)
> +{
> +    return -ENODEV;

also returns 0 when ATS is not enabled


> +}
> +
> +#endif /* CONFIG_HAS_PCI_ATS */
> +
>  #endif /* _ATS_H_ */
>  
> diff --git a/xen/drivers/passthrough/vtd/x86/Makefile b/xen/drivers/passthrough/vtd/x86/Makefile
> index 4ef00a4c5b..60f79fe263 100644
> --- a/xen/drivers/passthrough/vtd/x86/Makefile
> +++ b/xen/drivers/passthrough/vtd/x86/Makefile
> @@ -1,3 +1,3 @@
> -obj-y += ats.o
> +obj-$(CONFIG_HAS_PCI_ATS) += ats.o
>  obj-$(CONFIG_HVM) += hvm.o
>  obj-y += vtd.o
> diff --git a/xen/drivers/passthrough/x86/Makefile b/xen/drivers/passthrough/x86/Makefile
> index a70cf9460d..05e6f51f25 100644
> --- a/xen/drivers/passthrough/x86/Makefile
> +++ b/xen/drivers/passthrough/x86/Makefile
> @@ -1,2 +1,2 @@
> -obj-y += ats.o
> +obj-$(CONFIG_HAS_PCI_ATS) += ats.o
>  obj-y += iommu.o
> diff --git a/xen/drivers/pci/Kconfig b/xen/drivers/pci/Kconfig
> index 7da03fa13b..1588d4a91e 100644
> --- a/xen/drivers/pci/Kconfig
> +++ b/xen/drivers/pci/Kconfig
> @@ -1,3 +1,6 @@
>  
>  config HAS_PCI
>  	bool
> +
> +config HAS_PCI_ATS
> +	bool
> -- 
> 2.17.1
> 

