Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C8B6C85AD6
	for <lists+xen-devel@lfdr.de>; Tue, 25 Nov 2025 16:09:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1172010.1497082 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNufn-0002r6-CS; Tue, 25 Nov 2025 15:09:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1172010.1497082; Tue, 25 Nov 2025 15:09:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNufn-0002oP-8t; Tue, 25 Nov 2025 15:09:43 +0000
Received: by outflank-mailman (input) for mailman id 1172010;
 Tue, 25 Nov 2025 15:09:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1vNufm-0002oH-AU
 for xen-devel@lists.xenproject.org; Tue, 25 Nov 2025 15:09:42 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1vNufl-007nt0-2D;
 Tue, 25 Nov 2025 15:09:41 +0000
Received: from [15.248.2.27] (helo=[10.24.67.127])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1vNufl-00BjcS-0w;
 Tue, 25 Nov 2025 15:09:41 +0000
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
	bh=26SAgevL8X3ZsDTXmeDgC2TAh+GbOJk+0MEyAXpGWVk=; b=s0sJBGxRToMhd4x7sgvLlei5Bz
	FDxU8dDYktYTYmDW+w7hwuS7RXQivFL/uaPyvGDd8Q2cB/HRbRbKWe997OP94wdBvvUcCygTERJ16
	3R45BUpIXNzTeo4GAHDy4nuKdTXfgmgQ+l8xw+UKYcI95z2xbj3g4PsIjzEXbwvq7/KY=;
Message-ID: <c08baef4-dac6-4abf-ab49-6c06266025f3@xen.org>
Date: Tue, 25 Nov 2025 15:09:39 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] vgic-v3: Ignore writes to
 GICD_ISACTIVER{nE}..GICD_ISACTIVER{nE}N
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20251125120308.65981-1-michal.orzel@amd.com>
Content-Language: en-US
From: Julien Grall <julien@xen.org>
In-Reply-To: <20251125120308.65981-1-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 25/11/2025 12:03, Michal Orzel wrote:
> Similar to other registers like ICPENDR and ICACTIVER, ignore the writes
> instead of injecting fault into the guest and thus crashing it.

Sure... But you are potentially introducing an instability in the guest 
OS which may be difficult to diagnose. So why is it better?

> This was
> already the case for extended registers prior to introducing GICV3_ESPI.

Why only the vGICv3?

> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> ---
>   xen/arch/arm/vgic-v3.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
> index 8b1c8eef8024..33dfd13dccf1 100644
> --- a/xen/arch/arm/vgic-v3.c
> +++ b/xen/arch/arm/vgic-v3.c
> @@ -887,7 +887,8 @@ static int __vgic_v3_distr_common_mmio_write(const char *name, struct vcpu *v,
>               printk(XENLOG_G_ERR
>                      "%pv: %s: unhandled word write %#"PRIregister" to ISACTIVER%dE\n",
>                      v, name, r, reg - GICD_ISACTIVERnE);
> -        return 0;
> +
> +        goto write_ignore;

I know we already use that for ICACTIVER. But this is against the 
specification. We can't just ignore a guest asking to activate an interrupt.

The commit message really some details on why we want to do ignore the 
write (IOW is this impacting an OS) and what's the consequence to ignore 
the request?

>   
>       case VRANGE32(GICD_ICACTIVER, GICD_ICACTIVERN):
>       case VRANGE32(GICD_ICACTIVERnE, GICD_ICACTIVERnEN):

Cheers,

-- 
Julien Grall


