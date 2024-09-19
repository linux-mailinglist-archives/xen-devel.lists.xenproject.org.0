Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 256DA97CA15
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2024 15:20:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.800777.1210781 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1srH4t-0005fS-1U; Thu, 19 Sep 2024 13:20:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 800777.1210781; Thu, 19 Sep 2024 13:20:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1srH4s-0005dG-Uh; Thu, 19 Sep 2024 13:20:10 +0000
Received: by outflank-mailman (input) for mailman id 800777;
 Thu, 19 Sep 2024 13:20:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1srH4r-0005dA-Cr
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2024 13:20:09 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1srH4q-0006aa-O8; Thu, 19 Sep 2024 13:20:08 +0000
Received: from [83.68.141.146] (helo=[10.134.2.85])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1srH4q-00054Z-HH; Thu, 19 Sep 2024 13:20:08 +0000
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
	bh=bzEu1I334/4zXrv7InFUmeeQSMkezeGhIwGhyh+H5Us=; b=Z6roFkYnAjWyrMJc8rt1LMjiDD
	BGWHGayUuTFOfxVp9c4mniyBgdesb8hS68r37KBkl2WcKnweF7r6/xGlb/07zyDjKcUFhWECpuhof
	9pN6AS82XMTLfEpQrkrKvwo0hz5eqTUrt3kqhqblBye1zR+GDTio1vxhFgDIS+pHYUbs=;
Message-ID: <10089a3c-ebcd-45cd-a442-53e34f76e7ce@xen.org>
Date: Thu, 19 Sep 2024 15:20:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] xen/arm: mpu: Implement a dummy
 enable_secondary_cpu_mm
Content-Language: en-GB
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240918175102.223076-1-ayan.kumar.halder@amd.com>
 <20240918175102.223076-5-ayan.kumar.halder@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240918175102.223076-5-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 18/09/2024 19:51, Ayan Kumar Halder wrote:
> Secondary cpus initialization is not yet supported. Thus, we print an
> appropriate message and put the secondary cpus in WFE state.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
> Changes from :-
> 
> v1 - 1. NR_CPUS is defined as 1 for MPU
> 
> 2. Added a message in enable_secondary_cpu_mm()
> 
>   xen/arch/Kconfig              |  1 +
>   xen/arch/arm/arm64/mpu/head.S | 10 ++++++++++
>   2 files changed, 11 insertions(+)
> 
> diff --git a/xen/arch/Kconfig b/xen/arch/Kconfig
> index 308ce129a8..8640b7ec8b 100644
> --- a/xen/arch/Kconfig
> +++ b/xen/arch/Kconfig
> @@ -11,6 +11,7 @@ config NR_CPUS
>   	default "8" if ARM && RCAR3
>   	default "4" if ARM && QEMU
>   	default "4" if ARM && MPSOC
> +	default "1" if ARM && MPU
>   	default "128" if ARM
>   	help
>   	  Controls the build-time size of various arrays and bitmaps
> diff --git a/xen/arch/arm/arm64/mpu/head.S b/xen/arch/arm/arm64/mpu/head.S
> index ef55c8765c..3dfbbf8879 100644
> --- a/xen/arch/arm/arm64/mpu/head.S
> +++ b/xen/arch/arm/arm64/mpu/head.S
> @@ -168,6 +168,16 @@ FUNC(enable_boot_cpu_mm)
>       b   1b
>   END(enable_boot_cpu_mm)
>   
> +/*
> + * Secondary cpu has not yet been supported on MPU systems. We will block the
> + * secondary cpu bringup at this stage.

Given that NR_CPUS is 1, this should not be reachable. How about the 
following comment:

"We don't yet support secondary CPUs bring-up. Implement a dummy helper 
to please the common code."

> + */
> +ENTRY(enable_secondary_cpu_mm)
> +1:  PRINT("- SMP not enabled yet -\r\n")

You want the print to be outside of the loop. Otherwise, it will spam 
the console in the unlikely case the code is reached.

> +    wfe
> +    b 1b
> +ENDPROC(enable_secondary_cpu_mm)
> +
>   /*
>    * Local variables:
>    * mode: ASM

Cheers,

-- 
Julien Grall


