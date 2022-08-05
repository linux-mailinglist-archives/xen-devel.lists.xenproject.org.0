Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6364058AEFA
	for <lists+xen-devel@lfdr.de>; Fri,  5 Aug 2022 19:35:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.381442.616135 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oK1EY-0007TG-98; Fri, 05 Aug 2022 17:35:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 381442.616135; Fri, 05 Aug 2022 17:35:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oK1EY-0007QB-4q; Fri, 05 Aug 2022 17:35:38 +0000
Received: by outflank-mailman (input) for mailman id 381442;
 Fri, 05 Aug 2022 17:35:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oK1EX-0007Pv-4F
 for xen-devel@lists.xenproject.org; Fri, 05 Aug 2022 17:35:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oK1EW-00064X-TV; Fri, 05 Aug 2022 17:35:36 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=[192.168.9.179]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oK1EW-0002fK-Nd; Fri, 05 Aug 2022 17:35:36 +0000
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
	bh=c8W8WX+tAgLhkadqHWznLBios+dKfOVAlXjWu8WVJTY=; b=AuC/CXAEUGuNu1vr3rUS+6IQcF
	E2AWzQ7Bnmf+g3Z8l7ndjfK4jKVM/byUQnmT811ortWpoYFJjaIqk9TPJiSrQn3A2e2It34l2QVBu
	pHqgkmh4M2CMJKVfePxN7ZMsjsWWo1a4yGbSGjSzdBlQmwoKMImAHfLKg5CZ86umBTH0=;
Message-ID: <047c108c-524c-27f9-2326-c015093990ce@xen.org>
Date: Fri, 5 Aug 2022 18:35:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.1.0
Subject: Re: [PATCH] arm/domain: fix comment for arch_set_info_guest
Content-Language: en-US
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, wei.chen@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220805130800.16387-1-luca.fancellu@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220805130800.16387-1-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Luca,

On 05/08/2022 14:08, Luca Fancellu wrote:
> The function arch_set_info_guest is not reached anymore through
> VCPUOP_initialise on arm, update the comment.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
> Changes in v2:
>   - rephrased comment to not list caller functions (Julien)
> ---
>   xen/arch/arm/domain.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index 2cd481979cf1..9db8a37a089c 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -885,9 +885,8 @@ static int is_guest_pv64_psr(uint64_t psr)
>   #endif
>   
>   /*
> - * Initialise VCPU state. The context can be supplied by either the
> - * toolstack (XEN_DOMCTL_setvcpucontext) or the guest
> - * (VCPUOP_initialise) and therefore must be properly validated.
> + * Initialise vCPU state. The context may be supplied by an external entity, so
> + * we need to validate it

NIT: Missing a full stop. This can be added on commit.

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

