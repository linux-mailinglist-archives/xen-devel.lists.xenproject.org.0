Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 125765AD7AD
	for <lists+xen-devel@lfdr.de>; Mon,  5 Sep 2022 18:37:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.399000.640037 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVF6L-0003jS-Ow; Mon, 05 Sep 2022 16:37:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 399000.640037; Mon, 05 Sep 2022 16:37:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVF6L-0003gk-LO; Mon, 05 Sep 2022 16:37:33 +0000
Received: by outflank-mailman (input) for mailman id 399000;
 Mon, 05 Sep 2022 16:37:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oVF6K-0003ge-2z
 for xen-devel@lists.xenproject.org; Mon, 05 Sep 2022 16:37:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oVF6H-0006FA-1X; Mon, 05 Sep 2022 16:37:29 +0000
Received: from 54-240-197-226.amazon.com ([54.240.197.226]
 helo=[192.168.1.223]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oVF6G-0008ER-Rm; Mon, 05 Sep 2022 16:37:28 +0000
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
	bh=OYcax9VqV1dppgMWP2EfWZrpSd5WoXtc4cBeacEit74=; b=yFGh1HE2fM+tZE5966zPfZR0Ii
	/C94/yN9OxIZgKNKOQxM90eHVbvxmmyGLdXN16l21HnBgBpR/343eL3tERJuigrLfUFU+leKDyFlj
	f7mcWEvkkHmL63PLKvckIJYAOrEO/kV2xUGaM13epfVCscycg3MU/bXe8UkIAl/uxqUI=;
Message-ID: <885a4f6b-8350-229d-55da-4171eeafb800@xen.org>
Date: Mon, 5 Sep 2022 17:37:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.1
Subject: Re: [PATCH v3 03/10] xen/arm: smmuv3: Ensure queue is read after
 updating prod pointer
To: Rahul Singh <rahul.singh@arm.com>, xen-devel@lists.xenproject.org
Cc: Zhou Wang <wangzhou1@hisilicon.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Will Deacon <will@kernel.org>
References: <cover.1662394710.git.rahul.singh@arm.com>
 <bd55c05d7197b72cb4597c7412fc4911fa2281d1.1662394710.git.rahul.singh@arm.com>
Content-Language: en-US
From: Julien Grall <julien@xen.org>
In-Reply-To: <bd55c05d7197b72cb4597c7412fc4911fa2281d1.1662394710.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 05/09/2022 17:30, Rahul Singh wrote:
> From: Zhou Wang <wangzhou1@hisilicon.com>
> 
> Backport Linux commit a76a37777f2c. Rename __iomb to iomb() while
> merging to get in sync with other Xen definitions.
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
> Changes in v3:
>   - rename __iomb() to iomb() and also move it from common file to
>     smmu-v3.c file

Hmmm... Quoting Bertrand:

"We need the __iomb as “linux compatibility” in fact so I would suggest 
for now to only introduce it at the beginning of smmu-v3.c with other 
linux compatibility stuff to prevent adding this to Xen overall."

Which I also agreed. I couldn't a more recent conversation explaining 
your approach. Can you outline why you didn't follow the approached 
discussed?

Cheers,

> Changes in v2:
>   - fix commit msg
>   - add _iomb changes also from the origin patch
> ---
>   xen/drivers/passthrough/arm/smmu-v3.c | 13 +++++++++++--
>   1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
> index 64d39bb4d3..e632c75b21 100644
> --- a/xen/drivers/passthrough/arm/smmu-v3.c
> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
> @@ -107,6 +107,8 @@ typedef paddr_t		dma_addr_t;
>   typedef paddr_t		phys_addr_t;
>   typedef unsigned int		gfp_t;
>   
> +#define iomb()		dmb(osh)
> +
>   #define platform_device		device
>   
>   #define GFP_KERNEL		0
> @@ -951,7 +953,7 @@ static void queue_sync_cons_out(struct arm_smmu_queue *q)
>   	 * Ensure that all CPU accesses (reads and writes) to the queue
>   	 * are complete before we update the cons pointer.
>   	 */
> -	mb();
> +	iomb();
>   	writel_relaxed(q->llq.cons, q->cons_reg);
>   }
>   
> @@ -963,8 +965,15 @@ static void queue_inc_cons(struct arm_smmu_ll_queue *q)
>   
>   static int queue_sync_prod_in(struct arm_smmu_queue *q)
>   {
> +	u32 prod;
>   	int ret = 0;
> -	u32 prod = readl_relaxed(q->prod_reg);
> +
> +	/*
> +	 * We can't use the _relaxed() variant here, as we must prevent
> +	 * speculative reads of the queue before we have determined that
> +	 * prod has indeed moved.
> +	 */
> +	prod = readl(q->prod_reg);
>   
>   	if (Q_OVF(prod) != Q_OVF(q->llq.prod))
>   		ret = -EOVERFLOW;

-- 
Julien Grall

