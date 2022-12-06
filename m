Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D4B644E63
	for <lists+xen-devel@lfdr.de>; Tue,  6 Dec 2022 23:13:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.455622.713148 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2gBQ-0006ju-Eq; Tue, 06 Dec 2022 22:13:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 455622.713148; Tue, 06 Dec 2022 22:13:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2gBQ-0006hJ-Bv; Tue, 06 Dec 2022 22:13:00 +0000
Received: by outflank-mailman (input) for mailman id 455622;
 Tue, 06 Dec 2022 22:12:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p2gBP-0006hD-Dx
 for xen-devel@lists.xenproject.org; Tue, 06 Dec 2022 22:12:59 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p2gBP-00042w-2z; Tue, 06 Dec 2022 22:12:59 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p2gBO-0004dZ-Tn; Tue, 06 Dec 2022 22:12:59 +0000
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
	bh=1hUVjlni7gnHjwBbpL6HcCrYwESqVaZzC+eTjr4bMrE=; b=FkBR9QD6d60Ik5iaN4sBoPROfW
	GZX5Ux9UY8klV4nc+Hgy6xQegbk7NGB5XknV4H6qviZCM16N+ooeeGVM67VisZsKgb+56FBDNvSD0
	SOvYMihLDgJyk9g7oog7hedYv36hI1MoCzfBCj4LA9iQbv2sEaI04krdEk0FQ5ThnudE=;
Message-ID: <1f9f127c-12de-fe4f-6280-8bd77c5da04e@xen.org>
Date: Tue, 6 Dec 2022 22:12:56 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH 16/19] xen/arm: Suspend/resume console on Xen
 suspend/resume
To: Mykyta Poturai <Mykyta_Poturai@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Mirela Simonovic <mirela.simonovic@aggios.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Saeed Nowshadi <saeed.nowshadi@xilinx.com>
References: <cover.1665137247.git.mykyta_poturai@epam.com>
 <a3dc2fe24f8f474a3976f4b307a693e359e910d5.1665137247.git.mykyta_poturai@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <a3dc2fe24f8f474a3976f4b307a693e359e910d5.1665137247.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 07/10/2022 11:32, Mykyta Poturai wrote:
> From: Mirela Simonovic <mirela.simonovic@aggios.com>
> 
> This is done using generic console_suspend/resume functions that cause
> uart driver specific suspend/resume handlers to be called for each
> initialized port (if the port has suspend/resume driver handlers
> implemented).

Looking at the UART driver for Arm, most of them (if not all) implement 
suspend/resume with BUG(). So don't you need to properly implement them?

> 
> Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
> Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>

Your signed-off-by is missing.

> ---
>   xen/arch/arm/suspend.c | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
> 
> diff --git a/xen/arch/arm/suspend.c b/xen/arch/arm/suspend.c
> index 4a690eac3b..cf3aab0099 100644
> --- a/xen/arch/arm/suspend.c
> +++ b/xen/arch/arm/suspend.c
> @@ -14,6 +14,7 @@
>   
>   #include <xen/sched.h>
>   #include <xen/cpu.h>
> +#include <xen/console.h>
>   #include <asm/cpufeature.h>
>   #include <asm/event.h>
>   #include <asm/psci.h>
> @@ -166,6 +167,15 @@ static long system_suspend(void *data)
>           goto resume_irqs;
>       }
>   
> +    dprintk(XENLOG_DEBUG, "Suspend\n");
> +    status = console_suspend();
> +    if ( status )
> +    {
> +        dprintk(XENLOG_ERR, "Failed to suspend the console, err=%d\n", status);
> +        system_state = SYS_STATE_resume;
> +        goto resume_console;
> +    }
> +
>       if ( hyp_suspend(&cpu_context) )
>       {
>           status = call_psci_system_suspend();
> @@ -192,6 +202,10 @@ static long system_suspend(void *data)
>        */
>       mmu_init_secondary_cpu();
>   
> +resume_console:
> +    console_resume();
> +    dprintk(XENLOG_DEBUG, "Resume\n");
> +
>       gic_resume();
>   
>   resume_irqs:

Cheers,

-- 
Julien Grall

