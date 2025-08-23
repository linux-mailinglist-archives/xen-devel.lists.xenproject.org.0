Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3084CB328AD
	for <lists+xen-devel@lfdr.de>; Sat, 23 Aug 2025 15:02:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1091231.1447996 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upnsw-0000BE-M1; Sat, 23 Aug 2025 13:02:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1091231.1447996; Sat, 23 Aug 2025 13:02:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upnsw-00008G-Ir; Sat, 23 Aug 2025 13:02:18 +0000
Received: by outflank-mailman (input) for mailman id 1091231;
 Sat, 23 Aug 2025 13:02:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LOa+=3D=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1upnsu-00008A-Tu
 for xen-devel@lists.xenproject.org; Sat, 23 Aug 2025 13:02:16 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 643ff131-8021-11f0-a32b-13f23c93f187;
 Sat, 23 Aug 2025 15:02:15 +0200 (CEST)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-55ce5097493so2684258e87.0
 for <xen-devel@lists.xenproject.org>; Sat, 23 Aug 2025 06:02:15 -0700 (PDT)
Received: from [192.168.0.110] ([91.123.151.69])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55f35bffab4sm502267e87.9.2025.08.23.06.02.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Aug 2025 06:02:12 -0700 (PDT)
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
X-Inumbo-ID: 643ff131-8021-11f0-a32b-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755954134; x=1756558934; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IoU26xKHPeY9hUXQ9gUpNVV7cWVumIngLl3l0tskYZI=;
        b=GjoAIlSSRsOlNSWQMY7rW1VYRK+mIxW8fgNubuhiWDe94GVw1vuu2aN+AnLdzoALf4
         wDjzCkYL1YFxIS2h/ZvtAXQvUBmzzpn6DAdmlZJDzIQUOJxujEgbP3e993QdJYZUqZXy
         zQbEc3OqzHWceL32XSEtT0GBz79tb4rbfgi8dFP9jcrd188XAO7iIMIgabmeFIFc3b/E
         fWc7y+tMyXQSv78ka5RV+vsMBbtTOVkUbHdanoREnpnIF4vV39+wId8wjHroFaHqWGW2
         23AMBbK2CjjfMqhvl8HCID3ehQBseMcAv3WP5E34n5p/mmbtfDC8LlvOlVAWCo2Ci6O6
         pxFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755954134; x=1756558934;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IoU26xKHPeY9hUXQ9gUpNVV7cWVumIngLl3l0tskYZI=;
        b=VS0ngXJ942i/6xmT/zrAxlOuDmf1ZveYWUY74f/teQ6DmcTSZ1XCdvGQr41imOIkQa
         v3cfNDjjhlG2xsIlhhAxxdk/lDgv0fAW+3FAc3n3CuT6OZ0u+Xit8kpqbbkMvvlmiou4
         YY6hOSfhCl5PlRqzFEYHz9MmvJkKF67Yke7Xj1BLY+hI+B68NJJSS95mwqrLurOv0HmQ
         wwXBI53EiVcz6FujpvXxirSScJ1u/c+MA84tthw6q9sx2r2StpK/rVaisBTFIC5vD2r7
         MXsxTdTv2RXmEaAlhda76XrBqDphoy8JEVO0zuzrnEh+dpGURQw9oC4KGXHNxPnAVNGp
         B6hQ==
X-Gm-Message-State: AOJu0YywVeiwVl15ytMMmmjFeS3i0//JB8rYciOAo9gRVa7mJX0Kxboe
	eNezQGbY2/1RPv6RYCRWpdLZzhlD0jSL5R6wik/cQLw5+ZFL9dIIOOx3JOFR7A==
X-Gm-Gg: ASbGnctUygfmqF87fgX2p6KWfjFAK0l0HE48+kQgl5Ynnc8XL0mN7DyoIVskT0VDiyN
	IAVLBNzxBJ7svLvnrXS09pG2VGvuHAXe/iaKOhmM8aZEh0fwLWRSUf/vAIbrpZz8bm4JfHfyCGP
	bl6PeXZvcS7DNvAp4gI8vNDp+RDbmD9cfecsTdBawyY8t26xtssfb5ZTHhYpWY9GFmQBlGT1SgP
	q3lDKhBr7q0EQnel6aW3Vlppo+XkJ5t+ug5MN/PllqXs5RcRLuIBOj3SUwDvQuuIW35DrC7pr7Z
	87BsnPWyXCy2I1jmHk118FfXdf1j1YWFEae+RVQTMfBVgDWCxq9DNOvu5EjS2oOO+PCFnep9sMr
	Qu1X0YpQbgja3GATtsQdCkaMP2w==
X-Google-Smtp-Source: AGHT+IGjA4bJH2rb+EZDxueiE5sFViqUJr7b3umUOK40C1VLW2vX0j0umeQXrY7s63HWWTPYipgB/w==
X-Received: by 2002:a05:6512:3b86:b0:55b:922b:f626 with SMTP id 2adb3069b0e04-55f0d396a5amr1898859e87.45.1755954133846;
        Sat, 23 Aug 2025 06:02:13 -0700 (PDT)
Message-ID: <543c8010-bc73-4da8-be9a-f1774ec8b963@gmail.com>
Date: Sat, 23 Aug 2025 16:02:11 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/10] xen/arm: domain_build: adjust Dom0 IRQ handling
 to support eSPIs
To: xen-devel@lists.xenproject.org,
 Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
References: <7e6477a83ab65220ef1c5dd22f4ef3536fbbdd5c.1754568795.git.leonid_komarianskyi@epam.com>
 <abba685916e6637eedbd831352bed2e968eeb7dc.1754568795.git.leonid_komarianskyi@epam.com>
Content-Language: en-US
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
In-Reply-To: <abba685916e6637eedbd831352bed2e968eeb7dc.1754568795.git.leonid_komarianskyi@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 07.08.25 15:33, Leonid Komarianskyi wrote:

Hello Leonid

> The Dom0 configuration logic in create_dom0() has been updated
> to account for extended SPIs when supported by the hardware and
> enabled with CONFIG_GICV3_ESPI. These changes ensure the proper
> calculation of the maximum number of SPIs and eSPIs available for Dom0.
> 
> When eSPIs are supported by the hardware and CONFIG_GICV3_ESPI is
> enabled, the maximum number of eSPI interrupts is calculated using
> the ESPI_BASE_INTID offset (4096) and limited at 1024, with 32 IRQs
> subtracted. To ensure compatibility with non-Dom0 domains, this
> adjustment is applied by the toolstack during domain creation, while
> for Dom0 it is handled directly during VGIC initialization. If eSPIs
> are not supported, the calculation defaults to using the standard SPI
> range, with a maximum value of 992 interrupt lines as it works now.
> 
> Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>
> 
> ---
> Changes in V2:
> - no changes
> ---
>   xen/arch/arm/domain_build.c     | 10 ++++++++++
>   xen/arch/arm/include/asm/vgic.h | 11 +++++++++++
>   2 files changed, 21 insertions(+)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index d91a71acfd..fa5abf2dfb 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -2055,6 +2055,16 @@ void __init create_dom0(void)
>       /* The vGIC for DOM0 is exactly emulating the hardware GIC */
>       dom0_cfg.arch.gic_version = XEN_DOMCTL_CONFIG_GIC_NATIVE;
>       dom0_cfg.arch.nr_spis = VGIC_DEF_NR_SPIS;
> +#ifdef CONFIG_GICV3_ESPI
> +    /*
> +     * Check if the hardware supports extended SPIs (even if the appropriate config is set).
> +     * If not, the common SPI range will be used. Otherwise overwrite the nr_spis with the
> +     * maximum available INTID from eSPI range. In that case, the number of regular SPIs will
> +     * be adjusted to the maximum value during vGIC initialization.
> +     */
> +    if ( gic_number_espis() > 0 )
> +        dom0_cfg.arch.nr_spis = VGIC_DEF_NR_ESPIS;
> +#endif

I might miss something, but within the whole series, you seem not to 
update "nr_spis" field for dom0less DomUs (in dom0less-build.c). Please 
clarify the reason?

>       dom0_cfg.arch.tee_type = tee_get_type();
>       dom0_cfg.max_vcpus = dom0_max_vcpus();
>   

[snip]

