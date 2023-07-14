Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F427753BAA
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jul 2023 15:21:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.563640.880976 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qKIjw-000492-5v; Fri, 14 Jul 2023 13:21:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 563640.880976; Fri, 14 Jul 2023 13:21:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qKIjw-00046k-15; Fri, 14 Jul 2023 13:21:44 +0000
Received: by outflank-mailman (input) for mailman id 563640;
 Fri, 14 Jul 2023 13:21:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qKIju-00046c-Hj
 for xen-devel@lists.xenproject.org; Fri, 14 Jul 2023 13:21:42 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qKIjt-00029X-P9; Fri, 14 Jul 2023 13:21:41 +0000
Received: from [54.239.6.186] (helo=[192.168.4.173])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qKIjt-000341-FG; Fri, 14 Jul 2023 13:21:41 +0000
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
	bh=Ha+6tZyTDIUtjL/vtzwfiky+EFOmYIPqeYmTZ03yuj4=; b=UfkT8e2kQRPY9cVSlYn8Xx2+hQ
	ImChIaRlCDSKNSXdclAaVh09GKln0xBGFrh5ECDq6/f/ZhcXhZwZqeGBiVyybIMz+PXlfn3IOrOSZ
	y5SLd+o4IQE/qNELSnhxGelj99q5LPUXrrnzEASm92omDltQak1xDVYzHHKbmtVsE5J8=;
Message-ID: <9ab4ae66-aa72-2426-08e5-cbe44030d7f2@xen.org>
Date: Fri, 14 Jul 2023 14:21:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [RFC PATCH 3/4] xen/arm: initialize conditionally uninitialized
 local variables
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1689329728.git.nicola.vetrini@bugseng.com>
 <c7d2cd46f06f75f8a1810168c508f05d242f831c.1689329728.git.nicola.vetrini@bugseng.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <c7d2cd46f06f75f8a1810168c508f05d242f831c.1689329728.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 14/07/2023 12:49, Nicola Vetrini wrote:
> This patch aims to fix some occurrences of possibly uninitialized
> variables, that may be read before being written. This behaviour would
> violate MISRA C:2012 Rule 9.1, besides being generally undesirable.
> 
> In all the analyzed cases, such accesses were actually safe, but it's
> quite difficult to prove so by automatic checking, therefore a safer
> route is to change the code so as to avoid the behaviour from occurring,
> while preserving the semantics.
> 
> An initialization to a safe value is provided to reach this aim.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
> Additional input on which values may be 'safe' in each context is
> surely welcome, to avoid possibly compromising the correctness of
> the function semantics.
> ---
>   xen/arch/arm/cpuerrata.c                    |  6 +++---
>   xen/arch/arm/domctl.c                       |  8 ++++----
>   xen/arch/arm/gic-v3-lpi.c                   | 17 +++++++++--------
>   xen/arch/arm/include/asm/p2m.h              | 10 ++++++----
>   xen/arch/arm/platforms/xilinx-zynqmp-eemi.c | 10 ++--------
>   xen/arch/arm/psci.c                         | 10 +++++-----
>   xen/drivers/char/pl011.c                    |  2 +-
>   7 files changed, 30 insertions(+), 33 deletions(-)
> 
> diff --git a/xen/arch/arm/cpuerrata.c b/xen/arch/arm/cpuerrata.c
> index d0658aedb6..14694c6081 100644
> --- a/xen/arch/arm/cpuerrata.c
> +++ b/xen/arch/arm/cpuerrata.c
> @@ -159,7 +159,7 @@ extern char __mitigate_spectre_bhb_loop_start_32[],
>   
>   static int enable_smccc_arch_workaround_1(void *data)
>   {
> -    struct arm_smccc_res res;
> +    struct arm_smccc_res res = {0};

I understand you desire to make happy. But I am not sure that 
initializing to 0 is the right thing. If the SMCC were not properly 
setting the register, then we most likely don't want to install the 
workaround. Instead, we most likely want to warn.

So you want (int)res.a0 to be negative. We don't care about the other 
fields.

>       const struct arm_cpu_capabilities *entry = data;
>   
>       /*
> @@ -252,7 +252,7 @@ static int enable_spectre_bhb_workaround(void *data)
>   
>       if ( cpus_have_cap(ARM_WORKAROUND_BHB_SMCC_3) )
>       {
> -        struct arm_smccc_res res;
> +        struct arm_smccc_res res = {0};

Same remark here.

>   
>           if ( smccc_ver < SMCCC_VERSION(1, 1) )
>               goto warn;
> @@ -393,7 +393,7 @@ DEFINE_PER_CPU_READ_MOSTLY(register_t, ssbd_callback_required);
>   
>   static bool has_ssbd_mitigation(const struct arm_cpu_capabilities *entry)
>   {
> -    struct arm_smccc_res res;
> +    struct arm_smccc_res res = {0};

Here you would want (int)res.a0 to be equal to ARM_SMCCC_NOT_SUPPORTED.

>       bool required;
>   
>       if ( smccc_ver < SMCCC_VERSION(1, 1) )
> diff --git a/xen/arch/arm/domctl.c b/xen/arch/arm/domctl.c
> index ad56efb0f5..b38fed72be 100644
> --- a/xen/arch/arm/domctl.c
> +++ b/xen/arch/arm/domctl.c
> @@ -29,10 +29,10 @@ static int handle_vuart_init(struct domain *d,
>                                struct xen_domctl_vuart_op *vuart_op)
>   {
>       int rc;
> -    struct vpl011_init_info info;
> -
> -    info.console_domid = vuart_op->console_domid;
> -    info.gfn = _gfn(vuart_op->gfn);
> +    struct vpl011_init_info info = {
> +        .console_domid = vuart_op->console_domid,
> +        .gfn = _gfn(vuart_op->gfn)
> +    };

I am not against, this change. But I don't quite understand how this 
makes Eclair much happier?

Also, if this is the desired way, then I think this should be written 
down in the CODING_STYLE.

>   
>       if ( d->creation_finished )
>           return -EPERM;
> diff --git a/xen/arch/arm/gic-v3-lpi.c b/xen/arch/arm/gic-v3-lpi.c
> index eb0a5535e4..12f2af2e4d 100644
> --- a/xen/arch/arm/gic-v3-lpi.c
> +++ b/xen/arch/arm/gic-v3-lpi.c
> @@ -210,7 +210,10 @@ out:
>   void gicv3_lpi_update_host_entry(uint32_t host_lpi, int domain_id,
>                                    uint32_t virt_lpi)
>   {
> -    union host_lpi *hlpip, hlpi;
> +    union host_lpi *hlpip, hlpi = {
> +        .virt_lpi = virt_lpi,
> +        .dom_id = domain_id
> +    };
>   
>       ASSERT(host_lpi >= LPI_OFFSET);
>   
> @@ -218,9 +221,6 @@ void gicv3_lpi_update_host_entry(uint32_t host_lpi, int domain_id,
>   
>       hlpip = &lpi_data.host_lpis[host_lpi / HOST_LPIS_PER_PAGE][host_lpi % HOST_LPIS_PER_PAGE];
>   
> -    hlpi.virt_lpi = virt_lpi;
> -    hlpi.dom_id = domain_id;
> -
>       write_u64_atomic(&hlpip->data, hlpi.data);
>   }
>   
> @@ -542,14 +542,15 @@ int gicv3_allocate_host_lpi_block(struct domain *d, uint32_t *first_lpi)
>   
>       for ( i = 0; i < LPI_BLOCK; i++ )
>       {
> -        union host_lpi hlpi;
> -
>           /*
>            * Mark this host LPI as belonging to the domain, but don't assign
>            * any virtual LPI or a VCPU yet.
>            */
> -        hlpi.virt_lpi = INVALID_LPI;
> -        hlpi.dom_id = d->domain_id;
> +        union host_lpi hlpi = {
> +            .virt_lpi = INVALID_LPI,
> +            .dom_id = d->domain_id
> +        };
> +
>           write_u64_atomic(&lpi_data.host_lpis[chunk][lpi_idx + i].data,
>                            hlpi.data);
>   
> diff --git a/xen/arch/arm/include/asm/p2m.h b/xen/arch/arm/include/asm/p2m.h
> index 940495d42b..413e2a7add 100644
> --- a/xen/arch/arm/include/asm/p2m.h
> +++ b/xen/arch/arm/include/asm/p2m.h
> @@ -345,7 +345,7 @@ static inline struct page_info *get_page_from_gfn(
>       struct domain *d, unsigned long gfn, p2m_type_t *t, p2m_query_t q)
>   {
>       mfn_t mfn;
> -    p2m_type_t _t;
> +    p2m_type_t _t = p2m_invalid;
>       struct page_info *page;
>   
>       /*
> @@ -355,10 +355,12 @@ static inline struct page_info *get_page_from_gfn(
>       if ( likely(d != dom_xen) )
>           return p2m_get_page_from_gfn(d, _gfn(gfn), t);
>   
> -    if ( !t )
> +    /* Allow t to be NULL */
> +    if ( t )
> +        *t = _t;
> +    else {
>           t = &_t;
> -
> -    *t = p2m_invalid;
> +    }

I understand the exist construct is not liked by Eclair. But your new 
construct is not easily readable by a human. Before I can propose a 
different approach, can you clarify why Eclair is unhappy this the 
existing code?

>       /*
>        * DOMID_XEN sees 1-1 RAM. The p2m_type is based on the type of the
> diff --git a/xen/arch/arm/platforms/xilinx-zynqmp-eemi.c b/xen/arch/arm/platforms/xilinx-zynqmp-eemi.c
> index 2053ed7ac5..39d9ab4fa9 100644
> --- a/xen/arch/arm/platforms/xilinx-zynqmp-eemi.c
> +++ b/xen/arch/arm/platforms/xilinx-zynqmp-eemi.c
> @@ -51,11 +51,11 @@ static inline bool domain_has_reset_access(struct domain *d, uint32_t rst)
>   
>   bool zynqmp_eemi(struct cpu_user_regs *regs)
>   {
> -    struct arm_smccc_res res;
> +    struct arm_smccc_res res = {0};
>       uint32_t fid = get_user_reg(regs, 0);
>       uint32_t nodeid = get_user_reg(regs, 1);
>       unsigned int pm_fn = fid & 0xFFFF;
> -    enum pm_ret_status ret;
> +    enum pm_ret_status ret = XST_PM_NO_ACCESS;

It is not clear to me why Eclair is unhappy here?

>   
>       switch ( fid )
>       {
> @@ -89,7 +89,6 @@ bool zynqmp_eemi(struct cpu_user_regs *regs)
>           {
>               gprintk(XENLOG_WARNING,
>                       "zynqmp-pm: fn=%u No access to node %u\n", pm_fn, nodeid);
> -            ret = XST_PM_NO_ACCESS;
>               goto done;

I find the new approach less obvious. How about introduce a macro that 
will set the result and the use replace the two lines with:

set_result(regs, XST_PM_NO_ACCESS);
return 0;

where set_result(regs, ret) is

set_user_reg(regs, 0, ret)

> diff --git a/xen/arch/arm/psci.c b/xen/arch/arm/psci.c
> index 695d2fa1f1..47e46af608 100644
> --- a/xen/arch/arm/psci.c
> +++ b/xen/arch/arm/psci.c
> @@ -38,7 +38,7 @@ static uint32_t psci_cpu_on_nr;
>   
>   int call_psci_cpu_on(int cpu)
>   {
> -    struct arm_smccc_res res;
> +    struct arm_smccc_res res = {0};

I don't this we should initialize a0 to 0 as this would indicate a 
success. Instead, we want an invalid value.

>   
>       arm_smccc_smc(psci_cpu_on_nr, cpu_logical_map(cpu), __pa(init_secondary),
>                     &res);
> @@ -50,7 +50,7 @@ void call_psci_cpu_off(void)
>   {
>       if ( psci_ver > PSCI_VERSION(0, 1) )
>       {
> -        struct arm_smccc_res res;
> +        struct arm_smccc_res res = {0};

Same here.

>   
>           /* If successfull the PSCI cpu_off call doesn't return */
>           arm_smccc_smc(PSCI_0_2_FN32_CPU_OFF, &res);
> @@ -73,7 +73,7 @@ void call_psci_system_reset(void)
>   
>   static int __init psci_features(uint32_t psci_func_id)
>   {
> -    struct arm_smccc_res res;
> +    struct arm_smccc_res res = {0};

Same here.

>   
>       if ( psci_ver < PSCI_VERSION(1, 0) )
>           return PSCI_NOT_SUPPORTED;
> @@ -115,7 +115,7 @@ static void __init psci_init_smccc(void)
>   
>       if ( psci_features(ARM_SMCCC_VERSION_FID) != PSCI_NOT_SUPPORTED )
>       {
> -        struct arm_smccc_res res;
> +        struct arm_smccc_res res = {0};

Same here.

>   
>           arm_smccc_smc(ARM_SMCCC_VERSION_FID, &res);
>           if ( PSCI_RET(res) != ARM_SMCCC_NOT_SUPPORTED )
> @@ -168,7 +168,7 @@ static int __init psci_init_0_2(void)
>           { /* sentinel */ },
>       };
>       int ret;
> -    struct arm_smccc_res res;
> +    struct arm_smccc_res res = {0};

Same here.

>   
>       if ( acpi_disabled )
>       {
> diff --git a/xen/drivers/char/pl011.c b/xen/drivers/char/pl011.c
> index f7bf3ad117..34ce90be52 100644
> --- a/xen/drivers/char/pl011.c
> +++ b/xen/drivers/char/pl011.c
> @@ -285,7 +285,7 @@ static int __init pl011_dt_uart_init(struct dt_device_node *dev,
>       const char *config = data;
>       int res;
>       paddr_t addr, size;
> -    uint32_t io_width;
> +    uint32_t io_width = 0;

We have many use of dt_property_read_*() within the code base. I would 
like us te decide of a policy first.

>       bool mmio32 = false, sbsa;
>   
>       if ( strcmp(config, "") )

Cheers,

-- 
Julien Grall

