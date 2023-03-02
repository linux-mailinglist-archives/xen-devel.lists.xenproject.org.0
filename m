Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4786A84A2
	for <lists+xen-devel@lfdr.de>; Thu,  2 Mar 2023 15:50:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.504978.777463 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXkFw-0006wF-Ub; Thu, 02 Mar 2023 14:50:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 504978.777463; Thu, 02 Mar 2023 14:50:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXkFw-0006sA-Qv; Thu, 02 Mar 2023 14:50:04 +0000
Received: by outflank-mailman (input) for mailman id 504978;
 Thu, 02 Mar 2023 14:50:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pXkFu-0006ZR-TF
 for xen-devel@lists.xenproject.org; Thu, 02 Mar 2023 14:50:02 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pXkFu-0003YH-H0; Thu, 02 Mar 2023 14:50:02 +0000
Received: from [15.248.2.148] (helo=[10.24.67.20])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pXkFu-0003Hk-BY; Thu, 02 Mar 2023 14:50:02 +0000
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
	bh=5fe8Zad2At3QNtgzV6CN27Y1npXSjdEYhVSLoYTF1TA=; b=SERxtXvpHGISyJozv4vW5EXu6k
	M/sAzfO3cV6JylVih8lxeZjuxSTmUqVDuvjJ6uAGeoIqRmMlZgtOoIYGO1wyttKjCAbpCgbHeIiyU
	MIvd6hlaqsMQGpOLhAtyeyPeuwIVg9wLacI6yztPaoI9v5O5kKJ4nIGDXgXWws2hArdY=;
Message-ID: <ab953ad7-0345-ce60-610d-02b6f4b26398@xen.org>
Date: Thu, 2 Mar 2023 14:50:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v1] xen/arm: align *(.proc.info) in the linker script
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <74973920d8722df3ce533979314564f331acf16e.1677687247.git.oleksii.kurochko@gmail.com>
 <370809af-75e6-546a-53e4-71a76444f367@xen.org>
 <a9c2638cd8620d74ec719845132ef65f08b4c934.camel@gmail.com>
 <cf15b113-ac6f-e115-6c38-38b25a265934@xen.org>
 <f2f6544a-a59e-2e10-0b8f-080f91708459@xen.org>
 <472fee066070db9cb3c662bf5cc6f8cb681aeb1b.camel@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <472fee066070db9cb3c662bf5cc6f8cb681aeb1b.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Oleksii,

On 02/03/2023 07:34, Oleksii wrote:
> Hi Julien,
>>>> On Wed, 2023-03-01 at 16:21 +0000, Julien Grall wrote:
>>>>> Hi Oleksii,
>>>>>
>>>>> On 01/03/2023 16:14, Oleksii Kurochko wrote:
>>>>>> During testing of bug.h's macros generic implementation
>>>>>> yocto-
>>>>>> qemuarm
>>>>>> job crashed with data abort:
>>>>>
>>>>> The commit message is lacking some information. You are telling
>>>>> us
>>>>> that
>>>>> there is an error when building with your series, but this
>>>>> doesn't
>>>>> tell
>>>>> me why this is the correct fix.
>>>>>
>>>>> This is also why I asked to have the xen binary because I want
>>>>> to
>>>>> check
>>>>> whether this was a latent bug in Xen or your series effectively
>>>>> introduce a bug.
>>>>>
>>>>> Note that regardless what I just wrote this is a good idea to
>>>>> align
>>>>> __proc_info_start. I will try to have a closer look later and
>>>>> propose
>>>>> a
>>>>> commit message and/or any action for your other series.
>>>> Regarding binaries please take a look here:
>>>> https://lore.kernel.org/xen-devel/aa2862eacccfb0574859bf4cda8f4992baa5d2e1.camel@gmail.com/
>>>>
>>>> I am not sure if you get my answer as I had the message from
>>>> delivery
>>>> server that it was blocked for some reason.
>>>
>>> I got the answer. The problem now is gitlab only keep the artifact
>>> for
>>> the latest build and it only provide a zImage (having the ELF would
>>> be
>>> easier).
>>>
>>> I will try to reproduce the error on my end.
>>
>> I managed to reproduce it. It looks like that after your bug patch,
>> *(.rodata.*) will not be end on a 4-byte boundary. Before your patch,
>> all the messages will be in .rodata.str. Now they are in
>> .bug_frames.*,
>> so there some difference in .rodata.*.
>>
>> That said, it is not entirely clear why we never seen the issue
>> before
>> because my guessing there are no guarantee that .rodata.* will be
>> suitably aligned.
>>
>> Anyway, here a proposal for the commit message:
>>
>> "
>> xen/arm: Ensure the start *(.proc.info) of is 4-byte aligned
>>
>> The entries in *(.proc.info) are expected to be 4-byte aligned and
>> the
>> compiler will access them using 4-byte load instructions. On Arm32,
>> the
>> alignment is strictly enforced by the processor and will result to a
>> data abort if it is not correct.
>>
>> However, the linker script doesn't encode this requirement. So we are
>> at
>> the mercy of the compiler/linker to have aligned the previous
>> sections
>> suitably.
>>
>> This was spotted when trying to use the upcoming generic bug
>> infrastructure with the compiler provided by Yocto.
>>
>> Link:
>> https://lore.kernel.org/xen-devel/6735859208c6dcb7320f89664ae298005f70827b.camel@gmail.com/
>> "
>>
>> If you are happy with the proposed commit message, then I can update
>> it
>> while committing.
> I am happy with the proposed commit message.

Thanks. With that:

Reviewed-by: Julien Grall <jgrall@amazon.com>

I have addressed Jan's comment and committed the patch.

Cheers,

-- 
Julien Grall

