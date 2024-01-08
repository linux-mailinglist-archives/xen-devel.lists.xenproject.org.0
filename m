Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0218271FB
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jan 2024 15:57:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.663569.1033540 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMr4J-0004pj-On; Mon, 08 Jan 2024 14:57:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 663569.1033540; Mon, 08 Jan 2024 14:57:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMr4J-0004nt-Lo; Mon, 08 Jan 2024 14:57:35 +0000
Received: by outflank-mailman (input) for mailman id 663569;
 Mon, 08 Jan 2024 14:57:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rMr4H-0004mT-S0
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2024 14:57:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rMr4G-00072U-BX; Mon, 08 Jan 2024 14:57:32 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rMr4G-00081F-5L; Mon, 08 Jan 2024 14:57:32 +0000
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
	bh=iTvJJXgZjPGL1LLFQRwP7WawlnG3NAZaAAqcxCo9tlw=; b=Ily7u+/7/nEjMEGNv5nYgi17oB
	LYJNjcAbPw0b9fzu5B6Zw9SlpaFivxUjF4jfTZmZ3ZQFoOW7/2U8jghggp8+HsV2RssXKbMaC9Zo2
	Oy1Ero2v28WQRb1hnbpeWEgLhVWY8zW0jpZPQmKJys1BqfsniBEPFkR/3v1ngJRwZD0Y=;
Message-ID: <f54bd4a4-0bc6-490d-a990-46c62b0d10a3@xen.org>
Date: Mon, 8 Jan 2024 14:57:30 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] NUMA: limit first_valid_mfn exposure
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <224db25e-bd4c-4415-aff8-6ff3e84343d8@suse.com>
 <a99d9d1a-2395-4771-95f3-5dab64e10ce7@xen.org>
 <0872306a-fefb-424b-b27a-b67ba21828c7@suse.com>
 <829125ea-c220-47e9-a9f4-343126787f27@xen.org>
 <6889e19d-c6d4-43f0-9752-738d2a54e311@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <6889e19d-c6d4-43f0-9752-738d2a54e311@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 08/01/2024 14:47, Jan Beulich wrote:
> On 08.01.2024 15:13, Julien Grall wrote:
>> Hi Jan,
>>
>> On 08/01/2024 11:43, Jan Beulich wrote:
>>> On 08.01.2024 12:37, Julien Grall wrote:
>>>> On 08/01/2024 11:31, Jan Beulich wrote:
>>>>> Address the TODO regarding first_valid_mfn by making the variable static
>>>>> when NUMA=y, thus also addressing a Misra C:2012 rule 8.4 concern (on
>>>>> x86).
>>>>>
>>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>> ---
>>>>> Julien suggests something like
>>>>>
>>>>> STATIC_IF(CONFIG_NUMA) unsigned long first_valid_mfn;
>>>>>
>>>>> but I view this as non-scalable (or at least I can't see how to
>>>>> implement such in a scalabale way) and hence undesirable to introduce.
>>>>
>>>> I don't really see the scalability problem. Can you explain a bit more?
>>>
>>> Well, when seeing your original suggestion, I first considered it quite
>>> reasonable. But when thinking how to implement it, I couldn't see what
>>>
>>> #define STATIC_IF(cfg)
>>>
>>> should expand to. That's simply because a macro body cannot itself have
>>> pre-processor directives. Hence all I could think of was
>>>
>>> #ifdef CONFIG_NUMA
>>> # define static_if_CONFIG_NUMA static
>>> #else
>>> # define static_if_CONFIG_NUMA
>>> #endif
>>> #define STATIC_IF(cfg) static_if_ ## cfg
>>>
>>> And I think it is easy to see how this wouldn't scale across CONFIG_xyz.
>>> Plus that that point STATIC_IF() itself would be pretty much redundant.
>>> But maybe I'm simply overlooking the obvious ...
>>
>> You can use the same trick as for IS_ENABLED. The code below will select
>> static or nothing:
>>
>> #define static_enabled(cfg) _static_enabled(cfg)
>> #define _static_enabled(value) __static_enabled(__ARG_PLACEHOLDER_##value)
>> #define __static_enabled(arg1_or_junk) ___static_enabled(arg1_or_junk
>> static,)
>> #define ___static_enabled(__ignored, val, ...) val
>>
>> #define STATIC_IF(option) static_enabled(option)
>>
>> I have tested both with CONFIG_NUMA and !CONFIG_NUMA to confirm the
>> visibility of the variable will be correct.
> 
> Hmm, okay. Then my 2nd scalability concern, in another dimension: What
> if static-ness ends up depending on two (or more) CONFIG_*?

Do you have any concrete example where this would be useful? If not, 
then I suggest to go with this solution and we can cross the bridge when 
we have an example.

We don't have to solve everything at once and at least with the approach 
I proposed we can start to use STATIC_IF() (or EXTERN_IF) a bit more 
often without open-coding it.

Cheers,


-- 
Julien Grall

