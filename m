Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD747D4DB3
	for <lists+xen-devel@lfdr.de>; Tue, 24 Oct 2023 12:26:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621814.968636 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvEcR-0003PH-NI; Tue, 24 Oct 2023 10:26:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621814.968636; Tue, 24 Oct 2023 10:26:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvEcR-0003N5-Kc; Tue, 24 Oct 2023 10:26:39 +0000
Received: by outflank-mailman (input) for mailman id 621814;
 Tue, 24 Oct 2023 10:26:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qvEcP-0003Mz-9z
 for xen-devel@lists.xenproject.org; Tue, 24 Oct 2023 10:26:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qvEcO-00050H-P0; Tue, 24 Oct 2023 10:26:36 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227]
 helo=[192.168.12.80]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qvEcO-0006Zv-FN; Tue, 24 Oct 2023 10:26:36 +0000
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
	bh=sumO1k8WN2YcDfUy8DzX5NxVaO8M8xz39vDIs98lG3o=; b=CR/rSirAZdNq5xCQ0QUKj3mg8p
	CZVCziSOOwB7mjSuoen/nsPwr7YXUc/FblpjF+XPlu7HuKe4ZzOB/Fp88SV7zSBabGWh59JIJ2m1R
	8Qp7BkKGnjLcKSDd1cyWHXapOGW6omEeLtYvQoGKNWS+aEFAsf1vpEyeICTiFwV8ZtUw=;
Message-ID: <0d655443-3e2f-4ed5-ae31-42207aaf9a39@xen.org>
Date: Tue, 24 Oct 2023 11:26:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19] docs/arm: Document where Xen should be loaded in
 memory
Content-Language: en-GB
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Henry.Wang@arm.com, Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20231024100923.12724-1-julien@xen.org>
 <a490579a-776a-47ec-a10f-014fdafef2dd@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <a490579a-776a-47ec-a10f-014fdafef2dd@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 24/10/2023 11:23, Michal Orzel wrote:
> Hi Julien,

Hi,

> On 24/10/2023 12:09, Julien Grall wrote:
>>
>>
>> From: Julien Grall <jgrall@amazon.com>
>>
>> In commit 9d267c049d92 ("xen/arm64: Rework the memory layout"),
>> we decided to require Xen to be loaded below 5 TiB to simplify
> s/5/2

Ah yes. I keep having 2 TiB.

>> the logic to enable the MMU. The limit was decided based on
>> how known platform boot plus some slack.
>>
>> We had a recent report that this is not sufficient on the AVA
>> platform with a old firmware [1]. But the restriction is not
>> going to change in Xen 4.18. So document the limit clearly
>> in docs/misc/arm/booting.txt
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>
>> ----
> one less '-'

Yes. I forgot to call 'sed -i 's/^----/---/' *.patch' before sending (I 
use ---- to prevent my pacthqueue management tool to strip anything 
after ---).

> 
>>
>> I couldn't find a nice way to document it in SUPPORT.md. So I decided
>> to only document the restrict in docs/misc/arm/booting.txt for now.
>>
>> I also couldn't find any way from GRUB/UEFI (I didn't look much) to
>> specify the loading address.
>> ---
>>   docs/misc/arm/booting.txt | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/docs/misc/arm/booting.txt b/docs/misc/arm/booting.txt
>> index 02f7bb65ec6d..c6bdeafe5e5b 100644
>> --- a/docs/misc/arm/booting.txt
>> +++ b/docs/misc/arm/booting.txt
>> @@ -21,6 +21,10 @@ The exceptions to this on 32-bit ARM are as follows:
>>    zImage protocol should still be used and not the stricter "raw
>>    (non-zImage)" protocol described in arm/Booting.
>>
>> +The exceptions to this on 64-bit ARM are as follows:
>> +
>> + Xen binary should be loaded in memory below 2 TiB.
>> +
>>   There are no exception on 64-bit ARM.
> This sentence needs to be dropped then.

Whoops yes.

> 
> With that:
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>

Thanks!

Cheers,

-- 
Julien Grall

