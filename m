Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CEC587C5C4
	for <lists+xen-devel@lfdr.de>; Fri, 15 Mar 2024 00:12:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693586.1081913 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkuFC-0007Lb-UK; Thu, 14 Mar 2024 23:12:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693586.1081913; Thu, 14 Mar 2024 23:12:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkuFC-0007IO-Rd; Thu, 14 Mar 2024 23:12:14 +0000
Received: by outflank-mailman (input) for mailman id 693586;
 Thu, 14 Mar 2024 23:12:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=69K2=KU=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rkuFB-0007II-Q0
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2024 23:12:13 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 489ac700-e258-11ee-a1ee-f123f15fe8a2;
 Fri, 15 Mar 2024 00:12:11 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 2DF3ACE098E;
 Thu, 14 Mar 2024 23:12:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FBE2C433F1;
 Thu, 14 Mar 2024 23:12:07 +0000 (UTC)
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
X-Inumbo-ID: 489ac700-e258-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710457928;
	bh=LMARwQlxMkZVBwCLM64CBOpXAaLcHbY5bm9BforpgYo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=KdCrPvxRqJTnkO4aGQIFJMzcP8sq3itDt2onCS3xt6NBu5NJFYPSNtjcsgDKWl8qb
	 TIe7SxouLdqGQ0OmsUOT2hjzjJS5vr1UDgBD3UVKSkq+FkS5WSoSL2P1z6CAdVCHpW
	 4M2gF/+0rFcWq7X0YPGNn07VrM1qZ40i+3olnKtNIEVxDobLvLATBKjffilM7f9wwy
	 N/zaybJarCYtqWK4a6cKEbuNc+gd8EUaoFJv0Qir6tj2oGHlUZePsMgnMLn3JonfeO
	 tnIlPyY0cU66Wai5BOgLx4XlQxp1Pi8ZJqxwvPbRkvmoS0KLQNFXqBSNj+FV1jM7cW
	 mR/iP0fkCX7LA==
Date: Thu, 14 Mar 2024 16:12:05 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Simone Ballarin <simone.ballarin@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    sstabellini@kernel.org, 
    Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>, 
    Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [XEN PATCH v3 11/16] xen/arm: address violations of MISRA C:2012
 Directive 4.10
In-Reply-To: <f72155cb1cc5d3bb09b7939df6170628c06cc1b7.1710145041.git.simone.ballarin@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2403141610580.853156@ubuntu-linux-20-04-desktop>
References: <cover.1710145041.git.simone.ballarin@bugseng.com> <f72155cb1cc5d3bb09b7939df6170628c06cc1b7.1710145041.git.simone.ballarin@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 11 Mar 2024, Simone Ballarin wrote:
> From: Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>
> 
> Add or modify inclusion guards to address violations of
> MISRA C:2012 Directive 4.10 ("Precautions shall be taken in order to
> prevent the contents of a header file being included more than once").
> Mechanical change.
> ---
> Commit introduced in v3
> 
> Signed-off-by: Maria Celeste Cesario  <maria.celeste.cesario@bugseng.com>
> Signed-off-by: Simone Ballarin  <simone.ballarin@bugseng.com>
> ---
>  xen/arch/arm/include/asm/domain.h      | 6 +++---
>  xen/arch/arm/include/asm/efibind.h     | 5 +++++
>  xen/arch/arm/include/asm/event.h       | 6 +++---
>  xen/arch/arm/include/asm/grant_table.h | 6 +++---
>  xen/arch/arm/include/asm/io.h          | 6 +++---
>  xen/arch/arm/include/asm/irq.h         | 6 +++---
>  xen/arch/arm/include/asm/smp.h         | 6 +++---
>  xen/arch/arm/include/asm/spinlock.h    | 6 +++---
>  xen/arch/arm/include/asm/system.h      | 6 +++---
>  9 files changed, 29 insertions(+), 24 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
> index 8218afb862..b7dc023a25 100644
> --- a/xen/arch/arm/include/asm/domain.h
> +++ b/xen/arch/arm/include/asm/domain.h
> @@ -1,5 +1,5 @@
> -#ifndef __ASM_DOMAIN_H__
> -#define __ASM_DOMAIN_H__
> +#ifndef ASM_ARM_DOMAIN_H
> +#define ASM_ARM_DOMAIN_H
>  
>  #include <xen/cache.h>
>  #include <xen/timer.h>
> @@ -312,7 +312,7 @@ static inline void update_guest_memory_policy(struct vcpu *v,
>                                                struct guest_memory_policy *gmp)
>  {}
>  
> -#endif /* __ASM_DOMAIN_H__ */
> +#endif /* ASM_ARM_DOMAIN_H */
>  
>  /*
>   * Local variables:
> diff --git a/xen/arch/arm/include/asm/efibind.h b/xen/arch/arm/include/asm/efibind.h
> index 09dca7a8c9..689bf63232 100644
> --- a/xen/arch/arm/include/asm/efibind.h
> +++ b/xen/arch/arm/include/asm/efibind.h
> @@ -1,2 +1,7 @@
> +#ifndef ASM_ARM_EFI_BIND_H

This should be ASM_ARM_EFIBIND_H ?

Everything else looks fine to me

