Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E77821E81C1
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 17:25:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jegsc-0006mP-F0; Fri, 29 May 2020 15:25:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3yhI=7L=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1jegsb-0006mJ-Dh
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 15:25:05 +0000
X-Inumbo-ID: 921a3728-a1c0-11ea-a8d8-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 921a3728-a1c0-11ea-a8d8-12813bfff9fa;
 Fri, 29 May 2020 15:25:05 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: eMASQgUNIxf6utwX+JKKmoRpxE9KsHtdpvm18Bo4OmtjLV+g5giO0c71kQ08KY8kuJEldjFzpj
 VYkqlU12OyVy2SK+GIdbxyljSqc+WMe9H4rXxoPc+OSsaZNK6uwdqzKP/k8rTXnop6qNEIHBAV
 4zrb1uXgPxcBUpEIUsxZuKrCn1MsE12NyH7vOw+rzzwCL8RlrprbeE/6cj3yUVi8StJMcDrlq+
 zARNMC96YL6LGCWcBIYl/ZxW95JuylGKpOGxOwXzRXQztHoWfo0iA8+NToVxKtqf0gToJukfy6
 R0s=
X-SBRS: 2.7
X-MesageID: 19513531
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,449,1583211600"; d="scan'208";a="19513531"
Subject: Re: [PATCH] x86/svm: do not try to handle recalc NPT faults
 immediately
From: Igor Druzhinin <igor.druzhinin@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
References: <1590712553-7298-1-git-send-email-igor.druzhinin@citrix.com>
 <bb934c0c-3f0d-df7e-1720-8dbbdbf7691d@suse.com>
 <026404fb-54b7-d03f-b4c5-367bcb5af41d@citrix.com>
Message-ID: <973a9bbb-d40d-8fd0-5e14-6119efd093b7@citrix.com>
Date: Fri, 29 May 2020 16:24:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <026404fb-54b7-d03f-b4c5-367bcb5af41d@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

On 29/05/2020 16:17, Igor Druzhinin wrote:
> On 29/05/2020 15:34, Jan Beulich wrote:
>> On 29.05.2020 02:35, Igor Druzhinin wrote:
>>> A recalculation NPT fault doesn't always require additional handling
>>> in hvm_hap_nested_page_fault(), moreover in general case if there is no
>>> explicit handling done there - the fault is wrongly considered fatal.
>>>
>>> Instead of trying to be opportunistic - use safer approach and handle
>>> P2M recalculation in a separate NPT fault by attempting to retry after
>>> making the necessary adjustments. This is aligned with Intel behavior
>>> where there are separate VMEXITs for recalculation and EPT violations
>>> (faults) and only faults are handled in hvm_hap_nested_page_fault().
>>> Do it by also unifying do_recalc return code with Intel implementation
>>> where returning 1 means P2M was actually changed.
>>>
>>> This covers a specific case of migration with vGPU assigned on AMD:
>>> global log-dirty is enabled and causes immediate recalculation NPT
>>> fault in MMIO area upon access.
>>
>> To be honest, from this last paragraph I still can't really derive
>> what goes wrong exactly why, before this change.
> 
> I admit it might require some knowledge of how vGPU is implemented. I will try
> to give more info in this paragraph.
> 
>>> Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>
>>> ---
>>> This is a safer alternative to:
>>> https://lists.xenproject.org/archives/html/xen-devel/2020-05/msg01662.html
>>> and more correct approach from my PoV.
>>
>> Indeed - I was about to reply there, but then I thought I'd first
>> look at this patch, in case it was a replacement.
>>
>>> --- a/xen/arch/x86/hvm/svm/svm.c
>>> +++ b/xen/arch/x86/hvm/svm/svm.c
>>> @@ -2923,9 +2923,10 @@ void svm_vmexit_handler(struct cpu_user_regs *regs)
>>>              v->arch.hvm.svm.cached_insn_len = vmcb->guest_ins_len & 0xf;
>>>          rc = vmcb->exitinfo1 & PFEC_page_present
>>>               ? p2m_pt_handle_deferred_changes(vmcb->exitinfo2) : 0;
>>> -        if ( rc >= 0 )
>>> +        if ( rc == 0 )
>>> +            /* If no recal adjustments were being made - handle this fault */
>>>              svm_do_nested_pgfault(v, regs, vmcb->exitinfo1, vmcb->exitinfo2);
>>> -        else
>>> +        else if ( rc < 0 )
>>
>> So from going through the code and judging by the comment in
>> finish_type_change() (which btw you will need to update, to avoid
>> it becoming stale) the >= here was there just in case, without
>> there actually being any case where a positive value would be
>> returned. It that's also the conclusion you've drawn, then I
>> think it would help mentioning this in the description.
> 
> I re-read the comments in finish_type_change() and to me they look
> pretty much in line with the now common interface between EPT and NPT
> recalc calls. 

Sorry, upon close examination there is indeed a new case missed. Thanks
for pointing out.

Igor

