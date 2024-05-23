Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC9C8CD5F1
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2024 16:37:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.728586.1133557 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA9ZV-0001Gn-2Z; Thu, 23 May 2024 14:37:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 728586.1133557; Thu, 23 May 2024 14:37:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA9ZU-0001Dq-W4; Thu, 23 May 2024 14:37:32 +0000
Received: by outflank-mailman (input) for mailman id 728586;
 Thu, 23 May 2024 14:37:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bqPc=M2=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sA9ZT-0001Dk-PE
 for xen-devel@lists.xenproject.org; Thu, 23 May 2024 14:37:31 +0000
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com
 [2607:f8b0:4864:20::f36])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fb2afffa-1911-11ef-b4bb-af5377834399;
 Thu, 23 May 2024 16:37:29 +0200 (CEST)
Received: by mail-qv1-xf36.google.com with SMTP id
 6a1803df08f44-69b782287f9so11219686d6.0
 for <xen-devel@lists.xenproject.org>; Thu, 23 May 2024 07:37:29 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6a15f185787sm144487306d6.45.2024.05.23.07.37.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 May 2024 07:37:28 -0700 (PDT)
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
X-Inumbo-ID: fb2afffa-1911-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1716475048; x=1717079848; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vR9yvXuCCsbyLrcpWVWbYCim0WWirbw4WHo2dHfc/sY=;
        b=kU+f+1H/qqc/tC/NDylnbmwz1WgGns2MkfZdR7/oELvAoSdf5d40mQ4L2r0dpjUe4g
         DAhHOvMj0yljpLJLkqPrI4LdOD/h8oYIYZk5+R73P/4HndxESLY2DWx46fbzmfhEQLOG
         k0z/LKL4m9ycfYtdeQmeqLTar17xCqNqLFMpA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716475048; x=1717079848;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vR9yvXuCCsbyLrcpWVWbYCim0WWirbw4WHo2dHfc/sY=;
        b=aJGbDs8PA7QL16p6ofhtettvFpuGdx3ykUV45cH1RK0DPRCsGWkk/R3bAAEglO0lD9
         AClTWcVl9F7ShPxr7a+nQWRlN/p+fc6YYR/zK850xiXGnHV4bqhxj12jvl+a5fH7OYDc
         d+Me6hnNg7WB1ndlzTKUUEO1D8G0fcnSap6ZrgZ8+Kb440jU02dJXVzORxdyfiD9i9uB
         LaCxlxOfC8ZvmMlN2lF/FbFkJhhjhu/wFEQfh8XCdAtC2j03U9+V7C8Ii3NzfvfzdIHw
         TsVsPEulJFEbQ7zbS4LtGqoIG1ghos804zDNigUal32NOFzV9H0DRc5xga+vLQL6/F5l
         FVXg==
X-Gm-Message-State: AOJu0Yx4UCUSvvwXvHx0xJf1h7KQSYAKRjfBmXx4TTqtvXr6gvHhMJhr
	ysmcJE9tgHKCe4nIiBBOU9ze/iEr3IAoJ4kEMfVP98fXU9T4SM9SP4rpHHhdfwA=
X-Google-Smtp-Source: AGHT+IHUF0bpiHJdoF4nm36eJG60w2siviK6P4ncJvgfAEoDgXUISEGgb1vkS+oNXbDed9VTKl/+6Q==
X-Received: by 2002:a05:6214:5b0a:b0:6aa:7373:942c with SMTP id 6a1803df08f44-6ab7f363e3bmr67762676d6.25.1716475048462;
        Thu, 23 May 2024 07:37:28 -0700 (PDT)
Date: Thu, 23 May 2024 16:37:26 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 2/8] xen/x86: Simplify header dependencies in x86/hvm
Message-ID: <Zk9Upg9y03IYZEXd@macbook>
References: <cover.1715102098.git.alejandro.vallejo@cloud.com>
 <00ce7005d1d6db5c1ffc2d5023d34d4bd34ff841.1715102098.git.alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <00ce7005d1d6db5c1ffc2d5023d34d4bd34ff841.1715102098.git.alejandro.vallejo@cloud.com>

On Wed, May 08, 2024 at 01:39:21PM +0100, Alejandro Vallejo wrote:
> Otherwise it's not possible to call functions described in hvm/vlapic.h from the
> inline functions of hvm/hvm.h.
> 
> This is because a static inline in vlapic.h depends on hvm.h, and pulls it
> transitively through vpt.h. The ultimate cause is having hvm.h included in any
> of the "v*.h" headers, so break the cycle moving the guilty inline into hvm.h.
> 
> No functional change.
> 
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

One cosmetic comment below.

> ---
> v2:
>   * New patch. Prereq to moving vlapic_cpu_policy_changed() onto hvm.h
> ---
>  xen/arch/x86/hvm/irq.c                | 6 +++---
>  xen/arch/x86/hvm/vlapic.c             | 4 ++--
>  xen/arch/x86/include/asm/hvm/hvm.h    | 6 ++++++
>  xen/arch/x86/include/asm/hvm/vlapic.h | 6 ------
>  xen/arch/x86/include/asm/hvm/vpt.h    | 1 -
>  5 files changed, 11 insertions(+), 12 deletions(-)
> 
> diff --git a/xen/arch/x86/hvm/irq.c b/xen/arch/x86/hvm/irq.c
> index 4a9fe82cbd8d..4f5479b12c98 100644
> --- a/xen/arch/x86/hvm/irq.c
> +++ b/xen/arch/x86/hvm/irq.c
> @@ -512,13 +512,13 @@ struct hvm_intack hvm_vcpu_has_pending_irq(struct vcpu *v)
>      int vector;
>  
>      /*
> -     * Always call vlapic_sync_pir_to_irr so that PIR is synced into IRR when
> -     * using posted interrupts. Note this is also done by
> +     * Always call hvm_vlapic_sync_pir_to_irr so that PIR is synced into IRR
> +     * when using posted interrupts. Note this is also done by
>       * vlapic_has_pending_irq but depending on which interrupts are pending
>       * hvm_vcpu_has_pending_irq will return early without calling
>       * vlapic_has_pending_irq.
>       */
> -    vlapic_sync_pir_to_irr(v);
> +    hvm_vlapic_sync_pir_to_irr(v);
>  
>      if ( unlikely(v->arch.nmi_pending) )
>          return hvm_intack_nmi;
> diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
> index 61a96474006b..8a244100009c 100644
> --- a/xen/arch/x86/hvm/vlapic.c
> +++ b/xen/arch/x86/hvm/vlapic.c
> @@ -98,7 +98,7 @@ static void vlapic_clear_irr(int vector, struct vlapic *vlapic)
>  
>  static int vlapic_find_highest_irr(struct vlapic *vlapic)
>  {
> -    vlapic_sync_pir_to_irr(vlapic_vcpu(vlapic));
> +    hvm_vlapic_sync_pir_to_irr(vlapic_vcpu(vlapic));
>  
>      return vlapic_find_highest_vector(&vlapic->regs->data[APIC_IRR]);
>  }
> @@ -1516,7 +1516,7 @@ static int cf_check lapic_save_regs(struct vcpu *v, hvm_domain_context_t *h)
>      if ( !has_vlapic(v->domain) )
>          return 0;
>  
> -    vlapic_sync_pir_to_irr(v);
> +    hvm_vlapic_sync_pir_to_irr(v);
>  
>      return hvm_save_entry(LAPIC_REGS, v->vcpu_id, h, vcpu_vlapic(v)->regs);
>  }
> diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
> index e1f0585d75a9..84911f3ebcb4 100644
> --- a/xen/arch/x86/include/asm/hvm/hvm.h
> +++ b/xen/arch/x86/include/asm/hvm/hvm.h
> @@ -798,6 +798,12 @@ static inline void hvm_update_vlapic_mode(struct vcpu *v)
>          alternative_vcall(hvm_funcs.update_vlapic_mode, v);
>  }
>  
> +static inline void hvm_vlapic_sync_pir_to_irr(struct vcpu *v)
> +{
> +    if ( hvm_funcs.sync_pir_to_irr )
> +        alternative_vcall(hvm_funcs.sync_pir_to_irr, v);

Nit: for consistency the wrappers are usually named hvm_<hook_name>,
so in this case it would be hvm_sync_pir_to_irr(), or the hvm_funcs
field should be renamed to vlapic_sync_pir_to_irr.

Thanks, Roger.

