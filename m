Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D7175B284
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jul 2023 17:27:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.566665.885794 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMVZ5-0007ss-CB; Thu, 20 Jul 2023 15:27:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 566665.885794; Thu, 20 Jul 2023 15:27:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMVZ5-0007q7-7u; Thu, 20 Jul 2023 15:27:39 +0000
Received: by outflank-mailman (input) for mailman id 566665;
 Thu, 20 Jul 2023 15:27:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qMVZ4-0007pz-0W
 for xen-devel@lists.xenproject.org; Thu, 20 Jul 2023 15:27:38 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qMVZ2-0007qB-Ql; Thu, 20 Jul 2023 15:27:36 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231]
 helo=[192.168.24.131]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qMVZ2-0004Q4-Cf; Thu, 20 Jul 2023 15:27:36 +0000
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
	bh=zPOZzkUv+0+Hjp3+bGH2tbWd5VbuidYLrEOh/8zDmCg=; b=kDvQNC4SJVlIRL8z0RXMf0CcMr
	lHkdBUohNO8zXZmcKnxD1roh1vMvrH9oHb32eKZFcvxvW+ofbNBBiHD5IwF8Hyoy1G8JPDi7pZA5b
	aeZuTGDtkCl2W9RmSfagTO/OqGGK+9NV5ctTkgPar1QSWK5AKbXnHm71KD0mqyABV2O4=;
Message-ID: <9a646bac-6355-7ccd-6e09-e10f942f44af@xen.org>
Date: Thu, 20 Jul 2023 16:27:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [RFC PATCH 1/4] xen/arm: justify or initialize conditionally
 uninitialized variables
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1689329728.git.nicola.vetrini@bugseng.com>
 <1ad20473a031eca75db4007bdc169616b512ef44.1689329728.git.nicola.vetrini@bugseng.com>
 <97d8a796-f790-8efc-1d89-def1f1193e61@xen.org>
 <5da7ae40-35c7-7f93-824f-42a0712cdcf1@bugseng.com>
 <9cac9bc5-ad55-3bcd-b645-a30a5b863b3f@xen.org>
 <26008624-b00c-ecd2-77e0-3f1cad63db66@bugseng.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <26008624-b00c-ecd2-77e0-3f1cad63db66@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Nicola,

On 20/07/2023 11:14, Nicola Vetrini wrote:
> 
> 
> On 17/07/23 15:40, Julien Grall wrote:
>> Hi Nicola,
>>
>> On 17/07/2023 13:08, Nicola Vetrini wrote:
>>> On 14/07/23 15:00, Julien Grall wrote:
>>>> Hi Nicola,
>>>>
>>>> On 14/07/2023 12:49, Nicola Vetrini wrote:
>>>>> This patch aims to fix some occurrences of possibly uninitialized
>>>>> variables, that may be read before being written. This behaviour would
>>>>> violate MISRA C:2012 Rule 9.1, besides being generally undesirable.
>>>>>
>>>>> In all the analyzed cases, such accesses were actually safe, but it's
>>>>> quite difficult to prove so by automatic checking, therefore a safer
>>>>> route is to change the code so as to avoid the behaviour from 
>>>>> occurring,
>>>>> while preserving the semantics.
>>>>>
>>>>> To achieve this goal, I adopted the following strategies:
>>>>
>>>> Please let's at least one patch per strategy. I would also consider 
>>>> some of the rework separate so they can go in regardless the 
>>>> decision for the SAF-*.
>>>>
>>>>>
>>>>> - Add a suitably formatted local deviation comment
>>>>>    (as indicated in 'docs/misra/documenting-violations.rst')
>>>>>    to exempt the following line from checking.
>>>>>
>>>>> - Provide an initialization for the variable at the declaration.
>>>>>
>>>>> - Substitute a goto breaking out of control flow logic with a 
>>>>> semantically
>>>>>    equivalent do { .. } while(0).
>>>>
>>>> As I already mentioned in private, it is unclear to me how you 
>>>> decided which strategy to use. I still think we need to define our 
>>>> policy before changing the code. Otherwise, it is going to be 
>>>> difficult to decide for new code.
>>>>
>>>
>>> The main point of this RFC is doing so. From what I gathered, it's 
>>> not an easy task: sometimes there are no 'safe' values to initialize 
>>> variables to and sometimes there is no easy way to prove that indeed 
>>> something is always initialized or not accessed at all.
>>
>> But you wrote the code. So you should be able to explain how you took 
>> the decision between one and the others.
>>
>> Also, even if this is an RFC, it would have been good to summarize any 
>> discussion that happened in private and if there were concern try to 
>> come up with ideas or at least listing the concerns after '---.
>>
> 
> I'll keep this if the need arises in the future.
> 
>>>
>>>>>
>>>>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>>>> ---
>>>>>   docs/misra/safe.json                   |  8 +++++++
>>>>>   xen/arch/arm/arm64/lib/find_next_bit.c |  1 +
>>>>>   xen/arch/arm/bootfdt.c                 |  6 +++++
>>>>>   xen/arch/arm/decode.c                  |  2 ++
>>>>>   xen/arch/arm/domain_build.c            | 29 ++++++++++++++++++----
>>>>>   xen/arch/arm/efi/efi-boot.h            |  6 +++--
>>>>>   xen/arch/arm/gic-v3-its.c              |  9 ++++---
>>>>>   xen/arch/arm/mm.c                      |  1 +
>>>>>   xen/arch/arm/p2m.c                     | 33 
>>>>> +++++++++++++++-----------
>>>>>   9 files changed, 69 insertions(+), 26 deletions(-)
>>>>>
>>>>> diff --git a/docs/misra/safe.json b/docs/misra/safe.json
>>>>> index e3c8a1d8eb..244001f5be 100644
>>>>> --- a/docs/misra/safe.json
>>>>> +++ b/docs/misra/safe.json
>>>>> @@ -12,6 +12,14 @@
>>>>>           },
>>>>>           {
>>>>>               "id": "SAF-1-safe",
>>>>> +            "analyser": {
>>>>> +                "eclair": "MC3R1.R9.1"
>>>>> +            },
>>>>> +            "name": "Rule 9.1: initializer not needed",
>>>>> +            "text": "The following local variables are possibly 
>>>>> subject to being read before being written, but code inspection 
>>>>> ensured that the control flow in the construct where they appear 
>>>>> ensures that no such event may happen."
>>>> I am bit concerned which such statement because the code instance 
>>>> was today with the current code. This could change in the future and 
>>>> invalide the reasoning.
>>>>
>>>> It is not clear to me if we have any mechanism to prevent that. If 
>>>> we don't, then I think we need to drastically reduce the number of 
>>>> time this is used (there are a bit too much for my taste).
>>>>
>>>
>>> Indeed, the purpose of such a deviation is that the sound 
>>> overapproximation computed by the tool requires a human to look at 
>>> the code and think twice before modifying it (i.e., if ever that code 
>>> is touched, the reviewer ought to assess whether that justification 
>>> still holds or some other thing should be done about it.
>>
>> Your assumption is the reviewer will notice there is an existing 
>> devitation and be able to assess it has changed. I view this 
>> assumption as risky in the long term.
>>
>> Have you investigate to improve the automatic tooling?
>>
> 
> Well, as discussed elsewhere in the thread, a slightly modified version 
> of this deviation comment can list the specific reason why such a thing 
> was deviated directly at the declaration or where the caution is, if you 
> think this is better.
> 
> Example:
> 
> // <- SAF-x here
> int var;
> 
> [...]
> 
> // <- or HERE
> f(&var);
> 
> An alternative approach to justification, partly discussed with Stefano 
> in private is a macro that looks like an attribute to signal that the 
> variable is intentionally uninitialized. This does not have the benefit 
> of a written justification with a proper comment or an entry in the json 
> file, but is less intrusive and the justification for all occurrences of 
> __uninit w.r.t R9.1 would be included in the static analysis tool 
> configuration, which would be part of the MISRA compliance 
> documentation. This does imply a coarse justification like the one 
> above, but if further clarification is needed it can be provided locally 
> in the code, as guidance for contributors.
> 
> Example:
> #define __uninit
> 
> __uninit int x;

IHMO none of the example really help. You are still expecting the 
reviewer/developper to drop __uninit or any comment if the behavior has 
changed.

I don't have a good idea how we can mitigate it other than reworking the 
code in a way that makes both ECLAIR and the maintainers happy. Maybe 
the others will.

[...]

>>>>
>>>>>       int ret;
>>>>> @@ -249,8 +252,10 @@ static void __init 
>>>>> process_multiboot_node(const void *fdt, int node,
>>>>>       const __be32 *cell;
>>>>>       bootmodule_kind kind;
>>>>>       paddr_t start, size;
>>>>> +    /* SAF-1-safe MC3R1.R9.1 */
>>>>>       int len;
>>>>>       /* sizeof("/chosen/") + DT_MAX_NAME + '/' + DT_MAX_NAME + 
>>>>> '/0' => 92 */
>>>>> +    /* SAF-1-safe MC3R1.R9.1*/
>>>>>       char path[92];
>>>>
>>>> So the two above, is one category of issue. The variables are passed 
>>>> as argument of function which will fill them.
>>>>
>>>> Can Eclair look at the callers, if so, can we consider to always 
>>>> initialize the values in the callee?
>>>>
>>>> This would reduce the number of SAF-*. There are a few other 
>>>> examples like that below. So I will skip them for now.
>>>>
>>>> [...]
>>>>
>>>
>>> If the value is always initialized in the callee, then there's no 
>>> problem configuring ECLAIR so that it knows that this parameter is 
>>> always written, and therefore any subsequent use in the caller is ok.
>>>
>>> Another possibility is stating that a function never reads the 
>>> pointee before writing to it (it may or may not write it, but if it 
>>> doesn't, then the pointee is not read either). The 'strncmp' after 
>>> 'fdt_get_path' does get in the way, though, because this property is 
>>> not strong enough to ensure that we can use 'path' after returning 
>>> from the function.
>>
>> I am not sure I fully understand what you wrote. Can you provide a C 
>> example?
>>
> 
> void f(int *x) {
>    if(x) {
>      *x = 10;
>      int y =*x; // read the pointee after it's initialized
>    } else {
>      int z; // in this branch the pointee is not read nor written
>    }
>    // we can say that f never reads *x before (possibly) writing to it.
> }

I am having trouble to understand it in the context of fdt_get_path(). 
Is 'f' meant to be fdt_get_path()?

[...]

>>>>>       rc = evtchn_alloc_unbound(&alloc, 0);
>>>>>       if ( rc )
>>>>>       {
>>>>> @@ -3810,8 +3827,9 @@ static int __init construct_domU(struct 
>>>>> domain *d,
>>>>>                                    const struct dt_device_node *node)
>>>>>   {
>>>>>       struct kernel_info kinfo = {};
>>>>> -    const char *dom0less_enhanced;
>>>>> +    const char *dom0less_enhanced = NULL;
>>>>
>>>> If you look at the user below, all the callers assume 
>>>> dom0less_enhanced will be non-NULL. So it is unclear to me how this 
>>>> value is safer.
>>>>  > Looking at the code, I wonder whether we should convert
>>>> dt_property_read_string() to use ERR_PTR(). So we could remove the 
>>>> last argument and return it instead.
>>>
>>> Is relying on that assumption somehow safer? 
>>
>> I am assuming you are referring to "If you look at the user below, all 
>> the callers assume dom0less_enhanced will be non-NULL". Note that I 
>> didn't suggest it is safer. I am only pointed out that you didn't 
>> specify how this was better in the context of the code.
>>
> 
> This should be probably discussed after deciding on the refactoring 
> 'dt_property_read_string'

FAOD, I think we should refactor dt_property_read_string(). I am happy 
to write a patch if you want.

[...]

>>> The analysis here could use some more precision, but the modified 
>>> construct is entirely equivalent.
>>
>> I agree that they are equivalent. But in general, we don't change the 
>> style of the construct without explaining why.
>>
>> In this case, the first step would be to improve Eclair.
>>
> 
> The changes needed for this kind of analysis are not trivial: we've 
> looked into this, but there's no easy way to support this in a timely 
> manner. I understand that this is an estabilished pattern, but what 
> would you think of an initializer using designators?
> 
> uint64_t cmd[4] = {
>          .[0] = GITS_CMD_MAPC;
>          .[1] = 0x00;
>          .[2] = encode_rdbase(its, cpu, collection_id) | GITS_VALID_BIT;
>          .[3] = 0x00;
> }

The reability is Ok here. But this may not be the case here. In 
particular...

> 
>>>
>>>>>       cmd[3] = 0x00;
>>>>>       return its_send_command(its, cmd);
>>>>> @@ -215,9 +214,7 @@ static int its_send_cmd_mapd(struct host_its 
>>>>> *its, uint32_t deviceid,
>>>>>       }
>>>>>       cmd[0] = GITS_CMD_MAPD | ((uint64_t)deviceid << 32);
>>>>>       cmd[1] = size_bits;
>>>>> -    cmd[2] = itt_addr;
>>>>> -    if ( valid )
>>>>> -        cmd[2] |= GITS_VALID_BIT;
>>>>> +    cmd[2] = itt_addr | (valid ? GITS_VALID_BIT : 0x00);
>>>>
>>>> Same here.

here... I much prefer the existing version.

[...]

>>>>> +      if ( nr == MAX_VMID )
>>>>> +      {
>>>>> +          rc = -EBUSY;
>>>>> +          printk(XENLOG_ERR "p2m.c: dom%d: VMID pool exhausted\n", 
>>>>> d->domain_id);
>>>>> +          break;
>>>>> +      }
>>>>> -    set_bit(nr, vmid_mask);
>>>>> +      set_bit(nr, vmid_mask);
>>>>> -    p2m->vmid = nr;
>>>>> +      p2m->vmid = nr;
>>>>> -    rc = 0;
>>>>> +            rc = 0;
>>>>> +        } while ( 0 );
>>>>> -out:
>>>>>       spin_unlock(&vmid_alloc_lock);
>>>>>       return rc;
>>>>>   }
>>>>
>>>
>>>
>>> Considering all of the replies above, a first draft of a 
>>> strategy/policy I can think of is having:
>>>
>>> - Initializer functions that always write their parameter, so that 
>>> the strongest "pointee always written" property can be stated. This 
>>> causes all further uses to be marked safe.
>>>
>>> - Initialize the variable when there exists a known safe value that 
>>> does not alter the semantics of the function. The initialization does 
>>> not need to be at the declaration, but doing so simplifies the code.
>>
>> As I mentionned in private there are two risks with that:
>>   1. You silence compiler to spot other issues
>>   2. You may now get warning from Coverity if it spots you set a value 
>> that get overwritten before its first use.
>>
>> So I think such approach should be used with parcimony. Instead, we 
>> should look at reworking the code when possible.
>>
> 
> Do you think it would help if you look directly at actual cautions to 
> spot possible functions that can be refactored?

I have already looked at some. Can we focus on them and see how much it 
helps?

Cheers,

-- 
Julien Grall

