Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B720D97D2C6
	for <lists+xen-devel@lfdr.de>; Fri, 20 Sep 2024 10:31:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.801044.1211060 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1srZ1U-0006nP-FE; Fri, 20 Sep 2024 08:29:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 801044.1211060; Fri, 20 Sep 2024 08:29:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1srZ1U-0006l5-C9; Fri, 20 Sep 2024 08:29:52 +0000
Received: by outflank-mailman (input) for mailman id 801044;
 Fri, 20 Sep 2024 08:29:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1srZ1T-0006ky-G5
 for xen-devel@lists.xenproject.org; Fri, 20 Sep 2024 08:29:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1srZ1T-0003gl-6b; Fri, 20 Sep 2024 08:29:51 +0000
Received: from [83.68.141.146] (helo=[10.134.3.36])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1srZ1S-0004Ot-Ty; Fri, 20 Sep 2024 08:29:51 +0000
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
	bh=VP6E9tmPk0f55d5gMJ6I30SRUMa3/yd5Vpk7LTqLCvI=; b=HAElpjKhU2wWMd0r1q+1xgufDv
	X1F3oUhPejlLJ4kVVFzMDMizsWw4dT0S+7UzJ84TLCmLdoFa2Bju/MXpRpHsPTyfwrOKPJgTdrkoP
	UktYkmTGCLVM6fs3KuIX45nAnzKu+TO8n+SlpHmabOEVQQfuinYuAnyj0tg1Cvuafwd8=;
Message-ID: <72bd286a-9ed9-43f0-8935-fb9e07e180cd@xen.org>
Date: Fri, 20 Sep 2024 10:29:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-overlay: Fix NULL pointer dereference
Content-Language: en-GB
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <20240919104238.232704-1-michal.orzel@amd.com>
 <20240919104238.232704-2-michal.orzel@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240919104238.232704-2-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michal,

On 19/09/2024 12:42, Michal Orzel wrote:
> Attempt to attach an overlay (xl dt-overlay attach) to a domain without
> first adding this overlay to Xen (xl dt-overlay add) results in an
> overlay track entry being NULL in handle_attach_overlay_nodes(). This
> leads to NULL pointer dereference and the following data abort crash:
> 
> (XEN) Cannot find any matching tracker with input dtbo. Operation is supported only for prior added dtbo.
> (XEN) Data Abort Trap. Syndrome=0x5
> (XEN) Walking Hypervisor VA 0x40 on CPU0 via TTBR 0x0000000046948000
> (XEN) 0TH[0x000] = 0x46940f7f
> (XEN) 1ST[0x000] = 0x0
> (XEN) CPU0: Unexpected Trap: Data Abort
> (XEN) ----[ Xen-4.20-unstable  arm64  debug=y  Not tainted ]----
> ...
> (XEN) Xen call trace:
> (XEN)    [<00000a0000208b30>] dt_overlay_domctl+0x304/0x370 (PC)
> (XEN)    [<00000a0000208b30>] dt_overlay_domctl+0x304/0x370 (LR)
> (XEN)    [<00000a0000274b7c>] arch_do_domctl+0x48/0x328
> 
> Fixes: 4c733873b5c2 ("xen/arm: Add XEN_DOMCTL_dt_overlay and device attachment to domains")
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> ---
>   xen/common/dt-overlay.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/common/dt-overlay.c b/xen/common/dt-overlay.c
> index d53b4706cd2f..8606b14d1e8e 100644
> --- a/xen/common/dt-overlay.c
> +++ b/xen/common/dt-overlay.c
> @@ -908,8 +908,11 @@ static long handle_attach_overlay_nodes(struct domain *d,
>    out:
>       spin_unlock(&overlay_lock);
>   
> -    rangeset_destroy(entry->irq_ranges);
> -    rangeset_destroy(entry->iomem_ranges);
> +    if ( entry )
> +    {
> +        rangeset_destroy(entry->irq_ranges);
> +        rangeset_destroy(entry->iomem_ranges);
> +    }

While looking at the error paths in handle_attach_overlay_nodes(), I 
noticed we don't revert any partial changes made by handle_device().

In this case, I am wondering whether it is correct to destroy the 
rangeset. How would you be able to revert the changes?

Cheers,

-- 
Julien Grall


