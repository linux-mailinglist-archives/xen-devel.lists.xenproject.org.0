Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44DB1906923
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jun 2024 11:42:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.739742.1146681 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHgxn-0004xs-Tq; Thu, 13 Jun 2024 09:41:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 739742.1146681; Thu, 13 Jun 2024 09:41:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHgxn-0004vs-Qc; Thu, 13 Jun 2024 09:41:47 +0000
Received: by outflank-mailman (input) for mailman id 739742;
 Thu, 13 Jun 2024 09:41:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qa8k=NP=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1sHgxm-0004vk-8y
 for xen-devel@lists.xenproject.org; Thu, 13 Jun 2024 09:41:46 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 258a7355-2969-11ef-90a3-e314d9c70b13;
 Thu, 13 Jun 2024 11:41:45 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id A241F4EE0756;
 Thu, 13 Jun 2024 11:41:44 +0200 (CEST)
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
X-Inumbo-ID: 258a7355-2969-11ef-90a3-e314d9c70b13
MIME-Version: 1.0
Date: Thu, 13 Jun 2024 11:41:44 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH 4/6] x86emul: address violations of MISRA C Rule 20.7
In-Reply-To: <c40bcf67-ebdd-4bcf-b6bc-ecec6a1fd7eb@suse.com>
References: <cover.1718117557.git.nicola.vetrini@bugseng.com>
 <0a502d2a9c5ce13be13281d9de49d263313b7852.1718117557.git.nicola.vetrini@bugseng.com>
 <12ce10af-cd36-492e-a73b-2b81b5bf60cc@suse.com>
 <ac1faf5feded028ce80752ce69983352@bugseng.com>
 <c40bcf67-ebdd-4bcf-b6bc-ecec6a1fd7eb@suse.com>
Message-ID: <05eadcff96c640c3b8aa744c4b362661@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2024-06-12 12:36, Jan Beulich wrote:
> On 12.06.2024 11:52, Nicola Vetrini wrote:
>> On 2024-06-12 11:19, Jan Beulich wrote:
>>> On 11.06.2024 17:53, Nicola Vetrini wrote:
>>>> MISRA C Rule 20.7 states: "Expressions resulting from the expansion
>>>> of macro parameters shall be enclosed in parentheses". Therefore, 
>>>> some
>>>> macro definitions should gain additional parentheses to ensure that
>>>> all
>>>> current and future users will be safe with respect to expansions 
>>>> that
>>>> can possibly alter the semantics of the passed-in macro parameter.
>>>> 
>>>> No functional change.
>>>> 
>>>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>>> ---
>>>> These local helpers could in principle be deviated, but the
>>>> readability
>>>> and functionality are essentially unchanged by complying with the
>>>> rule,
>>>> so I decided to modify the macro definition as the preferred option.
>>> 
>>> Well, yes, but ...
>>> 
>>>> --- a/xen/arch/x86/x86_emulate/x86_emulate.c
>>>> +++ b/xen/arch/x86/x86_emulate/x86_emulate.c
>>>> @@ -2255,7 +2255,7 @@ x86_emulate(
>>>>          switch ( modrm_reg & 7 )
>>>>          {
>>>>  #define GRP2(name, ext) \
>>>> -        case ext: \
>>>> +        case (ext): \
>>>>              if ( ops->rmw && dst.type == OP_MEM ) \
>>>>                  state->rmw = rmw_##name; \
>>>>              else \
>>>> @@ -8611,7 +8611,7 @@ int x86_emul_rmw(
>>>>              unsigned long dummy;
>>>> 
>>>>  #define XADD(sz, cst, mod) \
>>>> -        case sz: \
>>>> +        case (sz): \
>>>>              asm ( "" \
>>>>                    COND_LOCK(xadd) " %"#mod"[reg], %[mem]; " \
>>>>                    _POST_EFLAGS("[efl]", "[msk]", "[tmp]") \
>>> 
>>> ... this is really nitpicky of the rule / tool. What halfway 
>>> realistic
>>> ways do you see to actually misuse these macros? What follows the
>>> "case"
>>> keyword is just an expression; no precedence related issues are
>>> possible.
>>> 
>> 
>> I do share the view: no real danger is possible in sensible uses. 
>> Often
>> MISRA rules are stricter than necessary to have a simple formulation, 
>> by
>> avoiding too many special cases.
>> 
>> However, if a deviation is formulated, then it needs to be maintained,
>> for no real readability benefit in this case, in my opinion. I can be
>> convinced otherwise, of course.
> 
> Well, aiui you're thinking of a per-macro deviation here. Whereas I'd 
> be
> thinking of deviating the pattern.
> 

Might be reasonable. I'll think about it for v2

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

