Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E21A623EB47
	for <lists+xen-devel@lfdr.de>; Fri,  7 Aug 2020 12:13:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k3zMk-0008Mr-0s; Fri, 07 Aug 2020 10:12:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ERlR=BR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k3zMi-0008Mm-OE
 for xen-devel@lists.xenproject.org; Fri, 07 Aug 2020 10:12:44 +0000
X-Inumbo-ID: 5932de4e-2086-451b-bdc7-589828b61b78
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5932de4e-2086-451b-bdc7-589828b61b78;
 Fri, 07 Aug 2020 10:12:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 85B8BB6A4;
 Fri,  7 Aug 2020 10:13:00 +0000 (UTC)
Subject: Re: [PATCH 2/3] x86: don't maintain compat M2P when !PV32
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <a2b8f0e9-77ea-6127-a25e-d8fd3dcbb866@suse.com>
 <4575f42b-a347-b34e-0032-e04668106a9b@suse.com>
 <52b4f80f-9967-fae9-ce85-c69bf3b6e22d@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9cf5d060-3fee-db3c-8455-e09da998594b@suse.com>
Date: Fri, 7 Aug 2020 12:12:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <52b4f80f-9967-fae9-ce85-c69bf3b6e22d@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 06.08.2020 21:16, Andrew Cooper wrote:
> On 06/08/2020 10:28, Jan Beulich wrote:
>> Note that opt_pv32's declaration / #define need to be moved due to other
>> header dependencies; in particular can asm-x86/mm.h not include
>> asm-x86/pv/domain.h.
>> 
>> While touching their definitions anyway, also adjust section placement
>> of m2p_compat_vstart and compat_idle_pg_table_l2. Similarly, while
>> putting init_xen_pae_l2_slots() inside #ifdef, also move it to a PV-only
>> source file.
>>
>> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> So interestingly, this is done out of the order which I was expecting to
> do things.  Its not a problem, but I'd like to double check that we
> aren't creating future problems.

I've thought about this for quite some time, and didn't see how it
would cause problems. And the change here clearly is the more low
hanging fruit.

> The goal of this suggestion was actually for PV-Shim, to have only the
> regular or compat M2P, as they're fairly large structures and adversely
> affect VM density.

But in particular for {INVALID,SHARED}_M2P_ENTRY there'll need to
be some, well, hacks if we want to use the compat one as a
replacement for the native one. This will require some more careful
thought (at least on my side).

> This of course requires the kernel elf file to be parsed earlier during
> boot, but that isn't a problem.  (It also allows for a PV/PVH dom0
> usability fix, whereby the Xen command line has to match the ELF image
> provided, rather than auto-selecting the default when only one option is
> available.)

Hmm, no, that's not my current plan, see the cover letter. I've
already checked that there are no set_gpfn_from_mfn() uses (except
with INVALID_M2P_ENTRY) ahead of Dom0 creation. So instead of
moving the parsing earlier, I'm intending to move the setting up of
the (right) M2P later. My current take on this is that it'll mainly
involve breaking out existing code into its own functions.

> The other aspect would be to teach Xen to run on only the compat M2P,
> which is fine for any shim smaller than 16T.  (Honestly, if it weren't
> an ABI with guests, Shim ought to run exclusively on the compat M2P to
> reduce the memory overhead.)

You've covered the shim aspect above, I thought, and the ABI aspect
precludes not maintaining the native M2P when there's a 64-bit guest.
So I'm not sure what you're trying to suggest here that we may be
able to gain.

> Then during boot, the Shim path would chose to construct only the
> regular or compat M2P, based on bitness of the provided kernel.

That's the plan, yes, but covered higher up.

>> ---
>> An alternative place for opt_pv32.h would seem to be asm-x86/config.h.
> 
> Oh - yes please.  I think that would be better overall.

Done.

>> --- a/xen/arch/x86/domain.c
>> +++ b/xen/arch/x86/domain.c
>> @@ -597,8 +597,10 @@ int arch_domain_create(struct domain *d,
>>      }
>>      d->arch.emulation_flags = emflags;
>>  
>> +#ifdef CONFIG_PV32
>>      HYPERVISOR_COMPAT_VIRT_START(d) =
>>          is_pv_domain(d) ? __HYPERVISOR_COMPAT_VIRT_START : ~0u;
>> +#endif
> 
> Can we drop HYPERVISOR_COMPAT_VIRT_START() ?
> 
> Its use here as an lvalue in particular makes logic especually hard to
> follow, but all it is actually doing is wrapping the shorter
> d->arch.hv_compat_vstart
> 
> In particular, it would remove the need to conditionally stub
> HYPERVISOR_COMPAT_VIRT_START() later.

I can do this as a prereq patch, sure, but I'm not convinced as
the avoiding of the stub will mean a few new #ifdef-s afaict.
Please confirm that you're convinced this will yield the overall
better result.

>> --- a/xen/arch/x86/x86_64/mm.c
>> +++ b/xen/arch/x86/x86_64/mm.c
>> @@ -315,10 +318,10 @@ static void destroy_m2p_mapping(struct m
>>   */
>>  static int setup_compat_m2p_table(struct mem_hotadd_info *info)
>>  {
>> +    int err = 0;
>>      unsigned long i, smap, emap, epfn = info->epfn;
>>      mfn_t mfn;
>>      unsigned int n;
>> -    int err = 0;
> 
> Remnants of an earlier change?

Oops.

>> --- a/xen/include/asm-x86/mm.h
>> +++ b/xen/include/asm-x86/mm.h
>> @@ -42,8 +42,12 @@
>>  #define _PGT_validated    PG_shift(6)
>>  #define PGT_validated     PG_mask(1, 6)
>>   /* PAE only: is this an L2 page directory containing Xen-private mappings? */
>> +#ifdef CONFIG_PV32
>>  #define _PGT_pae_xen_l2   PG_shift(7)
>>  #define PGT_pae_xen_l2    PG_mask(1, 7)
>> +#else
>> +#define PGT_pae_xen_l2    0
>> +#endif
> 
> Hmm - this is going to irritate Coverity and Clang some more.  I still
> need to figure out an effective way to make Coverity not object to this
> type of short circuiting like this.

I assume this is just a remark, not implying any action on my
part?

> I've looked through the users and I think that they're all safe.

I wouldn't have dared make the change without first checking.

>  I do
> however wonder whether is_guest_l2_slot() can be simplified and have its
> is_pv_32bit_domain() clause dropped, seeing as it is expensive with its
> lfences, and the logic ought to only care about PGT_pae_xen_l2 vs
> PGT_l2_page_table.

Good idea, yes, but that'll be a separate patch.

>> @@ -494,15 +498,39 @@ extern paddr_t mem_hotplug;
>>  #define SHARED_M2P_ENTRY         (~0UL - 1UL)
>>  #define SHARED_M2P(_e)           ((_e) == SHARED_M2P_ENTRY)
>>  
>> -#define compat_machine_to_phys_mapping ((unsigned int *)RDWR_COMPAT_MPT_VIRT_START)
>> +#ifdef CONFIG_PV32
>> +
>> +extern int8_t opt_pv32;
>> +
>> +# define compat_machine_to_phys_mapping ((unsigned int *)RDWR_COMPAT_MPT_VIRT_START)
>> +
>> +# define set_compat_m2p(mfn, entry) \
>> +    ((void)(!opt_pv32 || \
>> +            (mfn) >= (RDWR_COMPAT_MPT_VIRT_END - RDWR_COMPAT_MPT_VIRT_START) / 4 || \
>> +            (compat_machine_to_phys_mapping[mfn] = (entry))))
> 
> I know this is extracting previous logic, but "entry" would probably be
> better if it were named "val" or similar.

I was wondering myself, but didn't consider val or alike meaningfully
better. As it looks you do, I'll switch.

> However, see my reply to patch 3 which I think will simplify this
> substantially.

Neither my inbox nor the list archives have such a reply, so I can
only assume this is yet to be sent.

Jan

