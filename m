Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB40670CCA
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jan 2023 00:09:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.479963.744077 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHv4i-0003wi-IK; Tue, 17 Jan 2023 23:09:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 479963.744077; Tue, 17 Jan 2023 23:09:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHv4i-0003ub-Du; Tue, 17 Jan 2023 23:09:04 +0000
Received: by outflank-mailman (input) for mailman id 479963;
 Tue, 17 Jan 2023 23:09:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pHv4g-0003uV-Fe
 for xen-devel@lists.xenproject.org; Tue, 17 Jan 2023 23:09:02 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pHv4g-0006Pq-0w; Tue, 17 Jan 2023 23:09:02 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pHv4f-0002gB-Qu; Tue, 17 Jan 2023 23:09:01 +0000
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
	bh=TMdBwipMsR4sGxcGr3hd4B/7d5FHTYOFYAxQ4CRlq8M=; b=dFOeRE9I8CQNkR2rF7qtAM7K9j
	qF9XiUCY/D0YB1kcagLeBPJFEwlLT2NIE2FVaY6DA/sFBAsYVqGhQqx6EGD15T01dAcjHCz7Z3IrZ
	CVdCXPMvrXR7SPxksofq8oWfR/CZHht/w319f2bnFRafgJlJMks5alfXRk4pJN8gZdvY=;
Message-ID: <32811667-4f9c-12f1-7b8f-2b066bc3dee9@xen.org>
Date: Tue, 17 Jan 2023 23:09:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 02/40] xen/arm: make ARM_EFI selectable for Arm64
To: Penny Zheng <Penny.Zheng@arm.com>, xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230113052914.3845596-1-Penny.Zheng@arm.com>
 <20230113052914.3845596-3-Penny.Zheng@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230113052914.3845596-3-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Penny,

On 13/01/2023 05:28, Penny Zheng wrote:
> From: Wei Chen <wei.chen@arm.com>
> 
> Currently, ARM_EFI will mandatorily selected by Arm64.
> Even if the user knows for sure that their images will not
> start in the EFI environment, they can't disable the EFI
> support for Arm64. This means there will be about 3K lines
> unused code in their images.
> 
> So in this patch, we make ARM_EFI selectable for Arm64, and
> based on that, we can use CONFIG_ARM_EFI to gate the EFI
> specific code in head.S for those images that will not be
> booted in EFI environment.
> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>

Your signed-off-by is missing.

> ---
> v1 -> v2:
> 1. New patch
> ---
>   xen/arch/arm/Kconfig      | 10 ++++++++--
>   xen/arch/arm/arm64/head.S | 15 +++++++++++++--
>   2 files changed, 21 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index 239d3aed3c..ace7178c9a 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -7,7 +7,6 @@ config ARM_64
>   	def_bool y
>   	depends on !ARM_32
>   	select 64BIT
> -	select ARM_EFI
>   	select HAS_FAST_MULTIPLY
>   
>   config ARM
> @@ -37,7 +36,14 @@ config ACPI
>   	  an alternative to device tree on ARM64.
>   
>   config ARM_EFI
> -	bool
> +	bool "UEFI boot service support"
> +	depends on ARM_64
> +	default y
> +	help
> +	  This option provides support for boot services through
> +	  UEFI firmware. A UEFI stub is provided to allow Xen to
> +	  be booted as an EFI application. This is only useful for
> +	  Xen that may run on systems that have UEFI firmware.

I would drop the last sentence as this is implied with the rest of the 
paragraph.

Cheers,

-- 
Julien Grall

