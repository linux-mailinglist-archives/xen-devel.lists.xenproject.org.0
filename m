Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E53C5AE4D2
	for <lists+xen-devel@lfdr.de>; Tue,  6 Sep 2022 11:54:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.399732.641010 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVVHK-0003on-Gh; Tue, 06 Sep 2022 09:53:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 399732.641010; Tue, 06 Sep 2022 09:53:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVVHK-0003m2-Dl; Tue, 06 Sep 2022 09:53:58 +0000
Received: by outflank-mailman (input) for mailman id 399732;
 Tue, 06 Sep 2022 09:53:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oVVHJ-0003lw-63
 for xen-devel@lists.xenproject.org; Tue, 06 Sep 2022 09:53:57 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oVVHI-0008Pt-Ob; Tue, 06 Sep 2022 09:53:56 +0000
Received: from 54-240-197-225.amazon.com ([54.240.197.225]
 helo=[192.168.11.176]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oVVHI-0003e9-EN; Tue, 06 Sep 2022 09:53:56 +0000
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
	bh=fG7RIjXOPLfhyzD4onYNGManxHoHwmBVxGNiLmP5nLE=; b=rXb/zRrD3pp3iFvgqVDwWtGFPb
	/4KHpzLHSgrQY+s2v6IeN9qjaP5hece2ufdh/84wJSlBzfm8OGozXMIpRtmr4hYUJDKU4U2sNqWJz
	Xi/RBXGLNbECkTS7lBCeockNZX++Jff6mFRpj2HOT+tnBvVXg1O/h73nOOC9QG47ftLQ=;
Message-ID: <6b230e0a-1075-1ce9-9ceb-9d3dd5410f9c@xen.org>
Date: Tue, 6 Sep 2022 10:53:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.1
Subject: Re: [PATCH v3 2/2] xen/pci: replace call to is_memory_hole to
 pci_check_bar
Content-Language: en-US
To: Rahul Singh <Rahul.Singh@arm.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Paul Durrant <paul@xen.org>
References: <cover.1662024325.git.rahul.singh@arm.com>
 <e30beac1480f03b51933d8016ad9aed8855ffc18.1662024325.git.rahul.singh@arm.com>
 <be43a751-2ceb-df74-7525-b84505d341b8@xen.org>
 <CC75ADF3-C7BA-4AE7-B5C0-22B0EA87F08B@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <CC75ADF3-C7BA-4AE7-B5C0-22B0EA87F08B@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 06/09/2022 10:39, Rahul Singh wrote:
> Hi Julien,
> 
>> On 3 Sep 2022, at 8:18 am, Julien Grall <julien@xen.org> wrote:
>>
>> Hi Rahul,
>>
>> On 01/09/2022 10:29, Rahul Singh wrote:
>>> is_memory_hole was implemented for x86 and not for ARM when introduced.
>>> Replace is_memory_hole call to pci_check_bar as function should check
>>> if device BAR is in defined memory range. Also, add an implementation
>>> for ARM which is required for PCI passthrough.
>>> On x86, pci_check_bar will call is_memory_hole which will check if BAR
>>> is not overlapping with any memory region defined in the memory map.
>>> On ARM, pci_check_bar will go through the host bridge ranges and check
>>> if the BAR is in the range of defined ranges.
>>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>>> ---
>>> Changes in v3:
>>>   - fix minor comments
>>> ---
>>>   xen/arch/arm/include/asm/pci.h     |  2 ++
>>>   xen/arch/arm/pci/pci-host-common.c | 43 ++++++++++++++++++++++++++++++
>>>   xen/arch/x86/include/asm/pci.h     | 10 +++++++
>>>   xen/drivers/passthrough/pci.c      |  8 +++---
>>>   4 files changed, 59 insertions(+), 4 deletions(-)
>>> diff --git a/xen/arch/arm/include/asm/pci.h b/xen/arch/arm/include/asm/pci.h
>>> index 80a2431804..8cb46f6b71 100644
>>> --- a/xen/arch/arm/include/asm/pci.h
>>> +++ b/xen/arch/arm/include/asm/pci.h
>>> @@ -126,6 +126,8 @@ int pci_host_iterate_bridges_and_count(struct domain *d,
>>>     int pci_host_bridge_mappings(struct domain *d);
>>>   +bool pci_check_bar(const struct pci_dev *pdev, mfn_t start, mfn_t end);
>>> +
>>>   #else   /*!CONFIG_HAS_PCI*/
>>>     struct arch_pci_dev { };
>>> diff --git a/xen/arch/arm/pci/pci-host-common.c b/xen/arch/arm/pci/pci-host-common.c
>>> index 89ef30028e..0eb121666d 100644
>>> --- a/xen/arch/arm/pci/pci-host-common.c
>>> +++ b/xen/arch/arm/pci/pci-host-common.c
>>> @@ -24,6 +24,16 @@
>>>     #include <asm/setup.h>
>>>   +/*
>>> + * struct to hold pci device bar.
>>> + */
>>
>> I find this comment a bit misleading. What you are storing is a
>> candidate region. IOW, this may or may not be a PCI device bar.
>>
>> Given the current use below, I would rename the structure to something more specific like: pdev_bar_check.
> 
> Ack.
>>
>>> +struct pdev_bar
>>> +{
>>> +    mfn_t start;
>>> +    mfn_t end;
>>> +    bool is_valid;
>>> +};
>>> +
>>>   /*
>>>    * List for all the pci host bridges.
>>>    */
>>> @@ -363,6 +373,39 @@ int __init pci_host_bridge_mappings(struct domain *d)
>>>       return 0;
>>>   }
>>>   +static int is_bar_valid(const struct dt_device_node *dev,
>>> +                        uint64_t addr, uint64_t len, void *data)
>>> +{
>>> +    struct pdev_bar *bar_data = data;
>>> +    unsigned long s = mfn_x(bar_data->start);
>>> +    unsigned long e = mfn_x(bar_data->end);
>>> +
>>> +    if ( (s <= e) && (s >= PFN_DOWN(addr)) && (e <= PFN_UP(addr + len - 1)) )
>>
>> AFAICT 's'  and 'e' are provided by pci_check_bar() and will never change. So can we move the check 's <= e' outside of the callback?
> 
> Yes, We can move the check outside the callback but I feel that if we check here then it is more
> readable that we are checking for all possible values in one statement. Let me know your view on this.
The readability is really a matter of taste here. But my point is more 
on the number of time a check is done.

It seems pointless to do the same check N times when you know the values 
are not going to change. Admittedly, the operation is fast (this is a 
comparison) and N should be small (?).

However, I think it raises the question on where do you draw the line?

Personally, I think all invariant should be checked outside of 
callbacks. So the line is very clear.

> 
>>
>>> +        bar_data->is_valid =  true;
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +bool pci_check_bar(const struct pci_dev *pdev, mfn_t start, mfn_t end)
>>> +{
>>
>> Other than the current calls in check_pdev(), do you have plan to use it in more places? The reason I am asking it is this function is non-trivial on Arm (dt_for_each_range() is quite complex).
> 
> I don’t see any use of this function in more places. As this function will be called during dom0 boot when the PCI devices are
> added I don’t see any performance issues. We may need to revisit this function when we add ACPI PCI passthrough support.
> I will add TODO that we need to revisit this function for ACPI PCI passthrough support.

Thanks.

Cheers,

-- 
Julien Grall

