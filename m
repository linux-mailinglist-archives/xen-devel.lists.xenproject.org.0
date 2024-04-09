Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD42B89E4DF
	for <lists+xen-devel@lfdr.de>; Tue,  9 Apr 2024 23:24:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.702830.1098410 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruIwp-0003HU-8y; Tue, 09 Apr 2024 21:24:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 702830.1098410; Tue, 09 Apr 2024 21:24:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruIwp-0003FS-6N; Tue, 09 Apr 2024 21:24:07 +0000
Received: by outflank-mailman (input) for mailman id 702830;
 Tue, 09 Apr 2024 21:24:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0ECT=LO=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ruIwo-0003FM-L9
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2024 21:24:06 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7bfeb704-f6b7-11ee-94a3-07e782e9044d;
 Tue, 09 Apr 2024 23:24:03 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 15BEECE127B;
 Tue,  9 Apr 2024 21:23:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C55A1C433C7;
 Tue,  9 Apr 2024 21:23:56 +0000 (UTC)
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
X-Inumbo-ID: 7bfeb704-f6b7-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712697837;
	bh=l9AkjMm+J2n3uYpxzrGZgiFxOgUN7vUdT8bfKjK/pek=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=cg53QKF7dYjDxWAemP1q+Z4UUnuZlggw/Ym+ONSzdNfPIMYpnFYZqA8b8bpIcGneD
	 5+fO7zbc/kpuAEFPiYYl3t+/usiZoXnDrQeeIhL/pq6RNFonB2ec4881bBzbdqhJ/d
	 /n/RvH4hkM65XvGvnmpaaej9IsBPC1E1YLVYDLibEpJ2wtd74BuCOAz4pBRyrkILMe
	 W1v+7IQIMvq3DFFdA0oXYmYvflZiqk4CIrSPFYRfhGwSAQltTaM/oc6Nnnr3Dy0lho
	 pfhtY/uaPyTEBLzC+fcSfGmIFYMXKTtnfoCTSwEurc7SleFgYVktcGkQTZNADk7kjO
	 Yyjvj4kk8IV3g==
Date: Tue, 9 Apr 2024 14:23:55 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    Jan Beulich <JBeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH] x86/entry: Fix build with older toolchains
In-Reply-To: <20240409203951.577241-1-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2404091423460.2245130@ubuntu-linux-20-04-desktop>
References: <20240409203951.577241-1-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-152951099-1712697833=:2245130"
Content-ID: <alpine.DEB.2.22.394.2404091423540.2245130@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-152951099-1712697833=:2245130
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2404091423541.2245130@ubuntu-linux-20-04-desktop>

On Tue, 9 Apr 2024, Andrew Cooper wrote:
> Binutils older than 2.29 doesn't know INCSSPD.
> 
> Fixes: 8e186f98ce0e ("x86: Use indirect calls in reset-stack infrastructure")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> ---
>  xen/arch/x86/x86_64/entry.S | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/xen/arch/x86/x86_64/entry.S b/xen/arch/x86/x86_64/entry.S
> index 461bbc355872..a4615e1ccbaf 100644
> --- a/xen/arch/x86/x86_64/entry.S
> +++ b/xen/arch/x86/x86_64/entry.S
> @@ -650,7 +650,9 @@ FUNC(continue_pv_domain)
>           * JMPed to.  Drop the return address.
>           */
>          add   $8, %rsp
> +#ifdef CONFIG_XEN_SHSTK
>          ALTERNATIVE "", "mov $2, %eax; incsspd %eax", X86_FEATURE_XEN_SHSTK
> +#endif
>  
>          call  check_wakeup_from_wait
>  ret_from_intr:
> 
> base-commit: d5887c0decbd90e798b24ed696628645b04632fb
> -- 
> 2.30.2
> 
> 
--8323329-152951099-1712697833=:2245130--

