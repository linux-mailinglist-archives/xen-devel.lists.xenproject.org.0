Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0B181A8BF
	for <lists+xen-devel@lfdr.de>; Wed, 20 Dec 2023 23:09:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.658350.1027470 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rG4k2-0003H9-I6; Wed, 20 Dec 2023 22:08:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 658350.1027470; Wed, 20 Dec 2023 22:08:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rG4k2-0003GE-FK; Wed, 20 Dec 2023 22:08:38 +0000
Received: by outflank-mailman (input) for mailman id 658350;
 Wed, 20 Dec 2023 22:08:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rG4k1-0003G6-97
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2023 22:08:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rG4k0-0007nH-2D; Wed, 20 Dec 2023 22:08:36 +0000
Received: from 82-132-213-104.dab.02.net ([82.132.213.104] helo=[172.20.10.6])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rG4jz-0004Kv-R6; Wed, 20 Dec 2023 22:08:36 +0000
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
	bh=+TT22nLsYKA5GE1YH1+srnTUVX22F3UtqLR3fbgQleM=; b=Wx5t0GE+WGIYM/HC2DZ2etUKm1
	JMT1scXzNkfNLglQb03y4JxpxNnguwNheJotcP0rQTmN9iDsEHHhzLZSjP8YSLGyRNCjehs8vz/jO
	y/9O3nomyDNGUJDCHf60TWfvKgqmE+Qg21dwdBaCNttfTWkUNbpIaJryPLzpWmTX3Rso=;
Message-ID: <7a228bc8-7c2f-46fa-9ee6-5266f65e767b@xen.org>
Date: Wed, 20 Dec 2023 22:08:30 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] xen/common: Move Arm's bootfdt to common
Content-Language: en-GB
To: Shawn Anastasio <sanastasio@raptorengineering.com>,
 Jan Beulich <jbeulich@suse.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 xen-devel@lists.xenproject.org
References: <cover.1702607884.git.sanastasio@raptorengineering.com>
 <b26a07209b54cd036e42a8b00f036201821eb775.1702607884.git.sanastasio@raptorengineering.com>
 <3546ec55-3e0c-4fdc-9697-0105d20bacfd@suse.com>
 <5fc9ad7a-1281-46da-abff-0aa2d2beca14@xen.org>
 <69c5afde-3a24-4792-b4e5-3ce17cb1602d@suse.com>
 <cb2f543b-ef29-4174-8437-dc875c27daab@raptorengineering.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <cb2f543b-ef29-4174-8437-dc875c27daab@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 20/12/2023 20:58, Shawn Anastasio wrote:
> On 12/20/23 2:09 AM, Jan Beulich wrote:
>> On 19.12.2023 19:29, Julien Grall wrote:
>>> On 19/12/2023 17:03, Jan Beulich wrote:
>>>> On 15.12.2023 03:43, Shawn Anastasio wrote:
>>>>> --- a/xen/arch/arm/bootfdt.c
>>>>> +++ b/xen/common/device-tree/bootfdt.c
>>>>> @@ -431,12 +431,15 @@ static int __init early_scan_node(const void *fdt,
>>>>>    {
>>>>>        int rc = 0;
>>>>>    
>>>>> -    /*
>>>>> -     * If Xen has been booted via UEFI, the memory banks are
>>>>> -     * populated. So we should skip the parsing.
>>>>> -     */
>>>>> -    if ( !efi_enabled(EFI_BOOT) &&
>>>>> -         device_tree_node_matches(fdt, node, "memory") )
>>>>> +    if ( device_tree_node_matches(fdt, node, "memory") )
>>>>> +#if defined(CONFIG_ARM_EFI)
>>>>> +        /*
>>>>> +         * If Xen has been booted via UEFI, the memory banks are
>>>>> +         * populated. So we should skip the parsing.
>>>>> +         */
>>>>> +        if ( efi_enabled(EFI_BOOT) )
>>>>> +            return rc;
>>>>> +#endif
>>>>
>>>> I'm not a DT maintainer, but I don't like this kind of #ifdef, the more
>>>> that maybe PPC and quite likely RISC-V are likely to also want to support
>>>> EFI boot. But of course there may be something inherently Arm-specific
>>>> here that I'm unaware of.
>>>
>>> Right now, I can't think how this is Arm specific. If you are using
>>> UEFI, then you are expected to use the UEFI memory map rather than the
>>> content of the device-tree.
>>>
>>> However, we don't have a CONFIG_EFI option. It would be nice to
>>> introduce one but I am not sure I would introduce it just for this #ifdef.
>>
>> Right, hence why I also wasn't suggesting to go that route right away.
>> efi/common-stub.c already has a stub for efi_enabled(). Using that file
>> may be too involved to arrange for in PPC, but supplying such a stub
>> elsewhere for the time being looks like it wouldn't too much effort
>> (and would eliminate the need for any #ifdef here afaict). Shawn?
>>
> 
> To clarify, you're suggesting we add an efi_enabled stub somewhere in
> arch/ppc? I'm not against that, though it does seem a little silly to
> have to define EFI-specific functions on an architecture that will never
> support EFI.

(This is not an argument for adding efi_enabled in arch/ppc)

I am curious to know why you think that. This is just software and 
therefore doesn't seem to be technically impossible. I mean who 
originally thought that ACPI would come to Arm? :) And yet we now have 
HWs (mainly servers) which provides only ACPI + UEFI.

And before, I got asked where is the support in Xen. Yes, the work is 
still on-going :).

Anyway, back to the original ask, one option would be to introduce 
efi_enabled stub in an common header. Maybe xen/efi.h?

But I would also be ok with the existing #ifdef for now.

Cheers,

-- 
Julien Grall

