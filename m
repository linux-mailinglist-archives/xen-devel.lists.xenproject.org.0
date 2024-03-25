Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D8188A523
	for <lists+xen-devel@lfdr.de>; Mon, 25 Mar 2024 15:48:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.697770.1088857 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rolcE-0006Nh-2p; Mon, 25 Mar 2024 14:47:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 697770.1088857; Mon, 25 Mar 2024 14:47:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rolcD-0006L2-VD; Mon, 25 Mar 2024 14:47:57 +0000
Received: by outflank-mailman (input) for mailman id 697770;
 Mon, 25 Mar 2024 14:47:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yuQ0=K7=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rolcC-0006Kw-0Z
 for xen-devel@lists.xenproject.org; Mon, 25 Mar 2024 14:47:56 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a85cb61f-eab6-11ee-a1ef-f123f15fe8a2;
 Mon, 25 Mar 2024 15:47:52 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 0CD1B4EE0739;
 Mon, 25 Mar 2024 15:47:52 +0100 (CET)
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
X-Inumbo-ID: a85cb61f-eab6-11ee-a1ef-f123f15fe8a2
MIME-Version: 1.0
Date: Mon, 25 Mar 2024 15:47:52 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, bertrand.marquis@arm.com,
 julien@xen.org, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH 08/11] x86/altcall: address violations of MISRA C Rule
 20.7
In-Reply-To: <072aa89b-2a03-4823-af72-28a2a882b373@suse.com>
References: <cover.1711118582.git.nicola.vetrini@bugseng.com>
 <653ead65966226f50b0e4ae0268912c9710f9dba.1711118582.git.nicola.vetrini@bugseng.com>
 <072aa89b-2a03-4823-af72-28a2a882b373@suse.com>
Message-ID: <bacda1cba33d40092209d30f48cb9c3b@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2024-03-25 10:38, Jan Beulich wrote:
> On 22.03.2024 17:01, Nicola Vetrini wrote:
>> MISRA C Rule 20.7 states: "Expressions resulting from the expansion
>> of macro parameters shall be enclosed in parentheses". Therefore, some
>> macro definitions should gain additional parentheses to ensure that 
>> all
>> current and future users will be safe with respect to expansions that
>> can possibly alter the semantics of the passed-in macro parameter.
>> 
>> No functional change.
>> 
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> 
> Hmm. These macros are, at least in part, hard to read already. The 
> added
> parentheses, while necessary when following the rule to the letter, are
> making things worse, even if just slightly. I therefore have a proposal 
> /
> question:
> 
>> --- a/xen/arch/x86/include/asm/alternative.h
>> +++ b/xen/arch/x86/include/asm/alternative.h
>> @@ -243,28 +243,28 @@ extern void alternative_branches(void);
>> 
>>  #define alternative_vcall0(func) ({             \
>>      ALT_CALL_NO_ARG1;                           \
>> -    (void)sizeof(func());                       \
>> +    (void)sizeof((func)());                     \
> 
> Like this, all that's touched here are (syntactical, but not real) 
> function
> invocations. Function calls, like all postfix operators, are highest
> precedence. Hence by omitting parentheses in that case no breakage can
> happen as a result: If the passed expression is another postfix one, 
> that'll
> be evaluated first anyway. If any other expression is passed (aside 
> primary
> ones, of course), that'll be evaluated afterwards only due to being 
> lower
> precedence, irrespective of the presence/absence of parentheses.
> 
> Therefore, where harmful to readability, can we perhaps leave postfix
> expressions alone?
> 
> Jan

While I can understand the benefits of this, and the reasoning on 
postfix expressions, what about, for instance (modulo the actual 
invocation, this is just an example)

alternative_vcall0(2 + f) or similar scenarios?

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

