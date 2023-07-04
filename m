Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 203B574784A
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jul 2023 20:28:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558620.872887 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGklV-0007eS-AR; Tue, 04 Jul 2023 18:28:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558620.872887; Tue, 04 Jul 2023 18:28:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGklV-0007ck-73; Tue, 04 Jul 2023 18:28:41 +0000
Received: by outflank-mailman (input) for mailman id 558620;
 Tue, 04 Jul 2023 18:28:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qGklU-0007ce-32
 for xen-devel@lists.xenproject.org; Tue, 04 Jul 2023 18:28:40 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qGklT-0007dK-WB; Tue, 04 Jul 2023 18:28:39 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234] helo=[192.168.9.70])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qGklT-0007pY-Qy; Tue, 04 Jul 2023 18:28:39 +0000
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
	bh=sl7a547exq3daUqVNlCI3Uw614+AwnEgFNAX9X2TPsg=; b=d7Sxl6veZYilboyrLc/Gck1Lzy
	7bdwOysuD5nUcduFjZvQxUOKtN6fM4nmWRvlnuywbCeM+QRg3mfvATw+L2Yo03qF1hJ8i7Tyxg3bv
	kNTSZtXzRX9TVp/H0LwjzCdtLqCD+pGDgI97iOlJvQk5y7MHuPO4H7945sLeTojHK1ts=;
Message-ID: <de2dbf5c-1165-6297-cbac-b2de6945b880@xen.org>
Date: Tue, 4 Jul 2023 19:28:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [v2 3/4] xen/arm: Rework the code mapping Xen to avoid relying on
 the size of Xen
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Luca.Fancellu@arm.com, Henry.Wang@arm.com,
 Julien Grall <jgrall@amazon.com>
References: <20230629201129.12934-1-julien@xen.org>
 <20230629201129.12934-4-julien@xen.org>
 <c921be22-d272-5c15-24d8-5002f9773e16@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <c921be22-d272-5c15-24d8-5002f9773e16@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 30/06/2023 07:56, Michal Orzel wrote:
> 
> 
> On 29/06/2023 22:11, Julien Grall wrote:
>>
>>
>> From: Julien Grall <jgrall@amazon.com>
>>
>> At the moment, the maximum size of Xen binary we can support is 2MB.
>> This is what we reserved in the virtual address but also what all
>> the code in Xen relies on as we only allocate one L3 page-table.
>>
>> When feature like UBSAN (will be enabled in a follow-up patch) and GCOV
>> are enabled, the binary will be way over 2MB.
>>
>> The code is now reworked so it doesn't rely on a specific size but
>> will instead look at the reversed size and compute the number of
>> page-table to allocate/map.
>>
>> While at it, replace any reference to 4KB mappings with a more
>> generic word because the page-size may change in the future.
>>
>> Also fix the typo s/tlb/tbl/ in code move in arm32/head.S
> as well as in arm64 (can be done on commit)

I have replaced "arm32/head.S" with "arm{32,64}/head.S".

> 
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>

Thanks!

Cheers,

-- 
Julien Grall

