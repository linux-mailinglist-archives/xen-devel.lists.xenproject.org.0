Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD38782587
	for <lists+xen-devel@lfdr.de>; Mon, 21 Aug 2023 10:34:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.587368.918724 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qY0MB-00027M-Oc; Mon, 21 Aug 2023 08:33:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 587368.918724; Mon, 21 Aug 2023 08:33:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qY0MB-00024r-LO; Mon, 21 Aug 2023 08:33:51 +0000
Received: by outflank-mailman (input) for mailman id 587368;
 Mon, 21 Aug 2023 08:33:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qY0MA-00024l-Nf
 for xen-devel@lists.xenproject.org; Mon, 21 Aug 2023 08:33:50 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qY0MA-0000DW-B4; Mon, 21 Aug 2023 08:33:50 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qY0MA-0002fT-6Y; Mon, 21 Aug 2023 08:33:50 +0000
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
	References:To:Subject:MIME-Version:Date:Message-ID;
	bh=oKv5u/8N2ue/uuVt5cX9TOxiA/2Rc5Fs5DovXDhHP9w=; b=1UnEIU85s2rVOKmF625HIC4mH5
	W5UME32S01bI6+z3fMCIOCwVly6msfXvn2oNab3ze/auf8HiDdWpLSu+yjllJfFtnQ0pQ7pW/JzAA
	qMe6rkGPTuN7n+dQ+aiBqy0DPWefq/xb+oDEV3S5UvTGdc5bhAJfG7rEPB329E+zeCD4=;
Message-ID: <8795a659-38ef-45cb-a4f6-21cc24403af9@xen.org>
Date: Mon, 21 Aug 2023 09:33:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/13] xen/arm64: head.S: Introduce
 enable_{boot,secondary}_cpu_mm()
Content-Language: en-GB
To: Henry Wang <Henry.Wang@arm.com>, xen-devel@lists.xenproject.org
References: <20230814042536.878720-1-Henry.Wang@arm.com>
 <20230814042536.878720-2-Henry.Wang@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230814042536.878720-2-Henry.Wang@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Henry,

On 14/08/2023 05:25, Henry Wang wrote:
> From: Wei Chen <wei.chen@arm.com>
> 
> At the moment, on MMU system, enable_mmu() will return to an
> address in the 1:1 mapping, then each path is responsible to
> switch to virtual runtime mapping. Then remove_identity_mapping()
> is called on the boot CPU to remove all 1:1 mapping.
> 
> Since remove_identity_mapping() is not necessary on Non-MMU system,
> and we also avoid creating empty function for Non-MMU system, trying
> to keep only one codeflow in arm64/head.S, we move path switch and
> remove_identity_mapping() in enable_mmu() on MMU system.
> 
> As the remove_identity_mapping should only be called for the boot
> CPU only, so we introduce enable_boot_cpu_mm() for boot CPU and
> enable_secondary_cpu_mm() for secondary CPUs in this patch.
> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> Signed-off-by: Penny Zheng <penny.zheng@arm.com> > Signed-off-by: Henry Wang <Henry.Wang@arm.com>

One remark below. With or without it addressed:

Reviewed-by: Julien Grall <jgrall@amazon.com>

[...]

> +/*
> + * Enable mm (turn on the data cache and the MMU) for secondary CPUs.
> + * The function will return to the virtual address provided in LR (e.g. the
> + * runtime mapping).
> + *
> + * Inputs:
> + *   lr : Virtual address to return to.
> + *
> + * Clobbers x0 - x5
> + */
> +enable_secondary_cpu_mm:
> +        mov   x5, lr
> +
> +        load_paddr x0, init_ttbr
> +        ldr   x0, [x0]
> +
> +        bl    enable_mmu
> +        mov   lr, x5
> +
> +        /* Return to the virtual address requested by the caller. */
> +        ret
> +ENDPROC(enable_secondary_cpu_mm)

NIT: enable_mmu() could directly return to the virtual address. This 
would reduce the function to:

load_paddr x0, init_ttbr
ldr   x0, [x0]

/* Return to the virtual address requested by the caller.
b enable_mmu

> +
> +/*
> + * Enable mm (turn on the data cache and the MMU) for the boot CPU.
> + * The function will return to the virtual address provided in LR (e.g. the
> + * runtime mapping).
> + *
> + * Inputs:
> + *   lr : Virtual address to return to.
> + *
> + * Clobbers x0 - x5
> + */
> +enable_boot_cpu_mm:
> +        mov   x5, lr
> +
> +        bl    create_page_tables
> +        load_paddr x0, boot_pgtable
> +
> +        bl    enable_mmu
> +
> +        /*
> +         * The MMU is turned on and we are in the 1:1 mapping. Switch
> +         * to the runtime mapping.
> +         */
> +        ldr   x0, =1f
> +        br    x0
> +1:
> +        mov   lr, x5
> +        /*
> +         * The 1:1 map may clash with other parts of the Xen virtual memory
> +         * layout. As it is not used anymore, remove it completely to avoid
> +         * having to worry about replacing existing mapping afterwards.
> +         * Function will return to the virtual address requested by the caller.
> +         */
> +        b     remove_identity_mapping
> +ENDPROC(enable_boot_cpu_mm)
> +
>   /*
>    * Remove the 1:1 map from the page-tables. It is not easy to keep track
>    * where the 1:1 map was mapped, so we will look for the top-level entry

Cheers,

-- 
Julien Grall

