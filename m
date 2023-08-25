Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25627788F41
	for <lists+xen-devel@lfdr.de>; Fri, 25 Aug 2023 21:30:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.590989.923366 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZcUv-0004Dg-3R; Fri, 25 Aug 2023 19:29:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 590989.923366; Fri, 25 Aug 2023 19:29:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZcUv-0004B3-0r; Fri, 25 Aug 2023 19:29:33 +0000
Received: by outflank-mailman (input) for mailman id 590989;
 Fri, 25 Aug 2023 19:29:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bmKO=EK=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qZcUu-0004Ax-Cn
 for xen-devel@lists.xenproject.org; Fri, 25 Aug 2023 19:29:32 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b65edd3d-437d-11ee-8783-cb3800f73035;
 Fri, 25 Aug 2023 21:29:31 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E96C4632D1;
 Fri, 25 Aug 2023 19:29:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAB29C433C7;
 Fri, 25 Aug 2023 19:29:27 +0000 (UTC)
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
X-Inumbo-ID: b65edd3d-437d-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692991769;
	bh=9RtSLDNlElR7PXfB5tfoae8x9KpviYuLGYWC0rmRJuc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=DMM6CKKreU8t85WDNf1GU8UarftvnqbAbb0siIKw8e0BlPUYI7YunzExaknf2yyL0
	 7h5grbm1ogWp1XmYx0RiyVu3/VdGlCzLCDfUgNcHedhcIQbmerhFt6bcpkmGJGuM/p
	 Myyb3KG75bLC6/hMTAsePoBRBaSMuMZ9lQ5qx0T54CxOlcEEbWsFjb8TUAAzoKgWsx
	 x0fJfKnOdZwGwYnmdwImylLpRCa40YVP2l/7toWKepD3jA5RA2PLtpD44XqoWy6dra
	 Il010dsuNbJFFACMjglIOSPoabghrdV72n6hoArNrEvSlyHuczaUGGeYd3Zi9tuT+N
	 5WIKznctG/7wA==
Date: Fri, 25 Aug 2023 12:29:26 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Paul Durrant <paul@xen.org>
Subject: Re: [XEN PATCH] ioreq: include arch-specific ioreq header in
 <xen/ioreq.h>
In-Reply-To: <e5f13920dfcb9f828abb4a36dd410d342f4c0939.1692974235.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2308251229210.6458@ubuntu-linux-20-04-desktop>
References: <e5f13920dfcb9f828abb4a36dd410d342f4c0939.1692974235.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 25 Aug 2023, Nicola Vetrini wrote:
> The common header file for ioreq should include the arch-specific one.
> This also addresses violations of MISRA C:2012 Rule 8.4 caused by the missing
> inclusion of <asm/ioreq.h> in the arm implementation file.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> - The deleted includes are therefore no longer necessary, since
>  <xen/ioreq.h> is sufficient.
> - The functions (possibly) missing a visible declaration prior to their definition
>   currently are 'handle_ioserv' and 'try_fwd_ioserv'
> ---
>  xen/arch/arm/io.c       | 1 -
>  xen/common/ioreq.c      | 1 -
>  xen/include/xen/ioreq.h | 1 +
>  3 files changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
> index 96c740d5636c..13ae1fed5718 100644
> --- a/xen/arch/arm/io.c
> +++ b/xen/arch/arm/io.c
> @@ -14,7 +14,6 @@
>  #include <xen/sort.h>
>  #include <asm/cpuerrata.h>
>  #include <asm/current.h>
> -#include <asm/ioreq.h>
>  #include <asm/mmio.h>
>  #include <asm/traps.h>
> 
> diff --git a/xen/common/ioreq.c b/xen/common/ioreq.c
> index 7cb717f7a2a4..bde1a1f4eaa1 100644
> --- a/xen/common/ioreq.c
> +++ b/xen/common/ioreq.c
> @@ -28,7 +28,6 @@
>  #include <xen/trace.h>
> 
>  #include <asm/guest_atomics.h>
> -#include <asm/ioreq.h>
> 
>  #include <public/hvm/ioreq.h>
>  #include <public/hvm/params.h>
> diff --git a/xen/include/xen/ioreq.h b/xen/include/xen/ioreq.h
> index a26614d331e3..d85477c665e9 100644
> --- a/xen/include/xen/ioreq.h
> +++ b/xen/include/xen/ioreq.h
> @@ -20,6 +20,7 @@
>  #define __XEN_IOREQ_H__
> 
>  #include <xen/sched.h>
> +#include <asm/ioreq.h>
> 
>  #include <public/hvm/dm_op.h>
> 
> --
> 2.34.1
> 

