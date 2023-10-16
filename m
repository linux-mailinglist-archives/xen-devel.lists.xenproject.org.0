Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FEF07CB102
	for <lists+xen-devel@lfdr.de>; Mon, 16 Oct 2023 19:06:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617899.960997 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsR2H-0002dr-Jf; Mon, 16 Oct 2023 17:05:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617899.960997; Mon, 16 Oct 2023 17:05:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsR2H-0002bu-H2; Mon, 16 Oct 2023 17:05:45 +0000
Received: by outflank-mailman (input) for mailman id 617899;
 Mon, 16 Oct 2023 17:05:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2KAZ=F6=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qsR2G-0002bo-7B
 for xen-devel@lists.xenproject.org; Mon, 16 Oct 2023 17:05:44 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3c5a304f-6c46-11ee-9b0e-b553b5be7939;
 Mon, 16 Oct 2023 19:05:41 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id ADA774EE0737;
 Mon, 16 Oct 2023 19:05:40 +0200 (CEST)
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
X-Inumbo-ID: 3c5a304f-6c46-11ee-9b0e-b553b5be7939
MIME-Version: 1.0
Date: Mon, 16 Oct 2023 19:05:40 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, George Dunlap
 <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH v2 1/7] xen: add declarations for variables where
 needed
In-Reply-To: <2023f16b-46fb-2a19-9620-7872b3029b5f@suse.com>
References: <cover.1696833629.git.nicola.vetrini@bugseng.com>
 <002d58b1d15619a8c4b2ec6c2b5f20960ed0a428.1696833629.git.nicola.vetrini@bugseng.com>
 <2023f16b-46fb-2a19-9620-7872b3029b5f@suse.com>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <f89fc0b2814cc4b84abc431c0355b348@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 16/10/2023 16:50, Jan Beulich wrote:
> On 09.10.2023 08:54, Nicola Vetrini wrote:
>> Some variables with external linkage used in C code do not have
>> a visible declaration where they are defined. Providing such
>> declaration also resolves violations of MISRA C:2012 Rule 8.4.
>> 
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> 
> This is a mix of different approaches to the same underlying issue. I
> think respectively splitting would have helped.
> 
>> --- a/xen/arch/x86/include/asm/compat.h
>> +++ b/xen/arch/x86/include/asm/compat.h
>> @@ -13,6 +13,7 @@ typedef unsigned long full_ptr_t;
>> 
>>  struct domain;
>>  #ifdef CONFIG_PV32
>> +extern unsigned long cr4_pv32_mask;
> 
> Why is this needed? Didn't we say declarations aren't needed when the
> only consumer is assembly code? (I also wonder how this header is any
> more "appropriate" - see the changelog entry - than about any other
> one.)
> 

It was pointed out to me [1] that compat.h might be more appropriate 
than setup.h
(probably because the asm code referencing it is under x86_64/compat).
Further, while it's true that this variable is used in asm, it's also 
used in x86/setup.c, hence
the need for a declaration.

>> --- a/xen/arch/x86/include/asm/setup.h
>> +++ b/xen/arch/x86/include/asm/setup.h
>> @@ -13,6 +13,7 @@ extern char __2M_rwdata_start[], __2M_rwdata_end[];
>>  extern unsigned long xenheap_initial_phys_start;
>>  extern uint64_t boot_tsc_stamp;
>> 
>> +extern char cpu0_stack[STACK_SIZE];
> 
> Same question here.
> 

This one is a bit more nuanced (I wouldn't oppose deviating this), but 
there is indeed one use.

>> --- a/xen/common/symbols.c
>> +++ b/xen/common/symbols.c
>> @@ -21,23 +21,6 @@
>>  #include <xen/guest_access.h>
>>  #include <xen/errno.h>
>> 
>> -#ifdef SYMBOLS_ORIGIN
>> -extern const unsigned int symbols_offsets[];
>> -#define symbols_address(n) (SYMBOLS_ORIGIN + symbols_offsets[n])
>> -#else
>> -extern const unsigned long symbols_addresses[];
>> -#define symbols_address(n) symbols_addresses[n]
>> -#endif
>> -extern const unsigned int symbols_num_syms;
>> -extern const u8 symbols_names[];
>> -
>> -extern const struct symbol_offset symbols_sorted_offsets[];
>> -
>> -extern const u8 symbols_token_table[];
>> -extern const u16 symbols_token_index[];
>> -
>> -extern const unsigned int symbols_markers[];
>> -
>>  /* expand a compressed symbol data into the resulting uncompressed 
>> string,
>>     given the offset to where the symbol is in the compressed stream 
>> */
>>  static unsigned int symbols_expand_symbol(unsigned int off, char 
>> *result)
>> --- a/xen/include/xen/symbols.h
>> +++ b/xen/include/xen/symbols.h
>> @@ -33,4 +33,22 @@ struct symbol_offset {
>>      uint32_t stream; /* .. in the compressed stream.*/
>>      uint32_t addr;   /* .. and in the fixed size address array. */
>>  };
>> +
>> +#ifdef SYMBOLS_ORIGIN
>> +extern const unsigned int symbols_offsets[];
>> +#define symbols_address(n) (SYMBOLS_ORIGIN + symbols_offsets[n])
>> +#else
>> +extern const unsigned long symbols_addresses[];
>> +#define symbols_address(n) symbols_addresses[n]
>> +#endif
>> +extern const unsigned int symbols_num_syms;
>> +extern const u8 symbols_names[];
>> +
>> +extern const struct symbol_offset symbols_sorted_offsets[];
>> +
>> +extern const u8 symbols_token_table[];
>> +extern const u16 symbols_token_index[];
>> +
>> +extern const unsigned int symbols_markers[];
>> +
>>  #endif /*_XEN_SYMBOLS_H*/
> 
> This change is even less clear to me: The producer is assembly code,
> and the consumer already had appropriate declarations. Why would we
> want to increase the scope of their visibility?
> 
> Jan

The missing decls are about common/symbols-dummy.c. Xen can choose that 
this file does
not need to conform (to this guideline or any guideline), in which case 
this change can be dropped.

[1] https://lore.kernel.org/xen-devel/ZRqkbeVUZbjizjNv@MacBookPdeRoger/

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

