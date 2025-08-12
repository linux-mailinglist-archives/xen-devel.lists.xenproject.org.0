Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C15B2254D
	for <lists+xen-devel@lfdr.de>; Tue, 12 Aug 2025 13:08:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1078666.1439702 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulmrM-0006Hm-Eo; Tue, 12 Aug 2025 11:08:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1078666.1439702; Tue, 12 Aug 2025 11:08:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulmrM-0006GE-Bz; Tue, 12 Aug 2025 11:08:04 +0000
Received: by outflank-mailman (input) for mailman id 1078666;
 Tue, 12 Aug 2025 11:08:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ulmrK-0006G0-Kf
 for xen-devel@lists.xenproject.org; Tue, 12 Aug 2025 11:08:02 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ulmrJ-001gBT-2D;
 Tue, 12 Aug 2025 11:08:01 +0000
Received: from [2a02:8012:3a1:0:e0a7:2160:d657:5746]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ulmrJ-001Bu8-2D;
 Tue, 12 Aug 2025 11:08:01 +0000
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
	bh=hejEGSHR1+hTvr/Wt3l9H/thl/ofYGhNSrM/zAR1BsE=; b=YbGk0K/jjjhHqrMuDcC4AAhEp2
	94SnovzCdRI8oAW1WZaBSOXrVE65RFhDPr4kCY2NkKtXc4JvwC0DGmimAxtyVkWhkL83gJksvuu2W
	UYTV8Pb3dHRfSGkNseDq/esz0p7YsqCK+FQXy8xY5SQYJxQBCfMeeOk0UBVtfmtGzknc=;
Message-ID: <6e243433-3d26-4727-95d1-a532da8a49d3@xen.org>
Date: Tue, 12 Aug 2025 12:07:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] xen/dom0less: arm: fix hwdom 1:1 low memory allocation
Content-Language: en-GB
To: Grygorii Strashko <grygorii_strashko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Denis Mukhin <dmukhin@ford.com>, Jason Andryuk <jason.andryuk@amd.com>,
 Julien Grall <jgrall@amazon.com>
References: <20250807100323.513384-1-grygorii_strashko@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20250807100323.513384-1-grygorii_strashko@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Grygorii,

On 07/08/2025 11:03, Grygorii Strashko wrote:
> From: Grygorii Strashko <grygorii_strashko@epam.com>
> 
> Call stack for dom0less hwdom case (1:1) memory:
> create_domUs
> |-construct_domU
>    |-construct_hwdom()
>      |-allocate_memory_11()
> 
> And allocate_memory_11() uses "dom0_mem" as:
> min_low_order =
>    get_order_from_bytes(min_t(paddr_t, dom0_mem, MB(128)));
> 
> In case of dom0less boot the "dom0_mem" is not used and defaulted to 0,
> which causes min_low_order to get high value > order and so no allocations
> happens from low memory.
> 
> Fix it, by using kinfo->unassigned_mem instead of "dom0_mem" which has
> correct memory size in both cases: regular dom0 boot and dom0less boot.
> 
> Fixes: 52cb53f1816a ("xen/arm: dom0less hwdom construction")
> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
> Reviewed-by: Denis Mukhin <dmukhin@ford.com>
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
> Acked-by: Julien Grall <jgrall@amazon.com>

I have now committed the patch.

Cheers,

-- 
Julien Grall


