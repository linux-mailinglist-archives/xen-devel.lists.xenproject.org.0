Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D81156B539
	for <lists+xen-devel@lfdr.de>; Fri,  8 Jul 2022 11:20:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.363325.593823 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9k9h-0007tA-Lp; Fri, 08 Jul 2022 09:20:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 363325.593823; Fri, 08 Jul 2022 09:20:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9k9h-0007qc-Iu; Fri, 08 Jul 2022 09:20:09 +0000
Received: by outflank-mailman (input) for mailman id 363325;
 Fri, 08 Jul 2022 09:20:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o9k9f-0007qW-MR
 for xen-devel@lists.xenproject.org; Fri, 08 Jul 2022 09:20:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o9k9f-00086A-FK; Fri, 08 Jul 2022 09:20:07 +0000
Received: from [54.239.6.184] (helo=[192.168.18.9])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o9k9f-0002Sw-87; Fri, 08 Jul 2022 09:20:07 +0000
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
	bh=02zGjGqIEgMmwVZSBmY2xHaXjzCoDvLOWcBYaDLbwrg=; b=14KTACfTSDqwRY9aNp7eNd9pzG
	BET9SFcmDq8IVC6LnBdkxZ/I4J6ryGCOlT0Esi1azLxKCnGIuDMftfWuEb8XWpV87iegbmS9sflbh
	Ak8v37Vlp2qrOcjkYzxVJAKl7BLFwHP/HVQoypHyOfAMQelnJBzLOU+Iq9IOkmQpB/YA=;
Message-ID: <d7ede469-aead-10be-ff7e-087e7bbfb6e6@xen.org>
Date: Fri, 8 Jul 2022 10:20:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH 2/2] automation: arm64: Create a test job for testing
 static allocation on qemu
To: Xenia Ragiadakou <burzalodowa@gmail.com>, xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20220707203803.798317-1-burzalodowa@gmail.com>
 <20220707203803.798317-3-burzalodowa@gmail.com>
 <259c9042-4a40-ddd3-5e3c-7a1698df74c4@xen.org>
 <c46137a2-d65c-3292-6e1c-8578e771f3b9@gmail.com>
 <418ffeb7-a088-28e8-c1b3-8f5ced317666@xen.org>
 <a297d370-131a-6be2-ce1b-ab21d3352edf@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <a297d370-131a-6be2-ce1b-ab21d3352edf@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 08/07/2022 10:00, Xenia Ragiadakou wrote:
>>>>> +
>>>>> +(grep -q "Xen dom0less mode detected" qemu-staticmem.serial) || 
>>>>> exit 1
>>>>> +
>>>>> +for ((i=0; i<${#base[@]}; i++))
>>>>> +do
>>>>> +    start="$(printf "0x%016x" ${base[$i]})"
>>>>> +    end="$(printf "0x%016x" $((${base[$i]} + ${size[$i]} - 1)))"
>>>>> +    grep -q "node   0: \[mem ${start}-${end}\]" qemu-staticmem.serial
>>>>> +    if test $? -eq 1
>>>>> +    then
>>>>> +        exit 1
>>>>> +    fi
>>>>> +done
>>>>
>>>> Please add a comment on top to explain what this is meant to do. 
>>>> However, I think we should avoid relying on output that we have 
>>>> written ourself. IOW, relying on Xen/Linux to always write the same 
>>>> message is risky because they can change at any time.
>>>
>>> The kernel is taken from a test-artifact container, so, IIUC, it 
>>> won't change.
>>
>> This statement is correct today. However, we may decide to update the 
>> kernel or test multiple kernels (with different ouput).
>>
>> In the first case, it would be a matter of updating the script. This 
>> is annoying but not too bad. In the second case, we would need to have 
>> "if version X ... else if version Y ... ".
> 
> The particular test was relying and had a dependency on this kernel.
I think you missed my point. I don't disagree that the test today 
expects a specific version. However, there are nothing preventing us to 
change that so we long we have a matching initramfs/kernel.

> If the test is merged into the qemu-smoke-arm64.sh, the check above will 
> leave and it will be tested whether the guest makes it to the busybox, 
> based on the busybox logs, which also may change at any time.

I don't think I suggested that relying on busybox is better. Ideally we 
should run a script that prints a message.

But this is not something I am going to argue for in this patch. Relying 
on one piece of line is already far better than trying to check logs for 
each components (e.g. xen, kernel, busysbox).

Cheers,

-- 
Julien Grall

