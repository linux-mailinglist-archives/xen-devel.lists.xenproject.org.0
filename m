Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E0C464B15
	for <lists+xen-devel@lfdr.de>; Wed,  1 Dec 2021 10:57:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.235761.408962 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msMMK-0005Zd-Jm; Wed, 01 Dec 2021 09:57:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 235761.408962; Wed, 01 Dec 2021 09:57:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msMMK-0005WU-GK; Wed, 01 Dec 2021 09:57:04 +0000
Received: by outflank-mailman (input) for mailman id 235761;
 Wed, 01 Dec 2021 09:57:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1msMMI-0005WO-Dm
 for xen-devel@lists.xenproject.org; Wed, 01 Dec 2021 09:57:02 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1msMME-0000hY-Di; Wed, 01 Dec 2021 09:56:58 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=[192.168.22.155]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1msMME-0006ZU-7e; Wed, 01 Dec 2021 09:56:58 +0000
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
	bh=Lz9iJr8Sjd51677hTafpiEnTaUg0E6yjSBhBIiWHg3g=; b=i3xG7jDbODkgnFt6/64ykFOv8e
	vsewmqvOh1chUYRJ8zb3D5GO86+x5gTCmsBHy6RClx7nicw7A560LWYyQwnCRIXjWbwt2sYDRWW91
	l/Lu6kmWTPpyr51jP+RV8aa+nc7qnOedfwLafhDEV0Uqf22l7vya7O+521Wqjn90k8mk=;
Message-ID: <959d50ef-2a4c-8850-4a89-7eff0b649a13@xen.org>
Date: Wed, 1 Dec 2021 09:56:56 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.2
Subject: Re: [PATCH v2] bitops: Fix incorrect value in comment
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, stefanos@xilinx.com, Volodymyr_Babchuk@epam.com,
 bertrand.marquis@arm.com, Ayan Kumar Halder <ayankuma@xilinx.com>,
 andre.przywara@arm.com, Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>,
 xen-devel@lists.xenproject.org
References: <20211130181238.5501-1-ayankuma@xilinx.com>
 <c018e9dc-5221-a7e8-3da9-ebdb2c88311b@xen.org>
 <3caf216e-95dd-97e1-b380-a31f5388dc86@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <3caf216e-95dd-97e1-b380-a31f5388dc86@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 01/12/2021 09:38, Jan Beulich wrote:
> On 01.12.2021 10:33, Julien Grall wrote:
>> On 30/11/2021 18:12, Ayan Kumar Halder wrote:
>>> --- a/xen/include/xen/bitops.h
>>> +++ b/xen/include/xen/bitops.h
>>> @@ -5,7 +5,7 @@
>>>    /*
>>>     * Create a contiguous bitmask starting at bit position @l and ending at
>>>     * position @h. For example
>>> - * GENMASK(30, 21) gives us the 32bit vector 0x01fe00000.
>>> + * GENMASK(30, 21) gives us the 32bit value 0x7fe00000.
>>
>> ... there are two extra changes here:
>>     1) The bitmask is now described with 8-characters (rather than 9)
>>     2) 'vector' is replaced with 'value'
>>
>> The former makes sense to me, but it is not clear to me why the latter
>> should be changed.
> 
> Would you mind explaining to me in which way you see "vector" accurately
> describe the entity talked about?

This can be seen as a vector of bit. I can see why people may think 
otherwise. However... if you think it doesn't describe it accurately, 
then I think this ought to be changed in Linux first (where the code and 
comment comes from).

> 
> I also think the commit message is quite fine as is.
IMHO, this is similar to when one do coding style change in a patch. 
They are unrelated but would be acceptable so long they are explained in 
the commit message.

What I request is something like:

"GENMASK(30, 21) should be 0x7fe00000 and only use 8-characters (it is a 
32-bit comment). Fixed this in the comment.

Take the opportunity to replace 'vector' with 'value' because..."

This is simple enough and clarify what is the intent of the patch.

Cheers,

-- 
Julien Grall

