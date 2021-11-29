Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F4646116F
	for <lists+xen-devel@lfdr.de>; Mon, 29 Nov 2021 10:53:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.234412.406822 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrdKv-0000pN-JW; Mon, 29 Nov 2021 09:52:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 234412.406822; Mon, 29 Nov 2021 09:52:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrdKv-0000nT-GJ; Mon, 29 Nov 2021 09:52:37 +0000
Received: by outflank-mailman (input) for mailman id 234412;
 Mon, 29 Nov 2021 09:52:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KK+l=QQ=kaod.org=clg@srs-se1.protection.inumbo.net>)
 id 1mrdKt-0000nG-Px
 for xen-devel@lists.xenproject.org; Mon, 29 Nov 2021 09:52:35 +0000
Received: from 4.mo552.mail-out.ovh.net (4.mo552.mail-out.ovh.net
 [178.33.43.201]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 00a9dca8-50fa-11ec-b941-1df2895da90e;
 Mon, 29 Nov 2021 10:52:03 +0100 (CET)
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.217])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 70F5120ADA;
 Mon, 29 Nov 2021 09:52:31 +0000 (UTC)
Received: from kaod.org (37.59.142.104) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Mon, 29 Nov
 2021 10:52:29 +0100
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
X-Inumbo-ID: 00a9dca8-50fa-11ec-b941-1df2895da90e
Authentication-Results: garm.ovh; auth=pass (GARM-104R005f4bc25ac-e2d5-4f6a-8c28-ebe76ecd031f,
                    3279756C2EB34864E332BB908A933B747C53BE44) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <ee815cd9-03f3-02f2-a269-ad79ca2af742@kaod.org>
Date: Mon, 29 Nov 2021 10:52:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [patch 00/22] genirq/msi, PCI/MSI: Spring cleaning - Part 1
Content-Language: en-US
To: Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>
CC: <linux-hyperv@vger.kernel.org>, Paul Mackerras <paulus@samba.org>,
	<sparclinux@vger.kernel.org>, Wei Liu <wei.liu@kernel.org>, Ashok Raj
	<ashok.raj@intel.com>, Marc Zygnier <maz@kernel.org>, <x86@kernel.org>,
	Christian Borntraeger <borntraeger@de.ibm.com>, Bjorn Helgaas
	<helgaas@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>,
	<linux-pci@vger.kernel.org>, <xen-devel@lists.xenproject.org>,
	<ath11k@lists.infradead.org>, Kevin Tian <kevin.tian@intel.com>, Heiko
 Carstens <hca@linux.ibm.com>, Alex Williamson <alex.williamson@redhat.com>,
	Megha Dey <megha.dey@intel.com>, Juergen Gross <jgross@suse.com>, Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, <linux-mips@vger.kernel.org>,
	<linuxppc-dev@lists.ozlabs.org>
References: <20211126222700.862407977@linutronix.de>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20211126222700.862407977@linutronix.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG4EX1.mxp5.local (172.16.2.31) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 03ae1f15-2efb-4469-b086-6ab00679dc25
X-Ovh-Tracer-Id: 11736099157494238108
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrheelgddtlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpefgtdehvdejkefhudevkeekffekleetfeeftdekudeliedujeeftdeikeffvefgfeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheplhhinhhugihpphgtqdguvghvsehlihhsthhsrdhoiihlrggsshdrohhrgh

On 11/27/21 02:18, Thomas Gleixner wrote:
> The [PCI] MSI code has gained quite some warts over time. A recent
> discussion unearthed a shortcoming: the lack of support for expanding
> PCI/MSI-X vectors after initialization of MSI-X.
> 
> PCI/MSI-X has no requirement to setup all vectors when MSI-X is enabled in
> the device. The non-used vectors have just to be masked in the vector
> table. For PCI/MSI this is not possible because the number of vectors
> cannot be changed after initialization.
> 
> The PCI/MSI code, but also the core MSI irq domain code are built around
> the assumption that all required vectors are installed at initialization
> time and freed when the device is shut down by the driver.
>
> Supporting dynamic expansion at least for MSI-X is important for VFIO so
> that the host side interrupts for passthrough devices can be installed on
> demand.
> 
> This is the first part of a large (total 101 patches) series which
> refactors the [PCI]MSI infrastructure to make runtime expansion of MSI-X
> vectors possible. The last part (10 patches) provide this functionality.
> 
> The first part is mostly a cleanup which consolidates code, moves the PCI
> MSI code into a separate directory and splits it up into several parts.
> 
> No functional change intended except for patch 2/N which changes the
> behaviour of pci_get_vector()/affinity() to get rid of the assumption that
> the provided index is the "index" into the descriptor list instead of using
> it as the actual MSI[X] index as seen by the hardware. This would break
> users of sparse allocated MSI-X entries, but non of them use these
> functions.
> 
> This series is based on 5.16-rc2 and also available via git:
> 
>       git://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git msi-v1-part-1
> 
> For the curious who can't wait for the next part to arrive the full series
> is available via:
> 
>       git://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git msi-v1-part-4

After fixing the compile failures, I didn't see any regressions on
these platforms :

   PowerNV, pSeries under KVM and PowerVM, using POWER8/9 processors.

Thanks,

C.

> Thanks,
> 
> 	tglx
> ---
>   arch/powerpc/platforms/4xx/msi.c            |  281 ------------
>   b/Documentation/driver-api/pci/pci.rst      |    2
>   b/arch/mips/pci/msi-octeon.c                |   32 -
>   b/arch/powerpc/platforms/4xx/Makefile       |    1
>   b/arch/powerpc/platforms/cell/axon_msi.c    |    2
>   b/arch/powerpc/platforms/powernv/pci-ioda.c |    4
>   b/arch/powerpc/platforms/pseries/msi.c      |    6
>   b/arch/powerpc/sysdev/Kconfig               |    6
>   b/arch/s390/pci/pci_irq.c                   |    4
>   b/arch/sparc/kernel/pci_msi.c               |    4
>   b/arch/x86/hyperv/irqdomain.c               |   55 --
>   b/arch/x86/include/asm/x86_init.h           |    6
>   b/arch/x86/include/asm/xen/hypervisor.h     |    8
>   b/arch/x86/kernel/apic/msi.c                |    8
>   b/arch/x86/kernel/x86_init.c                |   12
>   b/arch/x86/pci/xen.c                        |   19
>   b/drivers/irqchip/irq-gic-v2m.c             |    1
>   b/drivers/irqchip/irq-gic-v3-its-pci-msi.c  |    1
>   b/drivers/irqchip/irq-gic-v3-mbi.c          |    1
>   b/drivers/net/wireless/ath/ath11k/pci.c     |    2
>   b/drivers/pci/Makefile                      |    3
>   b/drivers/pci/msi/Makefile                  |    7
>   b/drivers/pci/msi/irqdomain.c               |  267 +++++++++++
>   b/drivers/pci/msi/legacy.c                  |   79 +++
>   b/drivers/pci/msi/msi.c                     |  645 ++++------------------------
>   b/drivers/pci/msi/msi.h                     |   39 +
>   b/drivers/pci/msi/pcidev_msi.c              |   43 +
>   b/drivers/pci/pci-sysfs.c                   |    7
>   b/drivers/pci/xen-pcifront.c                |    2
>   b/include/linux/msi.h                       |  135 ++---
>   b/include/linux/pci.h                       |    1
>   b/kernel/irq/msi.c                          |   41 +
>   32 files changed, 696 insertions(+), 1028 deletions(-)
> 


