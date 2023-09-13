Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90CF779DD89
	for <lists+xen-devel@lfdr.de>; Wed, 13 Sep 2023 03:26:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.600917.936757 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgEdk-000197-Vt; Wed, 13 Sep 2023 01:26:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 600917.936757; Wed, 13 Sep 2023 01:26:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgEdk-00016i-SU; Wed, 13 Sep 2023 01:26:00 +0000
Received: by outflank-mailman (input) for mailman id 600917;
 Wed, 13 Sep 2023 01:25:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VxlT=E5=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qgEdi-00016c-Vm
 for xen-devel@lists.xenproject.org; Wed, 13 Sep 2023 01:25:58 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7b7c0729-51d4-11ee-9b0d-b553b5be7939;
 Wed, 13 Sep 2023 03:25:56 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id AFAFDCE1C99;
 Wed, 13 Sep 2023 01:25:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95A3FC433C8;
 Wed, 13 Sep 2023 01:25:46 +0000 (UTC)
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
X-Inumbo-ID: 7b7c0729-51d4-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694568348;
	bh=6piGDTjpAnHdGAS5x4seMfvmuqhILPMy381PvKWH6LI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=RCCOBnvSnA92jiMyh1FIp36tBEivIGoDXAfH8jhHijFvVpcSy9CV0n1vG9y0/ss6T
	 pJ1JfsND/lVoi+BKBG2PFlWCKbt112PMlspuS7Tqz+aglMAIuLPwmJc3/XaGcOXf13
	 R/jhOIFwcYPFHGtMFmKnG/RPiuzHJUSLk720hl+GCJwoETs59EiLkSvXj11IUlX+Sn
	 xKPnlxJwnnGB+3cIjhTM0nKIC9OPJoXxArUE0IsuuVIfl2hL407qpXtYzWhDTaNCNe
	 V0uPOxdkJgN6n+ZI1hMZDCPUOTPTC8q4f9Z3MXqL+C+6ks+yEhbQuEhQzP9gNpH4Xk
	 4DYbHQ9ZmYftw==
Date: Tue, 12 Sep 2023 18:25:44 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Simone Ballarin <simone.ballarin@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    sstabellini@kernel.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [XEN PATCH v2 10/10] x86/asm: address violations of MISRA C:2012
 Directive 4.10
In-Reply-To: <1bab3ee9632be879244a405ee248f03392c58731.1694510856.git.simone.ballarin@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2309121819350.2295162@ubuntu-linux-20-04-desktop>
References: <cover.1694510856.git.simone.ballarin@bugseng.com> <1bab3ee9632be879244a405ee248f03392c58731.1694510856.git.simone.ballarin@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 12 Sep 2023, Simone Ballarin wrote:
> Amend generation script, add inclusion guards to address violations
> of MISRA C:2012 Directive 4.10 ("Precautions shall be taken in order
> to prevent the contents of a header file being included more than
> once").
> 
> This patch amends the Makefile adding the required inclusion guards
> for xlat.h.
> 
> Add deviation comment for files intended for multiple inclusion.
> 
> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
> 
> ---
> Changes in v2:
> - merge patches 7/13 and 13/13 of v1 as they had the same
>   commit message
> - amend the Makefile to produce the required inclusion guard
> - use the format introduced with doc/misra/safe.json instead of
>   a generic text-based deviation
> ---
>  docs/misra/safe.json                   | 8 ++++++++
>  xen/arch/x86/include/asm/compat.h      | 5 +++++
>  xen/arch/x86/include/asm/cpufeatures.h | 5 +----
>  xen/arch/x86/include/asm/efibind.h     | 5 +++++
>  xen/include/Makefile                   | 8 ++++++--
>  5 files changed, 25 insertions(+), 6 deletions(-)
> 
> diff --git a/docs/misra/safe.json b/docs/misra/safe.json
> index 0ec594f6bf..82c636ee94 100644
> --- a/docs/misra/safe.json
> +++ b/docs/misra/safe.json
> @@ -44,6 +44,14 @@
>          },
>          {
>              "id": "SAF-5-safe",

You might want to double-check the SAF id here as well


> +            "analyser": {
> +                "eclair": "MC3R1.D4.10"
> +            },
> +            "name": "Dir 4.10: file intended for multiple inclusion",
> +            "text": "Files intended for multiple inclusion are not supposed to comply with D4.10."
> +        },
> +        {
> +            "id": "SAF-6-safe",
>              "analyser": {},
>              "name": "Sentinel",
>              "text": "Next ID to be used"
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
> index da0593de85..39b15e463a 100644
> --- a/xen/arch/x86/include/asm/cpufeatures.h
> +++ b/xen/arch/x86/include/asm/cpufeatures.h
> @@ -1,7 +1,4 @@
> -/*
> - * Explicitly intended for multiple inclusion.
> - */
> -
> +/* SAF-4-safe file intended for multiple inclusion */
>  #include <xen/lib/x86/cpuid-autogen.h>
>  
>  /* Number of capability words covered by the featureset words. */
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
> diff --git a/xen/include/Makefile b/xen/include/Makefile
> index 31782fb177..b2f9576362 100644
> --- a/xen/include/Makefile
> +++ b/xen/include/Makefile
> @@ -105,9 +105,13 @@ xlat-y := $(shell sed -ne 's,@arch@,$(compat-arch-y),g' -re 's,^[?!][[:blank:]]+
>  xlat-y := $(filter $(patsubst compat/%,%,$(headers-y)),$(xlat-y))
>  
>  quiet_cmd_xlat_h = GEN     $@
> -cmd_xlat_h = \
> -	cat $(filter %.h,$^) >$@.new; \
> +define cmd_xlat_h
> +	echo "#ifndef _COMPAT_XLAT_H" > $@.new; \
> +	echo "#define _COMPAT_XLAT_H" >> $@.new; \
> +	cat $(filter %.h,$^) >> $@.new; \
> +	echo "#endif /* _COMPAT_XLAT_H */" >> $@.new; \
>  	mv -f $@.new $@
> +endef
>  
>  $(obj)/compat/xlat.h: $(addprefix $(obj)/compat/.xlat/,$(xlat-y)) FORCE
>  	$(call if_changed,xlat_h)

I checked that everything works as expected with this change and it does. I am not
sure about the choice of name "_COMPAT_XLAT_H" but anyway:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

