Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E2BC42A124
	for <lists+xen-devel@lfdr.de>; Tue, 12 Oct 2021 11:32:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.206987.362700 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maE9D-0008Gc-Mi; Tue, 12 Oct 2021 09:32:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 206987.362700; Tue, 12 Oct 2021 09:32:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maE9D-0008E0-Iz; Tue, 12 Oct 2021 09:32:35 +0000
Received: by outflank-mailman (input) for mailman id 206987;
 Tue, 12 Oct 2021 09:32:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1maE9C-0008Dg-AK
 for xen-devel@lists.xenproject.org; Tue, 12 Oct 2021 09:32:34 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1maE9A-0005sf-ME; Tue, 12 Oct 2021 09:32:32 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233] helo=[192.168.23.5])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1maE9A-0002fl-F7; Tue, 12 Oct 2021 09:32:32 +0000
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
	bh=AQv7zd/uUui1VPwcYJpZu5xIJ2rSSFd97v5wRlbSECM=; b=ib5iGHE/7Y3+ssDNApZ6RooVRJ
	WDJnHvpygXWuuNEeqV4fkZ86/AqWUJvoDwM1w4Qj1kr0MGj3fA2FBCfLlw8xoZKTSRGQxS2vaPnYx
	CYKlqu57u/c+ly08lEBP63ZdGotxCpxgh6Nua/hNpSKkmoIPgDd/LjFGKXT6NN7VEnG8=;
Message-ID: <1609e9a0-99d4-955c-1d12-477f25797bb7@xen.org>
Date: Tue, 12 Oct 2021 10:32:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.0
Subject: Re: [PATCH v6 2/2] arm/efi: load dom0 modules from DT using UEFI
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org,
 Bertrand Marquis <bertrand.marquis@arm.com>, wei.chen@arm.com,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
References: <20211011181528.17367-1-luca.fancellu@arm.com>
 <20211011181528.17367-3-luca.fancellu@arm.com>
 <alpine.DEB.2.21.2110111243290.25528@sstabellini-ThinkPad-T480s>
 <EC7165F9-09CE-4001-93ED-FA637F5ED36C@arm.com>
 <alpine.DEB.2.21.2110111415350.25528@sstabellini-ThinkPad-T480s>
 <alpine.DEB.2.21.2110111423310.25528@sstabellini-ThinkPad-T480s>
 <29cc47f2-4727-0397-db0c-a6c1f5a52bf7@xen.org>
 <alpine.DEB.2.21.2110111813510.25528@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.21.2110111813510.25528@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 12/10/2021 02:31, Stefano Stabellini wrote:
> On Mon, 11 Oct 2021, Julien Grall wrote:
>> Hi Stefano,
>>
>> On 11/10/2021 22:24, Stefano Stabellini wrote:
>>>> diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
>>>> index 840728d6c0..076b827bdd 100644
>>>> --- a/xen/arch/arm/efi/efi-boot.h
>>>> +++ b/xen/arch/arm/efi/efi-boot.h
>>>> @@ -713,10 +713,12 @@ static int __init handle_module_node(EFI_FILE_HANDLE
>>>> dir_handle,
>>>>        char mod_string[24]; /* Placeholder for module@ + a 64-bit number +
>>>> \0 */
>>>>        int uefi_name_len, file_idx, module_compat;
>>>>        module_name *file;
>>>> +    const char *compat_string = is_domu_module ? "multiboot,module" :
>>>> +                                "xen,multiboot-module";
>>>>          /* Check if the node is a multiboot,module otherwise return */
>>>>        module_compat = fdt_node_check_compatible(fdt, module_node_offset,
>>>> -                                              "multiboot,module");
>>>> +                                              compat_string);
>>>>        if ( module_compat < 0 )
>>>>            /* Error while checking the compatible string */
>>>>            return ERROR_CHECK_MODULE_COMPAT;
>>>
>>>
>>> Well... not exactly like this because this would stop a normal
>>> "multiboot,module" dom0 kernel from being recognized.
>>>
>>> So we need for domU: only "multiboot,module"
>>> For Dom0, either "multiboot,module" or "xen,multiboot-module"
>>
>> Looking at the history, xen,multiboot-module has been considered as a legacy
>> binding since before UEFI was introduced. In fact, without this series, I
>> believe, there is limited reasons for the compatible to be present in the DT
>> as you would either use grub (which use the new compatible) or xen.cfg (the
>> stub will create the node).
>>
>> So I would argue that this compatible should not be used in combination with
>> UEFI and therefore we should not handle it. This would make the code simpler
>> :).
> 
> What you suggested is a viable option, however ImageBuilder is still
> using the "xen,multiboot-module" format somehow today (no idea why) and
> we have the following written in docs/misc/arm/device-tree/booting.txt:
> 
> 	Xen 4.4 supported a different set of legacy compatible strings
> 	which remain supported such that systems supporting both 4.4
> 	and later can use a single DTB.
> 
> 	- "xen,multiboot-module" equivalent to "multiboot,module"
> 	- "xen,linux-zimage"     equivalent to "multiboot,kernel"
> 	- "xen,linux-initrd"     equivalent to "multiboot,ramdisk"
> 
> 	For compatibility with Xen 4.4 the more specific "xen,linux-*"
> 	names are non-optional and must be included.
> 
> My preference is to avoid breaking compatibility (even with UEFI
> booting). The way I suggested above is one way to do it.

I understand that from the documentation PoV we claim that the legacy 
bindings is supported in EFI. However, looking at the code, I don't 
think we ever supported them.

Indeed, the function efi_arch_use_config_file() has always only looked 
for nodes contains the compatible "multiboot,module". If there are none 
present, then the stub would require to have a xen.cfg present.

> 
> But I don't feel strongly about this at all, I am fine with ignoring
> "xen,multiboot-module" in the EFI stub.

I think this has always been the case for the past 7 years (or so). This 
leads me to think that nobody ever used UEFI in combination of 
ImageBuilder and therefore I think...

> I can get ImageBuilder fixed
> very quickly (I should do that in any case).

... it is more suitable to fix ImageBuilder over trying to add 
retrospectively a legacy binding in the UEFI stub.

> If we are going to ignore
> "xen,multiboot-module" then we probably want to update the text in
> docs/misc/arm/device-tree/booting.txt also.

I agree the docs probably wants to be updated. Although, I think this 
should happen in a separate patch because this doesn't look a new problem.

Cheers,

-- 
Julien Grall

