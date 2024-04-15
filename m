Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D22EF8A4C78
	for <lists+xen-devel@lfdr.de>; Mon, 15 Apr 2024 12:26:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.706004.1102980 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwJX4-000852-83; Mon, 15 Apr 2024 10:25:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 706004.1102980; Mon, 15 Apr 2024 10:25:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwJX4-00082X-5F; Mon, 15 Apr 2024 10:25:50 +0000
Received: by outflank-mailman (input) for mailman id 706004;
 Mon, 15 Apr 2024 10:25:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rwJX2-00082R-Hr
 for xen-devel@lists.xenproject.org; Mon, 15 Apr 2024 10:25:48 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rwJWy-0001cb-6t; Mon, 15 Apr 2024 10:25:44 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.0.211])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rwJWy-0007Gf-0j; Mon, 15 Apr 2024 10:25:44 +0000
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
	bh=WHJyTHwAtf+xLJhvyxboFnh0UhYt5gbCNJOoN3IkTjc=; b=6g9Obcbo3VO0SJP+yi/PGwhZLj
	d6Q1Tmx3QoJ5u2zRJWzluIniOJQOiGYoOeoQuJNF+4gOITDhfL6sQMQFBrn3UbN0vfWPbLjwjdIlK
	J07G9zg0gCXvvYB/u9/rImhw43F7Vsim6WTI76VydVdyZucdpsafCKEHr3AmSHlIjb88=;
Message-ID: <084b9ed5-1585-4802-b504-6ccd2f262542@xen.org>
Date: Mon, 15 Apr 2024 11:25:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] xen/arm: Add imx8q{m,x} platform glue
Content-Language: en-GB
To: John Ernberg <john.ernberg@actia.se>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Peng Fan <peng.fan@nxp.com>, Jonas Blixt <jonas.blixt@actia.se>
References: <20240408161129.900347-1-john.ernberg@actia.se>
 <20240408161129.900347-2-john.ernberg@actia.se>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240408161129.900347-2-john.ernberg@actia.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi John,

I saw this patch was committed. I have one question this may require 
some adjustment.

On 08/04/2024 17:11, John Ernberg wrote:
> ---
>   xen/arch/arm/platforms/Makefile |   1 +
>   xen/arch/arm/platforms/imx8qm.c | 139 ++++++++++++++++++++++++++++++++
>   2 files changed, 140 insertions(+)
>   create mode 100644 xen/arch/arm/platforms/imx8qm.c
> 
> diff --git a/xen/arch/arm/platforms/Makefile b/xen/arch/arm/platforms/Makefile
> index 8632f4115f..bec6e55d1f 100644
> --- a/xen/arch/arm/platforms/Makefile
> +++ b/xen/arch/arm/platforms/Makefile
> @@ -9,5 +9,6 @@ obj-$(CONFIG_ALL_PLAT)   += sunxi.o
>   obj-$(CONFIG_ALL64_PLAT) += thunderx.o
>   obj-$(CONFIG_ALL64_PLAT) += xgene-storm.o
>   obj-$(CONFIG_ALL64_PLAT) += brcm-raspberry-pi.o
> +obj-$(CONFIG_ALL64_PLAT) += imx8qm.o
>   obj-$(CONFIG_MPSOC_PLATFORM)  += xilinx-zynqmp.o
>   obj-$(CONFIG_MPSOC_PLATFORM)  += xilinx-zynqmp-eemi.o
> diff --git a/xen/arch/arm/platforms/imx8qm.c b/xen/arch/arm/platforms/imx8qm.c
> new file mode 100644
> index 0000000000..3600a073e8
> --- /dev/null
> +++ b/xen/arch/arm/platforms/imx8qm.c
> @@ -0,0 +1,139 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */

The majority of Xen code is using GPL-2.0-only. In the early days for 
Xen on Arm we started to use GPLv2+ which I consider it was a mistake.
Unfortunately this started to spread as people copied/pasted the same 
copyright headers.

So can you confirm whether you intended to use GPL-2.0+? If not would 
you be able to send a patch to adjust it? (Better to it before there are 
more modifications).

Cheers,

-- 
Julien Grall

