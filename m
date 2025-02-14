Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D9DA368E6
	for <lists+xen-devel@lfdr.de>; Sat, 15 Feb 2025 00:05:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.889129.1298351 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tj4jV-0004QR-7H; Fri, 14 Feb 2025 23:04:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 889129.1298351; Fri, 14 Feb 2025 23:04:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tj4jV-0004OL-3l; Fri, 14 Feb 2025 23:04:29 +0000
Received: by outflank-mailman (input) for mailman id 889129;
 Fri, 14 Feb 2025 23:04:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=83Ve=VF=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tj4jT-0004Nq-Ng
 for xen-devel@lists.xenproject.org; Fri, 14 Feb 2025 23:04:27 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 08ccad1c-eb28-11ef-9aa4-95dc52dad729;
 Sat, 15 Feb 2025 00:04:26 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B51A65C5DF2;
 Fri, 14 Feb 2025 23:03:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72E90C4CED1;
 Fri, 14 Feb 2025 23:04:22 +0000 (UTC)
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
X-Inumbo-ID: 08ccad1c-eb28-11ef-9aa4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739574263;
	bh=hNMi7wMgSXfOTSF82stAAOetMr5QEw5TN9oPwEH9gz8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Rv6mzaTEnuSIxvRL/GkJFwBPEDd9gXUeSpal3kc8fL04TtDhg9p7EWdLUn8oFkrXl
	 YXjSKgk0Knxhpl4sQKo7NY3/Aihtyh8azspipvRCztcV7j+3kFkLYInO4/KMyYBqp0
	 9diK8ZjuBWdojcKPxVMveEzj9++Ga4mkH5gJMiTtV58J1DsXS7i8w13ojB+i4BDgit
	 ACDOcUUbdHlMAKfYcU5xOET18B0IDNAz70Q0lx8xnlzDaYaVeYte5YKTHP/LP+ALJb
	 uWXQlLkZ8f9e/yLUZ5CG0Usg8aHcBtgvnDXntwJQHBZoem0wLXEcWACKsyrypMNBDd
	 e+AhScnEwj87Q==
Date: Fri, 14 Feb 2025 15:04:20 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [XEN PATCH 1/3] xen/arm: platform: address violation of MISRA
 C Rule 7.2
In-Reply-To: <33f3ba81af293a92fb27d55b42e620b807f1a5b3.1739564781.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2502141301020.3858257@ubuntu-linux-20-04-desktop>
References: <cover.1739564781.git.nicola.vetrini@bugseng.com> <33f3ba81af293a92fb27d55b42e620b807f1a5b3.1739564781.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 14 Feb 2025, Nicola Vetrini wrote:
> Rule 7.2 states: "A u or U suffix shall be applied to all integer
> constants that are represented in an unsigned type".
> 
> Some PM_* constants are unsigned quantities, despite some
> of them being representable in a signed type, so a 'U' suffix
> should be present.
> 
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> This fix is needed in order to keep the rule clean when the
> Xen configuration under static analysis is changed later in patch 3
> of this series.
> 
> Only PM_RSTC_WRCFG_CLR is strictly needed to conform to the rule,
> but the other constants have a 'U' added for consistency. PM_RSTC
> and PM_WDOG are used as offsets, so in principle they can be negative,
> therefore they are left as is.
> ---
>  xen/arch/arm/platforms/brcm-raspberry-pi.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/arm/platforms/brcm-raspberry-pi.c b/xen/arch/arm/platforms/brcm-raspberry-pi.c
> index 407ec07f63b8..d49460329cc8 100644
> --- a/xen/arch/arm/platforms/brcm-raspberry-pi.c
> +++ b/xen/arch/arm/platforms/brcm-raspberry-pi.c
> @@ -47,11 +47,11 @@ static const struct dt_device_match rpi4_blacklist_dev[] __initconst =
>  };
>  
>  
> -#define PM_PASSWORD                 0x5a000000
> +#define PM_PASSWORD                 0x5a000000U
>  #define PM_RSTC                     0x1c
>  #define PM_WDOG                     0x24
> -#define PM_RSTC_WRCFG_FULL_RESET    0x00000020
> -#define PM_RSTC_WRCFG_CLR           0xffffffcf
> +#define PM_RSTC_WRCFG_FULL_RESET    0x00000020U
> +#define PM_RSTC_WRCFG_CLR           0xffffffcfU
>  
>  static void __iomem *rpi4_map_watchdog(void)
>  {
> -- 
> 2.43.0
> 

