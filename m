Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1066A4CD476
	for <lists+xen-devel@lfdr.de>; Fri,  4 Mar 2022 13:50:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.284277.483485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQ7NO-0004mX-3p; Fri, 04 Mar 2022 12:49:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 284277.483485; Fri, 04 Mar 2022 12:49:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQ7NO-0004kI-0W; Fri, 04 Mar 2022 12:49:42 +0000
Received: by outflank-mailman (input) for mailman id 284277;
 Fri, 04 Mar 2022 12:49:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nQ7NM-0004kC-Nb
 for xen-devel@lists.xenproject.org; Fri, 04 Mar 2022 12:49:40 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nQ7NJ-0001o2-Mm; Fri, 04 Mar 2022 12:49:37 +0000
Received: from [54.239.6.187] (helo=[192.168.25.28])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nQ7NJ-0006wf-Gy; Fri, 04 Mar 2022 12:49:37 +0000
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
	bh=tj+ngjbF5ZJ/diDwRe6jVcjr2CXT9qyUdecTd/dJZOo=; b=N9xXkveiehin42UNWMZv0gEGg/
	L1CX1YqsYNkWGmKO+pNZusMiKWgJLEICzchXJKSzyyW7SGB1OIUNmv65rBUrOP925Nk9rzUgIA9kG
	975Tv2P1C7egRJzOD2/lld3klbnD+5hxD7i5I4NSmh2GSce79pinaCpz9rbD7L6LTCV4=;
Message-ID: <26107eb2-d38d-d6b5-bdaa-d5058e964623@xen.org>
Date: Fri, 4 Mar 2022 12:49:34 +0000
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
From: Julien Grall <julien@xen.org>
In-Reply-To: <8f78044e-aca2-5919-1841-15989daeb986@xilinx.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 04/03/2022 12:13, Ayan Kumar Halder wrote:
> Hi Julien,

Hi,

> 
> On 04/03/2022 10:46, Julien Grall wrote:
>> Hi Ayan,
>>
>> On 01/03/2022 12:40, Ayan Kumar Halder wrote:
>>> When the data abort is caused due to cache maintenance for an address,
>>> there are two scenarios:-
>>>
>>> 1. Address belonging to a non emulated region - For this, Xen should
>>> set the corresponding bit in the translation table entry to valid and
>>> return to the guest to retry the instruction. This can happen sometimes
>>> as Xen need to set the translation table entry to invalid. (for eg
>>> 'Break-Before-Make' sequence).
>>>
>>> 2. Address belongs to an emulated region - Xen should ignore the
>>> instruction (ie increment the PC) and return to the guest.
>>
>> I would be explicit and say something along the lines:
>>
>> "Xen doesn't cache data for emulated regions. So we can safely ignore 
>> them".
>>
>> There is a third scenarios:
>>
>> The address belongs to neither an emulated region nor has a valid 
>> mapping in the P2M.
> 
> To check this, we should test "try_handle_mmio() == IO_UNHANDLED". If so 
> then send an abort to the guest.
> 
> Is this correct ?
I think it would be too late because if the region is emulated, then we 
would have already tried to handle it.

Instead, I think we need to check after we confirmed that the region is 
emulated or we need to forward to an IOREQ server.

So the check would have to be duplicated here.

Cheers,

-- 
Julien Grall

