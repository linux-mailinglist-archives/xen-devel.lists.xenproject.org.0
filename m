Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A745AA7056F
	for <lists+xen-devel@lfdr.de>; Tue, 25 Mar 2025 16:47:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.926638.1329479 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx6Uo-0000Ev-LO; Tue, 25 Mar 2025 15:47:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 926638.1329479; Tue, 25 Mar 2025 15:47:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx6Uo-0000DP-Hg; Tue, 25 Mar 2025 15:47:18 +0000
Received: by outflank-mailman (input) for mailman id 926638;
 Tue, 25 Mar 2025 15:47:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tx6Un-0000C5-Ba
 for xen-devel@lists.xenproject.org; Tue, 25 Mar 2025 15:47:17 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tx6Un-007kkN-0k;
 Tue, 25 Mar 2025 15:47:16 +0000
Received: from [15.248.2.26] (helo=[10.24.67.162])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tx6Um-00El4h-2K;
 Tue, 25 Mar 2025 15:47:16 +0000
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
	bh=GJ1TR6w1YFN7HzqYKS6fbUObexap6ioa+2nukmM8QnE=; b=gXJJcLZf4OQ3Yj06epBkWclsc2
	scVxObW3aazp2UCTpRI8BkuliT1nUvjAjJscy8Y8BZpWG1kIIOukiAVnGAFT/c269pswX0HPtdxhW
	O/0PA6jjWQ+D+M8oSquo5mRWkvnhjBauZPecr+D7xvbQIJsYYEYqn8X32HrLfxCasjsM=;
Message-ID: <db47de86-b2c1-4860-9212-49c051e1bebd@xen.org>
Date: Tue, 25 Mar 2025 15:47:14 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] xen/arm: Initialize acpi_disabled to true during
 declaration
Content-Language: en-GB
To: "Orzel, Michal" <michal.orzel@amd.com>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250325150842.2015968-1-oleksandr_tyshchenko@epam.com>
 <9b96395c-ca88-483b-be06-b7768b552983@xen.org>
 <4e048dad-bd12-4526-ae62-f424bdb8271b@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <4e048dad-bd12-4526-ae62-f424bdb8271b@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michal,

On 25/03/2025 15:35, Orzel, Michal wrote:
> 
> 
> On 25/03/2025 16:23, Julien Grall wrote:
>>
>>
>> Hi Oleksandr, Michal,
>>
>> On 25/03/2025 15:08, Oleksandr Tyshchenko wrote:
>>> On the device-tree-based Arm64 system, if Xen is built with
>>> CONFIG_ACPI=y, CONFIG_STATIC_MEMORY=y, and the static memory range
>>> is provided in the host device tree, the BUG is triggered in
>>> common/page_alloc.c during Xen's early boot. The BUG occurs when
>>> the first page from the static range is fed to the domain
>>> sub-allocator and finally ends up in mark_page_free().
>>> The pg->count_info & PGC_state is not in the state that
>>> the code expects to see there.
>>>
>>> (XEN) Checking for initrd in /chosen
>>> (XEN) Checking for "xen,static-mem" in domain node
>>> (XEN) RAM: 0000000040000000 - 00000000bfffffff
>>> (XEN)
>>> (XEN) MODULE[0]: 0000000043200000 - 0000000043343fff Xen
>>> (XEN) MODULE[1]: 0000000043400000 - 0000000043402fff Device Tree
>>> (XEN) MODULE[2]: 0000000042e00000 - 0000000043111f82 Ramdisk
>>> (XEN) MODULE[3]: 0000000040400000 - 0000000042cfffff Kernel
>>> (XEN)  RESVD[0]: 0000000050000000 - 000000005fffffff
>>> (XEN)
>>> (XEN) CMDLINE[0000000040400000]:domU0 console=ttyAMA0
>>> (XEN)
>>> (XEN) Command line: console=dtuart conswitch=ax
>>> (XEN) pg MFN 50000 c=0x2180000000000000 o=0 v=0 t=0
>>> (XEN) Xen BUG at common/page_alloc.c:1474
>>> [snip]
>>>
>>> The problem is that the static range gets mistakenly unreserved
>>> in populate_boot_allocator() and reaches init_boot_pages().
>>> This happens since by the time the populate_boot_allocator()
>>> is executed, the evaluated in fw_unreserved_regions()
>>> an acpi_disabled variable is still false and as the result
>>> the dt_unreserved_regions() which should simply skip that static range
>>> does not get called. The acpi_disabled will be set to the actual value
>>> (in our case it is true) later on in acpi_boot_table_init().
>>   > > The important question is why acpi_disabled is false by the time
> Simply because it's a static bool variable with no assigned value i.e. gets
> defaulted to false. And it stays at default value until acpi_boot_table_init()
> call that cannot really be moved before setup_mm().
> 
>>> setup_mm() is executed. With CONFIG_ACPI=n it is a macro that is always
>>> true, but with CONFIG_ACPI=y it is a boolean that is false from the very
>>> beggining, even though the entire acpi_boot_table_init() (which is called
>>> after setup_mm()) is written with the assumption that ACPI is off by default
>>> at the start. So, initialize acpi_disabled to true during declaration
>>> if CONFIG_ACPI=y to avoid an issue and match to acpi_boot_table_init().
>>
>> While I agree that acpi_disabled should be false. It feels like a bit of
> You meant true (?) i.e. ACPI default off not to make any assumptions whether
> it's really on/off which can only be determined in acpi_boot_table_init(). I
> think we still need this patch to match the code expectation.

I agree with that.

> 
>> a workaround for the issue you are trying to solve here. If
>> fw_unreserved_regions() doesn't work with ACPI enabled, then it is still
>> a problem after your patch.
> I don't understand. It does work with ACPI enabled provided that it's indeed
> enabled. When booting with ACPI, reserved memory regions are not used - we even
> have a comment in struct bootinfo.

My concern is that some region may have been reserved and used somewhere 
else. But then a second call to fw_unreserved_regions() would free those 
regions and possibly trigger another BUG...

> The issue here is that acpi_disabled is set
> to false i.e. incorrectly there is assumption that ACPI is enabled by default
> and calling fw_unreserved_regions() prior to acpi_boot_table_init() works as
> long as we respect the expected default value.

This is arguable whether it is a bug or not. The value of acpi_disabled 
is the same as on x86. The assumption is that when CONFIG_ACPI=y, then 
ACPI is used unless it is explicitely turned off afterwards.

> 
>>
>> Furthermore, what happen if we decide to use ACPI afterwards? Wouldn't
>> this mean that the static regions would be reserved even if ACPI doesn't
>> use static memory (all the memory is expected to be given to the allocator)?
> I don't think such hybrid configuration is valid (booting with ACPI yet
> declaring reserved regions in DT). See commit:
> 9c2bc0f24b2ba7082df408b3c33ec9a86bf20cf0

I don't think the commit is preventing hybrid configuration. It is just 
saying that the region (which could be a static region because this is 
not supported) will be unreserved.

IOW, when booting with Device-Tree you may be able to use static memory. 
But if you were booting with ACPI, static memory is not supported and 
therefore the regions should be free for other purpose.

Cheers,

-- 
Julien Grall


