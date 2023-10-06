Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F9D27BBBD5
	for <lists+xen-devel@lfdr.de>; Fri,  6 Oct 2023 17:36:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.613738.954490 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qomsT-00066z-VM; Fri, 06 Oct 2023 15:36:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 613738.954490; Fri, 06 Oct 2023 15:36:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qomsT-00063c-Sf; Fri, 06 Oct 2023 15:36:33 +0000
Received: by outflank-mailman (input) for mailman id 613738;
 Fri, 06 Oct 2023 15:36:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bl8M=FU=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qomsS-00063W-HA
 for xen-devel@lists.xenproject.org; Fri, 06 Oct 2023 15:36:32 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1eb52248-645e-11ee-9b0d-b553b5be7939;
 Fri, 06 Oct 2023 17:36:30 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id B4E3A4EE073E;
 Fri,  6 Oct 2023 17:36:29 +0200 (CEST)
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
X-Inumbo-ID: 1eb52248-645e-11ee-9b0d-b553b5be7939
MIME-Version: 1.0
Date: Fri, 06 Oct 2023 17:36:29 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org,
 michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com,
 consulting@bugseng.com, jbeulich@suse.com, andrew.cooper3@citrix.com,
 roger.pau@citrix.com, Simone Ballarin <simone.ballarin@bugseng.com>, Doug
 Goldstein <cardoe@cardoe.com>, George Dunlap <george.dunlap@citrix.com>, Wei
 Liu <wl@xen.org>
Subject: Re: [XEN PATCH][for-4.19 1/9] xen/include: add macro LOWEST_POW2
In-Reply-To: <01fd528d-845d-4342-a17a-e080a921273f@xen.org>
References: <cover.1696514677.git.nicola.vetrini@bugseng.com>
 <d27f52eaaa62ec4ebb9ce8b6cf243779d341367d.1696514677.git.nicola.vetrini@bugseng.com>
 <6102db25-2fd6-49fa-be66-ec2b627b019b@xen.org>
 <0197ecdcc5869dddecc98907f67ba0f1@bugseng.com>
 <63f172c1-bda5-447b-bc8b-90563f3f3c2a@xen.org>
 <4ecd59b63bc5b7b8f4c24672432ba027@bugseng.com>
 <01fd528d-845d-4342-a17a-e080a921273f@xen.org>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <377546c8b21ad375c0fcdd8372db65ac@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 06/10/2023 16:35, Julien Grall wrote:
> Hi Nicola,
> 
> On 06/10/2023 11:34, Nicola Vetrini wrote:
>> On 06/10/2023 12:22, Julien Grall wrote:
>>> On 06/10/2023 11:02, Nicola Vetrini wrote:
>>>> On 06/10/2023 11:29, Julien Grall wrote:
>>>>> Hi,
>>>>> 
>>>>> On 06/10/2023 09:26, Nicola Vetrini wrote:
>>>>>> The purpose of this macro is to encapsulate the well-known 
>>>>>> expression
>>>>>> 'x & -x', that in 2's complement architectures on unsigned 
>>>>>> integers will
>>>>>> give 2^ffs(x), where ffs(x) is the position of the lowest set bit 
>>>>>> in x.
>>>>>> 
>>>>>> A deviation for ECLAIR is also introduced.
>>>>> 
>>>>> Can you explain why this is a deviation in ECLAIR rather than one 
>>>>> with
>>>>> /* SAF-* */ (or whichever name we decide to rename to)? Is this
>>>>> because the code is correct from MISRA perspective but the tool is
>>>>> confused?
>>>>> 
>>>> 
>>>> The code does violate Rule 10.1 (a unary minus applied to an 
>>>> unsigned value is
>>>> deemed inappropriate by MISRA), but rather than changing a whole lot 
>>>> of places where this
>>>> construct is used (mainly in x86 code), the reasoning is that it 
>>>> makes more sense to isolate
>>>> it and justify its presence by the fact that on 2's complement 
>>>> architectures the result is
>>>> indeed correct.
>>> 
>>> This is explaining to me why you are adding LOWEST_POW2(). But this
>>> doesn't explain why you are not using /* SAF-* */ on top of
>>> LOWEST_POW2().
>>> 
>>> To me, we should only use ECLAIR specific deviation when this is a
>>> shortcoming with the tool.
>>> 
>>> Cheers,
>> 
>> Because of the way ECLAIR deviation comments work implies that in most 
>> cases the real
>> place where to put the deviation is the usage site
>> (the so-called top expansion location of the macro). Now, for 
>> widely-used macros this is
>> cumbersome and would clutter the code unnecessarily. It's way cleaner 
>> imo to have a single
>> line in the configuration with a clear justification that is present 
>> in the textual output
>> of the tool.
> 
> Just to clarify, you are saying that the following would not work for 
> Eclair:
> 
> /* SAF-XXX */
> #define LOWEST_POW2()
> 
> Instead you would need the following:
> 
> void foo()
> {
> 	/* SAF-XXX */
> 	LOWEST()
> }
> 
> Am I correct? If so, would something like below (untested) work?
> 
> #define LOWEST_POW2(...) ({ \
>    /* SAFE-XXX */           \
>    ...
>    })
> 

Option (2) would work. I'm not sure about (3), I'll test it.

>> But then there are tool interoperability considerations, that would 
>> call for standardized
>> deviation mechanisms, if they do detect this as a violation (which I 
>> don't know).
> 
> I don't think we need to know whether a tool detects it. We only need
> to know whether this is  violation to MISRA. If this is one, then this
> is a call to have a marker in the code.
> 
> If this is a false positive, then adding the deviation in the tool
> configuration is best (unless there are multiple tools affected).
> 

This is definitely a MISRA violation.

>> 
>> In the end, it could be done with a textual deviation, if that's 
>> preferred, but keep in mind
>> that those are more fragile w.r.t. code movement.
> 
> If the comment is around the macro there are limited chance that this
> will be missed. But if you are worried about code movement, you should
> be worried about macro renaming with your approach (one may not know
> Eclair has a deviation) and/or function with the same name.
> 

True, but if you introduce a violation on a guideline that is supposed 
to be clean then
the analysis will fail and show what's wrong (not by making the pipeline 
fail right now, but
ideally that's the plan). Reused identifiers are addressed by separate 
rules
(mainly Series 5).

> I am curious to know what the other thinks.
> 
> Cheers,

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

