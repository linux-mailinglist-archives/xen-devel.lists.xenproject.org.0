Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B90B9B44F38
	for <lists+xen-devel@lfdr.de>; Fri,  5 Sep 2025 09:23:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1111382.1460111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuQmc-00075u-Oa; Fri, 05 Sep 2025 07:22:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1111382.1460111; Fri, 05 Sep 2025 07:22:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuQmc-00072y-Km; Fri, 05 Sep 2025 07:22:54 +0000
Received: by outflank-mailman (input) for mailman id 1111382;
 Fri, 05 Sep 2025 07:22:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uuQma-00072s-Sy
 for xen-devel@lists.xenproject.org; Fri, 05 Sep 2025 07:22:52 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uuQma-007pIH-0U;
 Fri, 05 Sep 2025 07:22:52 +0000
Received: from [2a02:8012:3a1:0:2cb0:b4e5:ef93:763c]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uuQma-00GiTo-0R;
 Fri, 05 Sep 2025 07:22:52 +0000
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
	bh=gop+oxj4bO8artlzo8X4bb3Kxw3+M0m0HtSiUqEXQJE=; b=s28Vm1XLuhnpo7KwOC0Jd+/Swy
	QCYy/zfDpVKO+FgszAuDvlpzL/VpzZSX/zf1j2ZrPcGRw9t51cEJswgbfAPTJM+qXYiOKm5I1vc+D
	3TIMIFRveDb9F4Homy1Rn6hiZOvwJvXjalDDh+Y+MZ6YuVYtWTrBevoGsMT+hRQEumjM=;
Message-ID: <820704d0-4047-4f02-a058-01daba2765f1@xen.org>
Date: Fri, 5 Sep 2025 08:22:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 05/12] xen/arm: gicv3: implement handling of GICv3.1
 eSPI
Content-Language: en-GB
To: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "olekstysh@gmail.com" <olekstysh@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
References: <cover.1757015865.git.leonid_komarianskyi@epam.com>
 <bdb8b10babad3434347f7ee934e9ac18353653c9.1757015865.git.leonid_komarianskyi@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <bdb8b10babad3434347f7ee934e9ac18353653c9.1757015865.git.leonid_komarianskyi@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Leonid,

On 04/09/2025 21:01, Leonid Komarianskyi wrote:
> +#ifdef CONFIG_GICV3_ESPI
> +unsigned int gic_number_espis(void)
> +{
> +    return gic_hw_ops->info->nr_espi;
> +}
> +
> +static void __init gicv3_dist_espi_common_init(uint32_t type)
> +{
> +    unsigned int espi_nr, i;
> +
> +    espi_nr = min(1024U, GICD_TYPER_ESPIS_NUM(type));
> +    gicv3_info.nr_espi = espi_nr;
> +    /* The GIC HW doesn't support eSPI, so we can leave from here */
> +    if ( gicv3_info.nr_espi == 0 )
> +        return;
> +
> +    printk("GICv3: %d eSPI lines\n", gicv3_info.nr_espi);

Style: nr_espi is unsigned. So it should be %u. Can be fixed on commit 
if there is nothing else major to change.

> +
> +    /* The configuration for eSPIs is similar to that for regular SPIs */
> +    for ( i = 0; i < espi_nr; i += 16 )
> +        writel_relaxed(0, GICD + GICD_ICFGRnE + (i / 16) * 4);
> +
> +    for ( i = 0; i < espi_nr; i += 4 )
> +        writel_relaxed(GIC_PRI_IRQ_ALL,
> +                       GICD + GICD_IPRIORITYRnE + (i / 4) * 4);
> +
> +    for ( i = 0; i < espi_nr; i += 32 )
> +    {
> +        writel_relaxed(GENMASK(31, 0), GICD + GICD_ICENABLERnE + (i / 32) * 4);

Sorry I only spotted now.

The goal of gicv3_dist_espi_common_init() is to make sure the GIC is in 
a sane state for Xen (the previous OS or firmware may have left some 
state). Now the firmware may decide to use eSPI but not Xen (e.g. 
because CONFIG_ESPI=n).

This would means we may have eSPI interrupts that may be enabled and 
pending. So as soon as we re-enable the GIC we may receive interrupts we 
can't handle. So I think we may need to initialize the eSPI part of the 
distributor unconditionally. What do you think?


This could be handled as a follow-up but within the timeframe of Xen 
4.21. So for this patch:

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall


