Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEEF6366F52
	for <lists+xen-devel@lfdr.de>; Wed, 21 Apr 2021 17:39:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.114868.218996 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZEwA-00059G-Hf; Wed, 21 Apr 2021 15:38:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 114868.218996; Wed, 21 Apr 2021 15:38:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZEwA-00058r-EG; Wed, 21 Apr 2021 15:38:46 +0000
Received: by outflank-mailman (input) for mailman id 114868;
 Wed, 21 Apr 2021 15:38:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4TWb=JS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lZEw9-00058m-5N
 for xen-devel@lists.xenproject.org; Wed, 21 Apr 2021 15:38:45 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b36b8141-7719-4f80-8ccd-5e1ea4143308;
 Wed, 21 Apr 2021 15:38:44 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 46131B507;
 Wed, 21 Apr 2021 15:38:43 +0000 (UTC)
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
X-Inumbo-ID: b36b8141-7719-4f80-8ccd-5e1ea4143308
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619019523; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bpQYbSW9SyfWq939gplb9qY3MYbPo3DyCYq1sj8w6Z8=;
	b=ZV46OphOcipd0QqCJ5ray5oAgOHmFlJgP1UvDwuh8FfZv0g3KCHMSW9iclq/3sgv5ekn6z
	t5VYDzqlJZE9PJGK3UCBiiJc7s8nKKcZzOhtKUTnrXSFwee2gCPlJnVtbdYwOyHeNBCNVI
	y+sfTrKz6I73Gfh9XotDk2f4vIuScyo=
Subject: Re: [PATCH 7/8] x86/EFI: keep debug info in xen.efi
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <b327185f-db31-50c8-ec76-6ef8f2fcfdfd@suse.com>
 <96cb4039-5f43-8eac-d855-c9f1587ed2d0@suse.com>
 <YIAJP0SCq0nOKZVL@Air-de-Roger>
 <6023c1d3-4f50-d207-1ea1-30dd1d5f68d2@suse.com>
 <YIBFD4i6bLaeaXdE@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3cda296d-e88e-5fe0-4924-4cf974c4f909@suse.com>
Date: Wed, 21 Apr 2021 17:38:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <YIBFD4i6bLaeaXdE@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 21.04.2021 17:30, Roger Pau Monné wrote:
> On Wed, Apr 21, 2021 at 03:06:36PM +0200, Jan Beulich wrote:
>> On 21.04.2021 13:15, Roger Pau Monné wrote:
>>> On Thu, Apr 01, 2021 at 11:47:03AM +0200, Jan Beulich wrote:
>>>> --- a/xen/arch/x86/xen.lds.S
>>>> +++ b/xen/arch/x86/xen.lds.S
>>>> @@ -312,10 +312,60 @@ SECTIONS
>>>>      *(.reloc)
>>>>      __base_relocs_end = .;
>>>>    }
>>>> -  /* Trick the linker into setting the image size to exactly 16Mb. */
>>>> -  . = ALIGN(__section_alignment__);
>>>> -  DECL_SECTION(.pad) {
>>>> -    . = ALIGN(MB(16));
>>>> +  .debug_abbrev ALIGN(1) (NOLOAD) : {
>>>> +     *(.debug_abbrev)
>>>> +  }
>>>> +  .debug_info ALIGN(1) (NOLOAD) : {
>>>> +    *(.debug_info)
>>>> +    *(.gnu.linkonce.wi.*)
>>>> +  }
>>>> +  .debug_types ALIGN(1) (NOLOAD) : {
>>>> +    *(.debug_types)
>>>> +  }
>>>> +  .debug_str ALIGN(1) (NOLOAD) : {
>>>> +    *(.debug_str)
>>>> +  }
>>>> +  .debug_line ALIGN(1) (NOLOAD) : {
>>>> +    *(.debug_line)
>>>> +    *(.debug_line.*)
>>>> +  }
>>>> +  .debug_line_str ALIGN(1) (NOLOAD) : {
>>>> +    *(.debug_line_str)
>>>> +  }
>>>> +  .debug_names ALIGN(4) (NOLOAD) : {
>>>> +    *(.debug_names)
>>>> +  }
>>>> +  .debug_frame ALIGN(4) (NOLOAD) : {
>>>> +    *(.debug_frame)
>>>> +  }
>>>> +  .debug_loc ALIGN(1) (NOLOAD) : {
>>>> +    *(.debug_loc)
>>>> +  }
>>>> +  .debug_loclists ALIGN(4) (NOLOAD) : {
>>>> +    *(.debug_loclists)
>>>> +  }
>>>> +  .debug_ranges ALIGN(8) (NOLOAD) : {
>>>> +    *(.debug_ranges)
>>>> +  }
>>>> +  .debug_rnglists ALIGN(4) (NOLOAD) : {
>>>> +    *(.debug_rnglists)
>>>> +  }
>>>> +  .debug_addr ALIGN(8) (NOLOAD) : {
>>>> +    *(.debug_addr)
>>>> +  }
>>>> +  .debug_aranges ALIGN(1) (NOLOAD) : {
>>>> +    *(.debug_aranges)
>>>> +  }
>>>> +  .debug_pubnames ALIGN(1) (NOLOAD) : {
>>>> +    *(.debug_pubnames)
>>>> +  }
>>>> +  .debug_pubtypes ALIGN(1) (NOLOAD) : {
>>>> +    *(.debug_pubtypes)
>>>> +  }
>>>> +  /* Trick the linker into setting the image size to no less than 16Mb. */
>>>> +  __image_end__ = .;
>>>> +  .pad ALIGN(__section_alignment__) : {
>>>> +    . = __image_end__ < __image_base__ + MB(16) ? ALIGN(MB(16)) : .;
>>>
>>> I think this is inside an ifdef EFI region, since this is DWARF info
>>> couldn't it also be present when building with EFI disabled?
>>
>> Of course (and it's not just "could" but "will"), yet the linker will
>> do fine (and perhaps even better) without when building ELF. Also
>> note that we'll be responsible for keeping the list of sections up-to-
>> date. The linker will recognize Dwarf sections by looking for a
>> .debug_ prefix. We can't use such here (or at least I'm not aware of
>> a suitable mechanism); .debug_* would mean munging together all the
>> different kinds of Dwarf sections. Hence by limiting the explicit
>> enumeration to PE, I'm trying to avoid anomalies in ELF down the road.
> 
> Right, so we will have to keep this list of debug_ sections updated
> manually if/when more of those appear as part of DWARF updates?

Yes.

> Do we have a way to get some kind of warning or error when a new
> section not explicitly handled here appears?

ld 2.37 will start warning about such sections, as they'd land at
VA 0 and hence below image base.

> Instead of adding DWARF debug info to the xen.efi binary, is there a
> way to translate the DWARF from the ELF build into the native debug
> format for PE/COFF?

I'm unaware of a single, "native" debug format (Dwarf also isn't
specifically tied to ELF). I further don't think all of the Dwarf
bits could reasonably be expressed in another debug format.

Jan

