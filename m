Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C740649E272
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jan 2022 13:37:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261440.452678 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD41A-0000YV-NG; Thu, 27 Jan 2022 12:36:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261440.452678; Thu, 27 Jan 2022 12:36:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD41A-0000W8-JW; Thu, 27 Jan 2022 12:36:48 +0000
Received: by outflank-mailman (input) for mailman id 261440;
 Thu, 27 Jan 2022 12:36:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nD419-0000W2-UC
 for xen-devel@lists.xenproject.org; Thu, 27 Jan 2022 12:36:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nD418-0007iy-Rp; Thu, 27 Jan 2022 12:36:46 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.9.172]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nD418-0008JX-J0; Thu, 27 Jan 2022 12:36:46 +0000
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
	bh=dRf7NYrtscc1cf6dd5B2HAqYl2hJywvb0E/fQzYI7jM=; b=Jop1sEMzeKmp5w6VCSMW+dxhO9
	vHe96O+H0h7us/c77NFhqbwyEd1d29fvvrCJSwQWcZBHzzSoPp3QknNnYzOA48ijlF97lh6KAV01b
	aweX5I4DlDvzhk6Lga0aOL9ctkv10z6Ze4wKUDB30X6yJZLu6pDtfD99ONV7etSBnQdE=;
Message-ID: <485dd117-f8f0-e0fc-e3bc-7e430813648e@xen.org>
Date: Thu, 27 Jan 2022 12:36:44 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH V2 00/10] Add support for Renesas R-Car S4 IPMMU and other
 misc changes
To: Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Jan Beulich
 <jbeulich@suse.com>, Paul Durrant <paul@xen.org>,
 Rahul Singh <rahul.singh@arm.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
References: <1640034957-19764-1-git-send-email-olekstysh@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <1640034957-19764-1-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 20/12/2021 21:15, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> Hello all.
> 
> You can find the V1 patch series at [1].
> 
> The R-Car S4 is an automotive System-on-Chip (SoC) for Car Server/Communication
> Gateway and is one of the first products in Renesas’ 4th-generation R-Car Family.
> 
> The integrated IOMMU HW is also VMSA-compatible and supports stage 2 translation
> table format, therefore can be used with current R-Car Gen3 driver with slight
> modifications.
> 
> In the context of Xen driver the main differences between Gen3 and Gen4 are
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
> The patch series is based on the latest staging branch
> "f3999bc2e099 arm/efi: Handle Xen bootargs from both xen.cfg and DT"
> and also available at [2].
> 
> Tested on Renesas Salvator-X board with H3 ES3.0 SoC (Gen3) and Renesas Spider
> board with S4 SoC (Gen4).
> 
> [1] https://lore.kernel.org/all/1638035505-16931-1-git-send-email-olekstysh@gmail.com/
> [2] https://github.com/otyshchenko1/xen/commits/s4_ipmmu_ml2
> 
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

For the first 8 patches:

Acked-by: Julien Grall <jgrall@amazon.com>

I have also committed them. The last..

>    iommu/ipmmu-vmsa: Use refcount for the micro-TLBs
>    iommu/arm: Remove code duplication in all IOMMU drivers

... 2 patches have some comments. So I have committed them yet.

Cheers,

-- 
Julien Grall

