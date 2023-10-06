Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 677D17BBA5F
	for <lists+xen-devel@lfdr.de>; Fri,  6 Oct 2023 16:35:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.613683.954384 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qolv1-0002l7-Vf; Fri, 06 Oct 2023 14:35:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 613683.954384; Fri, 06 Oct 2023 14:35:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qolv1-0002iD-Sy; Fri, 06 Oct 2023 14:35:07 +0000
Received: by outflank-mailman (input) for mailman id 613683;
 Fri, 06 Oct 2023 14:35:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qolv0-0002gv-UV
 for xen-devel@lists.xenproject.org; Fri, 06 Oct 2023 14:35:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qolv0-0000fQ-78; Fri, 06 Oct 2023 14:35:06 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qoluz-0000p9-S9; Fri, 06 Oct 2023 14:35:05 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=psRT5MGWcjiU5brtRRgxoh2NT39120iDc48ELCzt/co=; b=HnncgcaW1jYiOZNailnNkkTeKv
	YYNPphRS7dFA+fxA9U2GAItRMTCBg7WJSs1dsP+DbZmSP9dp90vXG7pBVerPMVKhJIMn9M8i1NXd1
	4TZEiic7d23ZOncUIsaEDMTtm9IaHuYKNJeFtFIo8sdBJx29j+0jIWP28vstW9rgcUGU=;
Message-ID: <01fd528d-845d-4342-a17a-e080a921273f@xen.org>
Date: Fri, 6 Oct 2023 15:35:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH][for-4.19 1/9] xen/include: add macro LOWEST_POW2
Content-Language: en-GB
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org,
 michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com,
 consulting@bugseng.com, jbeulich@suse.com, andrew.cooper3@citrix.com,
 roger.pau@citrix.com, Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>, George Dunlap
 <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
References: <cover.1696514677.git.nicola.vetrini@bugseng.com>
 <d27f52eaaa62ec4ebb9ce8b6cf243779d341367d.1696514677.git.nicola.vetrini@bugseng.com>
 <6102db25-2fd6-49fa-be66-ec2b627b019b@xen.org>
 <0197ecdcc5869dddecc98907f67ba0f1@bugseng.com>
 <63f172c1-bda5-447b-bc8b-90563f3f3c2a@xen.org>
 <4ecd59b63bc5b7b8f4c24672432ba027@bugseng.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <4ecd59b63bc5b7b8f4c24672432ba027@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Nicola,

On 06/10/2023 11:34, Nicola Vetrini wrote:
> On 06/10/2023 12:22, Julien Grall wrote:
>> On 06/10/2023 11:02, Nicola Vetrini wrote:
>>> On 06/10/2023 11:29, Julien Grall wrote:
>>>> Hi,
>>>>
>>>> On 06/10/2023 09:26, Nicola Vetrini wrote:
>>>>> The purpose of this macro is to encapsulate the well-known expression
>>>>> 'x & -x', that in 2's complement architectures on unsigned integers 
>>>>> will
>>>>> give 2^ffs(x), where ffs(x) is the position of the lowest set bit 
>>>>> in x.
>>>>>
>>>>> A deviation for ECLAIR is also introduced.
>>>>
>>>> Can you explain why this is a deviation in ECLAIR rather than one with
>>>> /* SAF-* */ (or whichever name we decide to rename to)? Is this
>>>> because the code is correct from MISRA perspective but the tool is
>>>> confused?
>>>>
>>>
>>> The code does violate Rule 10.1 (a unary minus applied to an unsigned 
>>> value is
>>> deemed inappropriate by MISRA), but rather than changing a whole lot 
>>> of places where this
>>> construct is used (mainly in x86 code), the reasoning is that it 
>>> makes more sense to isolate
>>> it and justify its presence by the fact that on 2's complement 
>>> architectures the result is
>>> indeed correct.
>>
>> This is explaining to me why you are adding LOWEST_POW2(). But this
>> doesn't explain why you are not using /* SAF-* */ on top of
>> LOWEST_POW2().
>>
>> To me, we should only use ECLAIR specific deviation when this is a
>> shortcoming with the tool.
>>
>> Cheers,
> 
> Because of the way ECLAIR deviation comments work implies that in most 
> cases the real
> place where to put the deviation is the usage site
> (the so-called top expansion location of the macro). Now, for 
> widely-used macros this is
> cumbersome and would clutter the code unnecessarily. It's way cleaner 
> imo to have a single
> line in the configuration with a clear justification that is present in 
> the textual output
> of the tool.

Just to clarify, you are saying that the following would not work for 
Eclair:

/* SAF-XXX */
#define LOWEST_POW2()

Instead you would need the following:

void foo()
{
	/* SAF-XXX */
	LOWEST()
}

Am I correct? If so, would something like below (untested) work?

#define LOWEST_POW2(...) ({ \
    /* SAFE-XXX */           \
    ...
    })

> But then there are tool interoperability considerations, that would call 
> for standardized
> deviation mechanisms, if they do detect this as a violation (which I 
> don't know).

I don't think we need to know whether a tool detects it. We only need to 
know whether this is  violation to MISRA. If this is one, then this is a 
call to have a marker in the code.

If this is a false positive, then adding the deviation in the tool 
configuration is best (unless there are multiple tools affected).

> 
> In the end, it could be done with a textual deviation, if that's 
> preferred, but keep in mind
> that those are more fragile w.r.t. code movement.

If the comment is around the macro there are limited chance that this 
will be missed. But if you are worried about code movement, you should 
be worried about macro renaming with your approach (one may not know 
Eclair has a deviation) and/or function with the same name.

I am curious to know what the other thinks.

Cheers,

-- 
Julien Grall

