Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4C97DF452
	for <lists+xen-devel@lfdr.de>; Thu,  2 Nov 2023 14:52:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626919.977639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyY7h-0001bF-W2; Thu, 02 Nov 2023 13:52:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626919.977639; Thu, 02 Nov 2023 13:52:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyY7h-0001Y3-Sn; Thu, 02 Nov 2023 13:52:37 +0000
Received: by outflank-mailman (input) for mailman id 626919;
 Thu, 02 Nov 2023 13:52:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HN1Y=GP=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qyY7g-0001Xs-4N
 for xen-devel@lists.xenproject.org; Thu, 02 Nov 2023 13:52:36 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 13517c29-7987-11ee-98d6-6d05b1d4d9a1;
 Thu, 02 Nov 2023 14:52:34 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 6D7DA4EE0737;
 Thu,  2 Nov 2023 14:52:34 +0100 (CET)
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
X-Inumbo-ID: 13517c29-7987-11ee-98d6-6d05b1d4d9a1
MIME-Version: 1.0
Date: Thu, 02 Nov 2023 14:52:34 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, Simone Ballarin
 <simone.ballarin@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>, George
 Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Wei Liu
 <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian
 <kevin.tian@intel.com>
Subject: Re: [XEN PATCH][for-4.19 v6 2/8] x86: add deviation for asm-only
 functions
In-Reply-To: <4d7cd892-f814-50cb-b296-69b957128508@suse.com>
References: <cover.1698829473.git.nicola.vetrini@bugseng.com>
 <a1b5c3b273145c35535fed3647bf850d9ae5db7f.1698829473.git.nicola.vetrini@bugseng.com>
 <alpine.DEB.2.22.394.2311011609360.2125691@ubuntu-linux-20-04-desktop>
 <4d7cd892-f814-50cb-b296-69b957128508@suse.com>
Message-ID: <9ad7f6210c15f520297aac00e8af0e64@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2023-11-02 14:27, Jan Beulich wrote:
> On 02.11.2023 00:10, Stefano Stabellini wrote:
>> On Wed, 1 Nov 2023, Nicola Vetrini wrote:
>>> As stated in rules.rst, functions used only in asm modules
>>> are allowed to have no prior declaration visible when being
>>> defined, hence these functions are marked with an
>>> 'asmlinkage' macro, which is then deviated for MISRA C:2012
>>> Rule 8.4.
>>> 
>>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>> ---
>>> Changes in v3:
>>> - added SAF deviations for vmx counterparts to svm functions.
>>> Changes in v5:
>>> - drop SAF deviations in favour of the pseudo-attribute asmlinkage
>>> Changes in v6:
>>> - conditioned asmlinkage definition to make it overridable;
>>> - move the pseudo-attribute after the return type
>>> ---
>>>  automation/eclair_analysis/ECLAIR/deviations.ecl | 9 +++++++++
>>>  docs/misra/deviations.rst                        | 6 ++++++
>>>  xen/arch/x86/hvm/svm/intr.c                      | 2 +-
>>>  xen/arch/x86/hvm/svm/nestedsvm.c                 | 2 +-
>>>  xen/arch/x86/hvm/svm/svm.c                       | 4 ++--
>>>  xen/arch/x86/hvm/vmx/intr.c                      | 2 +-
>>>  xen/arch/x86/hvm/vmx/vmx.c                       | 4 ++--
>>>  xen/arch/x86/hvm/vmx/vvmx.c                      | 2 +-
>>>  xen/arch/x86/traps.c                             | 2 +-
>>>  xen/arch/x86/x86_64/traps.c                      | 2 +-
>>>  xen/include/xen/compiler.h                       | 5 +++++
>>>  11 files changed, 30 insertions(+), 10 deletions(-)
>>> 
>>> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl 
>>> b/automation/eclair_analysis/ECLAIR/deviations.ecl
>>> index fa56e5c00a27..06619ecf7e8d 100644
>>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>>> @@ -163,6 +163,15 @@ Therefore the absence of prior declarations is 
>>> safe."
>>>  -config=MC3R1.R8.4,reports+={safe, 
>>> "first_area(any_loc(file(gcov)))"}
>>>  -doc_end
>>> 
>>> +-doc_begin="Recognize the occurrence of current_stack_pointer as a 
>>> declaration."
>>> +-file_tag+={asm_defns, "^xen/arch/x86/include/asm/asm_defns\\.h$"}
>>> +-config=MC3R1.R8.4,declarations+={safe, 
>>> "loc(file(asm_defns))&&^current_stack_pointer$"}
>>> +-doc_end
>>> +
>>> +-doc_begin="asmlinkage is a marker to indicate that the function is 
>>> only used to interface with asm modules."
>>> +-config=MC3R1.R8.4,declarations+={safe,"loc(text(^(?s).*asmlinkage.*$, 
>>> -1..0))"}
>>> +-doc_end
>>> +
>>>  -doc_begin="The following variables are compiled in multiple 
>>> translation units
>>>  belonging to different executables and therefore are safe."
>>>  -config=MC3R1.R8.6,declarations+={safe, 
>>> "name(current_stack_pointer||bsearch||sort)"}
>>> diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
>>> index 8511a189253b..d468da2f5ce9 100644
>>> --- a/docs/misra/deviations.rst
>>> +++ b/docs/misra/deviations.rst
>>> @@ -133,6 +133,12 @@ Deviations related to MISRA C:2012 Rules:
>>>         configuration. Therefore, the absence of prior declarations 
>>> is safe.
>>>       - Tagged as `safe` for ECLAIR.
>>> 
>>> +   * - R8.4
>>> +     - Functions and variables used only by asm modules are either 
>>> marked with
>>> +       the `asmlinkage` macro or with a SAF-1-safe textual deviation
>>> +       (see safe.json).
>>> +     - Tagged as `safe` for ECLAIR.
>> 
>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> 
> Acked-by: Jan Beulich <jbeulich@suse.com>
> with ...
> 
>> If Julien prefers a different wording I could modify on commit as 
>> needed
> 
> ... wording clarified along the lines of his subsequent reply. Yet 
> better
> would be, as also suggested by him, to accompany this with a 2nd patch
> replacing the now deprecated SAF-* comments.
> 
> Jan

Yes, as replied to Julien in this thread: a second patch will be 
submitted shortly.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

