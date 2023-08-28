Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB15D78BB06
	for <lists+xen-devel@lfdr.de>; Tue, 29 Aug 2023 00:30:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.591833.924364 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qakko-0003ZQ-E4; Mon, 28 Aug 2023 22:30:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 591833.924364; Mon, 28 Aug 2023 22:30:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qakko-0003WO-A4; Mon, 28 Aug 2023 22:30:38 +0000
Received: by outflank-mailman (input) for mailman id 591833;
 Mon, 28 Aug 2023 22:30:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yBR3=EN=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qakkn-0003WG-D1
 for xen-devel@lists.xenproject.org; Mon, 28 Aug 2023 22:30:37 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 80ea8f3b-45f2-11ee-9b0c-b553b5be7939;
 Tue, 29 Aug 2023 00:30:35 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EE28063965;
 Mon, 28 Aug 2023 22:30:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 474BFC433C8;
 Mon, 28 Aug 2023 22:30:32 +0000 (UTC)
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
X-Inumbo-ID: 80ea8f3b-45f2-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693261833;
	bh=/EgySM9jjYMoi1J7psnn0GYd8GnmAMuFzR6pFR4NZHE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=cb+uAzvsO+AJZr+G/SFVbJNA59Ij1Pmvk2F6O8QuU+bYrLxZFS8kQvv13qSTsL60D
	 pMLIls+0u13WF1TPsyOxTlJ3kCfx+FwXGoGl04nar9ezNkdn6wXk42HG34Q21VSlnX
	 P8inwkyQaaNyLyLmjPmOjlXDx997K+UwElqHjr5EkS3cduAm6mDXCZE+OKHYdLG8BM
	 rGCjG8G7aCOLF6oSWGdzK045r0WGOeuB7DE0+BjBTPqe4tT7UhvLv8GHiwgclXXADL
	 SHfpT04vy64ngfe9QXDs2meCMwPL2xDJxhuiLWEDjXQY0asr1PC2sg3vmIU3TF2agb
	 FLelPEn214s0Q==
Date: Mon, 28 Aug 2023 15:30:29 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Simone Ballarin <simone.ballarin@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    sstabellini@kernel.org, Jan Beulich <jbeulich@suse.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH 07/13] x86/asm: address violations of MISRA C:2012
 Directive 4.10
In-Reply-To: <c5b6c3b7824d620b341c72c8d5dde5f5fce17dec.1693228255.git.simone.ballarin@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2308281529400.6458@ubuntu-linux-20-04-desktop>
References: <cover.1693228255.git.simone.ballarin@bugseng.com> <c5b6c3b7824d620b341c72c8d5dde5f5fce17dec.1693228255.git.simone.ballarin@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 28 Aug 2023, Simone Ballarin wrote:
> Add or move inclusion guards to address violations of
> MISRA C:2012 Directive 4.10 ("Precautions shall be taken in order
> to prevent the contents of a header file being included more than
> once").
> 
> Inclusion guards must appear at the beginning of the headers
> (comments are permitted anywhere).
> 
> The text of the beggining comment of cpufeatures.h has been changed
> to match the deviation in automation/eclair_analysis/ECLAIR/deviations.ecl,
> moreover this new formulation is already used in other files.

I don't think it is a good idea to do this kind of textual matching.
Instead we should use the format introduced by safe.json, e.g.
SAF-1-safe


> Mechanical change.
> 
> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
> ---
>  xen/arch/x86/include/asm/compat.h      | 5 +++++
>  xen/arch/x86/include/asm/cpufeatures.h | 4 +---
>  xen/arch/x86/include/asm/efibind.h     | 5 +++++
>  xen/arch/x86/include/asm/hypercall.h   | 6 +++---
>  4 files changed, 14 insertions(+), 6 deletions(-)
> 
> diff --git a/xen/arch/x86/include/asm/compat.h b/xen/arch/x86/include/asm/compat.h
> index 818cad87db..3d3891d061 100644
> --- a/xen/arch/x86/include/asm/compat.h
> +++ b/xen/arch/x86/include/asm/compat.h
> @@ -2,6 +2,9 @@
>   * compat.h
>   */
>  
> +#ifndef __ASM_X86_COMPAT_H__
> +#define __ASM_X86_COMPAT_H__
> +
>  #ifdef CONFIG_COMPAT
>  
>  #define COMPAT_BITS_PER_LONG 32
> @@ -18,3 +21,5 @@ int switch_compat(struct domain *);
>  #include <xen/errno.h>
>  static inline int switch_compat(struct domain *d) { return -EOPNOTSUPP; }
>  #endif
> +
> +#endif /* __ASM_X86_COMPAT_H__ */
> diff --git a/xen/arch/x86/include/asm/cpufeatures.h b/xen/arch/x86/include/asm/cpufeatures.h
> index da0593de85..1dfdd478ab 100644
> --- a/xen/arch/x86/include/asm/cpufeatures.h
> +++ b/xen/arch/x86/include/asm/cpufeatures.h
> @@ -1,6 +1,4 @@
> -/*
> - * Explicitly intended for multiple inclusion.
> - */
> +/* This file is legitimately included multiple times */
>  
>  #include <xen/lib/x86/cpuid-autogen.h>
>  
> diff --git a/xen/arch/x86/include/asm/efibind.h b/xen/arch/x86/include/asm/efibind.h
> index bce02f3707..f2eb8b5496 100644
> --- a/xen/arch/x86/include/asm/efibind.h
> +++ b/xen/arch/x86/include/asm/efibind.h
> @@ -1,2 +1,7 @@
> +#ifndef __ASM_X86_EFIBIND_H__
> +#define __ASM_X86_EFIBIND_H__
> +
>  #include <xen/types.h>
>  #include <asm/x86_64/efibind.h>
> +
> +#endif /* __ASM_X86_EFIBIND_H__ */
> diff --git a/xen/arch/x86/include/asm/hypercall.h b/xen/arch/x86/include/asm/hypercall.h
> index ec2edc771e..2ade5d71b8 100644
> --- a/xen/arch/x86/include/asm/hypercall.h
> +++ b/xen/arch/x86/include/asm/hypercall.h
> @@ -2,13 +2,13 @@
>   * asm-x86/hypercall.h
>   */
>  
> +#ifndef __ASM_X86_HYPERCALL_H__
> +#define __ASM_X86_HYPERCALL_H__
> +
>  #ifndef __XEN_HYPERCALL_H__
>  #error "asm/hypercall.h should not be included directly - include xen/hypercall.h instead"
>  #endif
>  
> -#ifndef __ASM_X86_HYPERCALL_H__
> -#define __ASM_X86_HYPERCALL_H__
> -
>  #include <xen/types.h>
>  #include <public/physdev.h>
>  #include <public/event_channel.h>
> -- 
> 2.34.1
> 

