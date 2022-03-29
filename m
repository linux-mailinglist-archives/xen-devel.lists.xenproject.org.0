Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3274EAAA4
	for <lists+xen-devel@lfdr.de>; Tue, 29 Mar 2022 11:39:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.295745.503382 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZ8Ig-00089C-R3; Tue, 29 Mar 2022 09:38:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 295745.503382; Tue, 29 Mar 2022 09:38:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZ8Ig-00086f-N7; Tue, 29 Mar 2022 09:38:06 +0000
Received: by outflank-mailman (input) for mailman id 295745;
 Tue, 29 Mar 2022 09:38:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AGgI=UI=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1nZ8If-00086Z-5m
 for xen-devel@lists.xenproject.org; Tue, 29 Mar 2022 09:38:05 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id ed92052b-af43-11ec-a405-831a346695d4;
 Tue, 29 Mar 2022 11:38:03 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0C13623A;
 Tue, 29 Mar 2022 02:38:02 -0700 (PDT)
Received: from [10.57.6.94] (unknown [10.57.6.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 471BC3F718;
 Tue, 29 Mar 2022 02:37:58 -0700 (PDT)
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
X-Inumbo-ID: ed92052b-af43-11ec-a405-831a346695d4
Message-ID: <7feea62a-c467-560e-5b4e-630996e8f39d@arm.com>
Date: Tue, 29 Mar 2022 11:37:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 2/2] xen: Populate xen.lds.h and make use of its macros
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20220322080233.53134-1-michal.orzel@arm.com>
 <20220322080233.53134-3-michal.orzel@arm.com>
 <dbcd0509-6a8a-db5d-bad7-69027256f053@suse.com>
From: Michal Orzel <michal.orzel@arm.com>
In-Reply-To: <dbcd0509-6a8a-db5d-bad7-69027256f053@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Jan,

Thanks for review.

On 29.03.2022 11:22, Jan Beulich wrote:
> On 22.03.2022 09:02, Michal Orzel wrote:
>> --- a/xen/arch/arm/xen.lds.S
>> +++ b/xen/arch/arm/xen.lds.S
>> @@ -69,10 +69,7 @@ SECTIONS
>>         __proc_info_end = .;
>>  
>>  #ifdef CONFIG_HAS_VPCI
>> -       . = ALIGN(POINTER_ALIGN);
>> -       __start_vpci_array = .;
>> -       *(SORT(.data.vpci.*))
>> -       __end_vpci_array = .;
>> +       VPCI_ARRAY
>>  #endif
> 
> Here and elsewhere I think the #ifdef should move as well, or to be
> precise VPCI_ARRAY (in the specific case here) should simply expand to
> nothing when CONFIG_HAS_VPCI is not defined.
> 
I was thinking about it at the beginning so I'm ok with your solution.

>> @@ -222,22 +213,18 @@ SECTIONS
>>    /* Section for the device tree blob (if any). */
>>    .dtb : { *(.dtb) } :text
>>  
>> +  /*
>> +   * Explicitly list debug sections, to avoid these sections being viewed as
>> +   * "orphan" by the linker.
>> +   */
>> +  DWARF_DEBUG_SECTIONS
> 
> Considering the comment, perhaps better to move ...
> 
>>    /* Sections to be discarded */
>> -  /DISCARD/ : {
>> -       *(.exit.text)
>> -       *(.exit.data)
>> -       *(.exitcall.exit)
>> -       *(.eh_frame)
>> -  }
>> +  DISCARD_SECTIONS
>>  
>>    /* Stabs debugging sections.  */
>> -  .stab 0 : { *(.stab) }
>> -  .stabstr 0 : { *(.stabstr) }
>> -  .stab.excl 0 : { *(.stab.excl) }
>> -  .stab.exclstr 0 : { *(.stab.exclstr) }
>> -  .stab.index 0 : { *(.stab.index) }
>> -  .stab.indexstr 0 : { *(.stab.indexstr) }
>> -  .comment 0 : { *(.comment) }
>> +  STABS_DEBUG_SECTIONS
> 
> ... this up there?
That makes sense. Ok.

> 
>> --- a/xen/include/xen/xen.lds.h
>> +++ b/xen/include/xen/xen.lds.h
>> @@ -5,4 +5,104 @@
>>   * Common macros to be used in architecture specific linker scripts.
>>   */
>>  
>> +/* Macros to declare debug sections. */
>> +#ifdef EFI
>> +/*
>> + * Use the NOLOAD directive, despite currently ignored by (at least) GNU ld
>> + * for PE output, in order to record that we'd prefer these sections to not
>> + * be loaded into memory.
>> + */
>> +#define DECL_DEBUG(x, a) #x ALIGN(a) (NOLOAD) : { *(x) }
>> +#define DECL_DEBUG2(x, y, a) #x ALIGN(a) (NOLOAD) : { *(x) *(y) }
>> +#else
>> +#define DECL_DEBUG(x, a) #x 0 : { *(x) }
>> +#define DECL_DEBUG2(x, y, a) #x 0 : { *(x) *(y) }
>> +#endif
>> +
>> +/* DWARF debug sections. */
>> +#define DWARF_DEBUG_SECTIONS                      \
> 
> May I suggest to call this DWARF2_DEBUG_SECTIONS, to make clear no
> Dwarf1 section is included here (and we also don't mean to support
> such debug info)?
> 
As this list is not full I thought we are going to add DWARF1 sections one day.
DWARF2_DEBUG_SECTIONS would mean that we list sections only from DWARF2 which is not true
as we have sections from DWARF3,5, etc. 
Maybe we should leave it as it is but modify the comment to state:
/* DWARF2+ debug sections */

>> +  DECL_DEBUG(.debug_abbrev, 1)                    \
>> +  DECL_DEBUG2(.debug_info, .gnu.linkonce.wi.*, 1) \
>> +  DECL_DEBUG(.debug_types, 1)                     \
>> +  DECL_DEBUG(.debug_str, 1)                       \
>> +  DECL_DEBUG2(.debug_line, .debug_line.*, 1)      \
>> +  DECL_DEBUG(.debug_line_str, 1)                  \
>> +  DECL_DEBUG(.debug_names, 4)                     \
>> +  DECL_DEBUG(.debug_frame, 4)                     \
>> +  DECL_DEBUG(.debug_loc, 1)                       \
>> +  DECL_DEBUG(.debug_loclists, 4)                  \
>> +  DECL_DEBUG(.debug_macinfo, 1)                   \
>> +  DECL_DEBUG(.debug_macro, 1)                     \
>> +  DECL_DEBUG(.debug_ranges, 8)                    \
>> +  DECL_DEBUG(.debug_rnglists, 4)                  \
>> +  DECL_DEBUG(.debug_addr, 8)                      \
>> +  DECL_DEBUG(.debug_aranges, 1)                   \
>> +  DECL_DEBUG(.debug_pubnames, 1)                  \
>> +  DECL_DEBUG(.debug_pubtypes, 1)
>> +
>> +/* Stabs debug sections. */
>> +#define STABS_DEBUG_SECTIONS                 \
>> +  .stab 0 : { *(.stab) }                     \
>> +  .stabstr 0 : { *(.stabstr) }               \
>> +  .stab.excl 0 : { *(.stab.excl) }           \
>> +  .stab.exclstr 0 : { *(.stab.exclstr) }     \
>> +  .stab.index 0 : { *(.stab.index) }         \
>> +  .stab.indexstr 0 : { *(.stab.indexstr) }
>> +
>> +/*
>> + * Required sections not related to debugging.
>> + *
>> + * LLVM ld also wants .symtab, .strtab, and .shstrtab placed. These look to
>> + * be benign to GNU ld, so we can have them here unconditionally.
>> + */
>> +#define ELF_DETAILS_SECTIONS     \
>> +  .comment 0 : { *(.comment) }   \
I also need to add *(.comment.*) due to:
https://xenbits.xen.org/gitweb/?p=xen.git;a=commit;h=69e46280937526db9cf78259cd8a0a9ec62dc847

>> +  .symtab 0 : { *(.symtab) }     \
>> +  .strtab 0 : { *(.strtab) }     \
>> +  .shstrtab 0 : { *(.shstrtab) }
>> +
>> +#ifdef EFI
>> +#define DISCARD_EFI_SECTIONS \
>> +       *(.comment)   \
>> +       *(.comment.*) \
>> +       *(.note.*)
>> +#else
>> +#define DISCARD_EFI_SECTIONS
>> +#endif
>> +
>> +/* Sections to be discarded. */
>> +#define DISCARD_SECTIONS     \
>> +  /DISCARD/ : {              \
>> +       *(.text.exit)         \
>> +       *(.exit.text)         \
>> +       *(.exit.data)         \
>> +       *(.exitcall.exit)     \
>> +       *(.discard)           \
>> +       *(.discard.*)         \
>> +       *(.eh_frame)          \
>> +       *(.dtors)             \
>> +       *(.dtors.*)           \
>> +       *(.fini_array)        \
>> +       *(.fini_array.*)      \
>> +       DISCARD_EFI_SECTIONS  \
>> +  }
>> +
>> +#define VPCI_ARRAY               \
>> +       . = ALIGN(POINTER_ALIGN); \
>> +       __start_vpci_array = .;   \
>> +       *(SORT(.data.vpci.*))     \
>> +       __end_vpci_array = .;
>> +
>> +#define HYPFS_PARAM              \
>> +       . = ALIGN(8);             \
> 
> Since you're generalizing this, you mean POINTER_ALIGN here, not 8.
> 
Ok.

>> +       __paramhypfs_start = .;   \
>> +       *(.data.paramhypfs)       \
>> +       __paramhypfs_end = .;
>> +
>> +#define LOCK_PROFILE_DATA        \
>> +       . = ALIGN(POINTER_ALIGN); \
>> +       __lock_profile_start = .; \
>> +       *(.lockprofile.data)      \
>> +       __lock_profile_end = .;
> 
> While for *_SECTIONS I don't care as much, for these last three items
> I think it would be good if we (maybe just informally) established an
> ordering rule, such that we can ask further additions here to not occur
> randomly. Once we've grown a few more of these, this would also help
> quickly locating the perhaps just one construct of interest when
> looking up things. Personally I think the only sensible ordering
> criteria is the name of the construct being defined. This could be
> mentioned in a comment ahead of them, and that comment would then at
> the same time serve as separator between *_SECTIONS and any constructs
> also defining (enclosing) symbols.
> 
Yes, name of the constructs is the good criteria.
I will do it in v3.

> Jan
> 

Cheers,
Michal

