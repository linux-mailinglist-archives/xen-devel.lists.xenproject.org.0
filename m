Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A06776C79
	for <lists+xen-devel@lfdr.de>; Thu, 10 Aug 2023 00:52:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.581472.910194 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTs2H-0007Sy-3y; Wed, 09 Aug 2023 22:52:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 581472.910194; Wed, 09 Aug 2023 22:52:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTs2H-0007Qc-1D; Wed, 09 Aug 2023 22:52:13 +0000
Received: by outflank-mailman (input) for mailman id 581472;
 Wed, 09 Aug 2023 22:52:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qTs2F-0007QW-Hr
 for xen-devel@lists.xenproject.org; Wed, 09 Aug 2023 22:52:11 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qTs2B-0006ka-2Z; Wed, 09 Aug 2023 22:52:07 +0000
Received: from [54.239.6.185] (helo=[192.168.6.56])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qTs2A-0002PZ-Nx; Wed, 09 Aug 2023 22:52:06 +0000
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
	bh=UYdnCNt4r1S81dTd3G5Gil6no3BdumaDACAQ4ib+IAw=; b=ZR3Ue5nD81JMcA7Khtarwa4L23
	qNUnbFEQTKfxnZNMfhNd8Rgf4ZVbf9N2ZawvXGi0kKWXAdXKwL1besMmFiIhDnoyBcI5Bams9mfnv
	3MQvzI64G1zwaGigR0FaRS4NwBhkCDzAi/dJF0IN3roXjkte7Q+eWv+ikY1tS/DIj84s=;
Message-ID: <9456c12e-2960-4d93-86d3-f7fa578199cf@xen.org>
Date: Wed, 9 Aug 2023 23:52:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: MISRA violations in hypercall-defs
Content-Language: en-GB
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Jan Beulich <jbeulich@suse.com>,
 Federico Serafini <federico.serafini@bugseng.com>, jgross@suse.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 "consulting@bugseng.com" <consulting@bugseng.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Bertrand.Marquis@arm.com
References: <5972799c-99a6-73f5-eff2-b24469f7428d@bugseng.com>
 <01fbd921-8092-aedd-33ec-ef170d8ec6fc@suse.com>
 <alpine.DEB.2.22.394.2308081457530.2127516@ubuntu-linux-20-04-desktop>
 <456d6bb5-8fa2-d47a-5d1a-b3bda20e0a5b@suse.com>
 <alpine.DEB.2.22.394.2308091320540.2127516@ubuntu-linux-20-04-desktop>
 <0d7cabca-e0d5-4ab6-a16d-11da35e45149@xen.org>
 <alpine.DEB.2.22.394.2308091500130.2127516@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2308091500130.2127516@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 09/08/2023 23:06, Stefano Stabellini wrote:
> On Wed, 9 Aug 2023, Julien Grall wrote:
>> Hi,
>>
>> On 09/08/2023 21:35, Stefano Stabellini wrote:
>>> P.S.
>>> Julien, Bertrand, do you think we should unsupport (in SUPPORT.md, today
>>> it is not clarified) 32-bit guests on a 64-bit ARM hypervisor?
>>
>> I read your explanation above and I don't really understand why you would want
>> to de-support it. This works pretty well and I am not aware of any issue right
>> now to run 32-bit guest on 64-bit HW.
> 
> I am happy either way. The reason why I brought it up is that we don't
> have a specific test for this in gitlab-ci

But a gitlab CI test can be added, right? I mean it would seem to be odd 
to use this as a justification because a lot of features (e.g. 
passthrough, suspend/resume...) would end up to be de-support it as 
gitlab CI is still in early stage.

> and Jan raised concerns that
> greater-than 32-bit values as possible as ret from hypercalls on a
> 64-bit build of Xen.

This is a known problem and it was discussed several times on the ML in 
the past years.

There is a theorical problem because in theory all the hypercalls could 
return a value that can't fit in 32-bit.

However, AFAIK, only the memory hypercall XENMEM_maximum_gpfn may return 
a 64-bit value on 64-bit Xen.

It is not a problem for a 32-bit domain issues the hypercall on itself 
because the guest physical maximum address should never be greater than 
40-bit (so 28-bit page frame number) and therefore could fit in 32-bit.

The only problem is if you want to use a 32-bit toolstack on 64-bit. But 
Jan sent a patch for SUPPORT.md to clarify this is not meant to always 
work (see [1]).

Please let me know if you are aware of any other truncations.

Cheers,

[1] 6d6144f6-489e-d9b0-b590-f5d65c385116@suse.com


-- 
Julien Grall

