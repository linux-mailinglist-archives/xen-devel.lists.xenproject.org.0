Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EAF27567EE
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jul 2023 17:28:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.564696.882315 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLQ9H-0002hU-DU; Mon, 17 Jul 2023 15:28:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 564696.882315; Mon, 17 Jul 2023 15:28:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLQ9H-0002f4-Al; Mon, 17 Jul 2023 15:28:31 +0000
Received: by outflank-mailman (input) for mailman id 564696;
 Mon, 17 Jul 2023 15:28:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LRey=DD=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qLQ9F-0002ew-GF
 for xen-devel@lists.xenproject.org; Mon, 17 Jul 2023 15:28:29 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 93b014b2-24b6-11ee-b23a-6b7b168915f2;
 Mon, 17 Jul 2023 17:28:27 +0200 (CEST)
Received: from [192.168.1.100] (unknown [37.163.206.54])
 by support.bugseng.com (Postfix) with ESMTPSA id DECE14EE0737;
 Mon, 17 Jul 2023 17:28:22 +0200 (CEST)
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
X-Inumbo-ID: 93b014b2-24b6-11ee-b23a-6b7b168915f2
Message-ID: <3356b44e-a596-8cff-afd9-66bbcca53b30@bugseng.com>
Date: Mon, 17 Jul 2023 17:28:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFC PATCH 2/4] xen/arm64: bitops: justify uninitialized variable
 inside a macro
To: Jan Beulich <jbeulich@suse.com>, Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "michal.orzel@amd.com" <michal.orzel@amd.com>,
 "xenia.ragiadakou@amd.com" <xenia.ragiadakou@amd.com>,
 "ayan.kumar.halder@amd.com" <ayan.kumar.halder@amd.com>,
 "consulting@bugseng.com" <consulting@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1689329728.git.nicola.vetrini@bugseng.com>
 <d06a312944bee7457fa2ac75e0cfef20f0ec430f.1689329728.git.nicola.vetrini@bugseng.com>
 <CB1B8DB0-7708-454D-9E73-171CA894E304@arm.com>
 <f24d12ec-3edc-5aea-f399-05ed52ec1cbc@suse.com>
Content-Language: en-US
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
In-Reply-To: <f24d12ec-3edc-5aea-f399-05ed52ec1cbc@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 17/07/23 15:59, Jan Beulich wrote:
> On 14.07.2023 16:20, Luca Fancellu wrote:
>>
>>
>>> On 14 Jul 2023, at 12:49, Nicola Vetrini <nicola.vetrini@bugseng.com> wrote:
>>>
>>> The macro 'testop' expands to a function that declares the local
>>> variable 'oldbit', which is written before being set, but is such a
>>> way that is not amenable to automatic checking.
>>>
>>> Therefore, a deviation comment, is introduced to document this situation.
>>>
>>> A similar reasoning applies to macro 'guest_testop'.
>>>
>>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>> ---
>>> docs/misra/safe.json                     | 16 ++++++++++++++++
>>> xen/arch/arm/arm64/lib/bitops.c          |  3 +++
>>> xen/arch/arm/include/asm/guest_atomics.h |  3 +++
>>> 3 files changed, 22 insertions(+)
>>>
>>> diff --git a/docs/misra/safe.json b/docs/misra/safe.json
>>> index 244001f5be..4cf7cbf57b 100644
>>> --- a/docs/misra/safe.json
>>> +++ b/docs/misra/safe.json
>>> @@ -20,6 +20,22 @@
>>>          },
>>>          {
>>>              "id": "SAF-2-safe",
>>> +            "analyser": {
>>> +                "eclair": "MC3R1.R9.1"
>>> +            },
>>> +            "name": "Rule 9.1: initializer not needed",
>>> +            "text": "The following local variables are possibly subject to being read before being written, but code inspection ensured that the control flow in the construct where they appear ensures that no such event may happen."
>>> +        },
>>> +        {
>>> +            "id": "SAF-3-safe",
>>> +            "analyser": {
>>> +                "eclair": "MC3R1.R9.1"
>>> +            },
>>> +            "name": "Rule 9.1: initializer not needed",
>>> +            "text": "The following local variables are possibly subject to being read before being written, but code inspection ensured that the control flow in the construct where they appear ensures that no such event may happen."
>>> +        },
>>
>> Since the rule and the justification are the same, you can declare only once and use the same tag on top of the offending lines, so /* SAF-2-safe MC3R1.R9.1 */,
> 
> +1
> 
> I'm puzzled by the wording vs comment placement though: The comments
> are inserted ahead of the macro invocations, so there are no "following
> local variables". Plus does this imply the comment would suppress the
> checking on _all_ of them, rather than just the one that was confirmed
> to be safe? What if another new one was added, that actually introduces
> a problem?
> 
>> also, I remember some maintainers not happy about the misra rule being put after the tag, now I don’t recall who
> 
> Me, at least. The annotations should be tool-agnostic imo, or else the
> more tools we use, the longer these comments might get.
> 
> Jan

No problem for both: Given the earlier remarks by Julien on patch 1/4, I 
think we can devise something along the lines of

/* SAF-x-safe MISRA:C 2012 Rule 9.1 <Justification> */
int var;

and then write a generic justification in docs/misra/safe.json, while
<Justification> contains a specific one (e.g., this loop does so and so 
to ensure that no access to unset variables happens). Thus any 
modification to that variable would give who submits the patch and the 
reviewer a chance to spot any inconsistency when the code is modified.

However, given my other response to this same patch, this does not apply 
here specifically.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

