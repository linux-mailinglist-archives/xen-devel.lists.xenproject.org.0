Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E984E7506
	for <lists+xen-devel@lfdr.de>; Fri, 25 Mar 2022 15:25:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.294790.501413 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXks5-0003Hy-IF; Fri, 25 Mar 2022 14:24:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 294790.501413; Fri, 25 Mar 2022 14:24:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXks5-0003Ft-F9; Fri, 25 Mar 2022 14:24:57 +0000
Received: by outflank-mailman (input) for mailman id 294790;
 Fri, 25 Mar 2022 14:24:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nXks3-0003Fn-MD
 for xen-devel@lists.xenproject.org; Fri, 25 Mar 2022 14:24:55 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nXks2-0003zK-M8; Fri, 25 Mar 2022 14:24:54 +0000
Received: from [54.239.6.185] (helo=[192.168.14.36])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nXks2-000701-FX; Fri, 25 Mar 2022 14:24:54 +0000
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
	bh=OXUTeJitl+phbKj+5szvFqS5tepnyXc/D+DK2FvLQQk=; b=mqiJINok1++023i7/dgvge3P3f
	iBia93n1RVO2dFqJGi8FjWWiwr0YOEJclBLSkHN+KTOXrcNYIuEPxkUcp1xaFcygndN+UmWbwUMeW
	ovW1Fm13m/jVhH/EBkRzYvAfIpHPE1Ku0ndOjuxRNfT7UAYyBaVTgXZ5NC/Ma70Okikw=;
Message-ID: <9673f201-080b-8800-65a2-144d21b030fd@xen.org>
Date: Fri, 25 Mar 2022 14:24:52 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH early-RFC 4/5] xen/arm: mm: Rework switch_ttbr()
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "marco.solieri@minervasys.tech" <marco.solieri@minervasys.tech>,
 "lucmiccio@gmail.com" <lucmiccio@gmail.com>, Julien Grall
 <jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220309112048.17377-1-julien@xen.org>
 <20220309112048.17377-5-julien@xen.org>
 <140E78FF-8281-48BA-BE13-C4B3E12F34A5@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <140E78FF-8281-48BA-BE13-C4B3E12F34A5@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 25/03/2022 13:47, Bertrand Marquis wrote:
> Hi Julien,

Hi Bertrand,

>> On 9 Mar 2022, at 12:20, Julien Grall <julien@xen.org> wrote:
>>
>> From: Julien Grall <jgrall@amazon.com>
>>
>> At the moment, switch_ttbr() is switching the TTBR whilst the MMU is
>> still on.
>>
>> Switching TTBR is like replacing existing mappings with new ones. So
>> we need to follow the break-before-make sequence.
>>
>> In this case, it means the MMU needs to be switched off while the
>> TTBR is updated. In order to disable the MMU, we need to first
>> jump to an identity mapping.
>>
>> Rename switch_ttbr() to switch_ttbr_id() and create an helper on
>> top to temporary map the identity mapping and call switch_ttbr()
>> via the identity address.
>>
>> switch_ttbr_id() is now reworked to temporarily turn off the MMU
>> before updating the TTBR.
>>
>> We also need to make sure the helper switch_ttbr() is part of the
>> identity mapping. So move _end_boot past it.
>>
>> Take the opportunity to instruction cache flush as the operation is
>> only necessary when the memory is updated.
> 
> Your code is actually remove the instruction cache invalidation so
> this sentence is a bit misleading.

I forgot to add the word "remove" in the sentence.

> 
> Also an open question: shouldn’t we flush the data cache ?
Do you mean clean/invalidate to PoC/PoU? Something else?

> As we switch from one TTBR to an other, there might be some data
> in the cache dependent that could be flushed while the MMU is off 

I am a bit confused. Those flush could also happen with the MMU on. So 
how turning off the MMU would result to a problem? Note that the data 
cache is still enabled during the switch.

> or
> that would have no mapping once it is reactivated.
The cache line will be flushed at some point in the future. I would 
argue if the caller need it earlier, then it should make sure to issue 
the flush before switch_ttbr().

Cheers,

-- 
Julien Grall

