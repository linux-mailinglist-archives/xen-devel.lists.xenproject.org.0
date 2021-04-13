Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B25D835E4BF
	for <lists+xen-devel@lfdr.de>; Tue, 13 Apr 2021 19:12:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.110008.209962 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWMaK-00013r-RX; Tue, 13 Apr 2021 17:12:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 110008.209962; Tue, 13 Apr 2021 17:12:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWMaK-00013S-O0; Tue, 13 Apr 2021 17:12:20 +0000
Received: by outflank-mailman (input) for mailman id 110008;
 Tue, 13 Apr 2021 17:12:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lWMaJ-00013N-L5
 for xen-devel@lists.xenproject.org; Tue, 13 Apr 2021 17:12:19 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lWMaD-0008Ng-E9; Tue, 13 Apr 2021 17:12:13 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lWMaC-00076s-SB; Tue, 13 Apr 2021 17:12:13 +0000
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
	bh=Dw7T18QSECdo1ElHNtfLOev4aS0oSjPtMjpITKCawEE=; b=55vE7S+1oXziekxx71hh+hdQ+j
	jtW90uHQwVYtRXFHx5ur6TQuS8XGh9UsN8MvhHi8D8huqyBEkR3zJDboLxrL7SkC4H6bno+bPlkua
	bN2hWr1YrI8In+vRUfb6N+6s/H5dhwAUpfzpxumYBEjXOT94qQHGaXl8NmHbyLQotblM=;
Subject: Re: [PATCH v2] xen/pci: Refactor PCI MSI interrupts related code
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Rahul Singh <rahul.singh@arm.com>
Cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>
References: <e4ca856b19d9128cae5f6aa4ace550ace17fd877.1617977720.git.rahul.singh@arm.com>
 <YHQlptvoC06rqNhQ@Air-de-Roger>
From: Julien Grall <julien@xen.org>
Message-ID: <f7659788-ff1b-23dd-e838-b35ae8ef9e50@xen.org>
Date: Tue, 13 Apr 2021 18:12:10 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <YHQlptvoC06rqNhQ@Air-de-Roger>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi Roger,

On 12/04/2021 11:49, Roger Pau Monné wrote:
> On Fri, Apr 09, 2021 at 05:00:41PM +0100, Rahul Singh wrote:
>> MSI related code in the "passthrough/pci.c” file is not useful for ARM
>> when MSI interrupts are injected via GICv3 ITS.
>>
>> Therefore introducing the new flag CONFIG_PCI_MSI_INTERCEPT to gate the
>> MSI code for ARM in common code. Also move the arch-specific code to an
>> arch-specific directory and implement the stub version for the unused
>> code for ARM to avoid compilation error when HAS_PCI is enabled for ARM.
>>
>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>> ---
>> Changes since v1:
>>   - Rename CONFIG_HAS_PCI_MSI to CONFIG_PCI_MSI_INTERCEPT
>>   - Implement stub version of the unused function for ARM.
>>   - Move unneeded function to x86 file.
>> ---
>>   xen/arch/x86/msi.c            | 64 +++++++++++++++++++++++++++++++++++
>>   xen/drivers/passthrough/pci.c | 51 +++++++---------------------
>>   xen/drivers/pci/Kconfig       |  4 +++
>>   xen/drivers/vpci/Makefile     |  3 +-
>>   xen/drivers/vpci/header.c     | 19 +++--------
>>   xen/drivers/vpci/msix.c       | 25 ++++++++++++++
>>   xen/drivers/vpci/vpci.c       |  3 +-
>>   xen/include/asm-arm/msi.h     | 44 ++++++++++++++++++++++++
>>   xen/include/asm-x86/msi.h     |  4 +++
>>   xen/include/xen/pci.h         | 11 +++---
>>   xen/include/xen/vpci.h        | 24 ++++++++++++-
>>   xen/xsm/flask/hooks.c         |  8 ++---
>>   12 files changed, 195 insertions(+), 65 deletions(-)
>>   create mode 100644 xen/include/asm-arm/msi.h
>>
>> diff --git a/xen/arch/x86/msi.c b/xen/arch/x86/msi.c
>> index 5febc0ea4b..a6356f4a63 100644
>> --- a/xen/arch/x86/msi.c
>> +++ b/xen/arch/x86/msi.c
>> @@ -1411,6 +1411,70 @@ void __init early_msi_init(void)
>>           return;
>>   }
>>   
>> +int alloc_pci_msi(struct pci_dev *pdev)
> 
> I would rather name it pci_msi_init...
> 
>> +{
>> +    unsigned int pos;
>> +
>> +    INIT_LIST_HEAD(&pdev->msi_list);
>> +
>> +    pos = pci_find_cap_offset(pdev->seg, pdev->bus, PCI_SLOT(pdev->devfn),
>> +                              PCI_FUNC(pdev->devfn), PCI_CAP_ID_MSI);
>> +    if ( pos )
>> +    {
>> +        uint16_t ctrl = pci_conf_read16(pdev->sbdf, msi_control_reg(pos));
>> +
>> +        pdev->msi_maxvec = multi_msi_capable(ctrl);
>> +    }
>> +
>> +    pos = pci_find_cap_offset(pdev->seg, pdev->bus, PCI_SLOT(pdev->devfn),
>> +                              PCI_FUNC(pdev->devfn), PCI_CAP_ID_MSIX);
>> +    if ( pos )
>> +    {
>> +        struct arch_msix *msix = xzalloc(struct arch_msix);
>> +        uint16_t ctrl;
>> +
>> +        if ( !msix )
>> +            return -ENOMEM;
>> +
>> +        spin_lock_init(&msix->table_lock);
>> +
>> +        ctrl = pci_conf_read16(pdev->sbdf, msix_control_reg(pos));
>> +        msix->nr_entries = msix_table_size(ctrl);
>> +
>> +        pdev->msix = msix;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +void free_pci_msi(struct pci_dev *pdev)
> 
> ...and pci_msi_free.
> 
>> +{
>> +    xfree(pdev->msix);
>> +}
>> +
>> +int pci_assign_msix_init(struct domain *d, struct pci_dev *pdev)
> 
> This kind of a confusing name - what about pci_msix_assign?
> 
>> +{
>> +    int rc;
>> +
>> +    if ( pdev->msix )
>> +    {
>> +        rc = pci_reset_msix_state(pdev);
>> +        if ( rc )
>> +            return rc;
>> +        msixtbl_init(d);
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +void dump_pci_msi(struct pci_dev *pdev)
>> +{
>> +    struct msi_desc *msi;
>> +
>> +    list_for_each_entry ( msi, &pdev->msi_list, list )
>> +        printk("%d ", msi->irq);
>> +}
> 
> I wonder, those those function really want to be in a x86 specific
> file? There's nothing x86 specific about them AFAICT.
> 
> Would it make sense to create a separate msi-intercept.c file with
> those that gets included when CONFIG_PCI_MSI_INTERCEPT?
> 
>>   static void dump_msi(unsigned char key)
>>   {
>>       unsigned int irq;
>> diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
>> index 705137f8be..1b473502a1 100644
>> --- a/xen/drivers/passthrough/pci.c
>> +++ b/xen/drivers/passthrough/pci.c
>> @@ -314,6 +314,7 @@ static struct pci_dev *alloc_pdev(struct pci_seg *pseg, u8 bus, u8 devfn)
>>   {
>>       struct pci_dev *pdev;
>>       unsigned int pos;
>> +    int rc;
>>   
>>       list_for_each_entry ( pdev, &pseg->alldevs_list, alldevs_list )
>>           if ( pdev->bus == bus && pdev->devfn == devfn )
>> @@ -327,35 +328,12 @@ static struct pci_dev *alloc_pdev(struct pci_seg *pseg, u8 bus, u8 devfn)
>>       *((u8*) &pdev->bus) = bus;
>>       *((u8*) &pdev->devfn) = devfn;
>>       pdev->domain = NULL;
>> -    INIT_LIST_HEAD(&pdev->msi_list);
>> -
>> -    pos = pci_find_cap_offset(pseg->nr, bus, PCI_SLOT(devfn), PCI_FUNC(devfn),
>> -                              PCI_CAP_ID_MSI);
>> -    if ( pos )
>> -    {
>> -        uint16_t ctrl = pci_conf_read16(pdev->sbdf, msi_control_reg(pos));
>> -
>> -        pdev->msi_maxvec = multi_msi_capable(ctrl);
>> -    }
>>   
>> -    pos = pci_find_cap_offset(pseg->nr, bus, PCI_SLOT(devfn), PCI_FUNC(devfn),
>> -                              PCI_CAP_ID_MSIX);
>> -    if ( pos )
>> +    rc = alloc_pci_msi(pdev);
>> +    if ( rc )
>>       {
>> -        struct arch_msix *msix = xzalloc(struct arch_msix);
>> -        uint16_t ctrl;
>> -
>> -        if ( !msix )
>> -        {
>> -            xfree(pdev);
>> -            return NULL;
>> -        }
>> -        spin_lock_init(&msix->table_lock);
>> -
>> -        ctrl = pci_conf_read16(pdev->sbdf, msix_control_reg(pos));
>> -        msix->nr_entries = msix_table_size(ctrl);
>> -
>> -        pdev->msix = msix;
>> +        xfree(pdev);
>> +        return NULL;
>>       }
>>   
>>       list_add(&pdev->alldevs_list, &pseg->alldevs_list);
>> @@ -449,7 +427,7 @@ static void free_pdev(struct pci_seg *pseg, struct pci_dev *pdev)
>>       }
>>   
>>       list_del(&pdev->alldevs_list);
>> -    xfree(pdev->msix);
>> +    free_pci_msi(pdev);
>>       xfree(pdev);
>>   }
>>   
>> @@ -1271,7 +1249,6 @@ bool_t pcie_aer_get_firmware_first(const struct pci_dev *pdev)
>>   static int _dump_pci_devices(struct pci_seg *pseg, void *arg)
>>   {
>>       struct pci_dev *pdev;
>> -    struct msi_desc *msi;
>>   
>>       printk("==== segment %04x ====\n", pseg->nr);
>>   
>> @@ -1280,8 +1257,7 @@ static int _dump_pci_devices(struct pci_seg *pseg, void *arg)
>>           printk("%pp - %pd - node %-3d - MSIs < ",
>>                  &pdev->sbdf, pdev->domain,
>>                  (pdev->node != NUMA_NO_NODE) ? pdev->node : -1);
>> -        list_for_each_entry ( msi, &pdev->msi_list, list )
>> -               printk("%d ", msi->irq);
>> +        dump_pci_msi(pdev);
>>           printk(">\n");
>>       }
>>   
>> @@ -1303,12 +1279,15 @@ static int __init setup_dump_pcidevs(void)
>>   }
>>   __initcall(setup_dump_pcidevs);
>>   
>> +
>> +#ifdef CONFIG_PCI_MSI_INTERCEPT
>>   int iommu_update_ire_from_msi(
>>       struct msi_desc *msi_desc, struct msi_msg *msg)
>>   {
>>       return iommu_intremap
>>              ? iommu_call(&iommu_ops, update_ire_from_msi, msi_desc, msg) : 0;
>>   }
>> +#endif
> 
> This is not exactly related to MSI intercepts, the IOMMU interrupt
> remapping table will also be used for interrupt entries for devices
> being used by Xen directly, where no intercept is required.

On Arm, this is not tie to the IOMMU. Instead, this handled is a 
separate MSI controller (such as the ITS).

> 
> And then you also want to gate the hook from iommu_ops itself with
> CONFIG_PCI_MSI_INTERCEPT, if we want to got this route.


All the callers are in the x86 code. So how about moving the function in 
an x86 specific file?

>> diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
>> index 9f5b5d52e1..a6b12717b1 100644
>> --- a/xen/include/xen/vpci.h
>> +++ b/xen/include/xen/vpci.h
>> @@ -91,6 +91,7 @@ struct vpci {
>>           /* FIXME: currently there's no support for SR-IOV. */
>>       } header;
>>   
>> +#ifdef CONFIG_PCI_MSI_INTERCEPT
>>       /* MSI data. */
>>       struct vpci_msi {
>>         /* Address. */
>> @@ -136,6 +137,7 @@ struct vpci {
>>               struct vpci_arch_msix_entry arch;
>>           } entries[];
>>       } *msix;
>> +#endif /* CONFIG_PCI_MSI_INTERCEPT */
> 
> Note that here you just remove two pointers from the struct, not that
> I'm opposed to it, but it's not that much space that's saved anyway.
> Ie: it might also be fine to just leave them as NULL unconditionally
> on Arm.

Can the two pointers be NULL on x86? If not, then I would prefer if they 
disappear on Arm so there is less chance to make any mistake (such as 
unconditionally accessing the pointer in common code).

Cheers,

-- 
Julien Grall

