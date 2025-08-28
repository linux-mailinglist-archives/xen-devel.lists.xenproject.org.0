Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9329AB39E98
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 15:20:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1098791.1452754 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urcXn-0000ph-T8; Thu, 28 Aug 2025 13:19:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1098791.1452754; Thu, 28 Aug 2025 13:19:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urcXn-0000nI-Qa; Thu, 28 Aug 2025 13:19:59 +0000
Received: by outflank-mailman (input) for mailman id 1098791;
 Thu, 28 Aug 2025 13:19:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LvL0=3I=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1urcXm-0000nC-DN
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 13:19:58 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b15f763e-8411-11f0-8adc-4578a1afcccb;
 Thu, 28 Aug 2025 15:19:57 +0200 (CEST)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-55f4bcceed0so1076958e87.1
 for <xen-devel@lists.xenproject.org>; Thu, 28 Aug 2025 06:19:57 -0700 (PDT)
Received: from [192.168.0.110] ([91.123.151.69])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55f6130b6d7sm235684e87.50.2025.08.28.06.19.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Aug 2025 06:19:55 -0700 (PDT)
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
X-Inumbo-ID: b15f763e-8411-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756387197; x=1756991997; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AM7gvUipPUx/j+JSi0YmT8LY4xKZWt/f7rA6CmPb1ao=;
        b=EzKXhv3ulKXiwZYfkuLB3vhT4bokAwRzrN4Dl+t3g8CrcWjqjKZu2LYEqSDH4FNHIY
         sPFOGv/FP6997tZYHrIE+RXDBwGj+Sg7CZv3sa0RcX1TCR816YlUYKLuc5ArcVbzxlaO
         fhdUu7GUqrFFILZo7v0yOQxsqwGbCzTwx08swl9iNleERzlNPv4nkacQG4+zxGWvPPNr
         qHTw1HyFSpIRuHAHUutSaysXbYaEn6SMtpC70BOkOxuPc4yPHi3x4G/pqVNbnBWLdqtN
         p48lSgJ7ofPDCv7ofdCjXGbETXnIo5wbaAQETwzZmnnqOFApLg7Vm5nMC5HVpGuychn2
         Q/rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756387197; x=1756991997;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AM7gvUipPUx/j+JSi0YmT8LY4xKZWt/f7rA6CmPb1ao=;
        b=NwSkbk3/DULuuUmSyFyjf7W8+NxZMI4N6bPIe4Rb3P7wiqSltzB4MIzzrS4lzNpsOF
         t+Q7yUInvkxNIx7cKqcFnhT2ZClNIWvSUchTuT5eU+657QUmMTcvpTUrc4BtpO7bZ36T
         qEixBHo8yNUwb2iMPXpBwr4OMINzh73STl4Oh5h6Lz/N4+ulFQTHYaJyzvIZheVKjN46
         PApW1FgaabAzBXdoTAbzfpGsfD2NZp7P4DLtuy/kA4C86CAh405fMciSclyx+jp9jm+p
         7WL0T/1W9+hJim9baL7GEiLAx+n8EHz4uiUhKA0s5IdimUlCJ8StEXEOEhiHjWa+NCCt
         XwgA==
X-Forwarded-Encrypted: i=1; AJvYcCUeRT59PqOxbkOkSQnXPl92WHTHjXt4xWB+Hem93uo1sh+t9n37Jb1TJOk9tKru3NEP90tFglrum4U=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyf5DvrgeUKZlWcCD55NdQ12ale6KKp7rLHWfGQ+U4CtRQjkil+
	nz773mKCcsHKn8wlN/qJLFktWKHi9z8cRBZYWCH1wDQoPjW7eleuU1k2
X-Gm-Gg: ASbGncueK/p6Pog+RoRg7P3CUCm+g/LVp+uFsBfx4c3et2AWomTImEc7AfDfGbPXHsn
	pfU2sXk7nap1zAM9iW03asCYTawknLMZ7xLtlZSCdOurMwsqhjKJ0hknJlNE8zZBZqwKXNMuIhi
	JcAnVtGU0Tt51vZmvVgOP+rnzUnXxLHXJ/dcP8r41znZe9K4GVZ62C4VMgds7xIv+XyaYCFn2I/
	onvHmkLoH5wdrT4ohTR8SCcJQNW28POTML5Qz742C124SMetPTTr0gbSaWDZ+5gO403qnaENYii
	2gwP5RFna2NfUxF0T3g0KRIirOA6yVkDwmBAVXqlu2BCpdDgjGmzPtW1bT7p+Q0wkg4f9ORuBue
	DCaOHn4BO00ZqLwKjRfeVPO9qpg==
X-Google-Smtp-Source: AGHT+IH9FVuT3lNC4MyskKRKMIAMIadp3Ve8E7QgimLvPaEGJk7pPS9Hzx4Nv+0i4iEjs0yj2xyvGA==
X-Received: by 2002:a05:6512:110d:b0:55f:452b:9c15 with SMTP id 2adb3069b0e04-55f452ba194mr5094229e87.17.1756387196405;
        Thu, 28 Aug 2025 06:19:56 -0700 (PDT)
Message-ID: <1f4c921d-5c0d-46f6-b4c9-c7bf0e41330f@gmail.com>
Date: Thu, 28 Aug 2025 16:19:54 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/12] xen/arm: domain_build/dom0less-build: adjust
 domains config to support eSPIs
To: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1756317702.git.leonid_komarianskyi@epam.com>
 <66b39c4ba25e7a19beeca62ab23f5d3ab3cbae52.1756317702.git.leonid_komarianskyi@epam.com>
Content-Language: en-US
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
In-Reply-To: <66b39c4ba25e7a19beeca62ab23f5d3ab3cbae52.1756317702.git.leonid_komarianskyi@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 27.08.25 21:24, Leonid Komarianskyi wrote:

Hello Leonid

> The Dom0 and DomUs logic for the dom0less configuration in create_dom0() and
> arch_create_domUs() has been updated to account for extended SPIs when
> supported by the hardware and enabled with CONFIG_GICV3_ESPI. These changes
> ensure the proper calculation of the maximum number of SPIs and eSPIs available
> to Dom0 and DomUs in dom0less setups.
> 
> When eSPIs are supported by the hardware and CONFIG_GICV3_ESPI is enabled, the
> maximum number of eSPI interrupts is calculated using the ESPI_BASE_INTID
> offset (4096) and is limited to 1024, with 32 IRQs subtracted. To ensure
> compatibility with non-Dom0 domains, this adjustment is applied by the
> toolstack during domain creation, while for Dom0 or DomUs in Dom0, it is
> handled directly during VGIC initialization. If eSPIs are not supported, the
> calculation defaults to using the standard SPI range, with a maximum value of
> 992 interrupt lines, as it works currently.
> 
> Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>
> 
> ---
> Changes in V4:
> - consolidated the eSPI and SPI logic into a new inline function,
>    vgic_def_nr_spis. Without eSPI support (either due to config being
>    disabled or hardware not supporting it), it will return the regular SPI
>    range, as it works currently. There are no functional changes compared
>    with the previous patch version
> - removed VGIC_DEF_MAX_SPI macro, to reduce the number of ifdefs

very good, thanks, only NIT below

Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>



> 
> Changes in V3:
> - renamed macro VGIC_DEF_NR_ESPIS to more appropriate VGIC_DEF_MAX_SPI
> - added eSPI initialization for dom0less setups
> - fixed comment with mentions about dom0less builds
> - fixed formatting for lines with more than 80 symbols
> - updated commit message
> 
> Changes in V2:
> - no changes
> ---
>   xen/arch/arm/dom0less-build.c   |  2 +-
>   xen/arch/arm/domain_build.c     |  2 +-
>   xen/arch/arm/include/asm/vgic.h | 21 +++++++++++++++++++++
>   3 files changed, 23 insertions(+), 2 deletions(-)
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
> index fb4cea73eb..11f9d216eb 100644
> --- a/xen/arch/arm/include/asm/vgic.h
> +++ b/xen/arch/arm/include/asm/vgic.h
> @@ -355,6 +355,27 @@ extern void vgic_check_inflight_irqs_pending(struct vcpu *v,
>   /* Default number of vGIC SPIs. 32 are substracted to cover local IRQs. */
>   #define VGIC_DEF_NR_SPIS (min(gic_number_lines(), VGIC_MAX_IRQS) - 32)
>   
> +static inline unsigned int vgic_def_nr_spis(void)
> +{
> +#ifdef CONFIG_GICV3_ESPI
> +    /*
> +     * Check if the hardware supports extended SPIs (even if the appropriate
> +     * config is set). If not, the common SPI range will be used. Otherwise
> +     * returns the maximum eSPI INTID, supported by HW GIC, subtracted by 32.

NIT: s/returns/return ...


> +     * For non-Dom0 domains, the toolstack or arch_create_domUs function
> +     * applies the same adjustment to cover local IRQs (please, see comment
> +     * for macro that is used for regular SPIs - VGIC_DEF_NR_SPIS).

  ... I am not 100% sure, that I follow the wording "For non-Dom0 
domains, the toolstack or arch_create_domUs ...". Did you perhaps mean:

For Dom0 and started at boot time DomUs ...?

  We will
> +     * add back this value during VGIC initialization. This ensures consistent
> +     * handling for Dom0 and other domains. For the regular SPI range interrupts
> +     * in this case, the maximum value of VGIC_DEF_NR_SPIS will be used.
> +     */
> +    if ( gic_number_espis() > 0 )
> +        return ESPI_BASE_INTID + min(gic_number_espis(), 1024U) - 32;
> +#endif
> +
> +    return VGIC_DEF_NR_SPIS;
> +}
> +
>   extern bool vgic_is_valid_line(struct domain *d, unsigned int virq);
>   
>   static inline bool vgic_is_spi(struct domain *d, unsigned int virq)


