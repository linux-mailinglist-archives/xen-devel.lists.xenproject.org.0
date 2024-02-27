Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65AD8868EB4
	for <lists+xen-devel@lfdr.de>; Tue, 27 Feb 2024 12:24:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686015.1067531 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1revZF-0006sD-3c; Tue, 27 Feb 2024 11:24:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686015.1067531; Tue, 27 Feb 2024 11:24:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1revZE-0006p1-W5; Tue, 27 Feb 2024 11:24:12 +0000
Received: by outflank-mailman (input) for mailman id 686015;
 Tue, 27 Feb 2024 11:24:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1revZC-0006ov-Mg
 for xen-devel@lists.xenproject.org; Tue, 27 Feb 2024 11:24:10 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1revZC-0006ez-CP; Tue, 27 Feb 2024 11:24:10 +0000
Received: from [15.248.2.14] (helo=[10.45.19.66])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1revZC-0001v2-62; Tue, 27 Feb 2024 11:24:10 +0000
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
	bh=PC1ttbj9W64G47kcVHzRW1GrwvQsq11zrRsFg1UCMr4=; b=kCcQdViTkVNDkIfx8A6dzwL2Br
	y8wjKxk0lukrCM0TG7GJ81RGS8aabgANqq2TBbgxKoV5PM1f65J9Sfq2V58Yl/k/irtR0tZVNnYwC
	yrmM10K4Z6+DL0f8ItPs4MGbFs3rLBgFsanN2SP3OThADeZVjsvx87UD3xNWSWp+ANRA=;
Message-ID: <bbd0a238-05f3-4d2b-8450-d431570e31b4@xen.org>
Date: Tue, 27 Feb 2024 11:24:08 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v5] xen/arm: ffa: reclaim shared memory on guest
 destroy
Content-Language: en-GB
To: Jens Wiklander <jens.wiklander@linaro.org>, xen-devel@lists.xenproject.org
Cc: patches@linaro.org, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20240213111336.881934-1-jens.wiklander@linaro.org>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240213111336.881934-1-jens.wiklander@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 13/02/2024 11:13, Jens Wiklander wrote:
> When an FF-A enabled guest is destroyed it may leave behind memory
> shared with SPs. This memory must be reclaimed before it's reused or an
> SP may make changes to memory used by a new unrelated guest. So when the
> domain is teared down add FF-A requests to reclaim all remaining shared
> memory.
> 
> SPs in the secure world are notified using VM_DESTROYED that a guest has
> been destroyed. An SP is supposed to relinquish all shared memory to allow
> reclaiming the memory. The relinquish operation may need to be delayed if
> the shared memory is for instance part of a DMA operation.
> 
> The domain reference counter is increased when the first FF-A shared
> memory is registered and the counter is decreased again when the last
> shared memory is reclaimed. If FF-A shared memory registrations remain
> at the end of of ffa_domain_teardown() a timer is set to try to reclaim
> the shared memory every second until the memory is reclaimed.
> 
> A few minor style fixes with a removed empty line here and an added new
> line there.
> 
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

This is now committed.

Cheers,

-- 
Julien Grall

