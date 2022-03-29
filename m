Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6C74EABF9
	for <lists+xen-devel@lfdr.de>; Tue, 29 Mar 2022 13:10:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.295796.503503 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZ9jV-0005wG-De; Tue, 29 Mar 2022 11:09:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 295796.503503; Tue, 29 Mar 2022 11:09:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZ9jV-0005uR-AN; Tue, 29 Mar 2022 11:09:53 +0000
Received: by outflank-mailman (input) for mailman id 295796;
 Tue, 29 Mar 2022 11:09:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AGgI=UI=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1nZ9jU-0005uJ-4x
 for xen-devel@lists.xenproject.org; Tue, 29 Mar 2022 11:09:52 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id c017ccbe-af50-11ec-8fbc-03012f2f19d4;
 Tue, 29 Mar 2022 13:09:50 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1B21F23A;
 Tue, 29 Mar 2022 04:09:49 -0700 (PDT)
Received: from [10.57.6.94] (unknown [10.57.6.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D42C73F66F;
 Tue, 29 Mar 2022 04:09:45 -0700 (PDT)
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
X-Inumbo-ID: c017ccbe-af50-11ec-8fbc-03012f2f19d4
Message-ID: <56c21118-b47d-4405-8b27-bc4923d15822@arm.com>
Date: Tue, 29 Mar 2022 13:09:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 2/2] xen: Populate xen.lds.h and make use of its macros
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20220322080233.53134-1-michal.orzel@arm.com>
 <20220322080233.53134-3-michal.orzel@arm.com>
 <2940b4c8-5d44-695e-4550-0a32c3a4c053@xen.org>
 <d5bccf50-c74a-40e6-843e-3ad682647efb@arm.com>
 <5121de30-644f-8a1f-ff1a-29c4d2ee7f0f@xen.org>
From: Michal Orzel <michal.orzel@arm.com>
In-Reply-To: <5121de30-644f-8a1f-ff1a-29c4d2ee7f0f@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 29.03.2022 12:54, Julien Grall wrote:
> Hi,
> 
> On 29/03/2022 11:12, Michal Orzel wrote:
>> On 29.03.2022 11:54, Julien Grall wrote:
>>> Hi,
>>>
>>> On 22/03/2022 08:02, Michal Orzel wrote:
>>>> Populate header file xen.lds.h with the first portion of macros storing
>>>> constructs common to x86 and arm linker scripts. Replace the original
>>>> constructs with these helpers.
>>>>
>>>> No functional improvements to x86 linker script.
>>>>
>>>> Making use of common macros improves arm linker script with:
>>>> -explicit list of debug sections that otherwise are seen as "orphans"
>>>
>>> NIT: This is a bit confusing to see no space after -. Can you add one?
>>>
>> Ok.
>>
>>> I would also recommend to start with (soft)tab to make clearer this is a list.
>>>
>>> Same goes for the  other use below.
>>>
>> Ok.
>>
>>>
>>>> by the linker. This will allow to fix issues after enabling linker
>>>> option --orphan-handling one day
>>>> -extended list of discarded section to include: .discard, desctructors
>>>
>>> Typo: s/desctructors/destructors/
>>>
>> Ok.
>>
>>>> related sections, .fini_array which can reference .text.exit
>>>> -sections not related to debugging that are placed by ld.lld.
>>>> Even though Xen on arm compilation with LLVM support is not ready yet,
>>>
>>> Building natively Xen on Arm with Clang works. So do you mean you using LLD?
>>>
>> I mean using the LLVM replacements not only for CC + supporting cross-compilation.
>> As for the linker, Xen sets llvm-ld which is very very old and in fact README states
>> LLVM 3.5 or later but llvm-ld was removed before that.
> 
> I am confused. I looked at the llvm repo and lld is still there. So why are you saying is lld is very old and removed?
> 
lld is not llvm-ld. I'm talking about llvm-ld. lld is the current LLVM linker. Xen sets LD to llvm-ld which has been removed in 3.2:
See: https://releases.llvm.org/3.2/docs/ReleaseNotes.html

>> Thus IMO support for LLVM on arm
>> is not ready yet.
> 
> I agree that building Xen on Arm only with LLVM tools is not possible yet. But this statement seems to be a bit too broad here. I think what matters is we don't support linking with LLD on Arm.
> 
>>>> these sections do not cause problem to GNU ld.
>>>>
>>>> Please note that this patch does not aim to perform the full sync up
>>>> between the linker scripts. It creates a base for further work.
>>>>
>>>> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
>>>
>>> [...]
>>>
>>>> diff --git a/xen/include/xen/xen.lds.h b/xen/include/xen/xen.lds.h
>>>> index dd292fa7dc..ad1d199021 100644
>>>> --- a/xen/include/xen/xen.lds.h
>>>> +++ b/xen/include/xen/xen.lds.h
>>>> @@ -5,4 +5,104 @@
>>>>     * Common macros to be used in architecture specific linker scripts.
>>>>     */
>>>>    +/* Macros to declare debug sections. */
>>>> +#ifdef EFI
>>>
>>> AFAIK, we don't define EFI on Arm (just CONFIG_EFI). Yet we do support EFI on arm64.
>>>
>>> As this #ifdef is now in generic code, can you explain how this is meant to be used?
>>>
>> As we do not define EFI on arm, all the stuff protected by #ifdef EFI is x86 specific.
> 
> I find the name "EFI" too generic to figure out that this code can only be used by x86.
> 
> But, from my understanding, this header is meant to contain generic code. It feels a bit odd that we are moving arch specific code.
> 
> To be honest, I don't quite understand why we need to make the diffferentiation on x86. So I guess the first question is how this is meant to be used on x86?
> 
> Once we answered that, we can decide whether this is correct to use EFI in generic code. IOW, is thish going to be useful for other arch?
> 
I think Jan needs to answer this question as I am not sure.

>>
>>>> +/*
>>>> + * Use the NOLOAD directive, despite currently ignored by (at least) GNU ld
>>>> + * for PE output, in order to record that we'd prefer these sections to not
>>>> + * be loaded into memory.
>>>> + */
>>>> +#define DECL_DEBUG(x, a) #x ALIGN(a) (NOLOAD) : { *(x) }
>>>> +#define DECL_DEBUG2(x, y, a) #x ALIGN(a) (NOLOAD) : { *(x) *(y) }
>>>> +#else
>>>> +#define DECL_DEBUG(x, a) #x 0 : { *(x) }
>>>> +#define DECL_DEBUG2(x, y, a) #x 0 : { *(x) *(y) }
>>>> +#endif
>>>> +
>>>> +/* DWARF debug sections. */
>>>> +#define DWARF_DEBUG_SECTIONS                      \
>>>> +  DECL_DEBUG(.debug_abbrev, 1)                    \
>>>> +  DECL_DEBUG2(.debug_info, .gnu.linkonce.wi.*, 1) \
>>>> +  DECL_DEBUG(.debug_types, 1)                     \
>>>> +  DECL_DEBUG(.debug_str, 1)                       \
>>>> +  DECL_DEBUG2(.debug_line, .debug_line.*, 1)      \
>>>> +  DECL_DEBUG(.debug_line_str, 1)                  \
>>>> +  DECL_DEBUG(.debug_names, 4)                     \
>>>> +  DECL_DEBUG(.debug_frame, 4)                     \
>>>> +  DECL_DEBUG(.debug_loc, 1)                       \
>>>> +  DECL_DEBUG(.debug_loclists, 4)                  \
>>>> +  DECL_DEBUG(.debug_macinfo, 1)                   \
>>>> +  DECL_DEBUG(.debug_macro, 1)                     \
>>>> +  DECL_DEBUG(.debug_ranges, 8)                    \
>>>> +  DECL_DEBUG(.debug_rnglists, 4)                  \
>>>> +  DECL_DEBUG(.debug_addr, 8)                      \
>>>> +  DECL_DEBUG(.debug_aranges, 1)                   \
>>>> +  DECL_DEBUG(.debug_pubnames, 1)                  \
>>>> +  DECL_DEBUG(.debug_pubtypes, 1)
>>>> +
>>>> +/* Stabs debug sections. */
>>>> +#define STABS_DEBUG_SECTIONS                 \
>>>> +  .stab 0 : { *(.stab) }                     \
>>>> +  .stabstr 0 : { *(.stabstr) }               \
>>>> +  .stab.excl 0 : { *(.stab.excl) }           \
>>>> +  .stab.exclstr 0 : { *(.stab.exclstr) }     \
>>>> +  .stab.index 0 : { *(.stab.index) }         \
>>>> +  .stab.indexstr 0 : { *(.stab.indexstr) }
>>>> +
>>>> +/*
>>>> + * Required sections not related to debugging.
>>>> + *
>>>> + * LLVM ld also wants .symtab, .strtab, and .shstrtab placed. These look to
>>>> + * be benign to GNU ld, so we can have them here unconditionally.
>>>> + */
>>>> +#define ELF_DETAILS_SECTIONS     \
>>>> +  .comment 0 : { *(.comment) }   \
>>>
>>> This is a bit confusing. Here you seem to use the section .comment. But...
>>>
>>>> +  .symtab 0 : { *(.symtab) }     \
>>>> +  .strtab 0 : { *(.strtab) }     \
>>>> +  .shstrtab 0 : { *(.shstrtab) }
>>>> +
>>>> +#ifdef EFI
>>>> +#define DISCARD_EFI_SECTIONS \
>>>> +       *(.comment)   \
>>>
>>> ... here you will discard it if EFI is set. Which one take precedence if the caller use both ELF_DETAILS_SECTIONS and DISCARD_EFI_SECTION?
>>>
>> ELF_DETAILS_SECTIONS is protected by #ifndef EFI and DISCARD_EFI_SECTION by #ifdef EFI
>> so the caller cannot use both ELF_DETAILS_SECTIONS and DISCARD_EFI_SECTION.
> 
> The caller will protect it. But it is not in the header. I don't think we should expect the user to check x86 to understand how this is meant to be used.
> 
>>
>>> Also, can you explain why we need to drop those sections when EFI is set?
>>>
>> This is related to x86. Please see the commit: 7844f90abd551f6d5cd9b670b5ed8a4683258a21
> 
> Why is this in the generic header then?
> 
If we decide that EFI is not meant for anything else than x86, I will get rid of it completely from this header.

> Cheers,
> 

Cheers,
Michal

