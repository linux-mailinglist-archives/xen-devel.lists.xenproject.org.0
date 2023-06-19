Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F404E734E91
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jun 2023 10:51:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.550885.860092 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBAaj-00060K-KJ; Mon, 19 Jun 2023 08:50:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 550885.860092; Mon, 19 Jun 2023 08:50:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBAaj-0005y9-HJ; Mon, 19 Jun 2023 08:50:29 +0000
Received: by outflank-mailman (input) for mailman id 550885;
 Mon, 19 Jun 2023 08:50:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qBAah-0005xz-GI
 for xen-devel@lists.xenproject.org; Mon, 19 Jun 2023 08:50:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qBAad-0007en-59; Mon, 19 Jun 2023 08:50:23 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230]
 helo=[192.168.19.123]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qBAac-0004OA-UZ; Mon, 19 Jun 2023 08:50:23 +0000
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
	bh=/YncY10uCo9jb8MT6mipX/qC5ZT8nNbO9KOL7L3Dmg0=; b=cRtmKrLj9O0A7FUlgTC+NZuJ4T
	6udAawO2YKDxlaXPZjNv8oIqT9Al+NJRAGFjbcSfYvuG89IKuf35Lk2l7LZ/dWovZi2Tkbyf7wR4z
	/dUW28r0w25oWcITKRUgfwI3pR8E66x5RSQ7Ob3Cyff4qLck/GZaRhzPNCAnG9sqTITQ=;
Message-ID: <e4bfecf4-5728-c604-4ab4-167f0a9e5924@xen.org>
Date: Mon, 19 Jun 2023 09:50:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: Refactoring of a possibly unsafe pattern for variable
 initialization via function calls
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <d0eed387-0f96-f7c4-0e66-f5109eac2e9c@bugseng.com>
 <3fc32674-af28-2a04-4eb8-059364a6a6fb@suse.com>
 <4522eead-bcc3-a735-3293-54ec457e83eb@bugseng.com>
 <alpine.DEB.2.22.394.2306161354070.897208@ubuntu-linux-20-04-desktop>
 <ddbd283d-2d6e-cef5-f2a2-de7fb8a4fe3f@suse.com>
 <1d34618d-2796-e26a-b339-ac8f1fcb8c82@xen.org>
 <FFDFE558-B7CE-4145-9036-05268FDE9E6E@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <FFDFE558-B7CE-4145-9036-05268FDE9E6E@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 19/06/2023 09:31, Luca Fancellu wrote:
> 
> 
>> On 19 Jun 2023, at 09:23, Julien Grall <julien@xen.org> wrote:
>>
>>
>>
>> On 19/06/2023 09:18, Jan Beulich wrote:
>>> On 16.06.2023 22:56, Stefano Stabellini wrote:
>>>> On Fri, 16 Jun 2023, Nicola Vetrini wrote:
>>>>> On 16/06/23 09:19, Jan Beulich wrote:
>>>>>> On 15.06.2023 18:39, nicola wrote:
>>>>>>> while investigating possible patches regarding Mandatory Rule 9.1, I
>>>>>>> found the following pattern, that is likely to results in a lot possible
>>>>>>> positives from many (all) static analysis tools for this rule.
>>>>>>>
>>>>>>> This is the current status (taken from `xen/common/device_tree.c:135')
>>>>>>>
>>>>>>>
>>>>>>> const struct dt_property *dt_find_property(const struct dt_device_node
>>>>>>> *np,
>>>>>>>                                               const char *name, u32 *lenp)
>>>>>>> {
>>>>>>>        const struct dt_property *pp;
>>>>>>>
>>>>>>>        if ( !np )
>>>>>>>            return NULL;
>>>>>>>
>>>>>>>        for ( pp = np->properties; pp; pp = pp->next )
>>>>>>>        {
>>>>>>>            if ( dt_prop_cmp(pp->name, name) == 0 )
>>>>>>>            {
>>>>>>>                if ( lenp )
>>>>>>>                    *lenp = pp->length;
>>>>>>>                break;
>>>>>>>            }
>>>>>>>        }
>>>>>>>
>>>>>>>        return pp;
>>>>>>> }
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>> It's very hard to detect that the pointee is always written whenever a
>>>>>>> non-NULL pointer for `lenp' is supplied, and it can safely be read in
>>>>>>> the callee, so a sound analysis will err on the cautious side.
>>>>>>
>>>>>> I'm having trouble seeing why this is hard to recognize: The loop can
>>>>>> only be exited two ways: pp == NULL or with *lenp written.
>>>>>>
>>>>>> For rule 9.1 I'd rather expect the scanning tool (and often the compiler)
>>>>>> to get into trouble with the NULL return value case, and *lenp not being
>>>>>> written yet apparently consumed in the caller. Then, however, ...
>>>>>
>>>>>
>>>>> You're right, I made a mistake, thank you for finding it.
>>>>> I meant to write on `*lenp' in all execution paths.
>>>>> Please, take a look at this revised version:
>>>>>
>>>>>
>>>>> const struct dt_property *dt_find_property(const struct dt_device_node *np,
>>>>>                                             const char *name, u32 *lenp)
>>>>> {
>>>>>      u32 len = 0;
>>>>>      const struct dt_property *pp = NULL;
>>>>>
>>>>>      if ( np )
>>>>>      {
>>>>>          for ( pp = np->properties; pp; pp = pp->next )
>>>>>          {
>>>>>              if ( dt_prop_cmp(pp->name, name) == 0 )
>>>>>              {
>>>>>                  len = pp->length;
>>>>>                  break;
>>>>>              }
>>>>>          }
>>>>>      }
>>>>>
>>>>>      if ( lenp )
>>>>>          *lenp = len;
>>>>>      return pp;
>>>>> }
>>>>
>>>> Nesting more will make the code less readable and also cause other code
>>>> quality metrics to deteriorate (cyclomatic complexity).
>>>>
>>>> Would the below work?
>>>>
>>>>
>>>> const struct dt_property *dt_find_property(const struct dt_device_node *np,
>>>>                                             const char *name, u32 *lenp)
>>>> {
>>>>      u32 len = 0;
>>>>      const struct dt_property *pp = NULL;
>>>>
>>>>      if ( !np )
>>>>          return NULL
>>> That's what we started from, but leaving *lenp not written to. How
>>> about ...
>>>>      for ( pp = np->properties; pp; pp = pp->next )
>>>      for ( pp = np ? np->properties : NULL; pp; pp = pp->next ) > > ?
>>
>> I would be OK with that. Maybe with an extra set of parentheses around ' np ? ... : NULL' just to make visually easier to parse.
> 
> Agree, and for MISRA, we should use a boolean expression as condition, even if I know that we would like to deviate from that,
The code will even be more difficult to read. So if we plan to deviate, 
then I don't want us to use MISRA-compliant boolean expression here.

> which I dislike.

What do you dislike?

Cheers,

-- 
Julien Grall

