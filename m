Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7CA179365E
	for <lists+xen-devel@lfdr.de>; Wed,  6 Sep 2023 09:36:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.596287.930128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdn4p-00038U-7n; Wed, 06 Sep 2023 07:35:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 596287.930128; Wed, 06 Sep 2023 07:35:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdn4p-00035S-5A; Wed, 06 Sep 2023 07:35:51 +0000
Received: by outflank-mailman (input) for mailman id 596287;
 Wed, 06 Sep 2023 07:35:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3YH9=EW=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qdn4n-00035M-Nu
 for xen-devel@lists.xenproject.org; Wed, 06 Sep 2023 07:35:49 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ff4e17ea-4c87-11ee-8783-cb3800f73035;
 Wed, 06 Sep 2023 09:35:48 +0200 (CEST)
Received: from [192.168.1.9] (net-93-66-137-131.cust.vodafonedsl.it
 [93.66.137.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 92F0D4EE0737;
 Wed,  6 Sep 2023 09:35:47 +0200 (CEST)
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
X-Inumbo-ID: ff4e17ea-4c87-11ee-8783-cb3800f73035
Message-ID: <af0e3fa1-c0de-18ae-c899-5e4bdfbd0509@bugseng.com>
Date: Wed, 6 Sep 2023 09:35:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN PATCH 09/13] xen/common: address violations of MISRA C:2012
 Directive 4.10
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Jan Beulich <jbeulich@suse.com>, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1693228255.git.simone.ballarin@bugseng.com>
 <fe1768342df0cd9315af87c83cc6d8d09f61b983.1693228255.git.simone.ballarin@bugseng.com>
 <00d67696-7895-f4cd-de0d-0c24f937deb9@suse.com>
 <be7ba4ea-b5e9-cc00-a8d1-0fec82248b8f@bugseng.com>
 <00866371-7adb-9cfa-267d-ee78cf14e68c@suse.com>
 <7d5244fe-d89c-8878-b16a-a3345426de1e@bugseng.com>
 <6ea28c90-68aa-4a14-e352-2bcb6e42a76a@suse.com>
 <814c3aa1-dbce-97d2-f526-93e185d61438@bugseng.com>
 <alpine.DEB.2.22.394.2309051514200.6458@ubuntu-linux-20-04-desktop>
From: Simone Ballarin <simone.ballarin@bugseng.com>
Organization: BUGSENG
In-Reply-To: <alpine.DEB.2.22.394.2309051514200.6458@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/09/23 00:18, Stefano Stabellini wrote:
> On Thu, 31 Aug 2023, Simone Ballarin wrote:
>> On 31/08/23 15:05, Jan Beulich wrote:
>>> On 31.08.2023 14:54, Simone Ballarin wrote:
>>>> On 31/08/23 13:10, Jan Beulich wrote:
>>>>> On 31.08.2023 12:08, Simone Ballarin wrote:
>>>>>> The danger of multi-inclusion also exists for .c files, why do you
>>>>>> want
>>>>>> to avoid guards for them?
>>>>>
>>>>> Counter question: Why only add guards to some of them? (My personal
>>>>> answer is "Because it's extra clutter.")
>>>>
>>>> It's not "some of them", it's exactly the ones used in an #include
>>>> directive, so I'm not getting your objection.
>>>
>>> My point is that by adding guards only for files we presently use in some
>>> #include directive, we set us up for introducing new violations as soon
>>> as another .c file becomes the subject of an #include.The more that it
>>> is unusual to add guards in .c files, i.e. it is to be expected that
>>> people wouldn't think about this extra Misra requirement.
>>>
>>> Jan
>>
>> I can agree to partially adopt the directive: I will add a deviation for C
>> files in rules.txt.
> 
> Sorry for the late reply as I was OOO. Please hold on before adding a
> deviation for C files.
> 
> In general, I think including .c files is not common behavior, and
> should be restricted to special cases. We could say that exactly because
> they are special, they follow different rules so we can skip the guards.
> Or we could say that they are still at risk of double-inclusion, hence
> we should be consistent and protect them too. I think we should discuss
> the topic during the next MISRA C meeting.
> 
Ok, I will drop changes in C files without adding the deviation.

-- 
Simone Ballarin, M.Sc.

Field Application Engineer, BUGSENG (https://bugseng.com)


