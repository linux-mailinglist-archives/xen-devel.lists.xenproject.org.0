Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A3231CB03
	for <lists+xen-devel@lfdr.de>; Tue, 16 Feb 2021 14:20:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.85843.160665 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lC0GF-0000wQ-RU; Tue, 16 Feb 2021 13:19:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 85843.160665; Tue, 16 Feb 2021 13:19:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lC0GF-0000w1-OF; Tue, 16 Feb 2021 13:19:27 +0000
Received: by outflank-mailman (input) for mailman id 85843;
 Tue, 16 Feb 2021 13:19:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+CYm=HS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lC0GE-0000vw-0H
 for xen-devel@lists.xenproject.org; Tue, 16 Feb 2021 13:19:26 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id be77653d-027b-4d95-bc34-40ebdce87f51;
 Tue, 16 Feb 2021 13:19:24 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4BA94ACBF;
 Tue, 16 Feb 2021 13:19:23 +0000 (UTC)
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
X-Inumbo-ID: be77653d-027b-4d95-bc34-40ebdce87f51
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1613481563; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QAN5Wz+ZSjzG6pV8EQCugEBAawJOPuPe6sT/ik3O//E=;
	b=Mg9xC9YHNJn8jRkUj7lf6XC70P7AHxZwHh8NlDS9fQE/IhRy92s0zLL3YjG0iIDhxmqSS8
	PYJc8o3d2w5zi1OYjg2IxsdsYuEZoDoSKGmu7s7JKvoS0cq69hNGi8dCW7g+MekPQU9uxT
	CNlBtd0Zf9HHyTBJHjaSAGsQJ3g8+c0=
Subject: Re: [PATCH] x86/EFI: work around GNU ld 2.36 issue
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <e6d59277-35b2-e7df-0e68-a794c8855ac0@suse.com>
 <8450b84d-93f2-7568-362e-af27954e5157@suse.com>
 <881b97a1-a4e3-f213-f81b-ac07ca46ed27@citrix.com>
 <5a02763e-715f-a76d-e926-87a2a4c38449@suse.com>
Message-ID: <2a3696b9-9799-ec75-508d-c2e562eb26b8@suse.com>
Date: Tue, 16 Feb 2021 14:19:22 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <5a02763e-715f-a76d-e926-87a2a4c38449@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 05.02.2021 12:13, Jan Beulich wrote:
> On 05.02.2021 11:33, Andrew Cooper wrote:
>> On 05/02/2021 08:11, Jan Beulich wrote:
>>> On 04.02.2021 14:38, Jan Beulich wrote:
>>>> Our linker capability check fails with the recent binutils release's ld:
>>>>
>>>> .../check.o:(.debug_aranges+0x6): relocation truncated to fit: R_X86_64_32 against `.debug_info'
>>>> .../check.o:(.debug_info+0x6): relocation truncated to fit: R_X86_64_32 against `.debug_abbrev'
>>>> .../check.o:(.debug_info+0xc): relocation truncated to fit: R_X86_64_32 against `.debug_str'+76
>>>> .../check.o:(.debug_info+0x11): relocation truncated to fit: R_X86_64_32 against `.debug_str'+d
>>>> .../check.o:(.debug_info+0x15): relocation truncated to fit: R_X86_64_32 against `.debug_str'+2b
>>>> .../check.o:(.debug_info+0x29): relocation truncated to fit: R_X86_64_32 against `.debug_line'
>>>> .../check.o:(.debug_info+0x30): relocation truncated to fit: R_X86_64_32 against `.debug_str'+19
>>>> .../check.o:(.debug_info+0x37): relocation truncated to fit: R_X86_64_32 against `.debug_str'+71
>>>> .../check.o:(.debug_info+0x3e): relocation truncated to fit: R_X86_64_32 against `.debug_str'
>>>> .../check.o:(.debug_info+0x45): relocation truncated to fit: R_X86_64_32 against `.debug_str'+5e
>>>> .../check.o:(.debug_info+0x4c): additional relocation overflows omitted from the output
>>>>
>>>> Tell the linker to strip debug info as a workaround. Oddly enough debug
>>>> info has been getting stripped when linking the actual xen.efi, without
>>>> me being able to tell why this would be.
>>> I've changed this to
>>>
>>> "Tell the linker to strip debug info as a workaround. Debug info has been
>>>  getting stripped already anyway when linking the actual xen.efi."
>>>
>>> as I noticed I did look for -S only yesterday, while we have
>>>
>>> EFI_LDFLAGS += --image-base=$(1) --stack=0,0 --heap=0,0 --strip-debug
>>
>> So, in terms of the bugfix, Acked-by: Andrew Cooper
>> <andrew.cooper3@citrix.com>
> 
> Thanks.
> 
>> However, we ought be keeping the debug symbols for xen-syms.efi (or
>> equiv) seeing as there is logic included here which isn't in the regular
>> xen-syms.
> 
> Well, perhaps. Besides the 2.36 binutils regression needing fixing
> (or preventing us to avoid the stripping in case that's the linker
> version used), there are a few more points relevant here:
> 
> - Checking with a random older binutils (2.32) I observe the linker
>   working fine, but our mkreloc utility choking on the (admittedly
>   suspicious, at least at the first glance) output. This may be
>   possible to deal with, but still.
> 
> - It would need checking whether the resulting binary works at all.
>   All the .debug_* sections come first. Of course there are surely
>   again ways to overcome this (albeit it smells like a binutils
>   bug).

I've now convinced myself that the resulting images wouldn't work.
This can be hacked around in binutils, presumably, but the question
is whether that's worth it: A correct binary would include the
entire debug data as part of the loadable image, i.e. would require
quite a bit of memory (and time) for EFI to load. This is because
of requirements resulting from (I'm inclined to say shortcomings
in) how at least some of the PE loaders works.

On the positive side, while investigating I came across a change
(a little over a year ago) to binutils that - if working
correctly (not tried out yet) - could allow us to avoid the use of
our mkreloc tool.

> - While in ELF binaries the particular .debug_* sections are
>   conventionally assumed to hold Dwarf debug info, no such
>   assumption is true for PE executables. In particular I observe
>   objdump (2.32 as well as 2.36) to merely dump the COFF symbol
>   table when handed -g. Are you aware of consumers of the
>   information, if we indeed kept it?

I noticed Cygwin uses Dwarf in PE images, so there is at least a
precedent.

Jan

