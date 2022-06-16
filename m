Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F28B954E5C0
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jun 2022 17:13:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.350652.577112 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1rAb-0003OL-JY; Thu, 16 Jun 2022 15:12:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 350652.577112; Thu, 16 Jun 2022 15:12:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1rAb-0003L4-Fu; Thu, 16 Jun 2022 15:12:29 +0000
Received: by outflank-mailman (input) for mailman id 350652;
 Thu, 16 Jun 2022 15:12:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o1rAZ-0003Ky-7O
 for xen-devel@lists.xenproject.org; Thu, 16 Jun 2022 15:12:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o1rAY-0004kG-U0; Thu, 16 Jun 2022 15:12:26 +0000
Received: from 54-240-197-228.amazon.com ([54.240.197.228]
 helo=[10.95.152.232]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o1rAY-0006fY-HQ; Thu, 16 Jun 2022 15:12:26 +0000
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
	bh=r/J6xpDz0O8Teq9yYJ6YkzF2E2EuUUW/9FfFWGvAyvM=; b=r0UYs9vA3yKUQNeMbsupPzAQEl
	6FATYZQGHSw1DUn/9vydiNoC15bS+Y3Dn1ibhjBI7lKro8bDUDB1hwdsvmIHqUeoyqn0d3IahOa54
	R5GbC1GT4ypgJeoOLe9TQuNgsJYwBFunRLuQhSrFxPNJAOrFxM2pxIO1XoUsHZSHuCYc=;
Message-ID: <cf7660da-0bde-865e-7c22-a2e21e31fae5@xen.org>
Date: Thu, 16 Jun 2022 16:12:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH] xen: Don't call panic if ARM TF cpu off returns DENIED
To: dmitry.semenets@gmail.com, xen-devel@lists.xenproject.org
Cc: Dmytro Semenets <dmytro_semenets@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220616135541.3333760-1-dmitry.semenets@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220616135541.3333760-1-dmitry.semenets@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 16/06/2022 14:55, dmitry.semenets@gmail.com wrote:
> From: Dmytro Semenets <dmytro_semenets@epam.com>
> 
> According to PSCI specification ARM TF can return DENIED on CPU OFF.

I am confused. The spec is talking about Trusted OS and not firmware. 
The docummentation is also not specific to ARM Trusted Firmware. So did 
you mean "Trusted OS"?

Also, did you reproduce on HW? If so, on which CPU this will fail?

> This patch brings the hypervisor into compliance with the PSCI
> specification.

Now it means CPU off will never be turned off using PSCI. Instead, we 
would end up to spin in Xen. This would be a problem because we could 
save less power.

> Refer to "Arm Power State Coordination Interface (DEN0022D.b)"
> section 5.5.2

Reading both 5.5.2 and 5.9.1 together, DENIED would be returned when the 
trusted OS can only run on one core.

Some of the trusted OS are migratable. So I think we should first 
attempt to migrate the CPU. Then if it doesn't work, we should prevent 
the CPU to go offline.

That said, upstream doesn't support cpu offlining (I don't know for your 
use case). In case of shutdown, it is not necessary to offline the CPU, 
so we could avoid to call CPU_OFF on all CPUs but one. Something like:

diff --git a/xen/arch/arm/shutdown.c b/xen/arch/arm/shutdown.c
index 3dc6819d56de..d956812ef8f4 100644
--- a/xen/arch/arm/shutdown.c
+++ b/xen/arch/arm/shutdown.c
@@ -8,7 +8,9 @@

  static void noreturn halt_this_cpu(void *arg)
  {
-    stop_cpu();
+    ASSERT(!local_irq_enable());
+    while ( 1 )
+        wfi();
  }

  void machine_halt(void)
@@ -21,10 +23,6 @@ void machine_halt(void)
      smp_call_function(halt_this_cpu, NULL, 0);
      local_irq_disable();

-    /* Wait at most another 10ms for all other CPUs to go offline. */
-    while ( (num_online_cpus() > 1) && (timeout-- > 0) )
-        mdelay(1);
-
      /* This is mainly for PSCI-0.2, which does not return if success. */
      call_psci_system_off();

> Signed-off-by: Dmytro Semenets <dmytro_semenets@epam.com>
> Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

I don't recall to see patch on the ML recently for this. So is this an 
internal review?

> ---
>   xen/arch/arm/psci.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/arm/psci.c b/xen/arch/arm/psci.c
> index 0c90c2305c..55787fde58 100644
> --- a/xen/arch/arm/psci.c
> +++ b/xen/arch/arm/psci.c
> @@ -63,8 +63,9 @@ void call_psci_cpu_off(void)
>   
>           /* If successfull the PSCI cpu_off call doesn't return */
>           arm_smccc_smc(PSCI_0_2_FN32_CPU_OFF, &res);
> -        panic("PSCI cpu off failed for CPU%d err=%d\n", smp_processor_id(),
> -              PSCI_RET(res));
> +        if ( PSCI_RET(res) != PSCI_DENIED )
> +            panic("PSCI cpu off failed for CPU%d err=%d\n", smp_processor_id(),
> +                PSCI_RET(res));
>       }
>   }
>   

Cheers,

-- 
Julien Grall

