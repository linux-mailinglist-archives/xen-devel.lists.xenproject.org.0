Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E64C87DC806
	for <lists+xen-devel@lfdr.de>; Tue, 31 Oct 2023 09:18:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625501.974825 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxjxL-0000Q8-4e; Tue, 31 Oct 2023 08:18:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625501.974825; Tue, 31 Oct 2023 08:18:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxjxL-0000NV-1m; Tue, 31 Oct 2023 08:18:35 +0000
Received: by outflank-mailman (input) for mailman id 625501;
 Tue, 31 Oct 2023 08:18:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TgTD=GN=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qxjxJ-0000NP-5N
 for xen-devel@lists.xenproject.org; Tue, 31 Oct 2023 08:18:33 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 143094f3-77c6-11ee-98d6-6d05b1d4d9a1;
 Tue, 31 Oct 2023 09:18:32 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id E5FCC4EE073A;
 Tue, 31 Oct 2023 09:18:31 +0100 (CET)
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
X-Inumbo-ID: 143094f3-77c6-11ee-98d6-6d05b1d4d9a1
MIME-Version: 1.0
Date: Tue, 31 Oct 2023 09:18:31 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, Simone Ballarin
 <simone.ballarin@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>, George
 Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Wei Liu
 <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian
 <kevin.tian@intel.com>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH][for-4.19 v5 2/8] x86: add deviation for asm-only
 functions
In-Reply-To: <a91fbdc6-1307-dfce-4e5e-351138c49dc6@suse.com>
References: <cover.1698655374.git.nicola.vetrini@bugseng.com>
 <79091a4e450b522aedfdd903ad671e705a933c49.1698655374.git.nicola.vetrini@bugseng.com>
 <20677a35-37ee-d959-78d5-d8f95f443912@suse.com>
 <alpine.DEB.2.22.394.2310301557300.1625118@ubuntu-linux-20-04-desktop>
 <a91fbdc6-1307-dfce-4e5e-351138c49dc6@suse.com>
Message-ID: <68ae1905f2fd345ea0923b31a3065d79@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2023-10-31 08:50, Jan Beulich wrote:
> On 31.10.2023 00:02, Stefano Stabellini wrote:
>> On Mon, 30 Oct 2023, Jan Beulich wrote:
>>> On 30.10.2023 10:11, Nicola Vetrini wrote:
>>>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>>>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>>>> @@ -163,6 +163,15 @@ Therefore the absence of prior declarations is 
>>>> safe."
>>>>  -config=MC3R1.R8.4,reports+={safe, 
>>>> "first_area(any_loc(file(gcov)))"}
>>>>  -doc_end
>>>> 
>>>> +-doc_begin="Recognize the occurrence of current_stack_pointer as a 
>>>> declaration."
>>>> +-file_tag+={asm_defns, "^xen/arch/x86/include/asm/asm_defns\\.h$"}
>>>> +-config=MC3R1.R8.4,declarations+={safe, 
>>>> "loc(file(asm_defns))&&^current_stack_pointer$"}
>>>> +-doc_end
>>>> +
>>>> +-doc_begin="asmlinkage is a marker to indicate that the function is 
>>>> only used from asm modules."
>>>> +-config=MC3R1.R8.4,declarations+={safe,"loc(text(^.*asmlinkage.*$, 
>>>> -1..0))"}
>>>> +-doc_end
>>> 
>>> In the longer run asmlinkage will want using for functions used 
>>> either way
>>> between C and assembly (i.e. C->asm calls as well as asm->C ones). 
>>> I'd like
>>> to ask that the text please allow for that (e.g. s/from/to interface 
>>> with/).
>>> 

Will do

>>>> --- a/xen/arch/x86/hvm/svm/intr.c
>>>> +++ b/xen/arch/x86/hvm/svm/intr.c
>>>> @@ -123,7 +123,7 @@ static void svm_enable_intr_window(struct vcpu 
>>>> *v, struct hvm_intack intack)
>>>>          vmcb, general1_intercepts | GENERAL1_INTERCEPT_VINTR);
>>>>  }
>>>> 
>>>> -void svm_intr_assist(void)
>>>> +asmlinkage void svm_intr_assist(void)
>>> 
>>> Nit (here and below): Attributes, unless impossible for some specific
>>> reason, should always go between type and identifier. Not all our 
>>> code
>>> is conforming to that, but I think a majority is, and hence you 
>>> should
>>> be able to find ample examples (taking e.g. __init).
>> 
>> Hi Jan, in general I agree with this principle but I noticed that this
>> is not the way Linux uses asmlinkage, a couple of examples:
>> 
>> asmlinkage void do_page_fault(struct pt_regs *regs);
>> asmlinkage const sys_call_ptr_t sys_call_table[];
>> 
>> Should we go our way or follow Linux on this in terms of code style?
> 
> Linux isn't very consistent in attribute placement anyway, and doing it
> "randomly" relies on the compiler guys never going to tighten what
> attributes mean dependent on their placement (iirc gcc doc has text to
> the effect of this possibly changing at any time). Aiui part of the
> reason why parsing is more relaxed than it should be is that certain
> attributes cannot be placed unambiguously at their nominally dedicated
> place.
> 
> So my personal view on your question is that we should go our more
> consistent way.
> 
> Jan

Ok.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

