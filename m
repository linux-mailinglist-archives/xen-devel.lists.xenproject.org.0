Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8639DF221
	for <lists+xen-devel@lfdr.de>; Sat, 30 Nov 2024 18:08:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.846185.1261390 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tHQvq-0000Nx-DG; Sat, 30 Nov 2024 17:06:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 846185.1261390; Sat, 30 Nov 2024 17:06:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tHQvq-0000LE-9G; Sat, 30 Nov 2024 17:06:58 +0000
Received: by outflank-mailman (input) for mailman id 846185;
 Sat, 30 Nov 2024 17:06:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tHQvp-0000L8-0E
 for xen-devel@lists.xenproject.org; Sat, 30 Nov 2024 17:06:57 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tHQvo-00DSJn-0h;
 Sat, 30 Nov 2024 17:06:56 +0000
Received: from [2a02:8012:3a1:0:d435:aa99:ecdf:cc2c]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tHQvo-005u6v-0k;
 Sat, 30 Nov 2024 17:06:56 +0000
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
	bh=VytcNK4yvhDoFgVfxxU51L/CmXjauLny8VyOmxmZDLM=; b=ygj9Zo3W4o2uBeoP44WvOCTPQk
	cltwCuLSwcbnBUZWQLowPEXlin147+qX7FfbiGL1E5HYTKfptXZ4zB863UwXVO4FE8+QeDxpCyaXM
	p13V3eNOUfUsINs93SUnzM9CSfRcATdNjzDeoOawLgfuRQMxQ56u2NgCtTv4QakU1yc8=;
Message-ID: <566b57f5-8e58-4364-80fd-0db327f211ee@xen.org>
Date: Sat, 30 Nov 2024 17:06:54 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] xen: arm: enable stack protector feature
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <20241130010954.36057-1-volodymyr_babchuk@epam.com>
 <20241130010954.36057-4-volodymyr_babchuk@epam.com>
Content-Language: en-GB
From: Julien Grall <julien@xen.org>
In-Reply-To: <20241130010954.36057-4-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Volodymyr,

On 30/11/2024 01:10, Volodymyr Babchuk wrote:
> Enable previously added CONFIG_STACK_PROTECTOR feature for ARM
> platform. Here we can call boot_stack_chk_guard_setup() in start_xen()
> function, because it never returns, so stack protector code will not
> be triggered because of changed canary.

It would be good to explain how you decided to call...

> 
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> 
> ---
> 
> In v2:
>   - Reordered Kconfig entry
> ---
>   xen/arch/arm/Kconfig | 1 +
>   xen/arch/arm/setup.c | 3 +++
>   2 files changed, 4 insertions(+)
> 
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index 23bbc91aad..a24c88c327 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -16,6 +16,7 @@ config ARM
>   	select HAS_ALTERNATIVE if HAS_VMAP
>   	select HAS_DEVICE_TREE
>   	select HAS_PASSTHROUGH
> +	select HAS_STACK_PROTECTOR
>   	select HAS_UBSAN
>   	select IOMMU_FORCE_PT_SHARE
>   
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index 2e27af4560..f855e97e25 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -13,6 +13,7 @@
>   #include <xen/domain_page.h>
>   #include <xen/grant_table.h>
>   #include <xen/types.h>
> +#include <xen/stack-protector.h>
>   #include <xen/string.h>
>   #include <xen/serial.h>
>   #include <xen/sched.h>
> @@ -341,6 +342,8 @@ void asmlinkage __init start_xen(unsigned long fdt_paddr)
>        */
>       system_state = SYS_STATE_boot;
>   
> +    boot_stack_chk_guard_setup();

... the function here. If I am not mistaken, at this point, cpu_khz 
(used by NOW() in get_random()) would be zero. It is only initialized by 
preinit_xen_time() which happens later.

So I think it should be called a bit further down and gain a comment to 
about the call dependencies.

Cheers,

-- 
Julien Grall


