Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4CCA57E402
	for <lists+xen-devel@lfdr.de>; Fri, 22 Jul 2022 18:02:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.373332.605479 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEv60-0007ZF-Kj; Fri, 22 Jul 2022 16:01:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 373332.605479; Fri, 22 Jul 2022 16:01:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEv60-0007XE-I2; Fri, 22 Jul 2022 16:01:44 +0000
Received: by outflank-mailman (input) for mailman id 373332;
 Fri, 22 Jul 2022 16:01:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fVTW=X3=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1oEv5z-0007X8-Si
 for xen-devel@lists.xenproject.org; Fri, 22 Jul 2022 16:01:44 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9178496d-09d7-11ed-924f-1f966e50362f;
 Fri, 22 Jul 2022 18:01:41 +0200 (CEST)
Received: from [10.10.1.138] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1658505688401753.8926392556864;
 Fri, 22 Jul 2022 09:01:28 -0700 (PDT)
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
X-Inumbo-ID: 9178496d-09d7-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; t=1658505690; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Cm1knlTpxvwD9nyLIZ6OmDmvdSbz7fJZgectueq1HNvAXuWd5LFCOpGuMVjS3ghJGRhHchKR+86Sfw5qf5YPCQ66uSXcmPDAVe7KZfXfEX6c56htoILRoaWbgSs+eb4QXcSDF/8N9zHqW8yuvfMppx0NSrQLgZgncpIV8X8d5+U=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1658505690; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=OAXmiiKbq7UJHEAdgQrye9BMYL7fkx6s7TFjFyt1RCc=; 
	b=YlvjywEQZmJIoS0cGHiWcXFgyxAR7ntqi0hiKqg/PkvY/KDG/df8vGmkZHPjx+zMHR4uhSadiX8baJU4iHWF3EmvixsZVQ1hBECpT2p+G6LJ5+ygXo0uAqfV6Cp9gt4zI9mDvDLeCqyIPt9aZty+YzFLw6EAhVAMsbpl/3ldDFg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1658505690;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:To:To:Cc:Cc:References:From:From:Subject:Subject:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=OAXmiiKbq7UJHEAdgQrye9BMYL7fkx6s7TFjFyt1RCc=;
	b=j54O6yJppFJw5tlGD5z9zFL+NTWlFgZrijhg7Gmh+qT1gej42HVhp44geCx/yo9l
	WTLNJzXWPYPz4m7UYJqVUV3pe4OUTuy8geUrfMXZk2XpdFRoQzMiNnTnrWBgvdD3tz1
	AVqiPbVh+2eqUssdhnnpBlLOsZclOpioH269RgYQ=
Message-ID: <b33b9450-fce8-0629-1234-091fc7e6bacc@apertussolutions.com>
Date: Fri, 22 Jul 2022 12:01:04 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: scott.davis@starlab.io, christopher.clark@starlab.io,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Wei Liu <wl@xen.org>
References: <20220706210454.30096-1-dpsmith@apertussolutions.com>
 <20220706210454.30096-3-dpsmith@apertussolutions.com>
 <39c02342-649b-1f9f-f685-27efb7293c69@suse.com>
 <73cd6f59-a9d4-8767-6732-0eaae851d8fe@apertussolutions.com>
 <b70ef714-a097-3039-b4d8-706bc9cf1c51@suse.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v1 02/18] introduction of generalized boot info
In-Reply-To: <b70ef714-a097-3039-b4d8-706bc9cf1c51@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 7/21/22 12:00, Jan Beulich wrote:
> On 21.07.2022 16:28, Daniel P. Smith wrote:
>> On 7/19/22 09:11, Jan Beulich wrote:
>>> On 06.07.2022 23:04, Daniel P. Smith wrote:
>>>> --- /dev/null
>>>> +++ b/xen/arch/x86/include/asm/bootinfo.h
>>>> @@ -0,0 +1,48 @@
>>>> +#ifndef __ARCH_X86_BOOTINFO_H__
>>>> +#define __ARCH_X86_BOOTINFO_H__
>>>> +
>>>> +/* unused for x86 */
>>>> +struct arch_bootstring { };
>>>> +
>>>> +struct __packed arch_bootmodule {
>>>> +#define BOOTMOD_FLAG_X86_RELOCATED      1U << 0
>>>
>>> Such macro expansions need parenthesizing.
>>
>> Ack.
>>
>>>> +    uint32_t flags;
>>>> +    uint32_t headroom;
>>>> +};
>>>
>>> Since you're not following any external spec, on top of what Julien
>>> said about the __packed attribute I'd also like to point out that
>>> in many cases here there's no need to use fixed-width types.
>>
>> Oh, I forgot to mention that in the reply to Julien. Yes, the __packed
>> is needed to correctly cross the 32bit to 64bit bridge from the x86
>> bootstrap in patch 4.
> 
> I'm afraid I don't follow you here. I did briefly look at patch 4 (but
> that really also falls in the "wants to be split" category), but I
> can't see why a purely internally used struct may need packing. I'd
> appreciate if you could expand on that.

Originally, patch 3 and patch 4 were a single patch, and obviously was
way too large. To split them, I realized I could introduce a temporary
conversion function that would allow the patch to be split into a post
start_xen() patch (patch 3) and a pre start_xen() patch, (patch 4). For
x86, pre start_xen() consists of 3 different entry points. These being
the classic/traditional/old multiboot1/2 entry, EFI entry, and PVH entry
(aka Xen Guest). The latter two are all internal, 64bit, but the former
is located in arch/x86/boot and is compiled as 32bit. I tried different
approaches to support using a single header between these two
environments. Ultimately, IMHO, the cleanest approach is what is
introduced in patch 4 as it enabled the use of Xen types in the
structures and maintain a single structure that need to be passed
around. To do this, a 32bit specific version of the structures were
defined in arch/x86/boot/boot_info32.h that is populated under 32bit
mode, then they can be fixed up after getting into start_xen() and in
64bit code. To ensure no unexpected insertion of padding, I focused on
ensuring everything was 32bit aligned and packed. As Julien pointed out,
I messed up with the use of enum as its size is not guaranteed as the
enum list grows and I forgot to consider keeping pointers 64bit aligned.

Does that help?

>>>> +struct __packed arch_boot_info {
>>>> +    uint32_t flags;
>>>> +#define BOOTINFO_FLAG_X86_MEMLIMITS  	1U << 0
>>>> +#define BOOTINFO_FLAG_X86_BOOTDEV    	1U << 1
>>>> +#define BOOTINFO_FLAG_X86_CMDLINE    	1U << 2
>>>> +#define BOOTINFO_FLAG_X86_MODULES    	1U << 3
>>>> +#define BOOTINFO_FLAG_X86_AOUT_SYMS  	1U << 4
>>>> +#define BOOTINFO_FLAG_X86_ELF_SYMS   	1U << 5
>>>> +#define BOOTINFO_FLAG_X86_MEMMAP     	1U << 6
>>>> +#define BOOTINFO_FLAG_X86_DRIVES     	1U << 7
>>>> +#define BOOTINFO_FLAG_X86_BIOSCONFIG 	1U << 8
>>>> +#define BOOTINFO_FLAG_X86_LOADERNAME 	1U << 9
>>>> +#define BOOTINFO_FLAG_X86_APM        	1U << 10
>>>> +
>>>> +    bool xen_guest;
>>>
>>> As the example of this, with just the header files being introduced
>>> here it is not really possible to figure what these fields are to
>>> be used for and hence whether they're legitimately represented here.
>>
>> I can add a comment to clarify these are a mirror of the multiboot
>> flags. These were mirrored to allow the multiboot flags to be direct
>> copied and eased the replacement locations where an mb flag is checked.
> 
> Multiboot flags? The context here is the "xen_guest" field.

Apologies, I thought you were referring to all the fields and I forgot
to explain xen_guest. So to clarify, flags is to carry the MB flags
passed up from the MB entry point and xen_guest is meant to carry the
xen_guest bool passed up from the PVH/Xen Guest entry point.

v/r,
dps

