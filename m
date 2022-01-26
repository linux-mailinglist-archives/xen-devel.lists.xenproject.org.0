Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C49D049CF81
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jan 2022 17:20:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261014.451475 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCl1p-000465-H2; Wed, 26 Jan 2022 16:20:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261014.451475; Wed, 26 Jan 2022 16:20:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCl1p-00044B-Db; Wed, 26 Jan 2022 16:20:13 +0000
Received: by outflank-mailman (input) for mailman id 261014;
 Wed, 26 Jan 2022 16:20:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nCl1n-000445-TA
 for xen-devel@lists.xenproject.org; Wed, 26 Jan 2022 16:20:11 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nCl1m-0006cg-JI; Wed, 26 Jan 2022 16:20:10 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224] helo=[10.95.98.192])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nCl1m-0006TL-Al; Wed, 26 Jan 2022 16:20:10 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=Yismv3/yiYujs5ihB2oc+mXqXHNdmCkMAaaPblwfTPM=; b=5omN7l5RUD2atqyDXe8X/3VQ6b
	ungVynUM/CWJRTco4v46uCA+eK2UNYtfLsNLq+BZ3BoAWcQKZP70gktdmtgld/CgSKlin72GMASDR
	fslwhcFHYjKL5vOfMfCcMAJNsMPMP8yxh6+dC+KZ6iLCT9vR0pW/EA+NzZAHtlwpgLHQ=;
Message-ID: <e2c94aba-8636-cebe-b90a-bcc19affd061@xen.org>
Date: Wed, 26 Jan 2022 16:20:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH 00/10] Add support for Renesas R-Car S4 IPMMU and other
 misc changes
To: Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Jan Beulich
 <jbeulich@suse.com>, Paul Durrant <paul@xen.org>,
 Rahul Singh <rahul.singh@arm.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
References: <1638035505-16931-1-git-send-email-olekstysh@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <1638035505-16931-1-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Oleksandr,

On 27/11/2021 17:51, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> The R-Car S4 is an automotive System-on-Chip (SoC) for Car Server/Communication
> Gateway and is one of the first products in Renesas’ 4th-generation R-Car Family.
> 
> The integrated IOMMU HW is also VMSA-compatible and supports stage 2 translation
> table format, therefore can be used with current R-Car Gen3 driver with slight
> modifications.
> 
> In the context of Xen driver the main differences between Gen3 and S4 are
> the following:
>   - HW capacity was enlarged to support up to 16 IPMMU contexts (sets of page table)
>     and up to 64 micro-TLBs per IPMMU device
>   - the memory mapped registers have different bases and offset
> 
> The first part (commits #1-6) is a non-verbatim port of Linux upstream commits
> needed to add support for S4 series easily (prereq work).
> The second part (commits #7-8) is based on the code from the Renesas BSP and
> actually introduces support for R-Car S4 IPMMU.
> The third part (commits #9-10) is misc changes I have locally.
> 
> The patch series is based on 4.16.0-rc4 branch and also available at [1].
> 
> Tested on Renesas Salvator-X board with H3 ES3.0 SoC (Gen3) and Renesas Spider
> board with S4 SoC.
> 
> [1] https://github.com/otyshchenko1/xen/commits/s4_ipmmu_ml1
> 
> Oleksandr Tyshchenko (10):
>    iommu/ipmmu-vmsa: Remove all unused register definitions
>    iommu/ipmmu-vmsa: Add helper functions for MMU "context" registers
>    iommu/ipmmu-vmsa: Add helper functions for "uTLB" registers
>    iommu/ipmmu-vmsa: Add light version of Linux's ipmmu_features
>    iommu/ipmmu-vmsa: Calculate context registers' offset instead of a
>      macro
>    iommu/ipmmu-vmsa: Add utlb_offset_base
>    iommu/ipmmu-vmsa: Add Renesas R8A779F0 (R-Car S4) support
>    iommu/ipmmu-vmsa: Set IPMMU bit IMSCTLR_USE_SECGRP to 0
>    iommu/ipmmu-vmsa: Use refcount for the micro-TLBs
>    iommu/arm: Remove code duplication in all IOMMU drivers

Skimming through the series, it looks like patch #1 - #6 are fully 
acked. The rest would need a respin.

Can I commit the first part (i.e. #1 - #6)?

Cheers,

> 
>   xen/drivers/passthrough/Kconfig          |   6 +-
>   xen/drivers/passthrough/arm/iommu.c      |   7 +
>   xen/drivers/passthrough/arm/ipmmu-vmsa.c | 278 +++++++++++++++++++------------
>   xen/drivers/passthrough/arm/smmu-v3.c    |  10 --
>   xen/drivers/passthrough/arm/smmu.c       |  10 --
>   5 files changed, 178 insertions(+), 133 deletions(-)
> 

-- 
Julien Grall

