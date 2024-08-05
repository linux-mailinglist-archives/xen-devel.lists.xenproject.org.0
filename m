Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B0994784F
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2024 11:31:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.771881.1182313 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sau3X-0005g0-6E; Mon, 05 Aug 2024 09:31:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 771881.1182313; Mon, 05 Aug 2024 09:31:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sau3X-0005dj-30; Mon, 05 Aug 2024 09:31:07 +0000
Received: by outflank-mailman (input) for mailman id 771881;
 Mon, 05 Aug 2024 09:31:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sau3V-0005dd-IW
 for xen-devel@lists.xenproject.org; Mon, 05 Aug 2024 09:31:05 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sau3U-0004Ot-O1; Mon, 05 Aug 2024 09:31:04 +0000
Received: from [15.248.2.233] (helo=[10.24.67.21])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sau3U-0000N8-Fp; Mon, 05 Aug 2024 09:31:04 +0000
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
	bh=6dVHa9GCqavIg/HNqh81Sed1LHwaGW0erF9aFIlbcNY=; b=Tu0Gf/SPon9RWRUt/OIAuEVAUf
	gXxX+N4b5wbvAizOBT4VQezAi8geFHkTZny6wIzAty5htZFsy2pIMO43yv2hivaRFwnSZV/6GoB31
	rFavrIX2eVEEReScC6Mhi74pEYhNG1uGNZd2abifP8Gyl6Im6WQsV1lSAVX3P6vY3vvc=;
Message-ID: <4af8ef8c-b3c1-48b4-930b-72f8ef7d26d7@xen.org>
Date: Mon, 5 Aug 2024 10:31:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/9] xen/common: Move Arm's bootfdt.c to common
Content-Language: en-GB
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Shawn Anastasio <sanastasio@raptorengineering.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
References: <cover.1721834549.git.oleksii.kurochko@gmail.com>
 <35558886445c39c0f570632d355b42bb764dbdc4.1721834549.git.oleksii.kurochko@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <35558886445c39c0f570632d355b42bb764dbdc4.1721834549.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Oleksii,

On 24/07/2024 16:31, Oleksii Kurochko wrote:
> From: Shawn Anastasio <sanastasio@raptorengineering.com>
> 
> Move Arm's bootfdt.c to xen/common so that it can be used by other
> device tree architectures like PPC and RISCV.
> 
> Suggested-by: Julien Grall <julien@xen.org>
> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
> Acked-by: Julien Grall <julien@xen.org>

On Matrix you asked me to review this patch again. This wasn't obvious 
given you kept my ack. If you think a review is needed, then please 
either drop the ack or explain why you keep it and ask if it is fine.

Also, I tend to list in the changes where this was acked. In this case, 
you said I acked v4.

Anyway, before confirming my ack, I would like to ask some clarification.

> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in V7:
>   - Nothing changed. Only rebase.
> ---
> Changes in V6:
>   - update the version of the patch to v6.
> ---
> Changes in V5:
>   - add xen/include/xen/bootfdt.h to MAINTAINERS file.

I don't see any change in MAINTAINERS within this patch. Did you happen 
to copy/paste all the changes made in the series?

In fact the only change related to this patch doesn't seem to be listed.

[...]

> +#ifndef CONFIG_STATIC_SHM
> +static inline int process_shm_node(const void *fdt, int node,
> +                                   uint32_t address_cells, uint32_t size_cells)
> +{
> +    printk("CONFIG_STATIC_SHM must be enabled for parsing static shared"
> +            " memory nodes\n");
> +    return -EINVAL;
> +}
> +#endif

I see you duplicated the stub from arch/arm/include/static-shmem.h. But 
the one in static-shmem.h will now be unreachable. I think it needs to 
be removed.

Also, I think this change deserve an explanation in the commit message.

[...]

> +static void __init early_print_info(void)
> +{
> +    const struct membanks *mi = bootinfo_get_mem();
> +    const struct membanks *mem_resv = bootinfo_get_reserved_mem();
> +    struct bootmodules *mods = &bootinfo.modules;
> +    struct bootcmdlines *cmds = &bootinfo.cmdlines;
> +    unsigned int i;
> +
> +    for ( i = 0; i < mi->nr_banks; i++ )
> +        printk("RAM: %"PRIpaddr" - %"PRIpaddr"\n",
> +                mi->bank[i].start,
> +                mi->bank[i].start + mi->bank[i].size - 1);
> +    printk("\n");
> +    for ( i = 0 ; i < mods->nr_mods; i++ )
> +        printk("MODULE[%d]: %"PRIpaddr" - %"PRIpaddr" %-12s\n",
> +                i,
> +                mods->module[i].start,
> +                mods->module[i].start + mods->module[i].size,
> +                boot_module_kind_as_string(mods->module[i].kind));
> +
> +    for ( i = 0; i < mem_resv->nr_banks; i++ )
> +    {
> +        printk(" RESVD[%u]: %"PRIpaddr" - %"PRIpaddr"\n", i,
> +               mem_resv->bank[i].start,
> +               mem_resv->bank[i].start + mem_resv->bank[i].size - 1);
> +    }
> +#ifdef CONFIG_STATIC_SHM
> +    early_print_info_shmem();
> +#endif

Similar remark here.

Cheers,

-- 
Julien Grall


