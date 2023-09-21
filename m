Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57DB67A9733
	for <lists+xen-devel@lfdr.de>; Thu, 21 Sep 2023 19:17:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.606540.944521 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjNIO-0002kB-85; Thu, 21 Sep 2023 17:16:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 606540.944521; Thu, 21 Sep 2023 17:16:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjNIO-0002i4-5I; Thu, 21 Sep 2023 17:16:56 +0000
Received: by outflank-mailman (input) for mailman id 606540;
 Thu, 21 Sep 2023 17:16:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qjNIM-0002gb-Gi
 for xen-devel@lists.xenproject.org; Thu, 21 Sep 2023 17:16:54 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qjNIL-0005wX-Rj; Thu, 21 Sep 2023 17:16:53 +0000
Received: from [54.239.6.189] (helo=[192.168.8.60])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qjNIL-00020B-Gi; Thu, 21 Sep 2023 17:16:53 +0000
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
	bh=5D5IQFe3scphlDA4CFpjKIYmS4xHMpFoBS/wknH36xM=; b=s7wY4rzw5FWvP3xRX2GGgJJOA9
	pmUhKw+sMO5ocGhOT4QkvZ18WJCQerjBdHIG/4MRLCuL7pMSnHDFI40C6ff44QHaUhJ6t2n8QnwEf
	07hT1WyJTC38D4zS7GXRwN92ds1aovabikdyqeBz8XGYqH7Z9jYZ2AQu7N0llgpnqLnU=;
Message-ID: <0e8789b2-0b0e-4652-a1ee-b2d9efd804b9@xen.org>
Date: Thu, 21 Sep 2023 18:16:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm64: head.S: Fix wrong enable_boot_cpu_mm() code
 movement
Content-Language: en-GB
To: Henry Wang <Henry.Wang@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Chen <wei.chen@arm.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Julien Grall <jgrall@amazon.com>
References: <20230916040649.1232558-1-Henry.Wang@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230916040649.1232558-1-Henry.Wang@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Henry,

On 16/09/2023 05:06, Henry Wang wrote:
> Some addressed comments on enable_boot_cpu_mm() were reintroduced
> back during the code movement from arm64/head.S to arm64/mmu/head.S.
> We should drop the unreachable code, move the 'mov lr, x5' closer to
> 'b remove_identity_mapping' so it is clearer that it will return,
> and update the in-code comment accordingly.
> 
> Fixes: 6734327d76be ("xen/arm64: Split and move MMU-specific head.S to mmu/head.S")
> Reported-by: Julien Grall <jgrall@amazon.com>
> Signed-off-by: Henry Wang <Henry.Wang@arm.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

I plan to commit this patch in staging so it is part of 4.18. Please let 
me know if there are any objection.

Cheers,

-- 
Julien Grall

