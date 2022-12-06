Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52618644DA0
	for <lists+xen-devel@lfdr.de>; Tue,  6 Dec 2022 22:01:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.455551.713049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2f3f-0000vI-5U; Tue, 06 Dec 2022 21:00:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 455551.713049; Tue, 06 Dec 2022 21:00:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2f3f-0000sR-2L; Tue, 06 Dec 2022 21:00:55 +0000
Received: by outflank-mailman (input) for mailman id 455551;
 Tue, 06 Dec 2022 21:00:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p2f3d-0000sL-Ce
 for xen-devel@lists.xenproject.org; Tue, 06 Dec 2022 21:00:53 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p2f3c-0002Gr-Up; Tue, 06 Dec 2022 21:00:52 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p2f3c-0001hE-Pt; Tue, 06 Dec 2022 21:00:52 +0000
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
	bh=M1wGMplVaSrVyos3PR8SOS4SkDZfkWpDaiJyGWdNaQU=; b=BO/QsMEX8UddO/9MOgwfY6b4Ao
	n/Uk8skO9tXFu0S8dPYHq5Xi3B/1/aqDIL0wRLdSzvYHlJfI0PAzK55rv1AiaMmRx6m6BWlJ07cMu
	bxocPZoQLpY61ZO8MahpVvRrHtUl5aclH7bW9Ik/7M2LQYAEYGj3yn0f1d7EfHmHYDeg=;
Message-ID: <84edf8ea-4067-0059-3d93-3b7db4ba0a7e@xen.org>
Date: Tue, 6 Dec 2022 21:00:51 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH 07/19] xen/arm: Disable/enable non-boot physical CPUs on
 suspend/resume
To: Mykyta Poturai <Mykyta_Poturai@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Mirela Simonovic <mirela.simonovic@aggios.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Saeed Nowshadi <saeed.nowshadi@xilinx.com>
References: <cover.1665137247.git.mykyta_poturai@epam.com>
 <74bf02f1c6c5280f2d79b9cd60515895e8ba3319.1665137247.git.mykyta_poturai@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <74bf02f1c6c5280f2d79b9cd60515895e8ba3319.1665137247.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 07/10/2022 11:32, Mykyta Poturai wrote:
> From: Mirela Simonovic <mirela.simonovic@aggios.com>
> 
> Non-boot CPUs have to be disabled on suspend and enabled on resume
> (hotplug-based mechanism). Disabling non-boot CPUs will lead to PSCI
> CPU_OFF to be called by each non-boot CPU. Depending on the underlying
> platform capabilities, this may lead to the physical powering down of
> CPUs. Tested on Xilinx Zynq Ultrascale+ MPSoC (including power down of
> each non-boot CPU).
> 
> Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
> Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
> ---
>   xen/arch/arm/suspend.c | 15 ++++++++++++++-
>   1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/suspend.c b/xen/arch/arm/suspend.c
> index 2b94816b63..0784979e4f 100644
> --- a/xen/arch/arm/suspend.c
> +++ b/xen/arch/arm/suspend.c
> @@ -13,6 +13,7 @@
>    */
>   
>   #include <xen/sched.h>
> +#include <xen/cpu.h>
>   #include <asm/cpufeature.h>
>   #include <asm/event.h>
>   #include <asm/psci.h>
> @@ -135,17 +136,29 @@ void vcpu_resume(struct vcpu *v)
>   /* Xen suspend. Note: data is not used (suspend is the suspend to RAM) */
>   static long system_suspend(void *data)
>   {
> +    int status;
> +
>       BUG_ON(system_state != SYS_STATE_active);
>   
>       system_state = SYS_STATE_suspend;
>       freeze_domains();
>   
> +    status = disable_nonboot_cpus();
> +    if ( status )
> +    {
> +        system_state = SYS_STATE_resume;
> +        goto resume_nonboot_cpus;
> +    }
> +
>       system_state = SYS_STATE_resume;
>   
> +resume_nonboot_cpus:
> +    enable_nonboot_cpus();
>       thaw_domains();
>       system_state = SYS_STATE_active;
> +    dsb(sy);

Please document what is this dsb() for.

>   
> -    return -ENOSYS;
> +    return status;
>   }
>   
>   int32_t domain_suspend(register_t epoint, register_t cid)

Cheers,

-- 
Julien Grall

