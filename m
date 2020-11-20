Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 036212B9FF4
	for <lists+xen-devel@lfdr.de>; Fri, 20 Nov 2020 02:47:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.31521.61955 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfvW0-0005HP-Ig; Fri, 20 Nov 2020 01:47:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 31521.61955; Fri, 20 Nov 2020 01:47:08 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfvW0-0005H0-FH; Fri, 20 Nov 2020 01:47:08 +0000
Received: by outflank-mailman (input) for mailman id 31521;
 Fri, 20 Nov 2020 01:47:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9Wlp=E2=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kfvVz-0005Gv-3B
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 01:47:07 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 85333ba6-9336-427c-9421-d097d67f3bba;
 Fri, 20 Nov 2020 01:47:06 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net
 [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1901C22201;
 Fri, 20 Nov 2020 01:47:05 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=9Wlp=E2=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1kfvVz-0005Gv-3B
	for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 01:47:07 +0000
X-Inumbo-ID: 85333ba6-9336-427c-9421-d097d67f3bba
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 85333ba6-9336-427c-9421-d097d67f3bba;
	Fri, 20 Nov 2020 01:47:06 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 1901C22201;
	Fri, 20 Nov 2020 01:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1605836825;
	bh=qROvm2bLrbiiLZMKfpPsHkFHej1lCqcjjt1J3RD7VyE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=sd1Gr4I/cB1aODykbJKgwlXtoA1DJY2/Ew9p4bcoux/lQgRJQwznFLcBObVSn6spt
	 gaMV07KxgNl79YW/UiLjg7q7MIi+ijai+UsEx5s2H7UkXpbeM4YY//mO7IQNhIbv18
	 J6fJ/zUsmZM8u8/EXkIvSkDLKYFyNHSvAWYgJO+A=
Date: Thu, 19 Nov 2020 17:47:04 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com, 
    Julien Grall <julien.grall@arm.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Julien Grall <julien.grall@amazon.com>
Subject: Re: [PATCH RFC 5/6] xen/arm: mm: Don't open-code Xen PT update in
 remove_early_mappings
In-Reply-To: <20201119190751.22345-6-julien@xen.org>
Message-ID: <alpine.DEB.2.21.2011191746460.7979@sstabellini-ThinkPad-T480s>
References: <20201119190751.22345-1-julien@xen.org> <20201119190751.22345-6-julien@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 19 Nov 2020, Julien Grall wrote:
> From: Julien Grall <julien.grall@arm.com>
> 
> Now that xen_pt_update_entry() is able to deal with different mapping
> size, we can replace the open-coding of the page-tables update by a call
> to modify_xen_mappings().
> 
> As the function is not meant to fail, a BUG_ON is added to check the
> return.
> 
> Signed-off-by: Julien Grall <julien.grall@arm.com>
> Signed-off-by: Julien Grall <julien.grall@amazon.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/arch/arm/mm.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> index af0f12b6e6d3..aee6d410ac4f 100644
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -598,11 +598,11 @@ void * __init early_fdt_map(paddr_t fdt_paddr)
>  
>  void __init remove_early_mappings(void)
>  {
> -    lpae_t pte = {0};
> -    write_pte(xen_second + second_table_offset(BOOT_FDT_VIRT_START), pte);
> -    write_pte(xen_second + second_table_offset(BOOT_FDT_VIRT_START + SZ_2M),
> -              pte);
> -    flush_xen_tlb_range_va(BOOT_FDT_VIRT_START, BOOT_FDT_SLOT_SIZE);
> +    int rc;
> +
> +    rc = modify_xen_mappings(BOOT_FDT_VIRT_START, BOOT_FDT_VIRT_END,
> +                             _PAGE_BLOCK);
> +    BUG_ON(rc);
>  }
>  
>  /*
> -- 
> 2.17.1
> 

