Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8924F2952
	for <lists+xen-devel@lfdr.de>; Tue,  5 Apr 2022 11:05:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.298643.508815 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbf7m-0001rs-FV; Tue, 05 Apr 2022 09:05:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 298643.508815; Tue, 05 Apr 2022 09:05:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbf7m-0001p2-Bm; Tue, 05 Apr 2022 09:05:18 +0000
Received: by outflank-mailman (input) for mailman id 298643;
 Tue, 05 Apr 2022 09:05:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qA5z=UP=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1nbf7k-0001ow-14
 for xen-devel@lists.xenproject.org; Tue, 05 Apr 2022 09:05:16 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 7dfeb9e1-b4bf-11ec-8fbc-03012f2f19d4;
 Tue, 05 Apr 2022 11:05:09 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B5016D6E;
 Tue,  5 Apr 2022 02:05:13 -0700 (PDT)
Received: from [10.57.6.204] (unknown [10.57.6.204])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 44CCF3F73B;
 Tue,  5 Apr 2022 02:05:11 -0700 (PDT)
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
X-Inumbo-ID: 7dfeb9e1-b4bf-11ec-8fbc-03012f2f19d4
Message-ID: <75f01105-3885-2053-1d4e-1aaf8b75aced@arm.com>
Date: Tue, 5 Apr 2022 11:05:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3 2/2] xen: Populate xen.lds.h and make use of its macros
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20220331071425.49141-1-michal.orzel@arm.com>
 <20220331071425.49141-3-michal.orzel@arm.com>
 <eaf82b61-de3b-b2c2-b6f5-2b43b3348a09@suse.com>
From: Michal Orzel <michal.orzel@arm.com>
In-Reply-To: <eaf82b61-de3b-b2c2-b6f5-2b43b3348a09@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Jan,

On 05.04.2022 10:49, Jan Beulich wrote:
> On 31.03.2022 09:14, Michal Orzel wrote:
>> --- a/xen/include/xen/xen.lds.h
>> +++ b/xen/include/xen/xen.lds.h
>> @@ -5,4 +5,133 @@
>>   * Common macros to be used in architecture specific linker scripts.
>>   */
>>  
>> +/*
>> + * To avoid any confusion, please note that the EFI macro does not correspond
>> + * to EFI support and is used when linking a native EFI (i.e. PE/COFF) binary,
>> + * hence its usage in this header.
>> + */
>> +
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
>> +/*
>> + * DWARF2+ debug sections.
>> + * Explicitly list debug sections, first of all to avoid these sections being
>> + * viewed as "orphan" by the linker.
>> + *
>> + * For the PE output this is further necessary so that they don't end up at
>> + * VA 0, which is below image base and thus invalid. Note that this macro is
>> + * to be used after _end, so if these sections get loaded they'll be discarded
>> + * at runtime anyway.
>> + */
>> +#define DWARF2_DEBUG_SECTIONS                     \
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
> 
> Here and ...
> 
>> +  DECL_DEBUG(.debug_rnglists, 4)                  \
>> +  DECL_DEBUG(.debug_addr, 8)                      \
> 
> ... here I think you also want to switch to POINTER_ALIGN.
> 
Ok, you're right.

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
> 
> Nit: Perhaps better "Required ELF sections ..."? Personally I'd also
> drop the mentioning of debugging - that's not really relevant here.
> I'm also unsure about "Required" - .comment isn't really required.
> IOW ideally simply "ELF sections" or "Sections to be retained in ELF
> binaries" or some such.
> 
ELF sections is ok for me.

> Jan
> 

I will push updated series soon.

Cheers,
Michal

