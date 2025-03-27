Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1FB6A735F8
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 16:50:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.929642.1332359 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txpUF-0007zw-G6; Thu, 27 Mar 2025 15:49:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 929642.1332359; Thu, 27 Mar 2025 15:49:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txpUF-0007wn-D0; Thu, 27 Mar 2025 15:49:43 +0000
Received: by outflank-mailman (input) for mailman id 929642;
 Thu, 27 Mar 2025 15:49:41 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1txpUD-0007wh-Fd
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 15:49:41 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1txpUA-00Brhg-1m;
 Thu, 27 Mar 2025 15:49:38 +0000
Received: from [15.248.2.232] (helo=[10.24.66.240])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1txpUA-001vlR-11;
 Thu, 27 Mar 2025 15:49:38 +0000
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
	bh=l8S/MapkqA4tdMiR1/D0z1hQG/6vvyr0sz4l5Ng3Q30=; b=MnpIsnQI46ehhGJk5CDrjxosZ3
	yY+h5A/pMlwHqloCAyOuu7J5D35UgdGRrREYtD2aboDVR9GSzfJavVZcjiG02lROa+rHnD6pv5Zo3
	eECSq2sHo36h4uAR1D4Yn9DOg1/ldUoc9CK/kETP5ZezpSq6ovD/Bn0Iz7lZhZjPAtUA=;
Message-ID: <4c5ba483-c78b-4d45-addc-5a3070d99689@xen.org>
Date: Thu, 27 Mar 2025 15:49:36 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] trace: convert init_trace_bufs() to constructor
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>
References: <e1e556c4-ed71-41f7-acfc-b7fa866a0d3e@suse.com>
 <89043421-49b5-40cc-91c8-f4cd7dd2f6d1@xen.org>
 <87f63516-f9a3-46cc-80a7-1eb614c1f818@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <87f63516-f9a3-46cc-80a7-1eb614c1f818@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 27/03/2025 15:08, Jan Beulich wrote:
> On 27.03.2025 15:49, Julien Grall wrote:
>> On 13/03/2025 13:38, Jan Beulich wrote:
>>> There's no need for each arch to invoke it directly, and there's no need
>>> for having a stub either. With the present placement of the calls to
>>> init_constructors() it can easily be a constructor itself.
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> Acked-by: Julien Grall <jgrall@amazon.com>
> 
> Thanks.
> 
>>> ---
>>> Same could then apparently be done for heap_init_late(). Thoughts?
>>
>> Looking at the code, I couldn't figure out whether any of the
>> constructors may rely on some changes done by heap_init_late().
>>
>> The only issue I can think of is scrubbing. In the case it is
>> synchronous, would the memory allocated before hand be scrubbed?
> 
> Memory that is allocated can't possibly be scrubbed; only memory that's
> still un-allocated can be. With that I fear I don't properly understand
> the question you raise.

I meant that if memory is allocated by calls from init_constructors(). 
Before this patch, the memory would be scrubbed. After this patch, 
anything constructors called before heap_init_late() would end up to not 
be scrubbed if it is synchronous.

Cheers,

-- 
Julien Grall


