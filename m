Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0AA87DE8E2
	for <lists+xen-devel@lfdr.de>; Thu,  2 Nov 2023 00:31:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626677.977160 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyKfs-0005Mp-Mo; Wed, 01 Nov 2023 23:31:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626677.977160; Wed, 01 Nov 2023 23:31:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyKfs-0005Ko-J9; Wed, 01 Nov 2023 23:31:00 +0000
Received: by outflank-mailman (input) for mailman id 626677;
 Wed, 01 Nov 2023 23:30:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r+92=GO=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qyKfr-0004vU-BK
 for xen-devel@lists.xenproject.org; Wed, 01 Nov 2023 23:30:59 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b60f73ae-790e-11ee-98d6-6d05b1d4d9a1;
 Thu, 02 Nov 2023 00:30:58 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 3E66FB81AD4;
 Wed,  1 Nov 2023 23:30:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DA2FC433C9;
 Wed,  1 Nov 2023 23:30:56 +0000 (UTC)
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
X-Inumbo-ID: b60f73ae-790e-11ee-98d6-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698881457;
	bh=JxUtRxESUN+aCwM4FjmhZNb0/hDgfR/VIt2KMA7rS1E=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=DP88gazjYIU5slexLf+BCn5Bm2j3gpXZFNWA0FG2TIxgYnb4g7AImjTvjCKL2HdWc
	 4y4xb+xlbuYKl+pA+K73cFmjbr9HZBYUy1E2UoHsB/dqu1gzvjEsLfS/oDmmzRzmbY
	 vuzMnkv2rJYXp0wqw3nHH+jicyHGtjFEIYMWGXUTUWPecZCl/k2GSXybMML7icJNMn
	 TH1fTmzm+D/lYDUYN0js7x89Bj0TLeIdoTpwvFOAlOl4WI6DRItNguJ36NJSGoNEa2
	 7LLJxAEHfqowxCdLuQA7C2r4bnWVR0fhMqXhHtzUhRVxBFJtreLAIkyLFCLr1htw0+
	 IJDrKD2lEKTSw==
Date: Wed, 1 Nov 2023 16:30:55 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Vikram Garhwal <vikram.garhwal@amd.com>
cc: qemu-devel@nongnu.org, sstabellini@kernel.org, 
    Peter Maydell <peter.maydell@linaro.org>, 
    Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, 
    "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>, 
    "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
Subject: Re: [QEMU][PATCH v1] Xen: Fix xen_set_irq() and
 xendevicemodel_set_irq_level()
In-Reply-To: <20231101210724.27263-1-vikram.garhwal@amd.com>
Message-ID: <alpine.DEB.2.22.394.2311011630390.2125691@ubuntu-linux-20-04-desktop>
References: <20231101210724.27263-1-vikram.garhwal@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 1 Nov 2023, Vikram Garhwal wrote:
> Remove '=' from 'if CONFIG_XEN_CTRL_INTERFACE_VERSION <= 41500'.
> Because xendevicemodel_set_irq_level() was introduced in 4.15 version.
> 
> Also, update xendevicemodel_set_irq_level() to return -1 for older versions.
> 
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  hw/arm/xen_arm.c            | 4 +++-
>  include/hw/xen/xen_native.h | 4 ++--
>  2 files changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/arm/xen_arm.c b/hw/arm/xen_arm.c
> index f83b983ec5..a5631529d0 100644
> --- a/hw/arm/xen_arm.c
> +++ b/hw/arm/xen_arm.c
> @@ -75,7 +75,9 @@ static MemoryRegion ram_lo, ram_hi;
>  
>  static void xen_set_irq(void *opaque, int irq, int level)
>  {
> -    xendevicemodel_set_irq_level(xen_dmod, xen_domid, irq, level);
> +    if (xendevicemodel_set_irq_level(xen_dmod, xen_domid, irq, level)) {
> +        error_report("xendevicemodel_set_irq_level failed");
> +    }
>  }
>  
>  static void xen_create_virtio_mmio_devices(XenArmState *xam)
> diff --git a/include/hw/xen/xen_native.h b/include/hw/xen/xen_native.h
> index 5d2718261f..6f09c48823 100644
> --- a/include/hw/xen/xen_native.h
> +++ b/include/hw/xen/xen_native.h
> @@ -523,12 +523,12 @@ static inline int xen_set_ioreq_server_state(domid_t dom,
>                                                   enable);
>  }
>  
> -#if CONFIG_XEN_CTRL_INTERFACE_VERSION <= 41500
> +#if CONFIG_XEN_CTRL_INTERFACE_VERSION < 41500
>  static inline int xendevicemodel_set_irq_level(xendevicemodel_handle *dmod,
>                                                 domid_t domid, uint32_t irq,
>                                                 unsigned int level)
>  {
> -    return 0;
> +    return -1;
>  }
>  #endif
>  
> -- 
> 2.17.1
> 

