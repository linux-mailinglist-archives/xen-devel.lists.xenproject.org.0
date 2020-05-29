Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 704261E8135
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 17:07:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jegbJ-00040T-H6; Fri, 29 May 2020 15:07:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3yhI=7L=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1jegbI-00040I-Ay
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 15:07:12 +0000
X-Inumbo-ID: 1219e28c-a1be-11ea-8993-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1219e28c-a1be-11ea-8993-bc764e2007e4;
 Fri, 29 May 2020 15:07:11 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: e7XbytowCZx0ORFF5jF8a6kGqCFaqssE1F7VlabNyK7R2AlLLWub5sftG0Y61FE4T1S2FJyniL
 lSZ4W78NgiuUK48V2uDucyoXzLXFhaxYubrgmE6uueoMM7ICCkLGfq25PndSQ1sISd+KT0XSTm
 flPgBl41970kDw2BXh4f1ENsKfDs0yV/hENx3gxaQFEL3qYkR7sOPdyphGKRVok4AM6jSRa9gD
 N9Dzc2eg1m0nSduDx3kiraWS4r8M+9UokCyW2zDOHAnDxc1lj/jLxL+287NGG7UShflgEYXs3m
 k1w=
X-SBRS: 2.7
X-MesageID: 19118900
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,449,1583211600"; d="scan'208";a="19118900"
Subject: Re: [PATCH] x86/svm: do not try to handle recalc NPT faults
 immediately
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger@xen.org>
References: <1590712553-7298-1-git-send-email-igor.druzhinin@citrix.com>
 <20200529143331.GO1195@Air-de-Roger>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <98dda864-e47e-bba5-a66b-02662708c540@citrix.com>
Date: Fri, 29 May 2020 16:06:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200529143331.GO1195@Air-de-Roger>
Content-Type: text/plain; charset="utf-8"
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
Cc: xen-devel@lists.xenproject.org, george.dunlap@citrix.com, wl@xen.org,
 jbeulich@suse.com, andrew.cooper3@citrix.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 29/05/2020 15:33, Roger Pau Monné wrote:
> On Fri, May 29, 2020 at 01:35:53AM +0100, Igor Druzhinin wrote:
>> A recalculation NPT fault doesn't always require additional handling
>> in hvm_hap_nested_page_fault(), moreover in general case if there is no
>> explicit handling done there - the fault is wrongly considered fatal.
>>
>> Instead of trying to be opportunistic - use safer approach and handle
>> P2M recalculation in a separate NPT fault by attempting to retry after
>> making the necessary adjustments. This is aligned with Intel behavior
>> where there are separate VMEXITs for recalculation and EPT violations
>> (faults) and only faults are handled in hvm_hap_nested_page_fault().
>> Do it by also unifying do_recalc return code with Intel implementation
>> where returning 1 means P2M was actually changed.
> 
> That seems like a good approach IMO.
> 
> Do you know whether this will make the code slower? (since there are
> cases previously handled in a single vmexit that would take two
> vmexits now)

The only case I could think of is memory writes during migration -
first fault would propagate P2M type recalculation while the second
actually log a dirty page.

The slowdown would be only during live phase obviously but should be
marginal and in line with what we currently have on Intel.

>> This covers a specific case of migration with vGPU assigned on AMD:
>> global log-dirty is enabled and causes immediate recalculation NPT
>> fault in MMIO area upon access.
>>
>> Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>
> 
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
> 
>> ---
>> This is a safer alternative to:
>> https://lists.xenproject.org/archives/html/xen-devel/2020-05/msg01662.html
>> and more correct approach from my PoV.
>> ---
>>  xen/arch/x86/hvm/svm/svm.c | 5 +++--
>>  xen/arch/x86/mm/p2m-pt.c   | 8 ++++++--
>>  2 files changed, 9 insertions(+), 4 deletions(-)
>>
>> diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
>> index 46a1aac..7f6f578 100644
>> --- a/xen/arch/x86/hvm/svm/svm.c
>> +++ b/xen/arch/x86/hvm/svm/svm.c
>> @@ -2923,9 +2923,10 @@ void svm_vmexit_handler(struct cpu_user_regs *regs)
>>              v->arch.hvm.svm.cached_insn_len = vmcb->guest_ins_len & 0xf;
>>          rc = vmcb->exitinfo1 & PFEC_page_present
>>               ? p2m_pt_handle_deferred_changes(vmcb->exitinfo2) : 0;
>> -        if ( rc >= 0 )
>> +        if ( rc == 0 )
>> +            /* If no recal adjustments were being made - handle this fault */
>>              svm_do_nested_pgfault(v, regs, vmcb->exitinfo1, vmcb->exitinfo2);
>> -        else
>> +        else if ( rc < 0 )
>>          {
>>              printk(XENLOG_G_ERR
>>                     "%pv: Error %d handling NPF (gpa=%08lx ec=%04lx)\n",
>> diff --git a/xen/arch/x86/mm/p2m-pt.c b/xen/arch/x86/mm/p2m-pt.c
>> index 5c05017..377565b 100644
>> --- a/xen/arch/x86/mm/p2m-pt.c
>> +++ b/xen/arch/x86/mm/p2m-pt.c
>> @@ -340,7 +340,7 @@ static int do_recalc(struct p2m_domain *p2m, unsigned long gfn)
>>      unsigned long gfn_remainder = gfn;
>>      unsigned int level = 4;
>>      l1_pgentry_t *pent;
>> -    int err = 0;
>> +    int err = 0, rc = 0;
>>  
>>      table = map_domain_page(pagetable_get_mfn(p2m_get_pagetable(p2m)));
>>      while ( --level )
>> @@ -402,6 +402,8 @@ static int do_recalc(struct p2m_domain *p2m, unsigned long gfn)
>>                  clear_recalc(l1, e);
>>                  err = p2m->write_p2m_entry(p2m, gfn, pent, e, level + 1);
>>                  ASSERT(!err);
>> +
>> +                rc = 1;
>>              }
>>          }
>>          unmap_domain_page((void *)((unsigned long)pent & PAGE_MASK));
>> @@ -448,12 +450,14 @@ static int do_recalc(struct p2m_domain *p2m, unsigned long gfn)
>>              clear_recalc(l1, e);
>>          err = p2m->write_p2m_entry(p2m, gfn, pent, e, level + 1);
>>          ASSERT(!err);
>> +
>> +        rc = 1;
>>      }
>>  
>>   out:
>>      unmap_domain_page(table);
>>  
>> -    return err;
>> +    return err ? err : rc;
> 
> Nit: you can use the elvis operator here: return err ?: rc;
> 
> Also I couldn't spot any caller that would have troubles with the
> function now returning 1 in certain conditions, can you confirm the
> callers have been audited?

Yes, I checked all the callers before making the change. That's actually
where I spotted Intel side is doing exactly the same already.

Igor

