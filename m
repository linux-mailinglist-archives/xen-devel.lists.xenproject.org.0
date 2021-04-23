Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D037B368F1B
	for <lists+xen-devel@lfdr.de>; Fri, 23 Apr 2021 10:52:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.115977.221320 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZrXM-0005jg-Tj; Fri, 23 Apr 2021 08:51:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 115977.221320; Fri, 23 Apr 2021 08:51:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZrXM-0005jH-QD; Fri, 23 Apr 2021 08:51:44 +0000
Received: by outflank-mailman (input) for mailman id 115977;
 Fri, 23 Apr 2021 08:51:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vTXC=JU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lZrXL-0005jC-8v
 for xen-devel@lists.xenproject.org; Fri, 23 Apr 2021 08:51:43 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0f56d0d4-c060-497f-b9fe-5626b23edad4;
 Fri, 23 Apr 2021 08:51:41 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7BFADAFF6;
 Fri, 23 Apr 2021 08:51:40 +0000 (UTC)
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
X-Inumbo-ID: 0f56d0d4-c060-497f-b9fe-5626b23edad4
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619167900; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EJRbJARp9Jqjvbm2dOXwJ/2spzu93AyQ9/E2OwMXc3M=;
	b=ESyc+xXq2XsC8UsSy6AothWZL+k9jM/2/ckW5SCuEYgtIkFLFkWQkgK/BOX643RyimeTP0
	5Tnwg8W/YqzeN05/Jxz9jb4jkMho8lF+sTi4zHYMLDzE8quBvkzJf4PffYVB6NdxDYiGXC
	JHzKN9Qs4Z/7j/M34m6EPlfJfcClaJU=
Subject: Re: [PATCH 7/8] x86/EFI: keep debug info in xen.efi
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <YIAJP0SCq0nOKZVL@Air-de-Roger>
 <6023c1d3-4f50-d207-1ea1-30dd1d5f68d2@suse.com>
 <YIBFD4i6bLaeaXdE@Air-de-Roger>
 <3cda296d-e88e-5fe0-4924-4cf974c4f909@suse.com>
 <YIEwW3HQuTtgWH5M@Air-de-Roger>
 <a00cfe95-06bd-4999-05ab-cae737ab6f4c@suse.com>
 <YIGOrOL+pKGaHqwX@Air-de-Roger>
 <8fabc56b-8e2d-96cd-e9b2-81bf38777d52@suse.com>
 <YIGcE5Cr+xK4K6gw@Air-de-Roger>
 <98431d14-d4a0-61a8-148e-221652f37b61@suse.com>
 <YIJ3icwAoGEW/AO+@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <32bba278-12cc-d105-7b95-6a788992d70c@suse.com>
Date: Fri, 23 Apr 2021 10:51:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <YIJ3icwAoGEW/AO+@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 23.04.2021 09:30, Roger Pau Monné wrote:
> On Thu, Apr 22, 2021 at 06:01:06PM +0200, Jan Beulich wrote:
>> On 22.04.2021 17:53, Roger Pau Monné wrote:
>>> On Thu, Apr 22, 2021 at 05:46:28PM +0200, Jan Beulich wrote:
>>>> On 22.04.2021 16:56, Roger Pau Monné wrote:
>>>>> On Thu, Apr 22, 2021 at 01:03:13PM +0200, Jan Beulich wrote:
>>>>>> On 22.04.2021 10:14, Roger Pau Monné wrote:
>>>>>>> On Wed, Apr 21, 2021 at 05:38:42PM +0200, Jan Beulich wrote:
>>>>>>>> On 21.04.2021 17:30, Roger Pau Monné wrote:
>>>>>>>>> On Wed, Apr 21, 2021 at 03:06:36PM +0200, Jan Beulich wrote:
>>>>>>>>>> On 21.04.2021 13:15, Roger Pau Monné wrote:
>>>>>>>>>>> On Thu, Apr 01, 2021 at 11:47:03AM +0200, Jan Beulich wrote:
>>>>>>>>>>>> --- a/xen/arch/x86/xen.lds.S
>>>>>>>>>>>> +++ b/xen/arch/x86/xen.lds.S
>>>>>>>>>>>> @@ -312,10 +312,60 @@ SECTIONS
>>>>>>>>>>>>      *(.reloc)
>>>>>>>>>>>>      __base_relocs_end = .;
>>>>>>>>>>>>    }
>>>>>>>>>>>> -  /* Trick the linker into setting the image size to exactly 16Mb. */
>>>>>>>>>>>> -  . = ALIGN(__section_alignment__);
>>>>>>>>>>>> -  DECL_SECTION(.pad) {
>>>>>>>>>>>> -    . = ALIGN(MB(16));
>>>>>>>>>>>> +  .debug_abbrev ALIGN(1) (NOLOAD) : {
>>>>>>>>>>>> +     *(.debug_abbrev)
>>>>>>>>>>>> +  }
>>>>>>>>>>>> +  .debug_info ALIGN(1) (NOLOAD) : {
>>>>>>>>>>>> +    *(.debug_info)
>>>>>>>>>>>> +    *(.gnu.linkonce.wi.*)
>>>>>>>>>>>> +  }
>>>>>>>>>>>> +  .debug_types ALIGN(1) (NOLOAD) : {
>>>>>>>>>>>> +    *(.debug_types)
>>>>>>>>>>>> +  }
>>>>>>>>>>>> +  .debug_str ALIGN(1) (NOLOAD) : {
>>>>>>>>>>>> +    *(.debug_str)
>>>>>>>>>>>> +  }
>>>>>>>>>>>> +  .debug_line ALIGN(1) (NOLOAD) : {
>>>>>>>>>>>> +    *(.debug_line)
>>>>>>>>>>>> +    *(.debug_line.*)
>>>>>>>>>>>> +  }
>>>>>>>>>>>> +  .debug_line_str ALIGN(1) (NOLOAD) : {
>>>>>>>>>>>> +    *(.debug_line_str)
>>>>>>>>>>>> +  }
>>>>>>>>>>>> +  .debug_names ALIGN(4) (NOLOAD) : {
>>>>>>>>>>>> +    *(.debug_names)
>>>>>>>>>>>> +  }
>>>>>>>>>>>> +  .debug_frame ALIGN(4) (NOLOAD) : {
>>>>>>>>>>>> +    *(.debug_frame)
>>>>>>>>>>>> +  }
>>>>>>>>>>>> +  .debug_loc ALIGN(1) (NOLOAD) : {
>>>>>>>>>>>> +    *(.debug_loc)
>>>>>>>>>>>> +  }
>>>>>>>>>>>> +  .debug_loclists ALIGN(4) (NOLOAD) : {
>>>>>>>>>>>> +    *(.debug_loclists)
>>>>>>>>>>>> +  }
>>>>>>>>>>>> +  .debug_ranges ALIGN(8) (NOLOAD) : {
>>>>>>>>>>>> +    *(.debug_ranges)
>>>>>>>>>>>> +  }
>>>>>>>>>>>> +  .debug_rnglists ALIGN(4) (NOLOAD) : {
>>>>>>>>>>>> +    *(.debug_rnglists)
>>>>>>>>>>>> +  }
>>>>>>>>>>>> +  .debug_addr ALIGN(8) (NOLOAD) : {
>>>>>>>>>>>> +    *(.debug_addr)
>>>>>>>>>>>> +  }
>>>>>>>>>>>> +  .debug_aranges ALIGN(1) (NOLOAD) : {
>>>>>>>>>>>> +    *(.debug_aranges)
>>>>>>>>>>>> +  }
>>>>>>>>>>>> +  .debug_pubnames ALIGN(1) (NOLOAD) : {
>>>>>>>>>>>> +    *(.debug_pubnames)
>>>>>>>>>>>> +  }
>>>>>>>>>>>> +  .debug_pubtypes ALIGN(1) (NOLOAD) : {
>>>>>>>>>>>> +    *(.debug_pubtypes)
>>>>>>>>>>>> +  }
>>>>>>>>>>>> +  /* Trick the linker into setting the image size to no less than 16Mb. */
>>>>>>>>>>>> +  __image_end__ = .;
>>>>>>>>>>>> +  .pad ALIGN(__section_alignment__) : {
>>>>>>>>>>>> +    . = __image_end__ < __image_base__ + MB(16) ? ALIGN(MB(16)) : .;
>>>>>>>>>>>
>>>>>>>>>>> I think this is inside an ifdef EFI region, since this is DWARF info
>>>>>>>>>>> couldn't it also be present when building with EFI disabled?
>>>>>>>>>>
>>>>>>>>>> Of course (and it's not just "could" but "will"), yet the linker will
>>>>>>>>>> do fine (and perhaps even better) without when building ELF. Also
>>>>>>>>>> note that we'll be responsible for keeping the list of sections up-to-
>>>>>>>>>> date. The linker will recognize Dwarf sections by looking for a
>>>>>>>>>> .debug_ prefix. We can't use such here (or at least I'm not aware of
>>>>>>>>>> a suitable mechanism); .debug_* would mean munging together all the
>>>>>>>>>> different kinds of Dwarf sections. Hence by limiting the explicit
>>>>>>>>>> enumeration to PE, I'm trying to avoid anomalies in ELF down the road.
>>>>>>>>>
>>>>>>>>> Right, so we will have to keep this list of debug_ sections updated
>>>>>>>>> manually if/when more of those appear as part of DWARF updates?
>>>>>>>>
>>>>>>>> Yes.
>>>>>>>>
>>>>>>>>> Do we have a way to get some kind of warning or error when a new
>>>>>>>>> section not explicitly handled here appears?
>>>>>>>>
>>>>>>>> ld 2.37 will start warning about such sections, as they'd land at
>>>>>>>> VA 0 and hence below image base.
>>>>>>>
>>>>>>> That seems like a bug in ld?
>>>>>>>
>>>>>>> The '--image-base' option description mentions: "This is the lowest
>>>>>>> memory location that will be used when your program or dll is
>>>>>>> loaded.", so I would expect that if the option is used the default VA
>>>>>>> should be >= image-base, or else the description of the option is not
>>>>>>> consistent, as ld will still place sections at addresses below
>>>>>>> image-base.
>>>>>>
>>>>>> ld's "general" logic is pretty ELF-centric. Hence debugging sections
>>>>>> get placed at VA 0 by default, not matter what the (PE-specific)
>>>>>> --image-base says. Whether that's a bug though I'm not sure: There
>>>>>> are no really good alternatives that could be used by default. Doing
>>>>>> what we do here (and what e.g. Cygwin does) via linker script may not
>>>>>> be appropriate in the common case. In particular it is not generally
>>>>>> correct for debug info to be part of what gets loaded into memory.
>>>>>
>>>>> So with this change here you placate the warnings from newer ld about
>>>>> having a VA < image base,
>>>>
>>>> It's not just about silencing the warnings. The resulting image is
>>>> unusable when the sections don't get placed at a suitable VA.
>>>
>>> And this wasn't an issue before because the linker won't even attempt
>>> to place DWARF sections into a PE output.
>>
>> No, this wasn't an issue before since, for things to work, we
>> simply had to uniformly strip debug info when linking xen.efi. And
>> this is what Andrew said should change. I was initially opposed,
>> until I saw that Cygwin does just this as well.
> 
> Just for my own education, do you have a reference about this way of
> packaging debug data by Cygwin?

I've simply built a test program and looked at the binary. The best
reference I could think of is their default linker script in binutils
(ld/scripttempl/pep.sc).

> I've found:
> 
> https://cygwin.com/pipermail/cygwin/2003-January/090110.html
> 
> Which mentions not setting the ALLOC flag on the debug sections in
> order to prevent them from being loaded. I'm however not able to
> figure out which flag is that on the PE spec, or whether it can be set
> from the linker script.

There's no truly corresponding flag in COFF.

>>>>> but the end result is that now the debug
>>>>> sections will also get loaded when booted from the EFI loader?
>>>>> (because the NOLOAD doesn't have any effect with PE)
>>>>
>>>> Yes. I currently see no other way to retain debug info in xen.efi.
>>>> But to be clear, the memory debug info occupies isn't lost - we
>>>> still free space from _end (or alike) onwards. .reloc, for example,
>>>> also lives there. And I was wondering whether we shouldn't keep
>>>> .comment this way as well.
>>>
>>> Yes, I already realized all this is past _end.
>>>
>>> I wonder however if the use of (NOLOAD) makes all this more confusing,
>>> such sections should only be present on the linker script used for the
>>> PE output, and then the (NOLOAD) doesn't make sense there?
>>>
>>> If so, I think the (NOLOAD) directive should be dropped, and a comment
>>> noting that the debug sections need to be manually added to the PE
>>> output in order to avoid them being placed at VA 0 would be helpful
>>> IMO, likely also mentioning that they would be loaded but discarded
>>> afterwards by Xen because they are all past _end.
>>
>> Earlier on (another sub-thread, maybe) I think I've already said that
>> I'd like to keep (NOLOAD) both for documentation purposes and just in
>> case the linker develops some smarts to actually translate it into
>> anything sensible when linking PE. This is quite different from
>> .reloc, after all - that section has to be loaded for our re-
>> relocation to work correctly. Hence that section not having (NOLOAD)
>> and the debugging sections having it points out the difference.
> 
> Sure, that's all fine. I think a comment could be appropriate here, to
> note both that NOLOAD is likely useless and just used for
> documentation purposes, and to also mention the sections needs to be
> explicitly placed in the PE linker script so they are not set at VA 0.
> 
> /*
>  * Explicitly list debug section for the PE output so that they don't
>  * end up at VA 0 which is below image base and thus invalid. Also use
>  * the NOLOAD directive, even when currently ignored by PE output, in
>  * order to note those sections shouldn't be loaded into memory.
>  *
>  * Note such sections are past _end, so if loaded will be discarded by
>  * Xen anyway.
>  */
> 
> Feel free to reword or expand the comment.

Yes, I've edited it some while inserting. Will see to get to
submitting v2 then.

> Not sure there's some
> reference we could add here about how debug sections are placed in PE
> files usually.

As said before - I don't think there's any "usually" here, which is
why different environments have invented different ways. The debug
info native to COFF is more like ELF's symbol table (with a little
bit of extra information) plus Dwarf's .debug_line, but not really
fully covering what you'd expect from debug info.

Jan

