Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A46A041665E
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 22:08:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.194564.346620 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTV1G-0005tM-Mw; Thu, 23 Sep 2021 20:08:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194564.346620; Thu, 23 Sep 2021 20:08:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTV1G-0005rN-JU; Thu, 23 Sep 2021 20:08:34 +0000
Received: by outflank-mailman (input) for mailman id 194564;
 Thu, 23 Sep 2021 20:08:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/SRu=ON=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mTV1F-0005qh-23
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 20:08:33 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 66ffd947-a319-4c32-9222-bfdc7c0a8aa0;
 Thu, 23 Sep 2021 20:08:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2428A61241;
 Thu, 23 Sep 2021 20:08:31 +0000 (UTC)
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
X-Inumbo-ID: 66ffd947-a319-4c32-9222-bfdc7c0a8aa0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632427711;
	bh=MNyvKaFgFCUPXsfRzD3Uni2c6kX2doji4UyUo8l97yw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=V26BPQGxZaB4QNujdfM1ze5ozILa0oAsLzjB1tEYa7pIR/SPmPy39Of3Q4ZFDiF4n
	 B/x4OoVpDCt5QoZox7h1/06YszQoG21MiQXigGCN3XqyjhZypBw6HTzHp31Dq0sYkw
	 5/sKMiyi2PTQWAGBUkGegUSgaQ0s1Mac3PZlpjTsHBm/GMfBKLab2qdvV88r+Bo9p6
	 uPCFPEeZRFCKhz9Je0jEZxP/+qyWCH26dvuDZFuZ4p7HkOjgtrP3D75o23DFSQBHQl
	 keviyVMxxLmJH9Xc84nnn47GAojNYKDT56KV1RNxQGRVAtEx+Lq7PBs3MOQlar4YYa
	 uiaV/2+w3fqTw==
Date: Thu, 23 Sep 2021 13:08:30 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
cc: xen-devel@lists.xenproject.org, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    Volodymyr Babchuk <volodymyr_babchuk@epam.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Julien Grall <jgrall@amazon.com>
Subject: Re: [PATCH] xen/arm: optee: Allocate anonymous domheap pages
In-Reply-To: <1630935741-17088-1-git-send-email-olekstysh@gmail.com>
Message-ID: <alpine.DEB.2.21.2109231308200.17979@sstabellini-ThinkPad-T480s>
References: <1630935741-17088-1-git-send-email-olekstysh@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 6 Sep 2021, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> Allocate anonymous domheap pages as there is no strict need to
> account them to a particular domain.
> 
> Since XSA-383 "xen/arm: Restrict the amount of memory that dom0less
> domU and dom0 can allocate" the dom0 cannot allocate memory outside
> of the pre-allocated region. This means if we try to allocate
> non-anonymous page to be accounted to dom0 we will get an
> over-allocation issue when assigning that page to the domain.
> The anonymous page, in turn, is not assigned to any domain.
> 
> CC: Julien Grall <jgrall@amazon.com>
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Acked-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

Only one question, which is more architectural: given that these pages
are "unlimited", could the guest exploit the interface somehow to force
Xen to allocate an very high number of anonymous pages?

E.g. could a domain call OPTEE_SMC_RPC_FUNC_ALLOC in a loop to force Xen
to exaust all memory pages?



> ---
>  xen/arch/arm/tee/optee.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/arm/tee/optee.c b/xen/arch/arm/tee/optee.c
> index 3453615..83b4994 100644
> --- a/xen/arch/arm/tee/optee.c
> +++ b/xen/arch/arm/tee/optee.c
> @@ -410,7 +410,7 @@ static struct shm_rpc *allocate_and_pin_shm_rpc(struct optee_domain *ctx,
>      if ( !shm_rpc )
>          return ERR_PTR(-ENOMEM);
>  
> -    shm_rpc->xen_arg_pg = alloc_domheap_page(current->domain, 0);
> +    shm_rpc->xen_arg_pg = alloc_domheap_page(NULL, 0);
>      if ( !shm_rpc->xen_arg_pg )
>      {
>          xfree(shm_rpc);
> @@ -774,7 +774,7 @@ static int translate_noncontig(struct optee_domain *ctx,
>       * - There is a plan to implement preemption in the code below, which
>       *   will allow use to increase default MAX_SHM_BUFFER_PG value.
>       */
> -    xen_pgs = alloc_domheap_pages(current->domain, order, 0);
> +    xen_pgs = alloc_domheap_pages(NULL, order, 0);
>      if ( !xen_pgs )
>          return -ENOMEM;
>  
> @@ -938,7 +938,7 @@ static bool copy_std_request(struct cpu_user_regs *regs,
>  
>      BUILD_BUG_ON(OPTEE_MSG_NONCONTIG_PAGE_SIZE > PAGE_SIZE);
>  
> -    call->xen_arg_pg = alloc_domheap_page(current->domain, 0);
> +    call->xen_arg_pg = alloc_domheap_page(NULL, 0);
>      if ( !call->xen_arg_pg )
>      {
>          set_user_reg(regs, 0, OPTEE_SMC_RETURN_ENOMEM);
> -- 
> 2.7.4
> 

