Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6CCD8C2BBF
	for <lists+xen-devel@lfdr.de>; Fri, 10 May 2024 23:22:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.720073.1123046 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5Xgc-00021n-1e; Fri, 10 May 2024 21:21:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 720073.1123046; Fri, 10 May 2024 21:21:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5Xgb-0001z5-UE; Fri, 10 May 2024 21:21:49 +0000
Received: by outflank-mailman (input) for mailman id 720073;
 Fri, 10 May 2024 21:21:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pcT1=MN=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s5Xga-0001yj-9E
 for xen-devel@lists.xenproject.org; Fri, 10 May 2024 21:21:48 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4cc9fbc9-0f13-11ef-b4bb-af5377834399;
 Fri, 10 May 2024 23:21:46 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id C2586CE1E9B;
 Fri, 10 May 2024 21:21:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 087C0C113CC;
 Fri, 10 May 2024 21:21:40 +0000 (UTC)
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
X-Inumbo-ID: 4cc9fbc9-0f13-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715376102;
	bh=NXPBefajJWp5diqqNfsdQGCulnXOO8URjp6YDf+9Xh4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=jqzmA9ObewJi5LbCMrINWHOmSP9EJEu/Fy+xByuAZet3fSj8sJ4sNdOSpqlJ4fRZy
	 zBOkIw1DoWbGH4ya4jEFOIs39W27x55u0YdA9QEBfS7s/9nJjx/bIcegaAJLNNHKrN
	 UA+KFm00Wj/TWzaADOBhaMLu25peYimZbTgtgjN0jLNv++OZz4vMjWBSLhlh8Qosba
	 OreZsC/gQ/P9Mo76SIK2ti7QcUns2KM0C5NfL7NwWXCDJ9YysS4MoFF6dRDg8yfBVo
	 Yt1qSAJeGU7oXvw7wc+MCc8O6chtb+2Ho9pRum+k6jKoyXAvL7qE1Ek8X5affP15Yq
	 6XVjF/SvG8iog==
Date: Fri, 10 May 2024 14:21:39 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    Jan Beulich <JBeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Nicola Vetrini <nicola.vetrini@bugseng.com>, 
    "consulting @ bugseng . com" <consulting@bugseng.com>
Subject: Re: [PATCH] x86/io: Don't cast away constness in read{b..q}()
In-Reply-To: <20240510192631.2296870-1-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2405101421310.2544314@ubuntu-linux-20-04-desktop>
References: <20240510192631.2296870-1-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-2057329677-1715376102=:2544314"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-2057329677-1715376102=:2544314
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 10 May 2024, Andrew Cooper wrote:
> Addresses various MISRA R11.8 violations.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
> CC: consulting@bugseng.com <consulting@bugseng.com>
> ---
>  xen/arch/x86/include/asm/io.h | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/arch/x86/include/asm/io.h b/xen/arch/x86/include/asm/io.h
> index 9b19d2d389ee..1cb4217cff39 100644
> --- a/xen/arch/x86/include/asm/io.h
> +++ b/xen/arch/x86/include/asm/io.h
> @@ -4,10 +4,10 @@
>  #include <xen/vmap.h>
>  #include <xen/types.h>
>  
> -#define readb(x) (*(volatile uint8_t  *)(x))
> -#define readw(x) (*(volatile uint16_t *)(x))
> -#define readl(x) (*(volatile uint32_t *)(x))
> -#define readq(x) (*(volatile uint64_t *)(x))
> +#define readb(x) (*(const volatile uint8_t  *)(x))
> +#define readw(x) (*(const volatile uint16_t *)(x))
> +#define readl(x) (*(const volatile uint32_t *)(x))
> +#define readq(x) (*(const volatile uint64_t *)(x))
>  #define writeb(d,x) (*(volatile uint8_t  *)(x) = (d))
>  #define writew(d,x) (*(volatile uint16_t *)(x) = (d))
>  #define writel(d,x) (*(volatile uint32_t *)(x) = (d))
> 
> base-commit: b0082b908391b29b7c4dd5e6c389ebd6481926f8
> -- 
> 2.30.2
> 
--8323329-2057329677-1715376102=:2544314--

