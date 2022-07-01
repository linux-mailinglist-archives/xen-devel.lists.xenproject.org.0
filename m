Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E1E5638D2
	for <lists+xen-devel@lfdr.de>; Fri,  1 Jul 2022 20:04:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.359148.588548 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o7KzQ-0007AO-8Z; Fri, 01 Jul 2022 18:03:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 359148.588548; Fri, 01 Jul 2022 18:03:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o7KzQ-00078M-5m; Fri, 01 Jul 2022 18:03:36 +0000
Received: by outflank-mailman (input) for mailman id 359148;
 Fri, 01 Jul 2022 18:03:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o7KzP-00078G-2Y
 for xen-devel@lists.xenproject.org; Fri, 01 Jul 2022 18:03:35 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o7KzO-0007p4-7X; Fri, 01 Jul 2022 18:03:34 +0000
Received: from [54.239.6.185] (helo=[192.168.1.77])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o7KzN-00058z-Vq; Fri, 01 Jul 2022 18:03:34 +0000
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
	bh=RpV8wMIAYzPpXIawzmS3N2Q7UO34QnAsdyNeSFRM0Xk=; b=PmImcQJ0nBsnPZWoMYObyqBksA
	vgBgZw9hPNe2zxJ2Lh2y3spemf/wN5h5DSzygbfY/LrzdxdIhkZile6l0ws68d5VeW/pKGkGd5hSo
	dz3Sn/FHYp1itFXFwFLz2kVqnZUU0+LtiEzj+CFKyhHI5peHL2nh1UUXruXuOSuN86V8=;
Message-ID: <95e7d58d-e147-fcde-c4cf-da56b6c66faa@xen.org>
Date: Fri, 1 Jul 2022 19:03:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH 2/2] xen/heap: pass order to free_heap_pages() in heap
 init
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Hongyan Xia <hongyxia@amazon.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <jgrall@amazon.com>
References: <20220609083039.76667-1-julien@xen.org>
 <20220609083039.76667-3-julien@xen.org>
 <B8DAD34C-B156-4DC9-AA80-F1401028DF6F@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <B8DAD34C-B156-4DC9-AA80-F1401028DF6F@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 28/06/2022 15:40, Bertrand Marquis wrote:
> Hi Julien,

Hi Bertrand,

>> On 9 Jun 2022, at 09:30, Julien Grall <julien@xen.org> wrote:
>>
>> From: Hongyan Xia <hongyxia@amazon.com>
>>
>> The idea is to split the range into multiple aligned power-of-2 regions
>> which only needs to call free_heap_pages() once each. We check the least
>> significant set bit of the start address and use its bit index as the
>> order of this increment. This makes sure that each increment is both
>> power-of-2 and properly aligned, which can be safely passed to
>> free_heap_pages(). Of course, the order also needs to be sanity checked
>> against the upper bound and MAX_ORDER.
>>
>> Testing on a nested environment on c5.metal with various amount
>> of RAM. Time for end_boot_allocator() to complete:
>>             Before         After
>>     - 90GB: 1426 ms        166 ms
>>     -  8GB:  124 ms         12 ms
>>     -  4GB:   60 ms          6 ms
> 
> 
> On a arm64 Neoverse N1 system with 32GB of Ram I have:
> - 1180 ms before
> - 63 ms after
> 
> and my internal tests are passing on arm64.

Thanks for the testing! The number are a lot better than I was actually 
expecting on arm64.

> 
> Great optimisation :-)

You will have to thanks Hongyan. He came up with the idea :).

> 
> (I will do a full review of code the in a second step).

I am planning to send a new version in the next few days. So you may 
want to wait before reviewing the series.

Cheers,

-- 
Julien Grall

