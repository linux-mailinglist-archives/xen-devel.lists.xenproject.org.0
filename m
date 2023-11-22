Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D65B17F4332
	for <lists+xen-devel@lfdr.de>; Wed, 22 Nov 2023 11:05:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638619.995379 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5k6Z-0001bs-UX; Wed, 22 Nov 2023 10:05:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638619.995379; Wed, 22 Nov 2023 10:05:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5k6Z-0001aN-Re; Wed, 22 Nov 2023 10:05:11 +0000
Received: by outflank-mailman (input) for mailman id 638619;
 Wed, 22 Nov 2023 10:05:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vowI=HD=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1r5k6Y-0001aH-1t
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 10:05:10 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9d8833d6-891e-11ee-9b0e-b553b5be7939;
 Wed, 22 Nov 2023 11:05:08 +0100 (CET)
Received: from [172.20.10.2] (unknown [37.163.203.136])
 by support.bugseng.com (Postfix) with ESMTPSA id 255154EE073C;
 Wed, 22 Nov 2023 11:05:07 +0100 (CET)
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
X-Inumbo-ID: 9d8833d6-891e-11ee-9b0e-b553b5be7939
Message-ID: <a012398a-cd92-416e-ac8b-da0588acf334@bugseng.com>
Date: Wed, 22 Nov 2023 11:05:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 3/5] xen/sort: address violations of MISRA C:2012 Rule
 8.2
Content-Language: en-US, it
To: Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1700209834.git.federico.serafini@bugseng.com>
 <de68f8220fbb97ae6a3382138c23e81d0988a472.1700209834.git.federico.serafini@bugseng.com>
 <19d887e6-8c07-43f3-a2de-88ce0a0c99ba@suse.com>
 <b481a966-4f29-4b05-8246-d3f1eec19d0c@bugseng.com>
 <51010cec-596a-4249-82dc-ac711c3962c3@suse.com>
 <alpine.DEB.2.22.394.2311201603220.773207@ubuntu-linux-20-04-desktop>
 <dc07af2c-c011-4c06-a573-6aa95deb9ec6@suse.com>
 <alpine.DEB.2.22.394.2311211716240.2053963@ubuntu-linux-20-04-desktop>
 <109256b1-f18c-4c3c-a433-979e020270b8@suse.com>
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG srl
In-Reply-To: <109256b1-f18c-4c3c-a433-979e020270b8@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/11/23 09:01, Jan Beulich wrote:
> On 22.11.2023 02:19, Stefano Stabellini wrote:
>> On Tue, 21 Nov 2023, Jan Beulich wrote:
>>> On 21.11.2023 01:04, Stefano Stabellini wrote:
>>>> On Mon, 20 Nov 2023, Jan Beulich wrote:
>>>>> On 20.11.2023 14:13, Federico Serafini wrote:
>>>>>> On 20/11/23 10:02, Jan Beulich wrote:
>>>>>>> On 17.11.2023 09:40, Federico Serafini wrote:
>>>>>>>> --- a/xen/include/xen/sort.h
>>>>>>>> +++ b/xen/include/xen/sort.h
>>>>>>>> @@ -23,8 +23,8 @@
>>>>>>>>    extern gnu_inline
>>>>>>>>    #endif
>>>>>>>>    void sort(void *base, size_t num, size_t size,
>>>>>>>> -          int (*cmp)(const void *, const void *),
>>>>>>>> -          void (*swap)(void *, void *, size_t))
>>>>>>>> +          int (*cmp)(const void *key, const void *elem),
>>>>>>>
>>>>>>> Why "key" and "elem" here, but ...
>>>>>>>
>>>>>>>> +          void (*swap)(void *a, void *b, size_t size))
>>>>>>>
>>>>>>> ... "a" and "b" here? The first example of users of sort() that I'm
>>>>>>> looking at right now (x86/extable.c) is consistent in its naming.
>>>>>>>
>>>>>>
>>>>>> On the Arm side there are {cmp,swap}_memory_node() and
>>>>>> {cmp,swap}_mmio_handler(): "key"/"elem" are used for the comparison
>>>>>> and "_a"/"_b" for the swap.
>>>>>
>>>>> So - re-raising a question Stefano did raise - is Misra concerned about
>>>>> such discrepancies? If yes, _all_ instances need harmonizing. If not, I
>>>>> see no reason to go with misleading names here.
>>>>
>>>> Federico confirmed that the answer is "no".
>>>>
>>>> I think we can use "key" and "elem" in this patch as they are more
>>>> informative than "a" and "b"
>>>
>>> Except that "key" and "elem" are (imo) inapplicable to sort() callbacks
>>> (and inconsistent with the naming in the 2nd callback here); they _may_
>>> be applicable in bsearch() ones. Note also how in the C99 spec these
>>> parameters of callback functions don't have names either.
>>
>> Yes, reading the example in extable.c I think you are right. Maybe it is
>> better to use "a" and "b" in both cmp and swap if you agree.
> 
> Using a and b is (as it looks) in line with at least some uses we have, so
> less code churn than going with some other, more descriptive names (like
> left/right). So yes, I'm okay with using a/b.

I'll send a new version.

-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

