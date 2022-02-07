Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C58C4AC96F
	for <lists+xen-devel@lfdr.de>; Mon,  7 Feb 2022 20:25:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.267412.461159 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH9cf-0003b0-Oo; Mon, 07 Feb 2022 19:24:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 267412.461159; Mon, 07 Feb 2022 19:24:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH9cf-0003Xw-L7; Mon, 07 Feb 2022 19:24:25 +0000
Received: by outflank-mailman (input) for mailman id 267412;
 Mon, 07 Feb 2022 19:24:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nH9ce-0003Xq-Lk
 for xen-devel@lists.xenproject.org; Mon, 07 Feb 2022 19:24:24 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nH9cU-0002c2-SF; Mon, 07 Feb 2022 19:24:14 +0000
Received: from 54-240-197-226.amazon.com ([54.240.197.226] helo=[10.85.34.134])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nH9cU-00070F-K7; Mon, 07 Feb 2022 19:24:14 +0000
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
	bh=p69XJ0hdfEN0/M4op2DGkrF+U6ZHhEPVTZpgEMa0jYk=; b=TjlYrBO7dtKPOj41w2ohexNTVL
	ur7gFugSDkj+zVbLECscrYTPXYBvrAp12UkL+dwyukbXdhO4aqg8uRWab3fIK7T3+uDSA1Js4cBGq
	Oq7mFyvEThJHvTEn6pYZ2KmFMeImwwqMF4PWID18tqt8nacrILPl8/Vi9o9WjY4e7eRA=;
Message-ID: <1bd5cef7-a83b-cd51-2ae1-ae2f6db00385@xen.org>
Date: Mon, 7 Feb 2022 19:24:12 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH RFC 3/3] xen: Introduce a platform sub-op to retrieve the
 VGA information
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Jan Beulich <jbeulich@suse.com>
Cc: ehem+xen@m5p.com, Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220206192839.75711-1-julien@xen.org>
 <20220206192839.75711-4-julien@xen.org>
 <4da70949-7d6c-65a4-662a-301bb7075bc0@suse.com>
 <YgEJWLF/yp8YkU2M@Air-de-Roger>
From: Julien Grall <julien@xen.org>
In-Reply-To: <YgEJWLF/yp8YkU2M@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Roger,

On 07/02/2022 11:58, Roger Pau Monné wrote:
> On Mon, Feb 07, 2022 at 09:57:55AM +0100, Jan Beulich wrote:
>> On 06.02.2022 20:28, Julien Grall wrote:
>>> From: Julien Grall <jgrall@amazon.com>
>>>
>>> When using EFI, the VGA information is fetched using the EFI
>>> boot services. However, Xen will have exited the boot services.
>>> Therefore, we need to find a different way to pass the information
>>> to dom0.
>>>
>>> For PV dom0, they are part of the start_info. But this is not
>>> something that exists on Arm. So the best way would to be to
>>> use a hypercall.
>>>
>>> For now the structure layout is based on dom0_vga_console_info
>>> for convenience. I am open on another proposal.
>>>
>>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>
>> Cc-ing Roger as this may want using for PVH Dom0 also on x86; my
>> first attempt to propagate this information was rejected.
> 
> I think it's easier to use a Xen specific layout in XENPF, as that's
> already a Xen specific interface.
> 
> I wonder however if passing the information here (instead of doing it
> in the start info or equivalent) could cause a delay in the
> initialization of the video console.

My current plan for Arm is to issue the hypercall as part of an 
earlyinit call. But we can do much earlier (i.e. xen_early_init() which 
is called from setup_arch()) if necessary.

This should be early enough for Arm. How about x86?

> I guess the same happens when
> using the Xen consoles (either the hypercall one or the shared ring),
> so it's fine.
> 
>>> --- a/xen/include/public/platform.h
>>> +++ b/xen/include/public/platform.h
>>> @@ -244,6 +244,7 @@ DEFINE_XEN_GUEST_HANDLE(xenpf_efi_runtime_call_t);
>>>   #define  XEN_FW_EFI_PCI_ROM        5
>>>   #define  XEN_FW_EFI_APPLE_PROPERTIES 6
>>>   #define XEN_FW_KBD_SHIFT_FLAGS    5
>>> +#define XEN_FW_VGA_INFO           6
>>
>> Perhaps s/VGA/VIDEO/, despite ...
>>
>>>   struct xenpf_firmware_info {
>>>       /* IN variables. */
>>>       uint32_t type;
>>> @@ -311,6 +312,7 @@ struct xenpf_firmware_info {
>>>   
>>>           /* Int16, Fn02: Get keyboard shift flags. */
>>>           uint8_t kbd_shift_flags; /* XEN_FW_KBD_SHIFT_FLAGS */
>>> +        struct dom0_vga_console_info vga;
>>
>> ... the structure name including "vga" (but if the #define is adjusted,
>> the field name would want to become "video" as well).
> 

[...]

(Re-ordered the quote as it makes more sense for my reply)

> There's no need to propagate XEN_VGATYPE_TEXT_MODE_3 into this
> interface.

So for Arm, we are only caring about XEN_VGATYPE_EFI_LFB. I wasn't sure 
what would be your need on x86. Hence, why I keep it.

If you don't need then, then I am happy to trim the structure for the 
new hypercall.

 > It's my understanding that this will forcefully be
 > XEN_VGATYPE_EFI_LFB, at which point we could consider giving a type
 > name to the vesa_lfb field of dom0_vga_console_info (video_lfb) and
 > use the same struct here?>

Just to clarify, are you suggesting to only pass video_lfb? IOW, we will 
always assume it is an EFI framebuffer and not pass the video_type.

Cheers,

-- 
Julien Grall

