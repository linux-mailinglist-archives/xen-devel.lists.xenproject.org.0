Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40EE6B1BBA0
	for <lists+xen-devel@lfdr.de>; Tue,  5 Aug 2025 23:07:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1070982.1434565 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujOsf-0000Xr-M2; Tue, 05 Aug 2025 21:07:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1070982.1434565; Tue, 05 Aug 2025 21:07:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujOsf-0000VW-Ic; Tue, 05 Aug 2025 21:07:33 +0000
Received: by outflank-mailman (input) for mailman id 1070982;
 Tue, 05 Aug 2025 21:07:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ujOse-0000VO-0p
 for xen-devel@lists.xenproject.org; Tue, 05 Aug 2025 21:07:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ujOsd-002uYW-0J;
 Tue, 05 Aug 2025 21:07:31 +0000
Received: from [2a02:8012:3a1:0:d57f:c918:5b22:a406]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ujOsc-0068HN-2d;
 Tue, 05 Aug 2025 21:07:30 +0000
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
	bh=SlCOk/8WqC6UuveQSRLxilIMD74FmsC3e2Z9QycD6FE=; b=QvhKoaXmSJOlTAEV4bjqQ5ipSs
	xK4QGRcyG51qF6A4CMubsBNVS1IcaDVIR6RgsoXUSg9dZuK24plPVX1BKE9IbnDdAw0OOe5HEHJSM
	O5EMIYMK6Lua4Bh06xFWYl04Ks7GhIhTJIUBBItqnHD6k5e8D6+sADytqz6zzziXAC1g=;
Message-ID: <5807ed03-7db2-4ce6-9acf-c4d515fbd293@xen.org>
Date: Tue, 5 Aug 2025 22:07:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/dom0less: arm: fix hwdom 1:1 low memory allocation
Content-Language: en-GB
To: Grygorii Strashko <grygorii_strashko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Denis Mukhin <dmukhin@ford.com>, Jason Andryuk <jason.andryuk@amd.com>
References: <20250805190017.209711-1-grygorii_strashko@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20250805190017.209711-1-grygorii_strashko@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Grygorii,

On 05/08/2025 20:00, Grygorii Strashko wrote:
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

 From docs/mics/xen-command-linux.pandoc:

---

### dom0_mem (ARM)
 > `= <size>`

Set the amount of memory for the initial domain (dom0). It must be
greater than zero. This parameter is required.

---

If dom0_mem is effectively optional, then shouldn't the doc be updated?

> which causes min_low_order to get high value > order and so no allocations
> happens from low memory.
 > > Fix it, by using kinfo->unassigned_mem instead of "dom0_mem" has 
correct
> memory size in both cases: regular dom0 boot and dom0less boot.
> 
> Fixes: 52cb53f1816a ("xen/arm: dom0less hwdom construction")
> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
> Reviewed-by: Denis Mukhin <dmukhin@ford.com>
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall


