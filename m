Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D56C237B179
	for <lists+xen-devel@lfdr.de>; Wed, 12 May 2021 00:13:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.126038.237250 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgacc-0007cJ-1F; Tue, 11 May 2021 22:12:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 126038.237250; Tue, 11 May 2021 22:12:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgacb-0007ZS-TK; Tue, 11 May 2021 22:12:57 +0000
Received: by outflank-mailman (input) for mailman id 126038;
 Tue, 11 May 2021 22:12:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nI6L=KG=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lgaca-0007ZL-I7
 for xen-devel@lists.xenproject.org; Tue, 11 May 2021 22:12:56 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c5cfb7fc-2ccf-4d47-8a6c-3520e99159b7;
 Tue, 11 May 2021 22:12:56 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id AAA1A6191C;
 Tue, 11 May 2021 22:12:54 +0000 (UTC)
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
X-Inumbo-ID: c5cfb7fc-2ccf-4d47-8a6c-3520e99159b7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1620771175;
	bh=K/ymIO9zITRDKC7q9fFUInV/MqQVKMrOp6uXkIg6jxY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=axR8R7EJR2WzizcTkkSMkF5oLGM66At43btJcrX0zmsZcYxbWKWjDDlLe6biICNO3
	 5bsdBiR/q73kaRsflgByacS342hQJIVHz2gRyqrvBShPY/hd3QGSK3MOQHEKp1RjzR
	 UGqOPMS2oKYI0ZP6OlC0ksrFBa6yloRhwqtvrserJTf5Gn4/FUwo8J2yOIT4qmxJgh
	 rqg26bdsp5+HF85HzTEo3RVq+AqjYfwb6gMI8kO//RMP8Tca640KRA1jMW3LJE5JPu
	 X8Oy/WGV24Q46Esbq5Np6g4zhY4LCbIJmogk0TvUE1PSpo2BI3S/YbFb9PUNZ8XDs4
	 2LdGWhOQ/3QMA==
Date: Tue, 11 May 2021 15:12:53 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: xen-devel@lists.xenproject.org, Wei.Chen@arm.com, Henry.Wang@arm.com, 
    Penny.Zheng@arm.com, Bertrand.Marquis@arm.com, 
    Julien Grall <jgrall@amazon.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH RFCv2 01/15] xen/arm: lpae: Rename LPAE_ENTRIES_MASK_GS
 to LPAE_ENTRY_MASK_GS
In-Reply-To: <20210425201318.15447-2-julien@xen.org>
Message-ID: <alpine.DEB.2.21.2105111512410.5018@sstabellini-ThinkPad-T480s>
References: <20210425201318.15447-1-julien@xen.org> <20210425201318.15447-2-julien@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 25 Apr 2021, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> Commit 05031fa87357 "xen/arm: guest_walk: Only generate necessary
> offsets/masks" introduced LPAE_ENTRIES_MASK_GS. In a follow-up patch,
> we will use it for to define LPAE_ENTRY_MASK.
> 
> This will lead to inconsistent naming. As LPAE_ENTRY_MASK is used in
> many places, it is better to rename LPAE_ENTRIES_MASK_GS and avoid
> some churn.
> 
> So rename LPAE_ENTRIES_MASK_GS to LPAE_ENTRY_MASK_GS.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>     Changes in v2:
>         - New patch
> ---
>  xen/include/asm-arm/lpae.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/include/asm-arm/lpae.h b/xen/include/asm-arm/lpae.h
> index e94de2e7d8e8..4fb9a40a4ca9 100644
> --- a/xen/include/asm-arm/lpae.h
> +++ b/xen/include/asm-arm/lpae.h
> @@ -180,7 +180,7 @@ static inline bool lpae_is_superpage(lpae_t pte, unsigned int level)
>   */
>  #define LPAE_SHIFT_GS(gs)         ((gs) - 3)
>  #define LPAE_ENTRIES_GS(gs)       (_AC(1, U) << LPAE_SHIFT_GS(gs))
> -#define LPAE_ENTRIES_MASK_GS(gs)  (LPAE_ENTRIES_GS(gs) - 1)
> +#define LPAE_ENTRY_MASK_GS(gs)  (LPAE_ENTRIES_GS(gs) - 1)
>  
>  #define LEVEL_ORDER_GS(gs, lvl)   ((3 - (lvl)) * LPAE_SHIFT_GS(gs))
>  #define LEVEL_SHIFT_GS(gs, lvl)   (LEVEL_ORDER_GS(gs, lvl) + (gs))
> @@ -188,7 +188,7 @@ static inline bool lpae_is_superpage(lpae_t pte, unsigned int level)
>  
>  /* Offset in the table at level 'lvl' */
>  #define LPAE_TABLE_INDEX_GS(gs, lvl, addr)   \
> -    (((addr) >> LEVEL_SHIFT_GS(gs, lvl)) & LPAE_ENTRIES_MASK_GS(gs))
> +    (((addr) >> LEVEL_SHIFT_GS(gs, lvl)) & LPAE_ENTRY_MASK_GS(gs))
>  
>  /* Generate an array @var containing the offset for each level from @addr */
>  #define DECLARE_OFFSETS(var, addr)          \
> -- 
> 2.17.1
> 

