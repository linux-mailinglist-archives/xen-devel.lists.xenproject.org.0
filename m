Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8C3778FFB
	for <lists+xen-devel@lfdr.de>; Fri, 11 Aug 2023 14:57:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.582411.912173 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qURhA-0004by-Oq; Fri, 11 Aug 2023 12:56:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 582411.912173; Fri, 11 Aug 2023 12:56:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qURhA-0004Yo-Lq; Fri, 11 Aug 2023 12:56:48 +0000
Received: by outflank-mailman (input) for mailman id 582411;
 Fri, 11 Aug 2023 12:56:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qURh8-0004Yi-T5
 for xen-devel@lists.xenproject.org; Fri, 11 Aug 2023 12:56:46 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qURh8-0002sY-Gi; Fri, 11 Aug 2023 12:56:46 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.207.66]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qURh8-0007rc-8t; Fri, 11 Aug 2023 12:56:46 +0000
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
	bh=VmQAQAWH4nWRtdIo8DizpFUyoelXvU2eEqiSTFWHJYM=; b=RcWBvXDQuJ7TnFR/gimuJEqNXy
	d9aF/i8cgoWaUD4fuJwAFtfrFqBSOxjtsT/nddAvRr0Hiz1Ws9UCt2+O0ptphKIzu90XJZD+QSD1Z
	YjgV685AJ4xm9oc4TkN5jko2v0eODLyy3+7+bTbLNVUCl9I93khaejJULTFmffpLMCGk=;
Message-ID: <b9d88e5a-91d1-43b7-becd-8a742698e1c8@xen.org>
Date: Fri, 11 Aug 2023 13:56:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] xen/arm: Add asm/domain.h include to kernel.h
Content-Language: en-GB
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com, rahul.singh@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230808080010.3858575-1-luca.fancellu@arm.com>
 <20230808080010.3858575-3-luca.fancellu@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230808080010.3858575-3-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Luca,

On 08/08/2023 09:00, Luca Fancellu wrote:
> Add asm/domain.h that is defining the type 'enum domain_type', it
> is needed on arm64 build where this type is used for a member of
> the structure kernel_info.

I read "needed" as in it Xen build is broken. But AFAIK, this is more a 
latent issue if someone else want to include the header. Is that correct?

If so, how about:

The 'enum domain_type' is defined by 'asm/domain.h' which is not 
included (directly or indirectly) by 'asm/kernel.h'.

This currently doesn't break the compilation because asm/domain.h will 
included by the user of 'kernel.h'. But it would be better to avoid 
relying on it. So add the include in 'asm/domain.h'.

> Fixes: 66e994a5e74f ("xen: arm64: add guest type to domain field.")

While we aim to have header self-contained, this has never been a 
guarantee in Xen. So I would argue this is not a fix in the sense it 
someone would want to ingest it in there tree.

Cheers,

> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
>   xen/arch/arm/include/asm/kernel.h | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/xen/arch/arm/include/asm/kernel.h b/xen/arch/arm/include/asm/kernel.h
> index 4617cdc83bac..0a23e86c2d37 100644
> --- a/xen/arch/arm/include/asm/kernel.h
> +++ b/xen/arch/arm/include/asm/kernel.h
> @@ -7,6 +7,7 @@
>   #define __ARCH_ARM_KERNEL_H__
>   
>   #include <xen/device_tree.h>
> +#include <asm/domain.h>
>   #include <asm/setup.h>
>   
>   /*

-- 
Julien Grall

