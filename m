Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F9035ABB1B
	for <lists+xen-devel@lfdr.de>; Sat,  3 Sep 2022 01:21:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.397965.638702 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oUFyZ-00051p-F7; Fri, 02 Sep 2022 23:21:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 397965.638702; Fri, 02 Sep 2022 23:21:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oUFyZ-000502-BY; Fri, 02 Sep 2022 23:21:27 +0000
Received: by outflank-mailman (input) for mailman id 397965;
 Fri, 02 Sep 2022 23:21:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WoFT=ZF=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oUFyX-0004zv-Ag
 for xen-devel@lists.xenproject.org; Fri, 02 Sep 2022 23:21:25 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f5efda3c-2b15-11ed-82f2-63bd783d45fa;
 Sat, 03 Sep 2022 01:21:24 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 53142B82E03;
 Fri,  2 Sep 2022 23:21:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9624BC433C1;
 Fri,  2 Sep 2022 23:21:21 +0000 (UTC)
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
X-Inumbo-ID: f5efda3c-2b15-11ed-82f2-63bd783d45fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662160882;
	bh=r5TBsV1adSVTAfB+81yvtAzFrzkzGu1Ragripsg63lk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Rd/DQpMKgpkc+EtpOfa8o6aax+TIXEJOF6IqHFj8FN4lvxW40selvbxW//lIWzBKI
	 plEerGeaj3KtxCSOjBH4slAPpZsDZ9n6DE0x4T5RCgjp/jFNAjxnP2DE2OONNYUnC1
	 vF8SKphrRYDx6AM1mktzyQLqhwOGEOEP9U85RUZoTbn6LyHCsHEwutAHQJIONzxz0B
	 8tzFbpY/6kwF0DTg6xJ3HgahfnWSNWeJXaJlQR7T0dLOKDhJkrWJ90sWfgThuMZ1ez
	 YojcCRumHJ7AhPT3GQiSxaAvhp1bZwzEVu/A7HkzJbkh8+y1nY6dxQEH6UwMFITYuO
	 AMOPnMUrNvJgQ==
Date: Fri, 2 Sep 2022 16:21:18 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Rahul Singh <rahul.singh@arm.com>
cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com, 
    Zhou Wang <wangzhou1@hisilicon.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Will Deacon <will@kernel.org>
Subject: Re: [PATCH v2 03/10] xen/arm: smmuv3: Ensure queue is read after
 updating prod pointer
In-Reply-To: <59c24309e2d8494edf414904fe9725b4e7387098.1662123432.git.rahul.singh@arm.com>
Message-ID: <alpine.DEB.2.22.394.2209021613440.3931@ubuntu-linux-20-04-desktop>
References: <cover.1662123432.git.rahul.singh@arm.com> <59c24309e2d8494edf414904fe9725b4e7387098.1662123432.git.rahul.singh@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 2 Sep 2022, Rahul Singh wrote:
> From: Zhou Wang <wangzhou1@hisilicon.com>
> 
> Backport Linux commit a76a37777f2c. This is the clean backport without
> any changes.
> 
> Reading the 'prod' MMIO register in order to determine whether or
> not there is valid data beyond 'cons' for a given queue does not
> provide sufficient dependency ordering, as the resulting access is
> address dependent only on 'cons' and can therefore be speculated
> ahead of time, potentially allowing stale data to be read by the
> CPU.
> 
> Use readl() instead of readl_relaxed() when updating the shadow copy
> of the 'prod' pointer, so that all speculated memory reads from the
> corresponding queue can occur only from valid slots.
> 
> Signed-off-by: Zhou Wang <wangzhou1@hisilicon.com>
> Link: https://lore.kernel.org/r/1601281922-117296-1-git-send-email-wangzhou1@hisilicon.com
> [will: Use readl() instead of explicit barrier. Update 'cons' side to match.]
> Signed-off-by: Will Deacon <will@kernel.org>
> Origin: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git a76a37777f2c
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> ---
> Changes in v2:
>  - fix commit msg
>  - add _iomb changes also from the origin patch
> ---
>  xen/arch/arm/include/asm/system.h     |  1 +
>  xen/drivers/passthrough/arm/smmu-v3.c | 11 +++++++++--
>  2 files changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/system.h b/xen/arch/arm/include/asm/system.h
> index 65d5c8e423..fe27cf8c5e 100644
> --- a/xen/arch/arm/include/asm/system.h
> +++ b/xen/arch/arm/include/asm/system.h
> @@ -29,6 +29,7 @@
>  #endif
>  
>  #define smp_wmb()       dmb(ishst)
> +#define __iomb()        dmb(osh)

We don't have any other #define starting with __ in system.h.
I wonder if we should call this macro differently or simply iomb().


>  #define smp_mb__before_atomic()    smp_mb()
>  #define smp_mb__after_atomic()     smp_mb()
> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
> index 64d39bb4d3..cee13d1fc7 100644
> --- a/xen/drivers/passthrough/arm/smmu-v3.c
> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
> @@ -951,7 +951,7 @@ static void queue_sync_cons_out(struct arm_smmu_queue *q)
>  	 * Ensure that all CPU accesses (reads and writes) to the queue
>  	 * are complete before we update the cons pointer.
>  	 */
> -	mb();
> +	__iomb();
>  	writel_relaxed(q->llq.cons, q->cons_reg);
>  }
>  
> @@ -963,8 +963,15 @@ static void queue_inc_cons(struct arm_smmu_ll_queue *q)
>  
>  static int queue_sync_prod_in(struct arm_smmu_queue *q)
>  {
> +	u32 prod;
>  	int ret = 0;
> -	u32 prod = readl_relaxed(q->prod_reg);
> +
> +	/*
> +	 * We can't use the _relaxed() variant here, as we must prevent
> +	 * speculative reads of the queue before we have determined that
> +	 * prod has indeed moved.
> +	 */
> +	prod = readl(q->prod_reg);
>  
>  	if (Q_OVF(prod) != Q_OVF(q->llq.prod))
>  		ret = -EOVERFLOW;
> -- 
> 2.25.1
> 

