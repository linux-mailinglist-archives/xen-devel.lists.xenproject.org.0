Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80FC07C8C89
	for <lists+xen-devel@lfdr.de>; Fri, 13 Oct 2023 19:44:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616794.959064 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrMCm-00043c-Aj; Fri, 13 Oct 2023 17:44:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616794.959064; Fri, 13 Oct 2023 17:44:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrMCm-00041H-6b; Fri, 13 Oct 2023 17:44:08 +0000
Received: by outflank-mailman (input) for mailman id 616794;
 Fri, 13 Oct 2023 17:44:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qrMCk-00041B-Uj
 for xen-devel@lists.xenproject.org; Fri, 13 Oct 2023 17:44:06 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qrMCk-0008HZ-Nz; Fri, 13 Oct 2023 17:44:06 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qrMCk-0007XZ-It; Fri, 13 Oct 2023 17:44:06 +0000
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
	bh=/3abA/Ui44PtLdylEgDBWIrd/NU/JPYgyLii5784n9U=; b=tsf2k28bJz3+m1RFXRMecCBySs
	qBGUaGy+y6auznG+YT5d8pLBqP/v7yOW55iH48/fti4TcFGAn931rd1zycbm4+kaivLTcnYC8MUaS
	WiXBAjAXG5rG5+S7aejHzliAdU+35bApFKr+y2/hoaQz6ruLD9KSGlnxq1RV6oyThal4=;
Message-ID: <9346ebac-748d-4d12-95ca-31af5483640a@xen.org>
Date: Fri, 13 Oct 2023 18:44:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 6/8] xen/arm: Fold pmap and fixmap into MMU system
Content-Language: en-GB
To: Henry Wang <Henry.Wang@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Penny Zheng <penny.zheng@arm.com>, Wei Chen <wei.chen@arm.com>
References: <20231009010313.3668423-1-Henry.Wang@arm.com>
 <20231009010313.3668423-7-Henry.Wang@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20231009010313.3668423-7-Henry.Wang@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Henry,

On 09/10/2023 02:03, Henry Wang wrote:
> diff --git a/xen/arch/arm/mmu/setup.c b/xen/arch/arm/mmu/setup.c
> index c2df976ab2..dff81f6125 100644
> --- a/xen/arch/arm/mmu/setup.c
> +++ b/xen/arch/arm/mmu/setup.c
> @@ -339,6 +339,33 @@ void free_init_memory(void)
>       printk("Freed %ldkB init memory.\n", (long)(__init_end-__init_begin)>>10);
>   }
>   
> +/**
> + * copy_from_paddr - copy data from a physical address
> + * @dst: destination virtual address
> + * @paddr: source physical address
> + * @len: length to copy
> + */
> +void __init copy_from_paddr(void *dst, paddr_t paddr, unsigned long len)
> +{
> +    void *src = (void *)FIXMAP_ADDR(FIXMAP_MISC);
> +
> +    while (len) {
> +        unsigned long l, s;
> +
> +        s = paddr & (PAGE_SIZE-1);

NIT: I would take the opportunity to add a missing space before/after '-'.

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

