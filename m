Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D96AA94053
	for <lists+xen-devel@lfdr.de>; Sat, 19 Apr 2025 01:39:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.959660.1351965 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5vIe-0001Rs-19; Fri, 18 Apr 2025 23:39:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 959660.1351965; Fri, 18 Apr 2025 23:39:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5vId-0001PV-Uk; Fri, 18 Apr 2025 23:39:11 +0000
Received: by outflank-mailman (input) for mailman id 959660;
 Fri, 18 Apr 2025 23:39:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6n86=XE=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1u5vIc-0001PP-7I
 for xen-devel@lists.xenproject.org; Fri, 18 Apr 2025 23:39:10 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 518880e0-1cae-11f0-9ffb-bf95429c2676;
 Sat, 19 Apr 2025 01:39:07 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id AB47443645;
 Fri, 18 Apr 2025 23:39:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCE05C4CEE2;
 Fri, 18 Apr 2025 23:39:04 +0000 (UTC)
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
X-Inumbo-ID: 518880e0-1cae-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745019545;
	bh=5wGAQWpQTIZX2l3pQvcOxx8yBagYYlMioXmaNEknYxQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=aCnWgkFbB2SgGMNSuJjwP+IBukVUZqyMytHVi2C9kqoIoh5KiPd0dT85Otn3Rsbp7
	 3T+MsOEtHCCrlRJOhpMg0ifDIijRYC83RHxezxbkJrMhvQF9+12C4vWROS+CKhm2iH
	 WPS8+7j06z0qkJ4iih84musFRUk1tR1uMDTBfz0GYYwVTWtE1DvuPxS3zgk4dGOIfl
	 M9hLdNBLUahUFBl6jQUQX0KoVbXQ+VUtCXAJjYuBepHOv9YQRFYmbybitUe19FaJcc
	 qkbgPfA0kGUXkIi7HDEyjzhwocffj3C7AJAXWdIAC5g/5k3kI0ESlDvpIz5AjvgBib
	 be0i8ocGOk/Vg==
Date: Fri, 18 Apr 2025 16:39:04 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Aleksandr Partanen <alex.pentagrid@gmail.com>
cc: qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>, 
    "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
    xen-devel@lists.xenproject.org, Paul Durrant <paul@xen.org>, 
    Anthony PERARD <anthony@xenproject.org>
Subject: Re: [PATCH] xen: mapcache: Fix finding matching entry
In-Reply-To: <20250410144604.214977-1-alex.pentagrid@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2504181638300.785180@ubuntu-linux-20-04-desktop>
References: <20250410144604.214977-1-alex.pentagrid@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 10 Apr 2025, Aleksandr Partanen wrote:
> If we have request without lock and hit unlocked or invalid
> entry during the search, we remap it immediately,
> even if we have matching entry in next entries in bucket.
> This leads to duplication of mappings of the same size,
> and to possibility of selecting the wrong element
> during invalidation and underflow it's entry->lock counter
> 
> Signed-off-by: Aleksandr Partanen <alex.pentagrid@gmail.com>

Hi Aleksandr, thanks for the patch, it looks correct to me.

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


Edgar, would you be able to give it a look as well to make sure?


> ---
>  hw/xen/xen-mapcache.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/xen/xen-mapcache.c b/hw/xen/xen-mapcache.c
> index 698b5c53ed..2c8f861fdb 100644
> --- a/hw/xen/xen-mapcache.c
> +++ b/hw/xen/xen-mapcache.c
> @@ -376,12 +376,12 @@ tryagain:
>  
>      entry = &mc->entry[address_index % mc->nr_buckets];
>  
> -    while (entry && (lock || entry->lock) && entry->vaddr_base &&
> -            (entry->paddr_index != address_index || entry->size != cache_size ||
> +    while (entry && (!entry->vaddr_base ||
> +            entry->paddr_index != address_index || entry->size != cache_size ||
>               !test_bits(address_offset >> XC_PAGE_SHIFT,
>                   test_bit_size >> XC_PAGE_SHIFT,
>                   entry->valid_mapping))) {
> -        if (!free_entry && !entry->lock) {
> +        if (!free_entry && (!entry->lock || !entry->vaddr_base)) {
>              free_entry = entry;
>              free_pentry = pentry;
>          }
> -- 
> 2.39.5
> 

