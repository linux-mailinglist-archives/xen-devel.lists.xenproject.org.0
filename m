Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C67FB84CEE
	for <lists+xen-devel@lfdr.de>; Thu, 18 Sep 2025 15:29:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1126095.1467776 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uzEgS-00046G-41; Thu, 18 Sep 2025 13:28:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1126095.1467776; Thu, 18 Sep 2025 13:28:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uzEgS-00044k-0C; Thu, 18 Sep 2025 13:28:24 +0000
Received: by outflank-mailman (input) for mailman id 1126095;
 Thu, 18 Sep 2025 13:28:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uzEgR-00044e-1t
 for xen-devel@lists.xenproject.org; Thu, 18 Sep 2025 13:28:23 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uzEgQ-00Fy4w-24;
 Thu, 18 Sep 2025 13:28:22 +0000
Received: from [15.248.2.235] (helo=[10.24.67.203])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uzEgQ-00GJyV-29;
 Thu, 18 Sep 2025 13:28:22 +0000
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
	bh=p0d+DH9Rwrr8mSaj8F4PvpwqI1NpdM2LwEMPJA8zEgs=; b=4/+Zhd70mPi2CdCTwLof0C0N6l
	vQ7LshE8euPJvDZR2fglwJs5jan9FBnIyVX7IAWmzxIwOZl54+qAPlHN6qfO8l2omGdXS6UBwTIZF
	aSMTCLTdC+xFDwx6qVmtnUSCOV58h6fJt8VMDNIRiwLfhXHvSwvyeUWTqxaLEyiOYKGw=;
Message-ID: <65fb96d3-3f5e-42fc-8330-e289bf029246@xen.org>
Date: Thu, 18 Sep 2025 14:28:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/4] arm/time: Use static irqaction
Content-Language: en-GB
To: Mykyta Poturai <Mykyta_Poturai@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1758197507.git.mykyta_poturai@epam.com>
 <9d10949d60aa930d6b281824f5879e804ff18918.1758197507.git.mykyta_poturai@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <9d10949d60aa930d6b281824f5879e804ff18918.1758197507.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Mykyta,

On 18/09/2025 13:16, Mykyta Poturai wrote:
> When stopping a core deinit_timer_interrupt is called in non-alloc
> context, which causes xfree in release_irq to fail an assert.
> 
> To fix this, switch to a statically allocated irqaction that does not
> need to be freed in release_irq.
 > > Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> ---
>   xen/arch/arm/time.c | 20 ++++++++++++++++----
>   1 file changed, 16 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/arch/arm/time.c b/xen/arch/arm/time.c
> index e74d30d258..6f215de210 100644
> --- a/xen/arch/arm/time.c
> +++ b/xen/arch/arm/time.c
> @@ -303,6 +303,20 @@ static void check_timer_irq_cfg(unsigned int irq, const char *which)
>              "WARNING: %s-timer IRQ%u is not level triggered.\n", which, irq);
>   }
>   
> +static struct irqaction __read_mostly irq_hyp = {
> +    .name = "hyptimer",
> +    .handler = htimer_interrupt,
> +    .dev_id = NULL,
> +    .free_on_release = 0,
> +};
> +
> +static struct irqaction __read_mostly irq_virt = {
> +    .name = "virtimer",
> +    .handler = vtimer_interrupt,
> +    .dev_id = NULL,
> +    .free_on_release = 0,
> +};

setup_irq() will update the field "next" in irqaction. So we need one 
instance per call. Effectively, this means one per CPU. Therefore, we 
want to use DEFINE_PER_CPU. This applies to the rest of the series.

Cheers,

-- 
Julien Grall


