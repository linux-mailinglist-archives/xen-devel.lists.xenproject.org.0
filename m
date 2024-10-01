Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB2098B8D3
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2024 12:01:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807930.1219669 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svZhE-0002MP-22; Tue, 01 Oct 2024 10:01:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807930.1219669; Tue, 01 Oct 2024 10:01:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svZhD-0002Ku-Vh; Tue, 01 Oct 2024 10:01:31 +0000
Received: by outflank-mailman (input) for mailman id 807930;
 Tue, 01 Oct 2024 10:01:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1svZhC-0002Ko-0k
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2024 10:01:30 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1svZhB-0007yx-8L; Tue, 01 Oct 2024 10:01:29 +0000
Received: from [15.248.2.236] (helo=[10.24.67.28])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1svZhB-0000LB-2B; Tue, 01 Oct 2024 10:01:29 +0000
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
	bh=zlrRLOtlPJNj8d4BaX3pPVvL0/9TzwrxxVmjdq/GVi8=; b=Rt2oHciDRefw9pYAX6+nyeI4uw
	mw/k4JQQW5pn8SvF2TFHj5nxQ7xdZvh2fxpHQSOzHGfHy3zB5fdff6op+Vk/Nw21/2KJBFKS7kx7i
	oeeebUV9tE5DmC4vdXTbbODsouH5qEyhz3eMM2xJ0kP906e/T2ld32fBj4D0LvQFzD6c=;
Message-ID: <94dc1668-5215-424c-9dcb-1e343451d464@xen.org>
Date: Tue, 1 Oct 2024 11:01:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] xen/arm: platforms: Add NXP S32CC platform code
Content-Language: en-GB
To: "Andrei Cherechesu (OSS)" <andrei.cherechesu@oss.nxp.com>,
 xen-devel@lists.xenproject.org
Cc: S32@nxp.com, Andrei Cherechesu <andrei.cherechesu@nxp.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240930114715.642978-1-andrei.cherechesu@oss.nxp.com>
 <20240930114715.642978-6-andrei.cherechesu@oss.nxp.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240930114715.642978-6-andrei.cherechesu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Andrei,

On 30/09/2024 12:47, Andrei Cherechesu (OSS) wrote:
> From: Andrei Cherechesu <andrei.cherechesu@nxp.com>
> 
> Add code for NXP S32CC platforms (S32G2, S32G3, S32R45).
> 
> S32CC platforms use the NXP LINFlexD UART driver for
> console by default, and rely on Dom0 having access to
> SCMI services for system-level resources from firmware
> at EL3.
> 
> Platform-related quirks will be addressed in following
> commits.

I don't see any specific quirks in the series. Are you intended to send 
follow-up?

[...]

> diff --git a/xen/arch/arm/platforms/Makefile b/xen/arch/arm/platforms/Makefile
> index bec6e55d1f..2c304b964d 100644
> --- a/xen/arch/arm/platforms/Makefile
> +++ b/xen/arch/arm/platforms/Makefile
> @@ -10,5 +10,6 @@ obj-$(CONFIG_ALL64_PLAT) += thunderx.o
>   obj-$(CONFIG_ALL64_PLAT) += xgene-storm.o
>   obj-$(CONFIG_ALL64_PLAT) += brcm-raspberry-pi.o
>   obj-$(CONFIG_ALL64_PLAT) += imx8qm.o
> +obj-$(CONFIG_S32CC_PLATFORM)  += s32cc.o
>   obj-$(CONFIG_MPSOC_PLATFORM)  += xilinx-zynqmp.o
>   obj-$(CONFIG_MPSOC_PLATFORM)  += xilinx-zynqmp-eemi.o
> diff --git a/xen/arch/arm/platforms/s32cc.c b/xen/arch/arm/platforms/s32cc.c
> new file mode 100644
> index 0000000000..f99a2d56f6
> --- /dev/null
> +++ b/xen/arch/arm/platforms/s32cc.c

We only add a new platform if there are platform specific hook to 
implement. AFAICT, you don't implement any, so it should not be necessary.

Cheers,

-- 
Julien Grall


