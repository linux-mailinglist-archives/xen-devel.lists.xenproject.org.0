Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF715B37A7B
	for <lists+xen-devel@lfdr.de>; Wed, 27 Aug 2025 08:35:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1095545.1450506 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ur9kW-0003UK-Qb; Wed, 27 Aug 2025 06:35:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1095545.1450506; Wed, 27 Aug 2025 06:35:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ur9kW-0003Sh-Nk; Wed, 27 Aug 2025 06:35:12 +0000
Received: by outflank-mailman (input) for mailman id 1095545;
 Wed, 27 Aug 2025 06:35:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BCET=3H=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1ur9kV-0003Sb-EB
 for xen-devel@lists.xenproject.org; Wed, 27 Aug 2025 06:35:11 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fa1cb887-830f-11f0-b898-0df219b8e170;
 Wed, 27 Aug 2025 08:35:09 +0200 (CEST)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-33682342180so18744181fa.0
 for <xen-devel@lists.xenproject.org>; Tue, 26 Aug 2025 23:35:09 -0700 (PDT)
Received: from [192.168.0.110] ([91.123.151.69])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3369283e62esm2887971fa.18.2025.08.26.23.35.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Aug 2025 23:35:07 -0700 (PDT)
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
X-Inumbo-ID: fa1cb887-830f-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756276509; x=1756881309; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XInlv7EGZntIvOMZvIasoPVG70oWVMV41xM3NWKboe0=;
        b=WeM7aM4RArg2iwZdSNBAv0e/YeYIFHoGhDf08Xofhg4xBZPq8vQDwvzVooI/9Ci9vE
         OGyZoOI2iNAl7zZNQ9QlbPEAVvTCKNstJ/0g3toqKKDKTDEFCVZvfN0N6d5lrMRKQGqe
         Cy8XCoKdGiCPr8lMETViaMDZfZev4rVKSV4wauK0a41DD9gMWRWSIIoouuft52SoBAHd
         5+ybZ0lsNVuwr8MroFmeyOlrmbwxTVpVIXDkYcBvfKCTC9I2GMZu6q/HYbeXA+E9w4r3
         LOAD1WpGNpfCUZoIrTkJzNByu9bwr3XfXcmu/gb7HsIdYKG5IoH5K89o6cFBxQSxXA3l
         My7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756276509; x=1756881309;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XInlv7EGZntIvOMZvIasoPVG70oWVMV41xM3NWKboe0=;
        b=IpqSqKxolJ5R4VxfJ3Z0HaeI9cN3hzpUF4N+cmgxTf8lUBmc194Ma6Lg30FN3RQlB9
         OXM4pgWOQGEFKkCE8PoDXMqD6k/dSaVCWVStpYMXfghS/kgCPRZ9eGZAbs8Gh1RMAn4K
         fii/Ymt/kN1JDhtv1cwJPv3QYxHFFTvqTght348+5onGpYiII7H9E+BMsFWJgSRohPAT
         a+z40FtBbgWeZzor+a5ZH/FGLZL3ksTwcJgN1hZvzLiceSTrvVmPxkYModsyfsK4xqB+
         qoBzYzDCWmC6SYmj6RnQQaB51o3CLYp1wJT2leofz1ZFRaTZ8PniRzMBxqcPftGRNn9e
         NeJg==
X-Forwarded-Encrypted: i=1; AJvYcCXsNWcrKcpakhrGfryEUhHbjC0MrDuPHu/zU9EtDyat+EihPo4ghOOTvwK1Ob7wMTD1YSwHkiYablg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw1Q3y8kzj4Ug/p0dQ0khDcTMHRpgE6EKuFwVC/eTSkAGjM9+u5
	5Fis3mkPlmQNfuH2DM6kbNB3qnXKn+zIGcOmtXpvBP16mNH7r0erwFvc
X-Gm-Gg: ASbGncthZJHiVLHvvDEG1PP1hGzLC9Ph7D8w4eVcI4PEAe/cbvIdOs5qqOqTGknn+59
	6a6hCgrK9IKvb/WU5tmAJm5FG36jVExQwcQJMlq/bs/lCTN/NThtDcSSfjZYkkX0S8/I3l+DfMH
	daPvFcby0QYxVInkny0Lib0JqtWojM+SDh3pYeQnAM63OLdCoDJ/Z1J9XZGfNV/uN4KMWJlewGe
	Q4k68r87OM296qZiw3oXW8/a4D2h0jvLpUl42DaOEEkx4QVtHtIcTw6vAMLdUfBEtjLHzocyMp5
	+5lOavN7lOAGh1X2O9Sdbe56AneX5SXDHxv/ERCUnHg7ileQ68a7k7W4+v6ppDvPWymarwAXDZ9
	C0RQzVXGneUcUPON9BbZVEFtTrABB4BcYd83C
X-Google-Smtp-Source: AGHT+IGzcPt4eXzvpOckpLYlZsfbMe4Rmv4Miuvxc6Leu1YK0k3tKylfYCeDucfd/SzQB42cxZ9hZQ==
X-Received: by 2002:a05:651c:b21:b0:336:82be:5c78 with SMTP id 38308e7fff4ca-33682be60d8mr18948801fa.26.1756276508416;
        Tue, 26 Aug 2025 23:35:08 -0700 (PDT)
Message-ID: <54db12d6-cee3-4e5a-8fc7-d7686dc52d9d@gmail.com>
Date: Wed, 27 Aug 2025 09:35:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/11] xen/arm/irq: add handling for IRQs in the eSPI
 range
To: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1756216942.git.leonid_komarianskyi@epam.com>
 <8b42416d779537d6a0ac4902cabc549253b9da9d.1756216943.git.leonid_komarianskyi@epam.com>
Content-Language: en-US
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
In-Reply-To: <8b42416d779537d6a0ac4902cabc549253b9da9d.1756216943.git.leonid_komarianskyi@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 26.08.25 17:05, Leonid Komarianskyi wrote:

Hello Leonid


> Currently, Xen does not support eSPI interrupts, leading
> to a data abort when such interrupts are defined in the DTS.
> 
> This patch introduces a separate array to initialize up to
> 1024 interrupt descriptors in the eSPI range and adds the
> necessary defines and helper function. These changes lay the
> groundwork for future implementation of full eSPI interrupt
> support. As this GICv3.1 feature is not required by all vendors,
> all changes are guarded by ifdefs, depending on the corresponding
> Kconfig option.
> 
> Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>
> 
> ---
> Changes in V2:
> - use (ESPI_MAX_INTID + 1) instead of (ESPI_BASE_INTID + NR_IRQS)
> - remove unnecessary comment for nr_irqs initialization
> 
> Changes in V3:
> - introduced a new define NR_ESPI_IRQS to avoid confusion, like in the
>    case of using NR_IRQS for espi_desc array
> - implemented helper functions espi_to_desc and init_espi_data to make
>    it possible to add stubs with the same name, and as a result, reduce
>    the number of #ifdefs
> - change CONFIG_GICV3_ESPI default value to n
> ---
>   xen/arch/arm/Kconfig           |  9 ++++++
>   xen/arch/arm/include/asm/irq.h | 26 +++++++++++++++++
>   xen/arch/arm/irq.c             | 52 +++++++++++++++++++++++++++++++++-
>   3 files changed, 86 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index 17df147b25..5813e5b267 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -135,6 +135,15 @@ config GICV3
>   	  Driver for the ARM Generic Interrupt Controller v3.
>   	  If unsure, use the default setting.
>   
> +config GICV3_ESPI
> +	bool "Extended SPI range support"
> +	depends on GICV3 && !NEW_VGIC
> +	default n

Please omit redundant line

> +	help
> +	  Allow Xen and domains to use interrupt numbers from the extended SPI
> +	  range, from 4096 to 5119. This feature is introduced in GICv3.1
> +	  architecture.
> +

[snip]



