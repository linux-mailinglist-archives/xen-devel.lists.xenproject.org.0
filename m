Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B9884F5B7
	for <lists+xen-devel@lfdr.de>; Fri,  9 Feb 2024 14:21:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.678706.1056197 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rYQoB-0004S7-S1; Fri, 09 Feb 2024 13:20:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 678706.1056197; Fri, 09 Feb 2024 13:20:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rYQoB-0004Pj-Oc; Fri, 09 Feb 2024 13:20:47 +0000
Received: by outflank-mailman (input) for mailman id 678706;
 Fri, 09 Feb 2024 13:20:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BFPS=JS=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rYQoA-0004Ot-JM
 for xen-devel@lists.xenproject.org; Fri, 09 Feb 2024 13:20:46 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 085edf5a-c74e-11ee-8a4b-1f161083a0e0;
 Fri, 09 Feb 2024 14:20:45 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 5A2D74EE0739;
 Fri,  9 Feb 2024 14:20:45 +0100 (CET)
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
X-Inumbo-ID: 085edf5a-c74e-11ee-8a4b-1f161083a0e0
MIME-Version: 1.0
Date: Fri, 09 Feb 2024 14:20:45 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Julien Grall <julien@xen.org>
Cc: Jan Beulich <jbeulich@suse.com>, sstabellini@kernel.org,
 michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com,
 consulting@bugseng.com, andrew.cooper3@citrix.com, roger.pau@citrix.com,
 bertrand.marquis@arm.com, George Dunlap <george.dunlap@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH v2] docs/misra: add asm-offset.c to exclude-list
In-Reply-To: <5cdae9ce-d2ff-40bd-bc07-aa1965275833@xen.org>
References: <09b659e19bf2cc6b3ee4320e019bdfa7def5f3b8.1707406598.git.nicola.vetrini@bugseng.com>
 <891e8cc2-e073-4cd3-9998-4c01ae775a3b@suse.com>
 <8977390f-9549-40d5-bfdc-5c3da81521fc@xen.org>
 <efc0eee4-9903-4228-b33e-cb50d4c545ee@suse.com>
 <5cdae9ce-d2ff-40bd-bc07-aa1965275833@xen.org>
Message-ID: <f6c91540dbb5a83d3172bb65b6d4ca4b@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2024-02-09 13:17, Julien Grall wrote:
> Hi Jan,
> 
> On 09/02/2024 11:46, Jan Beulich wrote:
>> On 09.02.2024 10:40, Julien Grall wrote:
>>> Replying on the v2 as well.
>> 
>> And answering here despite the respective question was raised on the
>> v1 thread: I'm certainly okay with the more detailed commit message.
> 
> Ah yes. Sorry, I replied to v1 first and then realized it may have been 
> easier to comment on v2.
> 
>> A few nits, though:
>> 
>>> On 08/02/2024 15:56, Jan Beulich wrote:
>>>> On 08.02.2024 16:50, Nicola Vetrini wrote:
>>>>> These files contain several deliberate violations of MISRA C rules 
>>>>> and
>>>>> they are not linked in the final Xen binary, therefore they can be 
>>>>> exempted
>>>>> from MISRA compliance.
>>> 
>>> I'd like the commit message to be expanded a little bit to explain 
>>> which
>>> MISRA rules are a problem. This helped me to understand why we 
>>> excluded
>>> rather than fixed.
>>> 
>>> Base on the previous discussion, I would suggest:
>>> 
>>> These files contain several deliberate violation of MISRA C rules 
>>> such as:
>> 
>> violations
>> 
>>>     * R20.12 on Arm for macros DEFINE and OFFSET, where the second
>>> argument of OFFSET is a macro and is used as a normal parameter and a
>>> stringification operand.
>> 
>> Is this really for Arm only?
> 
> I don't exactly know. I took Nicola's comment and massage it for the 
> commit message. I am assuming that this was also not exhaustive list, 
> so my aim was to only provide some example.
> 

Yes, indeed. I mentioned the first two examples that I remembered.

> Thinking of it, I don't see why it would only be a problem on Arm. I 
> can drop the "on Arm".
> 

My bad, I missed it in the output. Please drop the "on Arm" part.

>> 
>>>     * R2.1 because the file is not linked That said it was decided to
>>> deviate the rule itselfed to deviate that aspect).
>> 
>> There look to be punctuation issues here. Also s/itselfed/itself/, and
>> the duplicate "deviate" is also a little odd to read (maybe "deal 
>> with"
>> or "address" in place of the 2nd instance).
> 
> Doh, indeed. This wants to be:
> 
> "R2.1 because the file is not linked. That said, it was decided to 
> deviate the ruule itself to address that aspect."
                                                                          
         ^ rule
>>> The files are also not linked in the final Xen binary, therefore they
>>> can be expempted from MISRA compliance.
>> 
>> Looks to duplicate what the latter half of the 2nd bullet point has.
>> If to be kept: s/expempted/exempted/.
> 
> I will remove.
> 
>> 
>>>>> --- a/docs/misra/exclude-list.json
>>>>> +++ b/docs/misra/exclude-list.json
>>>>> @@ -101,6 +101,10 @@
>>>>>                "rel_path": "arch/x86/efi/check.c",
>>>>>                "comment": "The resulting code is not included in 
>>>>> the final Xen binary, ignore for now"
>>>>>            },
>>>>> +        {
>>>>> +          "rel_path": "arch/*/*/asm-offsets.c",
>>>>> +          "comment": "The resulting code is not included in the 
>>>>> final Xen binary, ignore for now"
>>>>> +        },
>>>>>            {
>>>>>                "rel_path": "common/coverage/*",
>>>>>                "comment": "Files to support gcov, ignore for now"
>>>> 
>>>> ... something looks odd with indentation; can probably be adjusted
>>>> while committing.
>>> 
>>> I am happy to take care of both the commit message and the 
>>> indentation
>>> on commit.
>> 
>> Okay, I'll leave that to you then.
> 
> Thanks. I will do it shortly.

Thanks,

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

