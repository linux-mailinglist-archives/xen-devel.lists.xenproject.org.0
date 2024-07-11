Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F2E92E879
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jul 2024 14:44:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.757440.1166359 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRt9t-0004IP-82; Thu, 11 Jul 2024 12:44:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 757440.1166359; Thu, 11 Jul 2024 12:44:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRt9t-0004Gf-5W; Thu, 11 Jul 2024 12:44:25 +0000
Received: by outflank-mailman (input) for mailman id 757440;
 Thu, 11 Jul 2024 12:44:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sRt9r-0004GZ-Ej
 for xen-devel@lists.xenproject.org; Thu, 11 Jul 2024 12:44:23 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sRt9p-00010l-Di; Thu, 11 Jul 2024 12:44:21 +0000
Received: from [15.248.3.91] (helo=[10.24.67.27])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sRt9p-000218-4e; Thu, 11 Jul 2024 12:44:21 +0000
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
	bh=JVUd8+2S+TWxH1oy8NbKiUj81nTRD5fRSh9U/d5TrkA=; b=faYF5HTyY7kCBolcOa28AvZ3rP
	++em/Gs9lqOTESdhChM496oIciDkr1x5YOgL+Z9IZH2FmcSs10ZmscT+muL2y1W3SKrsaiO/5M2Il
	0qBpOgW8wGr1Tsh6tYXPRtvHis/yq0Kq4ZUJHGUGuTlRYQmyeNjGsYmgZuFs7/w2fc1o=;
Message-ID: <5de15734-29eb-42e0-b6c9-f6d734222b59@xen.org>
Date: Thu, 11 Jul 2024 13:44:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 5/5] xen/riscv: map FDT
Content-Language: en-GB
To: Oleksii <oleksii.kurochko@gmail.com>, Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1720002425.git.oleksii.kurochko@gmail.com>
 <7e492df051c949744755a221c0448c740d2c681b.1720002425.git.oleksii.kurochko@gmail.com>
 <3afd94c0-25f4-4ed8-83d2-6f261b8a64b3@suse.com>
 <021d29540f8e9abec118e9ca9dcd9675310eda84.camel@gmail.com>
 <9592e857-bf1c-4e26-acd7-dfb5bb12103e@suse.com>
 <fda966116ce17b9be0b1a467bd31436a6b5ad225.camel@gmail.com>
 <e58a9128-efdd-4bff-9562-08d5605d0a13@suse.com>
 <040e6b1d9b8bbe2b316e0e5b891c2564df28335d.camel@gmail.com>
 <5c6fbbbf-f6bf-43b3-9628-a92c69e3adb1@xen.org>
 <80864cdf9b6deb31b6e745c45a54a73c9a86ef65.camel@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <80864cdf9b6deb31b6e745c45a54a73c9a86ef65.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Oleksii,

On 11/07/2024 13:29, Oleksii wrote:
> On Thu, 2024-07-11 at 12:54 +0100, Julien Grall wrote:
>> Hi,
>>
>> On 11/07/2024 12:28, Oleksii wrote:
>>> Add Julien as he asked basically the same question in another
>>> thread.
>>
>> Thanks!
>>
>>>
>>> On Thu, 2024-07-11 at 12:50 +0200, Jan Beulich wrote:
>>>> On 11.07.2024 12:26, Oleksii wrote:
>>>>> On Thu, 2024-07-11 at 11:54 +0200, Jan Beulich wrote:
>>>>>> On 11.07.2024 11:40, Oleksii wrote:
>>>>>>> On Wed, 2024-07-10 at 14:38 +0200, Jan Beulich wrote:
>>>>>>>> On 03.07.2024 12:42, Oleksii Kurochko wrote:
>>>>> Does it make sense now?
>>>>
>>>> I think so, yet at the same time it only changes the question:
>>>> Why is
>>>> it
>>>> that you absolutely need to use setup_initial_mapping()?
>>> There is no strict requirement to use setup_initial_mapping(). That
>>> function is available to me at the moment, and I haven't found a
>>> better
>>> option other than reusing what I currently have.
>>
>> I am not very familiar with the code base for RISC-V, but looking at
>> the
>> context in the patch, it seems you will still have the identity
>> mapping
>> mapped until start_xen().
> We have identity mapping only for a small piece of .text section:
>          . = ALIGN(IDENT_AREA_SIZE);
>          _ident_start = .;
>          *(.text.ident)
>          _ident_end = .;
> 
> All other will be identically mapped only in case of linker address is
> equal to load address.
> 
>>
>> I assume we don't exactly know where the loader will put Xen in
>> memory.
>> Which means that the region may clash with your defined runtime
>> regions
>> (such as the FDT). Did I misunderstand anything?
> I am not really get what is the issue here.
> 
> If we are speaking about physical regions then loader will guarantee
> that Xen and FDT regions don't overlap.

Sure. But I was referring to...

> 
> If we are speaking about virtual regions then Xen will check that
> nothing is overlaped. 

... this part. The more regions you mapped with MMU off, the more work 
you have to do to ensure nothing will clash.

> And the virtual regions are mapped so high so I
> am not sure that loader will put something there. ( FDT in Xen is
> mapped to 0xffffffffc0200000 )
Never say never :). On Arm, some 64-bit HW (such as ADLink AVA platform) 
has the RAM starting very high and load Xen around 8TB. For Arm, we 
still decided to put a limit (10TB) where Xen can be loaded but this is 
mainly done for convenience (otherwise it is a bit more complicated to 
get off the identity mapping).

We still have a check in place to ensure that Xen is not loaded above 
10TB. If you map the FDT within the same L1.

Cheers,

-- 
Julien Grall

