Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1346B4558FF
	for <lists+xen-devel@lfdr.de>; Thu, 18 Nov 2021 11:25:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227305.393109 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnebc-0000pN-R2; Thu, 18 Nov 2021 10:25:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227305.393109; Thu, 18 Nov 2021 10:25:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnebc-0000nH-Nk; Thu, 18 Nov 2021 10:25:24 +0000
Received: by outflank-mailman (input) for mailman id 227305;
 Thu, 18 Nov 2021 10:25:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9nqF=QF=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1mnebb-0000nB-9C
 for xen-devel@lists.xenproject.org; Thu, 18 Nov 2021 10:25:23 +0000
Received: from ppsw-42.csi.cam.ac.uk (ppsw-42.csi.cam.ac.uk [131.111.8.142])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d5172e9c-4859-11ec-a9d2-d9f7a1cc8784;
 Thu, 18 Nov 2021 11:25:21 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:60038)
 by ppsw-42.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.138]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1mnebX-000nKV-9E (Exim 4.95) (return-path <amc96@srcf.net>);
 Thu, 18 Nov 2021 10:25:19 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 8DE811FA51;
 Thu, 18 Nov 2021 10:25:19 +0000 (GMT)
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
X-Inumbo-ID: d5172e9c-4859-11ec-a9d2-d9f7a1cc8784
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <066bc8de-c112-d18a-a33d-3bae4ae9c45a@srcf.net>
Date: Thu, 18 Nov 2021 10:25:19 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] xen/smp: Support NULL IPI function pointers
Content-Language: en-GB
To: Wei Chen <Wei.Chen@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20211117164852.16394-1-andrew.cooper3@citrix.com>
 <bdfc59ab-87cb-26bf-78f6-bc521e7bdd5b@arm.com>
From: Andrew Cooper <amc96@srcf.net>
In-Reply-To: <bdfc59ab-87cb-26bf-78f6-bc521e7bdd5b@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18/11/2021 06:51, Wei Chen wrote:
> Hi Andrew,
>
> On 2021/11/18 0:48, Andrew Cooper wrote:
>> There are several cases where the act of interrupting a remote
>> processor has
>> the required side effect.  Explicitly allow NULL function pointers so
>> the
>> calling code doesn't have to provide a stub implementation.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> CC: Wei Liu <wl@xen.org>
>>
>> The wait parameter is a little weird.  It serves double duty and will
>> confirm
>> that the IPI has been taken.  All it does is let you control whether
>> you also
>> wait for the handler to complete first.  As such, it is effectively
>> useless
>> with a stub function.
>>
>> I don't particularly like folding into the .wait() path like that, but I
>> dislike it less than an if()/else if() and adding a 3rd
>> cpumask_clear_cpu()
>> into the confusion which is this logic.
>> ---
>>   xen/arch/x86/mm/hap/hap.c | 11 +----------
>>   xen/arch/x86/mm/p2m-ept.c | 11 ++---------
>>   xen/common/smp.c          |  4 ++++
>>   3 files changed, 7 insertions(+), 19 deletions(-)
>>
>> diff --git a/xen/arch/x86/mm/hap/hap.c b/xen/arch/x86/mm/hap/hap.c
>> index 73575deb0d8a..5b269ef8b3bb 100644
>> --- a/xen/arch/x86/mm/hap/hap.c
>> +++ b/xen/arch/x86/mm/hap/hap.c
>> @@ -696,15 +696,6 @@ static void hap_update_cr3(struct vcpu *v, int
>> do_locking, bool noflush)
>>       hvm_update_guest_cr3(v, noflush);
>>   }
>>   -/*
>> - * Dummy function to use with on_selected_cpus in order to trigger a
>> vmexit on
>> - * selected pCPUs. When the VM resumes execution it will get a new
>> ASID/VPID
>> - * and thus a clean TLB.
>> - */
>> -static void dummy_flush(void *data)
>> -{
>> -}
>> -
>>   static bool flush_tlb(bool (*flush_vcpu)(void *ctxt, struct vcpu *v),
>>                         void *ctxt)
>>   {
>> @@ -737,7 +728,7 @@ static bool flush_tlb(bool (*flush_vcpu)(void
>> *ctxt, struct vcpu *v),
>>        * not currently running will already be flushed when scheduled
>> because of
>>        * the ASID tickle done in the loop above.
>>        */
>> -    on_selected_cpus(mask, dummy_flush, NULL, 0);
>> +    on_selected_cpus(mask, NULL, NULL, 0);
>>         return true;
>>   }
>> diff --git a/xen/arch/x86/mm/p2m-ept.c b/xen/arch/x86/mm/p2m-ept.c
>> index b2d57a3ee89a..1459f66c006b 100644
>> --- a/xen/arch/x86/mm/p2m-ept.c
>> +++ b/xen/arch/x86/mm/p2m-ept.c
>> @@ -1236,14 +1236,6 @@ static void ept_memory_type_changed(struct
>> p2m_domain *p2m)
>>           ept_sync_domain(p2m);
>>   }
>>   -static void __ept_sync_domain(void *info)
>> -{
>> -    /*
>> -     * The invalidation will be done before VMENTER (see
>> -     * vmx_vmenter_helper()).
>> -     */
>> -}
>> -
>>   static void ept_sync_domain_prepare(struct p2m_domain *p2m)
>>   {
>>       struct domain *d = p2m->domain;
>> @@ -1269,7 +1261,8 @@ static void ept_sync_domain_prepare(struct
>> p2m_domain *p2m)
>>     static void ept_sync_domain_mask(struct p2m_domain *p2m, const
>> cpumask_t *mask)
>>   {
>> -    on_selected_cpus(mask, __ept_sync_domain, p2m, 1);
>> +    /* Invalidation will be done in vmx_vmenter_helper(). */
>> +    on_selected_cpus(mask, NULL, NULL, 1);
>>   }
>>     void ept_sync_domain(struct p2m_domain *p2m)
>> diff --git a/xen/common/smp.c b/xen/common/smp.c
>> index 79f4ebd14502..854ebb91a803 100644
>> --- a/xen/common/smp.c
>> +++ b/xen/common/smp.c
>> @@ -87,10 +87,14 @@ void smp_call_function_interrupt(void)
>>         irq_enter();
>>   +    if ( unlikely(!func) )
>> +        goto no_func;
>> +
>>       if ( call_data.wait )
>>       {
>>           (*func)(info);
>>           smp_mb();
>> +    no_func:
>>           cpumask_clear_cpu(cpu, &call_data.selected);
>>       }
>>       else
>
> Why only apply to call_data.wait non-zero case?
> Is it because func will not be NULL when call_data.wait is zero?

This was explicitly discussed:

> The wait parameter is a little weird.  It serves double duty and will
> confirm
> that the IPI has been taken.  All it does is let you control whether
> you also
> wait for the handler to complete first.  As such, it is effectively
> useless
> with a stub function.
>
> I don't particularly like folding into the .wait() path like that, but I
> dislike it less than an if()/else if() and adding a 3rd
> cpumask_clear_cpu()
> into the confusion which is this logic. 

~Andrew

