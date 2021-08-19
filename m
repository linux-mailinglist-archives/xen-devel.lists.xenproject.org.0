Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A543F1A94
	for <lists+xen-devel@lfdr.de>; Thu, 19 Aug 2021 15:38:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.168817.308263 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGiFT-0007gE-8y; Thu, 19 Aug 2021 13:38:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168817.308263; Thu, 19 Aug 2021 13:38:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGiFT-0007dZ-5X; Thu, 19 Aug 2021 13:38:23 +0000
Received: by outflank-mailman (input) for mailman id 168817;
 Thu, 19 Aug 2021 13:38:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mGiFS-0007dT-2t
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 13:38:22 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mGiFR-0000Dr-1X; Thu, 19 Aug 2021 13:38:21 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mGiFQ-0001bX-Rk; Thu, 19 Aug 2021 13:38:20 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=9kGuUOVCZyqMQIsrKypF1g+S380JcqaobSUrK9HymaI=; b=sTALER8v4JETJ4f3sUWzd2WTx2
	i2MrgTHdcqocpY2L6hUTmoULiR2dsMF1/NanDjag9rj8IHzAzjC4Hmm61/Zq4uqPCs3Mkpd7+nTF3
	hcA57iURKWbW4NOwAcGi3dqnX3IRKsaCu6BrIXwfvDPr+gep2IOIrLbA7C4qJcdLMUOk=;
Subject: Re: [XEN RFC PATCH 17/40] xen/arm: Introduce DEVICE_TREE_NUMA Kconfig
 for arm64
To: Wei Chen <wei.chen@arm.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org, jbeulich@suse.com
Cc: Bertrand.Marquis@arm.com
References: <20210811102423.28908-1-wei.chen@arm.com>
 <20210811102423.28908-18-wei.chen@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <1fbcb8a6-67b6-e2d6-6524-cfce7a8a6557@xen.org>
Date: Thu, 19 Aug 2021 14:38:18 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210811102423.28908-18-wei.chen@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi,

On 11/08/2021 11:24, Wei Chen wrote:
> We need a Kconfig option to distinguish with ACPI based
> NUMA. So we introduce the new Kconfig option:
> DEVICE_TREE_NUMA in this patch for Arm64.
> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> ---
>   xen/arch/arm/Kconfig | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index ecfa6822e4..678cc98ea3 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -33,6 +33,16 @@ config ACPI
>   	  Advanced Configuration and Power Interface (ACPI) support for Xen is
>   	  an alternative to device tree on ARM64.
>   
> +config DEVICE_TREE_NUMA

The name suggests that NUMA should only be enabled for Device-Tree... 
But the description looks generic.

However, I think the user should only have the choice to say whether 
they want NUMA to be enabled or not. We should not give them the choice 
to enable/disable the parsing for DT/ACPI.

So we should have a generic config that will then select DT (and ACPI in 
the future).

> +	bool "NUMA (Non-Uniform Memory Access) Support (UNSUPPORTED)" if UNSUPPORTED
> +	depends on ARM_64
> +	select NUMA
> +	---help---
> +
> +	  Non-Uniform Memory Access (NUMA) is a computer memory design used in
> +	  multiprocessing, where the memory access time depends on the memory
> +	  location relative to the processor.
> +

Cheers,

-- 
Julien Grall

