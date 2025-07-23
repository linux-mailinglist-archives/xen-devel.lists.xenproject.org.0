Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 112E2B0EE35
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 11:17:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1053634.1422397 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueVay-0000w3-U9; Wed, 23 Jul 2025 09:17:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1053634.1422397; Wed, 23 Jul 2025 09:17:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueVay-0000tj-R6; Wed, 23 Jul 2025 09:17:04 +0000
Received: by outflank-mailman (input) for mailman id 1053634;
 Wed, 23 Jul 2025 09:17:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ueVax-0000td-99
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 09:17:03 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ueVaw-00EpCy-0k;
 Wed, 23 Jul 2025 09:17:02 +0000
Received: from [15.248.2.234] (helo=[10.24.67.34])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ueVav-009KIM-2b;
 Wed, 23 Jul 2025 09:17:02 +0000
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
	bh=Z+zGuouUqp7O/NI8O1DApHuCWPkhtMUMcQRW7DRmTTI=; b=x2dl/l+aHZAjMhLSJpj9VC5zs5
	3qcG9AYlVFYJC3G6WJN+XHHxNJCjTWaBKB5CY2GhTiQg5Iqic9DaM/LN2Qysnb09+9FasTo6tgqoY
	B+X61CyPHLgdmD0L8USccn2iSCotppCGYBog7Splh3R++gdypaSLwNjNVSlRw25el1l4=;
Message-ID: <99c88af9-7f89-4d7c-9827-1ba85c803195@xen.org>
Date: Wed, 23 Jul 2025 10:16:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH 2/8] xen/arm: move vcpu_switch_to_aarch64_mode() in
 arch_vcpu_create()
To: Grygorii Strashko <grygorii_strashko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>
References: <20250723075835.3993182-1-grygorii_strashko@epam.com>
 <20250723075835.3993182-3-grygorii_strashko@epam.com>
Content-Language: en-US
From: Julien Grall <julien@xen.org>
In-Reply-To: <20250723075835.3993182-3-grygorii_strashko@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 23/07/2025 08:58, Grygorii Strashko wrote:
> From: Grygorii Strashko <grygorii_strashko@epam.com>
> 
> Move vcpu_switch_to_aarch64_mode() in arch_vcpu_create() callback instead
> of calling it manually from few different places after vcpu_create().
> 
> Before doing above ensure vcpu0 is created after kernel_probe() is done and
> domain's guest execution mode (32-bit/64-bit) is set for dom0 and dom0less
> domains.

The commit message doesn't mention anything about domains created by the 
toolstack. In this case, from my understanding, the switch to 64-bit 
domain happens *after* the vCPUs are created.

At the moment, I think this is probably ok to call...

> 
> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
> ---
>   xen/arch/arm/domain.c                    |  3 +++
>   xen/arch/arm/domain_build.c              | 13 +++++--------
>   xen/common/device-tree/dom0less-build.c  |  6 +++---
>   xen/include/asm-generic/dom0less-build.h |  2 +-
>   4 files changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index 79a144e61be9..bbd4a764c696 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -586,6 +586,9 @@ int arch_vcpu_create(struct vcpu *v)
>       if ( get_ssbd_state() == ARM_SSBD_RUNTIME )
>           v->arch.cpu_info->flags |= CPUINFO_WORKAROUND_2_FLAG;
>   
> +    if ( is_64bit_domain(v->domain) )
> +        vcpu_switch_to_aarch64_mode(v);

... this function here because I *think* it would be NOP. But this feels 
really fragile.

If the desire is to make 32-bit domain optional on Arm64. Then I think 
it would be better to pass the domain type when the domain is created 
(IOW add an extra flags to XEN_DOMCTL_createdomain). This will require 
more work, but it will be a lot more robust.

Cheers,

-- 
Julien Grall


