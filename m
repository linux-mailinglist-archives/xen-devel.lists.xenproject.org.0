Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A65D1A94092
	for <lists+xen-devel@lfdr.de>; Sat, 19 Apr 2025 02:20:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.959691.1351996 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5vwF-0001jS-VP; Sat, 19 Apr 2025 00:20:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 959691.1351996; Sat, 19 Apr 2025 00:20:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5vwF-0001hB-SE; Sat, 19 Apr 2025 00:20:07 +0000
Received: by outflank-mailman (input) for mailman id 959691;
 Sat, 19 Apr 2025 00:20:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HXfy=XF=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1u5vwE-0001aw-BE
 for xen-devel@lists.xenproject.org; Sat, 19 Apr 2025 00:20:06 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org
 [2600:3c04:e001:324:0:1991:8:25])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 080c16a3-1cb4-11f0-9ffb-bf95429c2676;
 Sat, 19 Apr 2025 02:20:01 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 05E7D61120;
 Sat, 19 Apr 2025 00:19:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 423F3C4CEE2;
 Sat, 19 Apr 2025 00:19:58 +0000 (UTC)
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
X-Inumbo-ID: 080c16a3-1cb4-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745021999;
	bh=Tw/siFa4rXSNEcpwNLN669MNuIrJ/+ftvPQ8zajRmaU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ccXnzgD9msVXl4573i69O18o/6XUEAjfX8c7QPUoFMF2xaKAiSp2dTvQZeLPIEpgo
	 +RAfRE+/C+AWjj7FvL0zIbm/qqYyS5A1/EbE+5qfFTd7yKWFM5rkwvpVAXP6yxCQcW
	 psC0N/kgERuJG0hldb+ERSlviNKyscl0fsZuIksnYbr7U2gtqldIZwpKUmIkibPr+S
	 noL7aAwR0BML/4IkK7IhLswSyZtGZ/oZjPrUwCg4KJ2wAugsyByTmm5N312hGUpikP
	 HeYxp1L0IBNRU9nLupdkaYMPEZ315NIvDW86KXSGPDRbz7SvNm4G5V85HThWI934jK
	 zMYv7cPa/7uJQ==
Date: Fri, 18 Apr 2025 17:19:57 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 1/4] xen/arm: allow PCI host bridge to have private
 data
In-Reply-To: <d2e51d90af19a790126e0483f2d1becbfdae2a30.1744203405.git.mykyta_poturai@epam.com>
Message-ID: <alpine.DEB.2.22.394.2504181648510.785180@ubuntu-linux-20-04-desktop>
References: <cover.1744203405.git.mykyta_poturai@epam.com> <d2e51d90af19a790126e0483f2d1becbfdae2a30.1744203405.git.mykyta_poturai@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 9 Apr 2025, Mykyta Poturai wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> Some of the PCI host bridges require private data. Add priv field
> to struct pci_host_bridge, so such bridges may populate it with
> their private data.
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> v2->v3:
> * removed priv allocation from common code
> 
> v1->v2:
> * no change
> ---
>  xen/arch/arm/include/asm/pci.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/xen/arch/arm/include/asm/pci.h b/xen/arch/arm/include/asm/pci.h
> index 7f77226c9b..a87672d834 100644
> --- a/xen/arch/arm/include/asm/pci.h
> +++ b/xen/arch/arm/include/asm/pci.h
> @@ -66,6 +66,7 @@ struct pci_host_bridge {
>      uint16_t segment;                /* Segment number */
>      struct pci_config_window* cfg;   /* Pointer to the bridge config window */
>      const struct pci_ops *ops;
> +    void *priv;                      /* Private data of the bridge. */
>  };
>  
>  struct pci_ops {
> -- 
> 2.34.1
> 

