Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30941B5852A
	for <lists+xen-devel@lfdr.de>; Mon, 15 Sep 2025 21:14:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1124418.1466783 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uyEeN-0006pw-Ot; Mon, 15 Sep 2025 19:14:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1124418.1466783; Mon, 15 Sep 2025 19:14:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uyEeN-0006nn-LW; Mon, 15 Sep 2025 19:14:07 +0000
Received: by outflank-mailman (input) for mailman id 1124418;
 Mon, 15 Sep 2025 19:14:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uyEeM-0006nh-B5
 for xen-devel@lists.xenproject.org; Mon, 15 Sep 2025 19:14:06 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uyEeL-00BKto-2r;
 Mon, 15 Sep 2025 19:14:05 +0000
Received: from [2a02:8012:3a1:0:94fa:2916:1471:b94a]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uyEeL-00B5wL-3B;
 Mon, 15 Sep 2025 19:14:05 +0000
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
	bh=qOgrIpvX9kR6ubwlRpnwkvinyWtx5gOYfvrPokiGukQ=; b=Shmq1GKIII1Ae26s3G9COWSjhd
	9Glw76tfCPYpky7o+gCCL934WYXDgSLoTeN8vkwXJgDfyVkOSTZ4XKJcHuvsh0U6naSFNznNexJ0B
	XsS6kkMlr30Z+1G0RbgsqVMQIeyLu5qPOugf4WGXig2fimGaGVu3MyhUY/YuRmsgFvLU=;
Message-ID: <7bbd581f-bfa4-444e-9c76-bcb833a2ec74@xen.org>
Date: Mon, 15 Sep 2025 20:14:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] xen/arm: Introduce GICV3 Self Tests
Content-Language: en-GB
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250912170055.3077923-1-ayan.kumar.halder@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20250912170055.3077923-1-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ayan,

On 12/09/2025 18:00, Ayan Kumar Halder wrote:
> Introduce CONFIG_GICV3_SELFTEST to enclose tests for GICv3 driver.
> Test that Xen is able to generate SGIs.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
> One of the aim of functional safety is to test hw/sw interface. This means that
> Xen is able to configure the hardware correctly for the desired functionalities.
> 
> Normally this is tested from the VMs. For eg if a VM is able to receive irq, this
> implies that Xen has configured the GICv3 interface 'correctly'. However this is
> a high level (or integration) test which uses not only the GICv3 interface
> between Xen and VM, but the interrupt injection code for Xen to VMs.
> 
> We want to have some kind of unit tests to check that Xen is able to receive
> various interrupts, set priorities, etc. Here, we have written unit tests for
> software generated interrupts (SGIs) as example.
> 
> These tests are expected to be triggered as Xen boots (right after Xen has
> initialised the GICv3 interface ie gicv3_init(). The aim of this test is to
> check whether Xen can trigger SGIs after gicv3_init() is invoked. If so, we can
> claim that gicv3_init() was done properly to be able to trigger SGIs. 

To clarify, this only guarantees that the boot CPU can send SGIs to 
self. Secondary CPUs are brought up later and will need their own setup 
to enable SGIs.

> Likewise
> we will have tests to check for priorities, SPIs, etc.
> 
> A script will parse the logs and claim that Xen is able to trigger SGIs.
> 
>   xen/arch/arm/Kconfig  |  8 ++++++++
>   xen/arch/arm/gic-v3.c |  7 +++++++
>   xen/arch/arm/gic.c    | 21 +++++++++++++++++++++
>   3 files changed, 36 insertions(+)
> 
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index 950e4452c1..739f99eaa9 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -73,6 +73,14 @@ config GICV3
>   	  Driver for the ARM Generic Interrupt Controller v3.
>   	  If unsure, use the default setting.
>   
> +config GICV3_SELFTEST
> +    bool "GICv3 driver self test"
> +    default n
> +    depends on GICV3
> +    ---help---
> +
> +      Self tests to validate GICV3 driver.
> +
>   config HAS_ITS
>           bool "GICv3 ITS MSI controller support (UNSUPPORTED)" if UNSUPPORTED
>           depends on GICV3 && !NEW_VGIC && !ARM_32
> diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
> index 4e6c98bada..eb0c05231c 100644
> --- a/xen/arch/arm/gic-v3.c
> +++ b/xen/arch/arm/gic-v3.c
> @@ -1818,6 +1818,13 @@ static int __init gicv3_init(void)
>   
>       gicv3_hyp_init();
>   
> +#ifdef CONFIG_GICV3_SELFTEST
> +    send_SGI_self(GIC_SGI_EVENT_CHECK);
> +    send_SGI_self(GIC_SGI_DUMP_STATE);
> +    send_SGI_self(GIC_SGI_CALL_FUNCTION);
> +    send_SGI_self(GIC_SGI_MAX);
> +#endif

Looking a the code below, it seems like Xen will not be functional after 
running the selftests? Is this intended? If so, we need to stop Xen as 
soon as possible.

Also, looking at start_xen(), we call local_irq_enable() a little after 
gicv3_init() is called. So I am a little bit surprised this is working?

Cheers,

-- 
Julien Grall


