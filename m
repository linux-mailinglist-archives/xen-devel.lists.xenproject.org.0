Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70ED86A69D5
	for <lists+xen-devel@lfdr.de>; Wed,  1 Mar 2023 10:31:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.503912.776322 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXInu-0002dK-GQ; Wed, 01 Mar 2023 09:31:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 503912.776322; Wed, 01 Mar 2023 09:31:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXInu-0002bP-DD; Wed, 01 Mar 2023 09:31:18 +0000
Received: by outflank-mailman (input) for mailman id 503912;
 Wed, 01 Mar 2023 09:31:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pXIns-0002ak-Ce
 for xen-devel@lists.xenproject.org; Wed, 01 Mar 2023 09:31:16 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pXInr-0001tS-R3; Wed, 01 Mar 2023 09:31:15 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.13.48]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pXInr-0004yL-Ic; Wed, 01 Mar 2023 09:31:15 +0000
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
	bh=vyPrgYJtpIQ29fZngSepxLvEwIvazQBTjmg9qMO/gLY=; b=YSrsbJdWjKjm9xZfHRn4+LL53Q
	tT1p5SvGTrvVThqJ/hrKaPDj43R+yN1NjJgUFZYvv27P/5wbUJHBlVQPSGtt2mkpqBKJsBnqiLzsy
	o7buf8DeNfpEFlcMX9RBhDbRbLWCh9TzRgG/rJKlljLXYTcHGEi7/kUYDT6lzdW9aA80=;
Message-ID: <538020a3-07d2-391b-0fcc-4e4b4902d2f7@xen.org>
Date: Wed, 1 Mar 2023 09:31:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v3 3/4] xen/arm: switch ARM to use generic implementation
 of bug.h
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1677233393.git.oleksii.kurochko@gmail.com>
 <d80c136720c156d6ef83f27f1ce8dca5dba5b5a0.1677233393.git.oleksii.kurochko@gmail.com>
 <f82b8c50-47f2-d8b0-5a2c-60203e5d5e26@xen.org>
 <c0e628d744f03c70d2e7b66540ea27aa31d90043.camel@gmail.com>
 <46e96dd9-bcb4-4569-b282-05c019cabcc3@xen.org>
 <a2980d855cb11e447a794725163ff120d38fc127.camel@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <a2980d855cb11e447a794725163ff120d38fc127.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 01/03/2023 08:58, Oleksii wrote:
> On Tue, 2023-02-28 at 17:48 +0000, Julien Grall wrote:
>> Hi Oleksii,
>>
>> On 28/02/2023 15:09, Oleksii wrote:
>>> On Sat, 2023-02-25 at 16:49 +0000, Julien Grall wrote:
>>>> Hi Oleksii,
>>>>
>>>> On 24/02/2023 11:31, Oleksii Kurochko wrote:
>>>>> The following changes were made:
>>>>> * make GENERIC_BUG_FRAME mandatory for ARM
>>>>
>>>> I have asked in patch #1 but will ask it again because I think
>>>> this
>>>> should be recorded in the commit message. Can you outline why it
>>>> is
>>>> not
>>>> possible to completely switch to the generic version?
>>> I haven't tried to switch ARM too because of comment regarding 'i'
>>> in
>>> <asm/bug.h>:
>>> /*
>>>    * GCC will not allow to use "i"  when PIE is enabled (Xen doesn't
>>> set
>>> the
>>>    * flag but instead rely on the default value from the compiler).
>>> So
>>> the
>>>    * easiest way to implement run_in_exception_handler() is to pass
>>> the
>>> to
>>>    * be called function in a fixed register.
>>>    */
>>
>> I would expect this comment to be valid for any arch. So if there is
>> a
>> need to deal with PIE, then we would not be able to use "i" in the
>> BUG
>> frame.
>>
>> Note that we are now explicitly compiling Xen without PIE (see
>> Config.mk).
> Then it looks like some architectures isn't expected to be compiled
> with PIE. I mean that x86's bug.h is used 'i' and there is no any
> alternative version in case of PIE.
> 
> If Xen should be compilable with PIE then we have to use ARM
> implementation of bug.h everywhere. ( based on comment about 'i' with
> PIE ).

The comment was added because until commit ecd6b9759919 ("Config.mk: 
correct PIE-related option(s) in EMBEDDED_EXTRA_CFLAGS") we would let 
the compiler to decide whether PIE should be enabled.

Now we are forcing -fno-pie for Xen on any architecture (the flag is 
added at the top-level in Config.mk).

> 
> Now I am totally confused...

My point was not about using the Arm implementation everywhere. My point 
was that we disable even for Arm and therefore it is fine to use the 
common version.

If in the future we need to support PIE in Xen (I am not aware of any 
effort yet), then we could decide to update the common BUG framework. 
But for now, I don't think this is something you need to care in your 
series.

Cheers,

-- 
Julien Grall

