Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C57D7AB6002
	for <lists+xen-devel@lfdr.de>; Wed, 14 May 2025 02:03:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.983645.1369873 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEzau-0004UT-I9; Wed, 14 May 2025 00:03:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 983645.1369873; Wed, 14 May 2025 00:03:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEzau-0004Sf-FR; Wed, 14 May 2025 00:03:32 +0000
Received: by outflank-mailman (input) for mailman id 983645;
 Wed, 14 May 2025 00:03:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eXN3=X6=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uEzas-0004SY-Ac
 for xen-devel@lists.xenproject.org; Wed, 14 May 2025 00:03:30 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dcb41393-3056-11f0-9eb6-5ba50f476ded;
 Wed, 14 May 2025 02:03:28 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 592015C4A49;
 Wed, 14 May 2025 00:01:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFE4EC4CEE4;
 Wed, 14 May 2025 00:03:24 +0000 (UTC)
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
X-Inumbo-ID: dcb41393-3056-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747181006;
	bh=V9r0H4FFmFHRbUIuzb5awbyVY/AV8w/CNxahp6ppDzw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=cak51oBcWts0nQZvhmBIFOTpaWUvxUBJUukktKF/Pke+GX7qiEBMl9OtrF26/jE3T
	 xxH0V9yTBAa6HjEtyvj0+SDps7B82kg1+pbxHUStpgQ0RfvA3CyRtjZ2XMZvSz6jIg
	 TaSBywL2pzpArbM25+PQrp0oPQKd5i9JSv1eKgelZPG/nq2A0BbraLlFWMA/eZKOvj
	 aQ71KQx9MjcBGTxhJMksqsGBGLMtF+Haky1ODud96RoOZVx9HacHLPEqUiBdIt3FY/
	 r59yBQV6f9KD83wbK+Lprqyd8gYrEaDCRaiZVEuE/yYhR0pl5RyWwYx4KMvOtBuqiR
	 qra2z5ZoKrqvw==
Date: Tue, 13 May 2025 17:03:23 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
    xen-devel@lists.xenproject.org, Anthony PERARD <anthony@xenproject.org>, 
    David Woodhouse <dwmw@amazon.co.uk>, 
    "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>, 
    Pierrick Bouvier <pierrick.bouvier@linaro.org>, 
    Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] hw/xen/arch_hvm: Unify x86 and ARM variants
In-Reply-To: <20250513171737.74386-1-philmd@linaro.org>
Message-ID: <alpine.DEB.2.22.394.2505131703140.368682@ubuntu-linux-20-04-desktop>
References: <20250513171737.74386-1-philmd@linaro.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-946740503-1747181006=:368682"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-946740503-1747181006=:368682
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 13 May 2025, Philippe Mathieu-Daudé wrote:
> As each target declares the same prototypes, we can
> use a single header, removing the TARGET_XXX uses.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  include/hw/arm/xen_arch_hvm.h  |  9 ---------
>  include/hw/i386/xen_arch_hvm.h | 11 -----------
>  include/hw/xen/arch_hvm.h      | 14 ++++++++++----
>  hw/arm/xen-pvh.c               |  1 -
>  4 files changed, 10 insertions(+), 25 deletions(-)
>  delete mode 100644 include/hw/arm/xen_arch_hvm.h
>  delete mode 100644 include/hw/i386/xen_arch_hvm.h
> 
> diff --git a/include/hw/arm/xen_arch_hvm.h b/include/hw/arm/xen_arch_hvm.h
> deleted file mode 100644
> index 8fd645e7232..00000000000
> --- a/include/hw/arm/xen_arch_hvm.h
> +++ /dev/null
> @@ -1,9 +0,0 @@
> -#ifndef HW_XEN_ARCH_ARM_HVM_H
> -#define HW_XEN_ARCH_ARM_HVM_H
> -
> -#include <xen/hvm/ioreq.h>
> -void arch_handle_ioreq(XenIOState *state, ioreq_t *req);
> -void arch_xen_set_memory(XenIOState *state,
> -                         MemoryRegionSection *section,
> -                         bool add);
> -#endif
> diff --git a/include/hw/i386/xen_arch_hvm.h b/include/hw/i386/xen_arch_hvm.h
> deleted file mode 100644
> index 1000f8f5433..00000000000
> --- a/include/hw/i386/xen_arch_hvm.h
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -#ifndef HW_XEN_ARCH_I386_HVM_H
> -#define HW_XEN_ARCH_I386_HVM_H
> -
> -#include <xen/hvm/ioreq.h>
> -#include "hw/xen/xen-hvm-common.h"
> -
> -void arch_handle_ioreq(XenIOState *state, ioreq_t *req);
> -void arch_xen_set_memory(XenIOState *state,
> -                         MemoryRegionSection *section,
> -                         bool add);
> -#endif
> diff --git a/include/hw/xen/arch_hvm.h b/include/hw/xen/arch_hvm.h
> index df39c819c8f..8bacaa4ec41 100644
> --- a/include/hw/xen/arch_hvm.h
> +++ b/include/hw/xen/arch_hvm.h
> @@ -1,5 +1,11 @@
> -#if defined(TARGET_I386) || defined(TARGET_X86_64)
> -#include "hw/i386/xen_arch_hvm.h"
> -#elif defined(TARGET_ARM) || defined(TARGET_AARCH64)
> -#include "hw/arm/xen_arch_hvm.h"
> +#ifndef HW_XEN_ARCH_HVM_H
> +#define HW_XEN_ARCH_HVM_H
> +
> +#include <xen/hvm/ioreq.h>
> +#include "hw/xen/xen-hvm-common.h"
> +
> +void arch_handle_ioreq(XenIOState *state, ioreq_t *req);
> +void arch_xen_set_memory(XenIOState *state,
> +                         MemoryRegionSection *section,
> +                         bool add);
>  #endif
> diff --git a/hw/arm/xen-pvh.c b/hw/arm/xen-pvh.c
> index 4b26bcff7a5..1a9eeb01c8e 100644
> --- a/hw/arm/xen-pvh.c
> +++ b/hw/arm/xen-pvh.c
> @@ -10,7 +10,6 @@
>  #include "hw/boards.h"
>  #include "system/system.h"
>  #include "hw/xen/xen-pvh-common.h"
> -#include "hw/xen/arch_hvm.h"
>  
>  #define TYPE_XEN_ARM  MACHINE_TYPE_NAME("xenpvh")
>  
> -- 
> 2.47.1
> 
--8323329-946740503-1747181006=:368682--

