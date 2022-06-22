Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52410555470
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jun 2022 21:31:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.354315.581393 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o464m-0002Ea-V3; Wed, 22 Jun 2022 19:31:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 354315.581393; Wed, 22 Jun 2022 19:31:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o464m-0002Cn-SB; Wed, 22 Jun 2022 19:31:44 +0000
Received: by outflank-mailman (input) for mailman id 354315;
 Wed, 22 Jun 2022 19:31:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/BDV=W5=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1o464l-0002Cf-O7
 for xen-devel@lists.xenproject.org; Wed, 22 Jun 2022 19:31:43 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f208d641-f261-11ec-b725-ed86ccbb4733;
 Wed, 22 Jun 2022 21:31:42 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 46259B820E2;
 Wed, 22 Jun 2022 19:31:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC4EDC34114;
 Wed, 22 Jun 2022 19:31:40 +0000 (UTC)
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
X-Inumbo-ID: f208d641-f261-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655926300;
	bh=kR5otOXRhzX6FXyHpwbkHtG6jluAE601v5yr7HLWApo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=khZe/C45+TM5lJCvQg+zYYNrH5ySOyLIoGto6EBazLrGsHB6+wqZfCOUilR0f0j2p
	 nESK/ex3dNioiWmjfQDgj/ekvFaoey1n/XyPVpgAPh9MT1c2OEL6MDdXNWc1Phmecf
	 XRDZ7FEHGQ3hzbI39zs/iUJjjHZgB4ZjeIwtV1LwpkxLX9fx3n/g9llI4716btTbKn
	 3H/mkowW6MWiYGjJbVzFLmwCAHt7snujWojISceOZ+PqLscR92w/rSlOzDk2laMQdz
	 l5O8xFqDKIfBuhYzYdCz0YawR6kldgaLloDvQUtvL2pghfeHceTtoKBuCn9hL7oJWr
	 VexMTS0SaoNuQ==
Date: Wed, 22 Jun 2022 12:31:40 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Xenia Ragiadakou <burzalodowa@gmail.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Subject: Re: [PATCH] xen/common: device_tree: Fix MISRA C 2012 Rule 8.7
 violation
In-Reply-To: <20220622151557.545880-1-burzalodowa@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2206221231260.2157383@ubuntu-linux-20-04-desktop>
References: <20220622151557.545880-1-burzalodowa@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 22 Jun 2022, Xenia Ragiadakou wrote:
> The function __dt_n_size_cells() is referenced only in device_tree.c.
> Change the linkage of the function from external to internal by adding
> the storage-class specifier static to the function definition.
> 
> This patch aims to resolve indirectly a MISRA C 2012 Rule 8.4 violation
> warning.
> 
> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/common/device_tree.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
> index 0e8798bd24..6c9712ab7b 100644
> --- a/xen/common/device_tree.c
> +++ b/xen/common/device_tree.c
> @@ -496,7 +496,7 @@ static int __dt_n_addr_cells(const struct dt_device_node *np, bool_t parent)
>      return DT_ROOT_NODE_ADDR_CELLS_DEFAULT;
>  }
>  
> -int __dt_n_size_cells(const struct dt_device_node *np, bool_t parent)
> +static int __dt_n_size_cells(const struct dt_device_node *np, bool_t parent)
>  {
>      const __be32 *ip;
>  
> -- 
> 2.34.1
> 

