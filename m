Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB5B8056B1
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 15:02:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647915.1011662 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAVzt-0003ls-2y; Tue, 05 Dec 2023 14:02:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647915.1011662; Tue, 05 Dec 2023 14:02:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAVzt-0003in-0H; Tue, 05 Dec 2023 14:02:01 +0000
Received: by outflank-mailman (input) for mailman id 647915;
 Tue, 05 Dec 2023 14:01:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rAVzr-0003ih-R1
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 14:01:59 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rAVzn-0006xJ-CM; Tue, 05 Dec 2023 14:01:55 +0000
Received: from 54-240-197-228.amazon.com ([54.240.197.228]
 helo=[10.95.100.251]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rAVzn-0006Ky-6F; Tue, 05 Dec 2023 14:01:55 +0000
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
	bh=BaPBm1tL6VgpQRXw2pAF9+h1siOyAS9WR0c9DGF4R3Q=; b=Rca2mqvEVQbDfp6AG2Ml8c/iZP
	d2Olazouthghu90nECgIirTWRX/Oflt4F6ZG4ZTzXL5XnhuxfRwPGqrCgct/vMvNXjec4aY1E00m5
	0T05OC0O9TaQBK0L1zzVTDN0kmlHtAKdbHR1S8fgJ+HqTeFjzEFvUDWx/QyEqK9L2sDQ=;
Message-ID: <c65b22b2-ca1c-4c4c-9aa5-6cf74c0fdc6b@xen.org>
Date: Tue, 5 Dec 2023 14:01:53 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] xen: make include/xen/unaligned.h usable on all
 architectures
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Arnd Bergmann <arnd@arndb.de>, Juergen Gross <jgross@suse.com>,
 xen-devel@lists.xenproject.org
References: <20231205100756.18920-1-jgross@suse.com>
 <20231205100756.18920-2-jgross@suse.com>
 <1984c65c-72d8-4850-9886-f2b0766224a5@xen.org>
 <e8df45d3-1d7d-432b-b0ca-7532d4b35eae@suse.com>
 <96ed8aa3-f92f-4b33-a846-549cfda14548@xen.org>
 <3789ced7-e320-4e32-bda9-3039551a7117@suse.com>
 <652bdb77-6f2d-4fe0-9ae1-132be50962e3@xen.org>
 <57eb9981-26e6-4281-ab31-78fb5b7427b1@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <57eb9981-26e6-4281-ab31-78fb5b7427b1@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 05/12/2023 13:59, Jan Beulich wrote:
> On 05.12.2023 14:46, Julien Grall wrote:
>> On 05/12/2023 13:41, Juergen Gross wrote:
>>> On 05.12.23 14:31, Julien Grall wrote:
>>>> Anyway, given you don't seem to have a use-case yet, I would simply to
>>>> consider to surround the declaration with an a config which can be
>>>> selected if unaligned access is supported.
>>>
>>> Like in xen/common/lzo.c et al?
>>
>> Just to clarify, I am suggesting to add in unaligned.h:
>>
>> #ifdef CONFIG_HAS_UNALIGNED_ACCESS
>>
>> your definitions
>>
>> #endif
> 
> But that would be wrong: HAS_UNALIGNED_ACCESS would be there to indicate
> one does _not_ need any special accessors.

I am guessing you are disagreeing on the name rather than the concept? 
If so, what about CONFIG_UNALIGNED_ACCESS_ALLOWED?

Cheers,

-- 
Julien Grall

