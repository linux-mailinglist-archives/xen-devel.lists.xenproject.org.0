Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA0974976A
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jul 2023 10:23:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559770.875067 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHKH0-0004EL-BS; Thu, 06 Jul 2023 08:23:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559770.875067; Thu, 06 Jul 2023 08:23:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHKH0-0004Cd-8m; Thu, 06 Jul 2023 08:23:34 +0000
Received: by outflank-mailman (input) for mailman id 559770;
 Thu, 06 Jul 2023 08:23:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W7Zt=CY=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qHKGx-0004CX-VQ
 for xen-devel@lists.xenproject.org; Thu, 06 Jul 2023 08:23:31 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 62dde4ed-1bd6-11ee-8611-37d641c3527e;
 Thu, 06 Jul 2023 10:23:29 +0200 (CEST)
Received: from [192.168.1.100] (unknown [37.161.201.129])
 by support.bugseng.com (Postfix) with ESMTPSA id D21DD4EE0739;
 Thu,  6 Jul 2023 10:23:26 +0200 (CEST)
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
X-Inumbo-ID: 62dde4ed-1bd6-11ee-8611-37d641c3527e
Message-ID: <8d730008-f7ab-20d3-69b1-52a83282e2a7@bugseng.com>
Date: Thu, 6 Jul 2023 10:23:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [XEN PATCH v3 3/3] xen: fix violations of MISRA C:2012 Rule 3.1
To: Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 "michal.orzel@amd.com" <michal.orzel@amd.com>,
 "xenia.ragiadakou@amd.com" <xenia.ragiadakou@amd.com>,
 "ayan.kumar.halder@amd.com" <ayan.kumar.halder@amd.com>,
 "consulting@bugseng.com" <consulting@bugseng.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, "julien@xen.org"
 <julien@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Wei Liu <wl@xen.org>, Luca Fancellu <Luca.Fancellu@arm.com>
References: <cover.1688032865.git.nicola.vetrini@bugseng.com>
 <c9ff72160539cda49e726ac6ee1486be0d645180.1688032865.git.nicola.vetrini@bugseng.com>
 <771A1A80-0FC6-4D20-84FE-DA0A2DCFF14B@arm.com>
 <alpine.DEB.2.22.394.2306291218350.3936094@ubuntu-linux-20-04-desktop>
 <ff1a6435-d7ef-eb10-afe2-0fee33788924@suse.com>
Content-Language: en-US
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
In-Reply-To: <ff1a6435-d7ef-eb10-afe2-0fee33788924@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 04/07/23 17:57, Jan Beulich wrote:
> On 29.06.2023 21:20, Stefano Stabellini wrote:
>> On Thu, 29 Jun 2023, Luca Fancellu wrote:
>>>> On 29 Jun 2023, at 11:06, Nicola Vetrini <nicola.vetrini@bugseng.com> wrote:
>>>> --- a/xen/common/xmalloc_tlsf.c
>>>> +++ b/xen/common/xmalloc_tlsf.c
>>>> @@ -140,9 +140,7 @@ static inline void MAPPING_SEARCH(unsigned long *r, int *fl, int *sl)
>>>>          *fl = flsl(*r) - 1;
>>>>          *sl = (*r >> (*fl - MAX_LOG2_SLI)) - MAX_SLI;
>>>>          *fl -= FLI_OFFSET;
>>>> -        /*if ((*fl -= FLI_OFFSET) < 0) // FL will be always >0!
>>>> -         *fl = *sl = 0;
>>>> -         */
>>>> +        ASSERT( *fl >= 0 );
>>>
>>> I’ve checked the codebase for usage of ASSERT, but I’ve not seen use of it with spaces
>>> before and after the condition (like our if conditions) so I think they can be dropped.
>>
>> Yes, that's right. I am OK with this patch but I think we should wait
>> for Jan's ack to be sure.
>>
>> An alternative that I feel more comfortable in Acking myself because it
>> doesn't change the semantics of this code would be to change the 3 lines
>> of code above with this:
>>
>> /*
>>   * ; FL will be always >0!
>>   * if ((*fl -= FLI_OFFSET) < 0)
>>   *     fl = *sl = 0;
>>   */
> 
> While I'd be okay with this form, as Luca says it'll get us a different
> violation, which we ought to avoid. While I was the one to suggest the
> conversion to ASSERT(), having thought about it yet once more I'm now
> of the opinion that _any_ transformation of this commented out piece of
> code needs first understanding what was originally meant. Or
> alternatively, while converting to #if form, to add a comment making
> crystal clear that it's simply uncertain what was meant.
> 

About the violation of D4.4: the Directive was never considered for 
compliance because it's an advisory directive, and hence considerably 
less urgent.

Having looked a bit at the surrounding code, since *fl and *sl are used
as array indices later in 'FIND_SUITABLE_BLOCK', I suggest using 
something along the lines of "If *fl ever becomes < 0, reset it to a 
safe value." (either using the form suggested by Stefano or an #if 0).

In any case this should become a standalone patch, right?

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

