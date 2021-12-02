Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB8C465B89
	for <lists+xen-devel@lfdr.de>; Thu,  2 Dec 2021 02:08:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.236281.409856 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msaaA-0003sN-At; Thu, 02 Dec 2021 01:08:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 236281.409856; Thu, 02 Dec 2021 01:08:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msaaA-0003pZ-7L; Thu, 02 Dec 2021 01:08:18 +0000
Received: by outflank-mailman (input) for mailman id 236281;
 Thu, 02 Dec 2021 01:08:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ufdD=QT=intel.com=megha.dey@srs-se1.protection.inumbo.net>)
 id 1msaa8-0003pT-IW
 for xen-devel@lists.xenproject.org; Thu, 02 Dec 2021 01:08:16 +0000
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 51349ba5-530c-11ec-b1df-f38ee3fbfdf7;
 Thu, 02 Dec 2021 02:08:13 +0100 (CET)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2021 17:08:10 -0800
Received: from meghadey-mobl1.amr.corp.intel.com (HELO [10.213.191.214])
 ([10.213.191.214])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2021 17:08:09 -0800
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
X-Inumbo-ID: 51349ba5-530c-11ec-b1df-f38ee3fbfdf7
X-IronPort-AV: E=McAfee;i="6200,9189,10185"; a="216611002"
X-IronPort-AV: E=Sophos;i="5.87,280,1631602800"; 
   d="scan'208";a="216611002"
X-IronPort-AV: E=Sophos;i="5.87,280,1631602800"; 
   d="scan'208";a="602514884"
Message-ID: <7ad200fa-dda3-4932-cd23-ad6e79288ea4@intel.com>
Date: Wed, 1 Dec 2021 17:08:01 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [patch 09/10] PCI/MSI: Provide pci_msix_expand_vectors[_at]()
Content-Language: en-US
To: Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Marc Zygnier <maz@kernel.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Kevin Tian <kevin.tian@intel.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Ashok Raj <ashok.raj@intel.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Andrew Cooper <amc96@cam.ac.uk>, Juergen Gross <jgross@suse.com>,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org
References: <20211126233124.618283684@linutronix.de>
 <20211127000919.004572849@linutronix.de>
From: "Dey, Megha" <megha.dey@intel.com>
In-Reply-To: <20211127000919.004572849@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Thomas,
On 11/26/2021 5:25 PM, Thomas Gleixner wrote:
> Provide a new interface which allows to expand the MSI-X vector space if
> the underlying irq domain implementation supports it.
>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> ---
>   drivers/pci/msi/msi.c |   41 +++++++++++++++++++++++++++++++++++++++++
>   include/linux/pci.h   |   13 +++++++++++++
>   2 files changed, 54 insertions(+)
>
> --- a/drivers/pci/msi/msi.c
> +++ b/drivers/pci/msi/msi.c
> @@ -1025,6 +1025,47 @@ int pci_alloc_irq_vectors_affinity(struc
>   EXPORT_SYMBOL(pci_alloc_irq_vectors_affinity);
>   
>   /**
> + * pci_msix_expand_vectors_at - Expand MSI-X interrupts for a device
> + *
> + * @dev:	PCI device to operate on
> + * @at:		Allocate at MSI-X index. If @at == PCI_MSI_EXPAND_AUTO
> + *		the function expands automatically after the last
Not sure why some of these changes related to PCI_MSIX_EXPAND_AUTO and 
num_descs did not make it to the 'msi' branch.
Is this intentional?
> + *		active index.
> + * @nvec:	Number of vectors to allocate
> + *
> + * Expand the MSI-X vectors of a device after an initial enablement and
> + * allocation.
> + *
> + * Return: 0 if the allocation was successful, an error code otherwise.
> + */
> +int pci_msix_expand_vectors_at(struct pci_dev *dev, unsigned int at, unsigned int nvec)
> +{
> +	struct msi_device_data *md = dev->dev.msi.data;
> +	struct msi_range range = { .ndesc = nvec, };
> +	unsigned int max_vecs;
> +	int ret;
> +
> +	if (!pci_msi_enable || !dev || !dev->msix_enabled || !md)
> +		return -ENOTSUPP;
> +
> +	if (!pci_msi_domain_supports_expand(dev))
> +		return -ENOTSUPP;
> +
> +	max_vecs = pci_msix_vec_count(dev);
> +	if (!nvec || nvec > max_vecs)
> +		return -EINVAL;
> +
> +	range.first = at == PCI_MSIX_EXPAND_AUTO ? md->num_descs : at;
> +
> +	if (range.first >= max_vecs || nvec > max_vecs - range.first)
> +		return -ENOSPC;
> +
> +	ret = msix_setup_interrupts(dev, dev->msix_base, &range, NULL, NULL, true);
> +	return ret <= 0 ? ret : -ENOSPC;;
> +}
> +EXPORT_SYMBOL_GPL(pci_msix_expand_vectors_at);
> +
I am having trouble fully comprehending how this expansion scheme would 
work..

For instance, say:
1. Driver requests for 5 vectors:
pci_enable_msix_range(dev, NULL, 5, 5)
=>num_descs = 5

2. Driver frees vectors at index 1,2:
range = {1, 2, 2};
pci_msi_teardown_msi_irqs(dev, range)
=>num_descs = 3; Current active vectors are at index: 0, 3, 4

3. Driver requests for 3 more vectors using the new API:
pci_msix_expand_vectors(dev, 3)
=>range.first = 3 => It will try to allocate index 3-5, but we already 
have 3,4 active?
Ideally, we would want index 1,2 and 5 to be allocated for this request 
right?

Could you please let me know what I am missing?

With the 'range' approach, the issue is that we are trying to allocate 
contiguous indexes. Perhaps, we also need to check if all the indexes in 
the requested range are available,
if not, find a contiguous range large enough to accommodate the request. 
But there will be fragmentation issues if we choose to go with this way...

I had a version of the dynamic MSI-X patch series (which never got sent 
out). For the expansion, I had the following:
pci_add_msix_irq_vector(pdev): On each invocation, add 1 MSI-X vector to 
the device and return the msi-x index assigned by the kernel (using a 
bitmap)
Correspondingly, pci_free_msix_irq_vector(pdev, irq) frees all the 
allocated resources associated with MSI-X interrupt with Linux IRQ 
number 'irq'.
I had issues when trying to dynamically allocate more than 1 interrupt 
because I didn't have a clean way to communicate to the driver what 
indexes were assigned in the current allocation.

-Megha
>

