Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA23F67582B
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jan 2023 16:09:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.481932.747173 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIt1R-0006jy-3V; Fri, 20 Jan 2023 15:09:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 481932.747173; Fri, 20 Jan 2023 15:09:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIt1R-0006i9-0E; Fri, 20 Jan 2023 15:09:41 +0000
Received: by outflank-mailman (input) for mailman id 481932;
 Fri, 20 Jan 2023 15:09:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pIt1Q-0006i3-0n
 for xen-devel@lists.xenproject.org; Fri, 20 Jan 2023 15:09:40 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pIt1P-0008To-MY; Fri, 20 Jan 2023 15:09:39 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230]
 helo=[10.95.149.154]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pIt1P-00039Q-G4; Fri, 20 Jan 2023 15:09:39 +0000
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
	bh=9qJtD2Yqcw0dYOgj4lUpYax2JUGRXYkvpooIw51hFoA=; b=WkR0FA36zUzIz5YtjGTdCoaIpq
	fN7o9d6ImHa4raAywCK6WfpUORschYW1KgfwDdMg29Agufi1uyVv3+MKYJgCasuYK7ZARoOZRa0Cm
	TsRQj62GcRYdWEd7DMbbyvVw2G0DmVZTjlnlUIaC1Ytce5WgR9adnlRZX2GZv3Cegy+8=;
Message-ID: <cd673f97-9c0d-286b-e973-7a85c84dd576@xen.org>
Date: Fri, 20 Jan 2023 15:09:37 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [XEN v2 02/11] xen/arm: Use the correct format specifier
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: xen-devel@lists.xenproject.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com
References: <20230117174358.15344-1-ayan.kumar.halder@amd.com>
 <20230117174358.15344-3-ayan.kumar.halder@amd.com>
 <alpine.DEB.2.22.394.2301191454080.731018@ubuntu-linux-20-04-desktop>
 <c7e5fbf3-9e90-7008-0299-f53b20566b9a@xen.org>
 <ba37ee02-c07c-2803-0867-149c779890b6@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <ba37ee02-c07c-2803-0867-149c779890b6@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 20/01/2023 14:40, Michal Orzel wrote:
> Hello,

Hi,

> 
> On 20/01/2023 10:32, Julien Grall wrote:
>>
>>
>> Hi,
>>
>> On 19/01/2023 22:54, Stefano Stabellini wrote:
>>> On Tue, 17 Jan 2023, Ayan Kumar Halder wrote:
>>>> 1. One should use 'PRIpaddr' to display 'paddr_t' variables.
>>>> 2. One should use 'PRIx64' to display 'u64' in hex format. The current
>>>> use of 'PRIpaddr' for printing PTE is buggy as this is not a physical
>>>> address.
>>>>
>>>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>>>
>>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
>>
>>
>> I have committed the patch.
> The CI test jobs (static-mem) failed on this patch:
> https://gitlab.com/xen-project/xen/-/pipelines/752911309

Thanks for the report.

> 
> I took a look at it and this is because in the test script we
> try to find a node whose unit-address does not have leading zeroes.
> However, after this patch, we switched to PRIpaddr which is defined as 016lx/016llx and
> we end up creating nodes like:
> 
> memory@0000000050000000
> 
> instead of:
> 
> memory@60000000
> 
> We could modify the script, 

TBH, I think it was a mistake for the script to rely on how Xen describe 
the memory banks in the Device-Tree.

For instance, from my understanding, it would be valid for Xen to create 
a single node for all the banks or even omitting the unit-address if 
there is only one bank.

> but do we really want to create nodes
> with leading zeroes? The dt spec does not mention it, although [1]
> specifies that the Linux convention is not to have leading zeroes.

Reading through the spec in [2], it suggested the current naming is 
fine. That said the example match the Linux convention (I guess that's 
not surprising...).

I am open to remove the leading. However, I think the CI also needs to 
be updated (see above why).

Cheers,

[2] https://www.devicetree.org/

-- 
Julien Grall

