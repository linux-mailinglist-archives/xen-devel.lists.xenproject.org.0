Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33732B40ADF
	for <lists+xen-devel@lfdr.de>; Tue,  2 Sep 2025 18:42:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1107098.1457641 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utU5o-0008RK-6O; Tue, 02 Sep 2025 16:42:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1107098.1457641; Tue, 02 Sep 2025 16:42:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utU5o-0008OQ-1n; Tue, 02 Sep 2025 16:42:48 +0000
Received: by outflank-mailman (input) for mailman id 1107098;
 Tue, 02 Sep 2025 16:42:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1utU5l-0008OC-S4
 for xen-devel@lists.xenproject.org; Tue, 02 Sep 2025 16:42:45 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1utU5l-002yie-0C;
 Tue, 02 Sep 2025 16:42:45 +0000
Received: from [15.248.2.30] (helo=[10.24.67.22])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1utU5l-00DHrD-06;
 Tue, 02 Sep 2025 16:42:45 +0000
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
	bh=UIHGFTGttUFMFzgNU+ihyk8d0IGpgeTFlFTVEjVBREY=; b=OuoW9d5RjYv7LmEobi056jAoyU
	UH4XX3WObvcYMPY+xbpTdFkiuNHVQXON5HmgjtTMCyrt8eHJUHpDHItQ1LPjlPuJ9uewHZDW7v1UD
	FGQUohD4Pn7Ij8oHMUSKTrzuLlW7QtOphBvpMUZHW6CMnzFYJFZdFZxK5DcBkX+fzj3I=;
Message-ID: <5ab75c0a-0bf6-418a-8c8f-7411a46d4189@xen.org>
Date: Tue, 2 Sep 2025 17:42:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 09/12] xen/arm: domain_build/dom0less-build: adjust
 domains config to support eSPIs
Content-Language: en-GB
To: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "olekstysh@gmail.com" <olekstysh@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
References: <cover.1756481577.git.leonid_komarianskyi@epam.com>
 <bd60d55fa8ffe081cee50bf8f53343e770863c3e.1756481577.git.leonid_komarianskyi@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <bd60d55fa8ffe081cee50bf8f53343e770863c3e.1756481577.git.leonid_komarianskyi@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Leonid,

On 29/08/2025 17:06, Leonid Komarianskyi wrote:
> The Dom0 and DomUs logic for the dom0less configuration in create_dom0() and
> arch_create_domUs() has been updated to account for extended SPIs when
> supported by the hardware and enabled with CONFIG_GICV3_ESPI.

Style: We don't commonly use past tense to describe the new behavior.
>   xen/arch/arm/dom0less-build.c   |  2 +-
>   xen/arch/arm/domain_build.c     |  2 +-
>   xen/arch/arm/include/asm/vgic.h | 19 +++++++++++++++++++
>   3 files changed, 21 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
> index 69b9ea22ce..02d5559102 100644
> --- a/xen/arch/arm/dom0less-build.c
> +++ b/xen/arch/arm/dom0less-build.c
> @@ -285,7 +285,7 @@ void __init arch_create_domUs(struct dt_device_node *node,
>       {
>           int vpl011_virq = GUEST_VPL011_SPI;
>   
> -        d_cfg->arch.nr_spis = VGIC_DEF_NR_SPIS;
> +        d_cfg->arch.nr_spis = vgic_def_nr_spis();
>   
>           /*
>            * The VPL011 virq is GUEST_VPL011_SPI, unless direct-map is
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index d91a71acfd..39eea0be00 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -2054,7 +2054,7 @@ void __init create_dom0(void)
>   
>       /* The vGIC for DOM0 is exactly emulating the hardware GIC */
>       dom0_cfg.arch.gic_version = XEN_DOMCTL_CONFIG_GIC_NATIVE;
> -    dom0_cfg.arch.nr_spis = VGIC_DEF_NR_SPIS;
> +    dom0_cfg.arch.nr_spis = vgic_def_nr_spis();
>       dom0_cfg.arch.tee_type = tee_get_type();
>       dom0_cfg.max_vcpus = dom0_max_vcpus();
>   
> diff --git a/xen/arch/arm/include/asm/vgic.h b/xen/arch/arm/include/asm/vgic.h
> index 912d5b7694..3aa22114ba 100644
> --- a/xen/arch/arm/include/asm/vgic.h
> +++ b/xen/arch/arm/include/asm/vgic.h
> @@ -347,6 +347,25 @@ extern void vgic_check_inflight_irqs_pending(struct vcpu *v,
>   /* Default number of vGIC SPIs. 32 are substracted to cover local IRQs. */
>   #define VGIC_DEF_NR_SPIS (min(gic_number_lines(), VGIC_MAX_IRQS) - 32)>
> +static inline unsigned int vgic_def_nr_spis(void)
> +{
> +#ifdef CONFIG_GICV3_ESPI
> +    /*
> +     * Check if the hardware supports extended SPIs (even if the appropriate
> +     * config is set). If not, the common SPI range will be used. Otherwise
> +     * return the maximum eSPI INTID, supported by HW GIC, subtracted by 32.
> +     * For Dom0 and started at boot time DomUs we will add back this value
> +     * during VGIC initialization. This ensures consistent handling for Dom0
> +     * and other domains. For the regular SPI range interrupts in this case,
> +     * the maximum value of VGIC_DEF_NR_SPIS will be used.
> +     */
> +    if ( gic_number_espis() > 0 )
> +        return ESPI_BASE_INTID + min(gic_number_espis(), 1024U) - 32;
> +#endif
> +
> +    return VGIC_DEF_NR_SPIS;

This is the only user of VGIC_DEF_NR_SPIS. Therefore, I would prefer if 
we remove the define. This will avoid any confusion between the helper 
and the define.

Cheers,

-- 
Julien Grall


