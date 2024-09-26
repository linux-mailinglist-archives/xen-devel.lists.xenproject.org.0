Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E4A9876E4
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2024 17:49:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.805664.1216817 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stqjR-0008Pj-CG; Thu, 26 Sep 2024 15:48:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 805664.1216817; Thu, 26 Sep 2024 15:48:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stqjR-0008Mq-8V; Thu, 26 Sep 2024 15:48:41 +0000
Received: by outflank-mailman (input) for mailman id 805664;
 Thu, 26 Sep 2024 15:48:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SdHj=QY=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1stqjP-0008Mk-Rl
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2024 15:48:39 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ca65b530-7c1e-11ef-99a2-01e77a169b0f;
 Thu, 26 Sep 2024 17:48:37 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1727365708730543.5536461193848;
 Thu, 26 Sep 2024 08:48:28 -0700 (PDT)
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
X-Inumbo-ID: ca65b530-7c1e-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1727365710; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=A2tlIfZtm03vb/y0KdYBs68iRwMTQq7OTe0TLiqYvt8oPfEgTXQFaFDKaavcXEE6tsVj01eNRQqFn0NF76O/4OuhK4V4no61hs8pRAviCBsR0kd5I+u547iKGa2GRHApDiAubs4shUYrZGwZpqP8yT+z8VtekPVkBtTGRgyLFzY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1727365710; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=4Alj3LTYMBhpm+HJy3lkKfqrBAk0tSgBQ5EFAcw8h8I=; 
	b=GL4dYt2KPkKcAT2o1vP/p/UQ1huDiToBeo232gnb+4vLDHKo8qWrV5b3mkyBQn41tD0MxS74CK4lx/NPzOK6BGSCXw3kIDrrcYFnD904+hqykyXny4Sd1VSyKoAYlMnIyfVqhQCvs75vi+zUk+5MkdoqTQyZ/ZtQudS6luEaM8o=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1727365710;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=4Alj3LTYMBhpm+HJy3lkKfqrBAk0tSgBQ5EFAcw8h8I=;
	b=fRPI8zVFIqT0KTQlInu1LajZunzfCa/pNdsRV2EcCNxxXd8u9SC4HHIEXUq2tS4d
	6GDiP0smHikQ5UUaee1Vbd20xbiL+0dQ2Of8M5hpzQXBz7aKQZWjymEgcZ5Waf3GvTB
	rTg0gBingQOg+VUEfcijZWszAxTef+KUywGrgj0Q=
Message-ID: <982ffc14-b916-495b-991d-b010a7eda46a@apertussolutions.com>
Date: Thu, 26 Sep 2024 11:48:27 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/44] x86/boot: move mmap info to boot info
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20240830214730.1621-1-dpsmith@apertussolutions.com>
 <20240830214730.1621-5-dpsmith@apertussolutions.com>
 <1a185804-2ffe-4d70-8219-b55992836ac6@citrix.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Autocrypt: addr=dpsmith@apertussolutions.com; keydata=
 xsJuBFYrueARCACPWL3r2bCSI6TrkIE/aRzj4ksFYPzLkJbWLZGBRlv7HQLvs6i/K4y/b4fs
 JDq5eL4e9BdfdnZm/b+K+Gweyc0Px2poDWwKVTFFRgxKWq9R7McwNnvuZ4nyXJBVn7PTEn/Z
 G7D08iZg94ZsnUdeXfgYdJrqmdiWA6iX9u84ARHUtb0K4r5WpLUMcQ8PVmnv1vVrs/3Wy/Rb
 foxebZNWxgUiSx+d02e3Ad0aEIur1SYXXv71mqKwyi/40CBSHq2jk9eF6zmEhaoFi5+MMMgX
 X0i+fcBkvmT0N88W4yCtHhHQds+RDbTPLGm8NBVJb7R5zbJmuQX7ADBVuNYIU8hx3dF3AQCm
 601w0oZJ0jGOV1vXQgHqZYJGHg5wuImhzhZJCRESIwf+PJxik7TJOgBicko1hUVOxJBZxoe0
 x+/SO6tn+s8wKlR1Yxy8gYN9ZRqV2I83JsWZbBXMG1kLzV0SAfk/wq0PAppA1VzrQ3JqXg7T
 MZ3tFgxvxkYqUP11tO2vrgys+InkZAfjBVMjqXWHokyQPpihUaW0a8mr40w9Qui6DoJj7+Gg
 DtDWDZ7Zcn2hoyrypuht88rUuh1JuGYD434Q6qwQjUDlY+4lgrUxKdMD8R7JJWt38MNlTWvy
 rMVscvZUNc7gxcmnFUn41NPSKqzp4DDRbmf37Iz/fL7i01y7IGFTXaYaF3nEACyIUTr/xxi+
 MD1FVtEtJncZNkRn7WBcVFGKMAf+NEeaeQdGYQ6mGgk++i/vJZxkrC/a9ZXme7BhWRP485U5
 sXpFoGjdpMn4VlC7TFk2qsnJi3yF0pXCKVRy1ukEls8o+4PF2JiKrtkCrWCimB6jxGPIG3lk
 3SuKVS/din3RHz+7Sr1lXWFcGYDENmPd/jTwr1A1FiHrSj+u21hnJEHi8eTa9029F1KRfocp
 ig+k0zUEKmFPDabpanI323O5Tahsy7hwf2WOQwTDLvQ+eqQu40wbb6NocmCNFjtRhNZWGKJS
 b5GrGDGu/No5U6w73adighEuNcCSNBsLyUe48CE0uTO7eAL6Vd+2k28ezi6XY4Y0mgASJslb
 NwW54LzSSM0uRGFuaWVsIFAuIFNtaXRoIDxkcHNtaXRoQGFwZXJ0dXNzb2x1dGlvbnMuY29t
 PsJ6BBMRCAAiBQJWK7ngAhsjBgsJCAcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRBTc6WbYpR8
 KrQ9AP94+xjtFfJ8gj5c7PVx06Zv9rcmFUqQspZ5wSEkvxOuQQEAg6qEsPYegI7iByLVzNEg
 7B7fUG7pqWIfMqFwFghYhQzOwU0EViu54BAIAL6MXXNlrJ5tRUf+KMBtVz1LJQZRt/uxWrCb
 T06nZjnbp2UcceuYNbISOVHGXTzu38r55YzpkEA8eURQf+5hjtvlrOiHxvpD+Z6WcpV6rrMB
 kcAKWiZTQihW2HoGgVB3gwG9dCh+n0X5OzliAMiGK2a5iqnIZi3o0SeW6aME94bSkTkuj6/7
 OmH9KAzK8UnlhfkoMg3tXW8L6/5CGn2VyrjbB/rcrbIR4mCQ+yCUlocuOjFCJhBd10AG1IcX
 OXUa/ux+/OAV9S5mkr5Fh3kQxYCTcTRt8RY7+of9RGBk10txi94dXiU2SjPbassvagvu/hEi
 twNHms8rpkSJIeeq0/cAAwUH/jV3tXpaYubwcL2tkk5ggL9Do+/Yo2WPzXmbp8vDiJPCvSJW
 rz2NrYkd/RoX+42DGqjfu8Y04F9XehN1zZAFmCDUqBMa4tEJ7kOT1FKJTqzNVcgeKNBGcT7q
 27+wsqbAerM4A0X/F/ctjYcKwNtXck1Bmd/T8kiw2IgyeOC+cjyTOSwKJr2gCwZXGi5g+2V8
 NhJ8n72ISPnOh5KCMoAJXmCF+SYaJ6hIIFARmnuessCIGw4ylCRIU/TiXK94soilx5aCqb1z
 ke943EIUts9CmFAHt8cNPYOPRd20pPu4VFNBuT4fv9Ys0iv0XGCEP+sos7/pgJ3gV3pCOric
 p15jV4PCYQQYEQgACQUCViu54AIbDAAKCRBTc6WbYpR8Khu7AP9NJrBUn94C/3PeNbtQlEGZ
 NV46Mx5HF0P27lH3sFpNrwD/dVdZ5PCnHQYBZ287ZxVfVr4Zuxjo5yJbRjT93Hl0vMY=
In-Reply-To: <1a185804-2ffe-4d70-8219-b55992836ac6@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 9/3/24 19:18, Andrew Cooper wrote:
> On 30/08/2024 10:46 pm, Daniel P. Smith wrote:
>> Transition the memory map info to be held in struct boot_info.
>>
>> No functional change intended.
>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> ---
>>   xen/arch/x86/include/asm/bootinfo.h |  5 +++++
>>   xen/arch/x86/setup.c                | 12 +++++++++---
>>   2 files changed, 14 insertions(+), 3 deletions(-)
>>
>> diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
>> index d2ca077d2356..e785ed1c5982 100644
>> --- a/xen/arch/x86/include/asm/bootinfo.h
>> +++ b/xen/arch/x86/include/asm/bootinfo.h
>> @@ -8,11 +8,16 @@
>>   #ifndef __XEN_X86_BOOTINFO_H__
>>   #define __XEN_X86_BOOTINFO_H__
>>   
>> +#include <xen/types.h>
>> +
>>   struct boot_info {
>>       unsigned int nr_mods;
>>   
>>       const char *boot_loader_name;
>>       const char *cmdline;
>> +
>> +    paddr_t mmap_addr;
>> +    uint32_t mmap_length;
> 
> memmap please.

Ack.

>> @@ -1200,13 +1206,13 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
>>       {
>>           memmap_type = "Xen-e820";
>>       }
>> -    else if ( mbi->flags & MBI_MEMMAP )
>> +    else if ( boot_info->mmap_addr )
>>       {
>>           memmap_type = "Multiboot-e820";
>> -        while ( bytes < mbi->mmap_length &&
>> +        while ( bytes < boot_info->mmap_length &&
>>                   e820_raw.nr_map < ARRAY_SIZE(e820_raw.map) )
>>           {
>> -            memory_map_t *map = __va(mbi->mmap_addr + bytes);
>> +            memory_map_t *map = __va(boot_info->mmap_addr + bytes);
>>   
>>               /*
>>                * This is a gross workaround for a BIOS bug. Some bootloaders do
> 
> This is some very gnarly logic.  pvh_init() plays with e820_raw behind
> the scenes and doesn't set MBI_MEMMAP.
> 
> Perhaps for later cleanup too, this logic wants folding into the new
> multiboot_fill_boot_info() and leave __start_xen().

I can add another patch that focuses on moving this to 
multiboot_fill_boot_info(). If there is also a transition to 
pvh_fill_boot_info(), then the question I have is, should this be better
served as a separate function similar to my proposal with the command 
line parsing?

v/r,
dps

