Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9F7A77E28
	for <lists+xen-devel@lfdr.de>; Tue,  1 Apr 2025 16:47:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.934497.1336181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzcsz-000121-4n; Tue, 01 Apr 2025 14:46:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 934497.1336181; Tue, 01 Apr 2025 14:46:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzcsz-0000zf-25; Tue, 01 Apr 2025 14:46:41 +0000
Received: by outflank-mailman (input) for mailman id 934497;
 Tue, 01 Apr 2025 14:46:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WxAi=WT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tzcsy-0000zZ-3M
 for xen-devel@lists.xenproject.org; Tue, 01 Apr 2025 14:46:40 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1e152e2f-0f08-11f0-9ea7-5ba50f476ded;
 Tue, 01 Apr 2025 16:46:38 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-43cf628cb14so45626485e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 01 Apr 2025 07:46:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c0b663564sm14528233f8f.32.2025.04.01.07.46.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Apr 2025 07:46:37 -0700 (PDT)
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
X-Inumbo-ID: 1e152e2f-0f08-11f0-9ea7-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743518798; x=1744123598; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QHC15nd4PSRDca98Yxo67NkIO5WyxPw50y41IKl4czw=;
        b=XvFj+JoyC6+w4TCKE+Z34SseuUuN8JCcFzrfpNWT4X4WLzW/j0/zechzK4WYF3pvHC
         uQAob4lwtpBE8vfFp+VWYnEShXU0GKvdAM776tirVeTkF7QKvH0ob6/1asaA+TR5JfG2
         H6CDU+iRBZbcAMyro+gQoh7m/ipKeDMynhXmOIs4iF8Xe/Vb7jQi6Eajot5wcOAJT+P4
         BGAMGcyyqneIyvAIpl8Pb9XzKlSY50O7IGxvz41Xjmegj9wVXuOtF/V7F66pj4IE6JwD
         GjgET/RO/rYEfam1/DfrLShuhyF8K/n6CQfiUxZTIdD1wDeYwrBsuFIn/8lNcovI+b3Y
         2BOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743518798; x=1744123598;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QHC15nd4PSRDca98Yxo67NkIO5WyxPw50y41IKl4czw=;
        b=srspE93KYXR/6y4GgB54jh/5aOfNnOje/bCQ442yQsbeSoTwusm39cGRlGj3oTn6RJ
         9OdZq0SXM+ER4K9qDD+8UgHleX3hqkZ8xg+OiLejEobrT61U4utzs5YQM4DtFz/AwXFM
         CGJNRtJIB0YZneZzXN2atIgNxU2zLsKG3VLYGSiKbLirGhF6JTOVEhg7rz3OIlNga3gA
         EsHOqpJ6++1oAgna8bCkUA3Pc25yVp9G/1XNY8z4KR/J6LAOUrCWuP4sWvzYMvyDrTx1
         CxoLtbK3G7/bTff5W/fVX6CICc1k1yP81TwyVwvXSRCQ/IGzTbUh13cuFPAQGmQ9iiDt
         nH9g==
X-Forwarded-Encrypted: i=1; AJvYcCXNywcKNJpnYBNjOLvQ0fquAoR5/MClV03JqK7QvMXwMdYLVfCokGrMwhKRdlwjRh7eRXNBxQC2qM0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzfWBCo4c+Kxk8kNWz6wp69jNWxxE34S+dId0WUQFazA5GlEhnT
	yHmQAn4M3M/ywKwIeB9f/ayutDvmpuLks7taMoUci5ILmzPcg+jvHef2f6dboQ==
X-Gm-Gg: ASbGnctKBBs8bLpx6+skTvYGgrziacLjZXO6WTDDSw4ZabtM3OPAZICHYkGP2OxMJIz
	usR2AdPcdsQECjqtGCj6x2KVP1zEPX8sL/48sGPHvROpYNkNyQRszwdy0sql15oDJdiLyEqBx+o
	CyTBJFsEq3e80dgW2GOsvdXSxaE8fggps4wzT86WIWwieq+Z97yYfe4ysgChma+Z0efkv5GEQV0
	Pp1z5cuMlUHqLpYE41eKgDkxIsflr6UDuKKEdgEKZ+otWT34Amp15H2Bf5dZ4g7of5gTjIcVkwL
	GPguKxBAtxuzZAr95Od6lbwd8nI9UmmtWfeOdMRG1KCSW8ytSaM8XFoF7Pwg/REVlOPOIHnv5JG
	ImBgZW2LGGSXKcNVXBMKlOc03ftb7MQ==
X-Google-Smtp-Source: AGHT+IHE+b/ZTOWK3eX/p2/oof7eJfENe6egzrfirVdm3xS3y1AJ39nx8dx1Bj/KDMYDeQDjCQAOCg==
X-Received: by 2002:a05:6000:2281:b0:38d:dc03:a3d6 with SMTP id ffacd0b85a97d-39c27ee3659mr300851f8f.4.1743518798221;
        Tue, 01 Apr 2025 07:46:38 -0700 (PDT)
Message-ID: <33b166be-21db-473e-a59a-3779436c0494@suse.com>
Date: Tue, 1 Apr 2025 16:46:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 18/19] xen/sysctl: wrap around arch-specific
 arch_do_sysctl
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 Sergiy Kibrik <Sergiy_Kibrik@epam.com>, xen-devel@lists.xenproject.org
References: <20250326055053.3313146-1-Penny.Zheng@amd.com>
 <20250326055053.3313146-19-Penny.Zheng@amd.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <20250326055053.3313146-19-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.03.2025 06:50, Penny Zheng wrote:
> Function arch_do_sysctl is to perform arch-specific sysctl op.
> Some functions, like psr_get_info for x86, DTB overlay support for arm,
> are solely available through sysctl op, then they all shall be wrapped
> with CONFIG_SYSCTL
> Also, remove all #ifdef CONFIG_SYSCTL-s in arch-specific sysctl.c, as
> we put the guardian in Makefile for the whole file.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
> ---
> - use "depends on" for config OVERLAY_DTB
> - no need to wrap declaration
> - add transient #ifdef in sysctl.c for correct compilation
> ---
>  xen/arch/arm/Kconfig   |  1 +
>  xen/arch/arm/Makefile  |  2 +-
>  xen/arch/arm/sysctl.c  |  2 --
>  xen/arch/riscv/stubs.c |  2 +-
>  xen/arch/x86/Makefile  |  2 +-
>  xen/arch/x86/psr.c     | 18 ++++++++++++++++++
>  xen/arch/x86/sysctl.c  |  2 --
>  xen/common/sysctl.c    |  2 ++
>  8 files changed, 24 insertions(+), 7 deletions(-)
> 
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index ffdff1f0a3..aa1b4a6e6b 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -141,6 +141,7 @@ config HAS_ITS
>  
>  config OVERLAY_DTB
>  	bool "DTB overlay support (UNSUPPORTED)" if UNSUPPORTED
> +	depends on SYSCTL
>  	help
>  	  Dynamic addition/removal of Xen device tree nodes using a dtbo.
>  
> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
> index 4837ad467a..7c6015b84d 100644
> --- a/xen/arch/arm/Makefile
> +++ b/xen/arch/arm/Makefile
> @@ -54,7 +54,7 @@ obj-y += smpboot.o
>  obj-$(CONFIG_STATIC_EVTCHN) += static-evtchn.init.o
>  obj-$(CONFIG_STATIC_MEMORY) += static-memory.init.o
>  obj-$(CONFIG_STATIC_SHM) += static-shmem.init.o
> -obj-y += sysctl.o
> +obj-$(CONFIG_SYSCTL) += sysctl.o
>  obj-y += time.o
>  obj-y += traps.o
>  obj-y += vcpreg.o
> diff --git a/xen/arch/arm/sysctl.c b/xen/arch/arm/sysctl.c
> index 2d350b700a..32cab4feff 100644
> --- a/xen/arch/arm/sysctl.c
> +++ b/xen/arch/arm/sysctl.c
> @@ -15,7 +15,6 @@
>  #include <asm/arm64/sve.h>
>  #include <public/sysctl.h>
>  
> -#ifdef CONFIG_SYSCTL
>  void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
>  {
>      pi->capabilities |= XEN_SYSCTL_PHYSCAP_hvm | XEN_SYSCTL_PHYSCAP_hap;
> @@ -23,7 +22,6 @@ void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
>      pi->arch_capabilities |= MASK_INSR(sve_encode_vl(get_sys_vl_len()),
>                                         XEN_SYSCTL_PHYSCAP_ARM_SVE_MASK);
>  }
> -#endif
>  
>  long arch_do_sysctl(struct xen_sysctl *sysctl,
>                      XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
> diff --git a/xen/arch/riscv/stubs.c b/xen/arch/riscv/stubs.c
> index 7b3f748886..ae865e1972 100644
> --- a/xen/arch/riscv/stubs.c
> +++ b/xen/arch/riscv/stubs.c
> @@ -322,13 +322,13 @@ unsigned long raw_copy_from_guest(void *to, const void __user *from,
>  
>  /* sysctl.c */
>  
> +#ifdef CONFIG_SYSCTL
>  long arch_do_sysctl(struct xen_sysctl *sysctl,
>                      XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
>  {
>      BUG_ON("unimplemented");
>  }
>  
> -#ifdef CONFIG_SYSCTL
>  void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
>  {
>      BUG_ON("unimplemented");
> diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
> index f59c9665fd..837eafcbc0 100644
> --- a/xen/arch/x86/Makefile
> +++ b/xen/arch/x86/Makefile
> @@ -79,7 +79,7 @@ ifneq ($(CONFIG_PV_SHIM_EXCLUSIVE),y)
>  obj-y += domctl.o
>  obj-y += platform_hypercall.o
>  obj-$(CONFIG_COMPAT) += x86_64/platform_hypercall.o
> -obj-y += sysctl.o
> +obj-$(CONFIG_SYSCTL) += sysctl.o
>  endif

I think I had indicated before that this shouldn't stay inside the conditional,
but move back up. Whether that is to happen here or while addressing my
respective comment on patch 01 I can't easily tell.

> --- a/xen/common/sysctl.c
> +++ b/xen/common/sysctl.c
> @@ -490,8 +490,10 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
>          break;
>  
>      default:
> +#ifdef CONFIG_SYSCTL
>          ret = arch_do_sysctl(op, u_sysctl);
>          copyback = 0;
> +#endif
>          break;
>      }

This isn't enough. "ret" is 0 when reaching the default: label, but may not
stay 0 for the return from the function. I understand (expect) this is going to
be dropped again in the next patch, but even if only transiently needed this
should be kept correct imo. Things might be different if patch 02 introduced
the option without a prompt, i.e. always enabled. Then all the #ifdef-ary added
up to here would be merely syntactic sugar. In fact in that case you could omit
all the transient #ifdef that the last patch is going to remove again. Please
consider going that route.

Otherwise I think the #endif also needs moving up, for copyback to still be
cleared here.

Jan

