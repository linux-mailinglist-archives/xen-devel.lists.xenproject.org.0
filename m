Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B14087CE68
	for <lists+xen-devel@lfdr.de>; Fri, 15 Mar 2024 14:56:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693874.1082514 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rl828-0003Jd-BB; Fri, 15 Mar 2024 13:55:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693874.1082514; Fri, 15 Mar 2024 13:55:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rl828-0003GZ-7m; Fri, 15 Mar 2024 13:55:40 +0000
Received: by outflank-mailman (input) for mailman id 693874;
 Fri, 15 Mar 2024 13:55:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rl826-0003GT-8Y
 for xen-devel@lists.xenproject.org; Fri, 15 Mar 2024 13:55:38 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rl822-0003Bd-49; Fri, 15 Mar 2024 13:55:34 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rl821-0005JI-NE; Fri, 15 Mar 2024 13:55:33 +0000
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
	bh=MnVIp05F5yrN6rlMJva4K+AfoeCH/692t0nM0NGmdeA=; b=ahEhHbF8DYGB+ssS/C6JuZQ6L2
	CSkrJTo76q8QwdBoSDJwu5w6mW3rwC8y6HvvoFIMETsM5Os1fu2E3PHaQB6hM3u2BzZ1XxaN2PPu7
	5jGEkVaBGK9Xeu8dpTUY4WP3fnfuiv4o9UjKnu0SAwo8CxDYunrnEtzbRaVul0LOAN8A=;
Message-ID: <3f27abc3-9809-4637-a29c-8aeafcd29ade@xen.org>
Date: Fri, 15 Mar 2024 13:55:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] do_multicall and MISRA Rule 8.3\
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, George Dunlap <george.dunlap@cloud.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 federico.serafini@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, xen-devel@lists.xenproject.org,
 michal.orzel@amd.com
References: <alpine.DEB.2.22.394.2311221331130.2053963@ubuntu-linux-20-04-desktop>
 <5a8f90d6-6502-4d93-9fd7-45fea0ede24a@suse.com>
 <alpine.DEB.2.22.394.2403081758400.853156@ubuntu-linux-20-04-desktop>
 <CA+zSX=aiqacW+QLM+KX-CcAo3DVnN+Kn7vQsOOKGK3qQOqXvBA@mail.gmail.com>
 <a2485ac6-19ac-42ce-b8cf-6f8408483521@xen.org>
 <alpine.DEB.2.22.394.2403141711460.853156@ubuntu-linux-20-04-desktop>
 <e57a3c03-fcbc-4a5a-8b23-b9b9448de2be@suse.com>
 <CA+zSX=anV+h8a8Ynq1Eh+PmtmgiSj8ruRfBbhLrhMbrNn+ED0w@mail.gmail.com>
 <63891474-1dc4-4c86-aaf4-cc4d4c53a0ae@suse.com>
 <CA+zSX=bu-gRYUYOKMRp5kJ02ExdrtFEHTgXapwTVotm5cK2dfw@mail.gmail.com>
 <d05be83a-e7f1-4c2f-afda-42deee9be203@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <d05be83a-e7f1-4c2f-afda-42deee9be203@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Jan,

On 15/03/2024 13:24, Jan Beulich wrote:
> On 15.03.2024 13:17, George Dunlap wrote:
>> On Fri, Mar 15, 2024 at 11:57 AM Jan Beulich <jbeulich@suse.com> wrote:
>>>> It sounds like Andy and Stefano feel like this is a situation where "a
>>>> fixed width quantity is meant"; absent any further guidance from the
>>>> CODING_STYLE about when fixed widths should or should not be used, I
>>>> don't think this change would be a violation of CODING_STYLE.
>>>
>>> As with any not sufficiently clear statement, that's certainly true here,
>>> too. Yet if we try to give as wide meaning as possible to "a fixed width
>>> quantity is meant", there's basically no restriction on use of fixed width
>>> types because everyone can just say "but I mean a fixed width quantity
>>> here". I think the earlier sentence needs taking with higher priority,
>>> i.e. if a basic type does for the purpose, that's what should be used. The
>>> 2nd sentence then only tries to further clarify what the 1st means.
>>
>> Come, now.  There are lots of situations where we just need some sort
>> of number, and there's no real need to worry about the exact size.
>> There are other situations, where we mean "whatever covers the whole
>> address space" or the like, where it makes sense to have something
>> like "unsigned long", which changes size, but in predictable and
>> useful ways.  There are other situations, like when talking over an
>> API to code which may be compiled by a different compiler, or may be
>> running in a different processor mode, where we want to be more
>> specific, and set an exact number of bits.
>>
>> Should we use uint32_t for random loop variables?  Pretty clearly
>> "No".  Should we use uint32_t for the C entry of a hypercall, even
>> though the assembly code allegedly makes that unnecessary?  At least
>> two core maintainers think "maybe just to be safe".  That's hardly a
>> slippery slope of "anyone can say anything".
>>
>> Other than "it's in CODING_STYLE", and "it's not really necessary
>> because it's ensured in the assembly code", you haven't advanced a
>> single reason why "uint32_t" is problematic.
> 
> And it isn't, I never said it would be. But if we set rules for
> ourselves, why would we take the first opportunity to not respect them?

I am a bit confused. Reading through the thread you seem to agree that
the written rules are respected here. So what rules are you talking about?

Or are we just disagreeing on the interpretation? In which case, then 
that's a call for clarification of CODING_STYLE.

Cheers,

-- 
Julien Grall

