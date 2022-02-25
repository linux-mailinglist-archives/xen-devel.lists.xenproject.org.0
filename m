Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A324C42D8
	for <lists+xen-devel@lfdr.de>; Fri, 25 Feb 2022 11:55:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.279009.476512 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNYFS-00044r-MZ; Fri, 25 Feb 2022 10:54:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 279009.476512; Fri, 25 Feb 2022 10:54:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNYFS-00042g-JA; Fri, 25 Feb 2022 10:54:54 +0000
Received: by outflank-mailman (input) for mailman id 279009;
 Fri, 25 Feb 2022 10:54:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nNYFQ-00042a-Ua
 for xen-devel@lists.xenproject.org; Fri, 25 Feb 2022 10:54:52 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nNYFQ-0007rf-Jr; Fri, 25 Feb 2022 10:54:52 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.31.13]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nNYFQ-0003oL-DO; Fri, 25 Feb 2022 10:54:52 +0000
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
	bh=hN/OdZMlyIiYeYqt31xWK6K82FZHnUbh9gI5ig+z7bg=; b=FDqO2JVbMw9DL1DGTV9SQ9p5BV
	ZHlbAwC5c3GHadTTpMOPLqKdrcd/y1cU3vFO2MKUSmk0QMbuINHMVRZdqD1NpN0YyLp09/u/CWLhZ
	bti6CjqBbNznLkn3MupI1N5vBFzkp+OQ2TCF4/E2sN3zBtvhYbka5Z//Oizi5dYgMxWQ=;
Message-ID: <dc161f7e-63c8-0e14-0c1f-51b1318aab2a@xen.org>
Date: Fri, 25 Feb 2022 10:54:50 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH] xen/arm: Avoid integer overflow using
 MIDR_IMPLEMENTOR_MASK
To: Michal Orzel <michal.orzel@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220225083854.6371-1-michal.orzel@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220225083854.6371-1-michal.orzel@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michal,

On 25/02/2022 08:38, Michal Orzel wrote:
> Value of macro MIDR_IMPLEMENTOR_MASK exceeds the range of integer
> and can lead to overflow. Currently there is no issue as it is used
> in an expression implicitly casted to u32 in MIDR_IS_CPU_MODEL_RANGE.
> To avoid possible problems, fix the macro.

Correct me if I am wrong, it sounds like this is only for hardening 
purpose at the moment.

As this code is coming from Linux, I would prefer if we first upstream 
to Linux and then port to Xen once merged.

> 
> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
> ---
>   xen/arch/arm/include/asm/processor.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/include/asm/processor.h b/xen/arch/arm/include/asm/processor.h
> index 8ab2940f68..149fae0d27 100644
> --- a/xen/arch/arm/include/asm/processor.h
> +++ b/xen/arch/arm/include/asm/processor.h
> @@ -39,7 +39,7 @@
>   #define MIDR_VARIANT(midr) \
>       (((midr) & MIDR_VARIANT_MASK) >> MIDR_VARIANT_SHIFT)
>   #define MIDR_IMPLEMENTOR_SHIFT  24
> -#define MIDR_IMPLEMENTOR_MASK   (0xff << MIDR_IMPLEMENTOR_SHIFT)
> +#define MIDR_IMPLEMENTOR_MASK   (0xffu << MIDR_IMPLEMENTOR_SHIFT)

NIT: We tend to use 0xffU.

>   #define MIDR_IMPLEMENTOR(midr) \
>       (((midr) & MIDR_IMPLEMENTOR_MASK) >> MIDR_IMPLEMENTOR_SHIFT)
>   

Cheers,

-- 
Julien Grall

