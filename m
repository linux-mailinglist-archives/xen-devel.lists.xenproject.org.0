Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F44598144
	for <lists+xen-devel@lfdr.de>; Thu, 18 Aug 2022 12:05:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.389417.626310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOcOW-0006WK-0f; Thu, 18 Aug 2022 10:04:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 389417.626310; Thu, 18 Aug 2022 10:04:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOcOV-0006UA-To; Thu, 18 Aug 2022 10:04:55 +0000
Received: by outflank-mailman (input) for mailman id 389417;
 Thu, 18 Aug 2022 10:04:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oOcOU-0006To-AM
 for xen-devel@lists.xenproject.org; Thu, 18 Aug 2022 10:04:54 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oOcOR-0004kp-H6; Thu, 18 Aug 2022 10:04:51 +0000
Received: from [54.239.6.188] (helo=[192.168.18.101])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oOcOR-0002aN-8c; Thu, 18 Aug 2022 10:04:51 +0000
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
	bh=quGb0OvNmDmm9FmYrb8tjkhFX9kGd7vhS4x0ZLE43vY=; b=uB5/rYVyypdIYg5DUnj7Ar0J+Y
	UhjVoKyDkrF7Zw3UtghXVeTC7wNVK5diW+54xKyrYKTNWTVqFy9VqUfuNXVvohGRrtz1PxMYUIH6e
	terwe2v+2t8et1d1sP0E6V+DVWqqfQ6Yx94Pc3wh7bpIsEaNRgRYy//xZBheqeUW8C5w=;
Message-ID: <99e460f1-ca5f-b520-69e0-b250915fd591@xen.org>
Date: Thu, 18 Aug 2022 11:04:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.1.2
Subject: Re: [PATCH] xen/arm: acpi: Support memory reserve configuration table
Content-Language: en-US
To: Ard Biesheuvel <ardb@kernel.org>, Leo Yan <leo.yan@linaro.org>
Cc: Jan Beulich <jbeulich@suse.com>, Marc Zyngier <maz@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Rahul Singh <Rahul.Singh@arm.com>, Peter Griffin <peter.griffin@linaro.org>,
 xen-devel <xen-devel@lists.xenproject.org>, Julien Grall <jgrall@amazon.com>
References: <20220817105720.111618-1-leo.yan@linaro.org>
 <fd24b049-abf2-34e8-e0b0-2c2d2d1e1b0f@suse.com>
 <CAMj1kXEDxHC6RgKfcmpXGDxwQ0mTKG146D8dJnrwJ1cWWXZ=3g@mail.gmail.com>
 <Yv4DMuQHbGNhqAP4@leoy-yangtze.lan>
 <CAMj1kXHkWH7tkpuPLLjWszOVTQ-Cr3Zcbj8w0bogSd0Y_hso0g@mail.gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <CAMj1kXHkWH7tkpuPLLjWszOVTQ-Cr3Zcbj8w0bogSd0Y_hso0g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ard,

On 18/08/2022 10:33, Ard Biesheuvel wrote:
> On Thu, 18 Aug 2022 at 11:15, Leo Yan <leo.yan@linaro.org> wrote:
>>
>> Hi Ard,
>>
>> On Wed, Aug 17, 2022 at 03:49:32PM +0200, Ard Biesheuvel wrote:
>>
>> [...]
>>
>>>> This header holds ACPI spec defined data structures. This one looks
>>>> to be a Linux one, and hence shouldn't be defined here. You use it
>>>> in a single CU only, so I see no reason to define it there.
>>>>
>>>> Furthermore - what if Linux decided to change their structure? Or
>>>> is there a guarantee that they won't?
>>>
>>> No, there is not. The memreserve table is an internal interface
>>> between the EFI stub loader and the Linux kernel proper.
>>>
>>> As I have argued many times before, booting the arm64 kernel in
>>> EFI/ACPI mode without going through the EFI stub violates the ACPI
>>> spec, and relies on interfaces that were not intended for public
>>> consumption.
>>
>> Let me ask a question but sorry it might be off topic.
>>
>> In the Linux kernel function:
>>
>>    static int gic_reserve_range(phys_addr_t addr, unsigned long size)
>>    {
>>            if (efi_enabled(EFI_CONFIG_TABLES))
>>                    return efi_mem_reserve_persistent(addr, size);
>>
>>            return 0;
>>    }
>>
>> We can see it will reserve persistent memory region for GIC pending
>> pages, so my question is if a platform is booting with DT binding
>> rather than ACPI table, how the primary kernel can reserve the pages
>> and pass the info to the secondary kernel?
>>
>> Seems it's broken for kdump/kexec if kernel boots with using DT?
>>
> 
> EFI supports both DT and ACPI boot, but only ACPI *requires* EFI.
> 
> So DT boot on hardware with affected GICv3 implementations works fine
> with kdump/kexec as long as EFI is being used. Using non-EFI boot and
> kexec on such systems will likely result in a splat on the second
> kernel, unless there is another mechanism being used to reserve the
> memory in DT as well.
> 
> Maybe we should wire up the EFI_PARAVIRT flag for Xen dom0 on arm64,
> so that we can filter out the call above. That would mean that
> Xen/arm64/dom0/kexec on affected hardware would result in a splat in
> the second kernel as well, but whether that matters depends on your
> support scope.
In the context of Xen, dom0 doesn't have direct access to the host ITS 
because we are emulating it. So I think it doesn't matter for us because 
we can fix our implementation if it is affected.

That said, kexec-ing dom0 (or any other domain) on Xen on Arm would 
require some work to be supported. OOI, @leo is it something you are 
investigating?

Cheers,

-- 
Julien Grall

