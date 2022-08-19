Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D8E59A816
	for <lists+xen-devel@lfdr.de>; Sat, 20 Aug 2022 00:14:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.390484.627958 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oPAEs-0006dr-1Z; Fri, 19 Aug 2022 22:13:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 390484.627958; Fri, 19 Aug 2022 22:13:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oPAEr-0006bq-Ux; Fri, 19 Aug 2022 22:13:13 +0000
Received: by outflank-mailman (input) for mailman id 390484;
 Fri, 19 Aug 2022 22:13:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c1Kg=YX=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oPAEq-0006bg-KU
 for xen-devel@lists.xenproject.org; Fri, 19 Aug 2022 22:13:12 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1c5199ed-200c-11ed-9250-1f966e50362f;
 Sat, 20 Aug 2022 00:13:11 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 40C74B82920;
 Fri, 19 Aug 2022 22:13:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92492C433D6;
 Fri, 19 Aug 2022 22:13:08 +0000 (UTC)
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
X-Inumbo-ID: 1c5199ed-200c-11ed-9250-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660947188;
	bh=8liAj87zBtK+RkPLNAuY4IQgVIrrXwdAUyPNFQz1TPM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=LqULINJoPEoLtTN+ErN9rbxyvcl47cO79NwDx0SlRpyBVCH+yy2ROF8C67/IbZIse
	 xXbsX2KU9hi3HIqYyO2UJ7W8FLbx7XX5U2LaNXsPvQLtohUlxU4+KxrnueMeKv+5yB
	 sgdfryFKh/n6PpLVuGGpKTo+q0ggE82KeAt4CByxfyo80q4APl7hYhVNVv56lZL95l
	 NFQPwfEPW/5QC8MSURPmQzUaEe0pheJREbFFvxqoTkuCCmAd3KfN6vXsxLcMd3kGYK
	 HRFpmkY+wd5Zro0LW+0ifdNihY2aW7wrXZ1rxrbwvwsOzfCUE5BcLyasx/zIbt1ydg
	 Kwus3Q4UuBN0g==
Date: Fri, 19 Aug 2022 15:13:07 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Xenia Ragiadakou <burzalodowa@gmail.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 1/7] xen/arm: gic_v3_its: Fix MISRA C 2012 Rule 20.7
 violations
In-Reply-To: <20220819194359.1196539-2-burzalodowa@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2208191512420.3790@ubuntu-linux-20-04-desktop>
References: <20220819194359.1196539-1-burzalodowa@gmail.com> <20220819194359.1196539-2-burzalodowa@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 19 Aug 2022, Xenia Ragiadakou wrote:
> In macros GITS_TYPER_DEVICE_ID_BITS(), GITS_TYPER_EVENT_ID_BITS() and
> GITS_BASER_ENTRY_SIZE(), add parentheses around the macro parameter to
> prevent against unintended expansions.
> Realign subsequent lines, if any.
> 
> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/arch/arm/include/asm/gic_v3_its.h | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/gic_v3_its.h b/xen/arch/arm/include/asm/gic_v3_its.h
> index 94e5cb99c5..168617097f 100644
> --- a/xen/arch/arm/include/asm/gic_v3_its.h
> +++ b/xen/arch/arm/include/asm/gic_v3_its.h
> @@ -46,13 +46,13 @@
>  #define GITS_TYPER_PTA                  BIT(19, UL)
>  #define GITS_TYPER_DEVIDS_SHIFT         13
>  #define GITS_TYPER_DEVIDS_MASK          (0x1fUL << GITS_TYPER_DEVIDS_SHIFT)
> -#define GITS_TYPER_DEVICE_ID_BITS(r)    (((r & GITS_TYPER_DEVIDS_MASK) >> \
> -                                               GITS_TYPER_DEVIDS_SHIFT) + 1)
> +#define GITS_TYPER_DEVICE_ID_BITS(r)    ((((r) & GITS_TYPER_DEVIDS_MASK) >> \
> +                                                 GITS_TYPER_DEVIDS_SHIFT) + 1)
>  
>  #define GITS_TYPER_IDBITS_SHIFT         8
>  #define GITS_TYPER_IDBITS_MASK          (0x1fUL << GITS_TYPER_IDBITS_SHIFT)
> -#define GITS_TYPER_EVENT_ID_BITS(r)     (((r & GITS_TYPER_IDBITS_MASK) >> \
> -                                               GITS_TYPER_IDBITS_SHIFT) + 1)
> +#define GITS_TYPER_EVENT_ID_BITS(r)     ((((r) & GITS_TYPER_IDBITS_MASK) >> \
> +                                                 GITS_TYPER_IDBITS_SHIFT) + 1)
>  
>  #define GITS_TYPER_ITT_SIZE_SHIFT       4
>  #define GITS_TYPER_ITT_SIZE_MASK        (0xfUL << GITS_TYPER_ITT_SIZE_SHIFT)
> @@ -75,7 +75,7 @@
>  #define GITS_BASER_TYPE_RESERVED7       7UL
>  #define GITS_BASER_ENTRY_SIZE_SHIFT     48
>  #define GITS_BASER_ENTRY_SIZE(reg)                                       \
> -                        (((reg >> GITS_BASER_ENTRY_SIZE_SHIFT) & 0x1f) + 1)
> +                        ((((reg) >> GITS_BASER_ENTRY_SIZE_SHIFT) & 0x1f) + 1)
>  #define GITS_BASER_SHAREABILITY_SHIFT   10
>  #define GITS_BASER_PAGE_SIZE_SHIFT      8
>  #define GITS_BASER_SIZE_MASK            0xff
> -- 
> 2.34.1
> 

