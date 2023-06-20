Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD6FB737678
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 23:14:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.552358.862400 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBigH-0004d0-I7; Tue, 20 Jun 2023 21:14:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 552358.862400; Tue, 20 Jun 2023 21:14:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBigH-0004aG-ER; Tue, 20 Jun 2023 21:14:29 +0000
Received: by outflank-mailman (input) for mailman id 552358;
 Tue, 20 Jun 2023 21:14:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yJOa=CI=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qBigG-0004a8-9O
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 21:14:28 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6f9e06a3-0faf-11ee-b234-6b7b168915f2;
 Tue, 20 Jun 2023 23:14:27 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C80B7611C1;
 Tue, 20 Jun 2023 21:14:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09344C433C0;
 Tue, 20 Jun 2023 21:14:23 +0000 (UTC)
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
X-Inumbo-ID: 6f9e06a3-0faf-11ee-b234-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687295665;
	bh=fz8Nh+wI04kpNjcUhGzFktEpp4DB8Pah3KPosjZ0urc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=XVYvXKlaLSZvvDmprz1Ps/K/G6gIN+hFbxcALQVr8T0D5aXDtFCR2+CFDWWUKAEK3
	 u7uS50jIwdJ9xyKvB/yo19pky/XA8vsHCtwtndMUIazeRBaNyG8cUHlP1cWT3nyfWR
	 JxDymjJxvIlS6gvIutK+WaOArdlQVgyjqqXannj/ERo2pBIe9FHd5DlkQdrECQREcX
	 5G3vuqkxOC82vgH1MjzrJefhFgX+LUiCWrXVaDVonRa75omD+dFEaPsT39z+Xl2Qlc
	 5zR043gCDWtHOS4mXSL6mwEGlWORv+nD0WmtIzcMj9yEkfLC1QaIShssqXUErfTM9k
	 7yAHOyyouITow==
Date: Tue, 20 Jun 2023 14:14:22 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Simone Ballarin <simone.ballarin@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Gianluca Luparini <gianluca.luparini@bugseng.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>, 
    Ayan Kumar <ayan.kumar.halder@amd.com>
Subject: Re: [XEN PATCH 11/13] xen/vpci: fixed violations of MISRA C:2012
 Rule 7.2
In-Reply-To: <b1808813c4c1151206aedec250135da0384c4c3e.1687250177.git.gianluca.luparini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2306201414120.897208@ubuntu-linux-20-04-desktop>
References: <cover.1687250177.git.gianluca.luparini@bugseng.com> <b1808813c4c1151206aedec250135da0384c4c3e.1687250177.git.gianluca.luparini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 20 Jun 2023, Simone Ballarin wrote:
> From: Gianluca Luparini <gianluca.luparini@bugseng.com>
> 
> The xen sources contains violations of MISRA C:2012 Rule 7.2 whose headline states:
> "A "u" or "U" suffix shall be applied to all integer constants that are represented in an unsigned type".
> 
> I propose to use "U" as a suffix to explicitly state when an integer constant is represented in an unsigned type.
> 
> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>

commit message aside:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/drivers/vpci/msi.c  | 2 +-
>  xen/drivers/vpci/msix.c | 2 +-
>  xen/drivers/vpci/vpci.c | 6 +++---
>  3 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/xen/drivers/vpci/msi.c b/xen/drivers/vpci/msi.c
> index 8f2b59e61a..7908a5dac6 100644
> --- a/xen/drivers/vpci/msi.c
> +++ b/xen/drivers/vpci/msi.c
> @@ -124,7 +124,7 @@ static void cf_check address_hi_write(
>      struct vpci_msi *msi = data;
>  
>      /* Clear and update high part. */
> -    msi->address &= 0xffffffff;
> +    msi->address &= 0xffffffffU;
>      msi->address |= (uint64_t)val << 32;
>  
>      update_msi(pdev, msi);
> diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
> index 25bde77586..d440ffcd81 100644
> --- a/xen/drivers/vpci/msix.c
> +++ b/xen/drivers/vpci/msix.c
> @@ -531,7 +531,7 @@ static int cf_check msix_write(
>  
>      case PCI_MSIX_ENTRY_UPPER_ADDR_OFFSET:
>          entry->updated = true;
> -        entry->addr &= 0xffffffff;
> +        entry->addr &= 0xffffffffU;
>          entry->addr |= (uint64_t)data << 32;
>          break;
>  
> diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
> index d73fa76302..3bec9a4153 100644
> --- a/xen/drivers/vpci/vpci.c
> +++ b/xen/drivers/vpci/vpci.c
> @@ -319,7 +319,7 @@ static void vpci_write_hw(pci_sbdf_t sbdf, unsigned int reg, unsigned int size,
>  static uint32_t merge_result(uint32_t data, uint32_t new, unsigned int size,
>                               unsigned int offset)
>  {
> -    uint32_t mask = 0xffffffff >> (32 - 8 * size);
> +    uint32_t mask = 0xffffffffU >> (32 - 8 * size);
>  
>      return (data & ~(mask << (offset * 8))) | ((new & mask) << (offset * 8));
>  }
> @@ -402,7 +402,7 @@ uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size)
>          data = merge_result(data, tmp_data, size - data_offset, data_offset);
>      }
>  
> -    return data & (0xffffffff >> (32 - 8 * size));
> +    return data & (0xffffffffU >> (32 - 8 * size));
>  }
>  
>  /*
> @@ -427,7 +427,7 @@ static void vpci_write_helper(const struct pci_dev *pdev,
>          data = merge_result(val, data, size, offset);
>      }
>  
> -    r->write(pdev, r->offset, data & (0xffffffff >> (32 - 8 * r->size)),
> +    r->write(pdev, r->offset, data & (0xffffffffU >> (32 - 8 * r->size)),
>               r->private);
>  }
>  
> -- 
> 2.41.0
> 

