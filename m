Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A122A6C5A5
	for <lists+xen-devel@lfdr.de>; Fri, 21 Mar 2025 23:10:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.924526.1327676 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvkZ9-00049U-1E; Fri, 21 Mar 2025 22:10:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 924526.1327676; Fri, 21 Mar 2025 22:10:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvkZ8-00047k-UP; Fri, 21 Mar 2025 22:10:10 +0000
Received: by outflank-mailman (input) for mailman id 924526;
 Fri, 21 Mar 2025 22:10:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1L9V=WI=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tvkZ7-00047Y-IC
 for xen-devel@lists.xenproject.org; Fri, 21 Mar 2025 22:10:09 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3f575880-06a1-11f0-9ea1-5ba50f476ded;
 Fri, 21 Mar 2025 23:10:08 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4493A5C6713;
 Fri, 21 Mar 2025 22:07:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9ADDC4CEE3;
 Fri, 21 Mar 2025 22:10:04 +0000 (UTC)
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
X-Inumbo-ID: 3f575880-06a1-11f0-9ea1-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742595005;
	bh=cPMkIvRM2PSLzGj0ZEqOHawj+Ez9mRQLGJkv/s0wCmE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=kIrpVBv5Vd0qpVBN+Csr+/opoGu6yVeCvlhrDfQCH0OtYealyaaQG3t8Ce8keMoaA
	 OKdGdHrW/qtTSqGKO2TfeSj7gUMd9W4ANSAoLHiTd6mI02eIWeb6l87fFSiSZwsqoY
	 HyPPrGdtes3J8t7/7ha6nURnYxZ0K3bPl0OzHqbGWVc2SUmtfHd6Nbriz8IEpsCRcE
	 H7ZbkyTLgdCZwZa1Q61E5oAlzpxcTe6fCtg7vje05FU5OkXihUXIDSrOUYfcUCI+bg
	 02iqthKs5fjUmWzeKn+kpiXjzTBmsb+T1w9ofoY4/kWWpwZi2YiiiqVe6dQv6nNiZx
	 4XnylH7VW1omA==
Date: Fri, 21 Mar 2025 15:10:03 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH 2/3] Xen: Update compiler checks
In-Reply-To: <20250320155908.43885-3-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2503211509491.2325679@ubuntu-linux-20-04-desktop>
References: <20250320155908.43885-1-andrew.cooper3@citrix.com> <20250320155908.43885-3-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-363378920-1742595005=:2325679"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-363378920-1742595005=:2325679
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 20 Mar 2025, Andrew Cooper wrote:
> We didn't really have a Clang check before, so add one while adjusting the GCC
> check.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

> ---
> CC: Anthony PERARD <anthony.perard@vates.tech>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Julien Grall <julien@xen.org>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
>  xen/include/xen/compiler.h | 16 ++++------------
>  1 file changed, 4 insertions(+), 12 deletions(-)
> 
> diff --git a/xen/include/xen/compiler.h b/xen/include/xen/compiler.h
> index b118e4ba62eb..cc955be32664 100644
> --- a/xen/include/xen/compiler.h
> +++ b/xen/include/xen/compiler.h
> @@ -1,18 +1,10 @@
>  #ifndef __LINUX_COMPILER_H
>  #define __LINUX_COMPILER_H
>  
> -#if !defined(__GNUC__) || (__GNUC__ < 4)
> -#error Sorry, your compiler is too old/not recognized.
> -#elif CONFIG_CC_IS_GCC
> -# if defined(CONFIG_ARM_32) && CONFIG_GCC_VERSION < 40900
> -#  error Sorry, your version of GCC is too old - please use 4.9 or newer.
> -# elif defined(CONFIG_ARM_64) && CONFIG_GCC_VERSION < 50100
> -/*
> - * https://gcc.gnu.org/bugzilla/show_bug.cgi?id=63293
> - * https://lore.kernel.org/r/20210107111841.GN1551@shell.armlinux.org.uk
> - */
> -#  error Sorry, your version of GCC is too old - please use 5.1 or newer.
> -# endif
> +#if CONFIG_CC_IS_GCC && CONFIG_GCC_VERSION < 50100
> +# error Sorry, your version of GCC is too old - please use 5.1 or newer
> +#elif CONFIG_CC_IS_CLANG && CONFIG_CLANG_VERSION < 110000
> +# error Sorry, your version of Clang is too old - please use 11 or newer
>  #endif
>  
>  #define barrier()     __asm__ __volatile__("": : :"memory")
> -- 
> 2.39.5
> 
--8323329-363378920-1742595005=:2325679--

