Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7C8A72CA3
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 10:39:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.928815.1331473 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txjhh-0002zz-Gg; Thu, 27 Mar 2025 09:39:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 928815.1331473; Thu, 27 Mar 2025 09:39:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txjhh-0002xs-DR; Thu, 27 Mar 2025 09:39:13 +0000
Received: by outflank-mailman (input) for mailman id 928815;
 Thu, 27 Mar 2025 09:39:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Eznr=WO=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1txjhf-0002xl-Nd
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 09:39:11 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 54b6c083-0aef-11f0-9ea3-5ba50f476ded;
 Thu, 27 Mar 2025 10:39:08 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5e5c7d6b96fso1419144a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Mar 2025 02:39:08 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac3efd23c70sm1203933966b.149.2025.03.27.02.39.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Mar 2025 02:39:07 -0700 (PDT)
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
X-Inumbo-ID: 54b6c083-0aef-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743068348; x=1743673148; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hTi8TVr/dkSt1gpQ9AKl4C/K60rIzFwAyjKLnsC0X5w=;
        b=h1iuBHOsChZlHdO39osHWZkOt1oqXbft5sGEAryyu1VqJCn3QzvoDogn3argqT1ved
         XpytNmtYk5rVACb9VgWc0oeYJI1sqokj7tzd0RwgyFT5ZRfwkrMAqVmFrPjYkzN+cgzV
         P+DQ2hZuTUDQJiBUEeFITT4f87RK45LX0gJPZx9MVIj6uoLRIKPQM7tnW+NDeUDbwCzx
         fgspo5Jow+BGIOTKrv0nYrRzaZ8BZWWA85IZEkyjUNoS5KKkwnoUfWsSWT2/0M7xfqvG
         QDND+ouMxbmdSV9DPm41R8QJ6gfsshXp8ra45pHFYPs3Qdl8aRFRVZudrwAgMPkRGvEt
         1ofQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743068348; x=1743673148;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hTi8TVr/dkSt1gpQ9AKl4C/K60rIzFwAyjKLnsC0X5w=;
        b=qsMwuK7PuTfL1QJkTZaXjR1ttfsxxtu4qn/m0xsPbc4lofx0sl2e2SWRg0ZlrLqcXk
         wj0LJAVT3pGtuYcWgTn08Wzwgn/1NgMWIRw0YU9gWP4GXHJ7ZndYY+N3bIn4r1Q9B8dF
         4F3eCSUVlkq/6XxuvgMMyGGIRqbPbUCM2akPd95FuoqwMm7SYwPAm/tif9TW5QI2Feme
         MDPtJ8qy8dh5U1qCHS+X2d4QHD2iFc6OPBEQ39WhvqO5s4seT3VRAhhCS48DjQzF/ONh
         7X0aG+gFC4mA9nR2k7e4uJN/NzGTO8mWe4tkPCEyTjKRSTOaUPtQZAt3YEk2zKm2+Hs/
         ctTw==
X-Forwarded-Encrypted: i=1; AJvYcCUFKrjFDTAn2bENTeetrAVhsndrWqm9rYi/TXVqwjxMEnI7ciRglrxUmIhnaDSi5xNtHHDXYGJ5it0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywg6br30pgddbbCSbNIA930DMPPQnZNOe2lh5LXNNtqdgte58SZ
	6IpKytJTlx61qZHvvpsCazE3q+sYt2pEcXY0qBijRrggHJRMjQwb
X-Gm-Gg: ASbGncut1oyiif9v32jEfHImX3ka73fS/fdGRDIlUrGsXjFq2QOfOPtiEeWxBUP8EN0
	ConnA84KpAu1lQrIhp76jKiJ3DdIa4ZiirZcLGcwjtyfrotXfNHX9Z0jNnMd+XZ/oZga3f/mXU+
	61OM/YPDVIhOBWtSbknTjHA+Ih3LNStUuQBmpUiOCNc2VZu7kVcOmRWoMbTXSndIYd0TWsELJWJ
	7FKvbkkZEaYBmKKFSKmiX24pQZ4ODO7EwtwULudFF4tTUIdYq/ytTDxCqXsqtkzEnrEH+Jz6V95
	hb7ktLDr0AP4hBVLFe5tdTqlNZ5nXxkjnsEtFIfETcN7x9R0O4Sipv34tfxdpHWeY/ADv9gWB6Q
	Ietf4g3Eisf/sXFhbp5fx
X-Google-Smtp-Source: AGHT+IEhotCLr3oNxtl5qFcVT63uqR/alAeOxqd9ggxtqUFbP+jVLmyhnx0S1E/SXGt9FEDfaQNNrg==
X-Received: by 2002:a17:907:944d:b0:ac4:2b0:216f with SMTP id a640c23a62f3a-ac6fb148ddemr234931966b.43.1743068347530;
        Thu, 27 Mar 2025 02:39:07 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------ihmxo806nPx0GHUv0oeQqsF0"
Message-ID: <dd9731ce-3cf4-46ce-8f3c-e40b09d76313@gmail.com>
Date: Thu, 27 Mar 2025 10:39:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 18/19] xen/sysctl: wrap around arch-specific
 arch_do_sysctl
To: Penny Zheng <Penny.Zheng@amd.com>, xen-devel@lists.xenproject.org
Cc: ray.huang@amd.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Stefano Stabellini <stefano.stabellini@amd.com>,
 Sergiy Kibrik <Sergiy_Kibrik@epam.com>
References: <20250326055053.3313146-1-Penny.Zheng@amd.com>
 <20250326055053.3313146-19-Penny.Zheng@amd.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20250326055053.3313146-19-Penny.Zheng@amd.com>

This is a multi-part message in MIME format.
--------------ihmxo806nPx0GHUv0oeQqsF0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 3/26/25 6:50 AM, Penny Zheng wrote:
> Function arch_do_sysctl is to perform arch-specific sysctl op.
> Some functions, like psr_get_info for x86, DTB overlay support for arm,
> are solely available through sysctl op, then they all shall be wrapped
> with CONFIG_SYSCTL
> Also, remove all #ifdef CONFIG_SYSCTL-s in arch-specific sysctl.c, as
> we put the guardian in Makefile for the whole file.
>
> Signed-off-by: Stefano Stabellini<stefano.stabellini@amd.com>
> Signed-off-by: Sergiy Kibrik<Sergiy_Kibrik@epam.com>
> Signed-off-by: Penny Zheng<Penny.Zheng@amd.com>
> ---
> - use "depends on" for config OVERLAY_DTB
> - no need to wrap declaration
> - add transient #ifdef in sysctl.c for correct compilation
> ---
>   xen/arch/arm/Kconfig   |  1 +
>   xen/arch/arm/Makefile  |  2 +-
>   xen/arch/arm/sysctl.c  |  2 --
>   xen/arch/riscv/stubs.c |  2 +-
>   xen/arch/x86/Makefile  |  2 +-
>   xen/arch/x86/psr.c     | 18 ++++++++++++++++++
>   xen/arch/x86/sysctl.c  |  2 --
>   xen/common/sysctl.c    |  2 ++
>   8 files changed, 24 insertions(+), 7 deletions(-)
>
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index ffdff1f0a3..aa1b4a6e6b 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -141,6 +141,7 @@ config HAS_ITS
>   
>   config OVERLAY_DTB
>   	bool "DTB overlay support (UNSUPPORTED)" if UNSUPPORTED
> +	depends on SYSCTL
>   	help
>   	  Dynamic addition/removal of Xen device tree nodes using a dtbo.
>   
> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
> index 4837ad467a..7c6015b84d 100644
> --- a/xen/arch/arm/Makefile
> +++ b/xen/arch/arm/Makefile
> @@ -54,7 +54,7 @@ obj-y += smpboot.o
>   obj-$(CONFIG_STATIC_EVTCHN) += static-evtchn.init.o
>   obj-$(CONFIG_STATIC_MEMORY) += static-memory.init.o
>   obj-$(CONFIG_STATIC_SHM) += static-shmem.init.o
> -obj-y += sysctl.o
> +obj-$(CONFIG_SYSCTL) += sysctl.o
>   obj-y += time.o
>   obj-y += traps.o
>   obj-y += vcpreg.o
> diff --git a/xen/arch/arm/sysctl.c b/xen/arch/arm/sysctl.c
> index 2d350b700a..32cab4feff 100644
> --- a/xen/arch/arm/sysctl.c
> +++ b/xen/arch/arm/sysctl.c
> @@ -15,7 +15,6 @@
>   #include <asm/arm64/sve.h>
>   #include <public/sysctl.h>
>   
> -#ifdef CONFIG_SYSCTL
>   void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
>   {
>       pi->capabilities |= XEN_SYSCTL_PHYSCAP_hvm | XEN_SYSCTL_PHYSCAP_hap;
> @@ -23,7 +22,6 @@ void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
>       pi->arch_capabilities |= MASK_INSR(sve_encode_vl(get_sys_vl_len()),
>                                          XEN_SYSCTL_PHYSCAP_ARM_SVE_MASK);
>   }
> -#endif
>   
>   long arch_do_sysctl(struct xen_sysctl *sysctl,
>                       XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
> diff --git a/xen/arch/riscv/stubs.c b/xen/arch/riscv/stubs.c
> index 7b3f748886..ae865e1972 100644
> --- a/xen/arch/riscv/stubs.c
> +++ b/xen/arch/riscv/stubs.c
> @@ -322,13 +322,13 @@ unsigned long raw_copy_from_guest(void *to, const void __user *from,
>   
>   /* sysctl.c */
>   
> +#ifdef CONFIG_SYSCTL
>   long arch_do_sysctl(struct xen_sysctl *sysctl,
>                       XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
>   {
>       BUG_ON("unimplemented");
>   }

The same as in the previous patch. We can just drop this function for RISC-V as now we
have CONFIG_SYSCTL. This stub was introduced only to make common code build for RISC-V happy.

Thanks.

~ Oleksii

>   
> -#ifdef CONFIG_SYSCTL
>   void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
>   {
>       BUG_ON("unimplemented");
> diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
> index f59c9665fd..837eafcbc0 100644
> --- a/xen/arch/x86/Makefile
> +++ b/xen/arch/x86/Makefile
> @@ -79,7 +79,7 @@ ifneq ($(CONFIG_PV_SHIM_EXCLUSIVE),y)
>   obj-y += domctl.o
>   obj-y += platform_hypercall.o
>   obj-$(CONFIG_COMPAT) += x86_64/platform_hypercall.o
> -obj-y += sysctl.o
> +obj-$(CONFIG_SYSCTL) += sysctl.o
>   endif
>   
>   extra-y += asm-macros.i
> diff --git a/xen/arch/x86/psr.c b/xen/arch/x86/psr.c
> index 5815a35335..499d320e61 100644
> --- a/xen/arch/x86/psr.c
> +++ b/xen/arch/x86/psr.c
> @@ -133,9 +133,11 @@ static const struct feat_props {
>        */
>       enum psr_type alt_type;
>   
> +#ifdef CONFIG_SYSCTL
>       /* get_feat_info is used to return feature HW info through sysctl. */
>       bool (*get_feat_info)(const struct feat_node *feat,
>                             uint32_t data[], unsigned int array_len);
> +#endif
>   
>       /* write_msr is used to write out feature MSR register. */
>       void (*write_msr)(unsigned int cos, uint32_t val, enum psr_type type);
> @@ -418,6 +420,7 @@ static bool mba_init_feature(const struct cpuid_leaf *regs,
>       return true;
>   }
>   
> +#ifdef CONFIG_SYSCTL
>   static bool cf_check cat_get_feat_info(
>       const struct feat_node *feat, uint32_t data[], unsigned int array_len)
>   {
> @@ -430,6 +433,7 @@ static bool cf_check cat_get_feat_info(
>   
>       return true;
>   }
> +#endif /* CONFIG_SYSCTL */
>   
>   /* L3 CAT props */
>   static void cf_check l3_cat_write_msr(
> @@ -442,11 +446,14 @@ static const struct feat_props l3_cat_props = {
>       .cos_num = 1,
>       .type[0] = PSR_TYPE_L3_CBM,
>       .alt_type = PSR_TYPE_UNKNOWN,
> +#ifdef CONFIG_SYSCTL
>       .get_feat_info = cat_get_feat_info,
> +#endif
>       .write_msr = l3_cat_write_msr,
>       .sanitize = cat_check_cbm,
>   };
>   
> +#ifdef CONFIG_SYSCTL
>   /* L3 CDP props */
>   static bool cf_check l3_cdp_get_feat_info(
>       const struct feat_node *feat, uint32_t data[], uint32_t array_len)
> @@ -458,6 +465,7 @@ static bool cf_check l3_cdp_get_feat_info(
>   
>       return true;
>   }
> +#endif /* CONFIG_SYSCTL */
>   
>   static void cf_check l3_cdp_write_msr(
>       unsigned int cos, uint32_t val, enum psr_type type)
> @@ -473,7 +481,9 @@ static const struct feat_props l3_cdp_props = {
>       .type[0] = PSR_TYPE_L3_DATA,
>       .type[1] = PSR_TYPE_L3_CODE,
>       .alt_type = PSR_TYPE_L3_CBM,
> +#ifdef CONFIG_SYSCTL
>       .get_feat_info = l3_cdp_get_feat_info,
> +#endif
>       .write_msr = l3_cdp_write_msr,
>       .sanitize = cat_check_cbm,
>   };
> @@ -489,11 +499,14 @@ static const struct feat_props l2_cat_props = {
>       .cos_num = 1,
>       .type[0] = PSR_TYPE_L2_CBM,
>       .alt_type = PSR_TYPE_UNKNOWN,
> +#ifdef CONFIG_SYSCTL
>       .get_feat_info = cat_get_feat_info,
> +#endif
>       .write_msr = l2_cat_write_msr,
>       .sanitize = cat_check_cbm,
>   };
>   
> +#ifdef CONFIG_SYSCTL
>   /* MBA props */
>   static bool cf_check mba_get_feat_info(
>       const struct feat_node *feat, uint32_t data[], unsigned int array_len)
> @@ -508,6 +521,7 @@ static bool cf_check mba_get_feat_info(
>   
>       return true;
>   }
> +#endif /* CONFIG_SYSCTL */
>   
>   static void cf_check mba_write_msr(
>       unsigned int cos, uint32_t val, enum psr_type type)
> @@ -545,7 +559,9 @@ static const struct feat_props mba_props = {
>       .cos_num = 1,
>       .type[0] = PSR_TYPE_MBA_THRTL,
>       .alt_type = PSR_TYPE_UNKNOWN,
> +#ifdef CONFIG_SYSCTL
>       .get_feat_info = mba_get_feat_info,
> +#endif
>       .write_msr = mba_write_msr,
>       .sanitize = mba_sanitize_thrtl,
>   };
> @@ -808,6 +824,7 @@ static struct psr_socket_info *get_socket_info(unsigned int socket)
>       return socket_info + socket;
>   }
>   
> +#ifdef CONFIG_SYSCTL
>   int psr_get_info(unsigned int socket, enum psr_type type,
>                    uint32_t data[], unsigned int array_len)
>   {
> @@ -839,6 +856,7 @@ int psr_get_info(unsigned int socket, enum psr_type type,
>   
>       return -EINVAL;
>   }
> +#endif /* CONFIG_SYSCTL */
>   
>   int psr_get_val(struct domain *d, unsigned int socket,
>                   uint32_t *val, enum psr_type type)
> diff --git a/xen/arch/x86/sysctl.c b/xen/arch/x86/sysctl.c
> index d7da476379..1b04947516 100644
> --- a/xen/arch/x86/sysctl.c
> +++ b/xen/arch/x86/sysctl.c
> @@ -91,7 +91,6 @@ static long cf_check smt_up_down_helper(void *data)
>       return ret;
>   }
>   
> -#ifdef CONFIG_SYSCTL
>   void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
>   {
>       memcpy(pi->hw_cap, boot_cpu_data.x86_capability,
> @@ -105,7 +104,6 @@ void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
>       if ( IS_ENABLED(CONFIG_SHADOW_PAGING) )
>           pi->capabilities |= XEN_SYSCTL_PHYSCAP_shadow;
>   }
> -#endif
>   
>   long arch_do_sysctl(
>       struct xen_sysctl *sysctl, XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
> diff --git a/xen/common/sysctl.c b/xen/common/sysctl.c
> index 76622503e2..b0e2e43c7e 100644
> --- a/xen/common/sysctl.c
> +++ b/xen/common/sysctl.c
> @@ -490,8 +490,10 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
>           break;
>   
>       default:
> +#ifdef CONFIG_SYSCTL
>           ret = arch_do_sysctl(op, u_sysctl);
>           copyback = 0;
> +#endif
>           break;
>       }
>   
--------------ihmxo806nPx0GHUv0oeQqsF0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 3/26/25 6:50 AM, Penny Zheng wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20250326055053.3313146-19-Penny.Zheng@amd.com">
      <pre wrap="" class="moz-quote-pre">Function arch_do_sysctl is to perform arch-specific sysctl op.
Some functions, like psr_get_info for x86, DTB overlay support for arm,
are solely available through sysctl op, then they all shall be wrapped
with CONFIG_SYSCTL
Also, remove all #ifdef CONFIG_SYSCTL-s in arch-specific sysctl.c, as
we put the guardian in Makefile for the whole file.

Signed-off-by: Stefano Stabellini <a class="moz-txt-link-rfc2396E" href="mailto:stefano.stabellini@amd.com">&lt;stefano.stabellini@amd.com&gt;</a>
Signed-off-by: Sergiy Kibrik <a class="moz-txt-link-rfc2396E" href="mailto:Sergiy_Kibrik@epam.com">&lt;Sergiy_Kibrik@epam.com&gt;</a>
Signed-off-by: Penny Zheng <a class="moz-txt-link-rfc2396E" href="mailto:Penny.Zheng@amd.com">&lt;Penny.Zheng@amd.com&gt;</a>
---
- use "depends on" for config OVERLAY_DTB
- no need to wrap declaration
- add transient #ifdef in sysctl.c for correct compilation
---
 xen/arch/arm/Kconfig   |  1 +
 xen/arch/arm/Makefile  |  2 +-
 xen/arch/arm/sysctl.c  |  2 --
 xen/arch/riscv/stubs.c |  2 +-
 xen/arch/x86/Makefile  |  2 +-
 xen/arch/x86/psr.c     | 18 ++++++++++++++++++
 xen/arch/x86/sysctl.c  |  2 --
 xen/common/sysctl.c    |  2 ++
 8 files changed, 24 insertions(+), 7 deletions(-)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index ffdff1f0a3..aa1b4a6e6b 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -141,6 +141,7 @@ config HAS_ITS
 
 config OVERLAY_DTB
 	bool "DTB overlay support (UNSUPPORTED)" if UNSUPPORTED
+	depends on SYSCTL
 	help
 	  Dynamic addition/removal of Xen device tree nodes using a dtbo.
 
diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index 4837ad467a..7c6015b84d 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -54,7 +54,7 @@ obj-y += smpboot.o
 obj-$(CONFIG_STATIC_EVTCHN) += static-evtchn.init.o
 obj-$(CONFIG_STATIC_MEMORY) += static-memory.init.o
 obj-$(CONFIG_STATIC_SHM) += static-shmem.init.o
-obj-y += sysctl.o
+obj-$(CONFIG_SYSCTL) += sysctl.o
 obj-y += time.o
 obj-y += traps.o
 obj-y += vcpreg.o
diff --git a/xen/arch/arm/sysctl.c b/xen/arch/arm/sysctl.c
index 2d350b700a..32cab4feff 100644
--- a/xen/arch/arm/sysctl.c
+++ b/xen/arch/arm/sysctl.c
@@ -15,7 +15,6 @@
 #include &lt;asm/arm64/sve.h&gt;
 #include &lt;public/sysctl.h&gt;
 
-#ifdef CONFIG_SYSCTL
 void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
 {
     pi-&gt;capabilities |= XEN_SYSCTL_PHYSCAP_hvm | XEN_SYSCTL_PHYSCAP_hap;
@@ -23,7 +22,6 @@ void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
     pi-&gt;arch_capabilities |= MASK_INSR(sve_encode_vl(get_sys_vl_len()),
                                        XEN_SYSCTL_PHYSCAP_ARM_SVE_MASK);
 }
-#endif
 
 long arch_do_sysctl(struct xen_sysctl *sysctl,
                     XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
diff --git a/xen/arch/riscv/stubs.c b/xen/arch/riscv/stubs.c
index 7b3f748886..ae865e1972 100644
--- a/xen/arch/riscv/stubs.c
+++ b/xen/arch/riscv/stubs.c
@@ -322,13 +322,13 @@ unsigned long raw_copy_from_guest(void *to, const void __user *from,
 
 /* sysctl.c */
 
+#ifdef CONFIG_SYSCTL
 long arch_do_sysctl(struct xen_sysctl *sysctl,
                     XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
 {
     BUG_ON("unimplemented");
 }</pre>
    </blockquote>
    <pre>The same as in the previous patch. We can just drop this function for RISC-V as now we
have CONFIG_SYSCTL. This stub was introduced only to make common code build for RISC-V happy.

Thanks.

~ Oleksii
</pre>
    <blockquote type="cite"
      cite="mid:20250326055053.3313146-19-Penny.Zheng@amd.com">
      <pre wrap="" class="moz-quote-pre">
 
-#ifdef CONFIG_SYSCTL
 void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
 {
     BUG_ON("unimplemented");
diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index f59c9665fd..837eafcbc0 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -79,7 +79,7 @@ ifneq ($(CONFIG_PV_SHIM_EXCLUSIVE),y)
 obj-y += domctl.o
 obj-y += platform_hypercall.o
 obj-$(CONFIG_COMPAT) += x86_64/platform_hypercall.o
-obj-y += sysctl.o
+obj-$(CONFIG_SYSCTL) += sysctl.o
 endif
 
 extra-y += asm-macros.i
diff --git a/xen/arch/x86/psr.c b/xen/arch/x86/psr.c
index 5815a35335..499d320e61 100644
--- a/xen/arch/x86/psr.c
+++ b/xen/arch/x86/psr.c
@@ -133,9 +133,11 @@ static const struct feat_props {
      */
     enum psr_type alt_type;
 
+#ifdef CONFIG_SYSCTL
     /* get_feat_info is used to return feature HW info through sysctl. */
     bool (*get_feat_info)(const struct feat_node *feat,
                           uint32_t data[], unsigned int array_len);
+#endif
 
     /* write_msr is used to write out feature MSR register. */
     void (*write_msr)(unsigned int cos, uint32_t val, enum psr_type type);
@@ -418,6 +420,7 @@ static bool mba_init_feature(const struct cpuid_leaf *regs,
     return true;
 }
 
+#ifdef CONFIG_SYSCTL
 static bool cf_check cat_get_feat_info(
     const struct feat_node *feat, uint32_t data[], unsigned int array_len)
 {
@@ -430,6 +433,7 @@ static bool cf_check cat_get_feat_info(
 
     return true;
 }
+#endif /* CONFIG_SYSCTL */
 
 /* L3 CAT props */
 static void cf_check l3_cat_write_msr(
@@ -442,11 +446,14 @@ static const struct feat_props l3_cat_props = {
     .cos_num = 1,
     .type[0] = PSR_TYPE_L3_CBM,
     .alt_type = PSR_TYPE_UNKNOWN,
+#ifdef CONFIG_SYSCTL
     .get_feat_info = cat_get_feat_info,
+#endif
     .write_msr = l3_cat_write_msr,
     .sanitize = cat_check_cbm,
 };
 
+#ifdef CONFIG_SYSCTL
 /* L3 CDP props */
 static bool cf_check l3_cdp_get_feat_info(
     const struct feat_node *feat, uint32_t data[], uint32_t array_len)
@@ -458,6 +465,7 @@ static bool cf_check l3_cdp_get_feat_info(
 
     return true;
 }
+#endif /* CONFIG_SYSCTL */
 
 static void cf_check l3_cdp_write_msr(
     unsigned int cos, uint32_t val, enum psr_type type)
@@ -473,7 +481,9 @@ static const struct feat_props l3_cdp_props = {
     .type[0] = PSR_TYPE_L3_DATA,
     .type[1] = PSR_TYPE_L3_CODE,
     .alt_type = PSR_TYPE_L3_CBM,
+#ifdef CONFIG_SYSCTL
     .get_feat_info = l3_cdp_get_feat_info,
+#endif
     .write_msr = l3_cdp_write_msr,
     .sanitize = cat_check_cbm,
 };
@@ -489,11 +499,14 @@ static const struct feat_props l2_cat_props = {
     .cos_num = 1,
     .type[0] = PSR_TYPE_L2_CBM,
     .alt_type = PSR_TYPE_UNKNOWN,
+#ifdef CONFIG_SYSCTL
     .get_feat_info = cat_get_feat_info,
+#endif
     .write_msr = l2_cat_write_msr,
     .sanitize = cat_check_cbm,
 };
 
+#ifdef CONFIG_SYSCTL
 /* MBA props */
 static bool cf_check mba_get_feat_info(
     const struct feat_node *feat, uint32_t data[], unsigned int array_len)
@@ -508,6 +521,7 @@ static bool cf_check mba_get_feat_info(
 
     return true;
 }
+#endif /* CONFIG_SYSCTL */
 
 static void cf_check mba_write_msr(
     unsigned int cos, uint32_t val, enum psr_type type)
@@ -545,7 +559,9 @@ static const struct feat_props mba_props = {
     .cos_num = 1,
     .type[0] = PSR_TYPE_MBA_THRTL,
     .alt_type = PSR_TYPE_UNKNOWN,
+#ifdef CONFIG_SYSCTL
     .get_feat_info = mba_get_feat_info,
+#endif
     .write_msr = mba_write_msr,
     .sanitize = mba_sanitize_thrtl,
 };
@@ -808,6 +824,7 @@ static struct psr_socket_info *get_socket_info(unsigned int socket)
     return socket_info + socket;
 }
 
+#ifdef CONFIG_SYSCTL
 int psr_get_info(unsigned int socket, enum psr_type type,
                  uint32_t data[], unsigned int array_len)
 {
@@ -839,6 +856,7 @@ int psr_get_info(unsigned int socket, enum psr_type type,
 
     return -EINVAL;
 }
+#endif /* CONFIG_SYSCTL */
 
 int psr_get_val(struct domain *d, unsigned int socket,
                 uint32_t *val, enum psr_type type)
diff --git a/xen/arch/x86/sysctl.c b/xen/arch/x86/sysctl.c
index d7da476379..1b04947516 100644
--- a/xen/arch/x86/sysctl.c
+++ b/xen/arch/x86/sysctl.c
@@ -91,7 +91,6 @@ static long cf_check smt_up_down_helper(void *data)
     return ret;
 }
 
-#ifdef CONFIG_SYSCTL
 void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
 {
     memcpy(pi-&gt;hw_cap, boot_cpu_data.x86_capability,
@@ -105,7 +104,6 @@ void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
     if ( IS_ENABLED(CONFIG_SHADOW_PAGING) )
         pi-&gt;capabilities |= XEN_SYSCTL_PHYSCAP_shadow;
 }
-#endif
 
 long arch_do_sysctl(
     struct xen_sysctl *sysctl, XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
diff --git a/xen/common/sysctl.c b/xen/common/sysctl.c
index 76622503e2..b0e2e43c7e 100644
--- a/xen/common/sysctl.c
+++ b/xen/common/sysctl.c
@@ -490,8 +490,10 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
         break;
 
     default:
+#ifdef CONFIG_SYSCTL
         ret = arch_do_sysctl(op, u_sysctl);
         copyback = 0;
+#endif
         break;
     }
 
</pre>
    </blockquote>
  </body>
</html>

--------------ihmxo806nPx0GHUv0oeQqsF0--

