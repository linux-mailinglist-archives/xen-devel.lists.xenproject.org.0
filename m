Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D6FB44EC5
	for <lists+xen-devel@lfdr.de>; Fri,  5 Sep 2025 09:10:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1111356.1460081 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuQar-0004eX-E0; Fri, 05 Sep 2025 07:10:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1111356.1460081; Fri, 05 Sep 2025 07:10:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuQar-0004c4-BG; Fri, 05 Sep 2025 07:10:45 +0000
Received: by outflank-mailman (input) for mailman id 1111356;
 Fri, 05 Sep 2025 07:10:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uuQap-0004bw-Gr
 for xen-devel@lists.xenproject.org; Fri, 05 Sep 2025 07:10:43 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uuQao-007p1d-33;
 Fri, 05 Sep 2025 07:10:43 +0000
Received: from [2a02:8012:3a1:0:2cb0:b4e5:ef93:763c]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uuQao-00GhnD-3A;
 Fri, 05 Sep 2025 07:10:43 +0000
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
	bh=Q3hmwYzlnHdqTiNPtPRmTAfQw1xTRe6hVjOxE1ArniE=; b=JfunKLpQVXE0PJw0U6MGOZgqdw
	jQVSswu5thaO2SEvm6jEmczRmGRVChMcfvAYX36a/WUgEA8MVi0BQ/e+C1HMPCcmMCKxQaQGHyQKC
	Q/Qwjz3lHu4aKHizU56PXuIYUWYBM4ZuQfwDZqGYA6trPrX5UDev6sI3socfk6cZuWFI=;
Message-ID: <3a487f5c-0837-46b4-ad17-410a4a4bc78a@xen.org>
Date: Fri, 5 Sep 2025 08:10:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 04/12] xen/arm/irq: add handling for IRQs in the eSPI
 range
Content-Language: en-GB
To: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "olekstysh@gmail.com" <olekstysh@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1757015865.git.leonid_komarianskyi@epam.com>
 <8b43ad89380261c3a3bbd0bc943461226d9cf0ce.1757015865.git.leonid_komarianskyi@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <8b43ad89380261c3a3bbd0bc943461226d9cf0ce.1757015865.git.leonid_komarianskyi@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Leonid,

On 04/09/2025 21:01, Leonid Komarianskyi wrote:
> diff --git a/xen/arch/arm/include/asm/irq.h b/xen/arch/arm/include/asm/irq.h
> index 5bc6475eb4..2ff2d07d6d 100644
> --- a/xen/arch/arm/include/asm/irq.h
> +++ b/xen/arch/arm/include/asm/irq.h
> @@ -32,6 +32,10 @@ struct arch_irq_desc {
>   #define SPI_MAX_INTID   1019
>   #define LPI_OFFSET      8192
>   
> +#define ESPI_BASE_INTID 4096
> +#define ESPI_MAX_INTID  5119
> +#define NR_ESPI_IRQS    1024
> +
>   /* LPIs are always numbered starting at 8192, so 0 is a good invalid case. */
>   #define INVALID_LPI     0
>   
> @@ -39,7 +43,12 @@ struct arch_irq_desc {
>   #define INVALID_IRQ     1023
>   
>   extern const unsigned int nr_irqs;
> +#ifdef CONFIG_GICV3_ESPI
> +/* This will cover the eSPI range, to allow asignmant of eSPIs to domains. */

Typo: s/asignmant/assignment/

[...]

> Unless INTIDs from the eSPI
> + * range are mistakenly defined in Xen DTS when the appropriate config is
> + * disabled, this function will not be reached because is_espi will return
> + * false for non-eSPI INTIDs.

I am still confused with this paragraph. How is this function can be 
reached if it is compiled out? Surely, if the DT is misconfigured, we 
should get an error when trying to route the interrupt. No? If so, can 
you point me to that code?

Cheers,

-- 
aJulien Grall


