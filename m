Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF5B7F338F
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 17:22:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638000.994194 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5TVU-0004hw-FI; Tue, 21 Nov 2023 16:21:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638000.994194; Tue, 21 Nov 2023 16:21:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5TVU-0004fW-C0; Tue, 21 Nov 2023 16:21:48 +0000
Received: by outflank-mailman (input) for mailman id 638000;
 Tue, 21 Nov 2023 16:21:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f+q9=HC=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1r5TVT-0004fQ-0D
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 16:21:47 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0eed4f14-888a-11ee-9b0e-b553b5be7939;
 Tue, 21 Nov 2023 17:21:43 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id EA45F4EE073A;
 Tue, 21 Nov 2023 17:21:42 +0100 (CET)
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
X-Inumbo-ID: 0eed4f14-888a-11ee-9b0e-b553b5be7939
MIME-Version: 1.0
Date: Tue, 21 Nov 2023 17:21:42 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, Wei Liu <wl@xen.org>, Paul
 Durrant <paul@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 xen-devel@lists.xenproject.org
Subject: Re: [RFC PATCH] x86/vlapic: address a violation of MISRA C:2012 Rule
 16.2
In-Reply-To: <e40579ba-acae-4c11-bea1-a5b83208db10@suse.com>
References: <99114c15a4256e6a0f39bd6de232ee4b8ad9b587.1698239734.git.nicola.vetrini@bugseng.com>
 <e40579ba-acae-4c11-bea1-a5b83208db10@suse.com>
Message-ID: <da124cb67821884d76bab8e3a8e5a7dd@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2023-11-21 16:36, Jan Beulich wrote:
> On 25.10.2023 15:22, Nicola Vetrini wrote:
>> --- a/xen/arch/x86/hvm/vlapic.c
>> +++ b/xen/arch/x86/hvm/vlapic.c
>> @@ -1034,10 +1034,10 @@ int guest_wrmsr_x2apic(struct vcpu *v, 
>> uint32_t msr, uint64_t val)
>>      case APIC_EOI:
>>      case APIC_ESR:
>>          if ( val )
>> -        {
>> -    default:
>>              return X86EMUL_EXCEPTION;
>> -        }
>> +        break;
>> +    default:
>> +        return X86EMUL_EXCEPTION;
>>      }
>> 
>>      vlapic_reg_write(v, array_index_nospec(offset, PAGE_SIZE), val);
> 
> Considering the plan to confine applicability of the rule, one style 
> aspect
> which would need to be taken into account is that the entire rest of 
> this
> switch() has blank lines between case blocks.
> 
> The other is that imo the overall result would be closer to what we 
> have
> right now if the new code was
> 
>     case APIC_EOI:
>     case APIC_ESR:
>         if ( !val )
>             break;
>         fallthrough;
>     default:
>         return X86EMUL_EXCEPTION;
>      }
> 
> at which point the need for the blank line would also disappear.
> 

This is also a fine solution. I'll keep this in mind when this patch 
will be revisited.

> As to the description - isn't this change (whichever way done) also
> addressing another violation, requiring "break" (or alike according to
> our interpretation) at the end of each case block?
> 

Correct. It's probably a good idea to mention that, but the 
"fallthrough" is also a candidate for a deviation from R16.3, so we'll 
see about that.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

