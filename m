Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A924772C98A
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jun 2023 17:15:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.547299.854608 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8jGL-0007QR-Bl; Mon, 12 Jun 2023 15:15:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 547299.854608; Mon, 12 Jun 2023 15:15:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8jGL-0007OA-92; Mon, 12 Jun 2023 15:15:21 +0000
Received: by outflank-mailman (input) for mailman id 547299;
 Mon, 12 Jun 2023 15:15:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yDFT=CA=bugseng.com=roberto.bagnara@srs-se1.protection.inumbo.net>)
 id 1q8jGJ-0007O4-Sz
 for xen-devel@lists.xenproject.org; Mon, 12 Jun 2023 15:15:19 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id efb90176-0933-11ee-8611-37d641c3527e;
 Mon, 12 Jun 2023 17:15:17 +0200 (CEST)
Received: from [192.168.1.142] (unknown [151.44.205.175])
 by support.bugseng.com (Postfix) with ESMTPSA id 0A1644EE073E;
 Mon, 12 Jun 2023 17:15:14 +0200 (CEST)
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
X-Inumbo-ID: efb90176-0933-11ee-8611-37d641c3527e
Message-ID: <63debfc0-4b29-ca03-b93c-85857987285f@bugseng.com>
Date: Mon, 12 Jun 2023 17:15:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.7.12) Gecko/20050929
 Thunderbird/1.0.7 Fedora/1.0.7-1.1.fc4 Mnenhy/0.7.3.0
Subject: Re: [PATCH v2] docs/misra: new rules addition
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: julien@xen.org, andrew.cooper3@citrix.com, roger.pau@citrix.com,
 bertrand.marquis@arm.com, Stefano Stabellini <stefano.stabellini@amd.com>,
 xen-devel@lists.xenproject.org
References: <20230609174543.4067574-1-sstabellini@kernel.org>
 <a3229436-c714-ab2d-27f9-eac1455d3943@suse.com>
 <6525d690-e487-ead8-34d6-55219ccfbfa2@bugseng.com>
 <e831ef81-85e3-3b5c-f899-e9dbb83b8296@suse.com>
From: Roberto Bagnara <roberto.bagnara@bugseng.com>
In-Reply-To: <e831ef81-85e3-3b5c-f899-e9dbb83b8296@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/06/23 11:50, Jan Beulich wrote:
> On 12.06.2023 11:34, Roberto Bagnara wrote:
>> On 12/06/23 09:33, Jan Beulich wrote:
>>> On 09.06.2023 19:45, Stefano Stabellini wrote:
>>>> @@ -143,6 +163,12 @@ existing codebase are work-in-progress.
>>>>         - Octal constants shall not be used
>>>>         -
>>>>    
>>>> +   * - `Rule 7.2 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_07_02.c>`_
>>>> +     - Required
>>>> +     - A "u" or "U" suffix shall be applied to all integer constants
>>>> +       that are represented in an unsigned type
>>>> +     -
>>>
>>> I continue to consider "represented in" problematic here without
>>> further qualification.
>>
>> We should distinguish two things here.  The headline of Rule 7.2
>> is non negotiable: it is simply as it is.
> 
> I understand this, and ...
> 
>>   As all headlines,
>> it is a compromise between conciseness and mnemonic value.
>> If what is wanted there is not the headline, then you can add
>> "implicitly" before "represented".  Or you may leave the headline
>> and add an explanatory note afterwards.
> 
> ... such a note is what my comment was heading towards.

Here is an attempt.  "The rule asks that any integer literal
that is implicitly unsigned is made explicitly unsigned by
using one of the indicated suffixes.  As an example, on
a machine where the int type is 32-bit wide, 0x77777777
is signed whereas 0x80000000 is (implicitly) unsigned.
In order to comply with the rule, the latter should be
rewritten as either 0x80000000u or 0x80000000U.  Consistency
considerations may suggest using the same suffix even
when not required by the rule.  For instance, if one has

    f(0x77777777);  // Original
    f(0x80000000);

one might prefer

    f(0x77777777U); // Solution 1
    f(0x80000000U);

over

    f(0x77777777);  // Solution 2
    f(0x80000000U);

after having ascertained that "Solution 1" is compatible
with the intended semantics."


>>>> @@ -314,6 +340,11 @@ existing codebase are work-in-progress.
>>>>           used following a subsequent call to the same function
>>>>         -
>>>>    
>>>> +   * - Rule 21.21
>>>> +     - Required
>>>> +     - The Standard Library function system of <stdlib.h> shall not be used
>>>> +     -
>>>
>>> Still no "inapplicable" note (whichever way it would be worded to also
>>> please Roberto)?
>>
>> I am not the one to be pleased ;-)
>>
>> But really, I don't follow: when you say the rule is inapplicable
>> your reasoning is, IIUC, "nobody would even dream using system() in Xen".
>> Which is exactly what the rule is asking.  If Xen adopts the rule,
>> tooling will make sure system() is not used, and seeing that the rule
>> is applied, assessors will be pleased.
> 
> My point is that "not using functions of stdlib.h" is ambiguous: It may
> mean functions implemented in an external library (which the hypervisor
> doesn't use), or it may mean functions of identical name (and purpose).
> The full text goes even further and forbids the use of these
> identifiers (plural; see next paragraph), so it's clearly not only
> about an external library, and we also can't put it off as inapplicable.
> (I wouldn't be surprised if we had a local variable or label named
> "exit" or "abort".)
> 
> Btw - I can't find a rule 21.21 in my two (slightly different) copies
> of the doc, nor one with this headline and a different number. What I
> have is "21.8 The Standard Library functions abort, exit and system of
> <stdlib.h> shall not be used". (I further wonder why neither of the two
> docs allows me to copy-and-paste a line out of it.)

Rule 21.21 was added in MISRA C:2012 Amendment 2, which you can download
(free of charge) from https://www.misra.org.uk/app/uploads/2021/06/MISRA-C-2012-AMD2.pdf

