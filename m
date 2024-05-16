Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 482FE8C6FA1
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 02:45:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722728.1126984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7PEi-0000ZZ-FJ; Thu, 16 May 2024 00:44:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722728.1126984; Thu, 16 May 2024 00:44:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7PEi-0000X2-Cb; Thu, 16 May 2024 00:44:44 +0000
Received: by outflank-mailman (input) for mailman id 722728;
 Thu, 16 May 2024 00:44:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcFO=MT=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s7PEh-0000Ww-Lw
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 00:44:43 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7b4aabdd-131d-11ef-909d-e314d9c70b13;
 Thu, 16 May 2024 02:44:42 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E22CF60EDE;
 Thu, 16 May 2024 00:44:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BE99C116B1;
 Thu, 16 May 2024 00:44:39 +0000 (UTC)
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
X-Inumbo-ID: 7b4aabdd-131d-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715820280;
	bh=R9a8H5UBpfaQ+OyUCtoxTLUElqPo418XLs/v9CCV27I=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=pUiDEPh5qCcFjCcTELaoBO9J84XhqIO3Webhs34G+4zIVpuMpv7KbtKiTTHJApwiW
	 EyPiyEaLsYDt0JIdyVuylDHtn0uNFq6Eng5oSNb3/WkKZiSeW+VAGH4hRFUSAP3nfD
	 6lExl0sjEpfuB1fUTrW6cowTqbgAUpGxgm8KMZsl+yJvo1/zH9PjRWig9i47mMO2XX
	 CLC9VFbISVxhTDq99xjj5wqqcnPJHyyeE+yaFKr3KX4SkIE3ci2f+YL+ND/NPDedsD
	 hbs1xD8txXzD+/3Uj8IOKZQ/FCMqrQUmWBUwlaLeIPxUrgE29yafqVef/KCSl1b0aK
	 19d4fgcd+Pj8w==
Date: Wed, 15 May 2024 17:44:37 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Xenia Ragiadakou <xenia.ragiadakou@amd.com>
Subject: Re: [XEN PATCH v2 08/15] x86/vpmu: guard vmx/svm calls with
 cpu_has_{vmx,svm}
In-Reply-To: <fbd17194026a7e61bac2198e3b468d498f45d064.1715761386.git.Sergiy_Kibrik@epam.com>
Message-ID: <alpine.DEB.2.22.394.2405151740180.2544314@ubuntu-linux-20-04-desktop>
References: <cover.1715761386.git.Sergiy_Kibrik@epam.com> <fbd17194026a7e61bac2198e3b468d498f45d064.1715761386.git.Sergiy_Kibrik@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 15 May 2024, Sergiy Kibrik wrote:
> If VMX/SVM disabled in the build, we may still want to have vPMU drivers for
> PV guests. Yet some calls to vmx/svm-related routines needs to be guarded then.
> 
> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>

Question to the x86 maintainers: are we sure we want to support the case
where VMX/SVM is disabled in the build but still we want to run PV
guests with vPMU?

If the question is not, could we simplify this simply by making vpmu_amd
dependent on CONFIG_SVM and vpmu_intel dependent on CONFIG_VMX?

I realize that it is possible and technically correct to disable
CONFIG_SVM (or VMX) to run on AMD hardware (or Intel) with plain PV
guests only. But do we want to support it? I wonder if we could make
things easier by avoiding to support this configuration until somebody
asks for it.


> ---
>  xen/arch/x86/cpu/vpmu_amd.c   |  8 ++++----
>  xen/arch/x86/cpu/vpmu_intel.c | 20 ++++++++++----------
>  2 files changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/xen/arch/x86/cpu/vpmu_amd.c b/xen/arch/x86/cpu/vpmu_amd.c
> index db2fa420e1..40b0c8932f 100644
> --- a/xen/arch/x86/cpu/vpmu_amd.c
> +++ b/xen/arch/x86/cpu/vpmu_amd.c
> @@ -290,7 +290,7 @@ static int cf_check amd_vpmu_save(struct vcpu *v,  bool to_guest)
>      context_save(v);
>  
>      if ( !vpmu_is_set(vpmu, VPMU_RUNNING) && is_hvm_vcpu(v) &&
> -         is_msr_bitmap_on(vpmu) )
> +         is_msr_bitmap_on(vpmu) && cpu_has_svm )
>          amd_vpmu_unset_msr_bitmap(v);
>  
>      if ( to_guest )
> @@ -363,7 +363,7 @@ static int cf_check amd_vpmu_do_wrmsr(unsigned int msr, uint64_t msr_content)
>              return 0;
>          vpmu_set(vpmu, VPMU_RUNNING);
>  
> -        if ( is_hvm_vcpu(v) && is_msr_bitmap_on(vpmu) )
> +        if ( is_hvm_vcpu(v) && is_msr_bitmap_on(vpmu) && cpu_has_svm )
>               amd_vpmu_set_msr_bitmap(v);
>      }
>  
> @@ -372,7 +372,7 @@ static int cf_check amd_vpmu_do_wrmsr(unsigned int msr, uint64_t msr_content)
>          (is_pmu_enabled(msr_content) == 0) && vpmu_is_set(vpmu, VPMU_RUNNING) )
>      {
>          vpmu_reset(vpmu, VPMU_RUNNING);
> -        if ( is_hvm_vcpu(v) && is_msr_bitmap_on(vpmu) )
> +        if ( is_hvm_vcpu(v) && is_msr_bitmap_on(vpmu) && cpu_has_svm )
>               amd_vpmu_unset_msr_bitmap(v);
>          release_pmu_ownership(PMU_OWNER_HVM);
>      }
> @@ -415,7 +415,7 @@ static void cf_check amd_vpmu_destroy(struct vcpu *v)
>  {
>      struct vpmu_struct *vpmu = vcpu_vpmu(v);
>  
> -    if ( is_hvm_vcpu(v) && is_msr_bitmap_on(vpmu) )
> +    if ( is_hvm_vcpu(v) && is_msr_bitmap_on(vpmu) && cpu_has_svm )
>          amd_vpmu_unset_msr_bitmap(v);
>  
>      xfree(vpmu->context);
> diff --git a/xen/arch/x86/cpu/vpmu_intel.c b/xen/arch/x86/cpu/vpmu_intel.c
> index cd414165df..10c34a5691 100644
> --- a/xen/arch/x86/cpu/vpmu_intel.c
> +++ b/xen/arch/x86/cpu/vpmu_intel.c
> @@ -269,7 +269,7 @@ static inline void __core2_vpmu_save(struct vcpu *v)
>      if ( !is_hvm_vcpu(v) )
>          rdmsrl(MSR_CORE_PERF_GLOBAL_STATUS, core2_vpmu_cxt->global_status);
>      /* Save MSR to private context to make it fork-friendly */
> -    else if ( mem_sharing_enabled(v->domain) )
> +    else if ( mem_sharing_enabled(v->domain) && cpu_has_vmx )
>          vmx_read_guest_msr(v, MSR_CORE_PERF_GLOBAL_CTRL,
>                             &core2_vpmu_cxt->global_ctrl);
>  }
> @@ -288,7 +288,7 @@ static int cf_check core2_vpmu_save(struct vcpu *v, bool to_guest)
>  
>      /* Unset PMU MSR bitmap to trap lazy load. */
>      if ( !vpmu_is_set(vpmu, VPMU_RUNNING) && is_hvm_vcpu(v) &&
> -         cpu_has_vmx_msr_bitmap )
> +         cpu_has_vmx && cpu_has_vmx_msr_bitmap )
>          core2_vpmu_unset_msr_bitmap(v);
>  
>      if ( to_guest )
> @@ -333,7 +333,7 @@ static inline void __core2_vpmu_load(struct vcpu *v)
>          wrmsrl(MSR_CORE_PERF_GLOBAL_CTRL, core2_vpmu_cxt->global_ctrl);
>      }
>      /* Restore MSR from context when used with a fork */
> -    else if ( mem_sharing_is_fork(v->domain) )
> +    else if ( mem_sharing_is_fork(v->domain) && cpu_has_vmx )
>          vmx_write_guest_msr(v, MSR_CORE_PERF_GLOBAL_CTRL,
>                              core2_vpmu_cxt->global_ctrl);
>  }
> @@ -442,7 +442,7 @@ static int cf_check core2_vpmu_alloc_resource(struct vcpu *v)
>      if ( !acquire_pmu_ownership(PMU_OWNER_HVM) )
>          return 0;
>  
> -    if ( is_hvm_vcpu(v) )
> +    if ( is_hvm_vcpu(v) && cpu_has_vmx )
>      {
>          if ( vmx_add_host_load_msr(v, MSR_CORE_PERF_GLOBAL_CTRL, 0) )
>              goto out_err;
> @@ -513,7 +513,7 @@ static int core2_vpmu_msr_common_check(u32 msr_index, int *type, int *index)
>          __core2_vpmu_load(current);
>          vpmu_set(vpmu, VPMU_CONTEXT_LOADED);
>  
> -        if ( is_hvm_vcpu(current) && cpu_has_vmx_msr_bitmap )
> +        if ( is_hvm_vcpu(current) && cpu_has_vmx && cpu_has_vmx_msr_bitmap )
>              core2_vpmu_set_msr_bitmap(current);
>      }
>      return 1;
> @@ -584,7 +584,7 @@ static int cf_check core2_vpmu_do_wrmsr(unsigned int msr, uint64_t msr_content)
>          if ( msr_content & fixed_ctrl_mask )
>              return -EINVAL;
>  
> -        if ( is_hvm_vcpu(v) )
> +        if ( is_hvm_vcpu(v) && cpu_has_vmx )
>              vmx_read_guest_msr(v, MSR_CORE_PERF_GLOBAL_CTRL,
>                                 &core2_vpmu_cxt->global_ctrl);
>          else
> @@ -653,7 +653,7 @@ static int cf_check core2_vpmu_do_wrmsr(unsigned int msr, uint64_t msr_content)
>              if ( blocked )
>                  return -EINVAL;
>  
> -            if ( is_hvm_vcpu(v) )
> +            if ( is_hvm_vcpu(v) && cpu_has_vmx)
>                  vmx_read_guest_msr(v, MSR_CORE_PERF_GLOBAL_CTRL,
>                                     &core2_vpmu_cxt->global_ctrl);
>              else
> @@ -672,7 +672,7 @@ static int cf_check core2_vpmu_do_wrmsr(unsigned int msr, uint64_t msr_content)
>          wrmsrl(msr, msr_content);
>      else
>      {
> -        if ( is_hvm_vcpu(v) )
> +        if ( is_hvm_vcpu(v) && cpu_has_vmx )
>              vmx_write_guest_msr(v, MSR_CORE_PERF_GLOBAL_CTRL, msr_content);
>          else
>              wrmsrl(MSR_CORE_PERF_GLOBAL_CTRL, msr_content);
> @@ -706,7 +706,7 @@ static int cf_check core2_vpmu_do_rdmsr(unsigned int msr, uint64_t *msr_content)
>              *msr_content = core2_vpmu_cxt->global_status;
>              break;
>          case MSR_CORE_PERF_GLOBAL_CTRL:
> -            if ( is_hvm_vcpu(v) )
> +            if ( is_hvm_vcpu(v) && cpu_has_vmx )
>                  vmx_read_guest_msr(v, MSR_CORE_PERF_GLOBAL_CTRL, msr_content);
>              else
>                  rdmsrl(MSR_CORE_PERF_GLOBAL_CTRL, *msr_content);
> @@ -808,7 +808,7 @@ static void cf_check core2_vpmu_destroy(struct vcpu *v)
>      vpmu->context = NULL;
>      xfree(vpmu->priv_context);
>      vpmu->priv_context = NULL;
> -    if ( is_hvm_vcpu(v) && cpu_has_vmx_msr_bitmap )
> +    if ( is_hvm_vcpu(v) && cpu_has_vmx && cpu_has_vmx_msr_bitmap )
>          core2_vpmu_unset_msr_bitmap(v);
>      release_pmu_ownership(PMU_OWNER_HVM);
>      vpmu_clear(vpmu);
> -- 
> 2.25.1
> 

