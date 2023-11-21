Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 607F77F228B
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 01:51:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.637436.993244 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5EzE-0001oy-6A; Tue, 21 Nov 2023 00:51:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 637436.993244; Tue, 21 Nov 2023 00:51:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5EzE-0001nJ-3b; Tue, 21 Nov 2023 00:51:32 +0000
Received: by outflank-mailman (input) for mailman id 637436;
 Tue, 21 Nov 2023 00:51:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GQYN=HC=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r5EzC-0001n6-Q6
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 00:51:30 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1987ff32-8808-11ee-9b0e-b553b5be7939;
 Tue, 21 Nov 2023 01:51:28 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id D286DCE188B;
 Tue, 21 Nov 2023 00:51:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4AB9C433C9;
 Tue, 21 Nov 2023 00:51:20 +0000 (UTC)
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
X-Inumbo-ID: 1987ff32-8808-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700527882;
	bh=Jp9kvg7yqDWkDUb+4S5zgXlzx7j4xJatYG77YG4dAP0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=sSlSBKrVHtvCKQNx9b6DLGphpw+o7yG3E3jMFR2kHt1hNAPNG2hLtV82KAhvql3iN
	 si3grdvMsNR8AMJbyAnfFXS3WurOMCIiZNTjInXEAno7r8FuOBW07mVXcd431keIBX
	 TFqOa9nfQVsRsCvfi8KXLvNZmFWXmCONdLje2zalBCfVYj9GFU10f/p1b8N3/3cL3G
	 TMoeKiP54Etp2CuvcsuLi/WpefiYrhrLThMW36jYZyK2t0C/nqF30Fox6N2yAtCpqv
	 a0Z5ecv31j7p3mgVLOijaroadgd0IGoBwpR56Abc3HvpYq0+A46OalbF+beR9Qnpcc
	 KDLnGA4a85mOw==
Date: Mon, 20 Nov 2023 16:51:19 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Roberto Bagnara <roberto.bagnara@bugseng.com>, 
    Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: Re: [PATCH 5/6] arm/platforms: Make compatbile with
 -Wwrite-strings
In-Reply-To: <20231120224912.1421916-6-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2311201651110.773207@ubuntu-linux-20-04-desktop>
References: <20231120224912.1421916-1-andrew.cooper3@citrix.com> <20231120224912.1421916-6-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-2032218427-1700527882=:773207"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-2032218427-1700527882=:773207
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 20 Nov 2023, Andrew Cooper wrote:
> GCC complains:
> 
>   arch/arm/platforms/brcm.c: In function ‘brcm_populate_plat_regs’:
>   arch/arm/platforms/brcm.c:76:27: error: passing argument 1 of ‘brcm_get_dt_node’ discards ‘const’ qualifier from pointer target type [-Werror=discarded-qualifiers]
>      76 |     rc = brcm_get_dt_node("brcm,brcmstb-cpu-biu-ctrl", &node, &reg_base);
>         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> and
> 
>   arch/arm/platforms/exynos5.c: In function ‘exynos5_smp_init’:
>   arch/arm/platforms/exynos5.c:109:20: error: assignment discards ‘const’ qualifier from pointer target type [-Werror=discarded-qualifiers]
>     109 |         compatible = "samsung,exynos4210-sysram-ns";
>         |                    ^
> 
> In both cases, just make the relevant variable const.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> CC: Bertrand Marquis <bertrand.marquis@arm.com>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Roberto Bagnara <roberto.bagnara@bugseng.com>
> CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
>  xen/arch/arm/platforms/brcm.c    | 2 +-
>  xen/arch/arm/platforms/exynos5.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/arm/platforms/brcm.c b/xen/arch/arm/platforms/brcm.c
> index 951e4d6cc328..43a07ab1a69d 100644
> --- a/xen/arch/arm/platforms/brcm.c
> +++ b/xen/arch/arm/platforms/brcm.c
> @@ -35,7 +35,7 @@ static u32 brcm_boot_continuation_pc;
>  
>  static struct brcm_plat_regs regs;
>  
> -static __init int brcm_get_dt_node(char *compat_str,
> +static __init int brcm_get_dt_node(const char *compat_str,
>                                     const struct dt_device_node **dn,
>                                     u32 *reg_base)
>  {
> diff --git a/xen/arch/arm/platforms/exynos5.c b/xen/arch/arm/platforms/exynos5.c
> index c48093cd4fa4..f7c09520675e 100644
> --- a/xen/arch/arm/platforms/exynos5.c
> +++ b/xen/arch/arm/platforms/exynos5.c
> @@ -96,7 +96,7 @@ static int __init exynos5_smp_init(void)
>  {
>      struct dt_device_node *node;
>      void __iomem *sysram;
> -    char *compatible;
> +    const char *compatible;
>      paddr_t sysram_addr;
>      paddr_t size;
>      paddr_t sysram_offset;
> -- 
> 2.30.2
> 
> 
--8323329-2032218427-1700527882=:773207--

