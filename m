Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB1B7834EE
	for <lists+xen-devel@lfdr.de>; Mon, 21 Aug 2023 23:34:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.587903.919311 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYCXq-0002aK-OT; Mon, 21 Aug 2023 21:34:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 587903.919311; Mon, 21 Aug 2023 21:34:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYCXq-0002Y4-LU; Mon, 21 Aug 2023 21:34:42 +0000
Received: by outflank-mailman (input) for mailman id 587903;
 Mon, 21 Aug 2023 21:34:41 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qYCXp-0002Xy-LJ
 for xen-devel@lists.xenproject.org; Mon, 21 Aug 2023 21:34:41 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qYCXp-0002dO-5T; Mon, 21 Aug 2023 21:34:41 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qYCXo-0007eZ-UM; Mon, 21 Aug 2023 21:34:41 +0000
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
	bh=Qa3s1YolGB3ar4TNKgUfeOUYGBgoB/JRJVVzTqWfkfk=; b=dhBHsRdN371HyC3v7ny5ewVuX9
	GTkta/jGn2/mPg8wB4/TCEHf0VK/97i+2G2b2sZvSOvKzXT07izouQiALMysqEG6U+SPUSpydSi4X
	+4Fo+qx2ztLjqTckEXfHH/y7bHM0Wut+xksFxcDbPiN8OYpBCR3BTcnszUPTi6+CkNfw=;
Message-ID: <67f4015f-fb63-f097-ce1b-ea6264232a1e@xen.org>
Date: Mon, 21 Aug 2023 22:34:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [PATCH v5 13/13] xen/arm: mmu: enable SMMU subsystem only in MMU
To: Henry Wang <Henry.Wang@arm.com>, xen-devel@lists.xenproject.org
Cc: Penny Zheng <Penny.Zheng@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Paul Durrant <paul@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen <wei.chen@arm.com>
References: <20230814042536.878720-1-Henry.Wang@arm.com>
 <20230814042536.878720-14-Henry.Wang@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230814042536.878720-14-Henry.Wang@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 14/08/2023 05:25, Henry Wang wrote:
> From: Penny Zheng <Penny.Zheng@arm.com>
> 
> SMMU subsystem is only supported in MMU system, so we make it dependent
> on CONFIG_HAS_MMU.

"only supported" as in it doesn't work with Xen or the HW is not 
supporting it?

Also, I am not entirely convinced that anything in passthrough would 
properly work with MPU. At least none of the IOMMU drivers are. So I 
would consider to completely disable HAS_PASSTHROUGH.

> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> Signed-off-by: Henry Wang <Henry.Wang@arm.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>
> ---
> v5:
> - Add Acked-by tag from Jan.
> v4:
> - No change
> v3:
> - new patch
> ---
>   xen/drivers/passthrough/Kconfig | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/drivers/passthrough/Kconfig b/xen/drivers/passthrough/Kconfig
> index 864fcf3b0c..ebb350bc37 100644
> --- a/xen/drivers/passthrough/Kconfig
> +++ b/xen/drivers/passthrough/Kconfig
> @@ -5,6 +5,7 @@ config HAS_PASSTHROUGH
>   if ARM
>   config ARM_SMMU
>   	bool "ARM SMMUv1 and v2 driver"
> +	depends on MMU
>   	default y
>   	---help---
>   	  Support for implementations of the ARM System MMU architecture
> @@ -15,7 +16,7 @@ config ARM_SMMU
>   
>   config ARM_SMMU_V3
>   	bool "ARM Ltd. System MMU Version 3 (SMMUv3) Support" if EXPERT
> -	depends on ARM_64 && (!ACPI || BROKEN)
> +	depends on ARM_64 && (!ACPI || BROKEN) && MMU
>   	---help---
>   	 Support for implementations of the ARM System MMU architecture
>   	 version 3. Driver is in experimental stage and should not be used in

Cheers,

-- 
Julien Grall

