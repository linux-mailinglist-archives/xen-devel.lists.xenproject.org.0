Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C23366BD6
	for <lists+xen-devel@lfdr.de>; Wed, 21 Apr 2021 15:07:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.114488.218200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZCYy-0000X7-Aa; Wed, 21 Apr 2021 13:06:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 114488.218200; Wed, 21 Apr 2021 13:06:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZCYy-0000Wl-7K; Wed, 21 Apr 2021 13:06:40 +0000
Received: by outflank-mailman (input) for mailman id 114488;
 Wed, 21 Apr 2021 13:06:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4TWb=JS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lZCYx-0000Wg-0O
 for xen-devel@lists.xenproject.org; Wed, 21 Apr 2021 13:06:39 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5bdbdbdc-5727-4d42-baef-f90f6345b8c6;
 Wed, 21 Apr 2021 13:06:38 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 46521AF3B;
 Wed, 21 Apr 2021 13:06:37 +0000 (UTC)
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
X-Inumbo-ID: 5bdbdbdc-5727-4d42-baef-f90f6345b8c6
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619010397; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P2vRYHLBXHOsV7x3MygxRE94imiXLDsi74b8duVPmSc=;
	b=AsPooKBpPkurtzdQq2Fm2Q2hiCLkTavIPgvnC/e5SzYQ37v96HF/zZRfvRBXaSRcyuTab+
	xuzI8q6GCPHDEk27Z3eGWC89KwZraYBaBrDlDI61a3fn4EAh+DHEb4T2VcmNND1QFqQU43
	PtY90FDBP8H3kytSv9xxHi6X/i4X0Mw=
Subject: Re: [PATCH 7/8] x86/EFI: keep debug info in xen.efi
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <b327185f-db31-50c8-ec76-6ef8f2fcfdfd@suse.com>
 <96cb4039-5f43-8eac-d855-c9f1587ed2d0@suse.com>
 <YIAJP0SCq0nOKZVL@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6023c1d3-4f50-d207-1ea1-30dd1d5f68d2@suse.com>
Date: Wed, 21 Apr 2021 15:06:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <YIAJP0SCq0nOKZVL@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 21.04.2021 13:15, Roger Pau Monné wrote:
> On Thu, Apr 01, 2021 at 11:47:03AM +0200, Jan Beulich wrote:
>> ... provided the linker supports it (which it does as of commit
>> 2dfa8341e079 ["ELF DWARF in PE output"]).
>>
>> Without mentioning debugging sections, the linker would put them at
>> VA 0, thus making them unreachable by 32-bit (relative or absolute)
>> relocations. If relocations were resolvable (or absent) the resulting
>> binary would have invalid section RVAs (0 - __image_base__, truncated to
>> 32 bits). Mentioning debugging sections without specifying an address
>> will result in the linker putting them all on the same RVA. A loader is,
>> afaict, free to reject loading such an image, as sections shouldn't
>> overlap. (The above describes GNU ld 2.36 behavior, which - if deemed
>> buggy - could change.)
> 
> Isn't just using (NOLOAD) to signal those sections shouldn't be
> loaded enough, and thus don't care about it's RVA?

As said in a reply earlier on another sub-thread, (NOLOAD) is meaningless
for PE. The fact that I add them nevertheless is just for docs purposes
(or if, in the future, the item gains significance).

The main problem though isn't "load" vs "no-load" but, as I thought I
have expressed in the description, that there's no "don't care about it's
RVA" in PE. All sections have to have a non-zero VA above the image base.
This is the only way via which sane RVA values can result. If sections
get placed at VA 0 (which is perfectly fine for ELF), the RVA would be a
huge negative number truncated to 32 bits. (Again, prior to binutils 2.37
this will go all silently.) Plus the respective sections would come first
(rather than last) in the binary (which by itself may or may not be a
problem for the EFI loader, but I wouldn't want to chance it).

>> --- a/xen/arch/x86/xen.lds.S
>> +++ b/xen/arch/x86/xen.lds.S
>> @@ -312,10 +312,60 @@ SECTIONS
>>      *(.reloc)
>>      __base_relocs_end = .;
>>    }
>> -  /* Trick the linker into setting the image size to exactly 16Mb. */
>> -  . = ALIGN(__section_alignment__);
>> -  DECL_SECTION(.pad) {
>> -    . = ALIGN(MB(16));
>> +  .debug_abbrev ALIGN(1) (NOLOAD) : {
>> +     *(.debug_abbrev)
>> +  }
>> +  .debug_info ALIGN(1) (NOLOAD) : {
>> +    *(.debug_info)
>> +    *(.gnu.linkonce.wi.*)
>> +  }
>> +  .debug_types ALIGN(1) (NOLOAD) : {
>> +    *(.debug_types)
>> +  }
>> +  .debug_str ALIGN(1) (NOLOAD) : {
>> +    *(.debug_str)
>> +  }
>> +  .debug_line ALIGN(1) (NOLOAD) : {
>> +    *(.debug_line)
>> +    *(.debug_line.*)
>> +  }
>> +  .debug_line_str ALIGN(1) (NOLOAD) : {
>> +    *(.debug_line_str)
>> +  }
>> +  .debug_names ALIGN(4) (NOLOAD) : {
>> +    *(.debug_names)
>> +  }
>> +  .debug_frame ALIGN(4) (NOLOAD) : {
>> +    *(.debug_frame)
>> +  }
>> +  .debug_loc ALIGN(1) (NOLOAD) : {
>> +    *(.debug_loc)
>> +  }
>> +  .debug_loclists ALIGN(4) (NOLOAD) : {
>> +    *(.debug_loclists)
>> +  }
>> +  .debug_ranges ALIGN(8) (NOLOAD) : {
>> +    *(.debug_ranges)
>> +  }
>> +  .debug_rnglists ALIGN(4) (NOLOAD) : {
>> +    *(.debug_rnglists)
>> +  }
>> +  .debug_addr ALIGN(8) (NOLOAD) : {
>> +    *(.debug_addr)
>> +  }
>> +  .debug_aranges ALIGN(1) (NOLOAD) : {
>> +    *(.debug_aranges)
>> +  }
>> +  .debug_pubnames ALIGN(1) (NOLOAD) : {
>> +    *(.debug_pubnames)
>> +  }
>> +  .debug_pubtypes ALIGN(1) (NOLOAD) : {
>> +    *(.debug_pubtypes)
>> +  }
>> +  /* Trick the linker into setting the image size to no less than 16Mb. */
>> +  __image_end__ = .;
>> +  .pad ALIGN(__section_alignment__) : {
>> +    . = __image_end__ < __image_base__ + MB(16) ? ALIGN(MB(16)) : .;
> 
> I think this is inside an ifdef EFI region, since this is DWARF info
> couldn't it also be present when building with EFI disabled?

Of course (and it's not just "could" but "will"), yet the linker will
do fine (and perhaps even better) without when building ELF. Also
note that we'll be responsible for keeping the list of sections up-to-
date. The linker will recognize Dwarf sections by looking for a
.debug_ prefix. We can't use such here (or at least I'm not aware of
a suitable mechanism); .debug_* would mean munging together all the
different kinds of Dwarf sections. Hence by limiting the explicit
enumeration to PE, I'm trying to avoid anomalies in ELF down the road.

Jan

