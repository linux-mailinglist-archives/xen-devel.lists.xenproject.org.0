Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FFD2674769
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jan 2023 00:49:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.481398.746251 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIee5-00052A-T2; Thu, 19 Jan 2023 23:48:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 481398.746251; Thu, 19 Jan 2023 23:48:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIee5-00050R-OZ; Thu, 19 Jan 2023 23:48:37 +0000
Received: by outflank-mailman (input) for mailman id 481398;
 Thu, 19 Jan 2023 23:48:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PYO0=5Q=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pIee4-00050L-TM
 for xen-devel@lists.xenproject.org; Thu, 19 Jan 2023 23:48:36 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c8bb61b4-9853-11ed-b8d1-410ff93cb8f0;
 Fri, 20 Jan 2023 00:48:34 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2CF6861DAE;
 Thu, 19 Jan 2023 23:48:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AEE2C433EF;
 Thu, 19 Jan 2023 23:48:31 +0000 (UTC)
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
X-Inumbo-ID: c8bb61b4-9853-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674172112;
	bh=Y6cgie6a/AHyF2qixHdESjUV1kOnUWCgvxOZLc5QUlU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=CcV1oZtAh9dKtmRLx71dszZTl1+s3DCPmWHKkDF+I4207mIfIrlc8yg0mfDucTPqf
	 kZobwDaWYIRVUbHw9d64BqoB9PluGrNxZBt9BA8tzanDxFbP2ERI9XJHdRoBkErtZ4
	 OGJ1c/1EBTvPo04oRf2ZcJeueYLU4NZxDItPNV56uDgztvU0WTX39DZni4xQ4F3XPJ
	 rVGenO29kdk7Hf/R/WtiNbn0V2CkIXh/ROKzVXWx6qz1TiYKNqboLpC6yMiVoAp2Zd
	 8lxv71Uq63+GzBSWBjP7dNjz6WHCoNDleFjrw/KAKPoscn1f9oY7AFMZZpRyvrH+ZH
	 MoVmhsMYay3ig==
Date: Thu, 19 Jan 2023 15:48:29 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Ayan Kumar Halder <ayankuma@amd.com>, sstabellini@kernel.org, 
    stefano.stabellini@amd.com, julien@xen.org, Volodymyr_Babchuk@epam.com, 
    bertrand.marquis@arm.com, xen-devel@lists.xenproject.org, 
    Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Subject: Re: [XEN v2 09/11] xen/arm: Introduce ARM_PA_32 to support 32 bit
 physical address
In-Reply-To: <ea32fa45-5de3-d229-8c22-913ef0513bfa@suse.com>
Message-ID: <alpine.DEB.2.22.394.2301191544480.731018@ubuntu-linux-20-04-desktop>
References: <20230117174358.15344-1-ayan.kumar.halder@amd.com> <20230117174358.15344-10-ayan.kumar.halder@amd.com> <49228d15-3f0d-eb89-6107-40ae9f0b9b92@suse.com> <376c32ed-2e9d-a81a-69a9-8ba6d54f603e@amd.com>
 <ea32fa45-5de3-d229-8c22-913ef0513bfa@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 18 Jan 2023, Jan Beulich wrote:
> On 18.01.2023 12:57, Ayan Kumar Halder wrote:
> > Hi Jan,
> > 
> > On 18/01/2023 08:50, Jan Beulich wrote:
> >> On 17.01.2023 18:43, Ayan Kumar Halder wrote:
> >>> --- a/xen/arch/arm/include/asm/types.h
> >>> +++ b/xen/arch/arm/include/asm/types.h
> >>> @@ -37,9 +37,16 @@ typedef signed long long s64;
> >>>   typedef unsigned long long u64;
> >>>   typedef u32 vaddr_t;
> >>>   #define PRIvaddr PRIx32
> >>> +#if defined(CONFIG_ARM_PA_32)
> >>> +typedef u32 paddr_t;
> >>> +#define INVALID_PADDR (~0UL)
> >>> +#define PADDR_SHIFT BITS_PER_LONG
> >>> +#define PRIpaddr PRIx32
> >>> +#else
> >> With our plan to consolidate basic type definitions into xen/types.h
> >> the use of ARM_PA_32 is problematic: Preferably we'd have an arch-
> >> independent Kconfig setting, much like Linux'es PHYS_ADDR_T_64BIT
> >> (I don't think we should re-use the name directly, as we have no
> >> phys_addr_t type), which each arch selects (or not) accordingly.
> >> Perhaps architectures already selecting 64BIT wouldn't need to do
> >> this explicitly, and instead 64BIT could select the new setting
> >> (or the new setting could default to Y when 64BIT=y).
> > 
> > Looking at some of the instances where 64BIT is currently used 
> > (xen/drivers/passthrough/arm/smmu.c), I understand that it is used to 
> > define the width of **virtual** address.
> > 
> > Thus, it would not conflict with ARM_PA_32 (which is for physical address).
> > 
> > Later on if we wish to introduce something similar to Linux's 
> > PHYS_ADDR_T_64BIT (which is arch agnostic), then ARM_PA_32 can be 
> > selected by "!PHYS_ADDR_T_64BIT" && "CONFIG_ARM_32". (We may decide to 
> > drop ARM_PA_32 config option, but we can still reuse ARM_PA_32 specific 
> > changes).
> > 
> > Also, then we will need to support 32 bit physical address (ie 
> > !PHYS_ADDR_T_64BIT) with 32 bit virtual address (ie !64BIT) and 64 bit 
> > virtual address (ie 64BIT).
> > 
> > Let's confine the current changes to Arm architecture only (as I don't 
> > have knowledge about x86 or RISCV). When similar changes will be done 
> > for other architectures, then we can think about introducing an 
> > architecture agnostic option.
> 
> I disagree, not the least with the present goal of reworking xen/types.h
> vs asm/types.h. By having an arch-independent Kconfig symbol, paddr_t
> could also be manufactured uniformly in xen/types.h.

Jan is only asking to introduce the new Kconfig symbol as an
arch-independent symbol. In other words, rename ARM_PA_32 to PADDR_32
(or something like that) and move the symbol to xen/arch/Kconfig.

I think that's reasonable. And PADDR_32 could be forced to always be
unselected on x86: I don't think Jan is asking you to rework the whole
of xen/arch/x86 and xen/commons to build on x86 with paddr_t set to
uint32_t.

