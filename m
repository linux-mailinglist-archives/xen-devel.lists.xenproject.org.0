Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F34635C51D
	for <lists+xen-devel@lfdr.de>; Mon, 12 Apr 2021 13:29:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.109002.208036 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVujv-0004Ho-8N; Mon, 12 Apr 2021 11:28:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 109002.208036; Mon, 12 Apr 2021 11:28:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVujv-0004HP-5H; Mon, 12 Apr 2021 11:28:23 +0000
Received: by outflank-mailman (input) for mailman id 109002;
 Mon, 12 Apr 2021 11:28:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q596=JJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lVujt-0004HK-H4
 for xen-devel@lists.xenproject.org; Mon, 12 Apr 2021 11:28:21 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e745ab1a-88dc-46c7-a6e2-7d0dd668fa18;
 Mon, 12 Apr 2021 11:28:20 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E9E3DAE20;
 Mon, 12 Apr 2021 11:28:18 +0000 (UTC)
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
X-Inumbo-ID: e745ab1a-88dc-46c7-a6e2-7d0dd668fa18
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618226899; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z2Wak3GAwTvr1Kgh13c9CtiZOA8C+//TZ+Fv9FCoSt8=;
	b=flyyaOi915O+/MYHS6dK5qCzKBzEn6B6RbbKOLy22SMmgyjqgSeqN3+UkqdjfwjGy7MEqn
	YXRaba5+E8wuHLkNO4kigYiP2/Q6qqHM8EKVBocC/233h/kHlY9zrIEKwBMb7Fm2tpez/y
	WvlgaB5DY3eT5Uw/n8QiziD+w7uQqAA=
Subject: Re: [PATCH v2] xen/pci: Refactor PCI MSI interrupts related code
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Rahul Singh <rahul.singh@arm.com>
Cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Paul Durrant <paul@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>
References: <e4ca856b19d9128cae5f6aa4ace550ace17fd877.1617977720.git.rahul.singh@arm.com>
 <YHQlptvoC06rqNhQ@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7f7383a5-a678-0dbd-cf9f-8a9239f6d391@suse.com>
Date: Mon, 12 Apr 2021 13:28:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <YHQlptvoC06rqNhQ@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 12.04.2021 12:49, Roger Pau Monné wrote:
> On Fri, Apr 09, 2021 at 05:00:41PM +0100, Rahul Singh wrote:
>> --- a/xen/arch/x86/msi.c
>> +++ b/xen/arch/x86/msi.c
>> @@ -1411,6 +1411,70 @@ void __init early_msi_init(void)
>>          return;
>>  }
>>  
>> +int alloc_pci_msi(struct pci_dev *pdev)
> 
> I would rather name it pci_msi_init...

Or maybe pdev_msi_init(), as pci_msi_init() looks more like a one-
time, global init function?

>> +void free_pci_msi(struct pci_dev *pdev)
> 
> ...and pci_msi_free.

The counterpart of "init" really would be "deinit", IOW I'd like to
ask for either alloc/free or init/deinit.

>> +{
>> +    xfree(pdev->msix);

Could this maybe become XFREE() at this occasion?

>> +int pci_assign_msix_init(struct domain *d, struct pci_dev *pdev)
> 
> This kind of a confusing name - what about pci_msix_assign?
> 
>> +{
>> +    int rc;
>> +
>> +    if ( pdev->msix )

Wouldn't this check better live in the sole caller?


>> +void dump_pci_msi(struct pci_dev *pdev)

pdev_dump_msi() or some such?

Also - const here and ...

>> +{
>> +    struct msi_desc *msi;

... here please, while you already move this code.

>> +    list_for_each_entry ( msi, &pdev->msi_list, list )
>> +        printk("%d ", msi->irq);
>> +}
> 
> I wonder, those those function really want to be in a x86 specific
> file? There's nothing x86 specific about them AFAICT.
> 
> Would it make sense to create a separate msi-intercept.c file with
> those that gets included when CONFIG_PCI_MSI_INTERCEPT?

+1

>> @@ -1303,12 +1279,15 @@ static int __init setup_dump_pcidevs(void)
>>  }
>>  __initcall(setup_dump_pcidevs);
>>  
>> +
>> +#ifdef CONFIG_PCI_MSI_INTERCEPT

No double blank lines please.

>>  int iommu_update_ire_from_msi(
>>      struct msi_desc *msi_desc, struct msi_msg *msg)
>>  {
>>      return iommu_intremap
>>             ? iommu_call(&iommu_ops, update_ire_from_msi, msi_desc, msg) : 0;
>>  }
>> +#endif
> 
> This is not exactly related to MSI intercepts, the IOMMU interrupt
> remapping table will also be used for interrupt entries for devices
> being used by Xen directly, where no intercept is required.
> 
> And then you also want to gate the hook from iommu_ops itself with
> CONFIG_PCI_MSI_INTERCEPT, if we want to got this route.

I think the two aspects of MSI should be kept separate.

>> --- a/xen/drivers/pci/Kconfig
>> +++ b/xen/drivers/pci/Kconfig
>> @@ -1,3 +1,7 @@
>>  
>>  config HAS_PCI
>>  	bool
>> +
>> +config PCI_MSI_INTERCEPT
>> +	def_bool y
>> +	depends on X86 && HAS_PCI

Depending on HAS_PCI is fine (albeit not strictly needed afaict),
but this shouldn't have a default (like HAS_PCI doesn't) and
instead be selected by x86.

>> --- a/xen/drivers/vpci/vpci.c
>> +++ b/xen/drivers/vpci/vpci.c
>> @@ -48,8 +48,7 @@ void vpci_remove_device(struct pci_dev *pdev)
>>          xfree(r);
>>      }
>>      spin_unlock(&pdev->vpci->lock);
>> -    xfree(pdev->vpci->msix);
>> -    xfree(pdev->vpci->msi);
>> +    free_vpci_msi(pdev);

I don't think the function needs to be passed a pdev, and ...
>>      xfree(pdev->vpci);
>>      pdev->vpci = NULL;

... it would only be consistent with this if pdev->vpci was passed
instead.

>> --- /dev/null
>> +++ b/xen/include/asm-arm/msi.h
>> @@ -0,0 +1,44 @@
>> +/*
>> + * Copyright (C) 2021 Arm Ltd.
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License version 2 as
>> + * published by the Free Software Foundation.
>> + *
>> + * This program is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + * GNU General Public License for more details.
>> + *
>> + * You should have received a copy of the GNU General Public License
>> + * along with this program.  If not, see <http://www.gnu.org/licenses/>.
>> + */
>> +
>> +#ifndef __ASM_MSI_H_
>> +#define __ASM_MSI_H_
>> +
>> +static inline int alloc_pci_msi(struct pci_dev *pdev)
>> +{
>> +    return 0;
>> +}
>> +
>> +static inline int pci_assign_msix_init(struct domain *d, struct pci_dev *pdev)
>> +{
>> +    return 0;
>> +}
>> +
>> +static inline void dump_pci_msi(struct pci_dev *pdev) {}
>> +static inline void free_pci_msi(struct pci_dev *pdev) {}
>> +static inline void pci_cleanup_msi(struct pci_dev *pdev) {}
>> +
>> +#endif /* __ASM_MSI_H */
>> +
>> +/*
>> + * Local variables:
>> + * mode: C
>> + * c-file-style: "BSD"
>> + * c-basic-offset: 4
>> + * tab-width: 4
>> + * indent-tabs-mode: nil
>> + * End:
>> + */
> 
> Should you instead have a non-arch specific file with those dummy
> helpers that get used when !CONFIG_PCI_MSI_INTERCEPT?

+1

>> --- a/xen/include/asm-x86/msi.h
>> +++ b/xen/include/asm-x86/msi.h
>> @@ -252,5 +252,9 @@ void unmask_msi_irq(struct irq_desc *);
>>  void guest_mask_msi_irq(struct irq_desc *, bool mask);
>>  void ack_nonmaskable_msi_irq(struct irq_desc *);
>>  void set_msi_affinity(struct irq_desc *, const cpumask_t *);
>> +int alloc_pci_msi(struct pci_dev *pdev);
>> +void free_pci_msi(struct pci_dev *pdev);
>> +void dump_pci_msi(struct pci_dev *pdev);
>> +int pci_assign_msix_init(struct domain *d, struct pci_dev *pdev);

These should then live in the other "half" of that header.

>> --- a/xen/include/xen/pci.h
>> +++ b/xen/include/xen/pci.h
>> @@ -79,10 +79,6 @@ struct pci_dev {
>>      struct list_head alldevs_list;
>>      struct list_head domain_list;
>>  
>> -    struct list_head msi_list;
>> -
>> -    struct arch_msix *msix;
>> -
>>      struct domain *domain;
>>  
>>      const union {
>> @@ -94,7 +90,14 @@ struct pci_dev {
>>          pci_sbdf_t sbdf;
>>      };
>>  
>> +#ifdef CONFIG_PCI_MSI_INTERCEPT
>> +    struct list_head msi_list;
>> +
>> +    struct arch_msix *msix;
>> +
>>      uint8_t msi_maxvec;
>> +#endif
>> +
>>      uint8_t phantom_stride;

Like Roger also said for struct vpci, it's not clear this is worth
it. And while you may have paid attention (and there simply is no
better arrangement) I'd also like to point out that such field
movement should be done while keeping padding hole sizes in mind.

>> @@ -174,7 +177,7 @@ int __must_check vpci_msix_arch_disable_entry(struct vpci_msix_entry *entry,
>>                                                const struct pci_dev *pdev);
>>  void vpci_msix_arch_init_entry(struct vpci_msix_entry *entry);
>>  int vpci_msix_arch_print(const struct vpci_msix *msix);
>> -
>> +int remove_msix_regions(const struct pci_dev *pdev, struct rangeset *mem);
>>  /*
>>   * Helper functions to fetch MSIX related data. They are used by both the
>>   * emulated MSIX code and the BAR handlers.

Please don't remove blank lines like this one, unless you actually
see a reason.

Jan

