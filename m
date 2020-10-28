Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B828529CCC6
	for <lists+xen-devel@lfdr.de>; Wed, 28 Oct 2020 01:16:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.13230.33792 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXZ80-0001hZ-B7; Wed, 28 Oct 2020 00:15:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 13230.33792; Wed, 28 Oct 2020 00:15:48 +0000
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
	id 1kXZ80-0001hE-7y; Wed, 28 Oct 2020 00:15:48 +0000
Received: by outflank-mailman (input) for mailman id 13230;
 Wed, 28 Oct 2020 00:15:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ghuf=ED=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kXZ7z-0001h9-1L
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2020 00:15:47 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 08941584-b26b-4b1f-a9eb-396ac791c599;
 Wed, 28 Oct 2020 00:15:46 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net
 [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 045B62223C;
 Wed, 28 Oct 2020 00:15:44 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=ghuf=ED=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1kXZ7z-0001h9-1L
	for xen-devel@lists.xenproject.org; Wed, 28 Oct 2020 00:15:47 +0000
X-Inumbo-ID: 08941584-b26b-4b1f-a9eb-396ac791c599
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 08941584-b26b-4b1f-a9eb-396ac791c599;
	Wed, 28 Oct 2020 00:15:46 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 045B62223C;
	Wed, 28 Oct 2020 00:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603844145;
	bh=0b1ob6ERADyc9hSxZPEjS6jZR4GRpxV4gccE/wpme/Q=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=N8ne3+AVJwTuQEXJVsffqTBtm8ZQqamfDLwheWF23yAKAEPz2XX7GNLPWFmwfkdWz
	 NAM9cPia9hYI7M1a4zT0cLaFgeYKrOpkQQ+QtrpExxuwJIWZbaGEW2W5fOhHr+mbzB
	 2zxlS8YkHQ+g3YmBhQ3XvXpGlQDMmB0SZt3C0o80=
Date: Tue, 27 Oct 2020 17:15:44 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Rahul Singh <rahul.singh@arm.com>
cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com, 
    Jan Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH v1 3/4] xen/pci: Move x86 specific code to x86
 directory.
In-Reply-To: <70029e8904170c4f19d9f521847050cd00c6e39d.1603731279.git.rahul.singh@arm.com>
Message-ID: <alpine.DEB.2.21.2010271657030.12247@sstabellini-ThinkPad-T480s>
References: <cover.1603731279.git.rahul.singh@arm.com> <70029e8904170c4f19d9f521847050cd00c6e39d.1603731279.git.rahul.singh@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 26 Oct 2020, Rahul Singh wrote:
> passthrough/pci.c file is common for all architecture, but there is x86
> sepcific code in this file.
  ^ specific

> Move x86 specific code to the x86 directory to avoid compilation error
> for other architecture.
> 
> No functional change.
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> ---
>  xen/drivers/passthrough/pci.c        | 75 +--------------------
>  xen/drivers/passthrough/x86/Makefile |  1 +
>  xen/drivers/passthrough/x86/iommu.c  |  7 ++
>  xen/drivers/passthrough/x86/pci.c    | 97 ++++++++++++++++++++++++++++
>  xen/include/xen/pci.h                |  2 +
>  5 files changed, 108 insertions(+), 74 deletions(-)
>  create mode 100644 xen/drivers/passthrough/x86/pci.c
> 
> diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
> index 2a3bce1462..c6fbb7172c 100644
> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -24,7 +24,6 @@
>  #include <xen/irq.h>
>  #include <xen/param.h>
>  #include <xen/vm_event.h>
> -#include <asm/hvm/irq.h>
>  #include <xen/delay.h>
>  #include <xen/keyhandler.h>
>  #include <xen/event.h>

sched.h is not needed anymore among the #include


> @@ -847,71 +846,6 @@ int pci_remove_device(u16 seg, u8 bus, u8 devfn)
>      return ret;
>  }
>  
> -static int pci_clean_dpci_irq(struct domain *d,
> -                              struct hvm_pirq_dpci *pirq_dpci, void *arg)
> -{
> -    struct dev_intx_gsi_link *digl, *tmp;
> -
> -    pirq_guest_unbind(d, dpci_pirq(pirq_dpci));
> -
> -    if ( pt_irq_need_timer(pirq_dpci->flags) )
> -        kill_timer(&pirq_dpci->timer);
> -
> -    list_for_each_entry_safe ( digl, tmp, &pirq_dpci->digl_list, list )
> -    {
> -        list_del(&digl->list);
> -        xfree(digl);
> -    }
> -
> -    radix_tree_delete(&d->pirq_tree, dpci_pirq(pirq_dpci)->pirq);
> -
> -    if ( !pt_pirq_softirq_active(pirq_dpci) )
> -        return 0;
> -
> -    domain_get_irq_dpci(d)->pending_pirq_dpci = pirq_dpci;
> -
> -    return -ERESTART;
> -}
> -
> -static int pci_clean_dpci_irqs(struct domain *d)
> -{
> -    struct hvm_irq_dpci *hvm_irq_dpci = NULL;
> -
> -    if ( !is_iommu_enabled(d) )
> -        return 0;
> -
> -    if ( !is_hvm_domain(d) )
> -        return 0;
> -
> -    spin_lock(&d->event_lock);
> -    hvm_irq_dpci = domain_get_irq_dpci(d);
> -    if ( hvm_irq_dpci != NULL )
> -    {
> -        int ret = 0;
> -
> -        if ( hvm_irq_dpci->pending_pirq_dpci )
> -        {
> -            if ( pt_pirq_softirq_active(hvm_irq_dpci->pending_pirq_dpci) )
> -                 ret = -ERESTART;
> -            else
> -                 hvm_irq_dpci->pending_pirq_dpci = NULL;
> -        }
> -
> -        if ( !ret )
> -            ret = pt_pirq_iterate(d, pci_clean_dpci_irq, NULL);
> -        if ( ret )
> -        {
> -            spin_unlock(&d->event_lock);
> -            return ret;
> -        }
> -
> -        hvm_domain_irq(d)->dpci = NULL;
> -        free_hvm_irq_dpci(hvm_irq_dpci);
> -    }
> -    spin_unlock(&d->event_lock);
> -    return 0;
> -}
> -
>  /* Caller should hold the pcidevs_lock */
>  static int deassign_device(struct domain *d, uint16_t seg, uint8_t bus,
>                             uint8_t devfn)
> @@ -971,7 +905,7 @@ int pci_release_devices(struct domain *d)
>      int ret;
>  
>      pcidevs_lock();
> -    ret = pci_clean_dpci_irqs(d);
> +    ret = arch_pci_release_devices(d);
>      if ( ret )
>      {
>          pcidevs_unlock();
> @@ -1375,13 +1309,6 @@ static int __init setup_dump_pcidevs(void)
>  }
>  __initcall(setup_dump_pcidevs);
>  
> -int iommu_update_ire_from_msi(
> -    struct msi_desc *msi_desc, struct msi_msg *msg)
> -{
> -    return iommu_intremap
> -           ? iommu_call(&iommu_ops, update_ire_from_msi, msi_desc, msg) : 0;
> -}
> -
>  static int iommu_add_device(struct pci_dev *pdev)
>  {
>      const struct domain_iommu *hd;
> diff --git a/xen/drivers/passthrough/x86/Makefile b/xen/drivers/passthrough/x86/Makefile
> index 05e6f51f25..642f673ed2 100644
> --- a/xen/drivers/passthrough/x86/Makefile
> +++ b/xen/drivers/passthrough/x86/Makefile
> @@ -1,2 +1,3 @@
>  obj-$(CONFIG_HAS_PCI_ATS) += ats.o
>  obj-y += iommu.o
> +obj-y += pci.o
> diff --git a/xen/drivers/passthrough/x86/iommu.c b/xen/drivers/passthrough/x86/iommu.c
> index f17b1820f4..875e67b53b 100644
> --- a/xen/drivers/passthrough/x86/iommu.c
> +++ b/xen/drivers/passthrough/x86/iommu.c
> @@ -308,6 +308,13 @@ struct page_info *iommu_alloc_pgtable(struct domain *d)
>      return pg;
>  }
>  
> +int iommu_update_ire_from_msi(
> +    struct msi_desc *msi_desc, struct msi_msg *msg)
> +{
> +    return iommu_intremap
> +           ? iommu_call(&iommu_ops, update_ire_from_msi, msi_desc, msg) : 0;
> +}
> +
>  /*
>   * Local variables:
>   * mode: C
> diff --git a/xen/drivers/passthrough/x86/pci.c b/xen/drivers/passthrough/x86/pci.c
> new file mode 100644
> index 0000000000..443712aa22
> --- /dev/null
> +++ b/xen/drivers/passthrough/x86/pci.c
> @@ -0,0 +1,97 @@
> +/*
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License along with
> + * this program; If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#include <xen/param.h>

not needed


> +#include <xen/sched.h>
> +#include <xen/pci.h>
> +#include <xen/pci_regs.h>

not needed


> +static int pci_clean_dpci_irq(struct domain *d,
> +                              struct hvm_pirq_dpci *pirq_dpci, void *arg)
> +{
> +    struct dev_intx_gsi_link *digl, *tmp;
> +
> +    pirq_guest_unbind(d, dpci_pirq(pirq_dpci));
> +
> +    if ( pt_irq_need_timer(pirq_dpci->flags) )
> +        kill_timer(&pirq_dpci->timer);
> +
> +    list_for_each_entry_safe ( digl, tmp, &pirq_dpci->digl_list, list )
> +    {
> +        list_del(&digl->list);
> +        xfree(digl);
> +    }
> +
> +    radix_tree_delete(&d->pirq_tree, dpci_pirq(pirq_dpci)->pirq);
> +
> +    if ( !pt_pirq_softirq_active(pirq_dpci) )
> +        return 0;
> +
> +    domain_get_irq_dpci(d)->pending_pirq_dpci = pirq_dpci;
> +
> +    return -ERESTART;
> +}
> +
> +static int pci_clean_dpci_irqs(struct domain *d)
> +{
> +    struct hvm_irq_dpci *hvm_irq_dpci = NULL;
> +
> +    if ( !is_iommu_enabled(d) )
> +        return 0;
> +
> +    if ( !is_hvm_domain(d) )
> +        return 0;
> +
> +    spin_lock(&d->event_lock);
> +    hvm_irq_dpci = domain_get_irq_dpci(d);
> +    if ( hvm_irq_dpci != NULL )
> +    {
> +        int ret = 0;
> +
> +        if ( hvm_irq_dpci->pending_pirq_dpci )
> +        {
> +            if ( pt_pirq_softirq_active(hvm_irq_dpci->pending_pirq_dpci) )
> +                 ret = -ERESTART;
> +            else
> +                 hvm_irq_dpci->pending_pirq_dpci = NULL;
> +        }
> +
> +        if ( !ret )
> +            ret = pt_pirq_iterate(d, pci_clean_dpci_irq, NULL);
> +        if ( ret )
> +        {
> +            spin_unlock(&d->event_lock);
> +            return ret;
> +        }
> +
> +        hvm_domain_irq(d)->dpci = NULL;
> +        free_hvm_irq_dpci(hvm_irq_dpci);
> +    }
> +    spin_unlock(&d->event_lock);
> +    return 0;
> +}
> +
> +int arch_pci_release_devices(struct domain *d)
> +{
> +    return pci_clean_dpci_irqs(d);
> +}
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/include/xen/pci.h b/xen/include/xen/pci.h
> index 2bc4aaf453..13ae7cc2a5 100644
> --- a/xen/include/xen/pci.h
> +++ b/xen/include/xen/pci.h
> @@ -212,4 +212,6 @@ int msixtbl_pt_register(struct domain *, struct pirq *, uint64_t gtable);
>  void msixtbl_pt_unregister(struct domain *, struct pirq *);
>  void msixtbl_pt_cleanup(struct domain *d);
>  
> +int arch_pci_release_devices(struct domain *d);
> +
>  #endif /* __XEN_PCI_H__ */


