Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 786034EFD56
	for <lists+xen-devel@lfdr.de>; Sat,  2 Apr 2022 02:00:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.297660.507117 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naRBu-0002c4-NX; Sat, 02 Apr 2022 00:00:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 297660.507117; Sat, 02 Apr 2022 00:00:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naRBu-0002Zq-Kf; Sat, 02 Apr 2022 00:00:30 +0000
Received: by outflank-mailman (input) for mailman id 297660;
 Sat, 02 Apr 2022 00:00:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fP4x=UM=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1naRBt-0002Zk-1j
 for xen-devel@lists.xenproject.org; Sat, 02 Apr 2022 00:00:29 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e718d4e0-b217-11ec-a405-831a346695d4;
 Sat, 02 Apr 2022 02:00:27 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id BFC3BB82547;
 Sat,  2 Apr 2022 00:00:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 333A4C340F3;
 Sat,  2 Apr 2022 00:00:25 +0000 (UTC)
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
X-Inumbo-ID: e718d4e0-b217-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1648857625;
	bh=dlQZtOV5jRV4NLoI7r62ZxxVGLg4mQ5qQvUr5zJ/zPk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Wro7XjBHnsxwhgC3iiHPUdK1djxtZKwiqB6jUGGmQz7R2g9DZpXIvZWFPi3kGgkgR
	 jwBoaXhTNZp6qNcdmUW5nsz0Ar2zCWwtnKz4oWt8WRNFtZGEfTtn+sYcL68Yhx7XQp
	 Y5j4IoRsuBGHENbUfAnXvTJJJSf5COfDqQWs5NjJ1ZvFJlN7g5qh5hVq9C1RxQ8ktp
	 zStIVc02+g2iegmCucMMLmMPNVzfe1aSOw/l5m3Y8olfgUJ+hq/bRA9ofwSkg4jtXZ
	 KjaFMT8ZD/N1hjgcHCrq3Oohm5pjflbmijeSikZg4NbK9VUaUiHXMCNQ56Fly6RlkE
	 WPOrVizWFKFvQ==
Date: Fri, 1 Apr 2022 17:00:24 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 06/19] xen/arm: mm: Avoid flushing the TLBs when
 mapping are inserted
In-Reply-To: <20220221102218.33785-7-julien@xen.org>
Message-ID: <alpine.DEB.2.22.394.2204011657080.2910984@ubuntu-linux-20-04-desktop>
References: <20220221102218.33785-1-julien@xen.org> <20220221102218.33785-7-julien@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 21 Feb 2022, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> Currently, the function xen_pt_update() will flush the TLBs even when
> the mappings are inserted. This is a bit wasteful because we don't
> allow mapping replacement. Even if we were, the flush would need to
> happen earlier because mapping replacement should use Break-Before-Make
> when updating the entry.
> 
> A single call to xen_pt_update() can perform a single action. IOW, it
> is not possible to, for instance, mix inserting and removing mappings.
> Therefore, we can use `flags` to determine what action is performed.
> 
> This change will be particularly help to limit the impact of switching
> boot time mapping to use xen_pt_update().
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> ---
>     Changes in v2:
>         - New patch
> ---
>  xen/arch/arm/mm.c | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> index fd16c1541ce2..7b4b9de8693e 100644
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -1104,7 +1104,13 @@ static bool xen_pt_check_entry(lpae_t entry, mfn_t mfn, unsigned int level,
>          /* We should be here with a valid MFN. */
>          ASSERT(!mfn_eq(mfn, INVALID_MFN));
>  
> -        /* We don't allow replacing any valid entry. */
> +        /*
> +         * We don't allow replacing any valid entry.
> +         *
> +         * Note that the function xen_pt_update() relies on this
> +         * assumption and will skip the TLB flush. The function will need
> +         * to be updated if the check is relaxed.
> +         */
>          if ( lpae_is_valid(entry) )
>          {
>              if ( lpae_is_mapping(entry, level) )
> @@ -1417,11 +1423,16 @@ static int xen_pt_update(unsigned long virt,
>      }
>  
>      /*
> -     * Flush the TLBs even in case of failure because we may have
> +     * The TLBs flush can be safely skipped when a mapping is inserted
> +     * as we don't allow mapping replacement (see xen_pt_check_entry()).
> +     *
> +     * For all the other cases, the TLBs will be flushed unconditionally
> +     * even if the mapping has failed. This is because we may have
>       * partially modified the PT. This will prevent any unexpected
>       * behavior afterwards.
>       */
> -    flush_xen_tlb_range_va(virt, PAGE_SIZE * nr_mfns);
> +    if ( !(flags & _PAGE_PRESENT) || mfn_eq(mfn, INVALID_MFN) )
> +        flush_xen_tlb_range_va(virt, PAGE_SIZE * nr_mfns);

I am trying to think of a care where the following wouldn't be enough
but I cannot come up with one:

   if ( mfn_eq(mfn, INVALID_MFN) )
       flush_xen_tlb_range_va(virt, PAGE_SIZE * nr_mfns);

