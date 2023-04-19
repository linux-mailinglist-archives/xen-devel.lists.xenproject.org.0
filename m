Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6A36E8140
	for <lists+xen-devel@lfdr.de>; Wed, 19 Apr 2023 20:29:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523731.814062 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppCYu-0000zz-If; Wed, 19 Apr 2023 18:29:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523731.814062; Wed, 19 Apr 2023 18:29:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppCYu-0000xd-G2; Wed, 19 Apr 2023 18:29:48 +0000
Received: by outflank-mailman (input) for mailman id 523731;
 Wed, 19 Apr 2023 18:29:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ppCYs-0000xV-JP
 for xen-devel@lists.xenproject.org; Wed, 19 Apr 2023 18:29:46 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ppCYs-0004yF-3a; Wed, 19 Apr 2023 18:29:46 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.29.18]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ppCYr-0008EW-Q4; Wed, 19 Apr 2023 18:29:45 +0000
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
	bh=72hGMZruVJR4m0hVe2ukYNscQjKQ+xnXYty2iQP2X14=; b=3LNIU4x11vTdZn/5wqKank1G1p
	h2Bwy9IWxZG4qi/tFYREPsp8WoVqT6XYEujzk5qHHm3+B9RjgWy36iEM5zQDvnN1JVtXcXT7dCZ5D
	rLbE1hk6+8Ho0FTJenHGsX/BPcB3ZdrcEW4zS6dwZdKBD7uVlcuKs0J55zpyCFhk1PeE=;
Message-ID: <1c6c87bc-df60-830b-a6c1-9e99df8b865d@xen.org>
Date: Wed, 19 Apr 2023 19:29:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH 0/3] xen/arm: fix build errors with -Og
Content-Language: en-US
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <20230414185714.292881-1-stewart.hildebrand@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230414185714.292881-1-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stewart,

On 14/04/2023 19:57, Stewart Hildebrand wrote:
> This is a collection of fixes needed to build the hypervisor with -Og for arm64.
> 
> I build-tested this with the following command:
> 
> make -j $(nproc) \
>      EXTRA_CFLAGS_XEN_CORE="-Og" \
>      XEN_TARGET_ARCH=arm64 \
>      CROSS_COMPILE=aarch64-none-linux-gnu- \
>      dist-xen
> 
> 
> Stewart Hildebrand (3):
>    xen/arm: mark __guest_cmpxchg always_inline
>    xen/efi: fix unitialized use warning
>    xen/arm: fix unitialized use warning

I have committed patch #1 and #3. Jan already committed patch #2.

Thanks,

-- 
Julien Grall

