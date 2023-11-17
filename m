Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 949617EF101
	for <lists+xen-devel@lfdr.de>; Fri, 17 Nov 2023 11:50:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.635052.990758 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3wPl-00052X-1Z; Fri, 17 Nov 2023 10:49:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 635052.990758; Fri, 17 Nov 2023 10:49:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3wPk-00050Q-Us; Fri, 17 Nov 2023 10:49:32 +0000
Received: by outflank-mailman (input) for mailman id 635052;
 Fri, 17 Nov 2023 10:49:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8Lb0=G6=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1r3wPj-00050K-K8
 for xen-devel@lists.xenproject.org; Fri, 17 Nov 2023 10:49:31 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fbda4351-8536-11ee-9b0e-b553b5be7939;
 Fri, 17 Nov 2023 11:49:29 +0100 (CET)
Received: from [172.20.10.2] (unknown [37.163.77.7])
 by support.bugseng.com (Postfix) with ESMTPSA id 906A84EE0744;
 Fri, 17 Nov 2023 11:49:27 +0100 (CET)
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
X-Inumbo-ID: fbda4351-8536-11ee-9b0e-b553b5be7939
Message-ID: <a665cac0-93f3-4fbb-a1bc-104bc36fbf61@bugseng.com>
Date: Fri, 17 Nov 2023 11:49:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v3] xen/mm: address violations of MISRA C:2012 Rules
 8.2 and 8.3
Content-Language: en-US, it
To: Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: consulting@bugseng.com, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Henry Wang <henry.wang@arm.com>, xen-devel@lists.xenproject.org
References: <eedcfeb8d1c81527b7e18fcc0eca252577f00035.1696344012.git.federico.serafini@bugseng.com>
 <d7cd7a02-b960-384e-4af2-f70b425e5ad1@suse.com>
 <alpine.DEB.2.22.394.2310181543030.965337@ubuntu-linux-20-04-desktop>
 <30e35f13-d2d0-eaf3-9660-c508655b84ce@suse.com>
 <alpine.DEB.2.22.394.2310190921020.1945130@ubuntu-linux-20-04-desktop>
 <965cdb62-1b96-c8a1-733b-ad006bb2edc6@suse.com>
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG srl
In-Reply-To: <965cdb62-1b96-c8a1-733b-ad006bb2edc6@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/10/23 08:35, Jan Beulich wrote:
> On 19.10.2023 18:26, Stefano Stabellini wrote:
>> On Thu, 19 Oct 2023, Jan Beulich wrote:
>>> On 19.10.2023 00:43, Stefano Stabellini wrote:
>>>> On Mon, 16 Oct 2023, Jan Beulich wrote:
>>>>> On 03.10.2023 17:24, Federico Serafini wrote:
>>>>>> --- a/xen/arch/x86/mm.c
>>>>>> +++ b/xen/arch/x86/mm.c
>>>>>> @@ -5901,17 +5901,17 @@ int destroy_xen_mappings(unsigned long s, unsigned long e)
>>>>>>    * a problem.
>>>>>>    */
>>>>>>   void init_or_livepatch modify_xen_mappings_lite(
>>>>>> -    unsigned long s, unsigned long e, unsigned int _nf)
>>>>>> +    unsigned long s, unsigned long e, unsigned int nf)
>>>>>>   {
>>>>>> -    unsigned long v = s, fm, nf;
>>>>>> +    unsigned long v = s, fm, flags;
>>>>>
>>>>> While it looks correct, I consider this an unacceptably dangerous
>>>>> change: What if by the time this is to be committed some new use of
>>>>> the local "nf" appears, without resulting in fuzz while applying the
>>>>> patch? Imo this needs doing in two steps: First nf -> flags, then
>>>>> _nf -> nf.
>>>>
>>>> Wouldn't it be sufficient for the committer to pay special attention
>>>> when committing this patch? We are in code freeze anyway, the rate of
>>>> changes affecting staging is low.
>>>
>>> Any kind of risk excludes a patch from being a 4.18 candidate, imo.
>>
>> I agree on that. I think it is best to commit it for 4.19 when the tree
>> opens.
>>
>>
>>> That was the case in early RCs already, and is even more so now. Paying
>>> special attention is generally a possibility, yet may I remind you that
>>> committing in general is intended to be a purely mechanical operation?
>>
>> Sure, and I am not asking for a general process change. I am only
>> suggesting that this specific concern on this patch is best solved in
>> the simplest way: by a committer making sure the patch is correct on
>> commit. It is meant to save time for everyone.
>>
>> Jan, if you are OK with it, we could just trust you to commit it the
>> right away as the earliest opportunity.
> 
> If you can get Andrew or Roger to ack this patch in its present shape,
> I won't stand in the way. I'm not going to ack the change without the
> indicated split.

I'll propose a new patch series where changes are splitted as indicated.
I also noticed a discrepancy between Arm and x86 in the name of the
last parameter of xenmem_add_to_physmap_one().
Do you have any suggestions about how to solve it?
If we reach an agreement, then I can put the changes related to the mm 
module in a single patch.

-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

