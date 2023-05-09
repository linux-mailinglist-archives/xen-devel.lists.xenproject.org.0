Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C80206FCE8C
	for <lists+xen-devel@lfdr.de>; Tue,  9 May 2023 21:30:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.532514.828742 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwT1x-0003yl-OV; Tue, 09 May 2023 19:29:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 532514.828742; Tue, 09 May 2023 19:29:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwT1x-0003vP-LC; Tue, 09 May 2023 19:29:49 +0000
Received: by outflank-mailman (input) for mailman id 532514;
 Tue, 09 May 2023 19:29:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pwT1v-0003vJ-QL
 for xen-devel@lists.xenproject.org; Tue, 09 May 2023 19:29:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pwT1v-0001iK-CL; Tue, 09 May 2023 19:29:47 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.0.228]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pwT1v-0007QI-55; Tue, 09 May 2023 19:29:47 +0000
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
	bh=/mgowuNY58cywWzCLp+qkvB4sb4g+S5sA3URmT0u5ms=; b=T0UpQYqY4p5g821wl3TBmYJlA5
	baAQAUfJevUW/jgVixvL/wUpI9sL5+NCIPBGMARrm8B7ZuZc3RTez2jQ9dQDTbrf6rKPqk66Nmp9p
	KNKtmlswOFKQYZJbdyhQvgUOThEk0DXo1nA0gLMJyzHuZwt4OuCuM7U6Bn7Fz6nH7Y5M=;
Message-ID: <c9b39323-1ad4-ed01-bb89-09276b39def7@xen.org>
Date: Tue, 9 May 2023 20:29:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [XEN v6 03/12] xen/arm: Introduce a wrapper for
 dt_device_get_address() to handle paddr_t
Content-Language: en-US
To: Ayan Kumar Halder <ayankuma@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, jbeulich@suse.com,
 wl@xen.org, rahul.singh@arm.com
References: <20230428175543.11902-1-ayan.kumar.halder@amd.com>
 <20230428175543.11902-4-ayan.kumar.halder@amd.com>
 <37c9a45f-ae07-8d47-093a-6cf7501389d4@xen.org>
 <d15ba304-8f79-f80a-b0ac-4dccebded17c@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <d15ba304-8f79-f80a-b0ac-4dccebded17c@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 03/05/2023 15:06, Ayan Kumar Halder wrote:
> 
> On 03/05/2023 12:25, Julien Grall wrote:
>> Hi Ayan,
> Hi Julien,
>>
>> On 28/04/2023 18:55, Ayan Kumar Halder wrote:
>>> dt_device_get_address() can accept uint64_t only for address and size.
>>> However, the address/size denotes physical addresses. Thus, they should
>>> be represented by 'paddr_t'.
>>> Consequently, we introduce a wrapper for dt_device_get_address() ie
>>> dt_device_get_paddr() which accepts address/size as paddr_t and inturn
>>> invokes dt_device_get_address() after converting address/size to
>>> uint64_t.
>>>
>>> The reason for introducing this is that in future 'paddr_t' may not
>>> always be 64-bit. Thus, we need an explicit wrapper to do the type
>>> conversion and return an error in case of truncation.
>>>
>>> With this, callers can now invoke dt_device_get_paddr().
>>>
>>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>>> ---
>>> Changes from -
>>>
>>> v1 - 1. New patch.
>>>
>>> v2 - 1. Extracted part of "[XEN v2 05/11] xen/arm: Use paddr_t 
>>> instead of u64 for address/size"
>>> into this patch.
>>>
>>> 2. dt_device_get_address() callers now invoke dt_device_get_paddr() 
>>> instead.
>>>
>>> 3. Logged error in case of truncation.
>>>
>>> v3 - 1. Modified the truncation checks as "dt_addr != (paddr_t)dt_addr".
>>> 2. Some sanity fixes.
>>>
>>> v4 - 1. Some sanity fixes.
>>> 2. Preserved the declaration of dt_device_get_address() in
>>> xen/include/xen/device_tree.h. The reason being it is currently used by
>>> ns16550.c. This driver requires some more changes as pointed by Jan in
>>> https://lore.kernel.org/xen-devel/6196e90f-752e-e61a-45ce-37e46c22b812@suse.com/
>>> which is to be addressed as a separate series.
>>>
>>> v5 - 1. Removed initialization of variables.
>>> 2. In dt_device_get_paddr(), added the check
>>> if ( !addr )
>>>      return -EINVAL;
>>>
>>>   xen/arch/arm/domain_build.c                | 10 +++---
>>>   xen/arch/arm/gic-v2.c                      | 10 +++---
>>>   xen/arch/arm/gic-v3-its.c                  |  4 +--
>>>   xen/arch/arm/gic-v3.c                      | 10 +++---
>>>   xen/arch/arm/pci/pci-host-common.c         |  6 ++--
>>>   xen/arch/arm/platforms/brcm-raspberry-pi.c |  2 +-
>>>   xen/arch/arm/platforms/brcm.c              |  6 ++--
>>>   xen/arch/arm/platforms/exynos5.c           | 32 +++++++++---------
>>>   xen/arch/arm/platforms/sunxi.c             |  2 +-
>>>   xen/arch/arm/platforms/xgene-storm.c       |  2 +-
>>>   xen/common/device_tree.c                   | 39 ++++++++++++++++++++++
>>>   xen/drivers/char/cadence-uart.c            |  4 +--
>>>   xen/drivers/char/exynos4210-uart.c         |  4 +--
>>>   xen/drivers/char/imx-lpuart.c              |  4 +--
>>>   xen/drivers/char/meson-uart.c              |  4 +--
>>>   xen/drivers/char/mvebu-uart.c              |  4 +--
>>>   xen/drivers/char/omap-uart.c               |  4 +--
>>>   xen/drivers/char/pl011.c                   |  6 ++--
>>>   xen/drivers/char/scif-uart.c               |  4 +--
>>
>> What about the call in xen/drivers/char/ns16550.c?
> 
> Refer to 
> https://lore.kernel.org/xen-devel/6196e90f-752e-e61a-45ce-37e46c22b812@suse.com/ , Jan mentioned that this driver needs some prior cleanup.
> 
> So, I decided to take it out and do it after the current series has been 
> committed.
> 
> See 
> https://patchew.org/Xen/20230413173735.48387-1-ayan.kumar.halder@amd.com/ , Jan agreed to this.
> 
> Is this ok with you ?

I am OK with that. Can you mention it in the commit message? This would 
help the reviewer or a future reader to understand why you left out 
ns16550 (this is the only call left).

With the remarks from Michal addressed:

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

