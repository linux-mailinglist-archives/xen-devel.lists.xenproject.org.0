Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD376A82AA
	for <lists+xen-devel@lfdr.de>; Thu,  2 Mar 2023 13:52:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.504915.777363 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXiP2-0004Pk-Uo; Thu, 02 Mar 2023 12:51:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 504915.777363; Thu, 02 Mar 2023 12:51:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXiP2-0004N3-Qt; Thu, 02 Mar 2023 12:51:20 +0000
Received: by outflank-mailman (input) for mailman id 504915;
 Thu, 02 Mar 2023 12:51:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pXiP1-0004Mx-L2
 for xen-devel@lists.xenproject.org; Thu, 02 Mar 2023 12:51:19 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pXiOx-0000iE-Fx; Thu, 02 Mar 2023 12:51:15 +0000
Received: from [15.248.2.148] (helo=[10.24.67.20])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pXiOx-0006G0-AR; Thu, 02 Mar 2023 12:51:15 +0000
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
	bh=hi9+gQYfUO0KmeK6n2NeKErt/KbOrlAULOXRqf6HaLk=; b=LW8EbIzKSRxPJn8cpJdOHx+k+5
	nMoatB9KysNg/Avy0fZittFjCmRBjF+MM+4PUCIFL5W+m54S3iVzxk5fg+apVSTZpMcfvUKwSz/d5
	D7ygHCOxVQG552z0JfrsfC+uJxTb0LHQo7DGmc3ftKCzUglXSWUD+ymp4At9Uoz77xW0=;
Message-ID: <27d8bd98-1c71-61d4-e22e-159e01542151@xen.org>
Date: Thu, 2 Mar 2023 12:51:12 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v1] xen/arm: align *(.proc.info) in the linker script
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>, Oleksii <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <74973920d8722df3ce533979314564f331acf16e.1677687247.git.oleksii.kurochko@gmail.com>
 <370809af-75e6-546a-53e4-71a76444f367@xen.org>
 <a9c2638cd8620d74ec719845132ef65f08b4c934.camel@gmail.com>
 <cf15b113-ac6f-e115-6c38-38b25a265934@xen.org>
 <f2f6544a-a59e-2e10-0b8f-080f91708459@xen.org>
 <9e34f587-d42d-3709-9c64-b5e50afdd046@suse.com>
 <7e69d61b-60ca-b93a-36d3-77a1a3e550ec@xen.org>
 <0c401165-6057-2a4c-249a-be877741180b@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <0c401165-6057-2a4c-249a-be877741180b@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 02/03/2023 11:21, Jan Beulich wrote:
> On 02.03.2023 12:01, Julien Grall wrote:
>> On 02/03/2023 09:45, Jan Beulich wrote:
>>> On 01.03.2023 21:38, Julien Grall wrote:
>>>> I managed to reproduce it. It looks like that after your bug patch,
>>>> *(.rodata.*) will not be end on a 4-byte boundary. Before your patch,
>>>> all the messages will be in .rodata.str. Now they are in .bug_frames.*,
>>>> so there some difference in .rodata.*.
>>>
>>> Strings in .bug_frames.*? This sounds like a mistake, which - if indeed
>>> the case - will want investigating before the conversion series is
>>> actually considered for committing.
>>
>> No. I misread the code. But there are definitely a difference in size:
>>
>> Before:
>>
>> Section Headers:
>>     [Nr] Name              Type            Addr     Off    Size   ES Flg
>> Lk Inf Al
>>     [ 0]                   NULL            00000000 000000 000000 00
>> 0   0  0
>>     [ 1] .text             PROGBITS        00200000 008000 07e7a8 00 WAX
>> 0   0 32
>>     [ 2] .rodata           PROGBITS        0027f000 087000 02acc8 00   A
>> 0   0 16
>> [...]
>> After:
>>
>>     [Nr] Name              Type            Addr     Off    Size   ES Flg
>> Lk Inf Al
>>     [ 0]                   NULL            00000000 000000 000000 00
>> 0   0  0
>>     [ 1] .text             PROGBITS        00200000 008000 07e670 00 WAX
>> 0   0 32
>>     [ 2] .rodata           PROGBITS        0027f000 087000 02b3e8 00   A
>> 0   0 16
> 
> I still find this concerning (as in: at least needing explanation), as
> the bug frame representation shrinks in size: Entries for assertions
> remain to be 4 ".long"-s, while all other entries use only two now. So
> in a release build the size of all .bug_frame.* together should halve,
> while in debug builds it should shrink at least some. And Oleksii's
> series doesn't add meaningful other contributions to .rodata, iirc.

Doh, I inverted the two tables. So .rodata is shrinking but .txt is 
slightly increasing.

Cheers,

-- 
Julien Grall

