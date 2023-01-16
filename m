Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB5466BA7D
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jan 2023 10:35:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.478511.741757 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHLti-0005fb-3n; Mon, 16 Jan 2023 09:35:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 478511.741757; Mon, 16 Jan 2023 09:35:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHLti-0005dG-0x; Mon, 16 Jan 2023 09:35:22 +0000
Received: by outflank-mailman (input) for mailman id 478511;
 Mon, 16 Jan 2023 09:35:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W85+=5N=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pHLtg-0005d4-6P
 for xen-devel@lists.xenproject.org; Mon, 16 Jan 2023 09:35:20 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 164c2a06-9581-11ed-b8d0-410ff93cb8f0;
 Mon, 16 Jan 2023 10:35:17 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id s3so1744049edd.4
 for <xen-devel@lists.xenproject.org>; Mon, 16 Jan 2023 01:35:17 -0800 (PST)
Received: from [192.168.1.93] (adsl-67.109.242.226.tellas.gr. [109.242.226.67])
 by smtp.gmail.com with ESMTPSA id
 f9-20020a056402068900b0048999d127e0sm11144509edy.86.2023.01.16.01.35.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jan 2023 01:35:16 -0800 (PST)
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
X-Inumbo-ID: 164c2a06-9581-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JOhv9z+PNsgnqkOokKHghLvnay2fArMCvGNAfPJKnao=;
        b=PChpdD92IJQ+8d6cufeKzxfqpp0I5dLfn+gI4KdEYpa3dx+RjcKu2c11Q4w/nSbATb
         aOaI3Yb4e4/xY6lpJbBnMoUFvgIv9YiULovHLibw0njSgsmFKFq9yW6m4gb2Hk3c8y3/
         Ex3AwjjxzyjQ/tjIF6MOZN3glZL6WOVfax47PvUNFLm+1CCX+gJ7mZmezebQ28KYuEyA
         OAEG4IUiyw1fBQcTJ/G27U2b/jzKbAJlCfGKzwNDzvZZjltki0QtJmTImIYHXS34HtSd
         uNtKnMBYHw/8iv5v/mWC+X71BZWg0eXWFUAlTWPibCarfiWpICvmHu7c1vIguKa3GUgV
         P08g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JOhv9z+PNsgnqkOokKHghLvnay2fArMCvGNAfPJKnao=;
        b=BbKajxRaGGWLoutIflE8rXOenxtICVWF15QadG/J3MbKnZ8QF+7O0c4BCXdd2IKLf4
         deTPhI0EaEubye1SxcRbDxrpIeBgD9Ams9Ug2gSDY3Sx7agQTfn3qspwP1cpkzYnLzLX
         hUM4y46C4EVht4Sjdz60mxOHNeUr3RljvbRIG0PgETq8nqb7ZkCbzqoFioSjerKc100i
         LdrW023NBuzB3zRC7QFqZdvWoyh4j5HGU6E8qiw3edOu479fmCppSeP/wkuD8fC2BIHU
         Ff9wpvMT50pNXrzoOxe+oP7o4mkcCW1F/Bv3moIQTEW+IBXMawUaU5AuqD14sbTPx+Mm
         6miA==
X-Gm-Message-State: AFqh2kpdNULJTpjxosTrbWjW+Z8//ZXMt2uPmTkDYLJmYZMZGLJwqlVk
	IDwhlMTgjwqfI2geljUA12XGqFqHmn4=
X-Google-Smtp-Source: AMrXdXvGMV9JQ48YEQnPV/Ink7aGPdFyceDrx84IFkS12qSw2FwlCbiEgr9jzZsOLYLnHuHBUPZ7GQ==
X-Received: by 2002:a05:6402:454:b0:499:376e:6b2b with SMTP id p20-20020a056402045400b00499376e6b2bmr25497135edw.0.1673861716823;
        Mon, 16 Jan 2023 01:35:16 -0800 (PST)
Message-ID: <80dc13f9-f193-2def-cce6-93fd519e824f@gmail.com>
Date: Mon, 16 Jan 2023 11:35:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 6/8] x86/iommu: call pi_update_irte through an
 hvm_function callback
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Paul Durrant <paul@xen.org>
References: <20230116070431.905594-1-burzalodowa@gmail.com>
 <20230116070431.905594-7-burzalodowa@gmail.com>
Content-Language: en-US
In-Reply-To: <20230116070431.905594-7-burzalodowa@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 1/16/23 09:04, Xenia Ragiadakou wrote:
> Posted interrupt support in Xen is currently implemented only for the
> Intel platforms. Instead of calling directly pi_update_irte() from the
> common hvm code, add a pi_update_irte callback to the hvm_function_table.
> Then, create a wrapper function hvm_pi_update_irte() to be used by the
> common hvm code.
> 
> In the pi_update_irte callback prototype, pass the vcpu as first parameter
> instead of the posted-interrupt descriptor that is platform specific, and
> remove the const qualifier from the parameter gvec since it is not needed
> and because it does not compile with the alternative code patching in use.
> 
> Since the posted interrupt descriptor is Intel VT-x specific while
> msi_msg_write_remap_rte is iommu specific, open code pi_update_irte() inside
> vmx_pi_update_irte() but replace msi_msg_write_remap_rte() with generic
> iommu_update_ire_from_msi(). That way vmx_pi_update_irte() is not bound to
> Intel VT-d anymore.
> 
> Remove the now unused pi_update_irte() implementation.
> 
> No functional change intended.
> 
> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
> ---
> 
> Changes in v3:
>    - open code pi_update_irte() in vmx_pi_update_irte() but instead of using
>      the VT-d specific function msi_msg_write_remap_rte() use the generic
>      iommu_update_ire_from_msi()
>    - delete pi_update_irte() from vtd/intremap.c
>    - move the initialization of vmx pi_update_irte stub to start_vmx() and
>      perform it only if iommu_intpost is enabled.
>    - move pi_update_irte right after handle_eoi
> 
>   xen/arch/x86/hvm/vmx/vmx.c             | 41 ++++++++++++++++++++++++++
>   xen/arch/x86/include/asm/hvm/hvm.h     | 10 +++++++
>   xen/arch/x86/include/asm/iommu.h       |  3 --
>   xen/drivers/passthrough/vtd/intremap.c | 36 ----------------------
>   xen/drivers/passthrough/x86/hvm.c      |  5 ++--
>   5 files changed, 53 insertions(+), 42 deletions(-)
> 
> diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
> index 15a07933ee..a5355dbac2 100644
> --- a/xen/arch/x86/hvm/vmx/vmx.c
> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> @@ -396,6 +396,43 @@ void vmx_pi_hooks_deassign(struct domain *d)
>       domain_unpause(d);
>   }
>   
> +/*
> + * This function is used to update the IRTE for posted-interrupt
> + * when guest changes MSI/MSI-X information.
> + */
> +static int cf_check vmx_pi_update_irte(const struct vcpu *v,
> +                                       const struct pirq *pirq, uint8_t gvec)
> +{
> +    const struct pi_desc *pi_desc = v ? &v->arch.hvm.vmx.pi_desc : NULL;
> +    struct irq_desc *desc;
> +    struct msi_desc *msi_desc;
> +    int rc;
> +
> +    desc = pirq_spin_lock_irq_desc(pirq, NULL);
> +    if ( !desc )
> +        return -EINVAL;
> +
> +    msi_desc = desc->msi_desc;
> +    if ( !msi_desc )
> +    {
> +        rc = -ENODEV;
> +        goto unlock_out;
> +    }
> +    msi_desc->pi_desc = pi_desc;
> +    msi_desc->gvec = gvec;
> +
> +    spin_unlock_irq(&desc->lock);
> +
> +    ASSERT(pcidevs_locked());
> +
> +    return iommu_update_ire_from_msi(msi_desc, &msi_desc->msg);
> +
> + unlock_out:
> +    spin_unlock_irq(&desc->lock);
> +
> +    return rc;
> +}
> +
>   static const struct lbr_info {
>       u32 base, count;
>   } p4_lbr[] = {
> @@ -2969,8 +3006,12 @@ const struct hvm_function_table * __init start_vmx(void)
>       {
>           alloc_direct_apic_vector(&posted_intr_vector, pi_notification_interrupt);
>           if ( iommu_intpost )
> +        {
>               alloc_direct_apic_vector(&pi_wakeup_vector, pi_wakeup_interrupt);
>   
> +            vmx_function_table.pi_update_irte = vmx_pi_update_irte;
> +        }
> +
>           vmx_function_table.deliver_posted_intr = vmx_deliver_posted_intr;
>           vmx_function_table.sync_pir_to_irr     = vmx_sync_pir_to_irr;
>           vmx_function_table.test_pir            = vmx_test_pir;
> diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
> index 93254651f2..b1990a047c 100644
> --- a/xen/arch/x86/include/asm/hvm/hvm.h
> +++ b/xen/arch/x86/include/asm/hvm/hvm.h
> @@ -28,6 +28,8 @@
>   #include <asm/x86_emulate.h>
>   #include <asm/hvm/asid.h>
>   
> +struct pirq; /* needed by pi_update_irte */
> +
>   #ifdef CONFIG_HVM_FEP
>   /* Permit use of the Forced Emulation Prefix in HVM guests */
>   extern bool_t opt_hvm_fep;
> @@ -213,6 +215,8 @@ struct hvm_function_table {
>       void (*sync_pir_to_irr)(struct vcpu *v);
>       bool (*test_pir)(const struct vcpu *v, uint8_t vector);
>       void (*handle_eoi)(uint8_t vector, int isr);
> +    int (*pi_update_irte)(const struct vcpu *v, const struct pirq *pirq,
> +                          uint8_t gvec);
>   
>       /*Walk nested p2m  */
>       int (*nhvm_hap_walk_L1_p2m)(struct vcpu *v, paddr_t L2_gpa,
> @@ -774,6 +778,12 @@ static inline void hvm_set_nonreg_state(struct vcpu *v,
>           alternative_vcall(hvm_funcs.set_nonreg_state, v, nrs);
>   }
>   
> +static inline int hvm_pi_update_irte(const struct vcpu *v,
> +                                     const struct pirq *pirq, uint8_t gvec)
> +{
> +    return alternative_call(hvm_funcs.pi_update_irte, v, pirq, gvec);
> +}
> +
>   #else  /* CONFIG_HVM */
>   
>   #define hvm_enabled false
> diff --git a/xen/arch/x86/include/asm/iommu.h b/xen/arch/x86/include/asm/iommu.h
> index fc0afe35bf..4794e72cf1 100644
> --- a/xen/arch/x86/include/asm/iommu.h
> +++ b/xen/arch/x86/include/asm/iommu.h
> @@ -129,9 +129,6 @@ void iommu_identity_map_teardown(struct domain *d);
>   
>   extern bool untrusted_msi;
>   
> -int pi_update_irte(const struct pi_desc *pi_desc, const struct pirq *pirq,
> -                   const uint8_t gvec);
> -
>   extern bool iommu_non_coherent, iommu_superpages;
>   
>   static inline void iommu_sync_cache(const void *addr, unsigned int size)

Here, I forgot to remove the #include <asm/hvm/vmx/vmcs.h>. I will fix 
it in the next version.

> diff --git a/xen/drivers/passthrough/vtd/intremap.c b/xen/drivers/passthrough/vtd/intremap.c
> index 1512e4866b..b39bc83282 100644
> --- a/xen/drivers/passthrough/vtd/intremap.c
> +++ b/xen/drivers/passthrough/vtd/intremap.c
> @@ -866,39 +866,3 @@ void cf_check intel_iommu_disable_eim(void)
>       for_each_drhd_unit ( drhd )
>           disable_qinval(drhd->iommu);
>   }
> -
> -/*
> - * This function is used to update the IRTE for posted-interrupt
> - * when guest changes MSI/MSI-X information.
> - */
> -int pi_update_irte(const struct pi_desc *pi_desc, const struct pirq *pirq,
> -    const uint8_t gvec)
> -{
> -    struct irq_desc *desc;
> -    struct msi_desc *msi_desc;
> -    int rc;
> -
> -    desc = pirq_spin_lock_irq_desc(pirq, NULL);
> -    if ( !desc )
> -        return -EINVAL;
> -
> -    msi_desc = desc->msi_desc;
> -    if ( !msi_desc )
> -    {
> -        rc = -ENODEV;
> -        goto unlock_out;
> -    }
> -    msi_desc->pi_desc = pi_desc;
> -    msi_desc->gvec = gvec;
> -
> -    spin_unlock_irq(&desc->lock);
> -
> -    ASSERT(pcidevs_locked());
> -
> -    return msi_msg_write_remap_rte(msi_desc, &msi_desc->msg);
> -
> - unlock_out:
> -    spin_unlock_irq(&desc->lock);
> -
> -    return rc;
> -}
> diff --git a/xen/drivers/passthrough/x86/hvm.c b/xen/drivers/passthrough/x86/hvm.c
> index a16e0e5344..e720461a14 100644
> --- a/xen/drivers/passthrough/x86/hvm.c
> +++ b/xen/drivers/passthrough/x86/hvm.c
> @@ -381,8 +381,7 @@ int pt_irq_create_bind(
>   
>           /* Use interrupt posting if it is supported. */
>           if ( iommu_intpost )
> -            pi_update_irte(vcpu ? &vcpu->arch.hvm.vmx.pi_desc : NULL,
> -                           info, pirq_dpci->gmsi.gvec);
> +            hvm_pi_update_irte(vcpu, info, pirq_dpci->gmsi.gvec);
>   
>           if ( pt_irq_bind->u.msi.gflags & XEN_DOMCTL_VMSI_X86_UNMASKED )
>           {
> @@ -672,7 +671,7 @@ int pt_irq_destroy_bind(
>               what = "bogus";
>       }
>       else if ( pirq_dpci && pirq_dpci->gmsi.posted )
> -        pi_update_irte(NULL, pirq, 0);
> +        hvm_pi_update_irte(NULL, pirq, 0);
>   
>       if ( pirq_dpci && (pirq_dpci->flags & HVM_IRQ_DPCI_MAPPED) &&
>            list_empty(&pirq_dpci->digl_list) )

-- 
Xenia

