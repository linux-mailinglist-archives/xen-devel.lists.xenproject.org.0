Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B336775A384
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jul 2023 02:39:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.566301.884971 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMHgp-0001IW-7u; Thu, 20 Jul 2023 00:38:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 566301.884971; Thu, 20 Jul 2023 00:38:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMHgp-0001G4-5D; Thu, 20 Jul 2023 00:38:43 +0000
Received: by outflank-mailman (input) for mailman id 566301;
 Thu, 20 Jul 2023 00:38:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1UDO=DG=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qMHgo-0001Fy-47
 for xen-devel@lists.xenproject.org; Thu, 20 Jul 2023 00:38:42 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c54553a4-2695-11ee-b23a-6b7b168915f2;
 Thu, 20 Jul 2023 02:38:40 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 40453617CE;
 Thu, 20 Jul 2023 00:38:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E6A8C433C8;
 Thu, 20 Jul 2023 00:38:36 +0000 (UTC)
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
X-Inumbo-ID: c54553a4-2695-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689813518;
	bh=VyefW/P9BwkGk/xm2hLwzVfkavNa8mkdgU0+WlMAtio=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ktcg5VgRooqk40lYSkPDNnUflMUQTXaQC+/sKSeDpyOcCjydXzQI3pY7OMUTuVA85
	 FwDYNTI9t495GkAxpdRn9ek4LIVkakmIt6Yiy/yjPpx+A1A/DOPZBK7kXor4FcHc1z
	 bdnxuTrIyFNnLAjfTR1FIHFT1BgSpL3mSc3S8QwDL/HImWcQwyTBaknEXkz3q0lx4m
	 IbKFq0ESliLe0n2VYG2kSPZ7lbOgupvk22QxYVda4+RFOc3GhjKbqhI1p7oWBvpXz6
	 JdNJwCNSjYOseerczKCj2KzIhreaFSk7Y0Atbl/Kvu17RERdh1AQGCsY8qPtuSlAsS
	 gJJwcrFdGSklg==
Date: Wed, 19 Jul 2023 17:38:35 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Xenia Ragiadakou <xenia.ragiadakou@amd.com>, 
    Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Subject: Re: [XEN PATCH v2] x86/HVM: address violations of MISRA C:2012 Rules
 8.2 and 8.3
In-Reply-To: <589e9c2ef5f13bf0c035b63f7b2e24fbbb878543.1689773180.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2307191726340.3118466@ubuntu-linux-20-04-desktop>
References: <589e9c2ef5f13bf0c035b63f7b2e24fbbb878543.1689773180.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 19 Jul 2023, Federico Serafini wrote:
> Give a name to unnamed parameters thus addressing violations of
> MISRA C:2012 Rule 8.2 ("Function types shall be in prototype form with
> named parameters").
> Keep consistency between parameter names and types used in function
> declarations and the ones used in the corresponding function
> definitions, thus addressing violations of MISRA C:2012 Rule 8.3
> ("All declarations of an object or function shall use the same names
> and type qualifiers").
> 
> No functional changes.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> ---
> Changes in v2:
>   - u64 vs uint64_t mismatches are solved in favor of the stdint types.
> ---
>  xen/arch/x86/hvm/domain.c              |  2 +-
>  xen/arch/x86/hvm/hvm.c                 |  6 +++---
>  xen/arch/x86/hvm/rtc.c                 | 12 ++++++------
>  xen/arch/x86/hvm/svm/nestedsvm.c       |  8 ++++----
>  xen/arch/x86/hvm/vioapic.c             |  2 +-
>  xen/arch/x86/include/asm/hvm/domain.h  |  2 +-
>  xen/arch/x86/include/asm/hvm/hvm.h     | 18 +++++++++---------
>  xen/arch/x86/include/asm/hvm/irq.h     | 14 +++++++-------
>  xen/arch/x86/include/asm/hvm/save.h    |  4 ++--
>  xen/arch/x86/include/asm/hvm/support.h |  2 +-
>  10 files changed, 35 insertions(+), 35 deletions(-)
> 
> diff --git a/xen/arch/x86/hvm/domain.c b/xen/arch/x86/hvm/domain.c
> index 7692ee24c2..7f6e362a70 100644
> --- a/xen/arch/x86/hvm/domain.c
> +++ b/xen/arch/x86/hvm/domain.c
> @@ -100,7 +100,7 @@ static int check_segment(struct segment_register *reg, enum x86_segment seg)
>  }
>  
>  /* Called by VCPUOP_initialise for HVM guests. */
> -int arch_set_info_hvm_guest(struct vcpu *v, const vcpu_hvm_context_t *ctx)
> +int arch_set_info_hvm_guest(struct vcpu *v, const struct vcpu_hvm_context *ctx)
>  {
>      const struct domain *d = v->domain;
>      struct cpu_user_regs *uregs = &v->arch.user_regs;
> diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
> index 57363c2ae1..28d131a202 100644
> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -272,7 +272,7 @@ uint8_t hvm_combine_hw_exceptions(uint8_t vec1, uint8_t vec2)
>      return X86_EXC_DF;
>  }
>  
> -void hvm_set_rdtsc_exiting(struct domain *d, bool_t enable)
> +void hvm_set_rdtsc_exiting(struct domain *d, bool enable)

This is actually getting hvm_set_rdtsc_exiting out-of-sync with its
declaration in xen/arch/x86/include/asm/hvm/hvm.h ?

Everything else looks good to me


