Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE6272DDBF4
	for <lists+xen-devel@lfdr.de>; Fri, 18 Dec 2020 00:43:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.56247.98366 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kq2vF-0005sN-GR; Thu, 17 Dec 2020 23:43:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 56247.98366; Thu, 17 Dec 2020 23:43:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kq2vF-0005ry-D8; Thu, 17 Dec 2020 23:43:01 +0000
Received: by outflank-mailman (input) for mailman id 56247;
 Thu, 17 Dec 2020 23:42:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BHja=FV=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kq2vD-0005rt-IJ
 for xen-devel@lists.xenproject.org; Thu, 17 Dec 2020 23:42:59 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6fd6a2db-4308-43ec-b330-405b8fc5afee;
 Thu, 17 Dec 2020 23:42:59 +0000 (UTC)
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
X-Inumbo-ID: 6fd6a2db-4308-43ec-b330-405b8fc5afee
Date: Thu, 17 Dec 2020 15:42:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1608248578;
	bh=zEy+JFTXMzAyLDCJ2EeZjEWw4ZB+yBcig1mborY3RW0=;
	h=From:To:cc:Subject:In-Reply-To:References:From;
	b=sRKHL7sqS5Fy1Qm2jJRZBN1Hw+EnjvnQDu+F+rx1MraNFyM9ugUnsCesW0DLvPZTl
	 p2LCIsEG2E7b7lRrV4/Xc4AIBfDrC8qTWKUB1tguDYsNDh9RepO3jNrvlpwZkpWrqJ
	 7pV7YhQmTMS03JeEAbcfAIpN0Nel0T6hvonk0PVwitnT1D+SUBFgl89LimhJKvoIt/
	 onab2vHLIF7KYo1aSdrYRp/rsVbgsunA4pQvPXw7qiVyOOf9Hop8Vvu4uLxGGxVysY
	 MoiZWvLKeIctw788WnyTcSZdCvOaCe3XdoJOLkNRT2FIMLdeZFOR9OmDFUJfVQ+A3t
	 qWyYC8g7ienHQ==
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Bertrand Marquis <bertrand.marquis@arm.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v4 8/8] xen/arm: Activate TID3 in HCR_EL2
In-Reply-To: <d89992ce6177bee2c5331cdc3a90d5b189669d0d.1608214355.git.bertrand.marquis@arm.com>
Message-ID: <alpine.DEB.2.21.2012171541360.4040@sstabellini-ThinkPad-T480s>
References: <cover.1608214355.git.bertrand.marquis@arm.com> <d89992ce6177bee2c5331cdc3a90d5b189669d0d.1608214355.git.bertrand.marquis@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 17 Dec 2020, Bertrand Marquis wrote:
> Activate TID3 bit in HCR register when starting a guest.
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
> Changes in V4: Rebase
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

