Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED0F5416A0B
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 04:33:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.194766.347041 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTb1s-0006OT-04; Fri, 24 Sep 2021 02:33:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194766.347041; Fri, 24 Sep 2021 02:33:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTb1r-0006MH-T3; Fri, 24 Sep 2021 02:33:35 +0000
Received: by outflank-mailman (input) for mailman id 194766;
 Fri, 24 Sep 2021 02:33:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UhVx=OO=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mTb1q-0006MB-Ht
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 02:33:34 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cf9c4168-1cdf-11ec-ba99-12813bfff9fa;
 Fri, 24 Sep 2021 02:33:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 577C16103D;
 Fri, 24 Sep 2021 02:33:32 +0000 (UTC)
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
X-Inumbo-ID: cf9c4168-1cdf-11ec-ba99-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632450812;
	bh=we3haw8iI8cP0tiAzQV1NlBx/lAfQZZaO+9kZSUQW00=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=pnXwc/F6r6PFUvg11ctXL/gbPeZwZrHeCtt2O4yhQRxYAdVumVw9r52p/q18yCQTy
	 lqr5YHQgntOOiAYiabeiLp/DED3WXrFs3Nxvmzfk8uJ4eCLyi79+oy1eW3YDVJXBbC
	 YkFtL5dxkEQrC8dc0yDtvk6DqPzMsNGKeR2OUH5RkoMD4aHEpZxLElY6EhKmbXtjEA
	 QlaAyJ6ZwrxMBcHBYuebzfKrO6nLcL1osy3zNnHhqaCImPWQnitOCjikDxaEQWnKee
	 M+uHKtDCtLy0nLjzy7wtaUeLIX0a/waHNvLk6PMV24F0HgXv01bODFCrmpqSy14hhQ
	 fFn3v8y9tzy6w==
Date: Thu, 23 Sep 2021 19:33:31 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Wei Chen <wei.chen@arm.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org, 
    Bertrand.Marquis@arm.com
Subject: Re: [PATCH 28/37] xen/arm: stub memory hotplug access helpers for
 Arm
In-Reply-To: <20210923120236.3692135-29-wei.chen@arm.com>
Message-ID: <alpine.DEB.2.21.2109231932250.17979@sstabellini-ThinkPad-T480s>
References: <20210923120236.3692135-1-wei.chen@arm.com> <20210923120236.3692135-29-wei.chen@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 23 Sep 2021, Wei Chen wrote:
> Common code in NUMA need these two helpers to access/update
> memory hotplug end address. Arm has not support memory hotplug
> yet. So we stub these two helpers in this patch to make NUMA
> common code happy.
> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> ---
>  xen/include/asm-arm/mm.h | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/xen/include/asm-arm/mm.h b/xen/include/asm-arm/mm.h
> index 7b5e7b7f69..fc9433165d 100644
> --- a/xen/include/asm-arm/mm.h
> +++ b/xen/include/asm-arm/mm.h
> @@ -362,6 +362,16 @@ void clear_and_clean_page(struct page_info *page);
>  
>  unsigned int arch_get_dma_bitsize(void);
>  
> +static inline void mem_hotplug_update_boundary(paddr_t end)
> +{
> +
> +}
> +
> +static inline paddr_t mem_hotplug_boundary(void)
> +{
> +    return 0;
> +}

Why zero? Could it be INVALID_PADDR ?

