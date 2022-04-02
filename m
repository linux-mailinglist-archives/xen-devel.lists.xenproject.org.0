Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E774EFD5A
	for <lists+xen-devel@lfdr.de>; Sat,  2 Apr 2022 02:05:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.297664.507129 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naRGK-0003Fd-AX; Sat, 02 Apr 2022 00:05:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 297664.507129; Sat, 02 Apr 2022 00:05:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naRGK-0003DE-6z; Sat, 02 Apr 2022 00:05:04 +0000
Received: by outflank-mailman (input) for mailman id 297664;
 Sat, 02 Apr 2022 00:05:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fP4x=UM=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1naRGJ-0003D8-0w
 for xen-devel@lists.xenproject.org; Sat, 02 Apr 2022 00:05:03 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8ac3c196-b218-11ec-a405-831a346695d4;
 Sat, 02 Apr 2022 02:05:02 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 997C2B82685;
 Sat,  2 Apr 2022 00:05:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F30F9C340F3;
 Sat,  2 Apr 2022 00:04:59 +0000 (UTC)
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
X-Inumbo-ID: 8ac3c196-b218-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1648857900;
	bh=0J6Zhn+o6kNrMRjRL8gTyVauJetC1J43Q3OhYx7mxU0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=uuTh8opA//QorLd7qLakXqa4NIfSqjIZebuMUukpyFsPstw+Doto7SlITp9DBwRsf
	 vmHPJjAwIZL0kxeMZ8m1lF1BwYE0ItoZZK+a4FwHbFE5XnZ5xfeEQLCy8d8p0G10sj
	 AgGBoig4dsmgETy+aQ0kGm5nxTuyFsg4M3j4GHi8CequY4SObjJ5O7wDllR3PRS3sO
	 WxxjPKr5+dR4pb8b8JXJVy2anmogqiBaYV/YVfelIZCY2+cQcVP3900l39mwnunwPP
	 5DBZRg6pWM6P0nVeFXcZN3k4tjucHy6pzuAQcmI09+xVw0YGDuvqmUiJmPfJKpMwoz
	 B/bd8qYuOhwMg==
Date: Fri, 1 Apr 2022 17:04:59 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Julien Grall <jgrall@amazon.com>
Subject: Re: [PATCH v3 07/19] xen/arm: mm: Don't open-code Xen PT update in
 remove_early_mappings()
In-Reply-To: <20220221102218.33785-8-julien@xen.org>
Message-ID: <alpine.DEB.2.22.394.2204011700520.2910984@ubuntu-linux-20-04-desktop>
References: <20220221102218.33785-1-julien@xen.org> <20220221102218.33785-8-julien@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 21 Feb 2022, Julien Grall wrote:
> From: Julien Grall <julien.grall@arm.com>
> 
> Now that xen_pt_update_entry() is able to deal with different mapping
> size, we can replace the open-coding of the page-tables update by a call
> to modify_xen_mappings().
> 
> As the function is not meant to fail, a BUG_ON() is added to check the
> return.
> 
> Signed-off-by: Julien Grall <julien.grall@arm.com>
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Nice!


> ---
>     Changes in v2:
>         - Stay consistent with how function name are used in the commit
>         message
>         - Add my AWS signed-off-by
> ---
>  xen/arch/arm/mm.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> index 7b4b9de8693e..f088a4b2de96 100644
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -599,11 +599,11 @@ void * __init early_fdt_map(paddr_t fdt_paddr)
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

Am I right that we are actually destroying the mapping, which usually is
done by calling destroy_xen_mappings, but we cannot call
destroy_xen_mappings in this case because it doesn't take a flags
parameter?

If so, then I would add a flags parameter to destroy_xen_mappings
instead of calling modify_xen_mappings just to pass _PAGE_BLOCK.
But I don't feel strongly about it so if you don't feel like making the
change to destroy_xen_mappings, you can add my acked-by here anyway.

