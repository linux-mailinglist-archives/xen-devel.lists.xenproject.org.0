Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B13C7D0D36
	for <lists+xen-devel@lfdr.de>; Fri, 20 Oct 2023 12:33:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619743.965321 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtmoh-0001VM-RJ; Fri, 20 Oct 2023 10:33:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619743.965321; Fri, 20 Oct 2023 10:33:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtmoh-0001Th-NW; Fri, 20 Oct 2023 10:33:19 +0000
Received: by outflank-mailman (input) for mailman id 619743;
 Fri, 20 Oct 2023 10:33:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SYNS=GC=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qtmog-0001Pe-E6
 for xen-devel@lists.xenproject.org; Fri, 20 Oct 2023 10:33:18 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 14a66183-6f34-11ee-98d5-6d05b1d4d9a1;
 Fri, 20 Oct 2023 12:33:17 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id D4B5E4EE073C;
 Fri, 20 Oct 2023 12:33:16 +0200 (CEST)
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
X-Inumbo-ID: 14a66183-6f34-11ee-98d5-6d05b1d4d9a1
MIME-Version: 1.0
Date: Fri, 20 Oct 2023 12:33:16 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, Simone Ballarin
 <simone.ballarin@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>, George
 Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH][for-4.19 v2] xen: Add SAF deviations for MISRA C:2012
 Rule 7.1
In-Reply-To: <dd58e1cb-8f17-986d-f4f9-f39e998e05a0@suse.com>
References: <a9c52c943380f2c35f0a6ccab8215c03e87c99dc.1697712857.git.nicola.vetrini@bugseng.com>
 <de2b666e-ca48-58d2-73eb-5adc797f818e@suse.com>
 <d879b8e4689e51131f081edcb3b2abe6@bugseng.com>
 <dd58e1cb-8f17-986d-f4f9-f39e998e05a0@suse.com>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <5b1cd4fba12664f2ef49bcc2eb198e31@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 20/10/2023 08:38, Jan Beulich wrote:
> On 19.10.2023 18:34, Nicola Vetrini wrote:
>> On 19/10/2023 17:57, Jan Beulich wrote:
>>> On 19.10.2023 13:04, Nicola Vetrini wrote:
>>>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>>>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>>>> @@ -85,10 +85,10 @@ conform to the directive."
>>>>  # Series 7.
>>>>  #
>>>> 
>>>> --doc_begin="Usage of the following constants is safe, since they 
>>>> are
>>>> given as-is
>>>> -in the inflate algorithm specification and there is therefore no 
>>>> risk
>>>> of them
>>>> -being interpreted as decimal constants."
>>>> --config=MC3R1.R7.1,literals={safe,
>>>> "^0(007|37|070|213|236|300|321|330|331|332|333|334|335|337|371)$"}
>>>> +-doc_begin="Octal constants used as arguments to macro INSTR_ENC or
>>>> MASK_EXTR
>>>> +can be used, because they appear as is in specifications, manuals,
>>>> and
>>>> +algorithm descriptions."
>>>> +-config=MC3R1.R7.1,reports+={safe,
>>>> "any_area(any_loc(any_exp(macro(^(INSTR_ENC|MASK_EXTR)$))))"}
>>> 
>>> INSTR_ENC() is a local macro in x86'es AMD SVM code. A macro of the
>>> same
>>> name could imo be introduced without issues in, say, Arm code. The
>>> above
>>> would then needlessly suppress findings there, aiui.
>>> 
>>> MASK_EXTR() otoh is a global macro which ise used for various 
>>> purposes.
>>> Excluding checking there is imo going too far, too.
>> 
>> I should have thought about it; I can simply enforce the deviation to
>> additionally match
>> only a specific file for each of the macros.
> 
> That'll work for INSTR_ENC(), but not for MASK_EXTR().
> 

Why? What I'm deviating is reports due to octal constants used in 
expressions
that contain MASK_EXTR in their expansion if and only if these are 
located in the
file svm.h.
No extra octal constant will match all these constraints.

>>>> --- a/docs/misra/deviations.rst
>>>> +++ b/docs/misra/deviations.rst
>>>> @@ -90,6 +90,12 @@ Deviations related to MISRA C:2012 Rules:
>>>>           - __emulate_2op and __emulate_2op_nobyte
>>>>           - read_debugreg and write_debugreg
>>>> 
>>>> +   * - R7.1
>>>> +     - It is safe to use certain octal constants the way they are
>>>> defined in
>>>> +       specifications, manuals, and algorithm descriptions as
>>>> arguments to
>>>> +       macros 'INSTR_ENC' and 'MASK_EXTR'.
>>>> +     - Tagged as `safe` for ECLAIR.
>>> 
>>> Similarly this wording is imo inappropriate, while ...
>>> 
>> 
>> I tried to be a bit more specific about what is actually being 
>> deviated,
>> on the assumption
>> that the maintainers and contributors would find it more useful than
>> parsing ecl files, but
>> if you prefer it to be more general, no problem.
> 
> Just dropping everything after the last comma would deal with my 
> concern.
> 
> Jan

Ok

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

