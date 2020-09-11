Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6C5265FD7
	for <lists+xen-devel@lfdr.de>; Fri, 11 Sep 2020 14:54:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGiYK-0008TP-Ov; Fri, 11 Sep 2020 12:53:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N27I=CU=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kGiYJ-0008TK-EN
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2020 12:53:19 +0000
X-Inumbo-ID: 4b7c1091-6497-4c4a-9c37-08e8598354bb
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4b7c1091-6497-4c4a-9c37-08e8598354bb;
 Fri, 11 Sep 2020 12:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1599828797;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=ZygfNovylEo3zXg02M7Qf9siJLWmKy0LSw0s+3tr3j8=;
 b=bd4zdRE+uhjFJctW4jQ85v3K/GtsMjxXd/ixwUlt/d9iHYLRFyQVuGSI
 fToavi9b2lVv8i+rXkWvpR7jPPVVCDhG/1b9yLpQoO9IOIApq2eh4Ib26
 Noh81Bxpt3ISuvRr/zVzm9kGAbKZjt1tnerzBQlz+IGFZ8p8z1QCn81Hk o=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: Armard+jyVQnP+yo/uN6DSBQCxrwe1kxHsTBQKZoTumQCT/M+HqzG16HC0/GesBfNZlOSlyceD
 fc22uh9amlTjq+usGdx0XiQMjpgg4yDDLrNAM3HXSmDw2kbtjjdxAY4iTq6U84x4EyjCU36dyx
 1zkgVqAG0X16RviNHSbHkixA8W+1pIQtYwQ20SOGuwDL27woC/D9pbM8Tjt5AplZgkA+QLOFM6
 cH01ajlvya7L0enLYLyR4nJfPYobtkPkbxx8tr98Z5ORA0ioIQZsam5VlY/Zt1yX5GMRaMsl0j
 th0=
X-SBRS: 2.7
X-MesageID: 26790723
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,415,1592884800"; d="scan'208";a="26790723"
Subject: Re: [PATCH 4/5] x86/pv: Optimise to the segment context switching
 paths
To: Jan Beulich <jbeulich@suse.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20200909095920.25495-1-andrew.cooper3@citrix.com>
 <20200909095920.25495-5-andrew.cooper3@citrix.com>
 <34206c45-5dfb-a3de-716a-5365db3be1c5@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <2ab95b98-9bee-f85c-20a8-83d7eb09d62e@citrix.com>
Date: Fri, 11 Sep 2020 13:53:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <34206c45-5dfb-a3de-716a-5365db3be1c5@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL05.citrite.net (10.13.108.178)
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 11/09/2020 10:49, Jan Beulich wrote:
> On 09.09.2020 11:59, Andrew Cooper wrote:
>> Save the segment selectors with explicit asm, rather than with read_sreg().
>> This permits the use of MOV's m16 encoding, which avoids indirecting the
>> selector value through a register.
> Instead of this, how about making read_sreg() look like
>
> #define read_sreg(val, name) ({                                  \
>     if ( sizeof(val) == 2 )                                      \
>         asm volatile ( "mov %%" STR(name) ",%0" : "=m" (val) );  \
>     else                                                         \
>         asm volatile ( "mov %%" STR(name) ",%k0" : "=r" (val) ); \
> })
>
> which then also covers read_registers()? I have a full patch
> ready to send, if you agree.

That will go wrong for

uint16_t ds; read_sreg(ds, ds);

as it will force the variable to be spilled onto the stack.

I don't think this is a clever move.


Furthermore, it is bad enough that read_sreg() already takes one magic
parameter which doesn't follow normal C rules - renaming to READ_SREG()
would be an improvement - but this is now adding a second which is a
capture by name.

I'm afraid that is a firm no from me.


There is one other place where we read all segment registers at once. 
Maybe having a static inline save_sregs(struct cpu_user_regs *) hiding
the asm block, but I'm not necessarily convinced of this plan either. 
At least it would cleanly separate the "I've obviously got a memory
operand" and "I almost certainly want it in a register anyway" logic.

>
>> For {save,load}_segments(), opencode the fs/gs helpers, as the optimiser is
>> unable to rearrange the logic down to a single X86_CR4_FSGSBASE check.  This
>> removes several jumps and creates bigger basic blocks.
>>
>> In load_segments(), optimise GS base handling substantially.  The call to
>> svm_load_segs() already needs gsb/gss the correct way around, so hoist the
>> logic for the later path to use it as well.  Swapping the inputs in GPRs is
>> far more efficient than using SWAPGS.
>>
>> Previously, there was optionally one SWAPGS from the user/kernel mode check,
>> two SWAPGS's in write_gs_shadow() and two WRGSBASE's.  Updates to GS (4 or 5
>> here) in quick succession stall all contemporary pipelines repeatedly.  (Intel
>> Core/Xeon pipelines have segment register renaming[1], so can continue to
>> speculatively execute with one GS update in flight.  Other pipelines cannot
>> have two updates in flight concurrently, and must stall dispatch of the second
>> until the first has retired.)
>>
>> Rewrite the logic to have exactly two WRGSBASEs and one SWAPGS, which removes
>> two stalles all contemporary processors.
>>
>> Although modest, the resulting delta is:
>>
>>   add/remove: 0/0 grow/shrink: 0/2 up/down: 0/-106 (-106)
>>   Function                                     old     new   delta
>>   paravirt_ctxt_switch_from                    235     198     -37
>>   context_switch                              3582    3513     -69
>>
>> in a common path.
>>
>> [1] https://software.intel.com/security-software-guidance/insights/deep-dive-intel-analysis-speculative-behavior-swapgs-and-segment-registers
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Preferably re-based onto said change, and maybe with another adjustment
> (see below)
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>
>> @@ -1556,18 +1557,24 @@ static void load_segments(struct vcpu *n)
>>                     : [ok] "+r" (all_segs_okay)          \
>>                     : [_val] "rm" (val) )
>>  
>> -#ifdef CONFIG_HVM
>> -    if ( cpu_has_svm && !compat && (uregs->fs | uregs->gs) <= 3 )
>> +    if ( !compat )
>>      {
>> -        unsigned long gsb = n->arch.flags & TF_kernel_mode
>> -            ? n->arch.pv.gs_base_kernel : n->arch.pv.gs_base_user;
>> -        unsigned long gss = n->arch.flags & TF_kernel_mode
>> -            ? n->arch.pv.gs_base_user : n->arch.pv.gs_base_kernel;
>> +        gsb = n->arch.pv.gs_base_kernel;
>> +        gss = n->arch.pv.gs_base_user;
>> +
>> +        /*
>> +         * Figure out which way around gsb/gss want to be.  gsb needs to be
>> +         * the active context, and gss needs to be the inactive context.
>> +         */
>> +        if ( !(n->arch.flags & TF_kernel_mode) )
>> +            SWAP(gsb, gss);
>>  
>> -        fs_gs_done = svm_load_segs(n->arch.pv.ldt_ents, LDT_VIRT_START(n),
>> -                                   n->arch.pv.fs_base, gsb, gss);
>> +        if ( IS_ENABLED(CONFIG_HVM) && cpu_has_svm &&
> The change from #ifdef to IS_ENABLED() wants mirroring to the
> prefetching site imo. I wonder though whether the adjustment is a
> good idea: The declaration lives in svm.h, and I would view it as
> quite reasonable for that header to not get included in !HVM builds
> (there may be a lot of disentangling to do to get there, but still).

I'm not overly fussed, but there will absolutely have to be HVM stubs
for normal code.  I don't see why we should special case svm_load_segs()
to not have a stub.

~Andrew

