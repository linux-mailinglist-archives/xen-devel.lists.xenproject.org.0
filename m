Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E191ECF80
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jun 2020 14:11:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgSE0-0005Fp-Nh; Wed, 03 Jun 2020 12:10:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zj/c=7Q=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1jgSDz-0005Fk-2Z
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2020 12:10:27 +0000
X-Inumbo-ID: 348c31fc-a593-11ea-9dbe-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 348c31fc-a593-11ea-9dbe-bc764e2007e4;
 Wed, 03 Jun 2020 12:10:25 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: al/iUDHjbqCLo0Dbfa69Rh48/RKETZ0BT/JrPri5Aah68Cb0hOBUwW7v/mlj7AaU7J6ROesNhG
 FhRnZCy4HfY0XLOXrc4CMvDa1cnKUzhT4T1gDG9Bh/LR8MOCP/5LqgSdJ6DW7zN8clTSB/87eD
 fXVb80bAvG9cA0yHgRjvNyqbDAyHhxQTJtYcKQXyda10M+YuSWG80qF5VXIzGHY67+x4tXxgH1
 5TpERorVuNPt+9TIE8RZySL833osFWs4AZdxb5llAqAL6mNxHD9kRjdHOMgLS8VMUhAtUCB6nY
 x6I=
X-SBRS: 2.7
X-MesageID: 19461645
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,467,1583211600"; d="scan'208";a="19461645"
Subject: Re: [PATCH v2] x86/svm: do not try to handle recalc NPT faults
 immediately
To: <paul@xen.org>, 'Jan Beulich' <jbeulich@suse.com>
References: <1591116981-30162-1-git-send-email-igor.druzhinin@citrix.com>
 <37e6e543-564d-2625-b8d9-ccca6106efd2@suse.com>
 <000f01d63991$717b5e80$54721b80$@xen.org>
 <f1157af8-dd61-d9c2-a405-1e7d13615980@suse.com>
 <001e01d6399a$1ac56820$50503860$@xen.org>
 <ee50db9a-3d73-2ed4-579d-983882d13ef3@citrix.com>
 <002d01d6399c$ec115a90$c4340fb0$@xen.org>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <b3d01e55-8473-399e-8a9d-8ac8aefd2fd6@citrix.com>
Date: Wed, 3 Jun 2020 13:10:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <002d01d6399c$ec115a90$c4340fb0$@xen.org>
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
Cc: xen-devel@lists.xenproject.org, roger.pau@citrix.com,
 george.dunlap@citrix.com, wl@xen.org, andrew.cooper3@citrix.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 03/06/2020 12:48, Paul Durrant wrote:
>> -----Original Message-----
>> From: Igor Druzhinin <igor.druzhinin@citrix.com>
>> Sent: 03 June 2020 12:45
>> To: paul@xen.org; 'Jan Beulich' <jbeulich@suse.com>
>> Cc: xen-devel@lists.xenproject.org; andrew.cooper3@citrix.com; wl@xen.org; roger.pau@citrix.com;
>> george.dunlap@citrix.com
>> Subject: Re: [PATCH v2] x86/svm: do not try to handle recalc NPT faults immediately
>>
>> On 03/06/2020 12:28, Paul Durrant wrote:
>>>> -----Original Message-----
>>>> From: Jan Beulich <jbeulich@suse.com>
>>>> Sent: 03 June 2020 12:22
>>>> To: paul@xen.org
>>>> Cc: 'Igor Druzhinin' <igor.druzhinin@citrix.com>; xen-devel@lists.xenproject.org;
>>>> andrew.cooper3@citrix.com; wl@xen.org; roger.pau@citrix.com; george.dunlap@citrix.com
>>>> Subject: Re: [PATCH v2] x86/svm: do not try to handle recalc NPT faults immediately
>>>>
>>>> On 03.06.2020 12:26, Paul Durrant wrote:
>>>>>> -----Original Message-----
>>>>>> From: Jan Beulich <jbeulich@suse.com>
>>>>>> Sent: 03 June 2020 11:03
>>>>>> To: Igor Druzhinin <igor.druzhinin@citrix.com>
>>>>>> Cc: xen-devel@lists.xenproject.org; andrew.cooper3@citrix.com; wl@xen.org; roger.pau@citrix.com;
>>>>>> george.dunlap@citrix.com; Paul Durrant <paul@xen.org>
>>>>>> Subject: Re: [PATCH v2] x86/svm: do not try to handle recalc NPT faults immediately
>>>>>>
>>>>>> On 02.06.2020 18:56, Igor Druzhinin wrote:
>>>>>>> A recalculation NPT fault doesn't always require additional handling
>>>>>>> in hvm_hap_nested_page_fault(), moreover in general case if there is no
>>>>>>> explicit handling done there - the fault is wrongly considered fatal.
>>>>>>>
>>>>>>> This covers a specific case of migration with vGPU assigned on AMD:
>>>>>>> at a moment log-dirty is enabled globally, recalculation is requested
>>>>>>> for the whole guest memory including directly mapped MMIO regions of vGPU
>>>>>>> which causes a page fault being raised at the first access to those;
>>>>>>> but due to MMIO P2M type not having any explicit handling in
>>>>>>> hvm_hap_nested_page_fault() a domain is erroneously crashed with unhandled
>>>>>>> SVM violation.
>>>>>>>
>>>>>>> Instead of trying to be opportunistic - use safer approach and handle
>>>>>>> P2M recalculation in a separate NPT fault by attempting to retry after
>>>>>>> making the necessary adjustments. This is aligned with Intel behavior
>>>>>>> where there are separate VMEXITs for recalculation and EPT violations
>>>>>>> (faults) and only faults are handled in hvm_hap_nested_page_fault().
>>>>>>> Do it by also unifying do_recalc return code with Intel implementation
>>>>>>> where returning 1 means P2M was actually changed.
>>>>>>>
>>>>>>> Since there was no case previously where p2m_pt_handle_deferred_changes()
>>>>>>> could return a positive value - it's safe to replace ">= 0" with just "== 0"
>>>>>>> in VMEXIT_NPF handler. finish_type_change() is also not affected by the
>>>>>>> change as being able to deal with >0 return value of p2m->recalc from
>>>>>>> EPT implementation.
>>>>>>>
>>>>>>> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
>>>>>>> Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>
>>>>>>
>>>>>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>>>>>> albeit preferably with ...
>>>>>>
>>>>>>> @@ -448,12 +451,14 @@ static int do_recalc(struct p2m_domain *p2m, unsigned long gfn)
>>>>>>>              clear_recalc(l1, e);
>>>>>>>          err = p2m->write_p2m_entry(p2m, gfn, pent, e, level + 1);
>>>>>>>          ASSERT(!err);
>>>>>>> +
>>>>>>> +        recalc_done = true;
>>>>>>>      }
>>>>>>>
>>>>>>>   out:
>>>>>>>      unmap_domain_page(table);
>>>>>>>
>>>>>>> -    return err;
>>>>>>> +    return err ?: (recalc_done ? 1 : 0);
>>>>>>
>>>>>> ... this shrunk to
>>>>>>
>>>>>>     return err ?: recalc_done;
>>>>>>
>>>>>> (easily doable while committing).
>>>>>>
>>>>>> Also Cc Paul.
>>>>>>
>>>>>
>>>>> paging_log_dirty_enable() still fails global enable if has_arch_pdevs()
>>>>> is true, so presumably there's no desperate need for this to go in 4.14?
>>>>
>>>> The MMIO case is just the particular situation here. Aiui the same issue
>>>> could potentially surface with other p2m types. Also given I'd consider
>>>> this a backporting candidate, while it may not be desperately needed for
>>>> the release, I think it deserves considering beyond the specific aspect
>>>> you mention.
>>>>
>>>
>>> In which case I think the commit message probably ought to be rephrased, since it appears to focus
>> on a case that cannot currently happen.
>>
>> This can happen without has_arch_pdevs() being true. It's enough to just
>> directly map some physical memory into a guest to get p2m_direct_mmio
>> type present in the page tables.
> 
> OK, that's fine, but when will that happen without pass-through? If we can have a commit message justifying the change based on what can actually happen now, then I would not be opposed to it going in 4.14.

Yes, it can happen now - we had regular (not SR-IOV) vGPU migration totally
broken because of this on AMD - never got tested before at all. You don't need
special patches on top of Xen or anything.

To get p2m_mmio_direct you just need to call XEN_DOMCTL_memory_mapping on a domain.

All 

Igor

