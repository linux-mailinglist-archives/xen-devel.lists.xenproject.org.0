Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A7542A743
	for <lists+xen-devel@lfdr.de>; Tue, 12 Oct 2021 16:32:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.207301.363082 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maIpG-0003Au-ED; Tue, 12 Oct 2021 14:32:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 207301.363082; Tue, 12 Oct 2021 14:32:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maIpG-00037y-As; Tue, 12 Oct 2021 14:32:18 +0000
Received: by outflank-mailman (input) for mailman id 207301;
 Tue, 12 Oct 2021 14:32:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1maIpE-00037p-DU
 for xen-devel@lists.xenproject.org; Tue, 12 Oct 2021 14:32:16 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1maIpD-0002oD-ED; Tue, 12 Oct 2021 14:32:15 +0000
Received: from 54-240-197-225.amazon.com ([54.240.197.225] helo=[192.168.23.5])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1maIpD-0007eO-7V; Tue, 12 Oct 2021 14:32:15 +0000
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
	bh=ZXweFQqQkp2UfaduC2vwvJaXMd6vg+Z6mZsfPzym/MY=; b=J9PIOxN3HmST4fPzrTd3SNTNVK
	IIe7/vT6aunN1MC2rVI/nrfONh3VkixQQTOPkyG4CLuqfklR4Mg34If4jhyLhEVA/qFqUEMqHBg1n
	32U3ghJ81tGqukNSbVxwlZwye9XIw8mpVeS679D3l13+pssEvssDmjAikScyLdeX3TaM=;
Message-ID: <82a77cd7-4562-48ac-805e-69ec46e45ef7@xen.org>
Date: Tue, 12 Oct 2021 15:32:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.0
Subject: Re: [PATCH v5 08/11] xen/arm: Enable the existing x86 virtual PCI
 support for ARM.
To: Rahul Singh <rahul.singh@arm.com>, xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, Andre.Przywara@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <cover.1633540842.git.rahul.singh@arm.com>
 <9bdca2cda5d2e83f94dc2423e55714273539760a.1633540842.git.rahul.singh@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <9bdca2cda5d2e83f94dc2423e55714273539760a.1633540842.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Rahul,

On 06/10/2021 18:40, Rahul Singh wrote:
> diff --git a/xen/include/asm-arm/domain.h b/xen/include/asm-arm/domain.h
> index c9277b5c6d..91d614b37e 100644
> --- a/xen/include/asm-arm/domain.h
> +++ b/xen/include/asm-arm/domain.h
> @@ -2,6 +2,7 @@
>   #define __ASM_DOMAIN_H__
>   
>   #include <xen/cache.h>
> +#include <xen/nospec.h>
>   #include <xen/timer.h>
>   #include <asm/page.h>
>   #include <asm/p2m.h>
> @@ -262,7 +263,11 @@ static inline void arch_vcpu_block(struct vcpu *v) {}
>   
>   #define arch_vm_assist_valid_mask(d) (1UL << VMASST_TYPE_runstate_update_flag)
>   
> -#define has_vpci(d)    ({ (void)(d); false; })
> +/*
> + * For X86 VPCI is enabled and tested for PVH DOM0 only but
> + * for ARM we enable support VPCI for guest domain also.
> + */

This is the sort of comment that will easily get rot if we change the 
behavior on x86. But I find a bit odd to justify the implementation 
based on x86. Can we simply avoid to mention x86?

> +#define has_vpci(d) evaluate_nospec((d)->options & XEN_DOMCTL_CDF_vpci)
>   
>   #endif /* __ASM_DOMAIN_H__ */
>   
> diff --git a/xen/include/asm-x86/pci.h b/xen/include/asm-x86/pci.h
> index e076951032..c4a4fdcbc2 100644
> --- a/xen/include/asm-x86/pci.h
> +++ b/xen/include/asm-x86/pci.h
> @@ -6,8 +6,6 @@
>   #define CF8_ADDR_HI(cf8) (  ((cf8) & 0x0f000000) >> 16)
>   #define CF8_ENABLED(cf8) (!!((cf8) & 0x80000000))
>   
> -#define MMCFG_BDF(addr)  ( ((addr) & 0x0ffff000) >> 12)
> -
>   #define IS_SNB_GFX(id) (id == 0x01068086 || id == 0x01168086 \
>                           || id == 0x01268086 || id == 0x01028086 \
>                           || id == 0x01128086 || id == 0x01228086 \
> diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
> index d46c61fca9..44be337dec 100644
> --- a/xen/include/public/arch-arm.h
> +++ b/xen/include/public/arch-arm.h
> @@ -418,6 +418,13 @@ typedef uint64_t xen_callback_t;
>   #define GUEST_GICV3_GICR0_BASE     xen_mk_ullong(0x03020000) /* vCPU0..127 */
>   #define GUEST_GICV3_GICR0_SIZE     xen_mk_ullong(0x01000000)
>   
> +/*
> + * 256 MB is reserved for VPCI configuration space based on calculation
> + * 256 buses × 32 devices × 8 functions × 4 KB = 256 MB
> + */
> +#define GUEST_VPCI_ECAM_BASE    xen_mk_ullong(0x10000000)
> +#define GUEST_VPCI_ECAM_SIZE    xen_mk_ullong(0x10000000)
> +
>   /* ACPI tables physical address */
>   #define GUEST_ACPI_BASE xen_mk_ullong(0x20000000)
>   #define GUEST_ACPI_SIZE xen_mk_ullong(0x02000000)
> diff --git a/xen/include/xen/pci.h b/xen/include/xen/pci.h
> index 70ac25345c..43b8a08170 100644
> --- a/xen/include/xen/pci.h
> +++ b/xen/include/xen/pci.h
> @@ -40,6 +40,8 @@
>   #define PCI_SBDF3(s,b,df) \
>       ((pci_sbdf_t){ .sbdf = (((s) & 0xffff) << 16) | PCI_BDF2(b, df) })
>   
> +#define MMCFG_BDF(addr)  (((addr) & 0x0ffff000) >> 12)
> +
>   typedef union {
>       uint32_t sbdf;
>       struct {
> 

Cheers,

-- 
Julien Grall

