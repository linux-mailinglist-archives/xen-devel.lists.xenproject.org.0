Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 029092C49C9
	for <lists+xen-devel@lfdr.de>; Wed, 25 Nov 2020 22:17:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.38081.70712 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ki29j-000243-SK; Wed, 25 Nov 2020 21:16:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 38081.70712; Wed, 25 Nov 2020 21:16:51 +0000
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
	id 1ki29j-00023e-P1; Wed, 25 Nov 2020 21:16:51 +0000
Received: by outflank-mailman (input) for mailman id 38081;
 Wed, 25 Nov 2020 21:16:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gEFk=E7=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1ki29h-00023Z-D2
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 21:16:49 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 914fb1cd-81ed-469a-a058-1448f65ee0ab;
 Wed, 25 Nov 2020 21:16:48 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net
 [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5779E2067D;
 Wed, 25 Nov 2020 21:16:47 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=gEFk=E7=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1ki29h-00023Z-D2
	for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 21:16:49 +0000
X-Inumbo-ID: 914fb1cd-81ed-469a-a058-1448f65ee0ab
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 914fb1cd-81ed-469a-a058-1448f65ee0ab;
	Wed, 25 Nov 2020 21:16:48 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 5779E2067D;
	Wed, 25 Nov 2020 21:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1606339007;
	bh=3ORE4OA2zRG6/kdfS8PhhwjL4qTMFTJtKzDXg5yC5do=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=mW9PhzekD7khhlxwVCnzpEAyHH9XumAmcH2tvZ4eaiTuFU5Aixpe1KFqtb328Dk11
	 4Pgz3fLtaPTRLub0AQG3ct7eRvp2d9lEj/2jhXL/ULUWxXjRH+CBXL7xr1bv997UqI
	 Ca5o79QeQWNP2i+roj+7LSalUoWWV/UkQADG50v8=
Date: Wed, 25 Nov 2020 13:16:46 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Rahul Singh <rahul.singh@arm.com>
cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com, 
    Jan Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH v4 1/3] xen/pci: Move x86 specific code to x86
 directory.
In-Reply-To: <3500f44e3b6f8f05f9d05fa170817d5bc6f39f22.1606326929.git.rahul.singh@arm.com>
Message-ID: <alpine.DEB.2.21.2011251316370.7979@sstabellini-ThinkPad-T480s>
References: <cover.1606326929.git.rahul.singh@arm.com> <3500f44e3b6f8f05f9d05fa170817d5bc6f39f22.1606326929.git.rahul.singh@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 25 Nov 2020, Rahul Singh wrote:
> passthrough/pci.c file is common for all architecture, but there is x86
> specific code in this file.
> 
> Move x86 specific code to the drivers/passthrough/io.c file to avoid
> compilation error for other architecture.
> 
> As drivers/passthrough/io.c is compiled only for x86 move it to
> x86 directory and rename it to hvm.c.
> 
> No functional change intended.
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> 
> Changes in v4:
> - fixed compilation error when CONFIG_HVM is disabled 
> - remove iommu_update_ire_from_msi from the patch will send another patch
>   to fix.
> 
> ---
>  xen/drivers/passthrough/Makefile            |  3 -
>  xen/drivers/passthrough/pci.c               | 71 +--------------------
>  xen/drivers/passthrough/x86/Makefile        |  1 +
>  xen/drivers/passthrough/{io.c => x86/hvm.c} | 66 +++++++++++++++++++
>  xen/include/xen/pci.h                       |  9 +++
>  5 files changed, 77 insertions(+), 73 deletions(-)
>  rename xen/drivers/passthrough/{io.c => x86/hvm.c} (95%)
> 
> diff --git a/xen/drivers/passthrough/Makefile b/xen/drivers/passthrough/Makefile
> index e973e16c74..cc646612c7 100644
> --- a/xen/drivers/passthrough/Makefile
> +++ b/xen/drivers/passthrough/Makefile
> @@ -6,6 +6,3 @@ obj-$(CONFIG_ARM) += arm/
>  obj-y += iommu.o
>  obj-$(CONFIG_HAS_PCI) += pci.o
>  obj-$(CONFIG_HAS_DEVICE_TREE) += device_tree.o
> -
> -x86-$(CONFIG_HVM) := io.o
> -obj-$(CONFIG_X86) += $(x86-y)
> diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
> index 51e584127e..3c6ab1bcb6 100644
> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -14,9 +14,6 @@
>   * this program; If not, see <http://www.gnu.org/licenses/>.
>   */
>  
> -#include <xen/sched.h>
> -#include <xen/pci.h>
> -#include <xen/pci_regs.h>
>  #include <xen/pci_ids.h>
>  #include <xen/list.h>
>  #include <xen/prefetch.h>
> @@ -24,7 +21,6 @@
>  #include <xen/irq.h>
>  #include <xen/param.h>
>  #include <xen/vm_event.h>
> -#include <asm/hvm/irq.h>
>  #include <xen/delay.h>
>  #include <xen/keyhandler.h>
>  #include <xen/event.h>
> @@ -842,71 +838,6 @@ int pci_remove_device(u16 seg, u8 bus, u8 devfn)
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
> @@ -966,7 +897,7 @@ int pci_release_devices(struct domain *d)
>      int ret;
>  
>      pcidevs_lock();
> -    ret = pci_clean_dpci_irqs(d);
> +    ret = arch_pci_clean_pirqs(d);
>      if ( ret )
>      {
>          pcidevs_unlock();
> diff --git a/xen/drivers/passthrough/x86/Makefile b/xen/drivers/passthrough/x86/Makefile
> index a70cf9460d..69284a5d19 100644
> --- a/xen/drivers/passthrough/x86/Makefile
> +++ b/xen/drivers/passthrough/x86/Makefile
> @@ -1,2 +1,3 @@
>  obj-y += ats.o
>  obj-y += iommu.o
> +obj-$(CONFIG_HVM) += hvm.o
> diff --git a/xen/drivers/passthrough/io.c b/xen/drivers/passthrough/x86/hvm.c
> similarity index 95%
> rename from xen/drivers/passthrough/io.c
> rename to xen/drivers/passthrough/x86/hvm.c
> index 6b1305a3e5..41cfa2e200 100644
> --- a/xen/drivers/passthrough/io.c
> +++ b/xen/drivers/passthrough/x86/hvm.c
> @@ -1036,6 +1036,72 @@ unlock:
>      spin_unlock(&d->event_lock);
>  }
>  
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
> +int arch_pci_clean_pirqs(struct domain *d)
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
> +
> +    return 0;
> +}
> +
>  /*
>   * Note: 'pt_pirq_softirq_reset' can clear the STATE_SCHED before we get to
>   * doing it. If that is the case we let 'pt_pirq_softirq_reset' do ref-counting.
> diff --git a/xen/include/xen/pci.h b/xen/include/xen/pci.h
> index 20a54a5bb4..8e3d4d9454 100644
> --- a/xen/include/xen/pci.h
> +++ b/xen/include/xen/pci.h
> @@ -208,4 +208,13 @@ int msixtbl_pt_register(struct domain *, struct pirq *, uint64_t gtable);
>  void msixtbl_pt_unregister(struct domain *, struct pirq *);
>  void msixtbl_pt_cleanup(struct domain *d);
>  
> +#ifdef CONFIG_HVM
> +int arch_pci_clean_pirqs(struct domain *d);
> +#else
> +static inline int arch_pci_clean_pirqs(struct domain *d)
> +{
> +    return 0;
> +}
> +#endif /* CONFIG_HVM */
> +
>  #endif /* __XEN_PCI_H__ */
> -- 
> 2.17.1
> 

