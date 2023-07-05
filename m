Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4807491E4
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jul 2023 01:29:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559551.874617 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHBvq-0005hi-3c; Wed, 05 Jul 2023 23:29:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559551.874617; Wed, 05 Jul 2023 23:29:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHBvq-0005g8-0j; Wed, 05 Jul 2023 23:29:10 +0000
Received: by outflank-mailman (input) for mailman id 559551;
 Wed, 05 Jul 2023 23:29:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UsP3=CX=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qHBvp-0005g2-5E
 for xen-devel@lists.xenproject.org; Wed, 05 Jul 2023 23:29:09 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bbdfc650-1b8b-11ee-8611-37d641c3527e;
 Thu, 06 Jul 2023 01:29:07 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C17636188D;
 Wed,  5 Jul 2023 23:29:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E746C433C7;
 Wed,  5 Jul 2023 23:29:03 +0000 (UTC)
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
X-Inumbo-ID: bbdfc650-1b8b-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688599745;
	bh=q5Zom3uXf9/N7/cy25D+SCQRSKDm6WI67TYQy5N5bh4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=sDOr+D0Jmt3IV2rfq4OXfo7u3xx1JGKPvno7nLwn6HlL0rrFHqTcc11r9l/SG8Tfl
	 c0k/lhN1NtKMMwGGg/Z26sszkFOmYuujEKUEJAjS1zOCSaE7qMKJTkRCDrWyac+7VA
	 jOIynWpFEAftuDF0kZGYVQOZRQgwJEtV1xJkMmdkQKYEwvskuhVxByHbBFcpPFwUk8
	 wCVy3W3KdX1lzgTJzF7TGrWcCjcSFUmm5xt40ZxtXiJ81x+iOU8KMXbkRQOpShCSOK
	 lEWc98bUBSOdSBp5R5gJq/fjonKcKtCgehjYsIAJtETpTC0G6gbOoOBbTq8+g9gAuN
	 YFSokxwETfB/Q==
Date: Wed, 5 Jul 2023 16:29:01 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Simone Ballarin <simone.ballarin@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Gianluca Luparini <gianluca.luparini@bugseng.com>, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>, 
    Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Subject: Re: [XEN PATCH v2 01/13] x86/cpufreq: fix violations of MISRA C:2012
 Rule 7.2
In-Reply-To: <7df9377d4cb218dd54646c2cb1b70327c8b44c96.1688559115.git.gianluca.luparini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2307051628500.761183@ubuntu-linux-20-04-desktop>
References: <cover.1688559115.git.gianluca.luparini@bugseng.com> <7df9377d4cb218dd54646c2cb1b70327c8b44c96.1688559115.git.gianluca.luparini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 5 Jul 2023, Simone Ballarin wrote:
> From: Gianluca Luparini <gianluca.luparini@bugseng.com>
> 
> The xen sources contains violations of MISRA C:2012 Rule 7.2 whose
> headline states:
> "A 'u' or 'U' suffix shall be applied to all integer constants
> that are represented in an unsigned type".
> 
> Add the 'U' suffix to integers literals with unsigned type and also to other
> literals used in the same contexts or near violations, when their positive
> nature is immediately clear. The latter changes are done for the sake of
> uniformity.
> 
> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
> Signed-off-by: Gianluca Luparini <gianluca.luparini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Changes in v2:
> - change commit title to make it unique
> - change commit message
> ---
>  xen/arch/x86/acpi/cpufreq/powernow.c      | 14 +++++++-------
>  xen/include/acpi/cpufreq/processor_perf.h |  2 +-
>  2 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/xen/arch/x86/acpi/cpufreq/powernow.c b/xen/arch/x86/acpi/cpufreq/powernow.c
> index d4c7dcd5d9..8e0784b69c 100644
> --- a/xen/arch/x86/acpi/cpufreq/powernow.c
> +++ b/xen/arch/x86/acpi/cpufreq/powernow.c
> @@ -32,14 +32,14 @@
>  #include <acpi/acpi.h>
>  #include <acpi/cpufreq/cpufreq.h>
>  
> -#define HW_PSTATE_MASK          0x00000007
> -#define HW_PSTATE_VALID_MASK    0x80000000
> -#define HW_PSTATE_MAX_MASK      0x000000f0
> +#define HW_PSTATE_MASK          0x00000007U
> +#define HW_PSTATE_VALID_MASK    0x80000000U
> +#define HW_PSTATE_MAX_MASK      0x000000f0U
>  #define HW_PSTATE_MAX_SHIFT     4
> -#define MSR_PSTATE_DEF_BASE     0xc0010064 /* base of Pstate MSRs */
> -#define MSR_PSTATE_STATUS       0xc0010063 /* Pstate Status MSR */
> -#define MSR_PSTATE_CTRL         0xc0010062 /* Pstate control MSR */
> -#define MSR_PSTATE_CUR_LIMIT    0xc0010061 /* pstate current limit MSR */
> +#define MSR_PSTATE_DEF_BASE     0xc0010064U /* base of Pstate MSRs */
> +#define MSR_PSTATE_STATUS       0xc0010063U /* Pstate Status MSR */
> +#define MSR_PSTATE_CTRL         0xc0010062U /* Pstate control MSR */
> +#define MSR_PSTATE_CUR_LIMIT    0xc0010061U /* pstate current limit MSR */
>  #define MSR_HWCR_CPBDIS_MASK    0x02000000ULL
>  
>  #define ARCH_CPU_FLAG_RESUME	1
> diff --git a/xen/include/acpi/cpufreq/processor_perf.h b/xen/include/acpi/cpufreq/processor_perf.h
> index d8a1ba68a6..8b5a1b9bde 100644
> --- a/xen/include/acpi/cpufreq/processor_perf.h
> +++ b/xen/include/acpi/cpufreq/processor_perf.h
> @@ -5,7 +5,7 @@
>  #include <public/sysctl.h>
>  #include <xen/acpi.h>
>  
> -#define XEN_PX_INIT 0x80000000
> +#define XEN_PX_INIT 0x80000000U
>  
>  int powernow_cpufreq_init(void);
>  unsigned int powernow_register_driver(void);
> -- 
> 2.41.0
> 

