Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E02229C10CA
	for <lists+xen-devel@lfdr.de>; Thu,  7 Nov 2024 22:14:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.832201.1247620 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t99q0-0005zY-1S; Thu, 07 Nov 2024 21:14:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 832201.1247620; Thu, 07 Nov 2024 21:14:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t99pz-0005ws-UU; Thu, 07 Nov 2024 21:14:43 +0000
Received: by outflank-mailman (input) for mailman id 832201;
 Thu, 07 Nov 2024 21:14:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SZQb=SC=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1t99py-0005wm-L1
 for xen-devel@lists.xenproject.org; Thu, 07 Nov 2024 21:14:42 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4b8bf42d-9d4d-11ef-99a3-01e77a169b0f;
 Thu, 07 Nov 2024 22:14:38 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 712065C5521;
 Thu,  7 Nov 2024 21:13:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2610C4CECC;
 Thu,  7 Nov 2024 21:14:35 +0000 (UTC)
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
X-Inumbo-ID: 4b8bf42d-9d4d-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEzOS4xNzguODQuMjE3IiwiaGVsbyI6ImRmdy5zb3VyY2Uua2VybmVsLm9yZyJ9
X-Custom-Transaction: eyJpZCI6IjRiOGJmNDJkLTlkNGQtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxMDE0MDc4LjgzMTgxMSwic2VuZGVyIjoic3N0YWJlbGxpbmlAa2VybmVsLm9yZyIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731014076;
	bh=P1Cjaso0pOHFUI2MWF9X+186mJwk2hxlWv2q0XCwlH8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=A1s60jPKxP1Tm15qwex9InrMzpGkukwcHaOiCbc8FfafNlw7i/0ig2w0AKZNj650o
	 nv014vzCjK/KZ/qWUqZWiisTvgPpy4DC0WXsfmKMVPsjG+pLos27WDncQ3XZxsoQqb
	 bf4Nlezgt4DSqi2p67wPCroQNkiV2qf718vbLA6naQFmTYxDaIY7A6saFrIRXOMj1e
	 WDL4XBmq8lCfHedWTF6229CjW1Vvrqx/fQJvwKIHwxpf3qslFGldI8ENKCGOJ4SvBx
	 vzbh2OTSPPpUUzc2K0JzOWXygRLzr8ZqZMlkV7XTQymCmm2MwGPGepkGDQVRD3+v10
	 5cKPvw4AxaaRw==
Date: Thu, 7 Nov 2024 13:14:34 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: gragst.linux@gmail.com
cc: xen-devel@lists.xenproject.org, 
    Grygorii Strashko <grygorii_strashko@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Mykyta Poturai <Mykyta_Poturai@epam.com>, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: Re: [PATCH] iommu/ipmmu-vmsa: Add Renesas R8A779G0 (R-Car V4H)
 support
In-Reply-To: <20241107132501.724836-1-grygorii_strashko@epam.com>
Message-ID: <alpine.DEB.2.22.394.2411071314270.89051@ubuntu-linux-20-04-desktop>
References: <20241107132501.724836-1-grygorii_strashko@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 7 Nov 2024, gragst.linux@gmail.com wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> Add Renesas R8A779G0 (R-Car V4H) IPMMU support.
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>

Assuming it was properly tested:

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/drivers/passthrough/arm/ipmmu-vmsa.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/xen/drivers/passthrough/arm/ipmmu-vmsa.c b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
> index da011413c5c0..d828d9cf6afd 100644
> --- a/xen/drivers/passthrough/arm/ipmmu-vmsa.c
> +++ b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
> @@ -788,6 +788,7 @@ static void ipmmu_device_reset(struct ipmmu_vmsa_device *mmu)
>  #define RCAR_PRODUCT_M3W     0x00005200
>  #define RCAR_PRODUCT_M3N     0x00005500
>  #define RCAR_PRODUCT_S4      0x00005A00
> +#define RCAR_PRODUCT_V4H     0x00005C00
>  #define RCAR_CUT_MASK        0x000000FF
>  #define RCAR_CUT_VER30       0x00000020
>  
> @@ -836,6 +837,7 @@ static __init bool ipmmu_stage2_supported(void)
>          break;
>  
>      case RCAR_PRODUCT_S4:
> +    case RCAR_PRODUCT_V4H:
>          stage2_supported = true;
>          break;
>  
> @@ -871,6 +873,10 @@ static const struct dt_device_match ipmmu_dt_match[] __initconst =
>          .compatible = "renesas,ipmmu-r8a779f0",
>          .data = &ipmmu_features_rcar_gen4,
>      },
> +    {
> +        .compatible = "renesas,ipmmu-r8a779g0",
> +        .data = &ipmmu_features_rcar_gen4,
> +    },
>      { /* sentinel */ },
>  };
>  
> -- 
> 2.34.1
> 
> 

