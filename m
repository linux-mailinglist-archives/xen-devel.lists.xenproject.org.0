Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA87B97D062
	for <lists+xen-devel@lfdr.de>; Fri, 20 Sep 2024 05:55:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.800984.1210991 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1srUiv-0007Z4-DB; Fri, 20 Sep 2024 03:54:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 800984.1210991; Fri, 20 Sep 2024 03:54:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1srUiv-0007WS-9j; Fri, 20 Sep 2024 03:54:25 +0000
Received: by outflank-mailman (input) for mailman id 800984;
 Fri, 20 Sep 2024 03:54:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yEHU=QS=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1srUit-0007WM-LW
 for xen-devel@lists.xenproject.org; Fri, 20 Sep 2024 03:54:23 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 04e4d5aa-7704-11ef-a0b8-8be0dac302b0;
 Fri, 20 Sep 2024 05:54:22 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 3AF17A4411A;
 Fri, 20 Sep 2024 03:54:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1154FC4CEC3;
 Fri, 20 Sep 2024 03:54:19 +0000 (UTC)
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
X-Inumbo-ID: 04e4d5aa-7704-11ef-a0b8-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726804460;
	bh=TWDTxuh2pLqVDV6FrCvNAFpRP4EtmZ4chhd099TzUaQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=OzplsJqoc9xR7SR8nksBKR5UsAtJyL5o8m8xYPMsa7g/SAWlaQZ54YQlHp9gLN3e4
	 3IAOLYtMr6qIKod1qjW4hN3APCmZ/+SDH/TMQmFARwjrd5C0HAq94ajLPrAdD7b49U
	 N5JQRIw3ycMebmcPN7JjS8//7yB2TObhY9ohFHPum63fAuOB5yDAwZDR1UHtTuEjle
	 xWoiQPMVp+OxyodXNYRvA1UZXI0lkIchYpvleVo69pfnbgf7e4Gw72cvayOZftzl9J
	 QSDUL/CZpjqyDeKOMh4hD1TKKOVnrOzxSf0H9E26bbLVleLlq6cx25ZcIXLCC6yh06
	 pGzKR8PYdoSSg==
Date: Thu, 19 Sep 2024 20:54:18 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [PATCH 1/4] dt-overlay: Fix NULL pointer dereference
In-Reply-To: <20240919104238.232704-2-michal.orzel@amd.com>
Message-ID: <alpine.DEB.2.22.394.2409191457220.1417852@ubuntu-linux-20-04-desktop>
References: <20240919104238.232704-1-michal.orzel@amd.com> <20240919104238.232704-2-michal.orzel@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 19 Sep 2024, Michal Orzel wrote:
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

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/common/dt-overlay.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/common/dt-overlay.c b/xen/common/dt-overlay.c
> index d53b4706cd2f..8606b14d1e8e 100644
> --- a/xen/common/dt-overlay.c
> +++ b/xen/common/dt-overlay.c
> @@ -908,8 +908,11 @@ static long handle_attach_overlay_nodes(struct domain *d,
>   out:
>      spin_unlock(&overlay_lock);
>  
> -    rangeset_destroy(entry->irq_ranges);
> -    rangeset_destroy(entry->iomem_ranges);
> +    if ( entry )
> +    {
> +        rangeset_destroy(entry->irq_ranges);
> +        rangeset_destroy(entry->iomem_ranges);
> +    }
>  
>      return rc;
>  }
> -- 
> 2.37.6
> 

