Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 128C88B55F7
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2024 13:05:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.713997.1114939 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1Ony-0001Pe-49; Mon, 29 Apr 2024 11:04:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 713997.1114939; Mon, 29 Apr 2024 11:04:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1Ony-0001NI-1d; Mon, 29 Apr 2024 11:04:18 +0000
Received: by outflank-mailman (input) for mailman id 713997;
 Mon, 29 Apr 2024 11:04:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1s1Onw-0001NC-1Z
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2024 11:04:16 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1s1Ons-0006Dj-6k; Mon, 29 Apr 2024 11:04:12 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.0.211])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1s1Ons-0004Zy-0Z; Mon, 29 Apr 2024 11:04:12 +0000
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
	bh=lh5CsJeg5S28wpjjZYHludg8JBvmjHHZwyD6Bcd9EC4=; b=MqrGih3LTMktjfa8jZ3n3PGsTu
	8R9abM7swgSL1xeEwN2t1lwMxIBE5gl4Cmw6LMKzRG02VN6N576gUjtk7EJjJ4tmNpwVwORt/Q+JJ
	tyd+0e4YryqdEcZUUFYutcQX+dUFhWAkA4CD5JapmYkCh1yZaU6kVBN3gkQt0saXK6AI=;
Message-ID: <d0714064-c544-47d3-84c0-a19391ccf496@xen.org>
Date: Mon, 29 Apr 2024 12:04:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 8/8] xen: allow up to 16383 cpus
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, Jan Beulich <jbeulich@suse.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20240327152229.25847-1-jgross@suse.com>
 <20240327152229.25847-9-jgross@suse.com>
 <da1662ac-70f1-4ae4-9737-e10e617c8036@suse.com>
 <637c755a-9f24-4b86-af12-7c7d50bf40c8@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <637c755a-9f24-4b86-af12-7c7d50bf40c8@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

Sorry for the late reply.

On 29/04/2024 11:33, Juergen Gross wrote:
> On 08.04.24 09:10, Jan Beulich wrote:
>> On 27.03.2024 16:22, Juergen Gross wrote:
>>> With lock handling now allowing up to 16384 cpus (spinlocks can handle
>>> 65535 cpus, rwlocks can handle 16384 cpus), raise the allowed limit for
>>> the number of cpus to be configured to 16383.
>>>
>>> The new limit is imposed by IOMMU_CMD_BUFFER_MAX_ENTRIES and
>>> QINVAL_MAX_ENTRY_NR required to be larger than 2 * CONFIG_NR_CPUS.
>>>
>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>
>> Acked-by: Jan Beulich <jbeulich@suse.com>
>>
>> I'd prefer this to also gain an Arm ack, though.
> 
> Any comment from Arm side?

Can you clarify what the new limits mean in term of (security) support? 
Are we now claiming that Xen will work perfectly fine on platforms with 
up to 16383?

If so, I can't comment for x86, but for Arm, I am doubtful that it would 
work without any (at least performance) issues. AFAIK, this is also an 
untested configuration. In fact I would be surprised if Xen on Arm was 
tested with more than a couple of hundreds cores (AFAICT the Ampere CPUs 
has 192 CPUs).

Cheers,

-- 
Julien Grall

