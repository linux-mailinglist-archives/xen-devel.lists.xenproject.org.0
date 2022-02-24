Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8D64C2925
	for <lists+xen-devel@lfdr.de>; Thu, 24 Feb 2022 11:19:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.278081.475184 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNBDG-0000YG-OJ; Thu, 24 Feb 2022 10:19:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 278081.475184; Thu, 24 Feb 2022 10:19:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNBDG-0000W7-LE; Thu, 24 Feb 2022 10:19:06 +0000
Received: by outflank-mailman (input) for mailman id 278081;
 Thu, 24 Feb 2022 10:19:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hD/W=TH=arm.com=anshuman.khandual@srs-se1.protection.inumbo.net>)
 id 1nNBDF-0000W1-7g
 for xen-devel@lists.xenproject.org; Thu, 24 Feb 2022 10:19:05 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 30f6b1f7-955b-11ec-8eb8-a37418f5ba1a;
 Thu, 24 Feb 2022 11:19:04 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 44D891476;
 Thu, 24 Feb 2022 02:19:03 -0800 (PST)
Received: from [10.163.48.178] (unknown [10.163.48.178])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BAE743F70D;
 Thu, 24 Feb 2022 02:18:56 -0800 (PST)
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
X-Inumbo-ID: 30f6b1f7-955b-11ec-8eb8-a37418f5ba1a
From: Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH 07/11] x86: remove the IOMMU table infrastructure
To: Christoph Hellwig <hch@lst.de>, iommu@lists.linux-foundation.org
Cc: x86@kernel.org, Stefano Stabellini <sstabellini@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross
 <jgross@suse.com>, Joerg Roedel <joro@8bytes.org>,
 David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org,
 xen-devel@lists.xenproject.org, linux-ia64@vger.kernel.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-hyperv@vger.kernel.org, tboot-devel@lists.sourceforge.net,
 linux-pci@vger.kernel.org
References: <20220222153514.593231-1-hch@lst.de>
 <20220222153514.593231-8-hch@lst.de>
Message-ID: <ff355270-b389-0f7a-e384-7c8a9ed9c615@arm.com>
Date: Thu, 24 Feb 2022 15:48:59 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20220222153514.593231-8-hch@lst.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit


On 2/22/22 9:05 PM, Christoph Hellwig wrote:
> The IOMMU table tries to separate the different IOMMUs into different
> backends, but actually requires various cross calls.
> 
> Rewrite the code to do the generic swiotlb/swiotlb-xen setup directly
> in pci-dma.c and then just call into the IOMMU drivers.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  arch/ia64/include/asm/iommu_table.h    |   7 --
>  arch/x86/include/asm/dma-mapping.h     |   1 -
>  arch/x86/include/asm/gart.h            |   5 +-
>  arch/x86/include/asm/iommu.h           |   6 ++
>  arch/x86/include/asm/iommu_table.h     | 102 ----------------------
>  arch/x86/include/asm/swiotlb.h         |  30 -------
>  arch/x86/include/asm/xen/swiotlb-xen.h |   2 -
>  arch/x86/kernel/Makefile               |   2 -
>  arch/x86/kernel/amd_gart_64.c          |   5 +-
>  arch/x86/kernel/aperture_64.c          |  14 ++--
>  arch/x86/kernel/pci-dma.c              | 112 ++++++++++++++++++++-----
>  arch/x86/kernel/pci-iommu_table.c      |  77 -----------------
>  arch/x86/kernel/pci-swiotlb.c          |  77 -----------------
>  arch/x86/kernel/tboot.c                |   1 -
>  arch/x86/kernel/vmlinux.lds.S          |  12 ---
>  arch/x86/xen/Makefile                  |   2 -
>  arch/x86/xen/pci-swiotlb-xen.c         |  96 ---------------------
>  drivers/iommu/amd/init.c               |   6 --
>  drivers/iommu/amd/iommu.c              |   5 +-
>  drivers/iommu/intel/dmar.c             |   6 +-
>  include/linux/dmar.h                   |   6 +-
>  21 files changed, 115 insertions(+), 459 deletions(-)
>  delete mode 100644 arch/ia64/include/asm/iommu_table.h
>  delete mode 100644 arch/x86/include/asm/iommu_table.h
>  delete mode 100644 arch/x86/include/asm/swiotlb.h
>  delete mode 100644 arch/x86/kernel/pci-iommu_table.c
>  delete mode 100644 arch/x86/kernel/pci-swiotlb.c
>  delete mode 100644 arch/x86/xen/pci-swiotlb-xen.c

checkpatch.pl has some warnings here.

WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
#44: 
deleted file mode 100644

WARNING: Prefer [subsystem eg: netdev]_info([subsystem]dev, ... then dev_info(dev, ... then pr_info(...  to printk(KERN_INFO ...
#496: FILE: arch/x86/kernel/pci-dma.c:171:
+               printk(KERN_INFO "PCI-DMA: "

WARNING: quoted string split across lines
#497: FILE: arch/x86/kernel/pci-dma.c:172:
+               printk(KERN_INFO "PCI-DMA: "
+                      "Using software bounce buffering for IO (SWIOTLB)\n");

ERROR: trailing whitespace
#881: FILE: drivers/iommu/amd/iommu.c:1837:
+^Iif (iommu_default_passthrough() || sme_me_mask) $

total: 1 errors, 3 warnings, 389 lines checked

