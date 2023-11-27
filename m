Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7F07FA81C
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 18:34:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642374.1001805 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7fUr-0007HM-IE; Mon, 27 Nov 2023 17:34:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642374.1001805; Mon, 27 Nov 2023 17:34:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7fUr-0007F3-Fa; Mon, 27 Nov 2023 17:34:13 +0000
Received: by outflank-mailman (input) for mailman id 642374;
 Mon, 27 Nov 2023 17:34:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D1Su=HI=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1r7fUp-0007Ex-NR
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 17:34:11 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2c30e0f8-8d4b-11ee-98e2-6d05b1d4d9a1;
 Mon, 27 Nov 2023 18:34:10 +0100 (CET)
Received: from [192.168.1.9] (net-37-182-35-120.cust.vodafonedsl.it
 [37.182.35.120])
 by support.bugseng.com (Postfix) with ESMTPSA id B849A4EE0737;
 Mon, 27 Nov 2023 18:34:08 +0100 (CET)
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
X-Inumbo-ID: 2c30e0f8-8d4b-11ee-98e2-6d05b1d4d9a1
Message-ID: <89847582-ff70-4ba2-9cc7-e45ea2b691e3@bugseng.com>
Date: Mon, 27 Nov 2023 18:34:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 2/3] xen/arm: add SAF deviation for debugging and
 logging effects
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
References: <cover.1700844359.git.simone.ballarin@bugseng.com>
 <761ce615438312ca5d37fb8829a0ba903375392f.1700844359.git.simone.ballarin@bugseng.com>
 <ec587cf6-088b-4142-8067-4d9d67fc58c1@suse.com>
 <59744708-c2fb-488c-9e6b-e47faf7a8007@bugseng.com>
 <497617b3-6a86-46bf-99ea-2b2f1bdf9d97@suse.com>
From: Simone Ballarin <simone.ballarin@bugseng.com>
Organization: BUGSENG
In-Reply-To: <497617b3-6a86-46bf-99ea-2b2f1bdf9d97@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/11/23 16:09, Jan Beulich wrote:
> On 27.11.2023 15:35, Simone Ballarin wrote:
>> On 27/11/23 11:46, Jan Beulich wrote:
>>> On 24.11.2023 18:29, Simone Ballarin wrote:
>>>> --- a/docs/misra/safe.json
>>>> +++ b/docs/misra/safe.json
>>>> @@ -28,6 +28,22 @@
>>>>            },
>>>>            {
>>>>                "id": "SAF-3-safe",
>>>> +            "analyser": {
>>>> +                "eclair": "MC3R1.R13.1"
>>>> +            },
>>>> +            "name": "MC3R1.R13.1: effects for debugging and logging",
>>>> +            "text": "Effects for debugging and loggings reasons that crash execution or produce logs are allowed in initializer lists. The evaluation order in abnormal conditions is not relevant."
>>>> +        },
>>>
>>> I'm wary of this statement. Order may not matter much anymore _after_ an
>>> abnormal condition was encountered, but in the course of determining whether
>>> an abnormal condition might have been reached it may very well still matter.
>>
>> Do you object to the deviation in general? Or just to the wording?
> 
> Primarily the wording. Yet the need to adjust the wording also hints at there
> needing to be care when actually making use of this deviation. Which it turn
> I'm not convinced is in the spirit of Misra

The rule is really strict, but imho the only real dangerous situation is
when an entry performs a persistent side effect that can change the
behavior of another entry. I.e.:

int y = 0;
int x[2] =
{
   y=1, /* first element will be always 1 */
   y    /* second element can be either 0 or 1 */
};

Above we have a dependency between the first entry and the second.

Now let's consider logging effects:

#define LOG(x) printf("LOG: %s", x);

int x[2] =
{
   ({ LOG("1"); 1; }),
   ({ LOG("2"); 2; })
};


Here the execution can print:
"LOG: 1LOG: 2" or
"LOG: 2LOG: 1".

Do we agree that the evaluation order of prints caused by logging
functions/macros do not normally cause dependencies between the
entries? The execution is still non-deterministic, but does it really
matter?.

In the case of function that crash execution, no dependencies can exist
since no further entries will be evaluated.

In conclusion, I propose the following rewording:

"text": "Effects that crash execution or produce logs are allowed in 
initializer lists. Logging effects do not affect the evaluation of 
subsequent entries. Crash effects are allowed as they represent the
end of the execution.


> 
>>>> --- a/xen/arch/arm/device.c
>>>> +++ b/xen/arch/arm/device.c
>>>> @@ -331,6 +331,7 @@ int handle_device(struct domain *d, struct dt_device_node *dev, p2m_type_t p2mt,
>>>>            .p2mt = p2mt,
>>>>            .skip_mapping = !own_device ||
>>>>                            (is_pci_passthrough_enabled() &&
>>>> +                        /* SAF-3-safe effects for debugging/logging reasons are safe */
>>>>                            (device_get_class(dev) == DEVICE_PCI_HOSTBRIDGE)),
>>>
>>> What's the debugging / logging reason on the commented line?
>>
>> The "ASSERT(dev != NULL)" in its body.
> 
> "it" == device_get_class() I assume? Imo to unobvious to deal with like this.
> 

Yes, Julien suggested to simply remove the ASSERT as it isn't really 
useful. I forgot his suggestion. In v3 I will remove it as suggested.

>>>> --- a/xen/arch/arm/guestcopy.c
>>>> +++ b/xen/arch/arm/guestcopy.c
>>>> @@ -110,18 +110,21 @@ static unsigned long copy_guest(void *buf, uint64_t addr, unsigned int len,
>>>>    unsigned long raw_copy_to_guest(void *to, const void *from, unsigned int len)
>>>>    {
>>>>        return copy_guest((void *)from, (vaddr_t)to, len,
>>>> +                      /* SAF-4-safe No persistent side effects */
>>>>                          GVA_INFO(current), COPY_to_guest | COPY_linear);
>>>>    }
>>>>    
>>>>    unsigned long raw_copy_to_guest_flush_dcache(void *to, const void *from,
>>>>                                                 unsigned int len)
>>>>    {
>>>> +    /* SAF-4-safe No persistent side effects */
>>>>        return copy_guest((void *)from, (vaddr_t)to, len, GVA_INFO(current),
>>>>                          COPY_to_guest | COPY_flush_dcache | COPY_linear);
>>>>    }
>>>>    
>>>>    unsigned long raw_clear_guest(void *to, unsigned int len)
>>>>    {
>>>> +    /* SAF-4-safe No persistent side effects */
>>>>        return copy_guest(NULL, (vaddr_t)to, len, GVA_INFO(current),
>>>>                          COPY_to_guest | COPY_linear);
>>>>    }
>>>> @@ -129,6 +132,7 @@ unsigned long raw_clear_guest(void *to, unsigned int len)
>>>>    unsigned long raw_copy_from_guest(void *to, const void __user *from,
>>>>                                      unsigned int len)
>>>>    {
>>>> +    /* SAF-4-safe No persistent side effects */
>>>>        return copy_guest(to, (vaddr_t)from, len, GVA_INFO(current),
>>>>                          COPY_from_guest | COPY_linear);
>>>>    }
>>>
>>> I can only guess that in all four of these it's the use of "current" which
>>> requires the comment. Yet imo that either needs making explicit, or such a
>>> comment shouldn't go on use sites of "current", but on its definition site.
>>>
>>
>> "current" does not contain any violation of R13.1. Its expansion
>> produces a side-effect, but this is not a problem in itself. The real
>> problem is that GVA_INFO expands it in an initializer list:
>> #define GVA_INFO(vcpu) ((copy_info_t) { .gva = { vcpu } })
> 
> But an initializer list doesn't itself constitute a side effect, does it?
> 

The side effect should be inside the initializer list. { .gva = 1 } is 
not a violation.

>> GVA_INFO(current) is the real piece of code that requires to be
>> deviated.
> 
> In which case I think this such want spelling
> 
>      return copy_guest(to, (vaddr_t)from, len,
>                        /* SAF-4-safe No persistent side effects */
>                        GVA_INFO(current),
>                        COPY_from_guest | COPY_linear);
> 
> or some such. Not the least because we want to make sure a deviation does
> not have wider than necessary scope (which when formatted as above is,
> aiui, always the following source line).
> 

Yes, I agree.

> Jan

-- 
Simone Ballarin, M.Sc.

Field Application Engineer, BUGSENG (https://bugseng.com)


