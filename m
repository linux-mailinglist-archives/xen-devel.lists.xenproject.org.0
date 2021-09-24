Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23311417E7B
	for <lists+xen-devel@lfdr.de>; Sat, 25 Sep 2021 01:57:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.195725.348559 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTv44-0008Bx-Ey; Fri, 24 Sep 2021 23:57:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 195725.348559; Fri, 24 Sep 2021 23:57:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTv44-00089W-Bf; Fri, 24 Sep 2021 23:57:12 +0000
Received: by outflank-mailman (input) for mailman id 195725;
 Fri, 24 Sep 2021 23:57:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UhVx=OO=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mTv42-00089P-U9
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 23:57:10 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 21432ca8-1d93-11ec-bb2c-12813bfff9fa;
 Fri, 24 Sep 2021 23:57:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E664660FDC;
 Fri, 24 Sep 2021 23:57:08 +0000 (UTC)
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
X-Inumbo-ID: 21432ca8-1d93-11ec-bb2c-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632527829;
	bh=ilQoD3kE5tQqzSiX3Ozc9q439DsoUQqqLwiQIgVnB5M=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Ea7GqnfPPFx7h/uBvjdpbEAM5CMSDZBCIHId5vUYsc+w/okdwy9zEU9yXzb4L5lQm
	 /Duf5JgFee8jRQa9WLudXdhVSIvGjH1rPcpbCUDlSU7JGozeO2Zp05Cd0xMW0rnous
	 GZhvgHibmCPhbruBO7WnZGggdjHBSu6QLkOzL+5dO8srHeB7+6W2Q3+Yk9QMAcyc6a
	 FUMYUL4wlpRiXxMaEDPtpbJ6AaYmdVvO9u5zyBRL/6KJEKVDCouKZgAbo4GroYD8ic
	 YlGEgomLe/QDoTucd2T9WnfcOFIj3/s9mwe7e3bp1bTTcwCPZy8J+7SXuFJQvt/qwm
	 8FQZVkYtaqlgw==
Date: Fri, 24 Sep 2021 16:57:07 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Oleksandr Andrushchenko <andr2000@gmail.com>
cc: xen-devel@lists.xenproject.org, julien@xen.org, sstabellini@kernel.org, 
    oleksandr_tyshchenko@epam.com, volodymyr_babchuk@epam.com, 
    Artem_Mygaiev@epam.com, roger.pau@citrix.com, bertrand.marquis@arm.com, 
    rahul.singh@arm.com
Subject: Re: [PATCH v2 06/11] xen/domain: Call pci_release_devices() when
 releasing domain resources
In-Reply-To: <20210923125438.234162-7-andr2000@gmail.com>
Message-ID: <alpine.DEB.2.21.2109241656430.17979@sstabellini-ThinkPad-T480s>
References: <20210923125438.234162-1-andr2000@gmail.com> <20210923125438.234162-7-andr2000@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 23 Sep 2021, Oleksandr Andrushchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> This is the very same that we already do for DT devices. Moreover, x86
> already calls pci_release_devices().
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Since v1:
>  - re-wording in the commit message
> ---
>  xen/arch/arm/domain.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index f7ed130023d5..854e8fed0393 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -985,7 +985,8 @@ static int relinquish_memory(struct domain *d, struct page_list_head *list)
>   * function which may return -ERESTART.
>   */
>  enum {
> -    PROG_tee = 1,
> +    PROG_pci = 1,
> +    PROG_tee,
>      PROG_xen,
>      PROG_page,
>      PROG_mapping,
> @@ -1022,6 +1023,12 @@ int domain_relinquish_resources(struct domain *d)
>  #ifdef CONFIG_IOREQ_SERVER
>          ioreq_server_destroy_all(d);
>  #endif
> +#ifdef CONFIG_HAS_PCI
> +    PROGRESS(pci):
> +        ret = pci_release_devices(d);
> +        if ( ret )
> +            return ret;
> +#endif
>  
>      PROGRESS(tee):
>          ret = tee_relinquish_resources(d);
> -- 
> 2.25.1
> 

