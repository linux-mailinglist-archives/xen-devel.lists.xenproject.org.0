Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1578BA5CF77
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 20:33:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.908932.1315962 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts5Lm-0007Cc-I1; Tue, 11 Mar 2025 19:33:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 908932.1315962; Tue, 11 Mar 2025 19:33:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts5Lm-00079U-EK; Tue, 11 Mar 2025 19:33:14 +0000
Received: by outflank-mailman (input) for mailman id 908932;
 Tue, 11 Mar 2025 19:33:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ts5Lk-00079M-Un
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 19:33:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ts5Lk-00EgxN-2R;
 Tue, 11 Mar 2025 19:33:12 +0000
Received: from [2a02:8012:3a1:0:9c08:78f4:b949:88f8]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ts5Lk-004e7l-13;
 Tue, 11 Mar 2025 19:33:12 +0000
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
	bh=8+Kf1muwSYCtyhpjx0IL4bWcMsMpnMCRS2itN1mvUhw=; b=0NhHf9sCe9beTKYAA8ZWI4pWRG
	aDdk6H3yOEN5Ssq73n4bighc+6HkRv4xpIKq3kUdVIfuUAiSaFuVRB0yuhTk+Qgjty1/67vM6bOqC
	scpbkk8ymVMYhtvugS5MRp+OS1cfGWiBxRwhCqwkFuh/beyF4CCGx6R+nYEcesd/pypg=;
Message-ID: <4a6cfb94-a73b-4a82-9e1f-9b4f058c3d13@xen.org>
Date: Tue, 11 Mar 2025 19:33:08 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] xen/arm: fix iomem permissions cfg in
 map_range_to_domain()
Content-Language: en-GB
To: Grygorii Strashko <grygorii_strashko@epam.com>,
 Grygorii Strashko <gragst.linux@gmail.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20250218112253.3136505-1-grygorii_strashko@epam.com>
 <20250218112253.3136505-2-grygorii_strashko@epam.com>
 <8f0c8df3-3e6c-40a4-a88e-b81174a170f6@xen.org>
 <f938f8f2-052b-4456-947e-2f8925eb406b@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <f938f8f2-052b-4456-947e-2f8925eb406b@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 11/03/2025 11:31, Grygorii Strashko wrote:
> Hi
> 
> On 19.02.25 13:25, Julien Grall wrote:
>> Hi Grygorii,
>>
>> On 18/02/2025 11:22, Grygorii Strashko wrote:
>>> Now the following code in map_range_to_domain()
>>>
>>>      res = iomem_permit_access(d, paddr_to_pfn(addr),
>>>                      paddr_to_pfn(PAGE_ALIGN(addr + len - 1)));
>>>
>>> calculates the iomem range end address by rounding it up to the next Xen
>>> page with incorrect assumption that iomem range end address passed to
>>> iomem_permit_access() is exclusive, while it is expected to be 
>>> inclusive.
>>> It gives Control domain (Dom0) access to manage incorrect MMIO range 
>>> with
>>> one additional page.
>>>
>>> For example, if requested range is [00e6140000:00e6141004] then it 
>>> expected
>>> to add [e6140:e6141] range (num_pages=2) to the domain iomem_caps 
>>> rangeset,
>>> but will add [e6140:e6142] (num_pages=3) instead.
>>>
>>> To fix it, drop PAGE_ALIGN() from the iomem range end address 
>>> calculation
>>> formula.
>>>
>>> Fixes: 33233c2758345 ("arch/arm: domain build: let dom0 access I/O 
>>> memory
>>> of mapped devices")
>>> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
>>
>> Reviewed-by: Julien Grall <jgrall@amazon.com>
> 
> Sorry, that I'm disturbing you, but do i need to perform any additional 
> actions here?

Thanks for the reminder. The tree only re-opened a few days ago and I 
haven't had a chance to go through the list of pending patches. I have 
pushed them to a branch. If the CI pass, then I will push them to staging.

Cheers,

-- 
Julien Grall


