Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD48775984
	for <lists+xen-devel@lfdr.de>; Wed,  9 Aug 2023 13:01:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.580887.909361 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTgw8-0006hg-M3; Wed, 09 Aug 2023 11:01:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 580887.909361; Wed, 09 Aug 2023 11:01:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTgw8-0006eo-JE; Wed, 09 Aug 2023 11:01:08 +0000
Received: by outflank-mailman (input) for mailman id 580887;
 Wed, 09 Aug 2023 11:01:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qTgw6-0006eP-BR
 for xen-devel@lists.xenproject.org; Wed, 09 Aug 2023 11:01:06 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qTgw6-0005z1-2q; Wed, 09 Aug 2023 11:01:06 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=[192.168.16.102]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qTgw5-0002MQ-T0; Wed, 09 Aug 2023 11:01:06 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	References:Cc:To:From:Subject:MIME-Version:Date:Message-ID;
	bh=xOx+4Ax9tWrThOMr59/CmR+MJNDke0Rlr81gpb/QdF0=; b=BPYLpauOeaw4+ra7gYleAt/E/E
	ODNwbji6dcTkLFks8Cp1R9YG39SwFCS7rzvQivGMFclSgy7DTVzZsrJlXKTTGlQrEqhK31yY+lM2m
	ZzRIwmCgRSHXolId+1silHXz2dukjudH9hDzpfFiu7vqqnxe0a7VfKXo0sngxiz/TFJc=;
Message-ID: <42256506-2437-4f6a-849d-df8101ec6aa9@xen.org>
Date: Wed, 9 Aug 2023 12:01:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm64: head: Introduce a helper to flush local TLBs
Content-Language: en-GB
From: Julien Grall <julien@xen.org>
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230808110739.1296-1-michal.orzel@amd.com>
 <55750925-8966-47ef-ace1-712a9467876b@xen.org>
In-Reply-To: <55750925-8966-47ef-ace1-712a9467876b@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 09/08/2023 12:00, Julien Grall wrote:
> Hi Michal,
> 
> On 08/08/2023 12:07, Michal Orzel wrote:
>> Instead of repeating the same sequence of instructions to flush the TLBs
>> in various places, introduce a macro flush_xen_tlb_local and make use of
>> it. This is similar to what was done for arm32 by the commit:
>> dea9dddeceec8a1d68da24b14d5b2396effe555f
> 
> NIT: In general, we tend to refer to commit with the abbreviated ID and 
> the title.
> 
>>
>> This is also making the flush sequence in enable_mmu more clear and
>> consistent.
>>
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> 
> Reviewed-by: Julien Grall <jgrall@amazon.com>

I forgot to mention that I have committed the patch.

Cheers,

-- 
Julien Grall

