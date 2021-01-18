Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A412F9D56
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jan 2021 11:59:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.69586.124658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1SG1-0007tr-GL; Mon, 18 Jan 2021 10:59:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 69586.124658; Mon, 18 Jan 2021 10:59:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1SG1-0007tS-D4; Mon, 18 Jan 2021 10:59:37 +0000
Received: by outflank-mailman (input) for mailman id 69586;
 Mon, 18 Jan 2021 10:59:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=d36Q=GV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l1SFz-0007tN-Vb
 for xen-devel@lists.xenproject.org; Mon, 18 Jan 2021 10:59:36 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fb040459-c7ff-4d85-b758-541d3b098e48;
 Mon, 18 Jan 2021 10:59:30 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 865E2ACF4;
 Mon, 18 Jan 2021 10:59:29 +0000 (UTC)
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
X-Inumbo-ID: fb040459-c7ff-4d85-b758-541d3b098e48
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610967569; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W4tibr/Sj7BHPOd2meBDfjea1p9DSVPit3fIuT6uo3Y=;
	b=LBnSV0NO01AQ5TU+nVSI+Sm9qp3wdTkAcJd7WyPCGrtaMZt6m/sFjOjvGIY6/dYSt/braz
	JU6xtkvc1JcXW6Lx3JHF137m16mx0t+P8iI98SiW4/unkPUzML6h4fZiMCCDJymWDXae+M
	bSf+Iix0T5/Fe4rR5XNLjMB6E+eRPsg=
Subject: Re: [PATCH 1/3] introduce unaligned.h
To: Julien Grall <julien@xen.org>
Cc: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 M A Young <m.a.young@durham.ac.uk>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <0eba95b9-66eb-2692-1da1-c27784b9f51e@suse.com>
 <12f26ab9-8a8c-19f0-ea65-8b354bd326a6@suse.com>
 <8c459039-a27a-01e5-0143-7c9b6e019e42@citrix.com>
 <78ecd61e-bdfb-169c-1db3-b9914fca7f3d@suse.com>
 <6afa47a8-aa63-f8aa-c648-e5e8e51b845a@suse.com>
 <70ad73e4-c9d2-ec55-dc40-14567a0838af@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3aaac5be-b5ef-674f-8671-dbe27aa3fd8c@suse.com>
Date: Mon, 18 Jan 2021 11:59:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <70ad73e4-c9d2-ec55-dc40-14567a0838af@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 18.01.2021 11:45, Julien Grall wrote:
> On 18/01/2021 09:33, Jan Beulich wrote:
>> On 15.01.2021 12:27, Jan Beulich wrote:
>>> On 15.01.2021 12:13, Andrew Cooper wrote:
>>>> On 15/01/2021 10:05, Jan Beulich wrote:
>>>>> Rather than open-coding commonly used constructs in yet more places when
>>>>> pulling in zstd decompression support (and its xxhash prereq), pull out
>>>>> the custom bits into a commonly used header (for the hypervisor build;
>>>>> the tool stack and stubdom builds of libxenguest will still remain in
>>>>> need of similarly taking care of). For now this is limited to x86, where
>>>>> custom logic isn't needed (considering this is going to be used in init
>>>>> code only, even using alternatives patching to use MOVBE doesn't seem
>>>>> worthwhile).
>>>>>
>>>>> No change in generated code.
>>>>>
>>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>> ---
>>>>> Iirc use of include/asm-generic/ was disliked, hence the generic header
>>>>> goes into include/xen/.
>>>>
>>>> Really?  I think its going to be the only sane way of fixing up some of
>>>> our header tangle.
>>>>
>>>> This series probably isn't the right place to fix this argument, so
>>>> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>
>>> Thanks.
>>>
>>>> However, presumably we're going to want an ARM side of this imminently?
>>>
>>> Why? It's only used (and going to be further used) by code not
>>> built for Arm. So while it certainly would be nice for such a
>>> header to also appear there (and the x86-special casing going
>>> away in patch 2), it's not a strict requirement at this point.
>>> Therefore I'd prefer to leave this to the Arm maintainers (and
>>> probably for 4.16).
>>
>> I was wrong here, when it comes to an Arm64 build with ACPI
>> support enabled. xen/arch/arm/efi/efi-dom0.c has
>>
>> #define XZ_EXTERN STATIC
>> #include "../../../common/xz/crc32.c"
>>
>> in order to later do
>>
>>      xz_crc32_init();
>>      efi_sys_tbl->Hdr.CRC32 = xz_crc32((uint8_t *)efi_sys_tbl,
>>                                        efi_sys_tbl->Hdr.HeaderSize, 0);
>>
>> Urgh. Why in the world does xz code get re-used like this?
>> If we need generic crc32 support, such should imo live in
>> xen/lib/.
> 
> I suspect this was in order to make the EFI stub completely independent 
> to Xen (this is the case for Linux Arm). It turns out we now have an 
> hybrid model as we re-use pass some information in the DT and other via 
> variables.
> 
>>
>> So we have two possible courses of action: Eliminate this
>> unsuitable re-use of code, or introduce asm/unaligned.h
>> for Arm (or at least Arm64, in case it makes a difference)
>> right away.
> 
> EFI stub is only supported for Arm64. So it should be sufficient to 
> introduce the asm/unaligned.h on Arm64.
> 
> Note that on Arm32 we forbid unaligned access. So we may need two set of 
> helpers (I haven't looked at what the header does).

IOW it might be possible that Arm64 could re-use the x86 header.
Unless the price of unaligned accesses is much higher there. But
anyway, I'm about to commit the series with the issues addressed
using the 3rd approach, outlined earlier in a separate reply.

Jan

