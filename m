Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2F84EABF0
	for <lists+xen-devel@lfdr.de>; Tue, 29 Mar 2022 13:07:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.295792.503492 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZ9gs-0005KF-0E; Tue, 29 Mar 2022 11:07:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 295792.503492; Tue, 29 Mar 2022 11:07:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZ9gr-0005IJ-TM; Tue, 29 Mar 2022 11:07:09 +0000
Received: by outflank-mailman (input) for mailman id 295792;
 Tue, 29 Mar 2022 11:07:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nZ9gq-0005ID-CY
 for xen-devel@lists.xenproject.org; Tue, 29 Mar 2022 11:07:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nZ9gl-0005pI-HV; Tue, 29 Mar 2022 11:07:03 +0000
Received: from 54-240-197-226.amazon.com ([54.240.197.226] helo=[10.85.37.164])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nZ9gl-0003d1-Ag; Tue, 29 Mar 2022 11:07:03 +0000
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
	bh=xI7Ddnf8AXzxKdaenbKM8QGlxZXMj36LQlTDsNtzjsQ=; b=JblSWCD7fdhTndW3JFwMImD6Py
	eaKiHdqJWJy/rYx/EG7g7ivpxrSPacgJsRFiTMCXI0WzgSZpkWfk1ZW28Y+EktBMmrYLv96EvFE2x
	f6L7zlNMzmBM3STyyT8qO+/DFIf7fwv7415OmJxsyBiQTMYMBncfGLiBwrwqpYOlTLqI=;
Message-ID: <c2c936be-5f11-393b-3bcc-82a42fa964af@xen.org>
Date: Tue, 29 Mar 2022 12:07:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v2 2/2] xen: Populate xen.lds.h and make use of its macros
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Michal Orzel <michal.orzel@arm.com>, xen-devel@lists.xenproject.org
References: <20220322080233.53134-1-michal.orzel@arm.com>
 <20220322080233.53134-3-michal.orzel@arm.com>
 <2940b4c8-5d44-695e-4550-0a32c3a4c053@xen.org>
 <293aa4e4-ac6b-2446-ea78-986014993e89@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <293aa4e4-ac6b-2446-ea78-986014993e89@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 29/03/2022 11:37, Jan Beulich wrote:
> On 29.03.2022 11:54, Julien Grall wrote:
>> On 22/03/2022 08:02, Michal Orzel wrote:
>>> --- a/xen/include/xen/xen.lds.h
>>> +++ b/xen/include/xen/xen.lds.h
>>> @@ -5,4 +5,104 @@
>>>     * Common macros to be used in architecture specific linker scripts.
>>>     */
>>>    
>>> +/* Macros to declare debug sections. */
>>> +#ifdef EFI
>>
>> AFAIK, we don't define EFI on Arm (just CONFIG_EFI). Yet we do support
>> EFI on arm64.
>>
>> As this #ifdef is now in generic code, can you explain how this is meant
>> to be used?
> 
> The identifier may now be somewhat misleading, yes - it has always meant
> "linking a native EFI (i.e. PE/COFF) binary". The equivalence "EFI binary"
> == "EFI support" has long been lost.
On Arm, we will be generating a EFI binary (or better a Image/EFI). So 
IIUC the description, we should in theory set EFI.

But I think it would do the wrong thing on Arm. Would you be able to 
explain why you need to differentiate it on x86?

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
>>> +#define DWARF_DEBUG_SECTIONS                      \
>>> +  DECL_DEBUG(.debug_abbrev, 1)                    \
>>> +  DECL_DEBUG2(.debug_info, .gnu.linkonce.wi.*, 1) \
>>> +  DECL_DEBUG(.debug_types, 1)                     \
>>> +  DECL_DEBUG(.debug_str, 1)                       \
>>> +  DECL_DEBUG2(.debug_line, .debug_line.*, 1)      \
>>> +  DECL_DEBUG(.debug_line_str, 1)                  \
>>> +  DECL_DEBUG(.debug_names, 4)                     \
>>> +  DECL_DEBUG(.debug_frame, 4)                     \
>>> +  DECL_DEBUG(.debug_loc, 1)                       \
>>> +  DECL_DEBUG(.debug_loclists, 4)                  \
>>> +  DECL_DEBUG(.debug_macinfo, 1)                   \
>>> +  DECL_DEBUG(.debug_macro, 1)                     \
>>> +  DECL_DEBUG(.debug_ranges, 8)                    \
>>> +  DECL_DEBUG(.debug_rnglists, 4)                  \
>>> +  DECL_DEBUG(.debug_addr, 8)                      \
>>> +  DECL_DEBUG(.debug_aranges, 1)                   \
>>> +  DECL_DEBUG(.debug_pubnames, 1)                  \
>>> +  DECL_DEBUG(.debug_pubtypes, 1)
>>> +
>>> +/* Stabs debug sections. */
>>> +#define STABS_DEBUG_SECTIONS                 \
>>> +  .stab 0 : { *(.stab) }                     \
>>> +  .stabstr 0 : { *(.stabstr) }               \
>>> +  .stab.excl 0 : { *(.stab.excl) }           \
>>> +  .stab.exclstr 0 : { *(.stab.exclstr) }     \
>>> +  .stab.index 0 : { *(.stab.index) }         \
>>> +  .stab.indexstr 0 : { *(.stab.indexstr) }
>>> +
>>> +/*
>>> + * Required sections not related to debugging.
>>> + *
>>> + * LLVM ld also wants .symtab, .strtab, and .shstrtab placed. These look to
>>> + * be benign to GNU ld, so we can have them here unconditionally.
>>> + */
>>> +#define ELF_DETAILS_SECTIONS     \
>>> +  .comment 0 : { *(.comment) }   \
>>
>> This is a bit confusing. Here you seem to use the section .comment. But...
>>
>>> +  .symtab 0 : { *(.symtab) }     \
>>> +  .strtab 0 : { *(.strtab) }     \
>>> +  .shstrtab 0 : { *(.shstrtab) }
>>> +
>>> +#ifdef EFI
>>> +#define DISCARD_EFI_SECTIONS \
>>> +       *(.comment)   \
>>
>> ... here you will discard it if EFI is set. Which one take precedence if
>> the caller use both ELF_DETAILS_SECTIONS and DISCARD_EFI_SECTION?
> 
> Given the above explanation I think it's clear that only one of the
> two may be used at a time: ELF_DETAILS_SECTIONS when linking an ELF
> binary and DISCARD_EFI_SECTIONS when linking a PE/COFF binary.

I guess this may be obvious on x86. But for Arm, we are generating the 
ELF first and then extracting the information to generate the binary. 
The end result will be a binary that is PE/COFF compatible.

So to me, it would make sense to include DISCARD_EFI_SECTIONS because we 
going to create an EFI binary and also include EFI_DETAILS_SECTIONS 
because we are building an ELF.

Overall it sounds like to me that it is too premature to move the 
#if{,n}def EFI bits in the generic header.

Cheers,

-- 
Julien Grall

