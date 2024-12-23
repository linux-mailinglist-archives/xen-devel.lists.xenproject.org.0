Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F1A89FACF7
	for <lists+xen-devel@lfdr.de>; Mon, 23 Dec 2024 11:07:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.862810.1274345 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tPfKt-00042f-CU; Mon, 23 Dec 2024 10:06:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 862810.1274345; Mon, 23 Dec 2024 10:06:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tPfKt-00040E-9C; Mon, 23 Dec 2024 10:06:51 +0000
Received: by outflank-mailman (input) for mailman id 862810;
 Mon, 23 Dec 2024 10:06:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tPfKs-000403-5n
 for xen-devel@lists.xenproject.org; Mon, 23 Dec 2024 10:06:50 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tPfKr-000X7w-1G;
 Mon, 23 Dec 2024 10:06:49 +0000
Received: from [2a02:8012:3a1:0:ed95:e074:2d19:de59]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tPfKr-00FF5U-1N;
 Mon, 23 Dec 2024 10:06:49 +0000
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
	bh=KNX5RKrqTIbir8pg+8ZJSKXL7NeP6ZV2OfAyXEPyr+g=; b=NcX8AowuSR6PrMaKVZxE3709+9
	B/mIRbK465dTJqgDwF0JrHdbcjJm7NihykoECJJwNkFdwsapyBXwwWoytP8TUjxgT2L8B5nKQc1wU
	PGWFz8aRrRl2K6xp9bvD06c91pc2283xkzH6wL6nzLOq5t6syQdCi9hhHCdXbYEDpVkI=;
Message-ID: <c39709e1-bbdb-4995-b507-212eec7c84e6@xen.org>
Date: Mon, 23 Dec 2024 10:06:47 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: Initialise memory type for struct kernel_info
Content-Language: en-GB
To: Michal Orzel <michal.orzel@amd.com>, Luca Fancellu
 <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20241220151941.4192864-1-luca.fancellu@arm.com>
 <2a7ac358-7f43-4e32-9e1e-9ce1cd45304a@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <2a7ac358-7f43-4e32-9e1e-9ce1cd45304a@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michal,

On 23/12/2024 07:58, Michal Orzel wrote:
> 
> 
> On 20/12/2024 16:19, Luca Fancellu wrote:
>>
>>
>> Commit a14593e3995a ("xen/device-tree: Allow region overlapping with
>> /memreserve/ ranges") introduced a type in the 'struct membanks_hdr'
>> but forgot to update the 'struct kernel_info' initialiser, while
>> it doesn't lead to failures because the field is not currently
>> used while managing kernel_info structures, it's good to have it
>> for completeness.
> The last part "good to have it" does not sound like we need a Fixes tag.

Reading the discussion, it sounds like ".type" is not always set and 
this is not properly documented. This means that in the future we may 
write a patch that requires to use ".type" and needs backported.

But this would depend on this patch which was not tagged appropriately. 
Therefore, I would argue it needs a fixes tag (even though this is a 
latent bug) or at least a backport request.

Cheers,

-- 
Julien Grall


