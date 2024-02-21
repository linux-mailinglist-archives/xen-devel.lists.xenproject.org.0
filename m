Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 799EC85DDA8
	for <lists+xen-devel@lfdr.de>; Wed, 21 Feb 2024 15:08:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684057.1063722 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcnGd-00030G-Ts; Wed, 21 Feb 2024 14:08:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684057.1063722; Wed, 21 Feb 2024 14:08:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcnGd-0002x6-Qw; Wed, 21 Feb 2024 14:08:11 +0000
Received: by outflank-mailman (input) for mailman id 684057;
 Wed, 21 Feb 2024 14:08:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rcnGc-0002x0-2z
 for xen-devel@lists.xenproject.org; Wed, 21 Feb 2024 14:08:10 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rcnGT-0005BU-RU; Wed, 21 Feb 2024 14:08:01 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.14.101]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rcnGT-0002qM-9O; Wed, 21 Feb 2024 14:08:01 +0000
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
	bh=tqftxFxC3TX3Acmbj0snE5eMI1bwehitJaMwlEaMN9o=; b=dG0gBKp9+sl5m48GfzDQOtv6/0
	VvvlKaQCnwRX33e93gWeBsvnXg6O0O0LJsciNcKoMlpxcQ+rCEvH36ibXVyz5OCEN2tQaKqsE/z7D
	HwCh/TyJe63raPhunYZR8gf5Kds9tJchiTbNWFBs80VOjo6oSG7AQKx97JxWmGJJNn+4=;
Message-ID: <eeb48ddf-6925-4394-8d5a-288ba23e55d3@xen.org>
Date: Wed, 21 Feb 2024 14:07:57 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/30] xen/asm-generic: introdure nospec.h
Content-Language: en-GB
To: Oleksii <oleksii.kurochko@gmail.com>, Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1707146506.git.oleksii.kurochko@gmail.com>
 <5889d7a5fa81722472f95cc1448af0be8f359a7d.1707146506.git.oleksii.kurochko@gmail.com>
 <510d74ca-5cce-48f8-93f6-407cd727cf7b@xen.org>
 <8a09e386b709f780f193af39af63b6aeb75c868e.camel@gmail.com>
 <aaf86d31-7ae0-4e33-8386-dda4bd21496a@suse.com>
 <ab040f3c8ee35f49fffac385053b55053c52da8c.camel@gmail.com>
 <a6394d8a-63d0-42bf-8ed7-a7722cb7e71c@suse.com>
 <3e0c83fd0e3dc424059575cf9da9d57a87d90736.camel@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <3e0c83fd0e3dc424059575cf9da9d57a87d90736.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Oleksii,

On 21/02/2024 12:47, Oleksii wrote:
> On Wed, 2024-02-21 at 12:00 +0100, Jan Beulich wrote:
>> On 20.02.2024 21:30, Oleksii wrote:
>>> On Mon, 2024-02-19 at 13:18 +0100, Jan Beulich wrote:
>>>> On 19.02.2024 12:59, Oleksii wrote:
>>>>> Hi Julien,
>>>>>
>>>>> On Sun, 2024-02-18 at 18:30 +0000, Julien Grall wrote:
>>>>>> Hi Oleksii,
>>>>>>
>>>>>> Title: Typo s/introdure/introduce/
>>>>>>
>>>>>> On 05/02/2024 15:32, Oleksii Kurochko wrote:
>>>>>>> The <asm/nospec.h> header is similar between Arm, PPC, and
>>>>>>> RISC-V,
>>>>>>> so it has been moved to asm-generic.
>>>>>>
>>>>>> I am not 100% convinced that moving this header to asm-
>>>>>> generic is
>>>>>> a
>>>>>> good
>>>>>> idea. At least for Arm, those helpers ought to be non-empty,
>>>>>> what
>>>>>> about
>>>>>> RISC-V?
>>>>> For Arm, they are not taking any action, are they? There are no
>>>>> specific fences or other mechanisms inside
>>>>> evaluate_nospec()/block_speculation() to address speculation.
>>>>
>>>> The question isn't the status quo, but how things should be
>>>> looking
>>>> like
>>>> if everything was in place that's (in principle) needed.
>>>>
>>>>> For RISC-V, it can be implemented in a similar manner, at least
>>>>> for
>>>>> now. Since these functions are only used in the grant tables
>>>>> code (
>>>>> for
>>>>> Arm and so for RISC-V ), which is not supported by RISC-V.
>>>>
>>>> Same here - the question is whether long term, when gnttab is
>>>> also
>>>> supported, RISC-V would get away without doing anything. Still
>>>> ...
>>>>
>>>>>> If the answer is they should be non-empty. Then I would
>>>>>> consider
>>>>>> to
>>>>>> keep
>>>>>> the duplication to make clear that each architecture should
>>>>>> take
>>>>>> their
>>>>>> own decision in term of security.
>>>>>>
>>>>>> The alternative, is to have a generic implementation that is
>>>>>> safe
>>>>>> by
>>>>>> default (if that's even possible).
>>>>> I am not certain that we can have a generic implementation, as
>>>>> each
>>>>> architecture may have specific speculation issues.
>>>>
>>>> ... it's theoretically possible that there'd be an arch with no
>>>> speculation issues, maybe simply because of not speculating.
>>>
>>> I am not sure that understand your and Julien point.
>>>
>>> For example, modern CPU uses speculative execution to reduce the
>>> cost
>>> of conditional branch instructions using schemes that predict the
>>> execution path of a program based on the history of branch
>>> executions.
>>>
>>> Arm CPUs are vulnerable for speculative execution, but if to look
>>> at
>>> the code of evaluate_nospec()/block_speculation() functions they
>>> are
>>> doing nothing for Arm.
>>
>> Which, as I understood Julien say, likely isn't correct. In which
>> case
>> this header shouldn't be dropped, using the generic one instead. The
>> generic headers, as pointed out several times before, should imo be
>> used
>> only if their use results in correct behavior. What is acceptable is
>> if
>> their use results in sub-optimal behavior (e.g. reduced performance
>> or
>> lack of a certain feature that another architecture maybe
>> implements).
> 
> As I understand it, evaluate_nospec()/block_speculation() were
> introduced for x86 to address the L1TF vulnerability specific to x86
> CPUs. This vulnerability is exclusive to x86 architectures [1], which
> explains why evaluate_nospec()/block_speculation() are left empty for
> Arm, RISC-V, and PPC.
> 
> It is unclear whether these functions should be utilized to mitigate
> other speculation vulnerabilities. 

The name is generic enough that someone may want to use it for other 
speculations. If we think this is only related to L1TF, then the 
functions names should reflect it. But see below.

> If they should, then, based on the
> current implementation, the Arm platform seems to accept having
> speculative vulnerabilities.

Looking at some of the use in common code (such as the grant-table 
code), it is unclear to me why it is empty on Arm. I think we need a 
speculation barrier.

I would raise the same question for RISC-V/PPC.

> 
> The question arises: why can't other architectures make their own
> decisions regarding security? 

Each architecture can make there own decision. I am not trying to 
prevent that. What I am trying to prevent is a developper including the 
asm-generic without realizing that the header doesn't provide a safe 
version.

> By default, if an architecture leaves the
> mentioned functions empty, it implies an agreement to potentially have
> speculative vulnerabilities. 

See above. That agreement is somewhat implicit. It would be better if 
this is explicit.

So overall, I would prefer if that header is not part of asm-generic.

Cheers,

-- 
Julien Grall

