Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8938A3BCC6
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2025 12:28:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.892731.1301697 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkiFm-0003BP-3c; Wed, 19 Feb 2025 11:28:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 892731.1301697; Wed, 19 Feb 2025 11:28:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkiFm-00039j-0f; Wed, 19 Feb 2025 11:28:34 +0000
Received: by outflank-mailman (input) for mailman id 892731;
 Wed, 19 Feb 2025 11:28:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tkiFk-00038u-Bz
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2025 11:28:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tkiFj-00Ab1A-2p;
 Wed, 19 Feb 2025 11:28:31 +0000
Received: from [15.248.2.31] (helo=[10.24.66.255])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tkiFj-002C1p-1Q;
 Wed, 19 Feb 2025 11:28:31 +0000
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
	bh=j28KTzoeSZxNn0+G45WI7rJRMg88pDYLp2xxdJGzMG4=; b=Bn/4/IEz3vBaa/cbyBnNWNWmjM
	UQkoKMO/BAGh126yn+z5xHQGRpz7T5Q7PewIWqPuTG0/9tvCBKHp5unIdCQrbdHUYBUM9n1sE984V
	HSWHn+isYqvyCvvc+IhU398B7GbY9S9y+OcxA02Nq+Px9aCPj6Bh5WZNP3yE0dVZiK/E=;
Message-ID: <5a4e8b76-f624-46cd-98cc-f22874c54159@xen.org>
Date: Wed, 19 Feb 2025 11:28:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: fix iomem_ranges cfg in map_range_to_domain()
Content-Language: en-GB
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Grygorii Strashko <grygorii_strashko@epam.com>,
 Grygorii Strashko <gragst.linux@gmail.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250214125505.2862809-1-grygorii_strashko@epam.com>
 <deb84d7f-d335-4976-9f5f-6a5fa74b386e@xen.org>
 <e5c63216-d22f-429c-b6c3-082e0984a9a3@epam.com>
 <a3e9f238-2a19-4015-8443-113f22ffbbf7@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <a3e9f238-2a19-4015-8443-113f22ffbbf7@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Andrew,

On 14/02/2025 14:25, Andrew Cooper wrote:
> On 14/02/2025 2:10 pm, Grygorii Strashko wrote:
>>>>
>>>> For example, requested range:
>>>>     00e6140000 - 00e6141004 should set e6140:e6141 nr=2, but will
>>>> configure
>>>> e6140 e6142 nr=3 instead.
>>>
>>> I am not sure what 'nr' is referring to here.
>>
>> Sorry, will change to "num_pages"?
> 
> I agree Xen needs to be better (and by that, I mean consistent and
> clear), but there are subtle bugs with most approaches like this.
> 
> Any exclusive bound, as well as counts like this need $n+1 bits of
> arithmetic when you want to describe the boundaries of the space.
> 
> There is also a boundary condition for counts.  What map_foo(x, 0) mean?

I would consider "0" has invalid.

> 
> Real hardware uses "last" for describing boundaries (x86 specifically
> calls this "limit" in the ISA, but it's a trick used by other
> architectures too).  Unlike "end", it's clearly an inclusive bound.
> 
> Personally, I'd like to see Xen switch to "start, last" pairs.  It's
> unambiguous and has fewest boundary cases.

"start, last" would also work for me.

Cheers,

-- 
Julien Grall


