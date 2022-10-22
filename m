Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B53D608CAA
	for <lists+xen-devel@lfdr.de>; Sat, 22 Oct 2022 13:29:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.428243.678214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omCgm-0006ys-Ny; Sat, 22 Oct 2022 11:29:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 428243.678214; Sat, 22 Oct 2022 11:29:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omCgm-0006x5-LH; Sat, 22 Oct 2022 11:29:16 +0000
Received: by outflank-mailman (input) for mailman id 428243;
 Sat, 22 Oct 2022 11:29:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1omCgl-0006wz-PX
 for xen-devel@lists.xenproject.org; Sat, 22 Oct 2022 11:29:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1omCgl-0001gs-Cj; Sat, 22 Oct 2022 11:29:15 +0000
Received: from home.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1omCgl-0000u9-6y; Sat, 22 Oct 2022 11:29:15 +0000
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
	bh=Uuz/7lKD86dTjwGh224ZTNJXIx9Q1aBDUaTErXakFZY=; b=yIzmBpi9wjuxdxSh8rPKfXnxGK
	ThDw76adtf4WDNa8HDEIABlyE2L8yar1WLDMAkzaQVncqc8dKZpxAWCr/XgIeUcF28pz8VFqS9ko4
	ubRaAqSJVi58cIaaNlo805gbRjcjq/BK2o/HnL+AhAHto0Apj9co2f4TpT5XRVBadydE=;
Message-ID: <d2a66788-be95-82bc-0c35-a168bf117d9a@xen.org>
Date: Sat, 22 Oct 2022 12:29:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.3
Subject: Re: [RFC PATCH v1 12/12] Arm: GICv3: Enable GICv3 for AArch32
To: Ayan Kumar Halder <ayankuma@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, Volodymyr_Babchuk@epam.com,
 bertrand.marquis@arm.com
References: <20221021153128.44226-1-ayankuma@amd.com>
 <20221021153128.44226-13-ayankuma@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20221021153128.44226-13-ayankuma@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 21/10/2022 16:31, Ayan Kumar Halder wrote:
> Refer ARM DDI 0487G.b ID072021,
> D13.2.86 -
> ID_PFR1_EL1, AArch32 Processor Feature Register 1
> 
> GIC, bits[31:28] == 0b0001 for GIC3.0 on Aarch32
> 
> One can now enable GICv3 on AArch32 systems.
> 
> Signed-off-by: Ayan Kumar Halder <ayankuma@amd.com>
> ---
>   xen/arch/arm/Kconfig                  | 2 +-
>   xen/arch/arm/include/asm/cpufeature.h | 1 +
>   2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index 1fe5faf847..5eaf21b8e0 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -41,7 +41,7 @@ config ARM_EFI
>   
>   config GICV3
>   	bool "GICv3 driver"
> -	depends on ARM_64 && !NEW_VGIC
> +	depends on (ARM_64 || ARM_32) && !NEW_VGIC

(ARM_64 || ARM_32) will always be true. So this can be dropped.

Furthermore, I wonder whether we should update SUPPORT.md with the 
support state for GICv3 on 32-bit. I would be fine if we already mark it 
as "supported, not security supported". But I am not sure about security 
supported until further testing.

Any opinions?

Cheers,

-- 
Julien Grall

