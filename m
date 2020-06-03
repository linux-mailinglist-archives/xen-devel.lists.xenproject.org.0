Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA01B1ECE37
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jun 2020 13:23:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgRTH-0008Iy-0y; Wed, 03 Jun 2020 11:22:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=n250=7Q=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jgRTF-0008It-Ho
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2020 11:22:09 +0000
X-Inumbo-ID: 744d005c-a58c-11ea-ace1-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 744d005c-a58c-11ea-ace1-12813bfff9fa;
 Wed, 03 Jun 2020 11:22:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A790FAC91;
 Wed,  3 Jun 2020 11:22:07 +0000 (UTC)
Subject: Re: [PATCH v2] x86/svm: do not try to handle recalc NPT faults
 immediately
To: paul@xen.org
References: <1591116981-30162-1-git-send-email-igor.druzhinin@citrix.com>
 <37e6e543-564d-2625-b8d9-ccca6106efd2@suse.com>
 <000f01d63991$717b5e80$54721b80$@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f1157af8-dd61-d9c2-a405-1e7d13615980@suse.com>
Date: Wed, 3 Jun 2020 13:22:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <000f01d63991$717b5e80$54721b80$@xen.org>
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
Cc: 'Igor Druzhinin' <igor.druzhinin@citrix.com>, wl@xen.org,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com,
 xen-devel@lists.xenproject.org, roger.pau@citrix.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 03.06.2020 12:26, Paul Durrant wrote:
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: 03 June 2020 11:03
>> To: Igor Druzhinin <igor.druzhinin@citrix.com>
>> Cc: xen-devel@lists.xenproject.org; andrew.cooper3@citrix.com; wl@xen.org; roger.pau@citrix.com;
>> george.dunlap@citrix.com; Paul Durrant <paul@xen.org>
>> Subject: Re: [PATCH v2] x86/svm: do not try to handle recalc NPT faults immediately
>>
>> On 02.06.2020 18:56, Igor Druzhinin wrote:
>>> A recalculation NPT fault doesn't always require additional handling
>>> in hvm_hap_nested_page_fault(), moreover in general case if there is no
>>> explicit handling done there - the fault is wrongly considered fatal.
>>>
>>> This covers a specific case of migration with vGPU assigned on AMD:
>>> at a moment log-dirty is enabled globally, recalculation is requested
>>> for the whole guest memory including directly mapped MMIO regions of vGPU
>>> which causes a page fault being raised at the first access to those;
>>> but due to MMIO P2M type not having any explicit handling in
>>> hvm_hap_nested_page_fault() a domain is erroneously crashed with unhandled
>>> SVM violation.
>>>
>>> Instead of trying to be opportunistic - use safer approach and handle
>>> P2M recalculation in a separate NPT fault by attempting to retry after
>>> making the necessary adjustments. This is aligned with Intel behavior
>>> where there are separate VMEXITs for recalculation and EPT violations
>>> (faults) and only faults are handled in hvm_hap_nested_page_fault().
>>> Do it by also unifying do_recalc return code with Intel implementation
>>> where returning 1 means P2M was actually changed.
>>>
>>> Since there was no case previously where p2m_pt_handle_deferred_changes()
>>> could return a positive value - it's safe to replace ">= 0" with just "== 0"
>>> in VMEXIT_NPF handler. finish_type_change() is also not affected by the
>>> change as being able to deal with >0 return value of p2m->recalc from
>>> EPT implementation.
>>>
>>> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
>>> Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>
>>
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>> albeit preferably with ...
>>
>>> @@ -448,12 +451,14 @@ static int do_recalc(struct p2m_domain *p2m, unsigned long gfn)
>>>              clear_recalc(l1, e);
>>>          err = p2m->write_p2m_entry(p2m, gfn, pent, e, level + 1);
>>>          ASSERT(!err);
>>> +
>>> +        recalc_done = true;
>>>      }
>>>
>>>   out:
>>>      unmap_domain_page(table);
>>>
>>> -    return err;
>>> +    return err ?: (recalc_done ? 1 : 0);
>>
>> ... this shrunk to
>>
>>     return err ?: recalc_done;
>>
>> (easily doable while committing).
>>
>> Also Cc Paul.
>>
> 
> paging_log_dirty_enable() still fails global enable if has_arch_pdevs()
> is true, so presumably there's no desperate need for this to go in 4.14?

The MMIO case is just the particular situation here. Aiui the same issue
could potentially surface with other p2m types. Also given I'd consider
this a backporting candidate, while it may not be desperately needed for
the release, I think it deserves considering beyond the specific aspect
you mention.

Jan

