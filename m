Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D97753E07
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jul 2023 16:49:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.563690.881088 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qKK6g-00021M-BF; Fri, 14 Jul 2023 14:49:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 563690.881088; Fri, 14 Jul 2023 14:49:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qKK6g-0001yX-8U; Fri, 14 Jul 2023 14:49:18 +0000
Received: by outflank-mailman (input) for mailman id 563690;
 Fri, 14 Jul 2023 14:49:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z95V=DA=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qKK6f-0001yP-KK
 for xen-devel@lists.xenproject.org; Fri, 14 Jul 2023 14:49:17 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9a29950b-2255-11ee-8611-37d641c3527e;
 Fri, 14 Jul 2023 16:49:15 +0200 (CEST)
Received: from [192.168.1.100] (unknown [37.163.94.163])
 by support.bugseng.com (Postfix) with ESMTPSA id 249A14EE0739;
 Fri, 14 Jul 2023 16:49:13 +0200 (CEST)
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
X-Inumbo-ID: 9a29950b-2255-11ee-8611-37d641c3527e
Message-ID: <f1917965-8e43-9942-7c3e-d620c7b1d103@bugseng.com>
Date: Fri, 14 Jul 2023 16:49:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFC PATCH 2/4] xen/arm64: bitops: justify uninitialized variable
 inside a macro
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "michal.orzel@amd.com" <michal.orzel@amd.com>,
 "xenia.ragiadakou@amd.com" <xenia.ragiadakou@amd.com>,
 "ayan.kumar.halder@amd.com" <ayan.kumar.halder@amd.com>,
 "consulting@bugseng.com" <consulting@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1689329728.git.nicola.vetrini@bugseng.com>
 <d06a312944bee7457fa2ac75e0cfef20f0ec430f.1689329728.git.nicola.vetrini@bugseng.com>
 <CB1B8DB0-7708-454D-9E73-171CA894E304@arm.com>
 <3305C79F-38AA-4BA3-A9AA-4A626C7CC478@arm.com>
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
In-Reply-To: <3305C79F-38AA-4BA3-A9AA-4A626C7CC478@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 14/07/23 16:32, Luca Fancellu wrote:
> 
> 
>> On 14 Jul 2023, at 15:20, Luca Fancellu <Luca.Fancellu@arm.com> wrote:
>>
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
>>>         },
>>>         {
>>>             "id": "SAF-2-safe",
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
>> also, I remember some maintainers not happy about the misra rule being put after the tag, now I don’t recall who
> 
> Sorry, I see there was in a patch before a SAF-1-safe with the same justification, so I suggest you use SAF-3-safe as tag and drop the new justifications introduced here

I was a bit uncertain in choosing whether to use different IDs for 
bitops.c and guest_atomics.h, as they are very similar. Maybe a 
catch-all justification is too broad, but I have no strong opinion here.

As for the rule identifier after the tag, that's not a big problem (I 
added it mostly to emphasize why the deviation is there at a glance).

> 
>>
>>> +        {
>>> +            "id": "SAF-4-safe",
>>>             "analyser": {},
>>>             "name": "Sentinel",
>>>             "text": "Next ID to be used"
>>> diff --git a/xen/arch/arm/arm64/lib/bitops.c b/xen/arch/arm/arm64/lib/bitops.c
>>> index 20e3f3d6ce..e0728bb29d 100644
>>> --- a/xen/arch/arm/arm64/lib/bitops.c
>>> +++ b/xen/arch/arm/arm64/lib/bitops.c
>>> @@ -114,8 +114,11 @@ bitop(change_bit, eor)
>>> bitop(clear_bit, bic)
>>> bitop(set_bit, orr)
>>>
>>> +/* SAF-2-safe MC3R1.R9.1 */
>>> testop(test_and_change_bit, eor)
>>> +/* SAF-2-safe MC3R1.R9.1 */
>>> testop(test_and_clear_bit, bic)
>>> +/* SAF-2-safe MC3R1.R9.1 */
>>> testop(test_and_set_bit, orr)
>>>
>>> static always_inline bool int_clear_mask16(uint16_t mask, volatile uint16_t *p,
>>> diff --git a/xen/arch/arm/include/asm/guest_atomics.h b/xen/arch/arm/include/asm/guest_atomics.h
>>> index a1745f8613..9d8f8ec3a3 100644
>>> --- a/xen/arch/arm/include/asm/guest_atomics.h
>>> +++ b/xen/arch/arm/include/asm/guest_atomics.h
>>> @@ -67,8 +67,11 @@ guest_bitop(change_bit)
>>> /* test_bit does not use load-store atomic operations */
>>> #define guest_test_bit(d, nr, p) ((void)(d), test_bit(nr, p))
>>>
>>> +/* SAF-3-safe MC3R1.R9.1 */
>>> guest_testop(test_and_set_bit)
>>> +/* SAF-3-safe MC3R1.R9.1 */
>>> guest_testop(test_and_clear_bit)
>>> +/* SAF-3-safe MC3R1.R9.1 */
>>> guest_testop(test_and_change_bit)
>>>
>>> #undef guest_testop
>>> -- 
>>> 2.34.1
>>>
>>>
>>
> 

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

