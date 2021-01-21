Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 730E32FF332
	for <lists+xen-devel@lfdr.de>; Thu, 21 Jan 2021 19:31:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.72340.130179 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2ejy-0003CP-KD; Thu, 21 Jan 2021 18:31:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72340.130179; Thu, 21 Jan 2021 18:31:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2ejy-0003C0-Gv; Thu, 21 Jan 2021 18:31:30 +0000
Received: by outflank-mailman (input) for mailman id 72340;
 Thu, 21 Jan 2021 18:31:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1l2ejw-0003Bu-OE
 for xen-devel@lists.xenproject.org; Thu, 21 Jan 2021 18:31:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l2ejt-0006Tv-3M; Thu, 21 Jan 2021 18:31:25 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l2ejs-00010X-MO; Thu, 21 Jan 2021 18:31:24 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=WNo6GrYvzfBt8R0wpWriNGAxDAPy3aOWTTbEM1mFXcQ=; b=h+yBaRJhUtvGs1hPuqKngzj4Gd
	y4vOXKvtaSsocOfXgWkw/lAXt+AKfc35adv+NX8+hhZ5E1ehyr5DR3MwIO+T0N0qgmHE95OnoX3iQ
	WH6NgDRSC6ddviJAPpN5CDyal+V/ZBJ0uGgy3lyajurMxtvabpuX64dbdS7OKoUcRTX4=;
Subject: Re: [PATCH v5 10/10] xen/arm: smmuv3: Add support for SMMUv3 driver
To: Rahul Singh <Rahul.Singh@arm.com>, Oleksandr <olekstysh@gmail.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1611153615.git.rahul.singh@arm.com>
 <b14ea889b0c27fec1b8843da91b570b0ccd66796.1611153615.git.rahul.singh@arm.com>
 <b35211f0-d523-aa5f-55a1-6afa5142617c@gmail.com>
 <F193260F-E4F0-4977-97ED-72505603C5F6@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <d5c1f75a-8e5c-a938-0d10-a0d276643052@xen.org>
Date: Thu, 21 Jan 2021 18:31:22 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <F193260F-E4F0-4977-97ED-72505603C5F6@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

On 21/01/2021 17:18, Rahul Singh wrote:
> Hello Oleksandr,

Hi,

>> On 20 Jan 2021, at 9:33 pm, Oleksandr <olekstysh@gmail.com> wrote:
>>
>>
>> On 20.01.21 16:52, Rahul Singh wrote:
>>
>> Hi Rahul
>>
>>> Add support for ARM architected SMMUv3 implementation. It is based on
>>> the Linux SMMUv3 driver.
>>>
>>> Driver is currently supported as Tech Preview.
>>>
>>> Major differences with regard to Linux driver are as follows:
>>> 2. Only Stage-2 translation is supported as compared to the Linux driver
>>>     that supports both Stage-1 and Stage-2 translations.
>>> 3. Use P2M  page table instead of creating one as SMMUv3 has the
>>>     capability to share the page tables with the CPU.
>>> 4. Tasklets are used in place of threaded IRQ's in Linux for event queue
>>>     and priority queue IRQ handling.
>>> 5. Latest version of the Linux SMMUv3 code implements the commands queue
>>>     access functions based on atomic operations implemented in Linux.
>>>     Atomic functions used by the commands queue access functions are not
>>>     implemented in XEN therefore we decided to port the earlier version
>>>     of the code. Atomic operations are introduced to fix the bottleneck
>>>     of the SMMU command queue insertion operation. A new algorithm for
>>>     inserting commands into the queue is introduced, which is lock-free
>>>     on the fast-path.
>>>     Consequence of reverting the patch is that the command queue
>>>     insertion will be slow for large systems as spinlock will be used to
>>>     serializes accesses from all CPUs to the single queue supported by
>>>     the hardware. Once the proper atomic operations will be available in
>>>     XEN the driver can be updated.
>>> 6. Spin lock is used in place of mutex when attaching a device to the
>>>     SMMU, as there is no blocking locks implementation available in XEN.
>>>     This might introduce latency in XEN. Need to investigate before
>>>     driver is out for tech preview.
>>> 7. PCI ATS functionality is not supported, as there is no support
>>>     available in XEN to test the functionality. Code is not tested and
>>>     compiled. Code is guarded by the flag CONFIG_PCI_ATS.
>>> 8. MSI interrupts are not supported as there is no support available in
>>>     XEN to request MSI interrupts. Code is not tested and compiled. Code
>>>     is guarded by the flag CONFIG_MSI.
>>>
>>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>>> ---
>>> Changes since v2:
>>> - added return statement for readx_poll_timeout function.
>>> - remove iommu_get_dma_cookie and iommu_put_dma_cookie.
>>> - remove struct arm_smmu_xen_device as not required.
>>> - move dt_property_match_string to device_tree.c file.
>>> - replace arm_smmu_*_thread to arm_smmu_*_tasklet to avoid confusion.
>>> - use ARM_SMMU_REG_SZ as size when map memory to XEN.
>>> - remove bypass keyword to make sure when device-tree probe is failed we
>>>    are reporting error and not continuing to configure SMMU in bypass
>>>    mode.
>>> - fixed minor comments.
>>> Changes since v3:
>>> - Fixed typo for CONFIG_MSI
>>> - Added back the mutex code
>>> - Rebase the patch on top of newly added WARN_ON().
>>> - Remove the direct read of register VTCR_EL2.
>>> - Fixed minor comments.
>>> Changes since v4:
>>> - Replace the ffsll() with ffs64() function.
>>> - Add code to free resources when probe failed.
>>
>> Thank you for addressing, patch looks ok to me, just one small remark below:
>>
>>
>>> +
>>> +static void __hwdom_init arm_smmu_iommu_hwdom_init(struct domain *d)
>>> +{
>>> +}
>>
>> We discussed in V4 about adding some code here which all IOMMUs on Arm already have, copy it below for the convenience:
>>
>>
>>       /* Set to false options not supported on ARM. */
>>       if ( iommu_hwdom_inclusive )
>>           printk(XENLOG_WARNING
>>           "map-inclusive dom0-iommu option is not supported on ARM\n");
>>       iommu_hwdom_inclusive = false;
>>       if ( iommu_hwdom_reserved == 1 )
>>           printk(XENLOG_WARNING
>>           "map-reserved dom0-iommu option is not supported on ARM\n");
>>       iommu_hwdom_reserved = 0;
>>
>>       arch_iommu_hwdom_init(d);
>>
>>
>> Also we discussed about possibility to fold the part of code (which disables unsupported options) in arch_iommu_hwdom_init() to avoid duplication as a follow-up.
>> At least, I expected to see arch_iommu_hwdom_init() to be called by arm_smmu_iommu_hwdom_init() it current patch... Please note, this is *not* a request for change immediately,
>> I think, driver is functional even without this code (hopefully arch_iommu_hwdom_init is empty now, etc).  But, if you happen to do V6 or probably it could be done on commit ...
>>
> 
> Yes I will send the patch to move the code to arch_iommu_hwdom_init() to avoid duplication once SMMUv3 driver will be merged.
> I thought anyway I have to remove the code from SMMUv1 and IPMMU I will take care of all the IOMMU driver at the same time because of that I didn’t modify the SMMUv3 driver.

There are two part in the problem here:
   1) Code duplication
   2) The SMMUv3 not checking the command line and calling 
arch_iommu_hwdom_init(d)

I agree that 1) can be deferred because it is a clean-up. However, I 
consider 2) a (latent) bug because it means that we risk unintentionally 
breaking the SMMUv3 driver is we need to add code in 
arch_iommu_hwdom_init() as part of a future bug fix for 4.15.

Therefore...

> Yes if there is a need for v6 I will add the arch_iommu_hwdom_init(d) in arm_smmu_iommu_hwdom_init().

... I think calling arch_iommu_hwdom_init() should be the strict 
minimum. So please address it. Although, no need to resend the full 
series, you can only resend patch #10.

Cheers,

-- 
Julien Grall

