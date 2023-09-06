Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A6C793316
	for <lists+xen-devel@lfdr.de>; Wed,  6 Sep 2023 02:54:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.595974.929682 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdgnf-0008Ja-4j; Wed, 06 Sep 2023 00:53:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 595974.929682; Wed, 06 Sep 2023 00:53:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdgnf-0008Ge-1P; Wed, 06 Sep 2023 00:53:43 +0000
Received: by outflank-mailman (input) for mailman id 595974;
 Wed, 06 Sep 2023 00:53:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DwRh=EW=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qdgnd-0008GY-Do
 for xen-devel@lists.xenproject.org; Wed, 06 Sep 2023 00:53:41 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d0f546a5-4c4f-11ee-9b0d-b553b5be7939;
 Wed, 06 Sep 2023 02:53:39 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 35637B8181A;
 Wed,  6 Sep 2023 00:53:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF2F3C433C9;
 Wed,  6 Sep 2023 00:53:35 +0000 (UTC)
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
X-Inumbo-ID: d0f546a5-4c4f-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693961616;
	bh=YhgC7/2hjdPqPg/k7qH5Aex1Z/DOAWi5U6XPtMQ32/o=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=V8/UgG46XB8tFZpjRNiPcWzSGhbB4qr2gfcXp3dyaWr+05JyGqWUcFXbxinuwMAeJ
	 4yh/BDFy3cpna/s6quo1Q9qGP0f4XTfHNRv8jy0sFH8ANbG5WXeYLQuVk0nJeCxmiN
	 SZJSw/l4098aeDxlvJ/PzvwAXOoVIqUgO2zfycQmRWgrkN8I+wojJc0u7VP8VFW2Vg
	 xBYXBfm/a08R/HHkXKcAcBx69Pw/NQ3ETKdVwBVz0npVdB+kSCcf9hHCWeTpwJHchD
	 krOxinbbGbZlSyjGeoz72W8ToGd8d/fp8inDnj3qoFyeeZiL0WIZbdMiSt+PBH1TCd
	 o+fwWF94sbpAA==
Date: Tue, 5 Sep 2023 17:53:34 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Vikram Garhwal <vikram.garhwal@amd.com>
cc: xen-devel@lists.xenproject.org, julien@xen.org, michal.orzel@amd.com, 
    sstabellini@kernel.org
Subject: Re: [XEN][PATCH v11 17/20] xen/arm: Implement device tree node
 addition functionalities
In-Reply-To: <20230901045947.32351-18-vikram.garhwal@amd.com>
Message-ID: <alpine.DEB.2.22.394.2309051751280.6458@ubuntu-linux-20-04-desktop>
References: <20230901045947.32351-1-vikram.garhwal@amd.com> <20230901045947.32351-18-vikram.garhwal@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 31 Aug 2023, Vikram Garhwal wrote:
> Update sysctl XEN_SYSCTL_dt_overlay to enable support for dtbo nodes addition
> using device tree overlay.
> 
> xl dt-overlay add file.dtbo:
>     Each time overlay nodes are added using .dtbo, a new fdt(memcpy of
>     device_tree_flattened) is created and updated with overlay nodes. This
>     updated fdt is further unflattened to a dt_host_new. Next, it checks if any
>     of the overlay nodes already exists in the dt_host. If overlay nodes doesn't
>     exist then find the overlay nodes in dt_host_new, find the overlay node's
>     parent in dt_host and add the nodes as child under their parent in the
>     dt_host. The node is attached as the last node under target parent.
> 
>     Finally, add IRQs, add device to IOMMUs, set permissions and map MMIO for the
>     overlay node.
> 
> When a node is added using overlay, a new entry is allocated in the
> overlay_track to keep the track of memory allocation due to addition of overlay
> node. This is helpful for freeing the memory allocated when a device tree node
> is removed.
> 
> The main purpose of this to address first part of dynamic programming i.e.
> making xen aware of new device tree node which means updating the dt_host with
> overlay node information. Here we are adding/removing node from dt_host, and
> checking/setting IOMMU and IRQ permission but never mapping them to any domain.
> Right now, mapping/Un-mapping will happen only when a new domU is
> created/destroyed using "xl create".
> 
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> @@ -359,6 +546,312 @@ static long handle_remove_overlay_nodes(const void *overlay_fdt,
>      return rc;
>  }
>  
> +static void free_nodes_full_path(unsigned int num_nodes, char **nodes_full_path)
> +{
> +    unsigned int i;
> +
> +    if ( nodes_full_path != NULL )
> +        return;

Shouldn't this be:

    if ( nodes_full_path == NULL )
        return;


> +    for ( i = 0; i < num_nodes && nodes_full_path[i] != NULL; i++ )
> +    {
> +        xfree(nodes_full_path[i]);
> +    }
> +
> +    xfree(nodes_full_path);
> +}

