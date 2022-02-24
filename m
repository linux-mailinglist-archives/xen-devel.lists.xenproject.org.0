Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5274C2919
	for <lists+xen-devel@lfdr.de>; Thu, 24 Feb 2022 11:17:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.278071.475174 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNBBK-0008J6-8Q; Thu, 24 Feb 2022 10:17:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 278071.475174; Thu, 24 Feb 2022 10:17:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNBBK-0008Gu-4U; Thu, 24 Feb 2022 10:17:06 +0000
Received: by outflank-mailman (input) for mailman id 278071;
 Thu, 24 Feb 2022 10:17:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hD/W=TH=arm.com=anshuman.khandual@srs-se1.protection.inumbo.net>)
 id 1nNBBI-0008Gm-M7
 for xen-devel@lists.xenproject.org; Thu, 24 Feb 2022 10:17:04 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id e8a231ef-955a-11ec-8eb8-a37418f5ba1a;
 Thu, 24 Feb 2022 11:17:03 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E30E4ED1;
 Thu, 24 Feb 2022 02:17:01 -0800 (PST)
Received: from [10.163.48.178] (unknown [10.163.48.178])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E609A3F70D;
 Thu, 24 Feb 2022 02:16:54 -0800 (PST)
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
X-Inumbo-ID: e8a231ef-955a-11ec-8eb8-a37418f5ba1a
From: Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH 10/11] swiotlb: merge swiotlb-xen initialization into
 swiotlb
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
 <20220222153514.593231-11-hch@lst.de>
Message-ID: <e5564871-694e-58ea-a355-5d0c3ce5d025@arm.com>
Date: Thu, 24 Feb 2022 15:46:55 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20220222153514.593231-11-hch@lst.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 2/22/22 9:05 PM, Christoph Hellwig wrote:
> Allow to pass a remap argument to the swiotlb initialization functions
> to handle the Xen/x86 remap case.  ARM/ARM64 never did any remapping
> from xen_swiotlb_fixup, so we don't even need that quirk.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  arch/arm/xen/mm.c               |  23 +++---
>  arch/x86/include/asm/xen/page.h |   5 --
>  arch/x86/kernel/pci-dma.c       |  27 ++++---
>  arch/x86/pci/sta2x11-fixup.c    |   2 +-
>  drivers/xen/swiotlb-xen.c       | 128 +-------------------------------
>  include/linux/swiotlb.h         |   7 +-
>  include/xen/arm/page.h          |   1 -
>  include/xen/swiotlb-xen.h       |   8 +-
>  kernel/dma/swiotlb.c            | 120 +++++++++++++++---------------
>  9 files changed, 102 insertions(+), 219 deletions(-)

checkpatch.pl has some warnings here.

ERROR: trailing whitespace
#151: FILE: arch/x86/kernel/pci-dma.c:217:
+ $

WARNING: please, no spaces at the start of a line
#151: FILE: arch/x86/kernel/pci-dma.c:217:
+ $

total: 1 errors, 1 warnings, 470 lines checked

