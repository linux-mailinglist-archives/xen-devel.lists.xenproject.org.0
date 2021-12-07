Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 617DF46B690
	for <lists+xen-devel@lfdr.de>; Tue,  7 Dec 2021 10:04:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.240751.417452 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muWOr-00072V-BN; Tue, 07 Dec 2021 09:04:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 240751.417452; Tue, 07 Dec 2021 09:04:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muWOr-00070l-7e; Tue, 07 Dec 2021 09:04:37 +0000
Received: by outflank-mailman (input) for mailman id 240751;
 Tue, 07 Dec 2021 09:04:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Lsp=QY=kaod.org=clg@srs-se1.protection.inumbo.net>)
 id 1muWOp-00070M-EL
 for xen-devel@lists.xenproject.org; Tue, 07 Dec 2021 09:04:35 +0000
Received: from smtpout1.mo529.mail-out.ovh.net
 (smtpout1.mo529.mail-out.ovh.net [178.32.125.2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b212f59c-573c-11ec-a5e1-b9374ead2679;
 Tue, 07 Dec 2021 10:04:34 +0100 (CET)
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.10])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 6A935D049F4A;
 Tue,  7 Dec 2021 10:04:32 +0100 (CET)
Received: from kaod.org (37.59.142.106) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Tue, 7 Dec
 2021 10:04:31 +0100
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
X-Inumbo-ID: b212f59c-573c-11ec-a5e1-b9374ead2679
Authentication-Results: garm.ovh; auth=pass (GARM-106R0069db82c91-8ffc-40c1-834f-54b27e3d161a,
                    EDCC1E77E28A65BD51DFCD2B92BF934EEA10E5FB) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <6f06c9f0-1f8f-e467-b0fb-2f9985d5be0d@kaod.org>
Date: Tue, 7 Dec 2021 10:04:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [patch V2 18/36] genirq/msi: Add msi_device_data::properties
Content-Language: en-US
To: Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>
CC: Bjorn Helgaas <helgaas@kernel.org>, Marc Zygnier <maz@kernel.org>, Alex
 Williamson <alex.williamson@redhat.com>, Kevin Tian <kevin.tian@intel.com>,
	Jason Gunthorpe <jgg@nvidia.com>, Megha Dey <megha.dey@intel.com>, Ashok Raj
	<ashok.raj@intel.com>, <linux-pci@vger.kernel.org>,
	<xen-devel@lists.xenproject.org>, Juergen Gross <jgross@suse.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Will Deacon <will@kernel.org>,
	Santosh Shilimkar <ssantosh@kernel.org>, <iommu@lists.linux-foundation.org>,
	<dmaengine@vger.kernel.org>, Stuart Yoder <stuyoder@gmail.com>, Laurentiu
 Tudor <laurentiu.tudor@nxp.com>, Nishanth Menon <nm@ti.com>, Tero Kristo
	<kristo@kernel.org>, <linux-arm-kernel@lists.infradead.org>, Vinod Koul
	<vkoul@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Robin Murphy
	<robin.murphy@arm.com>, Sinan Kaya <okaya@kernel.org>
References: <20211206210307.625116253@linutronix.de>
 <20211206210438.634566968@linutronix.de>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20211206210438.634566968@linutronix.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG7EX1.mxp5.local (172.16.2.61) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 54d35201-a336-42e9-8bf0-607650fe0e93
X-Ovh-Tracer-Id: 2567051788950997986
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrjeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieegvdffkeegfeetuddttddtveduiefhgeduffekiedtkeekteekhfffleevleelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepohhkrgihrgeskhgvrhhnvghlrdhorhhg

Hello Thomas,

On 12/6/21 23:39, Thomas Gleixner wrote:
> Add a properties field which allows core code to store information for easy
> retrieval in order to replace MSI descriptor fiddling.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> ---
> V2: Add a setter function to prepare for future changes
> ---
>   include/linux/msi.h |   17 +++++++++++++++++
>   kernel/irq/msi.c    |   24 ++++++++++++++++++++++++
>   2 files changed, 41 insertions(+)
> 
> --- a/include/linux/msi.h
> +++ b/include/linux/msi.h
> @@ -4,6 +4,7 @@
>   
>   #include <linux/cpumask.h>
>   #include <linux/list.h>
> +#include <linux/bits.h>
>   #include <asm/msi.h>
>   
>   /* Dummy shadow structures if an architecture does not define them */
> @@ -153,6 +154,22 @@ struct msi_device_data {
>   
>   int msi_setup_device_data(struct device *dev);
>   
> +/* MSI device properties */
> +#define MSI_PROP_PCI_MSI		BIT(0)
> +#define MSI_PROP_PCI_MSIX		BIT(1)
> +#define MSI_PROP_64BIT			BIT(2)
> +
> +#ifdef CONFIG_GENERIC_MSI_IRQ
> +bool msi_device_has_property(struct device *dev, unsigned long prop);
> +void msi_device_set_properties(struct device *dev, unsigned long prop);
> +#else
> +static inline bool msi_device_has_property(struct device *dev, unsigned long prop)
> +{
> +	return false;
> +}
> +static inline void msi_device_set_properties(struct device *dev, unsigned long prop) { }
> +#endif
> +
>   /* Helpers to hide struct msi_desc implementation details */
>   #define msi_desc_to_dev(desc)		((desc)->dev)
>   #define dev_to_msi_list(dev)		(&(dev)->msi_list)
> --- a/kernel/irq/msi.c
> +++ b/kernel/irq/msi.c
> @@ -60,6 +60,30 @@ void free_msi_entry(struct msi_desc *ent
>   	kfree(entry);
>   }
>   
> +/**
> + * msi_device_set_properties - Set device specific MSI properties
> + * @dev:	Pointer to the device which is queried
> + * @prop:	Properties to set
> + */
> +void msi_device_set_properties(struct device *dev, unsigned long prop)
> +{
> +	if (WARN_ON_ONCE(!dev->msi.data))
> +		return ;
> +	dev->msi.data->properties = 0;
It would work better if the prop variable was used instead of 0.

With that fixed,

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> +}
> +
> +/**
> + * msi_device_has_property - Check whether a device has a specific MSI property
> + * @dev:	Pointer to the device which is queried
> + * @prop:	Property to check for
> + */
> +bool msi_device_has_property(struct device *dev, unsigned long prop)
> +{
> +	if (!dev->msi.data)
> +		return false;
> +	return !!(dev->msi.data->properties & prop);
> +}
> +
>   void __get_cached_msi_msg(struct msi_desc *entry, struct msi_msg *msg)
>   {
>   	*msg = entry->msg;
> 


