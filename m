Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A39491C8276
	for <lists+xen-devel@lfdr.de>; Thu,  7 May 2020 08:26:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jWZyA-0000SY-CI; Thu, 07 May 2020 06:25:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0ibL=6V=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jWZy8-0000ST-U3
 for xen-devel@lists.xenproject.org; Thu, 07 May 2020 06:25:16 +0000
X-Inumbo-ID: 819fb91f-902b-11ea-9ee2-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 819fb91f-902b-11ea-9ee2-12813bfff9fa;
 Thu, 07 May 2020 06:25:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 4BFCBAF13;
 Thu,  7 May 2020 06:25:14 +0000 (UTC)
Subject: Re: [PATCH] x86/svm: Clean up vmcbcleanbits_t handling
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200505173250.5916-1-andrew.cooper3@citrix.com>
 <961921e3-c882-dad0-837e-71644f8bf208@suse.com>
 <d64d8593-9d88-2d42-69dc-c1d8b7018c99@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <44291471-004c-915e-224a-cdab4c306676@suse.com>
Date: Thu, 7 May 2020 08:25:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <d64d8593-9d88-2d42-69dc-c1d8b7018c99@citrix.com>
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 06.05.2020 18:49, Andrew Cooper wrote:
> On 06/05/2020 16:10, Jan Beulich wrote:
>> On 05.05.2020 19:32, Andrew Cooper wrote:
>>> @@ -435,17 +435,13 @@ static int nsvm_vmcb_prepare4vmrun(struct vcpu *v, struct cpu_user_regs *regs)
>>>      ASSERT(n2vmcb != NULL);
>>>  
>>>      /* Check if virtual VMCB cleanbits are valid */
>>> -    vcleanbits_valid = 1;
>>> -    if ( svm->ns_ovvmcb_pa == INVALID_PADDR )
>>> -        vcleanbits_valid = 0;
>>> -    if (svm->ns_ovvmcb_pa != nv->nv_vvmcxaddr)
>>> -        vcleanbits_valid = 0;
>>> -
>>> -#define vcleanbit_set(_name)	\
>>> -    (vcleanbits_valid && ns_vmcb->cleanbits.fields._name)
>>> +    if ( svm->ns_ovvmcb_pa != INVALID_PADDR &&
>>> +         svm->ns_ovvmcb_pa != nv->nv_vvmcxaddr )
>>> +        clean = ns_vmcb->cleanbits;
>> It looks to me as if the proper inversion of the original condition
>> would mean == on the right side of &&, not != .
> 
> Oops, yes.  Fixed.

And then
Reviewed-by: Jan Beulich <jbeulich@suse.com>

>>> --- a/xen/include/asm-x86/hvm/svm/vmcb.h
>>> +++ b/xen/include/asm-x86/hvm/svm/vmcb.h
>>> @@ -384,34 +384,21 @@ typedef union
>>>  
>>>  typedef union
>>>  {
>>> -    uint32_t bytes;
>>> -    struct
>>> -    {
>>> -        /* cr_intercepts, dr_intercepts, exception_intercepts,
>>> -         * general{1,2}_intercepts, pause_filter_count, tsc_offset */
>>> -        uint32_t intercepts: 1;
>>> -        /* iopm_base_pa, msrpm_base_pa */
>>> -        uint32_t iopm: 1;
>>> -        /* guest_asid */
>>> -        uint32_t asid: 1;
>>> -        /* vintr */
>>> -        uint32_t tpr: 1;
>>> -        /* np_enable, h_cr3, g_pat */
>>> -        uint32_t np: 1;
>>> -        /* cr0, cr3, cr4, efer */
>>> -        uint32_t cr: 1;
>>> -        /* dr6, dr7 */
>>> -        uint32_t dr: 1;
>>> -        /* gdtr, idtr */
>>> -        uint32_t dt: 1;
>>> -        /* cs, ds, es, ss, cpl */
>>> -        uint32_t seg: 1;
>>> -        /* cr2 */
>>> -        uint32_t cr2: 1;
>>> -        /* debugctlmsr, last{branch,int}{to,from}ip */
>>> -        uint32_t lbr: 1;
>>> -        uint32_t resv: 21;
>>> -    } fields;
>>> +    struct {
>>> +        bool intercepts:1; /* 0:  cr/dr/exception/general1/2_intercepts,
>>> +                            *     pause_filter_count, tsc_offset */
>> Could I talk you into omitting the 1/2 part, as there's going to
>> be a 3 for at least MCOMMIT? Just "general" ought to be clear
>> enough, I would think.
> 
> Can do.  I'm not overly happy about this spilling onto two lines, but I
> can't think of how to usefully shrink the comment further without losing
> information.

The line split is unavoidable if we want the enumeration to be
sensible at all. I have no issue with this, to be honest.

Jan

