Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 791AC65E7BD
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jan 2023 10:26:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.471770.731759 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDMW6-0003Oj-Vf; Thu, 05 Jan 2023 09:26:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 471770.731759; Thu, 05 Jan 2023 09:26:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDMW6-0003Lm-RZ; Thu, 05 Jan 2023 09:26:30 +0000
Received: by outflank-mailman (input) for mailman id 471770;
 Thu, 05 Jan 2023 09:26:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pDMW5-0003Lg-Q0
 for xen-devel@lists.xenproject.org; Thu, 05 Jan 2023 09:26:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pDMW3-0005OB-JW; Thu, 05 Jan 2023 09:26:27 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235] helo=[192.168.4.62])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pDMW3-0007Rl-Cp; Thu, 05 Jan 2023 09:26:27 +0000
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
	bh=PEBC+UaIwLwZGAnFM0C127VFp32FpIJgDVgumc8M6K8=; b=UgaFoxdDnHb1LiRcDtwU/6apht
	o9f37caHdBmW9GMG+4+7I+FHY7bkxNmxdQyenIePj9utCd00Jdr3Z1YZGfACn4L7/ppvQZYOQCyxe
	ofy0Z6VzJCTCQ0jaBN5tPeR5S1bdSZDzBQLG+QXBC0i6R2ZX8eGOl65Spc5zPzfsucgw=;
Message-ID: <1264e5cc-1960-95d3-5ecb-d6f23d194aa4@xen.org>
Date: Thu, 5 Jan 2023 09:26:25 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2] xen/arm: Add 0x prefix when printing memory size in
 construct_domU
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>
Cc: xen-devel@lists.xenproject.org,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230103102519.26224-1-michal.orzel@amd.com>
 <alpine.DEB.2.22.394.2301041546230.4079@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2301041546230.4079@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 04/01/2023 23:47, Stefano Stabellini wrote:
> On Tue, 3 Jan 2023, Michal Orzel wrote:
>> Printing memory size in hex without 0x prefix can be misleading, so
>> add it. Also, take the opportunity to adhere to 80 chars line length
>> limit by moving the printk arguments to the next line.
>>
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>> ---
>> Changes in v2:
>>   - was: "Print memory size in decimal in construct_domU"
>>   - stick to hex but add a 0x prefix
>>   - adhere to 80 chars line length limit
> 
> Honestly I prefer decimal but also hex is fine. 

decimal is perfect for very small values, but as we print the amount in 
KB it will become a big mess. Here some examples (decimal first, then 
hexadecimal):

   512MB: 524288 vs 0x80000
   555MB: 568320 vs 0x8ac00
   1GB: 1048576 vs 0x100000
   512GB: 536870912 vs 0x20000000
   1TB: 1073741824 vs 0x40000000

For power of two values, you might be able to find your way with 
decimal. It is more difficult for non power of two unless you have a 
calculator in hand.

The other option I suggested in v1 is to print the amount in KB/GB/MB. 
Would that be better?

That said, to be honest, I am not entirely sure why we are actually 
printing in KB. It would seems strange that someone would create a guest 
with memory not aligned to 1MB.

So I would consider to check the size is 1MB-aligned and then print the 
value in KB. This will remove one order of magnitude and make the value 
more readable in decimal.

Cheers,

-- 
Julien Grall

