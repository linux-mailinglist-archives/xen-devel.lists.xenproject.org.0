Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E61AA9630E8
	for <lists+xen-devel@lfdr.de>; Wed, 28 Aug 2024 21:25:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.785103.1194519 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjOHq-0002ew-UC; Wed, 28 Aug 2024 19:24:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 785103.1194519; Wed, 28 Aug 2024 19:24:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjOHq-0002cc-RT; Wed, 28 Aug 2024 19:24:58 +0000
Received: by outflank-mailman (input) for mailman id 785103;
 Wed, 28 Aug 2024 19:24:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sjOHp-0002cW-Ai
 for xen-devel@lists.xenproject.org; Wed, 28 Aug 2024 19:24:57 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sjOHo-0007zi-B0; Wed, 28 Aug 2024 19:24:56 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.0.211])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sjOHo-0006h2-3i; Wed, 28 Aug 2024 19:24:56 +0000
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
	bh=l/he+9/N/jJqycW0k+XyA2IpjSGRkTOvA60BQp18/W8=; b=tdLVVmhcQJfdwWaHX5k+pAqx8V
	ckISQ3PsmL81cySI4ZFAW2j2YwWalHsHYYHR7cFKwPaEIkT/J2kgDz9tlgUs4G+sIZ1Kk8JrzNlIR
	iJyDcUP59nC1k6KIW3o6yFT9GDMlPfpq/WrsbkMYrR5FLFqhd2KG5YwiotH3A9fwPUEw=;
Message-ID: <c0146fd6-25cd-46fe-a1d8-428ff9c69b05@xen.org>
Date: Wed, 28 Aug 2024 20:24:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/4] xen/arm: mpu: Disable secondary cpu bringup
Content-Language: en-GB
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240823163127.3443404-1-ayan.kumar.halder@amd.com>
 <20240823163127.3443404-5-ayan.kumar.halder@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240823163127.3443404-5-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ayan,

The title is a bit confusing. It implies seconary CPU bringup used to 
work on the MPU. However, you are adding a stub for enable_secondary_cpu_mm.

Also, I am not entirely this is really sufficient to disable CPU 
bringup. There will be plenty of initialization done for secondary CPUs.

I would suggest to update NR_CPUS to 1 for MPU so we will fail early.

For the title, how about

xen/arm: mpu: Implement a dummy enable_secondary_cpu_mm

On 23/08/2024 17:31, Ayan Kumar Halder wrote:
> Secondary cpus are put in WFE state. We do not support SMP at this time.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
>   xen/arch/arm/arm64/mpu/head.S | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/xen/arch/arm/arm64/mpu/head.S b/xen/arch/arm/arm64/mpu/head.S
> index 2b023c346a..1579ac0408 100644
> --- a/xen/arch/arm/arm64/mpu/head.S
> +++ b/xen/arch/arm/arm64/mpu/head.S
> @@ -68,3 +68,12 @@ ENTRY(enable_boot_cpu_mm)
>   
>       ret
>   ENDPROC(enable_boot_cpu_mm)
> +
> +/*
> + * Secondary cpu has not yet been supported on MPU systems. We will block the
> + * secondary cpu bringup at this stage.
> + */
> +ENTRY(enable_secondary_cpu_mm)

Can we print a message so it is easier to spot that 
enable_secondary_cpu_mm is not properly implemented?

> +1:  wfe
> +    b 1b
> +ENDPROC(enable_secondary_cpu_mm)

Cheers,

-- 
Julien Grall


