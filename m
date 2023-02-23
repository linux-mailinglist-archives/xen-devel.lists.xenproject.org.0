Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8B46A0C0C
	for <lists+xen-devel@lfdr.de>; Thu, 23 Feb 2023 15:43:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.500469.771869 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVCoQ-0002zK-Il; Thu, 23 Feb 2023 14:43:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 500469.771869; Thu, 23 Feb 2023 14:43:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVCoQ-0002w6-FU; Thu, 23 Feb 2023 14:43:10 +0000
Received: by outflank-mailman (input) for mailman id 500469;
 Thu, 23 Feb 2023 14:43:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pVCoP-0002w0-HA
 for xen-devel@lists.xenproject.org; Thu, 23 Feb 2023 14:43:09 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pVCoP-00076t-8A; Thu, 23 Feb 2023 14:43:09 +0000
Received: from 54-240-197-225.amazon.com ([54.240.197.225]
 helo=[192.168.22.85]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pVCoP-0000tE-1k; Thu, 23 Feb 2023 14:43:09 +0000
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
	bh=GxemZDTZWly5Y+rRk8mtp/ERbAZTWpcC5P9mMwc9Z64=; b=d/IGAjNWqChNXIcnu/9DSY7w3E
	gWEvQ+vX6cI0AJbxPOvAsgFgFU+bbLProBEdi6rMygXLmE8lxfVNjcUW25OnhYxoA58/H5FLGoaqL
	Oht1fRijsFZV8i/Bs0Tcx5dHG8u+IUDqjz1LrZ3H8Wa71b54uoRsLgPi/XGYVF+ogGKw=;
Message-ID: <b8717603-b645-0d8c-6d5b-e8af642edd17@xen.org>
Date: Thu, 23 Feb 2023 14:43:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [XEN PATCH v7 02/20] xen/arm: tee: add a primitive FF-A mediator
Content-Language: en-US
To: Jens Wiklander <jens.wiklander@linaro.org>, xen-devel@lists.xenproject.org
Cc: Bertrand.Marquis@arm.com, Marc Bonnici <marc.bonnici@arm.com>,
 Achin Gupta <achin.gupta@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1677079671.git.jens.wiklander@linaro.org>
 <5f0a74b3e4f6cda56e780a739859537246d4892f.1677079672.git.jens.wiklander@linaro.org>
From: Julien Grall <julien@xen.org>
In-Reply-To: <5f0a74b3e4f6cda56e780a739859537246d4892f.1677079672.git.jens.wiklander@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I have only skimmed through the patch so far and I have one question below.

On 22/02/2023 15:32, Jens Wiklander wrote:
> Adds a FF-A version 1.1 [1] mediator to communicate with a Secure
> Partition in secure world.
> 
> This commit brings in only the parts needed to negotiate FF-A version
> number with guest and SPMC.
> 
> [1] https://developer.arm.com/documentation/den0077/e
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> ---
>   xen/arch/arm/include/asm/domain.h  |   2 +-
>   xen/arch/arm/include/asm/psci.h    |   4 +
>   xen/arch/arm/include/asm/tee/ffa.h |  35 +++++
>   xen/arch/arm/tee/Kconfig           |  11 ++
>   xen/arch/arm/tee/Makefile          |   1 +
>   xen/arch/arm/tee/ffa.c             | 217 +++++++++++++++++++++++++++++
>   xen/arch/arm/vsmc.c                |  17 ++-
>   xen/include/public/arch-arm.h      |   1 +
>   8 files changed, 284 insertions(+), 4 deletions(-)
>   create mode 100644 xen/arch/arm/include/asm/tee/ffa.h
>   create mode 100644 xen/arch/arm/tee/ffa.c
> 
> diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
> index 0e310601e846..754daa8efa04 100644
> --- a/xen/arch/arm/include/asm/domain.h
> +++ b/xen/arch/arm/include/asm/domain.h
> @@ -110,7 +110,7 @@ struct arch_domain
>       struct vpl011 vpl011;
>   #endif
>   
> -#ifdef CONFIG_TEE
> +#if defined(CONFIG_TEE) || defined(CONFIG_FFA)
I am confused, AFAICT, you are implementing FFA using TEE, so doesn't 
this mean that CONFIG_FFA depends on CONFIG_TEE?

If so, then you should not need the extra defined here.

>       void *tee;
>   #endif

-- 
Julien Grall

