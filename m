Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9117F984F49
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 02:03:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.803404.1213953 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stFUX-0002uZ-4X; Wed, 25 Sep 2024 00:02:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 803404.1213953; Wed, 25 Sep 2024 00:02:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stFUX-0002sY-1q; Wed, 25 Sep 2024 00:02:49 +0000
Received: by outflank-mailman (input) for mailman id 803404;
 Wed, 25 Sep 2024 00:02:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nYkR=QX=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1stFUU-0002sR-Ow
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2024 00:02:46 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7cfd6203-7ad1-11ef-99a2-01e77a169b0f;
 Wed, 25 Sep 2024 02:02:44 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 147125C5618;
 Wed, 25 Sep 2024 00:02:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78C32C4CEC4;
 Wed, 25 Sep 2024 00:02:41 +0000 (UTC)
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
X-Inumbo-ID: 7cfd6203-7ad1-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727222562;
	bh=EQkk/BS5l871Oz8qM+JW3Di4qHt1xc6OOmW/TViTdsI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=MHWX8ry+ey7iVT1sci9wMqPkrEf3qWta2cgztwcaM5WdExcPWcwmZsFaOqvmx/Sg+
	 sH1USYsIp7ykh38vkhJHI3N/CpPl01T4bTZzFv4/IT6HVF217p8U4SV+hev7LD0RTT
	 KWa2bZZu5h5V+PW66hOrINlKNIoKBOxhsIFyNKEdBHhnX5kkkNGYndrfaVJSvKjt+h
	 7hpg2yKQ0FOdL462F81PIjhGpQeCpx7JnHm02jtxFoXSxMsaTzHsEcwBDW7oy2s0w+
	 nrDEc2h6C3kmFoH4yz7F9CsMSovUpEXES9SVQJGALaitYORAVBMEV+f4kmQNHQumir
	 1pDZq+38N99rQ==
Date: Tue, 24 Sep 2024 17:02:40 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org, 
    bertrand.marquis@arm.com, michal.orzel@amd.com, Volodymyr_Babchuk@epam.com, 
    dpsmith@apertussolutions.com, edgar.iglesias@amd.com
Subject: Re: [PATCH v1 5/6] xen/arm: io: Add a read-const writes-ignored mmio
 handler
In-Reply-To: <20240924162359.1390487-6-edgar.iglesias@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2409241702330.1417852@ubuntu-linux-20-04-desktop>
References: <20240924162359.1390487-1-edgar.iglesias@gmail.com> <20240924162359.1390487-6-edgar.iglesias@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 24 Sep 2024, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> 
> Add a read-const writes-ignored mmio handler. This is useful
> to for example register background regions that return a fixed
> value instead of raising data aborts.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/arch/arm/include/asm/mmio.h |  2 ++
>  xen/arch/arm/io.c               | 21 +++++++++++++++++++++
>  2 files changed, 23 insertions(+)
> 
> diff --git a/xen/arch/arm/include/asm/mmio.h b/xen/arch/arm/include/asm/mmio.h
> index 7da542cd79..605620a2f4 100644
> --- a/xen/arch/arm/include/asm/mmio.h
> +++ b/xen/arch/arm/include/asm/mmio.h
> @@ -82,6 +82,8 @@ struct vmmio {
>      struct mmio_handler *handlers;
>  };
>  
> +extern const struct mmio_handler_ops mmio_read_const_writes_ignored;
> +
>  enum io_state try_handle_mmio(struct cpu_user_regs *regs,
>                                mmio_info_t *info);
>  void register_mmio_bg_handler(struct domain *d,
> diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
> index 934a2ad2b9..8ab0435afc 100644
> --- a/xen/arch/arm/io.c
> +++ b/xen/arch/arm/io.c
> @@ -20,6 +20,27 @@
>  
>  #include "decode.h"
>  
> +/*
> + * Reusable mmio handler useful as background while waiting for IOREQ.
> + * Register with priv as default read value. Writes ignored.
> + */
> +static int bg_read(struct vcpu *v, mmio_info_t *info, register_t *r, void *priv)
> +{
> +    *r = (uintptr_t) priv;
> +    return 1;
> +}
> +
> +static int bg_write(struct vcpu *v, mmio_info_t *info, register_t r, void *priv)
> +{
> +    return 1;
> +}
> +
> +/* Read const value (from priv), writes ignored.  */
> +const struct mmio_handler_ops mmio_read_const_writes_ignored = {
> +    .read = bg_read,
> +    .write = bg_write,
> +};
> +
>  static enum io_state handle_read(const struct mmio_handler *handler,
>                                   struct vcpu *v,
>                                   mmio_info_t *info)
> -- 
> 2.43.0
> 

