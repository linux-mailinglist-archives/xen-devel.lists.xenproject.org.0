Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E48EF78EDB7
	for <lists+xen-devel@lfdr.de>; Thu, 31 Aug 2023 14:54:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.593859.926977 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbhC6-0002Uj-UO; Thu, 31 Aug 2023 12:54:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 593859.926977; Thu, 31 Aug 2023 12:54:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbhC6-0002Sp-Re; Thu, 31 Aug 2023 12:54:42 +0000
Received: by outflank-mailman (input) for mailman id 593859;
 Thu, 31 Aug 2023 12:54:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=shXB=EQ=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qbhC5-0002Sh-NL
 for xen-devel@lists.xenproject.org; Thu, 31 Aug 2023 12:54:41 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8c62d7a8-47fd-11ee-8783-cb3800f73035;
 Thu, 31 Aug 2023 14:54:40 +0200 (CEST)
Received: from [192.168.8.109] (unknown [151.36.0.213])
 by support.bugseng.com (Postfix) with ESMTPSA id 4EA954EE0738;
 Thu, 31 Aug 2023 14:54:39 +0200 (CEST)
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
X-Inumbo-ID: 8c62d7a8-47fd-11ee-8783-cb3800f73035
Message-ID: <7d5244fe-d89c-8878-b16a-a3345426de1e@bugseng.com>
Date: Thu, 31 Aug 2023 14:54:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN PATCH 09/13] xen/common: address violations of MISRA C:2012
 Directive 4.10
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: consulting@bugseng.com, sstabellini@kernel.org,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1693228255.git.simone.ballarin@bugseng.com>
 <fe1768342df0cd9315af87c83cc6d8d09f61b983.1693228255.git.simone.ballarin@bugseng.com>
 <00d67696-7895-f4cd-de0d-0c24f937deb9@suse.com>
 <be7ba4ea-b5e9-cc00-a8d1-0fec82248b8f@bugseng.com>
 <00866371-7adb-9cfa-267d-ee78cf14e68c@suse.com>
From: Simone Ballarin <simone.ballarin@bugseng.com>
Organization: BUGSENG
In-Reply-To: <00866371-7adb-9cfa-267d-ee78cf14e68c@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 31/08/23 13:10, Jan Beulich wrote:
> On 31.08.2023 12:08, Simone Ballarin wrote:
>> On 29/08/23 08:50, Jan Beulich wrote:
>>> On 28.08.2023 15:20, Simone Ballarin wrote:
>>>> Add inclusion guards to address violations of
>>>> MISRA C:2012 Directive 4.10 ("Precautions shall be taken in order
>>>> to prevent the contents of a header file being included more than
>>>> once").
>>>>
>>>> Also C files, if included somewhere, need to comply with the guideline.
>>>>
>>>> Mechanical change.
>>>>
>>>> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
>>>> ---
>>>>    xen/common/compat/grant_table.c | 7 +++++++
>>>>    xen/common/coverage/gcc_4_7.c   | 5 +++++
>>>>    xen/common/decompress.h         | 5 +++++
>>>>    xen/common/event_channel.h      | 5 +++++
>>>>    xen/common/multicall.c          | 5 +++++
>>>>    5 files changed, 27 insertions(+)
>>>
>>> As already said in reply to another patch, imo .c files shouldn't gain such
>>> guards. These are commonly referred to as "header guards" for a reason.
>>>
>>
>> This is the MISRA's definition of "header file" (MISRA C:2012 Revision
>> 1, Appendix J):
>>
>>     "A header file is any file that is the subject of a #include
>>      directive.
>>      Note: the filename extension is not significant."
> 
> That's completely misleading terminology then.
> 

I might agree with you on this, but either way this is the definition to 
apply when reading the guideline. IMHO here, the best would be to use a 
separate extension for "C files intended to be included" (but that's not 
the point).

>> So, the guards are required if we want to comply with the directive,
>> otherwise we can raise a deviation.
>>
>> The danger of multi-inclusion also exists for .c files, why do you want
>> to avoid guards for them?
> 
> Counter question: Why only add guards to some of them? (My personal
> answer is "Because it's extra clutter.")
> 
> Jan
> 

It's not "some of them", it's exactly the ones used in an #include 
directive, so I'm not getting your objection.

By the way, if the community agrees, I can deviate all C files and
drop the changes.

-- 
Simone Ballarin, M.Sc.

Field Application Engineer, BUGSENG (https://bugseng.com)


