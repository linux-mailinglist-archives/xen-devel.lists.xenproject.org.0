Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4D94E2502
	for <lists+xen-devel@lfdr.de>; Mon, 21 Mar 2022 12:10:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.292921.497473 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWFun-00072u-Up; Mon, 21 Mar 2022 11:09:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 292921.497473; Mon, 21 Mar 2022 11:09:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWFun-0006zu-Rn; Mon, 21 Mar 2022 11:09:33 +0000
Received: by outflank-mailman (input) for mailman id 292921;
 Mon, 21 Mar 2022 11:09:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f0xq=UA=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1nWFum-0006zo-I0
 for xen-devel@lists.xenproject.org; Mon, 21 Mar 2022 11:09:32 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 6115d391-a907-11ec-8fbc-03012f2f19d4;
 Mon, 21 Mar 2022 12:09:30 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 89B911042;
 Mon, 21 Mar 2022 04:09:29 -0700 (PDT)
Received: from [10.57.5.187] (unknown [10.57.5.187])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E45593F766;
 Mon, 21 Mar 2022 04:09:27 -0700 (PDT)
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
X-Inumbo-ID: 6115d391-a907-11ec-8fbc-03012f2f19d4
Message-ID: <7ef73ee8-31df-149d-c4c6-4f13ddd19ec5@arm.com>
Date: Mon, 21 Mar 2022 12:09:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/3] xen: Introduce a header to store common linker
 scripts content
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20220321082114.49953-1-michal.orzel@arm.com>
 <20220321082114.49953-2-michal.orzel@arm.com>
 <cb61531a-5482-3aab-58bd-84f99f21ec48@suse.com>
 <AM6PR08MB38148D3FB84D91DB089C48CC89169@AM6PR08MB3814.eurprd08.prod.outlook.com>
 <2930b69f-9fba-e26c-8ed5-90ca93db92f4@suse.com>
From: Michal Orzel <michal.orzel@arm.com>
In-Reply-To: <2930b69f-9fba-e26c-8ed5-90ca93db92f4@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Jan,

On 21.03.2022 11:23, Jan Beulich wrote:
> Note: please properly quote your replies. As you'll see what you said
> in reply to my remarks is not properly separated from my remarks, and
> hence hard to read.
> 
Sorry about that. I had some issues with my e-mail client and had to use the non-default one.

> On 21.03.2022 11:14, Michal Orzel wrote:
>> On 21.03.2022 09:21, Michal Orzel wrote:
>>> --- /dev/null
>>> +++ b/xen/include/xen/xen_lds.h
>>> @@ -0,0 +1,114 @@
>>> +#ifndef __XEN_LDS_H__
>>> +#define __XEN_LDS_H__
>>> +
>>> +/*
>>> + * Common macros to be used in architecture specific linker scripts.
>>> + */
>>> +
>>> +/* Macros to declare debug sections. */
>>> +#ifdef EFI
>>> +/*
>>> + * Use the NOLOAD directive, despite currently ignored by (at least) GNU ld
>>> + * for PE output, in order to record that we'd prefer these sections to not
>>> + * be loaded into memory.
>>> + */
>>> +#define DECL_DEBUG(x, a) #x ALIGN(a) (NOLOAD) : { *(x) }
>>> +#define DECL_DEBUG2(x, y, a) #x ALIGN(a) (NOLOAD) : { *(x) *(y) }
>>> +#else
>>> +#define DECL_DEBUG(x, a) #x 0 : { *(x) }
>>> +#define DECL_DEBUG2(x, y, a) #x 0 : { *(x) *(y) }
>>> +#endif
>>> +
>>> +/* DWARF debug sections. */
>>> +#define DWARF_DEBUG_SECTIONS                      \
>>> +  DECL_DEBUG(.debug_abbrev, 1)                    \
>>> +  DECL_DEBUG2(.debug_info, .gnu.linkonce.wi.*, 1) \
>>> +  DECL_DEBUG(.debug_types, 1)                     \
>>> +  DECL_DEBUG(.debug_str, 1)                       \
>>> +  DECL_DEBUG2(.debug_line, .debug_line.*, 1)      \
>>> +  DECL_DEBUG(.debug_line_str, 1)                  \
>>> +  DECL_DEBUG(.debug_names, 4)                     \
>>> +  DECL_DEBUG(.debug_frame, 4)                     \
>>> +  DECL_DEBUG(.debug_loc, 1)                       \
>>> +  DECL_DEBUG(.debug_loclists, 4)                  \
>>> +  DECL_DEBUG(.debug_macinfo, 1)                   \
>>> +  DECL_DEBUG(.debug_macro, 1)                     \
>>> +  DECL_DEBUG(.debug_ranges, 8)                    \
>>> +  DECL_DEBUG(.debug_rnglists, 4)                  \
>>> +  DECL_DEBUG(.debug_addr, 8)                      \
>>> +  DECL_DEBUG(.debug_aranges, 1)                   \
>>> +  DECL_DEBUG(.debug_pubnames, 1)                  \
>>> +  DECL_DEBUG(.debug_pubtypes, 1)
>>> +
>>> +/*
>>> + * Stabs debug sections.
>>> + *
>>> + * LLVM ld also wants .symtab, .strtab, and .shstrtab placed. These look to
>>> + * be benign to GNU ld, so we can have them here unconditionally.
>>> + */
>>> +#define STABS_DEBUG_SECTIONS                 \
>>> +  .stab 0 : { *(.stab) }                     \
>>> +  .stabstr 0 : { *(.stabstr) }               \
>>> +  .stab.excl 0 : { *(.stab.excl) }           \
>>> +  .stab.exclstr 0 : { *(.stab.exclstr) }     \
>>> +  .stab.index 0 : { *(.stab.index) }         \
>>> +  .stab.indexstr 0 : { *(.stab.indexstr) }   \
>>> +  .comment 0 : { *(.comment) }               \
>>> +  .symtab 0 : { *(.symtab) }                 \
>>> +  .strtab 0 : { *(.strtab) }                 \
>>> +  .shstrtab 0 : { *(.shstrtab) }
>>
>> Please don't add non-Stabs sections to this macro.
>>
>> Ok, I will add a new macro storing the last 4 sections called ELF_DETAILS_SECTIONS,
>> to be coherent with what Linux does (ELF_DETAILS).
>>
>>> +#ifdef EFI
>>> +#define DISCARD_EFI_SECTIONS \
>>> +       *(.comment)   \
>>> +       *(.comment.*) \
>>> +       *(.note.*)
>>> +#else
>>> +#define DISCARD_EFI_SECTIONS
>>> +#endif
>>> +
>>> +/* Sections to be discarded. */
>>> +#define DISCARD_SECTIONS     \
>>> +  /DISCARD/ : {              \
>>> +       *(.text.exit)         \
>>> +       *(.exit.text)         \
>>> +       *(.exit.data)         \
>>> +       *(.exitcall.exit)     \
>>> +       *(.discard)           \
>>> +       *(.discard.*)         \
>>> +       *(.eh_frame)          \
>>> +       *(.dtors)             \
>>> +       *(.dtors.*)           \
>>> +       *(.fini_array)        \
>>> +       *(.fini_array.*)      \
>>> +       DISCARD_EFI_SECTIONS  \
>>> +  }
>>> +
>>> +#define CTORS_SECTION                           \
>>> +       . = ALIGN(8);                            \
>>> +       __ctors_start = .;                       \
>>> +       *(SORT_BY_INIT_PRIORITY(.init_array.*))  \
>>> +       *(SORT_BY_INIT_PRIORITY(.ctors.*))       \
>>> +       *(.init_array)                           \
>>> +       *(.ctors)                                \
>>> +       __ctors_end = .;
>>> +
>>> +#define VPCI_SECTION             \
>>> +       . = ALIGN(POINTER_ALIGN); \
>>> +       __start_vpci_array = .;   \
>>> +       *(SORT(.data.vpci.*))     \
>>> +       __end_vpci_array = .;
>>> +
>>> +#define HYPFS_SECTION            \
>>> +       . = ALIGN(8);             \
>>> +       __paramhypfs_start = .;   \
>>> +       *(.data.paramhypfs)       \
>>> +       __paramhypfs_end = .;
>>> +
>>> +#define LOCK_PROFILE_SECTION     \
>>> +       . = ALIGN(POINTER_ALIGN); \
>>> +       __lock_profile_start = .; \
>>> +       *(.lockprofile.data)      \
>>> +       __lock_profile_end = .;
>>> +
>>> +#endif /* __XEN_LDS_H__ */
>>
>> I'm not sure _SECTION is a good suffix to use in the four names above:
>> These aren't individual sections in the output, and for CTORS_SECTION
>> it's also not even a single input section.
>>
>> How about _ENTRY suffix?
>> Otherwise we can do different suffixes depending on the content.
>> LOCK_PROFILE_DATA, HYPFS_PARAM, VPCI_ARRAY
> 
> I'd prefer the latter.
> 
Ok.

>> As to CTORS_SECTION - I'm unconvinced of generalizing this without
>> first getting it right.
>>
>> I will get rid of CTORS_SECTIONS then.
>>
>> Overall I think it would be better to introduce this header along
>> with actually using the macros. That way one can check within the
>> patch that what you move / replace actually matches on both sides
>> without needing to cross patch boundaries. If you wanted to introduce
>> (and then include right away) an empty header first, that would be an
>> acceptable intermediate approach afaic.
>>
>> I just wanted to split this into arch specific patches because maintainers are different.
>> I do not understand your second solution with empty header.
>> Do you mean that the first patch shall create an empty header (with just an intro comment)
>> and include it in arch specific linker scripts?
> 
> Yes, I view this as one possible option.
> 
>> Anyway, I can merge these 3 patches into 1 if you want.
> 
> Well, at least part of the Arm changes can likely remain separate.
> But where you abstract things by introducing a macro in the header,
> it would be better if the original (supposedly functionally identical)
> construct(s) was (were) also replaced at the same time.
> 
Hmm, I think I would go with the empty header solution.
So in v2 I would do the following:
-first patch introducing empty header and including it in linker scripts
-second patch making use of common macros in x86 and arm linker scripts

> Jan
> 

Cheers,
Michal

