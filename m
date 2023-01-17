Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00BD566DA16
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jan 2023 10:35:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.479261.742998 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHiNU-0004lI-NT; Tue, 17 Jan 2023 09:35:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 479261.742998; Tue, 17 Jan 2023 09:35:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHiNU-0004iU-K4; Tue, 17 Jan 2023 09:35:36 +0000
Received: by outflank-mailman (input) for mailman id 479261;
 Tue, 17 Jan 2023 09:35:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pHiNT-0004iL-Fh
 for xen-devel@lists.xenproject.org; Tue, 17 Jan 2023 09:35:35 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pHiNT-0003QQ-4P; Tue, 17 Jan 2023 09:35:35 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.7.198]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pHiNS-0004yx-T3; Tue, 17 Jan 2023 09:35:35 +0000
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
	bh=WiGYDHYoXOW/AkCi5YR+2UmOE7AaFzIBgCMa3CWTVlo=; b=OZRnTo3/38ZvzzvH50WMzpSRk1
	nm6lpGPHwyxMEcWxzL3iAJkcbFQuZKb4OYPXZ74I2NYcyht1hbwy8MpjALZvZHBIqQ2+P3evZFS67
	98R6YUbF0ivQ7wA5NClmTPWcXvLabbqvLuObkpQLRJGVbgNVs2e5WOQaXbLCForCATr4=;
Message-ID: <72fd8c47-d654-91d0-993c-97f2d0542cff@xen.org>
Date: Tue, 17 Jan 2023 09:35:33 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH] xen/arm64: Fix incorrect DIRECTMAP_SIZE calculation
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230116144106.12544-1-michal.orzel@amd.com>
 <20230116144106.12544-2-michal.orzel@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230116144106.12544-2-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michal,

It is not clear to me why this was sent In-reply-to the other patch. If 
they are meant to form a series, then this should have a cover letter + 
each patch should be numbered.

If they are truly separate, then please don't thread them.

On 16/01/2023 14:41, Michal Orzel wrote:
> The direct mapped area occupies L0 slots from 256 to 265 (i.e. 10 slots),

I would write "265 included"  or similar so it shows why this is a problem.

> resulting in 5TB (512GB * 10) of virtual address space. However, due to
> incorrect slot subtraction (we take 9 slots into account) we set
> DIRECTMAP_SIZE to 4.5TB instead. Fix it.

I would clarify that we only support up to 2TB. So this is a latent 
issue. This would make clear that...

> 
> Fixes: 5263507b1b4a ("xen: arm: Use a direct mapping of RAM on arm64")

... while this is fixing a bug, it is not going to be a candidate for 
backport.

> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> ---
>   xen/arch/arm/include/asm/config.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/include/asm/config.h b/xen/arch/arm/include/asm/config.h
> index 0fefed1b8aa9..16213c8b677f 100644
> --- a/xen/arch/arm/include/asm/config.h
> +++ b/xen/arch/arm/include/asm/config.h
> @@ -157,7 +157,7 @@
>   #define FRAMETABLE_NR          (FRAMETABLE_SIZE / sizeof(*frame_table))
>   
>   #define DIRECTMAP_VIRT_START   SLOT0(256)
> -#define DIRECTMAP_SIZE         (SLOT0_ENTRY_SIZE * (265-256))
> +#define DIRECTMAP_SIZE         (SLOT0_ENTRY_SIZE * (266 - 256))
>   #define DIRECTMAP_VIRT_END     (DIRECTMAP_VIRT_START + DIRECTMAP_SIZE - 1)
>   
>   #define XENHEAP_VIRT_START     directmap_virt_start

Cheers,

-- 
Julien Grall

