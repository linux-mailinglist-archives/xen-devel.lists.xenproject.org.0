Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B99692FE3
	for <lists+xen-devel@lfdr.de>; Sat, 11 Feb 2023 11:07:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.493854.763899 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQmmq-0007ak-N2; Sat, 11 Feb 2023 10:07:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 493854.763899; Sat, 11 Feb 2023 10:07:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQmmq-0007XL-Jd; Sat, 11 Feb 2023 10:07:16 +0000
Received: by outflank-mailman (input) for mailman id 493854;
 Sat, 11 Feb 2023 10:07:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pQmmp-0007XF-1f
 for xen-devel@lists.xenproject.org; Sat, 11 Feb 2023 10:07:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pQmmo-0003g6-1z; Sat, 11 Feb 2023 10:07:14 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pQmmn-0004OC-E4; Sat, 11 Feb 2023 10:07:13 +0000
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
	bh=fxr93fw4/ae1l9bsu7GempUTB9Wp2H7fgUKsKezB/Mg=; b=FxPU1SofBPCrP/4mweHzyzlvSS
	halbExqt4cdzw7rYDREpUtFbEPRGSOZXzBzrT5RLMTdsKbh9jNrAd4I0oSmJ138HORxsw0VUAUBxv
	BMupAEOCezmvNGh+admi0vJTozNipYUKI491JXGn0l0XwIdP8aDBqImNi/zI72IHWXCs=;
Message-ID: <da5ff5ef-2623-d80a-afe4-33846e855fef@xen.org>
Date: Sat, 11 Feb 2023 10:07:11 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [XEN v3 6/9] xen/arm: Introduce choice to enable 64/32 bit
 physical addressing
To: Stefano Stabellini <sstabellini@kernel.org>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: xen-devel@lists.xenproject.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, jbeulich@suse.com,
 wl@xen.org, rahul.singh@arm.com
References: <20230208120529.22313-1-ayan.kumar.halder@amd.com>
 <20230208120529.22313-7-ayan.kumar.halder@amd.com>
 <alpine.DEB.2.22.394.2302101629560.4661@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2302101629560.4661@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 11/02/2023 00:34, Stefano Stabellini wrote:
> On Wed, 8 Feb 2023, Ayan Kumar Halder wrote:
>> Some Arm based hardware platforms which does not support LPAE
>> (eg Cortex-R52), uses 32 bit physical addresses.
>> Also, users may choose to use 32 bits to represent physical addresses
>> for optimization.
>>
>> To support the above use cases, we have introduced arch independent
>> configs to choose if the physical address can be represented using
>> 32 bits (PHYS_ADDR_32) or 64 bits (PHYS_ADDR_64).
>> For now only ARM_32 provides support to enable 32 bit physical
>> addressing.
>>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>> ---
>>
>> Changes from -
>> v1 - 1. Extracted from "[XEN v1 8/9] xen/arm: Other adaptations required to support 32bit paddr".
>>
>> v2 - 1. Introduced Kconfig choice. ARM_64 can select PHYS_ADDR_64 only whereas
>> ARM_32 can select PHYS_ADDR_32 or PHYS_ADDR_64.
>> 2. For CONFIG_ARM_PA_32, paddr_t is defined as 'unsigned long'.
>>
>> (Jan,Julien please let me know if I understood your suggestion about Kconfig correctly).
>>
>>   xen/arch/Kconfig                     | 12 +++++++++++
>>   xen/arch/arm/Kconfig                 | 31 ++++++++++++++++++++++++++++
>>   xen/arch/arm/include/asm/page-bits.h |  2 ++
>>   xen/arch/arm/include/asm/types.h     |  6 ++++++
>>   4 files changed, 51 insertions(+)
>>
>> diff --git a/xen/arch/Kconfig b/xen/arch/Kconfig
>> index 7028f7b74f..1eff312b51 100644
>> --- a/xen/arch/Kconfig
>> +++ b/xen/arch/Kconfig
>> @@ -1,6 +1,18 @@
>>   config 64BIT
>>   	bool
>>   
>> +config PHYS_ADDR_32
>> +	bool
>> +	help
>> +	  Select this option if the physical addresses can be represented by
>> +	  32 bits.
>> +
>> +config PHYS_ADDR_64
>> +	bool
>> +	help
>> +	  Select this option if the physical addresses can be represented
>> +	  64 bits.
> 
> These two config symbols should be defined in xen/arch/arm/Kconfig
> (unless you plan to also define them for x86).

We discussed with Jan to consolidate types.h as RISC-V may want to use a 
32-bit paddr_t. This would mean paddr_t would be defined a common header 
and therefore those config needs to be in common.

I am not asking Ayan to work on the consolidation, but I think they 
should be defined in common (assuming arm will make use of it) and I 
would at least consider to add "select PHYS_ADDR_64" in "config X86".

Cheers,

-- 
Julien Grall

