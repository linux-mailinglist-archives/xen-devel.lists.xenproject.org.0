Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5737C4F67
	for <lists+xen-devel@lfdr.de>; Wed, 11 Oct 2023 11:51:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.615443.956662 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqVs3-0002EA-N2; Wed, 11 Oct 2023 09:51:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 615443.956662; Wed, 11 Oct 2023 09:51:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqVs3-0002Ao-Jm; Wed, 11 Oct 2023 09:51:15 +0000
Received: by outflank-mailman (input) for mailman id 615443;
 Wed, 11 Oct 2023 09:51:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qqVs2-0002Ai-KB
 for xen-devel@lists.xenproject.org; Wed, 11 Oct 2023 09:51:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qqVs1-0007pQ-EO; Wed, 11 Oct 2023 09:51:13 +0000
Received: from [15.248.2.150] (helo=[10.24.67.30])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qqVs1-00053H-1X; Wed, 11 Oct 2023 09:51:13 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	References:Cc:To:From:Subject:MIME-Version:Date:Message-ID;
	bh=zLEkR6S863FaWXhkpznKXuo5Cbu5VpUqLynezQ8mLpQ=; b=wDqplFbCqaq5xDSCRdVyx+aKft
	zJbRxNm5dPiyxL+KgJiSPUrenHirmGBtIvNley4yo7MOXdhsBEkTNzlgXFQy4r4v3qPbbg80yqU2E
	xjPYaOnr87dGIN3W9vEeCvLD0GgfDzmSjTqK8bsEfHhFJZnMThaBH4BprTQsT5nm5X98=;
Message-ID: <1766b5f3-490c-4bbe-902c-3970c28041a7@xen.org>
Date: Wed, 11 Oct 2023 10:51:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] xen: Add SAF deviations for MISRA C:2012 Rule 7.1
Content-Language: en-GB
From: Julien Grall <julien@xen.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Luca Fancellu <Luca.Fancellu@arm.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 "michal.orzel@amd.com" <michal.orzel@amd.com>,
 "xenia.ragiadakou@amd.com" <xenia.ragiadakou@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 "consulting@bugseng.com" <consulting@bugseng.com>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Henry Wang <Henry.Wang@arm.com>,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>, George Dunlap
 <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <338d8e574db943a86c7605e4c6d9a299d45f067d.1696347345.git.nicola.vetrini@bugseng.com>
 <alpine.DEB.2.22.394.2310031345190.2348112@ubuntu-linux-20-04-desktop>
 <e1736215-52ba-4737-9da3-8f1ba7e832a6@citrix.com>
 <DB96C095-5FAF-40A1-9CA8-002291AA1933@arm.com>
 <2894008e8f612296da84267346ae4240@bugseng.com>
 <B00BC78B-E707-4043-A0B4-D320C6717472@arm.com>
 <alpine.DEB.2.22.394.2310041625170.2348112@ubuntu-linux-20-04-desktop>
 <9DD525D9-DB6D-4888-9266-FB45906A0E0F@arm.com>
 <alpine.DEB.2.22.394.2310051756360.2348112@ubuntu-linux-20-04-desktop>
 <C2DDFAB5-D943-4A24-9C14-AF35BE2A7C90@arm.com>
 <alpine.DEB.2.22.394.2310061741130.3431292@ubuntu-linux-20-04-desktop>
 <1ceb5aa0-d374-4357-964f-1341468d542e@xen.org>
 <alpine.DEB.2.22.394.2310091251080.3431292@ubuntu-linux-20-04-desktop>
 <8c3d7933-c139-49dd-8c62-2d4543176f8f@xen.org>
 <alpine.DEB.2.22.394.2310101635280.3431292@ubuntu-linux-20-04-desktop>
 <80f4df2b-a8b2-4494-94e0-47de55c01597@xen.org>
In-Reply-To: <80f4df2b-a8b2-4494-94e0-47de55c01597@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/10/2023 10:45, Julien Grall wrote:
> Hi Stefano,
> 
> On 11/10/2023 00:39, Stefano Stabellini wrote:
>> On Tue, 10 Oct 2023, Julien Grall wrote:
>>> Hi Stefano,
>>>
>>> On 09/10/2023 23:19, Stefano Stabellini wrote:
>>>>>
>>>>> I am not sure this is better. This is a long line to read. But this 
>>>>> is a
>>>>> personal opinion.
>>>>>
>>>>> On the technical side, can we easily teach a tool to format this 
>>>>> kind of
>>>>> exception? If not, then this should not be an exception we should
>>>>> implement.
>>>>
>>>> I am not sure I understand what you mean by "can we easily teach a tool
>>>> to format this kind of exception". Do you mean whether we can teach a
>>>> tool to interpret a multiline statement as a single statement?
>>>
>>> Sorry for the wording was not clear. I was referring to tools 
>>> formatting the
>>> code (e.g. clang-format). Hopefully, at some point, we will finally 
>>> have a way
>>> to automatically format the code. So we need a coding style that can 
>>> be easily
>>> be checked.
>>>
>>> It is not clear to me whether your proposed exception would work. We 
>>> may have
>>> to allow longer lines (and this has drawback).
>>
>> Yes, that's a good point. It will probably be an issue with clang-format.
>>
>>
>>>> /* cppcheck tag */
>>>> line1
>>>> /* cppcheck tag */
>>>> line2
>>>> /* cppcheck tag */
>>>> line3
>>>>
>>>> and that would end up changing the line numbers in the source files so
>>>> the cppcheck report wouldn't match with the original line numbers any
>>>> longer
>>>
>>> Would cppcheck accepts tag at the end of the line? If so, the 
>>> following would
>>> not modify the line count:
>>>
>>> /* cppcheck tag */
>>> line1 /* added cppcheck tag */
>>> line2 /* added cppcheck tag */
>>> line3 /* added cppcheck tag */
>>
>> Luca answered to a similar, more generic, question a few days ago about
>> Coverity: https://marc.info/?l=xen-devel&m=169657904027210
> 
> Interesting.
> 
>>
>> So even if we get cppcheck to work like that, we would lose Coverity
>> support.
> 
> I think my suggestion was probably misunderstood. So let me clarify it. 
> To cover multi-line, we could write the following in Xen:
> 
> /* cppcheck tag next-3-lines */
> line 1
> line 2
> line 3
> 
> AFAIU Eclair supports multi-line, so the tag would be transformed to 
> there internal solution. For CPPCheck, this could be transformed to:
> 
> /* cppcheck tag next-3 lines */
> line 1 /* generated cppcheck tag */
> line 2 /* generated cppcheck tag */
> line 3 /* generated cppcheck tag */
> 
> Now, I understand that coverity doesn't support any of the two format. 
> So the only solution would be to add the comment before each line which 
> would impact the line numbers. This is not great, but I think this is 
> acceptable as the context would likely help to find where this is coming 
> from.

Just to clarify, here I meant that for coverity, a script before the 
scan could convert to the multi-line version. So the line change only 
impact Coverity.

Cheers,

-- 
Julien Grall

