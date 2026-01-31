Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0Hq6BA8/fmk6WgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sat, 31 Jan 2026 18:42:39 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 616CFC361F
	for <lists+xen-devel@lfdr.de>; Sat, 31 Jan 2026 18:42:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1218195.1527130 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmEz0-0002AB-Dt; Sat, 31 Jan 2026 17:42:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1218195.1527130; Sat, 31 Jan 2026 17:42:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmEz0-000289-Al; Sat, 31 Jan 2026 17:42:06 +0000
Received: by outflank-mailman (input) for mailman id 1218195;
 Sat, 31 Jan 2026 17:42:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vQ/4=AE=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1vmEyy-000283-Uo
 for xen-devel@lists.xenproject.org; Sat, 31 Jan 2026 17:42:04 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 268b6b14-fecc-11f0-b161-2bf370ae4941;
 Sat, 31 Jan 2026 18:42:02 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-b872f1c31f1so404215966b.0
 for <xen-devel@lists.xenproject.org>; Sat, 31 Jan 2026 09:42:02 -0800 (PST)
Received: from [192.168.0.109] ([91.123.155.165])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-658b4256a92sm5664393a12.5.2026.01.31.09.41.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 31 Jan 2026 09:42:00 -0800 (PST)
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
X-Inumbo-ID: 268b6b14-fecc-11f0-b161-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769881322; x=1770486122; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EGzVawKXaeV8L7wcprQQ5jGf+RpWYe0HrXbbkHxwQ9I=;
        b=iO4Wocc3e0FvjOJMdka2HHxaskVU+TMzXT8EkHKjQpMR6YbOx3tgF7pfKEOFHFflQ3
         rj9bYwUoi2CBp8sqvU3Bu/fz+kdxxihFgsesQc53nzXx0E+5PJZ4N1Q7uPclDrInRMzR
         qUn0hbluxXOadL/oeXIKCwoQmDXMs8Va6tYDO+ej6mcDYOrTQDYIalscJPFK9Iaw9P2y
         imHTyxvDGL8cmMTjuQ4m3KjjY1Tjge6Io97F2acJqvmh1NpX9Sa0UeqQkApvKIsgeX2Q
         Uf1awsMvhLiUozdsH3AG+mDYifVVMPb4kwMHXGqkUsqetIcmOGnL9MD4eEK7FTTcvRtx
         lbHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769881322; x=1770486122;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EGzVawKXaeV8L7wcprQQ5jGf+RpWYe0HrXbbkHxwQ9I=;
        b=Pu6Pfbf/ftHhEt6bn6nYgRQ1FBeAnkqqctgvTSZTZ1QmvFlyD3690R/HsqszsQKmUX
         LH+et2gd6b8QRo+ZO7ufxKzenLd8UUCjW5uFZ1XUdJGgIADegUekKQBaio5dh6I5XnKO
         HuB9rxy/zU+bluL+Q38N3GlV4n+e9/BdSaiZaqcHnk8wB/S2pfkp0STf4GMd8KQlPddT
         r9qG5Oy/C3s6MvuGNaERRP2RKtzbBmscYHW7VeXDKsTRs21KE0woI5sdjl8b51alrWjA
         Y4PxJZSjqBMDFzOrQCYx8eHh2q0sdoXQF6OmMJ92tBHWNNroesakrKPnyFYDG3niwiLI
         DS5Q==
X-Forwarded-Encrypted: i=1; AJvYcCW81t8t9coCuM/X2wGDhHBAQzh/fZR79OW5/Usg9LAILH0q8tPFUhQMFh5k927IPYnl97YMODUsXCc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxA/S/0qAhYbd4lLwnrxtwJcCO8HQccjgmHuDZeXUloai0wYbCe
	T1UOAXYGOtpz10rWfNsxfsH+jf9PucmPr2s7xVbTksmkXdHdhnZNvXbB
X-Gm-Gg: AZuq6aIwMtzLZ8p1lK7R8yA6Ri08F29n/sazg2WU+x70Do6DH2oXsXWfC13MFL6Q4Lu
	5FnfoJE2YxYiKurWvnE7kvM5dYXnXJzlypj39zOKDgTB5c6FR+g5A9HJ8rYS8JRtv1Qo79dJNJo
	4V6ZFy05K9N8rbvJxcqeoBOZ/vqXV+LVh+9o/i/zc/5QjQh0Jbi/OGiyxOnWeRNQuIyJ6cP7plL
	1MMGLfCh67+74/8Rlj7rkWDFLA2FepR3UcVJl//mBe33aEhXmPlqXRQgE/OciKvETflnNk66IBH
	7jra2D8uSb4pN5FHg8x7RpZJBGAVCW2gClDAogViA0iQfme8t0LiByr7L3ZiLDDxQ8PE6Gn545q
	tXwMbyPDoU7rQtxN7cv2QP2MYUBgGYRr1wuzX5KUqi3Pk9CGmR0GbBxRgYDWbIL9KmxJC+Mz1vx
	d8cPO3NiNicnqSt3w=
X-Received: by 2002:a17:907:608d:b0:b87:778b:89ba with SMTP id a640c23a62f3a-b8dff684809mr416646566b.39.1769881321278;
        Sat, 31 Jan 2026 09:42:01 -0800 (PST)
Message-ID: <c5466813-7436-4e24-b14a-24374d6a2c68@gmail.com>
Date: Sat, 31 Jan 2026 19:41:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 08/12] arm/smmu-v3: add suspend/resume handlers
To: Mykola Kvach <xakep.amatop@gmail.com>, xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Pranjal Shrivastava <praan@google.com>
References: <cover.1765472890.git.mykola_kvach@epam.com>
 <58c1873d355f5ea9b5182349895905d25cb57256.1765472890.git.mykola_kvach@epam.com>
Content-Language: en-US
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
In-Reply-To: <58c1873d355f5ea9b5182349895905d25cb57256.1765472890.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:bertrand.marquis@arm.com,m:rahul.singh@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:praan@google.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,lists.xenproject.org];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[olekstysh@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[olekstysh@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 616CFC361F
X-Rspamd-Action: no action



On 11.12.25 20:43, Mykola Kvach wrote:

Hello Mykola

> From: Mykola Kvach <mykola_kvach@epam.com>
> 
> Before we suspend SMMU, we want to ensure that all commands (especially
> ATC_INV) have been flushed by the CMDQ, i.e. the CMDQs are empty.
> 
> The suspend callback configures the SMMU to abort new transactions,
> disables the main translation unit and then drains the command queue
> to ensure completion of any in-flight commands.
> 
> The resume callback performs a full device reset via 'arm_smmu_device_reset'
> to bring the SMMU back to an operational state.
> 
> Link: https://lore.kernel.org/linux-iommu/20251117191433.3360130-1-praan@google.com	/
> Based-on-patch-by: Pranjal Shrivastava <praan@google.com>
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> ---
>   xen/drivers/passthrough/arm/smmu-v3.c | 170 ++++++++++++++++++++------
>   1 file changed, 134 insertions(+), 36 deletions(-)
> 
> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
> index bf153227db..10c4c5dee0 100644
> --- a/xen/drivers/passthrough/arm/smmu-v3.c
> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
> @@ -1814,8 +1814,7 @@ static int arm_smmu_write_reg_sync(struct arm_smmu_device *smmu, u32 val,
>   }
>   
>   /* GBPA is "special" */
> -static int __init arm_smmu_update_gbpa(struct arm_smmu_device *smmu,
> -                                       u32 set, u32 clr)
> +static int arm_smmu_update_gbpa(struct arm_smmu_device *smmu, u32 set, u32 clr)
>   {
>   	int ret;
>   	u32 reg, __iomem *gbpa = smmu->base + ARM_SMMU_GBPA;
> @@ -1995,10 +1994,29 @@ err_free_evtq_irq:
>   	return ret;
>   }
>   
> +static int arm_smmu_enable_irqs(struct arm_smmu_device *smmu)
> +{
> +	int ret;
> +	u32 irqen_flags = IRQ_CTRL_EVTQ_IRQEN | IRQ_CTRL_GERROR_IRQEN;
> +
> +	if ( smmu->features & ARM_SMMU_FEAT_PRI )
> +		irqen_flags |= IRQ_CTRL_PRIQ_IRQEN;
> +
> +	/* Enable interrupt generation on the SMMU */
> +	ret = arm_smmu_write_reg_sync(smmu, irqen_flags,
> +				      ARM_SMMU_IRQ_CTRL, ARM_SMMU_IRQ_CTRLACK);
> +	if ( ret )
> +	{
> +		dev_warn(smmu->dev, "failed to enable irqs\n");
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
>   static int __init arm_smmu_setup_irqs(struct arm_smmu_device *smmu)
>   {
>   	int ret, irq;
> -	u32 irqen_flags = IRQ_CTRL_EVTQ_IRQEN | IRQ_CTRL_GERROR_IRQEN;
>   
>   	/* Disable IRQs first */
>   	ret = arm_smmu_write_reg_sync(smmu, 0, ARM_SMMU_IRQ_CTRL,
> @@ -2028,22 +2046,7 @@ static int __init arm_smmu_setup_irqs(struct arm_smmu_device *smmu)
>   		}
>   	}
>   
> -	if (smmu->features & ARM_SMMU_FEAT_PRI)
> -		irqen_flags |= IRQ_CTRL_PRIQ_IRQEN;
> -
> -	/* Enable interrupt generation on the SMMU */
> -	ret = arm_smmu_write_reg_sync(smmu, irqen_flags,
> -				      ARM_SMMU_IRQ_CTRL, ARM_SMMU_IRQ_CTRLACK);
> -	if (ret) {
> -		dev_warn(smmu->dev, "failed to enable irqs\n");
> -		goto err_free_irqs;
> -	}
> -
>   	return 0;
> -
> -err_free_irqs:
> -	arm_smmu_free_irqs(smmu);
> -	return ret;
>   }
>   
>   static int arm_smmu_device_disable(struct arm_smmu_device *smmu)
> @@ -2057,7 +2060,7 @@ static int arm_smmu_device_disable(struct arm_smmu_device *smmu)
>   	return ret;
>   }
>   
> -static int __init arm_smmu_device_reset(struct arm_smmu_device *smmu)
> +static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
>   {
>   	int ret;
>   	u32 reg, enables;
> @@ -2163,17 +2166,9 @@ static int __init arm_smmu_device_reset(struct arm_smmu_device *smmu)
>   		}
>   	}
>   
> -	ret = arm_smmu_setup_irqs(smmu);
> -	if (ret) {
> -		dev_err(smmu->dev, "failed to setup irqs\n");
> +	ret = arm_smmu_enable_irqs(smmu);
> +	if ( ret )
>   		return ret;
> -	}
> -
> -	/* Initialize tasklets for threaded IRQs*/
> -	tasklet_init(&smmu->evtq_irq_tasklet, arm_smmu_evtq_tasklet, smmu);
> -	tasklet_init(&smmu->priq_irq_tasklet, arm_smmu_priq_tasklet, smmu);
> -	tasklet_init(&smmu->combined_irq_tasklet, arm_smmu_combined_irq_tasklet,
> -				 smmu);
>   
>   	/* Enable the SMMU interface, or ensure bypass */
>   	if (disable_bypass) {
> @@ -2181,20 +2176,16 @@ static int __init arm_smmu_device_reset(struct arm_smmu_device *smmu)
>   	} else {
>   		ret = arm_smmu_update_gbpa(smmu, 0, GBPA_ABORT);
>   		if (ret)
> -			goto err_free_irqs;
> +			return ret;
>   	}
>   	ret = arm_smmu_write_reg_sync(smmu, enables, ARM_SMMU_CR0,
>   				      ARM_SMMU_CR0ACK);
>   	if (ret) {
>   		dev_err(smmu->dev, "failed to enable SMMU interface\n");
> -		goto err_free_irqs;
> +		return ret;
>   	}
>   
>   	return 0;
> -
> -err_free_irqs:
> -	arm_smmu_free_irqs(smmu);
> -	return ret;
>   }
>   
>   static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
> @@ -2558,10 +2549,23 @@ static int __init arm_smmu_device_probe(struct platform_device *pdev)
>   	if (ret)
>   		goto out_free;
>   
> +	ret = arm_smmu_setup_irqs(smmu);
> +	if ( ret )
> +	{
> +		dev_err(smmu->dev, "failed to setup irqs\n");
> +		goto out_free;
> +	}
> +
> +	/* Initialize tasklets for threaded IRQs*/
> +	tasklet_init(&smmu->evtq_irq_tasklet, arm_smmu_evtq_tasklet, smmu);
> +	tasklet_init(&smmu->priq_irq_tasklet, arm_smmu_priq_tasklet, smmu);
> +	tasklet_init(&smmu->combined_irq_tasklet, arm_smmu_combined_irq_tasklet,
> +				smmu);
> +
>   	/* Reset the device */
>   	ret = arm_smmu_device_reset(smmu);
>   	if (ret)
> -		goto out_free;
> +		goto out_free_irqs;
>   
>   	/*
>   	 * Keep a list of all probed devices. This will be used to query
> @@ -2575,6 +2579,8 @@ static int __init arm_smmu_device_probe(struct platform_device *pdev)
>   
>   	return 0;
>   
> +out_free_irqs:
> +	arm_smmu_free_irqs(smmu);
>   
>   out_free:
>   	arm_smmu_free_structures(smmu);
> @@ -2855,6 +2861,94 @@ static void arm_smmu_iommu_xen_domain_teardown(struct domain *d)
>   	xfree(xen_domain);
>   }
>   
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +
> +static int arm_smmu_suspend(void)
> +{
> +	struct arm_smmu_device *smmu;
> +	int ret = 0;
> +
> +	list_for_each_entry(smmu, &arm_smmu_devices, devices)
> +	{
> +		/* Abort all transactions before disable to avoid spurious bypass */
> +		ret = arm_smmu_update_gbpa(smmu, GBPA_ABORT, 0);
> +		if ( ret )
> +			goto fail;
> +
> +		/* Disable the SMMU via CR0.EN and all queues except CMDQ */
> +		ret = arm_smmu_write_reg_sync(smmu, CR0_CMDQEN, ARM_SMMU_CR0,
> +					ARM_SMMU_CR0ACK);
> +		if ( ret )
> +		{
> +			dev_err(smmu->dev, "Timed-out while disabling smmu\n");
> +			goto fail;
> +		}
> +
> +		/*
> +		 * At this point the SMMU is completely disabled and won't access
> +		 * any translation/config structures, even speculative accesses
> +		 * aren't performed as per the IHI0070 spec (section 6.3.9.6).
> +		 */
> +
> +		/* Wait for the CMDQs to be drained to flush any pending commands */
> +		ret = queue_poll_cons(&smmu->cmdq.q, true, 0);

I wonder, why ignoring ARM_SMMU_FEAT_SEV in suspend? In the runtime 
function __arm_smmu_cmdq_issue_sync(), the driver checks if the SMMU 
supports ARM_SMMU_FEAT_SEV and passes this flag to queue_poll_cons().
However, here, this check is missing, and the wfe argument is hardcoded 
to 0.


> +		if ( ret )
> +		{
> +			dev_err(smmu->dev, "Draining queues timed-out\n");
> +			goto fail;
> +		}
> +
> +		/* Disable everything */
> +		ret = arm_smmu_device_disable(smmu);
> +		if ( ret )
> +			goto fail;
> +
> +		dev_dbg(smmu->dev, "Suspended smmu\n");
> +	}
> +
> +	return 0;
> +
> + fail:
> +	{
> +		int rc;
> +
> +		/* Reset the device that failed as well as any already-suspended ones. */
> +		rc = arm_smmu_device_reset(smmu);
> +		if ( rc )
> +			dev_err(smmu->dev, "Failed to reset during resume operation: %d\n", rc);
> +
> +		list_for_each_entry_continue_reverse(smmu, &arm_smmu_devices, devices)
> +		{
> +			rc = arm_smmu_device_reset(smmu);
> +			if ( rc )
> +				dev_err(smmu->dev, "Failed to reset during resume operation: %d\n", rc);
> +		}

NIT: Could this duplicated reset call (and error message) be optimized 
somehow? Maybe, by using a do-while loop to manually walk back up the 
list from the current SMMU to the head, but not sure.


> +	}
> +
> +	return ret;
> +}
> +
> +static void arm_smmu_resume(void)
> +{
> +	int ret;
> +	struct arm_smmu_device *smmu;
> +
> +	list_for_each_entry(smmu, &arm_smmu_devices, devices)
> +	{
> +		dev_dbg(smmu->dev, "Resuming device\n");
> +
> +		/*
> +		* The reset will re-initialize all the base addresses, queues,
> +		* prod and cons maintained within struct arm_smmu_device as well as
> +		* re-enable the interrupts.
> +		*/
> +		ret = arm_smmu_device_reset(smmu);
> +		if ( ret )
> +			dev_err(smmu->dev, "Failed to reset during resume operation: %d\n", ret);

In your GICv3 ITS patch, a failure during resume triggers a panic(), but 
here only an error message that might go unnoticed. May I please ask, 
why such diverging? The IOMMU is as critical as the Interrupt 
Controller. I see that you configure Abort state during suspend, so if I 
understand the things correctly - if the SMMU fails to reset (e.g., 
remains in GBPA_ABORT), all DMA for for any passed-through devices 
behind it will be blocked after resuming.


> +	}
> +}
> +#endif
> +
>   static const struct iommu_ops arm_smmu_iommu_ops = {
>   	.page_sizes		= PAGE_SIZE_4K,
>   	.init			= arm_smmu_iommu_xen_domain_init,
> @@ -2867,6 +2961,10 @@ static const struct iommu_ops arm_smmu_iommu_ops = {
>   	.unmap_page		= arm_iommu_unmap_page,
>   	.dt_xlate		= arm_smmu_dt_xlate,
>   	.add_device		= arm_smmu_add_device,
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +	.suspend		= arm_smmu_suspend,
> +	.resume			= arm_smmu_resume,
> +#endif
>   };
>   
>   static __init int arm_smmu_dt_init(struct dt_device_node *dev,


