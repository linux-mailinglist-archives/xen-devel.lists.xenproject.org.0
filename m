Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 334B82D4C74
	for <lists+xen-devel@lfdr.de>; Wed,  9 Dec 2020 22:06:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.48736.86234 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn6fI-0002dw-G7; Wed, 09 Dec 2020 21:06:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 48736.86234; Wed, 09 Dec 2020 21:06:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn6fI-0002dG-CA; Wed, 09 Dec 2020 21:06:24 +0000
Received: by outflank-mailman (input) for mailman id 48736;
 Wed, 09 Dec 2020 21:06:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/xMB=FN=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kn6fG-0002ct-SD
 for xen-devel@lists.xenproject.org; Wed, 09 Dec 2020 21:06:22 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6c220ae2-0492-4fe7-8304-fe5a6c5f792c;
 Wed, 09 Dec 2020 21:06:22 +0000 (UTC)
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
X-Inumbo-ID: 6c220ae2-0492-4fe7-8304-fe5a6c5f792c
Date: Wed, 9 Dec 2020 13:06:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1607547981;
	bh=fxnAYyY+AG6VQmt5QhJC+mLiy8etXez1tkgPfJl8ATs=;
	h=From:To:cc:Subject:In-Reply-To:References:From;
	b=hLTu/ACjH6add2oLNh8TiioJeZgNt3UPjIMMJc0WjZlNh8D5NNsUZlbfc+UGbMrjj
	 ndi9+guX639tQAsTz9s8pibq6ISqxlBer7pq1vwP1xaoW3hczEanZH7L5gYKilxP9N
	 n+WBwmjrZcIUNPOfcj4Og++JQt8YFhjOg9yCm02uaeqKyiiFj5+95mIuk2LDZ2KWip
	 CCD1MrvbOqGwRPqlvV/Fzgp6fU/AkrWKB8uANdlbUURryHmJ8ykx/RkJr8OyA/W2uj
	 tln6qif5gVWx9+VSdgfKGuwuwaUo5AjS5e8viuOv20nR8Li9EOvfUFI7fMKGYU33FB
	 uporSGxT7dNFQ==
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Bertrand Marquis <bertrand.marquis@arm.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 7/7] xen/arm: Activate TID3 in HCR_EL2
In-Reply-To: <956cf336ffce24f0cabfc7a98ae855bc71d5f028.1607524536.git.bertrand.marquis@arm.com>
Message-ID: <alpine.DEB.2.21.2012091157200.20986@sstabellini-ThinkPad-T480s>
References: <cover.1607524536.git.bertrand.marquis@arm.com> <956cf336ffce24f0cabfc7a98ae855bc71d5f028.1607524536.git.bertrand.marquis@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 9 Dec 2020, Bertrand Marquis wrote:
> Activate TID3 bit in HSR register when starting a guest.
> This will trap all coprecessor ID registers so that we can give to guest
> values corresponding to what they can actually use and mask some
> features to guests even though they would be supported by the underlying
> hardware (like SVE or MPAM).
> 
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Changes in V2: Rebase
> Changes in V3: Rebase
> 
> ---
>  xen/arch/arm/traps.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
> index 28d9d64558..c1a9ad6056 100644
> --- a/xen/arch/arm/traps.c
> +++ b/xen/arch/arm/traps.c
> @@ -98,7 +98,7 @@ register_t get_default_hcr_flags(void)
>  {
>      return  (HCR_PTW|HCR_BSU_INNER|HCR_AMO|HCR_IMO|HCR_FMO|HCR_VM|
>               (vwfi != NATIVE ? (HCR_TWI|HCR_TWE) : 0) |
> -             HCR_TSC|HCR_TAC|HCR_SWIO|HCR_TIDCP|HCR_FB|HCR_TSW);
> +             HCR_TID3|HCR_TSC|HCR_TAC|HCR_SWIO|HCR_TIDCP|HCR_FB|HCR_TSW);
>  }
>  
>  static enum {
> -- 
> 2.17.1
> 

