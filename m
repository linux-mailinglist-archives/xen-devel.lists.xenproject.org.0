Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 963CD4CDCC1
	for <lists+xen-devel@lfdr.de>; Fri,  4 Mar 2022 19:38:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.284843.484083 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQCoI-0001uq-A9; Fri, 04 Mar 2022 18:37:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 284843.484083; Fri, 04 Mar 2022 18:37:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQCoI-0001rb-62; Fri, 04 Mar 2022 18:37:50 +0000
Received: by outflank-mailman (input) for mailman id 284843;
 Fri, 04 Mar 2022 18:37:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nQCoG-0001rV-FY
 for xen-devel@lists.xenproject.org; Fri, 04 Mar 2022 18:37:48 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nQCoG-0000HR-0w; Fri, 04 Mar 2022 18:37:48 +0000
Received: from [54.239.6.187] (helo=[192.168.25.28])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nQCoF-0007rU-QB; Fri, 04 Mar 2022 18:37:47 +0000
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
	bh=OiEr1Mg00GpX/BUP7ZdgfmACwj68tgb1l4nhZXCS5Tk=; b=SZPsdWHkIOfJeKDfO8n0CnMpyL
	7Mg9cuMQYPHtCQTk8CJ7IqPJdKywcGSMa8NrsMn5skYZL3bewPWpfUu/Jmj4n0E40GSf5Xx5rz+y3
	visZtEd+aUU3e31GYawXLxEtKEA76DY+XRSZSCcJQqfQJdYTACrOs+iXlzFbHwbUJS4s=;
Message-ID: <18284189-7aae-25ca-14b6-48f9c41e2973@xen.org>
Date: Fri, 4 Mar 2022 18:37:44 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [XEN v9 4/4] xen/arm64: io: Handle data abort due to cache
 maintenance instructions
To: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, Volodymyr_Babchuk@epam.com,
 bertrand.marquis@arm.com, andrew.cooper3@citrix.com,
 george.dunlap@citrix.com, jbeulich@suse.com, wl@xen.org, paul@xen.org,
 roger.pau@citrix.com
References: <20220301124022.10168-1-ayankuma@xilinx.com>
 <20220301124022.10168-5-ayankuma@xilinx.com>
 <26ee167e-16ea-e358-f390-dc96961d3234@xen.org>
 <8f78044e-aca2-5919-1841-15989daeb986@xilinx.com>
 <26107eb2-d38d-d6b5-bdaa-d5058e964623@xen.org>
 <9be4bf1c-0d56-2917-1404-f56590a8034d@xilinx.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <9be4bf1c-0d56-2917-1404-f56590a8034d@xilinx.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 04/03/2022 14:40, Ayan Kumar Halder wrote:
> Hi Julien,

Hi,

> I have a question.
> 
> On 04/03/2022 12:49, Julien Grall wrote:
>>
>>
>> On 04/03/2022 12:13, Ayan Kumar Halder wrote:
>>> Hi Julien,
>>
>> Hi,
>>
>>>
>>> On 04/03/2022 10:46, Julien Grall wrote:
>>>> Hi Ayan,
>>>>
>>>> On 01/03/2022 12:40, Ayan Kumar Halder wrote:
>>>>> When the data abort is caused due to cache maintenance for an address,
>>>>> there are two scenarios:-
>>>>>
>>>>> 1. Address belonging to a non emulated region - For this, Xen should
>>>>> set the corresponding bit in the translation table entry to valid and
>>>>> return to the guest to retry the instruction. This can happen 
>>>>> sometimes
>>>>> as Xen need to set the translation table entry to invalid. (for eg
>>>>> 'Break-Before-Make' sequence).
>>>>>
>>>>> 2. Address belongs to an emulated region - Xen should ignore the
>>>>> instruction (ie increment the PC) and return to the guest.
>>>>
>>>> I would be explicit and say something along the lines:
>>>>
>>>> "Xen doesn't cache data for emulated regions. So we can safely 
>>>> ignore them".
>>>>
>>>> There is a third scenarios:
>>>>
>>>> The address belongs to neither an emulated region nor has a valid 
>>>> mapping in the P2M.
>>>
>>> To check this, we should test "try_handle_mmio() == IO_UNHANDLED". If 
>>> so then send an abort to the guest.
>>>
>>> Is this correct ?
>> I think it would be too late because if the region is emulated, then 
>> we would have already tried to handle it.
>>
>> Instead, I think we need to check after we confirmed that the region 
>> is emulated or we need to forward to an IOREQ server.
>>
>> So the check would have to be duplicated here.
> 
> When do we know that a particular address does not belong to an emulated 
> MMIO region ?
> 
> Is this after both "find_mmio_handler()" and "ioreq_server_select()" 
> have returned NULL ?

Correct.

Cheers,

-- 
Julien Grall

