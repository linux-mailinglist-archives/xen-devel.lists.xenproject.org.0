Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 166CF74839D
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jul 2023 13:58:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559140.873858 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH19F-0004d6-3x; Wed, 05 Jul 2023 11:58:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559140.873858; Wed, 05 Jul 2023 11:58:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH19F-0004aR-0i; Wed, 05 Jul 2023 11:58:17 +0000
Received: by outflank-mailman (input) for mailman id 559140;
 Wed, 05 Jul 2023 11:58:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qH19D-0004aL-ST
 for xen-devel@lists.xenproject.org; Wed, 05 Jul 2023 11:58:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qH19D-0006gZ-F9; Wed, 05 Jul 2023 11:58:15 +0000
Received: from [15.248.3.5] (helo=[10.24.67.21])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qH19D-0004F6-AO; Wed, 05 Jul 2023 11:58:15 +0000
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
	References:Cc:To:From:Subject:MIME-Version:Date:Message-ID;
	bh=VuQCYaO/N9+Z/JjDGmx8/j1wpLT4IloXhHqFDhpcLKk=; b=6gjTVaGqezbAWEX+QAxFy6RW1Y
	ejSzk4D+TccR1sxnpgh3oZBHg+4RAyEDK3EoxjB6aF5xVA1h3iYAJfyEmlidIgUtKSqZEpMXpJdd1
	WS0UaSmpG2hRosap8zg4UlPkDAM9RO760ujBAIrJT5re4/YoYiAszgpo02HF/LUhOsQA=;
Message-ID: <9ed7ab49-7f29-5a77-0bfd-377d21aed2a8@xen.org>
Date: Wed, 5 Jul 2023 12:58:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [RANDCONFIG failure] Re: [PATCH v3 02/52] xen/arm: make ARM_EFI
 selectable for Arm64
Content-Language: en-US
From: Julien Grall <julien@xen.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Penny Zheng <Penny.Zheng@arm.com>, xen-devel@lists.xenproject.org
Cc: Wei Chen <wei.chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
 <20230626033443.2943270-3-Penny.Zheng@arm.com>
 <1956a273-27a9-d0e6-e328-be69ff91e5d3@citrix.com>
 <886fdf18-5369-9b9c-2984-365b8ed404a3@xen.org>
In-Reply-To: <886fdf18-5369-9b9c-2984-365b8ed404a3@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 05/07/2023 12:46, Julien Grall wrote:
> Hi,
> 
> On 05/07/2023 12:20, Andrew Cooper wrote:
>> On 26/06/2023 4:33 am, Penny Zheng wrote:
>>> From: Wei Chen <wei.chen@arm.com>
>>>
>>> Currently, ARM_EFI will mandatorily selected by Arm64.
>>> Even if the user knows for sure that their images will not
>>> start in the EFI environment, they can't disable the EFI
>>> support for Arm64. This means there will be about 3K lines
>>> unused code in their images.
>>>
>>> So in this patch, we make ARM_EFI selectable for Arm64, and
>>> based on that, we can use CONFIG_ARM_EFI to gate the EFI
>>> specific code in head.S for those images that will not be
>>> booted in EFI environment.
>>>
>>> Signed-off-by: Wei Chen <wei.chen@arm.com>
>>> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
>>
>> Randconfig has found a bug:
>>
>> https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/4595568303
>>
>> ld: prelink.o: in function `acpi_os_get_root_pointer':
>> /builds/xen-project/people/andyhhp/xen/xen/drivers/acpi/osl.c:73:
>> undefined reference to `efi'
>> /builds/xen-project/people/andyhhp/xen/xen/drivers/acpi/osl.c:73:(.init.text+0x8ac0):
>> relocation truncated to fit: R_AARCH64_ADR_PREL_PG_HI21 against
>> undefined symbol `efi'
> 
> :/. That's because ACPI depends on UEFI. I will send a patch to update 
> the Kconfig accordingly.

Patch sent: 
https://lore.kernel.org/all/20230705115534.26004-1-julien@xen.org/

Cheers,

-- 
Julien Grall

