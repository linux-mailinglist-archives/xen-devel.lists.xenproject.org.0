Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F1506D103D
	for <lists+xen-devel@lfdr.de>; Thu, 30 Mar 2023 22:46:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516882.801716 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phz8m-0005tM-CZ; Thu, 30 Mar 2023 20:45:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516882.801716; Thu, 30 Mar 2023 20:45:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phz8m-0005qR-9z; Thu, 30 Mar 2023 20:45:00 +0000
Received: by outflank-mailman (input) for mailman id 516882;
 Thu, 30 Mar 2023 20:44:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1phz8l-0005qL-6K
 for xen-devel@lists.xenproject.org; Thu, 30 Mar 2023 20:44:59 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1phz8k-0001ry-Gc; Thu, 30 Mar 2023 20:44:58 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1phz8k-00021R-Ah; Thu, 30 Mar 2023 20:44:58 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=U3S5PqIIBkW3vk5kEQf2RihQCN+6HthW6USM3+suAZY=; b=IGr9aLTBeXBvw4t2+sfi/htrNG
	sr39crq5gDSz6hOAAqAv3r0s8vY2dR4xZ4mQzv/iC1NQZzZlOZ0JVacHxllxNC5rqUPkklL4dUEZk
	Ww4NCXC95t3ciMpMJLeSbjVtdUiktkdsG7op4lsYcadvXy8597xIdoOyOCLDY6jhKf1c=;
Message-ID: <e1fb180f-5bd3-dcbb-a0dd-98e27d2a406b@xen.org>
Date: Thu, 30 Mar 2023 21:44:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, jbeulich@suse.com,
 wl@xen.org, rahul.singh@arm.com
References: <20230321140357.24094-1-ayan.kumar.halder@amd.com>
 <20230321140357.24094-3-ayan.kumar.halder@amd.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [XEN v4 02/11] xen/arm: domain_build: Track unallocated pages
 using the frame number
In-Reply-To: <20230321140357.24094-3-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 21/03/2023 14:03, Ayan Kumar Halder wrote:
> rangeset_{xxx}_range() functions are invoked with 'start' and 'size' as
> arguments which are either 'uint64_t' or 'paddr_t'. However, the function
> accepts 'unsigned long' for 'start' and 'size'. 'unsigned long' is 32 bits for
> ARM_32. Thus, there is an implicit downcasting from 'uint64_t'/'paddr_t' to
> 'unsigned long' when invoking rangeset_{xxx}_range().
> 
> So, it may seem there is a possibility of lose of data due to truncation.
> 
> In reality, 'start' and 'size' are always page aligned. And ARM_32 currently
> supports 40 bits as the width of physical address.
> So if the addresses are page aligned, the last 12 bits contain zeroes.
> Thus, we could instead pass page frame number which will contain 28 bits (40-12
> on Arm_32) and this can be represented using 'unsigned long'.

Is Arm_32 meant to refer to the config or the architecture? If the 
former, then it should be ARM_32 if the latter, it should be Arm32. I 
would prefer the latter.

> 
> On Arm_64, this change will not induce any adverse side effect as the width of

Same here for Arm_64.

> physical address is 48 bits. Thus, the width of 'mfn' (ie 48 - 12 = 36) can be
> represented using 'unsigned long' (which is 64 bits wide).
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
> Changes from -
> 
> v3 - 1. Extracted the patch from https://lists.xenproject.org/archives/html/xen-devel/2023-02/msg00657.html
> and added it to this series.
> 2. Modified add_ext_regions(). This accepts a frame number instead of physical
> address.
> 
>   xen/arch/arm/domain_build.c | 27 +++++++++++++++++----------
>   1 file changed, 17 insertions(+), 10 deletions(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 15fa88e977..24b12b7512 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -1500,10 +1500,13 @@ static int __init make_resv_memory_node(const struct domain *d,
>       return res;
>   }
>   
> -static int __init add_ext_regions(unsigned long s, unsigned long e, void *data)
> +static int __init add_ext_regions(unsigned long s_pfn, unsigned long e_pfn,

We are trying to phase out any using of 'pfn' in the code. In this case, 
this is mean (see include/xen/mm.h for more details). Here, you want to 
use 'gfn' as we are looking for space in the dom0 memory address space.

> +                                  void *data)
>   {
>       struct meminfo *ext_regions = data;
>       paddr_t start, size;
> +    paddr_t s = PFN_UP(s_pfn);
> +    paddr_t e = PFN_UP(e_pfn);

PFN_UP() takes a physical address in parameter and return a page frame 
number. So this is not what you want here. You want pfn_to_paddr().

The rest looks good to me.

Cheers,

-- 
Julien Grall

