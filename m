Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B97EC584540
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jul 2022 20:08:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.377011.610055 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oH7uf-0004U5-7J; Thu, 28 Jul 2022 18:07:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 377011.610055; Thu, 28 Jul 2022 18:07:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oH7uf-0004Rn-4c; Thu, 28 Jul 2022 18:07:09 +0000
Received: by outflank-mailman (input) for mailman id 377011;
 Thu, 28 Jul 2022 18:07:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oH7ud-0004Rh-70
 for xen-devel@lists.xenproject.org; Thu, 28 Jul 2022 18:07:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oH7ud-00070z-0L; Thu, 28 Jul 2022 18:07:07 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224] helo=[10.7.237.22])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oH7uc-00078p-Qf; Thu, 28 Jul 2022 18:07:06 +0000
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
	bh=CffEOejg/97gcWHXDWHuiOgjKlOCmVjQB8zcQBt7E1c=; b=p4BNR3/+zkgFgfdZNUHstDv/D4
	h+Bt1jQfziMrwkDgoRPhcx2IU9UO2FGjQ8TQKHvgv+ibXZT2CuPEM+5ALw4x6p5kayoCodSDLrGcE
	KUyFZKkZUY17aoL8WILpB4d0DNBxEzWAfFUdwUYgvNRNJrC3CMI7Sqdveg1Wpbhypo9U=;
Message-ID: <e069280a-4d97-7a63-a125-b8ef3c397319@xen.org>
Date: Thu, 28 Jul 2022 19:07:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.0.3
Subject: Re: [PATCH] arm/domain: fix comment for arch_set_info_guest
Content-Language: en-US
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, wei.chen@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220725144634.8086-1-luca.fancellu@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220725144634.8086-1-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Luca,

On 25/07/2022 15:46, Luca Fancellu wrote:
> The function arch_set_info_guest is not reached anymore through
> VCPUOP_initialise on arm, update the comment.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
>   xen/arch/arm/domain.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index 2f8eaab7b56b..6451cd013c1a 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -882,9 +882,9 @@ static int is_guest_pv64_psr(uint64_t psr)
>   #endif
>   
>   /*
> - * Initialise VCPU state. The context can be supplied by either the
> - * toolstack (XEN_DOMCTL_setvcpucontext) or the guest
> - * (VCPUOP_initialise) and therefore must be properly validated.
> + * Initialise VCPU state. The context can be supplied by the toolstack
> + * (XEN_DOMCTL_setvcpucontext) and therefore must be properly validated,
> + * or by PSCI call (PSCI_cpu_on) handled by vpsci module.
>    */

I would prefer if the comment doesn't mention who are the callers. So 
there are no need to modify the comment the next time we add/remove a 
caller. How about something like:

"Initialise vCPU state. The context may be supplied by an external 
entity, so we need to validate it"

Cheers,

-- 
Julien Grall

