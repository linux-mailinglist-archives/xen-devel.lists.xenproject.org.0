Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D717A29B8
	for <lists+xen-devel@lfdr.de>; Fri, 15 Sep 2023 23:41:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.603430.940426 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qhGZA-0004rV-3B; Fri, 15 Sep 2023 21:41:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 603430.940426; Fri, 15 Sep 2023 21:41:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qhGZ9-0004oB-Ve; Fri, 15 Sep 2023 21:41:31 +0000
Received: by outflank-mailman (input) for mailman id 603430;
 Fri, 15 Sep 2023 21:41:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qhGZ8-0004o5-4f
 for xen-devel@lists.xenproject.org; Fri, 15 Sep 2023 21:41:30 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qhGZ7-0000SL-PU; Fri, 15 Sep 2023 21:41:29 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qhGZ7-00023L-Ho; Fri, 15 Sep 2023 21:41:29 +0000
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
	bh=5V7JyGRlODp4w4Ly1IrA8R7RanPbtNBwEjZzMc2OwSI=; b=c+uiBwx2xaZDzZhJUo3vhyBPTJ
	sJsOYIJv1XyQz7LSVZC374aEdZDJfiYuEJ3V5tZy7H/hL2Ua7SZUlQAfHjQbqpNDCjEloQFnJwwms
	GbjcDmAKl3kTfjMFaJ5v4gusReCt6AN9XsN6U0qer02l17kCwIA48m0TwWq8IMi4poYQ=;
Message-ID: <bfb777cb-77b1-859a-1d4d-d096632c765e@xen.org>
Date: Fri, 15 Sep 2023 22:41:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.14.0
Subject: Re: [PATCH v6 03/13] xen/arm64: Split and move MMU-specific head.S to
 mmu/head.S
To: Henry Wang <Henry.Wang@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Penny Zheng <penny.zheng@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Chen <wei.chen@arm.com>,
 Julien Grall <jgrall@amazon.com>
References: <20230828013224.669433-1-Henry.Wang@arm.com>
 <20230828013224.669433-4-Henry.Wang@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230828013224.669433-4-Henry.Wang@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Henry,

I realize that this was already committed. But something went wrong 
during the code movement.

On 28/08/2023 02:32, Henry Wang wrote:
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
> +ENTRY(enable_boot_cpu_mm)
> +        mov   x5, lr
> +
> +        bl    create_page_tables
> +        load_paddr x0, boot_pgtable
> +
> +        bl    enable_mmu
> +        mov   lr, x5
> +
> +        /*
> +         * The MMU is turned on and we are in the 1:1 mapping. Switch
> +         * to the runtime mapping.
> +         */
> +        ldr   x0, =1f
> +        br    x0
> +1:
> +        /*
> +         * The 1:1 map may clash with other parts of the Xen virtual memory
> +         * layout. As it is not used anymore, remove it completely to
> +         * avoid having to worry about replacing existing mapping
> +         * afterwards. Function will return to primary_switched.
> +         */
> +        b     remove_identity_mapping
> +
> +        /*
> +         * Below is supposed to be unreachable code, as "ret" in
> +         * remove_identity_mapping will use the return address in LR in advance.
> +         */
> +        b     fail

The "b     fail" didn't exist in head.S. I guess this was due to a wrong 
rebase? Can you check if there is something else that went missing?

Cheers,

-- 
Julien Grall

