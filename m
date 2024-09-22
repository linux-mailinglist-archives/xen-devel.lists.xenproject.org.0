Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB5C97E07E
	for <lists+xen-devel@lfdr.de>; Sun, 22 Sep 2024 10:00:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.801480.1211449 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssHUg-0001Xo-Gh; Sun, 22 Sep 2024 07:58:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 801480.1211449; Sun, 22 Sep 2024 07:58:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssHUg-0001V6-Di; Sun, 22 Sep 2024 07:58:58 +0000
Received: by outflank-mailman (input) for mailman id 801480;
 Sun, 22 Sep 2024 07:58:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ssHUf-0001V0-6O
 for xen-devel@lists.xenproject.org; Sun, 22 Sep 2024 07:58:57 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ssHUe-0006Nv-O8; Sun, 22 Sep 2024 07:58:56 +0000
Received: from 90-181-218-29.rco.o2.cz ([90.181.218.29] helo=[10.5.48.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ssHUe-0000b5-DB; Sun, 22 Sep 2024 07:58:56 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=NgdmaZJYy+kP+W2IitHtZkx3xqvhn0YKrsefT3ljvB4=; b=hxQ7KK7HpE0LakHv2rnmlQbjK0
	HTkRazf6klOejc3OkNELyQePymSx5QYQv+QDSX7LJyb1tI2uezRK4i3K5AkAcEZWiC0y/Q6hEJlLs
	32tn7j0A7DZERoeZ1C99Bw0fyQXT87KpN90W2IES72bi76Z1WtCmCIfKisuyxdnal0QI=;
Message-ID: <8617384e-62b1-4291-b6ea-00edd4600851@xen.org>
Date: Sun, 22 Sep 2024 09:58:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] xen: introduce common macros for per-CPU sections
 defintion
Content-Language: en-GB
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <cover.1726746877.git.oleksii.kurochko@gmail.com>
 <ed94ad588dd91733178cf505a49b82f4cf031268.1726746877.git.oleksii.kurochko@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <ed94ad588dd91733178cf505a49b82f4cf031268.1726746877.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 19/09/2024 17:59, Oleksii Kurochko wrote:
> Introduce PERCPU_SECTION macro which manages:
>   * Alignment of the section start
>   * Insertion of per-CPU data sections
>   * Alignment and start/end markers for per-CPU data
> This change simplifies the linker script maintenance and ensures a unified
> approach for per-CPU sections across different architectures.
> 
> Refactor the linker scripts for Arm, PPC, and x86 architectures by using
> the common macro PERCPU_SECTION defined in xen/xen.lds.h to handle
> per-CPU data sections.
> 
> No functional changes.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

> ---
>   xen/arch/arm/xen.lds.S    |  9 +--------
>   xen/arch/ppc/xen.lds.S    |  9 +--------
>   xen/arch/x86/xen.lds.S    |  9 +--------
>   xen/include/xen/xen.lds.h | 10 ++++++++++
>   4 files changed, 13 insertions(+), 24 deletions(-)
> 
> diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
> index bd884664ad..669a882455 100644
> --- a/xen/arch/arm/xen.lds.S
> +++ b/xen/arch/arm/xen.lds.S
> @@ -198,14 +198,7 @@ SECTIONS
>          __bss_start = .;
>          *(.bss.stack_aligned)
>          *(.bss.page_aligned)
> -       . = ALIGN(PAGE_SIZE);
> -       __per_cpu_start = .;
> -       *(.bss.percpu.page_aligned)
> -       *(.bss.percpu)
> -       . = ALIGN(SMP_CACHE_BYTES);
> -       *(.bss.percpu.read_mostly)
> -       . = ALIGN(SMP_CACHE_BYTES);
> -       __per_cpu_data_end = .;
> +       PERCPU_SECTION
>          *(.bss .bss.*)
>          . = ALIGN(POINTER_ALIGN);
>          __bss_end = .;
> diff --git a/xen/arch/ppc/xen.lds.S b/xen/arch/ppc/xen.lds.S
> index 38cd857187..0833d80479 100644
> --- a/xen/arch/ppc/xen.lds.S
> +++ b/xen/arch/ppc/xen.lds.S
> @@ -148,14 +148,7 @@ SECTIONS
>           __bss_start = .;
>           *(.bss.stack_aligned)
>           *(.bss.page_aligned)
> -        . = ALIGN(PAGE_SIZE);
> -        __per_cpu_start = .;
> -        *(.bss.percpu.page_aligned)
> -        *(.bss.percpu)
> -        . = ALIGN(SMP_CACHE_BYTES);
> -        *(.bss.percpu.read_mostly)
> -        . = ALIGN(SMP_CACHE_BYTES);
> -        __per_cpu_data_end = .;
> +        PERCPU_SECTION
>           *(.bss .bss.*)
>           . = ALIGN(POINTER_ALIGN);
>           __bss_end = .;
> diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
> index d48de67cfd..eea8edc02b 100644
> --- a/xen/arch/x86/xen.lds.S
> +++ b/xen/arch/x86/xen.lds.S
> @@ -321,14 +321,7 @@ SECTIONS
>     DECL_SECTION(.bss) {
>          __bss_start = .;
>          *(.bss.page_aligned*)
> -       . = ALIGN(PAGE_SIZE);
> -       __per_cpu_start = .;
> -       *(.bss.percpu.page_aligned)
> -       *(.bss.percpu)
> -       . = ALIGN(SMP_CACHE_BYTES);
> -       *(.bss.percpu.read_mostly)
> -       . = ALIGN(SMP_CACHE_BYTES);
> -       __per_cpu_data_end = .;
> +       PERCPU_SECTION
>          *(.bss .bss.*)
>          . = ALIGN(POINTER_ALIGN);
>          __bss_end = .;
> diff --git a/xen/include/xen/xen.lds.h b/xen/include/xen/xen.lds.h
> index a17810bb28..f043c7b6c0 100644
> --- a/xen/include/xen/xen.lds.h
> +++ b/xen/include/xen/xen.lds.h
> @@ -151,6 +151,16 @@
>   #define LOCK_PROFILE_DATA
>   #endif
>   
> +#define PERCPU_SECTION              \
> +       . = ALIGN(PAGE_SIZE);        \
> +       __per_cpu_start = .;         \
> +       *(.bss.percpu.page_aligned)  \
> +       *(.bss.percpu)               \
> +       . = ALIGN(SMP_CACHE_BYTES);  \
> +       *(.bss.percpu.read_mostly)   \
> +       . = ALIGN(SMP_CACHE_BYTES);  \
> +       __per_cpu_data_end = .;      \
> +
>   #ifdef CONFIG_HAS_VPCI
>   #define VPCI_ARRAY               \
>          . = ALIGN(POINTER_ALIGN); \

-- 
Julien Grall


