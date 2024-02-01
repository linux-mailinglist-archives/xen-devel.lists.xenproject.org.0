Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86EFE845EA8
	for <lists+xen-devel@lfdr.de>; Thu,  1 Feb 2024 18:37:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.674612.1049686 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVaz6-0002cq-Mb; Thu, 01 Feb 2024 17:36:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 674612.1049686; Thu, 01 Feb 2024 17:36:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVaz6-0002ao-K2; Thu, 01 Feb 2024 17:36:20 +0000
Received: by outflank-mailman (input) for mailman id 674612;
 Thu, 01 Feb 2024 17:36:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rVaz5-0002ai-8B
 for xen-devel@lists.xenproject.org; Thu, 01 Feb 2024 17:36:19 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rVaz4-00061F-QR; Thu, 01 Feb 2024 17:36:18 +0000
Received: from [15.248.2.31] (helo=[10.24.67.35])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rVaz4-0005vb-Hi; Thu, 01 Feb 2024 17:36:18 +0000
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
	bh=zsnw957Hfwirsjx1xy39SSyh4Kw8IBkEQYb1cspkB/c=; b=FX7P5C9pdrgsi43y/iDae+DJJC
	mmM2UGQmE7hOuwHFuSTgD2wV1ZRhXtvbITAApdR/BMd+dwVa/pGPptoEZ4vcSqGMmSIucUWP5Upre
	tET1nn5xwTFggQPLuLiYeqrwGKRIFlOJGQNJew0dmlJ3vDZ1CcKZuNsryYu8Cskxq55k=;
Message-ID: <aa433592-56d7-44f5-9f2d-a5288a6fd766@xen.org>
Date: Thu, 1 Feb 2024 17:36:16 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: Properly clean update to init_ttbr and
 smp_up_cpu
Content-Language: en-GB
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Julien Grall <jgrall@amazon.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
References: <20240130172942.52175-1-julien@xen.org>
 <0D96C966-8DC4-43C5-9F61-0C54A2DC796C@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <0D96C966-8DC4-43C5-9F61-0C54A2DC796C@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 31/01/2024 07:57, Bertrand Marquis wrote:
>> On 30 Jan 2024, at 18:29, Julien Grall <julien@xen.org> wrote:
>>
>> From: Julien Grall <jgrall@amazon.com>
>>
>> Recent rework to the secondary boot code modified how init_ttbr and
>> smp_up_cpu are accessed. Rather than directly accessing them, we
>> are using a pointer to them.
>>
>> The helper clean_dcache() is expected to take the variable in parameter
>> and then clean its content. As we now pass a pointer to the variable,
>> we will clean the area storing the address rather than the content itself.
>>
>> Switch to use clean_dcache_va_range() to avoid casting the pointer.
>>
>> Fixes: a5ed59e62c6f ("arm/mmu: Move init_ttbr to a new section .data.idmap")
>> Fixes: 9a5114074b04 ("arm/smpboot: Move smp_up_cpu to a new section .data.idmap)
>>
>> Reported-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Committed. Thanks.

Cheers,

-- 
Julien Grall

