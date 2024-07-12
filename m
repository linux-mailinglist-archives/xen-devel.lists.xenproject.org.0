Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D32930220
	for <lists+xen-devel@lfdr.de>; Sat, 13 Jul 2024 00:28:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.758344.1167800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSOkf-00011f-1N; Fri, 12 Jul 2024 22:28:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 758344.1167800; Fri, 12 Jul 2024 22:28:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSOke-0000zZ-V1; Fri, 12 Jul 2024 22:28:28 +0000
Received: by outflank-mailman (input) for mailman id 758344;
 Fri, 12 Jul 2024 22:28:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ilSY=OM=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sSOkd-0000zT-DU
 for xen-devel@lists.xenproject.org; Fri, 12 Jul 2024 22:28:27 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0d6ba035-409e-11ef-bbfb-fd08da9f4363;
 Sat, 13 Jul 2024 00:28:25 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 11E6BCE016A;
 Fri, 12 Jul 2024 22:28:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39FD6C32782;
 Fri, 12 Jul 2024 22:28:20 +0000 (UTC)
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
X-Inumbo-ID: 0d6ba035-409e-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720823301;
	bh=zspmqbwiIOnlyW423xZWSgTINWXKH4WrSp3DAVcxXsc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=eip57VrRfEvtHVqVEyQv56GE5OZTBeuFlC8VlgE5BT3ryAZAaKmjw9zGYzHJRLfXJ
	 42XtLCdZmGRF8cqfizYoxY9BlKQLh2gtehH2mhDX/KvTOMwL+MXVmLmUHEoSAvQC1I
	 rBuTj6CN33MSVn/qmUvyfeqnhBzcY0Z9/H/vqTTIXuwEtlUVxnH2zxVM5f4wD1M6SV
	 sodG4hT/NBuqM07HjSsVYlHdQQjVx7tMWjKAwEui/suHrbIDClkHAGih4cKjAtu2S8
	 S8aaTRm1RfOVrwSzZVf/B7uqlJfD75IRgEaRRaWCPhuFbDArp9AQ4NAFCu6S7IJzRy
	 a1+ZfpEgtj9uA==
Date: Fri, 12 Jul 2024 15:28:19 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>, 
    consulting@bugseng.com, Nicola Vetrini <nicola.vetrini@bugseng.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH 14/17] xen: add SAF deviation for MISRA C Dir 4.10
In-Reply-To: <d6c313e5-19c6-4775-8d9c-0742a37032b4@suse.com>
Message-ID: <alpine.DEB.2.22.394.2407121527500.3635@ubuntu-linux-20-04-desktop>
References: <cover.1719829101.git.alessandro.zucchelli@bugseng.com> <b64a6b53de8bcf14c91a1534bb57b001efc12cce.1719829101.git.alessandro.zucchelli@bugseng.com> <d6c313e5-19c6-4775-8d9c-0742a37032b4@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 3 Jul 2024, Jan Beulich wrote:
> public/x86: don't include common xen.h from arch-specific one
> 
> No other arch-*.h does so, and arch-x86/xen.h really just takes the role
> of arch-x86_32.h and arch-x86_64.h (by those two forwarding there). With
> xen.h itself including the per-arch headers, doing so is also kind of
> backwards anyway, and just calling for problems. There's exactly one
> place where arch-x86/xen.h is included when really xen.h is meant (for
> wanting XEN_GUEST_HANDLE_64() to be made available, the default
> definition of which lives in the common xen.h).
> 
> This then addresses a violation of Misra C:2012 Directive 4.10
> ("Precautions shall be taken in order to prevent the contents of a
> header file being included more than once").
> 
> Reported-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> --- a/xen/include/public/arch-x86/xen.h
> +++ b/xen/include/public/arch-x86/xen.h
> @@ -7,8 +7,6 @@
>   * Copyright (c) 2004-2006, K A Fraser
>   */
>  
> -#include "../xen.h"
> -
>  #ifndef __XEN_PUBLIC_ARCH_X86_XEN_H__
>  #define __XEN_PUBLIC_ARCH_X86_XEN_H__
>  
> --- a/xen/include/xen/lib/x86/cpu-policy.h
> +++ b/xen/include/xen/lib/x86/cpu-policy.h
> @@ -525,7 +525,7 @@ void x86_cpu_policy_bound_max_leaves(str
>  void x86_cpu_policy_shrink_max_leaves(struct cpu_policy *p);
>  
>  #ifdef __XEN__
> -#include <public/arch-x86/xen.h>
> +#include <public/xen.h>
>  typedef XEN_GUEST_HANDLE_64(xen_cpuid_leaf_t) cpuid_leaf_buffer_t;
>  typedef XEN_GUEST_HANDLE_64(xen_msr_entry_t) msr_entry_buffer_t;
>  #else
> 
> 

