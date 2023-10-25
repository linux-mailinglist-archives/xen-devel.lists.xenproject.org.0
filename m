Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A38AA7D6902
	for <lists+xen-devel@lfdr.de>; Wed, 25 Oct 2023 12:40:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.622828.970017 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvbIl-0003NO-Iy; Wed, 25 Oct 2023 10:39:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 622828.970017; Wed, 25 Oct 2023 10:39:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvbIl-0003Lj-GC; Wed, 25 Oct 2023 10:39:51 +0000
Received: by outflank-mailman (input) for mailman id 622828;
 Wed, 25 Oct 2023 10:39:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qvbIj-0003Lc-IY
 for xen-devel@lists.xenproject.org; Wed, 25 Oct 2023 10:39:49 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qvbIi-0006If-TT; Wed, 25 Oct 2023 10:39:48 +0000
Received: from [15.248.3.4] (helo=[10.24.67.28])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qvbIi-0007Ne-Nw; Wed, 25 Oct 2023 10:39:48 +0000
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
	bh=W78P4MyRTFC7b6CXC2Kz8bwCP90zRgPvt+jZM1SoPWI=; b=xBoXcavZSvT7uMc4bC2KYMelGg
	W3Bqo1zHRhM+N8HpZ0mNeYgEvv7/Nc4faHOXUyMkRR2I5GMMUB2W2zHzSji9JZOTrt/aL8+zp+Rej
	q/9+fued0+HQzkfI5SiJxOvV+/p8VQhyZHtlqJN3LxQ51ObKVyQHa+AcafulXfekKGPY=;
Message-ID: <3be9d891-4285-4d01-b5fd-fb88e2599ace@xen.org>
Date: Wed, 25 Oct 2023 11:39:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 1/4] arm/gicv3: Move guest dist base
Content-Language: en-GB
To: Mykyta Poturai <Mykyta_Poturai@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1698225630.git.mykyta_poturai@epam.com>
 <becf4d912d32b6888e040edd0fda4eece6cab66b.1698225630.git.mykyta_poturai@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <becf4d912d32b6888e040edd0fda4eece6cab66b.1698225630.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 25/10/2023 11:13, Mykyta Poturai wrote:
> New vgic code relies on lower address bits to calculate intid from > the address offset. 0x03001000 as DIST_BASE overlaps with
> VGIC_ADDR_IRQ_MASK when bits_per_irq >= 64, breaking the intid calculation.
> Move DIST_BASE to a safer location to fix this.

I am a bit confused, you are referring to vGICv3 in the title but the 
commit message is generic enough and vGICv2 already seem to use the 
macro. In fact, the value for the distributor base is actualy the same 
as GICv3. So is this a bug for GICv2 as well? If not, can you provide 
more details why?

Lastly, we can control the address for a guest but not for dom0. So 
wouldn't it be a problem for dom0 as well? This would mean the code 
needs to be fixed rather than the guest GICv3 distributor base changed.

Cheers,

> 
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> ---
>   xen/include/public/arch-arm.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
> index a25e87dbda..71fa25b1d4 100644
> --- a/xen/include/public/arch-arm.h
> +++ b/xen/include/public/arch-arm.h
> @@ -438,7 +438,7 @@ typedef uint64_t xen_callback_t;
>   #define GUEST_GICC_SIZE   xen_mk_ullong(0x00002000)
>   
>   /* vGIC v3 mappings */
> -#define GUEST_GICV3_GICD_BASE      xen_mk_ullong(0x03001000)
> +#define GUEST_GICV3_GICD_BASE      xen_mk_ullong(0x03000000)
>   #define GUEST_GICV3_GICD_SIZE      xen_mk_ullong(0x00010000)
>   
>   #define GUEST_GICV3_RDIST_REGIONS  1

-- 
Julien Grall

