Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27D15AA642C
	for <lists+xen-devel@lfdr.de>; Thu,  1 May 2025 21:42:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.974306.1362199 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uAZnY-0006o7-4L; Thu, 01 May 2025 19:42:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 974306.1362199; Thu, 01 May 2025 19:42:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uAZnY-0006m8-0r; Thu, 01 May 2025 19:42:20 +0000
Received: by outflank-mailman (input) for mailman id 974306;
 Thu, 01 May 2025 19:42:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iHxF=XR=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uAZnW-0006m2-4S
 for xen-devel@lists.xenproject.org; Thu, 01 May 2025 19:42:18 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [2604:1380:45d1:ec00::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5e88e3b9-26c4-11f0-9ffb-bf95429c2676;
 Thu, 01 May 2025 21:42:10 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id C9AB7A4BDB8;
 Thu,  1 May 2025 19:36:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E837AC4CEE3;
 Thu,  1 May 2025 19:42:06 +0000 (UTC)
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
X-Inumbo-ID: 5e88e3b9-26c4-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746128528;
	bh=r+0nLVwiqjY7ZeI8RO7111m8zQPYbIfbRqC5qozYZPc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=FqoNy5zo6HYnIHJdfMU7bISgTj+xWVFfYsx82Z4lxHFXePnHtHzHt3O8uQi8Qvgw/
	 iDARlAceV7d6UP8wvAztsPeKmjiwIj3nPvCC9A9nrFs+9dzThT4y3mAT/gatPx33BQ
	 IbCJTUksKtrjXZea8/+O+cPIPrqN0nUHT82EzearwIctZNUjFnouFiPWa8oKmiFZJD
	 i7l1BpgUNn4QGFmod8hnMRMVObVmGuGn2p6K8MJwcg+CCTlOgrRZC3RbIwwS0k4dbi
	 t0xuRjj3SzzGGhh6Wg1Tvn8FrQDGvTZlEpVIQNFQMje+D19qc9szmGarSYUaX+KmDv
	 iQGGhWzIl0qdA==
Date: Thu, 1 May 2025 12:42:05 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    Jan Beulich <JBeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
    Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: Re: [PATCH v5 1/3] xen/mm: Introduce mm-types.h
In-Reply-To: <20250425112415.245585-2-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2505011242000.3879245@ubuntu-linux-20-04-desktop>
References: <20250425112415.245585-1-andrew.cooper3@citrix.com> <20250425112415.245585-2-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-338710888-1746128528=:3879245"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-338710888-1746128528=:3879245
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 25 Apr 2025, Andrew Cooper wrote:
> The type used for pagetable attributes/permissions is currently unsigned int,
> but needs to become architecture dependent as PPC needs unsigned long.
> 
> Introduce mm-types.h to house pte_attr_t.
> 
> Given the new toolchain baseline, we can use __has_include() now to remove the
> need for boilerplate on most architectures.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> CC: Bertrand Marquis <bertrand.marquis@arm.com>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> CC: Shawn Anastasio <sanastasio@raptorengineering.com>
> 
> __has_include() was one of the justifications for the new toolchain baseline,
> and is included in https://gitlab.com/xen-project/xen/-/issues/201
> ---
>  xen/include/xen/mm-types.h | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>  create mode 100644 xen/include/xen/mm-types.h
> 
> diff --git a/xen/include/xen/mm-types.h b/xen/include/xen/mm-types.h
> new file mode 100644
> index 000000000000..19f692e9aaa4
> --- /dev/null
> +++ b/xen/include/xen/mm-types.h
> @@ -0,0 +1,19 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef XEN_MM_TYPES_H
> +#define XEN_MM_TYPES_H
> +
> +/*
> + * Types used to abstract away architecture-specific details in the memory
> + * management code.
> + *
> + * Architectures need only provide their own asm/mm-types.h if they want to
> + * override the defaults given here.
> + */
> +#if __has_include(<asm/mm-types.h>)
> +# include <asm/mm-types.h>
> +#else /* !__has_include(<asm/mm-types.h>) */
> +
> +typedef unsigned int pte_attr_t;
> +
> +#endif /* !__has_include(<asm/mm-types.h>) */
> +#endif /* XEN_MM_TYPES_H */
> -- 
> 2.39.5
> 
--8323329-338710888-1746128528=:3879245--

