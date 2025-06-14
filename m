Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 865DBAD990C
	for <lists+xen-devel@lfdr.de>; Sat, 14 Jun 2025 02:30:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1015109.1393037 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQEnC-0002Sd-V0; Sat, 14 Jun 2025 00:30:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1015109.1393037; Sat, 14 Jun 2025 00:30:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQEnC-0002Q5-SQ; Sat, 14 Jun 2025 00:30:42 +0000
Received: by outflank-mailman (input) for mailman id 1015109;
 Sat, 14 Jun 2025 00:30:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SRxw=Y5=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uQEnC-0002Om-0D
 for xen-devel@lists.xenproject.org; Sat, 14 Jun 2025 00:30:42 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cc6117f8-48b6-11f0-a309-13f23c93f187;
 Sat, 14 Jun 2025 02:30:40 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9380A5C5F8E;
 Sat, 14 Jun 2025 00:28:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC777C4CEE3;
 Sat, 14 Jun 2025 00:30:37 +0000 (UTC)
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
X-Inumbo-ID: cc6117f8-48b6-11f0-a309-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749861038;
	bh=Ch1wr2KOSVaH/QpDBPKZ6gySDFiWFtID0YyvTmUcuAo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Wvt2q/FLuOTtrwyUskgpE9vuo/vvr8pL+fjPnB05k2jBMz/A2vcSY4ac7fNifswS8
	 J2XWJCXp5ObOUDozdYgzjC3qcFllI1PhA2MXOcAk0rXyOiyBYLX9T07i1kJoMVTdK7
	 tni2yNMMYmrd/f8UbrzA4R7QmLawE1DzD1qh3oi4dHaWxOGZUdvesTq/PYuSlzJSx6
	 Digi1UIteJ1g6DLsA7rZoPWm5J7cJ7khn0I6oTr0Ao0XI7m5URUzeR8OszCSVUJv4r
	 9JF0nIv+gT16eQ97/yKWu2zRuRdKo8NGTr9Myqa3intvK5xiI4zeS4l2i6Exh17LO/
	 qaXSSJP0uDYvw==
Date: Fri, 13 Jun 2025 17:30:36 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Alejandro Vallejo <agarciav@amd.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v3 01/14] arm/gnttab: Remove xen/grant_table.h cyclic
 include
In-Reply-To: <20250613151612.754222-2-agarciav@amd.com>
Message-ID: <alpine.DEB.2.22.394.2506131730300.8480@ubuntu-linux-20-04-desktop>
References: <20250613151612.754222-1-agarciav@amd.com> <20250613151612.754222-2-agarciav@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 13 Jun 2025, Alejandro Vallejo wrote:
> The way they currently include each other, with one of the includes
> being conditional on CONFIG_GRANT_TABLE, makes it hard to know which
> contents are included when.
> 
> Break the cycle by removing the asm/grant_table.h include.
> 
> Not a functional change because.
> 
> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> v3:
>   * Strictly remove the cycle in asm/grant_table.h
>     (Keeping the conditional include is a terrible idea, IMO)
> ---
>  xen/arch/arm/include/asm/grant_table.h | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/xen/arch/arm/include/asm/grant_table.h b/xen/arch/arm/include/asm/grant_table.h
> index c5d87b60c4..c47058a3a0 100644
> --- a/xen/arch/arm/include/asm/grant_table.h
> +++ b/xen/arch/arm/include/asm/grant_table.h
> @@ -1,7 +1,6 @@
>  #ifndef __ASM_GRANT_TABLE_H__
>  #define __ASM_GRANT_TABLE_H__
>  
> -#include <xen/grant_table.h>
>  #include <xen/kernel.h>
>  #include <xen/pfn.h>
>  #include <xen/sched.h>
> -- 
> 2.43.0
> 

