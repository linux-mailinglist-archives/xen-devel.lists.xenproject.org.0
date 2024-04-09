Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F421789E3E2
	for <lists+xen-devel@lfdr.de>; Tue,  9 Apr 2024 21:48:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.702805.1098351 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruHRw-0001wK-9W; Tue, 09 Apr 2024 19:48:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 702805.1098351; Tue, 09 Apr 2024 19:48:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruHRw-0001tw-6a; Tue, 09 Apr 2024 19:48:08 +0000
Received: by outflank-mailman (input) for mailman id 702805;
 Tue, 09 Apr 2024 19:48:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xQG8=LO=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1ruHRu-0001to-0F
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2024 19:48:06 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1443a1b0-f6aa-11ee-94a3-07e782e9044d;
 Tue, 09 Apr 2024 21:48:04 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id D44F54EE0739;
 Tue,  9 Apr 2024 21:48:03 +0200 (CEST)
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
X-Inumbo-ID: 1443a1b0-f6aa-11ee-94a3-07e782e9044d
MIME-Version: 1.0
Date: Tue, 09 Apr 2024 21:48:03 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH v2 2/9] x86/cpuid: address violation of MISRA C Rule
 16.2
In-Reply-To: <33239d84-3998-4ed6-a970-243fe4468b0b@suse.com>
References: <cover.1712305581.git.nicola.vetrini@bugseng.com>
 <f957c92d9a00c66df47fc3cac336e378488b9fea.1712305581.git.nicola.vetrini@bugseng.com>
 <33239d84-3998-4ed6-a970-243fe4468b0b@suse.com>
Message-ID: <14dd6fb69770924d1860cf523c99848c@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2024-04-08 09:39, Jan Beulich wrote:
> On 05.04.2024 11:14, Nicola Vetrini wrote:
>> Refactor the switch so that a violation of MISRA C Rule 16.2 is 
>> resolved
>> (A switch label shall only be used when the most closely-enclosing
>> compound statement is the body of a switch statement).
>> Note that the switch clause ending with the pseudo
>> keyword "fallthrough" is an allowed exception to Rule 16.3.
>> 
>> No functional change.
>> 
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> 
> Acked-by: Jan Beulich <jbeulich@suse.com>
> albeit once again with remarks:
> 
>> --- a/xen/arch/x86/cpuid.c
>> +++ b/xen/arch/x86/cpuid.c
>> @@ -331,23 +331,22 @@ void guest_cpuid(const struct vcpu *v, uint32_t 
>> leaf,
>>          switch ( subleaf )
>>          {
>>          case 1:
>> -            if ( p->xstate.xsavec || p->xstate.xsaves )
>> -            {
>> -                /*
>> -                 * TODO: Figure out what to do for XSS state.  VT-x 
>> manages
>> -                 * host vs guest MSR_XSS automatically, so as soon as 
>> we start
>> -                 * supporting any XSS states, the wrong XSS will be 
>> in
>> -                 * context.
>> -                 */
>> -                BUILD_BUG_ON(XSTATE_XSAVES_ONLY != 0);
>> -
>> -                /*
>> -                 * Read CPUID[0xD,0/1].EBX from hardware.  They vary 
>> with
>> -                 * enabled XSTATE, and appropraite XCR0|XSS are in 
>> context.
>> -                 */
>> +            if ( !(p->xstate.xsavec || p->xstate.xsaves) )
> 
> Personally I dislike with for of writing such. It may not be overly 
> much of a
> problem for simple cases like here, but the more complex the expression 
> gets,
> the less helpful it is that somewhere far away there's an enclosing 
> !(...). I
> may take the liberty to adjust this, should I end up committing this 
> change.
> 

Ok, makes sense. I didn't think about that style aspect.

>> +                break;
>> +            /*
>> +             * TODO: Figure out what to do for XSS state.  VT-x 
>> manages
>> +             * host vs guest MSR_XSS automatically, so as soon as we 
>> start
>> +             * supporting any XSS states, the wrong XSS will be in
>> +             * context.
>> +             */
> 
> Much like one actually needs to consider re-flowing when increasing 
> indentation
> of a comment, it is generally desirable to also to so when decreasing
> indentation, which in this case surely would allow at least "context" 
> to be
> moved to the earlier line.
> 
> Jan

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

