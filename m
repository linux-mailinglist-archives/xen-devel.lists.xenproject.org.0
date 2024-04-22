Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C778ACC30
	for <lists+xen-devel@lfdr.de>; Mon, 22 Apr 2024 13:40:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.709920.1108961 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rys27-00081J-MU; Mon, 22 Apr 2024 11:40:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 709920.1108961; Mon, 22 Apr 2024 11:40:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rys27-0007zX-Jj; Mon, 22 Apr 2024 11:40:27 +0000
Received: by outflank-mailman (input) for mailman id 709920;
 Mon, 22 Apr 2024 11:40:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rys26-0007zR-1c
 for xen-devel@lists.xenproject.org; Mon, 22 Apr 2024 11:40:26 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rys25-0004lD-Jl; Mon, 22 Apr 2024 11:40:25 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.0.211])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rys25-0002en-DS; Mon, 22 Apr 2024 11:40:25 +0000
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
	bh=ueCjSlvTx6cmfSKsBZYt1WSHR9NfFhCQsJdW53dT4oQ=; b=alMskhhH8o6bgCfl3nZ8LPRSb5
	E0Ox1kpuGkoo9ywzjBQbRRIEietcbxCO72jmX4PCxr2kteqW6/e7yNBDtADpOdwly7mUJl2cWC8uU
	WXIcb+WKSWChvao/+bSdxmASIpC5SvXiTT8rH+1pXi1j8eBLzEk7OdJGIyBPOVIG4oFw=;
Message-ID: <e2ffe445-9355-45c9-bbfb-669455df4ea0@xen.org>
Date: Mon, 22 Apr 2024 12:40:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 5/5] xen/arm: ffa: support notification
Content-Language: en-GB
To: Jens Wiklander <jens.wiklander@linaro.org>, xen-devel@lists.xenproject.org
Cc: patches@linaro.org, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <20240422073708.3663529-1-jens.wiklander@linaro.org>
 <20240422073708.3663529-6-jens.wiklander@linaro.org>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240422073708.3663529-6-jens.wiklander@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jens,

This is not a full review of the code. I will let Bertrand doing it.

On 22/04/2024 08:37, Jens Wiklander wrote:
> +void ffa_notif_init(void)
> +{
> +    const struct arm_smccc_1_2_regs arg = {
> +        .a0 = FFA_FEATURES,
> +        .a1 = FFA_FEATURE_SCHEDULE_RECV_INTR,
> +    };
> +    struct arm_smccc_1_2_regs resp;
> +    unsigned int irq;
> +    int ret;
> +
> +    arm_smccc_1_2_smc(&arg, &resp);
> +    if ( resp.a0 != FFA_SUCCESS_32 )
> +        return;
> +
> +    irq = resp.a2;
> +    if ( irq >= NR_GIC_SGI )
> +        irq_set_type(irq, IRQ_TYPE_EDGE_RISING);
> +    ret = request_irq(irq, 0, notif_irq_handler, "FF-A notif", NULL);

If I am not mistaken, ffa_notif_init() is only called once on the boot 
CPU. However, request_irq() needs to be called on every CPU so the 
callback is registered every where and the interrupt enabled.

I know the name of the function is rather confusing. So can you confirm 
this is what you expected?

[...]

> diff --git a/xen/arch/arm/tee/ffa_private.h b/xen/arch/arm/tee/ffa_private.h
> index 98236cbf14a3..ef8ffd4526bd 100644
> --- a/xen/arch/arm/tee/ffa_private.h
> +++ b/xen/arch/arm/tee/ffa_private.h
> @@ -25,6 +25,7 @@
>   #define FFA_RET_DENIED                  -6
>   #define FFA_RET_RETRY                   -7
>   #define FFA_RET_ABORTED                 -8
> +#define FFA_RET_NO_DATA                 -9
>   
>   /* FFA_VERSION helpers */
>   #define FFA_VERSION_MAJOR_SHIFT         16U
> @@ -97,6 +98,18 @@
>    */
>   #define FFA_MAX_SHM_COUNT               32
>   
> +/*
> + * TODO How to manage the available SGIs? SGI 8-15 seem to be entirely
> + * unused, but that may change.

Are the value below intended for the guests? If so, can they be moved in 
public/arch-arm.h along with the others guest interrupts?

> + *
> + * SGI is the preferred delivery mechanism. SGIs 8-15 are normally not used
> + * by a guest as they in a non-virtualized system typically are assigned to
> + * the secure world. Here we're free to use SGI 8-15 since they are virtual
> + * and have nothing to do with the secure world.

Do you have a pointer to the specification?

[...]

Cheers,

-- 
Julien Grall

