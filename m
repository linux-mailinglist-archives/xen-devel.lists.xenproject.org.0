Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1BB32D97A2
	for <lists+xen-devel@lfdr.de>; Mon, 14 Dec 2020 12:48:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.52167.91275 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1komKD-00030O-0X; Mon, 14 Dec 2020 11:47:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 52167.91275; Mon, 14 Dec 2020 11:47:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1komKC-000301-Tm; Mon, 14 Dec 2020 11:47:32 +0000
Received: by outflank-mailman (input) for mailman id 52167;
 Mon, 14 Dec 2020 11:47:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1komKB-0002zw-RL
 for xen-devel@lists.xenproject.org; Mon, 14 Dec 2020 11:47:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1komK9-0004QA-BV; Mon, 14 Dec 2020 11:47:29 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1komK9-0003L5-38; Mon, 14 Dec 2020 11:47:29 +0000
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
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=DYCenHSEbbBZ7Dfw8uI9vo1283A7/U21yPi3ldUppck=; b=uWvbjGrQpQM54Rc8v7Etvuw5V7
	oohSH/Vtv4XCEK0qARLaHOmsdEFPFIPt8Y2DBXnmr6CeW8Ox7QhK2TdvLSplE9I0hSRJIYDWgXe3Z
	5Los1ozZ3qQeLhPh0DuT8IAWYBnVLO9TETy4R5Xa+xWjfS8jmzYPriCHHU2TbPZXl6E8=;
Subject: Re: [PATCH v4 1/3] xen/arm: add support for
 run_in_exception_handler()
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
References: <20201214075615.25038-1-jgross@suse.com>
 <20201214075615.25038-2-jgross@suse.com>
 <9d3f8583-cfba-0174-3275-b418648f3f31@xen.org>
 <3042ff2f-5d55-a132-a5fc-b214ec53e7a1@suse.com>
 <4a632e73-87ea-c037-09e1-dfc88d19d9b2@xen.org>
 <3f49eb17-0b2a-5b4f-81db-66454f13cf90@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <f3f54c23-7b4f-57d8-29d1-99019a02b824@xen.org>
Date: Mon, 14 Dec 2020 11:47:26 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <3f49eb17-0b2a-5b4f-81db-66454f13cf90@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi Juergen,

On 14/12/2020 11:21, Jürgen Groß wrote:
> On 14.12.20 12:14, Julien Grall wrote:
>> Hi Juergen,
>>
>> On 14/12/2020 10:51, Jürgen Groß wrote:
>>> On 14.12.20 11:17, Julien Grall wrote:
>>>> Hi Juergen,
>>>>
>>>> On 14/12/2020 07:56, Juergen Gross wrote:
>>>>> Add support to run a function in an exception handler for Arm. Do it
>>>>> the same way as on x86 via a bug_frame.
>>>>>
>>>>> Unfortunately inline assembly on Arm seems to be less capable than on
>>>>> x86, leading to functions called via run_in_exception_handler() having
>>>>> to be globally visible.
>>>>
>>>> Jan already commented on this, so I am not going to comment again.
>>>
>>> Maybe I can ask some Arm specific question related to this:
>>>
>>> In my experiments the only working solution was using the "i" constraint
>>> for the function pointer. Do you know whether this is supported for all
>>> gcc versions we care about?
>>
>> I don't know for sure. However, Linux has been using "i" since 2012. 
>> So I would assume it ought to be fine for all the version we care.
>>
>>>
>>> Or is there another way to achieve the desired functionality? I'm using
>>> now the following macros:
>>>
>>> #define BUG_FRAME_run_fn(fn) do {                                      \
>>>      asm 
>>> ("1:"BUG_INSTR"\n"                                             \
>>>           ".pushsection .bug_frames." 
>>> __stringify(BUGFRAME_run_fn)      \
>>>                         ", \"a\", 
>>> %%progbits\n"                         \
>>>           
>>> "2:\n"                                                        \
>>>           ".p2align 
>>> 2\n"                                                \
>>>           ".long (1b - 
>>> 2b)\n"                                           \
>>>           ".long (%0 - 
>>> 2b)\n"                                           \
>>>           ".long 
>>> 0\n"                                                   \
>>>           ".hword 0, 
>>> 0\n"                                               \
>>>           ".popsection" :: "i" 
>>> (fn));                                   \
>>> } while (0)
>>
>> May I ask why we need a new macro?
> 
> Using a common one might be possible, but not with the current way how
> BUG_FRAME() is defined: gcc complained about the input parameter in case
> of ASSERT() and WARN().

Could you share the code and the error message?

> 
> I might be missing something, but this was the fastest way to at least
> confirm the scheme is working for Arm.

Make senses. I also don't have much time to invest in trying to have a 
common macro. So I am happy with a new macro.

Cheers,

-- 
Julien Grall

