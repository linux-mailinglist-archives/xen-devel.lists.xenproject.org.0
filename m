Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A49A7406D
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 22:49:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.929936.1332678 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txv5A-0005sL-EJ; Thu, 27 Mar 2025 21:48:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 929936.1332678; Thu, 27 Mar 2025 21:48:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txv5A-0005pT-B7; Thu, 27 Mar 2025 21:48:12 +0000
Received: by outflank-mailman (input) for mailman id 929936;
 Thu, 27 Mar 2025 21:48:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1txv59-0005pN-T9
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 21:48:11 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1txv55-00C10R-2h;
 Thu, 27 Mar 2025 21:48:07 +0000
Received: from [2a02:8012:3a1:0:ede3:7fd5:aa96:e2db]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1txv55-002U1K-1y;
 Thu, 27 Mar 2025 21:48:07 +0000
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
	bh=8sfupe3zEJK0Vh427euGHCfEYMftr/NazyUMx+G1W14=; b=IDY+4ideU2M5POh5lllruEVE1L
	B0gVTHDEE7kkSZQ1bTQ8fgMmLmak2HsfUauh82cbYEfZaidO1be8mYDnBs5sb9bHQdbLvVcUIUM1L
	NVp88gW8IcnRAV7Tj55zo6QWTo5CNLhYbblNSPIi/P5GmoZjGsr+BF6FbjubJzjuUKbk=;
Message-ID: <78cd875b-fb29-4c5d-8baf-36ee7d42fac6@xen.org>
Date: Thu, 27 Mar 2025 21:48:03 +0000
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
 <4c5ba483-c78b-4d45-addc-5a3070d99689@xen.org>
 <0758acd6-40fb-42f3-8fd4-2d22056183a1@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <0758acd6-40fb-42f3-8fd4-2d22056183a1@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 27/03/2025 16:10, Jan Beulich wrote:
> On 27.03.2025 16:49, Julien Grall wrote:
>> On 27/03/2025 15:08, Jan Beulich wrote:
>>> On 27.03.2025 15:49, Julien Grall wrote:
>>>> On 13/03/2025 13:38, Jan Beulich wrote:
>>>>> ---
>>>>> Same could then apparently be done for heap_init_late(). Thoughts?
>>>>
>>>> Looking at the code, I couldn't figure out whether any of the
>>>> constructors may rely on some changes done by heap_init_late().
>>>>
>>>> The only issue I can think of is scrubbing. In the case it is
>>>> synchronous, would the memory allocated before hand be scrubbed?
>>>
>>> Memory that is allocated can't possibly be scrubbed; only memory that's
>>> still un-allocated can be. With that I fear I don't properly understand
>>> the question you raise.
>>
>> I meant that if memory is allocated by calls from init_constructors().
>> Before this patch, the memory would be scrubbed. After this patch,
>> anything constructors called before heap_init_late() would end up to not
>> be scrubbed if it is synchronous.
> 
> Oh, I see. Since scrubbing may be asynchronous, any site relying on scrubbing
> having happened would be flawed anyway. 

I have to disagree. If the scrubbing is asynchronous then...

> Apart from that, unless callers pass
> MEMF_no_scrub to alloc_heap_pages(), un-scrubbed pages would be scrubbed> anyway (see near the end of the function).

... the page will be scrubbed at the time it is allocated if it was not 
done before. But for synchronous scrubbing, at boot, this will not be 
the case (unless CONFIG_SCRUB_DEBUG is set and with the associated 
command line option). It will only happen during heap_init_late(). This 
is because init_heap_pages() will not request scrubbing unless 
asynchronous scrubbing is enabled (or CONFIG_SCRUB_DEBUG is set and with 
the associated command line).

So I still think there is a potential difference of behavior if we move 
heap_init_late() later. Someone will need to investigate whether there 
is effectively an issue.

Cheers,

-- 
Julien Grall


