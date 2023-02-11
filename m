Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2727692FA9
	for <lists+xen-devel@lfdr.de>; Sat, 11 Feb 2023 10:10:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.493833.763865 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQltg-0008QI-Vs; Sat, 11 Feb 2023 09:10:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 493833.763865; Sat, 11 Feb 2023 09:10:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQltg-0008NM-SV; Sat, 11 Feb 2023 09:10:16 +0000
Received: by outflank-mailman (input) for mailman id 493833;
 Sat, 11 Feb 2023 09:10:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pQltf-0008NG-IG
 for xen-devel@lists.xenproject.org; Sat, 11 Feb 2023 09:10:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pQlte-00028s-J2; Sat, 11 Feb 2023 09:10:14 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pQlte-0001yS-8k; Sat, 11 Feb 2023 09:10:14 +0000
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
	bh=VLo1JSR4UZby/541LwEeRUgP8QQ/iSy/F88VSmuEyPA=; b=6qkKkCtDErvAGnxyzgsz6Ac0ig
	HrX2jp54NCrhOvxzHd91IYbju13oE54EBrDoa7A8sfUuVcSL+2kOpcMbL974+7kQ8T3mRUGIRwBa0
	16qBCbQCPNXv8dmaSKlMMKEl5WDM4qYL8IOHbKKby+0DQKbBToSltFtcuReuFD/Kv6Vs=;
Message-ID: <5631b4ea-decf-0e9d-3749-6f0bdffb73c4@xen.org>
Date: Sat, 11 Feb 2023 09:10:11 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
To: Stefano Stabellini <sstabellini@kernel.org>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: xen-devel@lists.xenproject.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, jbeulich@suse.com,
 wl@xen.org, rahul.singh@arm.com
References: <20230208120529.22313-1-ayan.kumar.halder@amd.com>
 <20230208120529.22313-5-ayan.kumar.halder@amd.com>
 <alpine.DEB.2.22.394.2302101617590.4661@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
Subject: Re: [XEN v3 4/9] xen/arm: Introduce a wrapper for
 dt_device_get_address() to handle paddr_t
In-Reply-To: <alpine.DEB.2.22.394.2302101617590.4661@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 11/02/2023 00:20, Stefano Stabellini wrote:
> On Wed, 8 Feb 2023, Ayan Kumar Halder wrote:
>> dt_device_get_address() can accept u64 only for address and size.
>> However, the address/size denotes physical addresses. Thus, they should
>> be represented by 'paddr_t'.
>> Consequently, we introduce a wrapper for dt_device_get_address() ie
>> dt_device_get_paddr() which accepts address/size as paddr_t and inturn
>> invokes dt_device_get_address() after converting address/size to u64.
>>
>> The reason for introducing doing this is that in future 'paddr_t' may
>> be defined as u32. Thus, we need an explicit wrapper to do the type
>> conversion and return an error in case of truncation.
>>
>> With this, callers now invoke dt_device_get_paddr().
>> dt_device_get_address() is invoked by dt_device_get_paddr() only.
>>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>> ---
>> Changes from -
>>
>> v1 - 1. New patch.
>>
>> v2 - 1. Extracted part of "[XEN v2 05/11] xen/arm: Use paddr_t instead of u64 for address/size"
>> into this patch.
>>
>> 2. dt_device_get_address() callers now invoke dt_device_get_paddr() instead.
>>
>> 3. Logged error in case of truncation.
>>
>>   xen/arch/arm/domain_build.c                | 10 +++---
>>   xen/arch/arm/gic-v2.c                      | 10 +++---
>>   xen/arch/arm/gic-v3-its.c                  |  4 +--
>>   xen/arch/arm/gic-v3.c                      | 10 +++---
>>   xen/arch/arm/pci/pci-host-common.c         |  6 ++--
>>   xen/arch/arm/platforms/brcm-raspberry-pi.c |  2 +-
>>   xen/arch/arm/platforms/brcm.c              |  4 +--
>>   xen/arch/arm/platforms/exynos5.c           | 32 +++++++++----------
>>   xen/arch/arm/platforms/sunxi.c             |  2 +-
>>   xen/arch/arm/platforms/xgene-storm.c       |  2 +-
>>   xen/common/device_tree.c                   | 36 ++++++++++++++++++++--
>>   xen/drivers/char/cadence-uart.c            |  4 +--
>>   xen/drivers/char/exynos4210-uart.c         |  4 +--
>>   xen/drivers/char/imx-lpuart.c              |  4 +--
>>   xen/drivers/char/meson-uart.c              |  4 +--
>>   xen/drivers/char/mvebu-uart.c              |  4 +--
>>   xen/drivers/char/ns16550.c                 |  2 +-
>>   xen/drivers/char/omap-uart.c               |  4 +--
>>   xen/drivers/char/pl011.c                   |  6 ++--
>>   xen/drivers/char/scif-uart.c               |  4 +--
>>   xen/drivers/passthrough/arm/ipmmu-vmsa.c   |  8 ++---
>>   xen/drivers/passthrough/arm/smmu-v3.c      |  2 +-
>>   xen/drivers/passthrough/arm/smmu.c         |  8 ++---
>>   xen/include/xen/device_tree.h              |  6 ++--
>>   24 files changed, 105 insertions(+), 73 deletions(-)
>>
>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>> index 4d7e67560f..c7e88f5011 100644
>> --- a/xen/arch/arm/domain_build.c
>> +++ b/xen/arch/arm/domain_build.c
>> @@ -1692,13 +1692,13 @@ static int __init find_memory_holes(const struct kernel_info *kinfo,
>>       dt_for_each_device_node( dt_host, np )
>>       {
>>           unsigned int naddr;
>> -        u64 addr, size;
>> +        paddr_t addr, size;
>>   
>>           naddr = dt_number_of_address(np);
>>   
>>           for ( i = 0; i < naddr; i++ )
>>           {
>> -            res = dt_device_get_address(np, i, &addr, &size);
>> +            res = dt_device_get_paddr(np, i, &addr, &size);
> 
> One thing to be careful here is that "start" and "end" in
> find_memory_holes are defined now as paddr_t and passed to
> rangeset_add_range and rangeset_remove_range.

I am a bit puzzled why you are saying "now". Without Ayan's patch addr 
was 64-bit so...

> 
> rangeset_add_range and rangeset_remove_range take an unsigned long as
> parameter, so in an arm32 configuration with paddr_t set to 64-bit it
> would result in truncation

... the problem you are talking about would already exist.

I would consider to store a frame number rather than the full address 
because we can only deal with page-aligned region.

Stefano (or Ayan) can you look at it?

Cheers,

-- 
Julien Grall

