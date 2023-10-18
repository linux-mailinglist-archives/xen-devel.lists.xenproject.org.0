Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C287CD5A6
	for <lists+xen-devel@lfdr.de>; Wed, 18 Oct 2023 09:48:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618430.962070 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qt1HG-0001KO-S2; Wed, 18 Oct 2023 07:47:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618430.962070; Wed, 18 Oct 2023 07:47:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qt1HG-0001Hj-Oo; Wed, 18 Oct 2023 07:47:38 +0000
Received: by outflank-mailman (input) for mailman id 618430;
 Wed, 18 Oct 2023 07:47:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BVsY=GA=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qt1HF-0001Hd-F4
 for xen-devel@lists.xenproject.org; Wed, 18 Oct 2023 07:47:37 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 99dddf5f-6d8a-11ee-9b0e-b553b5be7939;
 Wed, 18 Oct 2023 09:47:35 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id A0FF64EE0738;
 Wed, 18 Oct 2023 09:47:34 +0200 (CEST)
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
X-Inumbo-ID: 99dddf5f-6d8a-11ee-9b0e-b553b5be7939
MIME-Version: 1.0
Date: Wed, 18 Oct 2023 09:47:34 +0200
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
In-Reply-To: <e5e8e3cb-056b-063d-8f6f-d3f68bdf1750@suse.com>
References: <cover.1696833629.git.nicola.vetrini@bugseng.com>
 <002d58b1d15619a8c4b2ec6c2b5f20960ed0a428.1696833629.git.nicola.vetrini@bugseng.com>
 <2023f16b-46fb-2a19-9620-7872b3029b5f@suse.com>
 <f89fc0b2814cc4b84abc431c0355b348@bugseng.com>
 <e5e8e3cb-056b-063d-8f6f-d3f68bdf1750@suse.com>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <41d5f7fc3a31e9ce510983aa1b237ab1@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 17/10/2023 08:46, Jan Beulich wrote:
> On 16.10.2023 19:05, Nicola Vetrini wrote:
>> On 16/10/2023 16:50, Jan Beulich wrote:
>>> On 09.10.2023 08:54, Nicola Vetrini wrote:
>>>> --- a/xen/arch/x86/include/asm/compat.h
>>>> +++ b/xen/arch/x86/include/asm/compat.h
>>>> @@ -13,6 +13,7 @@ typedef unsigned long full_ptr_t;
>>>> 
>>>>  struct domain;
>>>>  #ifdef CONFIG_PV32
>>>> +extern unsigned long cr4_pv32_mask;
>>> 
>>> Why is this needed? Didn't we say declarations aren't needed when the
>>> only consumer is assembly code? (I also wonder how this header is any
>>> more "appropriate" - see the changelog entry - than about any other
>>> one.)
>>> 
>> 
>> It was pointed out to me [1] that compat.h might be more appropriate
>> than setup.h
>> (probably because the asm code referencing it is under x86_64/compat).
> 
> Hmm. I agree setup.h isn't appropriate.
> 
>> Further, while it's true that this variable is used in asm, it's also
>> used in x86/setup.c, hence
>> the need for a declaration.
> 
> But that's the file where the variable is defined. IOW no risk of
> definition and (non-existing) declaration going out of sync.
> 

This is an aspect specific to this variable, that unfortunately the rule 
does not
capture. I'll deviate this in the next version of this series.

>>>> --- a/xen/arch/x86/include/asm/setup.h
>>>> +++ b/xen/arch/x86/include/asm/setup.h
>>>> @@ -13,6 +13,7 @@ extern char __2M_rwdata_start[], 
>>>> __2M_rwdata_end[];
>>>>  extern unsigned long xenheap_initial_phys_start;
>>>>  extern uint64_t boot_tsc_stamp;
>>>> 
>>>> +extern char cpu0_stack[STACK_SIZE];
>>> 
>>> Same question here.
>>> 
>> 
>> This one is a bit more nuanced (I wouldn't oppose deviating this), but
>> there is indeed one use.
> 
> Still same here then.
> 

Same as above; it can be argued that there's no risk of anything going 
out of sync.

>>>> --- a/xen/common/symbols.c
>>>> +++ b/xen/common/symbols.c
>>>> @@ -21,23 +21,6 @@
>>>>  #include <xen/guest_access.h>
>>>>  #include <xen/errno.h>
>>>> 
>>>> -#ifdef SYMBOLS_ORIGIN
>>>> -extern const unsigned int symbols_offsets[];
>>>> -#define symbols_address(n) (SYMBOLS_ORIGIN + symbols_offsets[n])
>>>> -#else
>>>> -extern const unsigned long symbols_addresses[];
>>>> -#define symbols_address(n) symbols_addresses[n]
>>>> -#endif
>>>> -extern const unsigned int symbols_num_syms;
>>>> -extern const u8 symbols_names[];
>>>> -
>>>> -extern const struct symbol_offset symbols_sorted_offsets[];
>>>> -
>>>> -extern const u8 symbols_token_table[];
>>>> -extern const u16 symbols_token_index[];
>>>> -
>>>> -extern const unsigned int symbols_markers[];
>>>> -
>>>>  /* expand a compressed symbol data into the resulting uncompressed
>>>> string,
>>>>     given the offset to where the symbol is in the compressed stream
>>>> */
>>>>  static unsigned int symbols_expand_symbol(unsigned int off, char
>>>> *result)
>>>> --- a/xen/include/xen/symbols.h
>>>> +++ b/xen/include/xen/symbols.h
>>>> @@ -33,4 +33,22 @@ struct symbol_offset {
>>>>      uint32_t stream; /* .. in the compressed stream.*/
>>>>      uint32_t addr;   /* .. and in the fixed size address array. */
>>>>  };
>>>> +
>>>> +#ifdef SYMBOLS_ORIGIN
>>>> +extern const unsigned int symbols_offsets[];
>>>> +#define symbols_address(n) (SYMBOLS_ORIGIN + symbols_offsets[n])
>>>> +#else
>>>> +extern const unsigned long symbols_addresses[];
>>>> +#define symbols_address(n) symbols_addresses[n]
>>>> +#endif
>>>> +extern const unsigned int symbols_num_syms;
>>>> +extern const u8 symbols_names[];
>>>> +
>>>> +extern const struct symbol_offset symbols_sorted_offsets[];
>>>> +
>>>> +extern const u8 symbols_token_table[];
>>>> +extern const u16 symbols_token_index[];
>>>> +
>>>> +extern const unsigned int symbols_markers[];
>>>> +
>>>>  #endif /*_XEN_SYMBOLS_H*/
>>> 
>>> This change is even less clear to me: The producer is assembly code,
>>> and the consumer already had appropriate declarations. Why would we
>>> want to increase the scope of their visibility?
>> 
>> The missing decls are about common/symbols-dummy.c. Xen can choose 
>> that
>> this file does
>> not need to conform (to this guideline or any guideline), in which 
>> case
>> this change can be dropped.
> 
> Since symbols-dummy.c isn't used in the final binary, I'd prefer that.
> Otherwise imo a new private header used by just the two files would 
> want
> introducing, to keep exposure limited.
> 
> Jan

Ok

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

