Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B556507DAF
	for <lists+xen-devel@lfdr.de>; Wed, 20 Apr 2022 02:40:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.308527.524303 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngyO6-0002jK-J9; Wed, 20 Apr 2022 00:40:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 308527.524303; Wed, 20 Apr 2022 00:40:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngyO6-0002i1-Fq; Wed, 20 Apr 2022 00:40:06 +0000
Received: by outflank-mailman (input) for mailman id 308527;
 Wed, 20 Apr 2022 00:40:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HBwa=U6=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ngyO5-0002dl-FI
 for xen-devel@lists.xenproject.org; Wed, 20 Apr 2022 00:40:05 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6afdcca8-c042-11ec-a405-831a346695d4;
 Wed, 20 Apr 2022 02:40:04 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2B6DF6133F;
 Wed, 20 Apr 2022 00:40:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0D76C385A7;
 Wed, 20 Apr 2022 00:40:01 +0000 (UTC)
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
X-Inumbo-ID: 6afdcca8-c042-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1650415202;
	bh=K2FBWb/8nE/lrSgzAocZDyO2NmBIVVu0RX2Sv80eftE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ON4tfGIgtNrqxAAAoaI2XD3TCWE3jaAADV9GnNhEk68rY38NhpLmRvYjTDo/Y2H3k
	 Wsy0dmK2LXspkv4+0w13Co8c5aTxD7em0joHaO6VQfYo8/7GRDKe2twpRcu5BN1vkk
	 ZgRxLR5WM00eaHwoN5QrIuYYAYP8OzGcdNPJSHbCo0iXN/rPRZMwxhZPPbH+EOaSf6
	 9YNqJKT9in5zv754tD+eV3lwDnO3c4/qpnnt5GiimPUvFfPPoA+AcZpsEoqaP1g7U1
	 jV6cy4eJyY8O30H5pcZnp6cnAhMVxWuBc50JpcY1Xt5yrT+iKsmuAZItPS2qqvKwSx
	 Eyn/1dpF6i1Yw==
Date: Tue, 19 Apr 2022 17:40:01 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
cc: sstabellini@kernel.org, julien@xen.org, Volodymyr_Babchuk@epam.com, 
    bertrand.marquis@arm.com, andrew.cooper3@citrix.com, 
    george.dunlap@citrix.com, jbeulich@suse.com, wl@xen.org, 
    xen-devel@lists.xenproject.org, van.freenix@gmail.com, 
    michal.orzel@arm.com, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH V6 0/2] xen/arm: add i.MX lpuart and i.MX8QM initial
 support
In-Reply-To: <20220419043927.23542-1-peng.fan@oss.nxp.com>
Message-ID: <alpine.DEB.2.22.394.2204191739460.915916@ubuntu-linux-20-04-desktop>
References: <20220419043927.23542-1-peng.fan@oss.nxp.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

I committed both patches, thanks!

On Tue, 19 Apr 2022, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> V6:
>  Fix a stale variable check per Stefano's comments.
> 
> V5:
>  Align code
>  drop early_uart_init
> 
> V4:
>  Wrong v3 version, some BIT definition are mixed in patch 1,2. 
> 
> V3:
>  Addressed Michal's comments.
>  Add Henry's T-b
> 
> V2:
>  Per Julien's comments, fix coding style issue, drop unneeded code
> 
> Add i.MX lpuart driver and i.MX8QM platform support.
>  - lpuart is the uart IP used in i.MX8QM/QXP/93.
>  - Very basic i.MX8QM platform support.
> 
> Peng Fan (2):
>   xen/arm: Add i.MX lpuart driver
>   xen/arm: Add i.MX lpuart early printk support
> 
>  xen/arch/arm/Kconfig.debug              |  14 ++
>  xen/arch/arm/arm64/debug-imx-lpuart.inc |  48 +++++
>  xen/arch/arm/include/asm/imx-lpuart.h   |  64 ++++++
>  xen/drivers/char/Kconfig                |   7 +
>  xen/drivers/char/Makefile               |   1 +
>  xen/drivers/char/imx-lpuart.c           | 275 ++++++++++++++++++++++++
>  6 files changed, 409 insertions(+)
>  create mode 100644 xen/arch/arm/arm64/debug-imx-lpuart.inc
>  create mode 100644 xen/arch/arm/include/asm/imx-lpuart.h
>  create mode 100644 xen/drivers/char/imx-lpuart.c
> 
> -- 
> 2.35.1
> 

