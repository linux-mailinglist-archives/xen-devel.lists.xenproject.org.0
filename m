Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6338DABF712
	for <lists+xen-devel@lfdr.de>; Wed, 21 May 2025 16:05:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.991899.1375699 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHk4F-0001j3-QU; Wed, 21 May 2025 14:05:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 991899.1375699; Wed, 21 May 2025 14:05:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHk4F-0001gw-Nk; Wed, 21 May 2025 14:05:11 +0000
Received: by outflank-mailman (input) for mailman id 991899;
 Wed, 21 May 2025 14:05:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/Cb8=YF=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uHk4E-0001gp-7z
 for xen-devel@lists.xenproject.org; Wed, 21 May 2025 14:05:10 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 98fe7b8a-364c-11f0-b892-0df219b8e170;
 Wed, 21 May 2025 16:05:06 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-442f4a3a4d6so44475845e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 21 May 2025 07:05:06 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-447f7ca2dd9sm68753125e9.37.2025.05.21.07.05.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 May 2025 07:05:05 -0700 (PDT)
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
X-Inumbo-ID: 98fe7b8a-364c-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747836305; x=1748441105; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+66ej0K2+ae/eb+TyFmQBQuJEpdUsCdPkCcZeb5MUno=;
        b=uzPY7SzxvS/6auN/nP+xQrAPFflZcfUC2+nZri0nHGFj4FjspTP0kdEfBt6VjKP5z1
         4oXBVl6mXOrorc3Hv7QOo2Rtgol/t/3HOB3wGBz2RaBsdzhSVNVfYUTTq4aa7pomte75
         oATRilAbwnBmizhy/K5gU6Tuer9GMpj9Dk+rA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747836305; x=1748441105;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+66ej0K2+ae/eb+TyFmQBQuJEpdUsCdPkCcZeb5MUno=;
        b=WqVzJkhqv91e8XvRjkadx843CcD4GNiVlibty90dwsvYXNdWbo5yhaJqdQx6ZJErAx
         nI6oQNsdgGNGU/qYUNuZqKX9URVMBN2vu/4wwjG4Ax/KDvdvLspagCTDz/CCeZmzCYXl
         ZUEvO0f23XosJImt6pUxos7CppOms36KvrTL0ngcbZ2F4kS961onUeN9/lOO69fd0yk+
         Yvyfwl+qivpXxPnYmW0KCbSUwOBFQjsun4AH50uhwOTQz1FaxOhhivigyKXFqLojhNHO
         edlDwsvNAoavj9HaR4nO5D2GPUo1/u4C9FrqwNdNWR6OgBoraD2GApecidcBF0ROs75f
         qvhg==
X-Gm-Message-State: AOJu0YyS/4fjBOvjWZLKjeBKtMxvF+6p4IudNAJm9zcDTKnuaTy/gLFN
	l/yA35p9xKHgH6tVytjj0cudPVmTCDHcqGeeNa6OUAivnuZBHhlBx/tY14vgsTBwK2o=
X-Gm-Gg: ASbGncufjJj5KB2isMQ+MF0tNIKk8bO1SxmPh8xeRcBgsQ71pJrthsXYobw4fqQk9LV
	mMKn3jRv7FagT8NIamaA0w+0rAj/29gYThs1Z0+tyjJ/Quzp40FexpSVDGS+ODy1YaLFcVIamha
	+cTgpwkPEqpIzPIssXS/f3y9Ya8XprJithgrC8SFdOuvyuppvYQ57H/e6orC6VbvyveWwImTvVi
	RNBKIYiPuKDjrCXq4B94LB6SfFn7sw/ZS7Hy5ONTaVri/R2NnIqf9X15THzWMGQ4ObVcyLjzcED
	V0kcBFnzU1IjD02lGn9OJuP24tOfKWb4Og0TQtSZomg3uzI2msl06yWbx2DrxsulOcUCtrRjmnr
	a/rU6jIXChPbaRBCIGkUx7bke
X-Google-Smtp-Source: AGHT+IGUOjBoJzBpZ1MW0VPvNs7SXUG/tUm3xzT4ztIDN7oe8wChxo6jh+7fbSdPAjF9I7LME8Qbew==
X-Received: by 2002:a05:600c:1e09:b0:442:cd12:c68a with SMTP id 5b1f17b1804b1-442fd935c8emr198158225e9.1.1747836305449;
        Wed, 21 May 2025 07:05:05 -0700 (PDT)
Date: Wed, 21 May 2025 16:05:04 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
	anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org,
	michal.orzel@amd.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: Re: [PATCH v2 1/2] xen/domain: introduce non-x86 hardware emulation
 flags
Message-ID: <aC3dkKyiIHRF8YO1@macbook.local>
References: <20250516022855.1146121-1-dmukhin@ford.com>
 <20250516022855.1146121-2-dmukhin@ford.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250516022855.1146121-2-dmukhin@ford.com>

On Fri, May 16, 2025 at 02:29:09AM +0000, dmkhn@proton.me wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> Define per-architecture emulation_flags for configuring domain emulation
> features.
> 
> Print d->arch.emulation_flags from 'q' keyhandler for better traceability
> while debugging.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
> Changes since v1:
> - dropped comments
> ---
>  xen/arch/arm/include/asm/domain.h   | 1 +
>  xen/arch/ppc/include/asm/domain.h   | 1 +
>  xen/arch/riscv/include/asm/domain.h | 1 +
>  xen/common/keyhandler.c             | 1 +
>  4 files changed, 4 insertions(+)
> 
> diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
> index a3487ca713..70e6e7d49b 100644
> --- a/xen/arch/arm/include/asm/domain.h
> +++ b/xen/arch/arm/include/asm/domain.h
> @@ -121,6 +121,7 @@ struct arch_domain
>      void *tee;
>  #endif
>  
> +    uint32_t emulation_flags;
>  }  __cacheline_aligned;
>  
>  struct arch_vcpu
> diff --git a/xen/arch/ppc/include/asm/domain.h b/xen/arch/ppc/include/asm/domain.h
> index 3a447272c6..001116a0ab 100644
> --- a/xen/arch/ppc/include/asm/domain.h
> +++ b/xen/arch/ppc/include/asm/domain.h
> @@ -21,6 +21,7 @@ struct arch_vcpu {
>  
>  struct arch_domain {
>      struct hvm_domain hvm;
> +    uint32_t emulation_flags;
>  };
>  
>  #include <xen/sched.h>
> diff --git a/xen/arch/riscv/include/asm/domain.h b/xen/arch/riscv/include/asm/domain.h
> index c3d965a559..7bc242da55 100644
> --- a/xen/arch/riscv/include/asm/domain.h
> +++ b/xen/arch/riscv/include/asm/domain.h
> @@ -18,6 +18,7 @@ struct arch_vcpu {
>  
>  struct arch_domain {
>      struct hvm_domain hvm;
> +    uint32_t emulation_flags;
>  };
>  
>  #include <xen/sched.h>
> diff --git a/xen/common/keyhandler.c b/xen/common/keyhandler.c
> index 0bb842ec00..73f5134b68 100644
> --- a/xen/common/keyhandler.c
> +++ b/xen/common/keyhandler.c
> @@ -306,6 +306,7 @@ static void cf_check dump_domains(unsigned char key)
>              if ( test_bit(i, &d->watchdog_inuse_map) )
>                  printk("    watchdog %d expires in %d seconds\n",
>                         i, (u32)((d->watchdog_timer[i].expires - NOW()) >> 30));
> +        printk("    emulation_flags %#x\n", d->arch.emulation_flags);
>  
>          arch_dump_domain_info(d);

Hello,

I think it might be easier to print emulation_flags in
arch_dump_domain_info(), ideally it would be helpful if this could be
printed in a user friendly way apart from the raw dump:

printk("    emulation_flags:%s%s... (%#x)\n",
       !d->arch.emulation_flags ? " none" : "",
       has_vlapic(d) ? " lapic" : "", ...
       d->arch.emulation_flags);

Regards, Roger.

