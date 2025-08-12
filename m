Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70946B2254A
	for <lists+xen-devel@lfdr.de>; Tue, 12 Aug 2025 13:07:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1078660.1439692 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulmqp-0005jD-7A; Tue, 12 Aug 2025 11:07:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1078660.1439692; Tue, 12 Aug 2025 11:07:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulmqp-0005he-4K; Tue, 12 Aug 2025 11:07:31 +0000
Received: by outflank-mailman (input) for mailman id 1078660;
 Tue, 12 Aug 2025 11:07:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ulmqn-0005hD-Gz
 for xen-devel@lists.xenproject.org; Tue, 12 Aug 2025 11:07:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ulmqm-001g8Z-2h;
 Tue, 12 Aug 2025 11:07:29 +0000
Received: from [2a02:8012:3a1:0:e0a7:2160:d657:5746]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ulmqm-001Bsw-2u;
 Tue, 12 Aug 2025 11:07:29 +0000
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
	bh=P3Te2DYmwV3kk/YkaQbhpOAj1pTrKc6f7+pCQ77RCsU=; b=TRBGKhBzhnbw6zjuwsYmDrdcz2
	oRL0ZYyMa7agWelaEuGHHlMGzFOsOxAkcHFYERqhSj7jgSJDDl0G5+pTHIF+AfMTlXdjUJ/c6K18W
	XGq+PR1mnEdh/o6YwfJ+OBwQxqMudait4IFcXCCVmLY3PVbYWC0HiTdo46DMqO8RqebU=;
Message-ID: <7ff1a083-d9f2-46c3-b347-d26e11d2310f@xen.org>
Date: Tue, 12 Aug 2025 12:07:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/arm: irq: add missing spin_unlock() in
 init_local_irq_data() error path
Content-Language: en-GB
From: Julien Grall <julien@xen.org>
To: Mykola Kvach <xakep.amatop@gmail.com>, xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Denis Mukhin <dmukhin@ford.com>
References: <f983bb7c3c9f0912da7e7f2fc22384ce1081a7a3.1754901835.git.mykola_kvach@epam.com>
 <1a51ba8c-93c5-4cfb-b76e-26e318c0b22d@xen.org>
In-Reply-To: <1a51ba8c-93c5-4cfb-b76e-26e318c0b22d@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/08/2025 18:28, Julien Grall wrote:
> Hi Mykola,
> 
> On 11/08/2025 09:45, Mykola Kvach wrote:
>> From: Mykola Kvach <mykola_kvach@epam.com>
>>
>> If init_one_irq_desc() fails, init_local_irq_data() returns without
>> releasing local_irqs_type_lock, leading to a possible deadlock.
>>
>> Release the lock before returning to ensure proper cleanup.
>>
>> Fixes: 2bb32b809250 ("xen/irq: Propagate the error from 
>> init_one_desc_irq() in init_*_irq_data()")
>> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
>> Reviewed-by: Denis Mukhin <dmukhin@ford.com>
> 
> Acked-by: Julien Grall <jgrall@amazon.com>
> 
> I will commit the patch soon.

This is now merged.

Cheers,

-- 
Julien Grall


