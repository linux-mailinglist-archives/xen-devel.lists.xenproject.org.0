Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 012CE88BF7E
	for <lists+xen-devel@lfdr.de>; Tue, 26 Mar 2024 11:31:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.697994.1089297 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rp44w-0007XL-8i; Tue, 26 Mar 2024 10:30:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 697994.1089297; Tue, 26 Mar 2024 10:30:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rp44w-0007VQ-5b; Tue, 26 Mar 2024 10:30:50 +0000
Received: by outflank-mailman (input) for mailman id 697994;
 Tue, 26 Mar 2024 10:30:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2PUu=LA=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rp44u-0007VC-2U
 for xen-devel@lists.xenproject.org; Tue, 26 Mar 2024 10:30:48 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e7c0b778-eb5b-11ee-afe3-a90da7624cb6;
 Tue, 26 Mar 2024 11:30:46 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 31E544EE0739;
 Tue, 26 Mar 2024 11:30:45 +0100 (CET)
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
X-Inumbo-ID: e7c0b778-eb5b-11ee-afe3-a90da7624cb6
MIME-Version: 1.0
Date: Tue, 26 Mar 2024 11:30:45 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, bertrand.marquis@arm.com,
 julien@xen.org, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH 08/11] x86/altcall: address violations of MISRA C Rule
 20.7
In-Reply-To: <b1777a3a-d468-40ea-aa5b-79d506a24abf@suse.com>
References: <cover.1711118582.git.nicola.vetrini@bugseng.com>
 <653ead65966226f50b0e4ae0268912c9710f9dba.1711118582.git.nicola.vetrini@bugseng.com>
 <072aa89b-2a03-4823-af72-28a2a882b373@suse.com>
 <bacda1cba33d40092209d30f48cb9c3b@bugseng.com>
 <b1777a3a-d468-40ea-aa5b-79d506a24abf@suse.com>
Message-ID: <7394d0e65c4de7399bbace9e9a3fe38f@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2024-03-25 15:58, Jan Beulich wrote:
> On 25.03.2024 15:47, Nicola Vetrini wrote:
>> On 2024-03-25 10:38, Jan Beulich wrote:
>>> On 22.03.2024 17:01, Nicola Vetrini wrote:
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
>>> 
>>> Hmm. These macros are, at least in part, hard to read already. The
>>> added
>>> parentheses, while necessary when following the rule to the letter, 
>>> are
>>> making things worse, even if just slightly. I therefore have a 
>>> proposal
>>> /
>>> question:
>>> 
>>>> --- a/xen/arch/x86/include/asm/alternative.h
>>>> +++ b/xen/arch/x86/include/asm/alternative.h
>>>> @@ -243,28 +243,28 @@ extern void alternative_branches(void);
>>>> 
>>>>  #define alternative_vcall0(func) ({             \
>>>>      ALT_CALL_NO_ARG1;                           \
>>>> -    (void)sizeof(func());                       \
>>>> +    (void)sizeof((func)());                     \
>>> 
>>> Like this, all that's touched here are (syntactical, but not real)
>>> function
>>> invocations. Function calls, like all postfix operators, are highest
>>> precedence. Hence by omitting parentheses in that case no breakage 
>>> can
>>> happen as a result: If the passed expression is another postfix one,
>>> that'll
>>> be evaluated first anyway. If any other expression is passed (aside
>>> primary
>>> ones, of course), that'll be evaluated afterwards only due to being
>>> lower
>>> precedence, irrespective of the presence/absence of parentheses.
>>> 
>>> Therefore, where harmful to readability, can we perhaps leave postfix
>>> expressions alone?
>> 
>> While I can understand the benefits of this, and the reasoning on
>> postfix expressions, what about, for instance (modulo the actual
>> invocation, this is just an example)
>> 
>> alternative_vcall0(2 + f) or similar scenarios?
> 
> Any kind of such expression will break with alternative_callN()'s
> using of [addr] "i" (&(func)) as an asm() operand. Which clarifies
> that even of the postfix expressions only some (in particular not
> increment, decrement, and function call) could potentially be used
> with the altcall machinery.
> 
> That said, you have a point in (indirectly) expressing that my
> earlier description wasn't quite right (as in: too generic, when
> it really needs tying to the specific case here).
> 
> Jan

Ok, I see what you meant now. I'll deviate these two macros.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

