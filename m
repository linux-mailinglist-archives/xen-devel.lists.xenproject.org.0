Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2BACB5DA6
	for <lists+xen-devel@lfdr.de>; Thu, 11 Dec 2025 13:29:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1184014.1506563 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTfn5-0007uu-S7; Thu, 11 Dec 2025 12:29:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1184014.1506563; Thu, 11 Dec 2025 12:29:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTfn5-0007tT-P9; Thu, 11 Dec 2025 12:29:03 +0000
Received: by outflank-mailman (input) for mailman id 1184014;
 Thu, 11 Dec 2025 12:29:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BerU=6R=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1vTfn3-0007t7-Ar
 for xen-devel@lists.xenproject.org; Thu, 11 Dec 2025 12:29:01 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f79baa48-d68c-11f0-9cce-f158ae23cfc8;
 Thu, 11 Dec 2025 13:28:58 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id D49B44EEBF88;
 Thu, 11 Dec 2025 13:28:57 +0100 (CET)
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
X-Inumbo-ID: f79baa48-d68c-11f0-9cce-f158ae23cfc8
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1765456137;
	b=QC5oQGWpg2/sFEv949u5C92VkKNXIt3KIAXP/EEL66Udl0kf/HPfv5LjGArPvkYI9sKP
	 RuYEzDIM8aF6V3eWwbS+xxhHTEzFrwTATrFELcUwPTM+ddtez7lhHjrTAp9oFkmrqQh1z
	 389VuVrRAwS7USlM8jExrQ2WatypaaJVr2dUtBEGwe7cZjZJTTAHchBF9MUosOcN6g2ZN
	 dDtqAoG4Xx99udqCpryjFa8NPr65ERseqNnBwHxdWD4KW7/zGI4UsNe8aB8AoaSASqe+2
	 ieKhQ4P0iPtgJWVsiVrYFT/65m7yrJsPYwRJsq43i1T9uvoPnFtKQUufqTibYUj4/yASM
	 CRCAHmguvCc1sVUtQHS3gN3CDyIRbpAhmXGjN43RmlMaF8n4VfyFAwinQO6vN+v78TZea
	 9LQ6X7WN4Hn+wxaNzFR3PuWWBQUy0FiWwAXvpT8RuHJj6eDISQ781MxdWlnWwvwOD2D0q
	 DX6QV4NLm1lUtop3wr5CTEZXmDn4nTHfTG1V4iGsAbsDX9ZvxNvpwvAIaIbnsk9Zu8we2
	 xf44g7lkY8WXLlAzCjiXo5jhdaKVZhYAoXNzMeoCVnk3ewLegL2rfpCMt/KwBfE0FZ7s0
	 ln6k86LNeDuSOSmMuGPsPgXnPrr5502ezkKzhfsG10Xg+rcD9UeqZjeKGF+mBNA=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1765456137;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=ntcThBm2kbHpwA1GB3ODhqy0ZvTWsayC/ODxlnyFoy0=;
	b=Gp2ZZ/bG01DthB3RhYIKfIAC1ZQ3xz2D3g6cDP7TlDwUfnE/4fhxBb0sdv4VGhNldgaz
	 VTzb+X/7+sHHX460+dAHfTb8lHDi01O93Op2CQFrDYm86cN5g1njWSUu6dXRmiNk/eODz
	 PsZ3CqHsb8hl8AAiQDM/iJ/55/5OweEXICVk9F4YoM3+Ul2dWGXbnDnF+GkedQvUg/TUi
	 YmDi7B41S2v/tuv6EGK3q+DH2sCSCTnqrvvf9tvuo2Jyi/z+CV5DrEKwxAPJRvwfMGqpF
	 qn5JAjNWc8OC2Exc9E0UjeAOjRy2Ljcna+93C+Xl13NkOKIXdKh9V1EeCcYnrtSdNbrWK
	 l6tRXHXqgytgB/bgijYENRQjjgZpWIEVDCbcEQIUIquRHRzmRl4xWexX5qgkuIl9NoACI
	 B917JO/L9F4JuoAci+3NxPTi9BhcoxTdAwdBSj+iTdq2hJf58zsOBjOQGZVvRWPSUydyd
	 UxGISxZ4I5ygi08n/7FTnU04VLS9M/ipwReDHPgHeA4ydb5gVHSRm3trRfBCKq2EEROr9
	 kb7fuhi/W8ErLXRdATu8g7veHp9Ox8qpADMlMqdNFLx8nTsCLChg9dVjdj02mEm6dy72B
	 xbEPu/gT96KwVmRh2z+4IE3OuOLVQm8lmGzeX21DnE5BEaU9QmWaZI9IfSBquC4=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1765456137; bh=uBLOtjRDK76/mMampjfxIZozKTPIpAZxf9EgZxb2r0E=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=uJEJRcQlKdCVDhZXnxNHlRejsqGBTmztGAffwlyjAQaU4afPotWSw4Zn4l85PY82/
	 j6UwjHkNd2ar+DgZi+ndPdoBzx5Em/4zTpDErhIQrNRqtW0nsVQ0sriUbxXOSj0qXs
	 idChJw+S1HWY9US/Bv3BVbIhIyiUMlFZL3nfwA4f1KJTb3TAGIx9C4lHpEBvfskY7u
	 VRTBoDEeW/k2HZkUTx7ojnnoRgVK+v3upss/ccFHHm137V6RONk5LiM8wBOWApghgM
	 LCnRMEVXfpByOh604qLYIi0lkPVO21NMBCMhCMt3fcDSUkNlNMCI0r9CuP/5IROGkD
	 eZPhXQWM1BNfA==
MIME-Version: 1.0
Date: Thu, 11 Dec 2025 13:28:57 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper3
 <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Stefano
 Stabellini <sstabellini@kernel.org>, "consulting @ bugseng . com"
 <consulting@bugseng.com>, Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 5/5] x86: Fix missing brackets in macros
In-Reply-To: <9aee3813bc96718ce0d772ead4f0578f@bugseng.com>
References: <20251210183019.2241560-1-andrew.cooper3@citrix.com>
 <20251210183019.2241560-6-andrew.cooper3@citrix.com>
 <5a4695fa-1520-4d52-adc3-72c159892e33@suse.com>
 <fdf95d1d02274a6442d4eb4c6b7284b8@bugseng.com>
 <d2988b31-66e0-4a6b-8f77-4ae2cf2c4bd4@suse.com>
 <9aee3813bc96718ce0d772ead4f0578f@bugseng.com>
Message-ID: <d447f57045f1a7463fcc14faf271be87@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2025-12-11 11:38, Nicola Vetrini wrote:
> On 2025-12-11 10:30, Jan Beulich wrote:
>> On 11.12.2025 10:15, Nicola Vetrini wrote:
>>> On 2025-12-11 09:36, Jan Beulich wrote:
>>>> On 10.12.2025 19:30, Andrew Cooper wrote:
>>>>> With the wider testing, some more violations have been spotted.  
>>>>> This
>>>>> addresses violations of Rule 20.7 which requires macro parameters 
>>>>> to
>>>>> be
>>>>> bracketed.
>>>>> 
>>>>> No functional change.
>>>>> 
>>>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>>> ---
>>>>> CC: Jan Beulich <JBeulich@suse.com>
>>>>> CC: Roger Pau Monné <roger.pau@citrix.com>
>>>>> CC: Stefano Stabellini <sstabellini@kernel.org>
>>>>> CC: consulting@bugseng.com <consulting@bugseng.com>
>>>>> CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>>>> ---
>>>>>  xen/arch/x86/mm/shadow/multi.c     | 2 +-
>>>>>  xen/arch/x86/mm/shadow/private.h   | 6 +++---
>>>>>  xen/drivers/passthrough/vtd/dmar.h | 2 +-
>>>>>  xen/include/xen/kexec.h            | 4 ++--
>>>>>  4 files changed, 7 insertions(+), 7 deletions(-)
>>>>> 
>>>>> diff --git a/xen/arch/x86/mm/shadow/multi.c
>>>>> b/xen/arch/x86/mm/shadow/multi.c
>>>>> index 03be61e225c0..36ee6554b4c4 100644
>>>>> --- a/xen/arch/x86/mm/shadow/multi.c
>>>>> +++ b/xen/arch/x86/mm/shadow/multi.c
>>>>> @@ -781,7 +781,7 @@ do {
>>>>>                      \
>>>>>          (_sl1e) = _sp + _i;
>>>>>   \
>>>>>          if ( shadow_l1e_get_flags(*(_sl1e)) & _PAGE_PRESENT )
>>>>>   \
>>>>>              {_code}
>>>>>   \
>>>>> -        if ( _done ) break;
>>>>>   \
>>>>> +        if ( (_done) ) break;
>>>>>   \
>>>> 
>>>> I don't understand this: There are parentheses already from if()
>>>> itself.
>>> 
>>> Yeah, syntactically there are, but those are parsed as part of the 
>>> if,
>>> rather than its condition; the AST node contained within does not 
>>> have
>>> parentheses around it.
>> 
>> I fear I don't follow. Besides us not using parentheses elsewhere when
>> if() is used like this macros, the point of requiring parentheses is 
>> (aiui)
>> to make precedence explicit. There already is no ambiguity here due to 
>> the
>> syntactically require parentheses in if(). Why would a rule and/or the
>> tool require redundant ones?
>> 
> 
> this is parsed as (more or less) "if_stmt(integer_literal(0))" rather 
> than "if_stmt(paren_expr(integer_literal(0)))" when the macro is 
> invoked with 0 > as parameter _done. Now, syntactically the parentheses 
> are in the source code, so the letter of the rule is satisfied (as long 
> as there is a single
> condition in the if condition), but the presence of those parentheses 
> is lost when parsing. I see how this can be seen as a false positive, 
> and we will
> definitely add some special handling so that cases like this are 
> properly recognized, but for simplicity here I would add some extra 
> parentheses, at
> least until the false positive is not resolved

Actually giving this a closer look the tool is correct: the fully 
expanded code is:

  19562     }} if ( ({ (__done = done); }) ) break; 
increment_ptr_to_guest_entry(((void*)0)); } unmap_domain_page(_sp); } 
while
                                 <~~>

so the "done" argument ends up being expanded without parentheses, hence 
the report is correct and the extra parentheses are needed, but should 
be put into

/* 32-bit l1, on PAE or 64-bit shadows: need to walk both pages of 
shadow */
    791 #if GUEST_PAGING_LEVELS == 2 && SHADOW_PAGING_LEVELS > 2
    792 #define FOREACH_PRESENT_L1E(_sl1mfn, _sl1e, _gl1p, _done,  _code) 
       \
    793 do {                                                              
       \
    794     int __done = 0;                                               
       \
    795     _FOREACH_PRESENT_L1E(_sl1mfn, _sl1e, _gl1p,                   
       \
            
<~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    796                          ({ (__done = _done); }), _code);         
       \

rather than at the level of the if, I think

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

