Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE4C7B6216
	for <lists+xen-devel@lfdr.de>; Tue,  3 Oct 2023 09:05:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.611946.951792 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnZTM-00034L-H0; Tue, 03 Oct 2023 07:05:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 611946.951792; Tue, 03 Oct 2023 07:05:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnZTM-00031T-CZ; Tue, 03 Oct 2023 07:05:36 +0000
Received: by outflank-mailman (input) for mailman id 611946;
 Tue, 03 Oct 2023 07:05:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g4lE=FR=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qnZTL-0002Gx-JJ
 for xen-devel@lists.xenproject.org; Tue, 03 Oct 2023 07:05:35 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3f5e65b4-61bb-11ee-98d2-6d05b1d4d9a1;
 Tue, 03 Oct 2023 09:05:34 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 589604EE0737;
 Tue,  3 Oct 2023 09:05:34 +0200 (CEST)
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
X-Inumbo-ID: 3f5e65b4-61bb-11ee-98d2-6d05b1d4d9a1
MIME-Version: 1.0
Date: Tue, 03 Oct 2023 09:05:34 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org,
 michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com,
 consulting@bugseng.com, jbeulich@suse.com, andrew.cooper3@citrix.com,
 Henry.Wang@arm.com, Julien Grall <julien@xen.org>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH 1/7] xen: add declarations for variables where needed
In-Reply-To: <ZRqkbeVUZbjizjNv@MacBookPdeRoger>
References: <cover.1696232393.git.nicola.vetrini@bugseng.com>
 <357a35c3035d0f8659a64d767791bc41d57494d3.1696232393.git.nicola.vetrini@bugseng.com>
 <ZRqkbeVUZbjizjNv@MacBookPdeRoger>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <872f44542c8df6dab79965375376010d@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 02/10/2023 13:07, Roger Pau Monné wrote:
> On Mon, Oct 02, 2023 at 09:49:44AM +0200, Nicola Vetrini wrote:
>> Some variables with external linkage used in C code do not have
>> a visible declaration where they are defined. Providing such
>> declaration also resolves violations of MISRA C:2012 Rule 8.4.
>> 
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> ---
>>  xen/arch/arm/include/asm/setup.h  |  3 +++
>>  xen/arch/arm/include/asm/smp.h    |  3 +++
>>  xen/arch/x86/cpu/mcheck/mce.c     |  6 +++---
>>  xen/arch/x86/include/asm/setup.h  |  3 +++
>>  xen/arch/x86/irq.c                |  2 +-
>>  xen/arch/x86/platform_hypercall.c |  3 ---
>>  xen/common/symbols.c              | 17 -----------------
>>  xen/include/xen/hypercall.h       |  3 +++
>>  xen/include/xen/symbols.h         | 18 ++++++++++++++++++
>>  9 files changed, 34 insertions(+), 24 deletions(-)
>> 

>> diff --git a/xen/arch/x86/include/asm/setup.h 
>> b/xen/arch/x86/include/asm/setup.h
>> index dfdd9e555149..3c27fe915ed4 100644
>> --- a/xen/arch/x86/include/asm/setup.h
>> +++ b/xen/arch/x86/include/asm/setup.h
>> @@ -13,8 +13,11 @@ extern char __2M_rwdata_start[], __2M_rwdata_end[];
>>  extern unsigned long xenheap_initial_phys_start;
>>  extern uint64_t boot_tsc_stamp;
>> 
>> +extern char cpu0_stack[STACK_SIZE];
>>  extern void *stack_start;
>> 
>> +extern unsigned long cr4_pv32_mask;
> 
> This one might better go in compat.h, albeit that would require it's
> setting to be gated to CONFIG_PV32.  setup.h is IMO for init time
> stuff.
> 

Ok

>> +
>>  void early_cpu_init(void);
>>  void early_time_init(void);
>> 
>> diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
>> index 6abfd8162120..604dba94b052 100644
>> --- a/xen/arch/x86/irq.c
>> +++ b/xen/arch/x86/irq.c
>> @@ -43,7 +43,7 @@ int __read_mostly opt_irq_vector_map = 
>> OPT_IRQ_VECTOR_MAP_DEFAULT;
>>  static unsigned char __read_mostly irq_max_guests;
>>  integer_param("irq-max-guests", irq_max_guests);
>> 
>> -vmask_t global_used_vector_map;
>> +static vmask_t global_used_vector_map;
>> 
>>  struct irq_desc __read_mostly *irq_desc = NULL;
>> 
>> diff --git a/xen/arch/x86/platform_hypercall.c 
>> b/xen/arch/x86/platform_hypercall.c
>> index 9469de9045c7..e4dbec73d784 100644
>> --- a/xen/arch/x86/platform_hypercall.c
>> +++ b/xen/arch/x86/platform_hypercall.c
>> @@ -36,9 +36,6 @@
>>  #include "cpu/mtrr/mtrr.h"
>>  #include <xsm/xsm.h>
>> 
>> -/* Declarations for items shared with the compat mode handler. */
>> -extern spinlock_t xenpf_lock;
>> -
>>  #define RESOURCE_ACCESS_MAX_ENTRIES 3
>>  struct resource_access {
>>      unsigned int nr_done;
>> diff --git a/xen/common/symbols.c b/xen/common/symbols.c
>> index 691e61792506..7c3514c65f2e 100644
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
>> diff --git a/xen/include/xen/hypercall.h b/xen/include/xen/hypercall.h
>> index f307dfb59760..12de5a69b5b1 100644
>> --- a/xen/include/xen/hypercall.h
>> +++ b/xen/include/xen/hypercall.h
>> @@ -24,6 +24,9 @@
>>  /* Needs to be after asm/hypercall.h. */
>>  #include <xen/hypercall-defs.h>
>> 
>> +/* Declarations for items shared with the compat mode handler. */
>> +extern spinlock_t xenpf_lock;
> 
> I'm confused about why this needs to be moved, AFAICT xenpf_lock is
> only used in platform_hypercall.c, and the declaration is
> unconditional, so there's no definition without declaration issue.
> 

The violation was on ARM code, because of a slight inconsistency:
xen/arch/arm/platform_hypercall.c:DEFINE_SPINLOCK(xenpf_lock);

xen/arch/x86/platform_hypercall.c:extern spinlock_t xenpf_lock;
xen/arch/x86/platform_hypercall.c:DEFINE_SPINLOCK(xenpf_lock);

therefore, by moving the extern declaration to the common header there 
should be no issue.

>> +
>>  extern long
>>  arch_do_domctl(
>>      struct xen_domctl *domctl, struct domain *d,
>> diff --git a/xen/include/xen/symbols.h b/xen/include/xen/symbols.h
>> index 20bbb28ef226..92540409265e 100644
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
> This one is ugly, but I can't see a better way immediately.
> 
> Thanks, Roger.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

