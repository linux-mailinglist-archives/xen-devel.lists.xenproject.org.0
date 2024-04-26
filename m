Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C838B3EC4
	for <lists+xen-devel@lfdr.de>; Fri, 26 Apr 2024 19:58:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.713020.1113998 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0Pq0-0000TI-Ho; Fri, 26 Apr 2024 17:58:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 713020.1113998; Fri, 26 Apr 2024 17:58:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0Pq0-0000Q8-Ee; Fri, 26 Apr 2024 17:58:20 +0000
Received: by outflank-mailman (input) for mailman id 713020;
 Fri, 26 Apr 2024 17:58:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1s0Ppy-0000Ps-BW
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2024 17:58:18 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1s0Ppx-0004nH-U0; Fri, 26 Apr 2024 17:58:17 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.0.211])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1s0Ppx-0008OM-O4; Fri, 26 Apr 2024 17:58:17 +0000
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
	bh=XDvqkA2kuA3yOzBcUmidxFcrtmWLYC3CyoGuh6qMJKA=; b=eReeut56uZvnKUmM2j4l4mVHhi
	7GPN+5SKRVgs/YRVd80/xw+onX+RWrMu3UPrp3Kk+VxMTSPmcgY67J9ssc4ZDmgn6hbdIWwBE3gXT
	t1ZuQQNReijE7nIttMO7SJsxc3Kjrq2VF/rc2UJw41Y+zO35z91PcOlgL4oL+UUkHQcI=;
Message-ID: <807e4e70-f3b2-4b40-9004-d55bd9407bbf@xen.org>
Date: Fri, 26 Apr 2024 18:58:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v3 5/5] xen/arm: ffa: support notification
Content-Language: en-GB
To: Jens Wiklander <jens.wiklander@linaro.org>, xen-devel@lists.xenproject.org
Cc: patches@linaro.org, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240426084723.4149648-1-jens.wiklander@linaro.org>
 <20240426084723.4149648-6-jens.wiklander@linaro.org>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240426084723.4149648-6-jens.wiklander@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jens,

On 26/04/2024 09:47, Jens Wiklander wrote:
> +static void notif_irq_enable(void *info)
> +{
> +    struct notif_irq_info *irq_info = info;
> +
> +    irq_info->ret = setup_irq(irq_info->irq, 0, irq_info->action);
In v2, you were using request_irq(). But now you seem to be open-coding 
it. Can you explain why?

> +    if ( irq_info->ret )
> +        printk(XENLOG_ERR "ffa: request_irq irq %u failed: error %d\n",
> +               irq_info->irq, irq_info->ret);
> +}
> +
> +void ffa_notif_init(void)
> +{
> +    const struct arm_smccc_1_2_regs arg = {
> +        .a0 = FFA_FEATURES,
> +        .a1 = FFA_FEATURE_SCHEDULE_RECV_INTR,
> +    };
> +    struct notif_irq_info irq_info = { };
> +    struct arm_smccc_1_2_regs resp;
> +    unsigned int cpu;
> +
> +    arm_smccc_1_2_smc(&arg, &resp);
> +    if ( resp.a0 != FFA_SUCCESS_32 )
> +        return;
> +
> +    irq_info.irq = resp.a2;
> +    if ( irq_info.irq < GIC_SGI_STATIC_MAX || irq_info.irq >= NR_GIC_SGI )
> +    {
> +        printk(XENLOG_ERR "ffa: notification initialization failed: conflicting SGI %u\n",
> +               irq_info.irq);
> +        return;
> +    }
> +
> +    /*
> +     * SGIs are per-CPU so we must enable the IRQ on each CPU. We use an
> +     * IPI to call notif_irq_enable() on each CPU including the current
> +     * CPU. The struct irqaction is preallocated since we can't allocate
> +     * memory while in interrupt context.
> +     */
> +    for_each_online_cpu(cpu)
Even though we currently don't support CPU hotplug, you want to add a 
CPU Notifier to also register the IRQ when a CPU is onlined 
ffa_notif_init().

For an example, see time.c. We may also want to consider to enable TEE 
in presmp_initcalls() so we don't need to have a for_each_online_cpu().

Cheers,

-- 
Julien Grall

