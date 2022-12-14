Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD3064C593
	for <lists+xen-devel@lfdr.de>; Wed, 14 Dec 2022 10:10:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.461854.720010 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5Nm8-0006Pv-SX; Wed, 14 Dec 2022 09:10:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 461854.720010; Wed, 14 Dec 2022 09:10:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5Nm8-0006M6-Pc; Wed, 14 Dec 2022 09:10:04 +0000
Received: by outflank-mailman (input) for mailman id 461854;
 Wed, 14 Dec 2022 09:10:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p5Nm6-00065G-Q5
 for xen-devel@lists.xenproject.org; Wed, 14 Dec 2022 09:10:02 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p5Nm4-0003CE-Ol; Wed, 14 Dec 2022 09:10:00 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p5Nm4-0003qd-IK; Wed, 14 Dec 2022 09:10:00 +0000
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
	bh=JkujZxZJaKoOVKDxceTX6dLjhOzTugtyosrKFGID73U=; b=Ud0xicYTf+CSEljdw6zP7Chn0n
	Y3NBR6aNCnvCMj1v08IHgA3WdHipklvZPABFrw4tUa/x6HNAxYh+rJGGg1AjJmSLRR9DYqNfio1hH
	qXB9DZNY7qlDoH+a9aUFwLpofnplZSHRl2HPwZpOeJQn1112ErbRrt+SoXSwF2qB5BAQ=;
Message-ID: <ce49d2e8-294a-18d0-c094-dd352dca1936@xen.org>
Date: Wed, 14 Dec 2022 09:09:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [RFC 3/4] Add xen superpage splitting support to arm
Content-Language: en-US
To: Demi Marie Obenour <demi@invisiblethingslab.com>,
 "Smith, Jackson" <rsmith@riversideresearch.org>
Cc: "Brookes, Scott" <sbrookes@riversideresearch.org>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "bertrand.marquis@arm.com" <bertrand.marquis@arm.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 "christopher.w.clark@gmail.com" <christopher.w.clark@gmail.com>
References: <BN0P110MB1642835E0DE845205B5EA59CCFE39@BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM>
 <BN0P110MB1642CCC518921DC7F2BB3BB3CFE39@BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM>
 <c8f9e15a-81d1-ef8c-0baf-1758e7d89eee@xen.org> <Y5j5/qinMwxizxMc@itl-email>
 <dd6a05d5-5c3d-7a65-9951-b9c0aabadc81@xen.org> <Y5kpFMp38Yg7If/Y@itl-email>
From: Julien Grall <julien@xen.org>
In-Reply-To: <Y5kpFMp38Yg7If/Y@itl-email>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Demi,

On 14/12/2022 01:38, Demi Marie Obenour wrote:
> On Tue, Dec 13, 2022 at 11:07:55PM +0000, Julien Grall wrote:
>> Hi Demi,
>>
>> On 13/12/2022 22:17, Demi Marie Obenour wrote:
>>> On Tue, Dec 13, 2022 at 09:15:49PM +0000, Julien Grall wrote:
> 
> [snip]
> 
>>>>> +
>>>>> +    /*
>>>>> +     * Generate the entry for this new table we created,
>>>>> +     * and write it back in place of the superpage entry.
>>>>> +     */
>>>>
>>>> I am afraid this is not compliant with the Arm Arm. If you want to update
>>>> valid entry (e.g. shattering a superpage), then you need to follow the
>>>> break-before-make sequence. This means that:
>>>>     1. Replace the valid entry with an entry with an invalid one
>>>>     2. Flush the TLBs
>>>>     3. Write the new entry
>>>>
>>>> Those steps will make your code compliant but it also means that a virtual
>>>> address will be temporarily invalid so you could take a fault in the middle
>>>> of your split if your stack or the table was part of the region. The same
>>>> could happen for the other running CPUs but this is less problematic as they
>>>> could spin on the page-table lock.
>>>
>>> Could this be worked around by writing the critical section in
>>> assembler?
>>
>> Everything is feasible. Is this worth it? I don't think so. There are way we
>> can avoid the shattering at first by simply not mapping all the RAM.
> 
> Good point.  I do wonder what would go wrong if one replaced one live
> PTE with another that pointed to the same physical address. 

It depends what you are modifying the PTE. If you only modify the 
permissions, then that's fine. But anything else could result to TLB 
conflict, loss of coherency...

> Is this
> merely a case of “spec doesn’t allow it”, or does it actually break on
> real hardware?
I have seen issues on real HW if the ordering is not respected. Recent 
version of the Arm Arm introduced the possibility to skip the sequence 
in certain conditions and if the HW supports it (reported via the ID 
registers).

I haven't yet seen such processor.

Cheers,

-- 
Julien Grall

