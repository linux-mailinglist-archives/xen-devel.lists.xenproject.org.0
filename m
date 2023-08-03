Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA95076DD91
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 03:52:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.575949.901529 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRNVR-0005sS-DM; Thu, 03 Aug 2023 01:52:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 575949.901529; Thu, 03 Aug 2023 01:52:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRNVR-0005pb-Ag; Thu, 03 Aug 2023 01:52:01 +0000
Received: by outflank-mailman (input) for mailman id 575949;
 Thu, 03 Aug 2023 01:52:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hVX3=DU=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qRNVQ-0005pV-6I
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 01:52:00 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 53d8b120-31a0-11ee-8613-37d641c3527e;
 Thu, 03 Aug 2023 03:51:57 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id ED2C561AC0;
 Thu,  3 Aug 2023 01:51:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1C68C433C8;
 Thu,  3 Aug 2023 01:51:53 +0000 (UTC)
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
X-Inumbo-ID: 53d8b120-31a0-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691027515;
	bh=2IK/EQDswiEIawo9ypafj9tfC/m/hF62pOzQJce9/nk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=LrukKmL/FZdc6411n7wCcaTyIjFhyWisK5MxWve2jYk2kTCHglqmja/5FjUmM5+uV
	 KAL4qYGNE529pIP9BO4O+5/t4vm9unFzNbXlL+Xufkq7gYGSvdgHI+Y3QmfrjNbJRS
	 X/XLlfVAehLIvk0XIDRT9idlnlv08be3AfMRrDbNxhos9T28G6V2hQuXFrb1xRVOZ9
	 i4ENV1vNiJl8G2g7uyx++TJsza3yj2XbL21SB4bVWiSpkgsed+KgFfRgrp62P7fODL
	 OymgrsqXS94uywvKYg0iOQZ91+hn+1fGxXBtl1dt1iZqD4y1b/k256nBNCyO4bXQ53
	 1f0EWk541pVqw==
Date: Wed, 2 Aug 2023 18:51:52 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, Jan Beulich <jbeulich@suse.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH 2/4] x86/mtrr: address MISRA C:2012 Rule 5.3
In-Reply-To: <16fa23ecb465442c566a18af0a569092075eef26.1690969271.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2308021847190.2127516@ubuntu-linux-20-04-desktop>
References: <cover.1690969271.git.nicola.vetrini@bugseng.com> <16fa23ecb465442c566a18af0a569092075eef26.1690969271.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 2 Aug 2023, Nicola Vetrini wrote:
> Rename variables to avoid shadowing and thus address
> MISRA C:2012 Rule 5.3:
> "An identifier declared in an inner scope shall not hide an
> identifier declared in an outer scope"
> 
> No functional changes.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

This one clashes with xen/arch/x86/include/asm/mtrr.h:struct mtrr_state
right?


> ---
>  xen/arch/x86/hvm/mtrr.c | 32 ++++++++++++++++----------------
>  1 file changed, 16 insertions(+), 16 deletions(-)
> 
> diff --git a/xen/arch/x86/hvm/mtrr.c b/xen/arch/x86/hvm/mtrr.c
> index 29f3fb1607..d504d1e43b 100644
> --- a/xen/arch/x86/hvm/mtrr.c
> +++ b/xen/arch/x86/hvm/mtrr.c
> @@ -687,13 +687,13 @@ int hvm_set_mem_pinned_cacheattr(struct domain *d, uint64_t gfn_start,
>  
>  static int cf_check hvm_save_mtrr_msr(struct vcpu *v, hvm_domain_context_t *h)
>  {
> -    const struct mtrr_state *mtrr_state = &v->arch.hvm.mtrr;
> +    const struct mtrr_state *mtrr = &v->arch.hvm.mtrr;

I can see in hvm_vcpu_cacheattr_init, mtrr_get_type and other places
that we use:

  const struct mtrr_state *m

maybe that's better? I'll let Jan comment.

Anyway, the patch looks correct to me.



>      struct hvm_hw_mtrr hw_mtrr = {
> -        .msr_mtrr_def_type = mtrr_state->def_type |
> -                             MASK_INSR(mtrr_state->fixed_enabled,
> +        .msr_mtrr_def_type = mtrr->def_type |
> +                             MASK_INSR(mtrr->fixed_enabled,
>                                         MTRRdefType_FE) |
> -                            MASK_INSR(mtrr_state->enabled, MTRRdefType_E),
> -        .msr_mtrr_cap      = mtrr_state->mtrr_cap,
> +                            MASK_INSR(mtrr->enabled, MTRRdefType_E),
> +        .msr_mtrr_cap      = mtrr->mtrr_cap,
>      };
>      unsigned int i;
>  
> @@ -710,14 +710,14 @@ static int cf_check hvm_save_mtrr_msr(struct vcpu *v, hvm_domain_context_t *h)
>  
>      for ( i = 0; i < MASK_EXTR(hw_mtrr.msr_mtrr_cap, MTRRcap_VCNT); i++ )
>      {
> -        hw_mtrr.msr_mtrr_var[i * 2] = mtrr_state->var_ranges->base;
> -        hw_mtrr.msr_mtrr_var[i * 2 + 1] = mtrr_state->var_ranges->mask;
> +        hw_mtrr.msr_mtrr_var[i * 2] = mtrr->var_ranges->base;
> +        hw_mtrr.msr_mtrr_var[i * 2 + 1] = mtrr->var_ranges->mask;
>      }
>  
>      BUILD_BUG_ON(sizeof(hw_mtrr.msr_mtrr_fixed) !=
> -                 sizeof(mtrr_state->fixed_ranges));
> +                 sizeof(mtrr->fixed_ranges));
>  
> -    memcpy(hw_mtrr.msr_mtrr_fixed, mtrr_state->fixed_ranges,
> +    memcpy(hw_mtrr.msr_mtrr_fixed, mtrr->fixed_ranges,
>             sizeof(hw_mtrr.msr_mtrr_fixed));
>  
>      return hvm_save_entry(MTRR, v->vcpu_id, h, &hw_mtrr);
> @@ -727,7 +727,7 @@ static int cf_check hvm_load_mtrr_msr(struct domain *d, hvm_domain_context_t *h)
>  {
>      unsigned int vcpuid, i;
>      struct vcpu *v;
> -    struct mtrr_state *mtrr_state;
> +    struct mtrr_state *mtrr;
>      struct hvm_hw_mtrr hw_mtrr;
>  
>      vcpuid = hvm_load_instance(h);
> @@ -749,26 +749,26 @@ static int cf_check hvm_load_mtrr_msr(struct domain *d, hvm_domain_context_t *h)
>          return -EINVAL;
>      }
>  
> -    mtrr_state = &v->arch.hvm.mtrr;
> +    mtrr = &v->arch.hvm.mtrr;
>  
>      hvm_set_guest_pat(v, hw_mtrr.msr_pat_cr);
>  
> -    mtrr_state->mtrr_cap = hw_mtrr.msr_mtrr_cap;
> +    mtrr->mtrr_cap = hw_mtrr.msr_mtrr_cap;
>  
>      for ( i = 0; i < NUM_FIXED_MSR; i++ )
> -        mtrr_fix_range_msr_set(d, mtrr_state, i, hw_mtrr.msr_mtrr_fixed[i]);
> +        mtrr_fix_range_msr_set(d, mtrr, i, hw_mtrr.msr_mtrr_fixed[i]);
>  
>      for ( i = 0; i < MASK_EXTR(hw_mtrr.msr_mtrr_cap, MTRRcap_VCNT); i++ )
>      {
> -        mtrr_var_range_msr_set(d, mtrr_state,
> +        mtrr_var_range_msr_set(d, mtrr,
>                                 MSR_IA32_MTRR_PHYSBASE(i),
>                                 hw_mtrr.msr_mtrr_var[i * 2]);
> -        mtrr_var_range_msr_set(d, mtrr_state,
> +        mtrr_var_range_msr_set(d, mtrr,
>                                 MSR_IA32_MTRR_PHYSMASK(i),
>                                 hw_mtrr.msr_mtrr_var[i * 2 + 1]);
>      }
>  
> -    mtrr_def_type_msr_set(d, mtrr_state, hw_mtrr.msr_mtrr_def_type);
> +    mtrr_def_type_msr_set(d, mtrr, hw_mtrr.msr_mtrr_def_type);
>  
>      return 0;
>  }
> -- 
> 2.34.1
> 

