Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2EC7491FC
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jul 2023 01:42:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559573.874667 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHC8j-0001zF-9v; Wed, 05 Jul 2023 23:42:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559573.874667; Wed, 05 Jul 2023 23:42:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHC8j-0001xF-6w; Wed, 05 Jul 2023 23:42:29 +0000
Received: by outflank-mailman (input) for mailman id 559573;
 Wed, 05 Jul 2023 23:42:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UsP3=CX=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qHC8i-0001x9-DC
 for xen-devel@lists.xenproject.org; Wed, 05 Jul 2023 23:42:28 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 980e11d9-1b8d-11ee-8611-37d641c3527e;
 Thu, 06 Jul 2023 01:42:26 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BFC5E6177F;
 Wed,  5 Jul 2023 23:42:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4AC9C433C7;
 Wed,  5 Jul 2023 23:42:22 +0000 (UTC)
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
X-Inumbo-ID: 980e11d9-1b8d-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688600544;
	bh=dWbri8bzF1HDakQksuSj1aHl1CKUSs74FrqPbyC1llM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=FRDMnjqVAPkfNYvHrPI4AiszoUMOWvqpY+91FdUbXFmxrK3E5h3IbrOTHXfuIQhL4
	 GtAcjR2Eeo1ajdqlE1f5im3w2IJYa08eCjm4BtjXf0mpz6MwezavxtDS/IjFWf/psp
	 QuQ45u4BpuQM1Hiz6eH5+pu3u1cCK6t0BUnFKIE2+eX/+HtcpQisBljppuUHtPctIi
	 RTPXiQrU0bZpBfDAmDRhOAVB1JPL45f657jUNwyGgKyYxfTLSaiyfw/yjPn5zP3rFf
	 mUmvu3ztpOIP98n21cK/7CW6pm435wQ5pdKeAPRg8mhPBJek+sUDnVof79EY17BKcf
	 LigqD1AttGqjQ==
Date: Wed, 5 Jul 2023 16:42:20 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Simone Ballarin <simone.ballarin@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Gianluca Luparini <gianluca.luparini@bugseng.com>, 
    Juergen Gross <jgross@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>, 
    Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Subject: Re: [XEN PATCH v2 09/13] xen/public: fix violations of MISRA C:2012
 Rule 7.2
In-Reply-To: <9e0d463e2fc09193a742fc7a64a331855705a4fb.1688559115.git.gianluca.luparini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2307051641350.761183@ubuntu-linux-20-04-desktop>
References: <cover.1688559115.git.gianluca.luparini@bugseng.com> <9e0d463e2fc09193a742fc7a64a331855705a4fb.1688559115.git.gianluca.luparini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 5 Jul 2023, Simone Ballarin wrote:
> From: Gianluca Luparini <gianluca.luparini@bugseng.com>
> 
> The xen sources contains violations of MISRA C:2012 Rule 7.2 whose
> headline states:
> "A 'u' or 'U' suffix shall be applied to all integer constants
> that are represented in an unsigned type".
> 
> Add the 'U' suffix to integers literals with unsigned type and also to other
> literals used in the same contexts or near violations, when their positive
> nature is immediately clear. The latter changes are done for the sake of
> uniformity.
> 
> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
> Signed-off-by: Gianluca Luparini <gianluca.luparini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Changes in v2:
> - minor change to commit title
> - change commit message
> - correct macros code style
> ---
>  xen/include/public/io/ring.h | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/xen/include/public/io/ring.h b/xen/include/public/io/ring.h
> index 025939278b..0cae4367be 100644
> --- a/xen/include/public/io/ring.h
> +++ b/xen/include/public/io/ring.h
> @@ -36,11 +36,11 @@
>  typedef unsigned int RING_IDX;
>  
>  /* Round a 32-bit unsigned constant down to the nearest power of two. */
> -#define __RD2(_x)  (((_x) & 0x00000002) ? 0x2                  : ((_x) & 0x1))
> -#define __RD4(_x)  (((_x) & 0x0000000c) ? __RD2((_x)>>2)<<2    : __RD2(_x))
> -#define __RD8(_x)  (((_x) & 0x000000f0) ? __RD4((_x)>>4)<<4    : __RD4(_x))
> -#define __RD16(_x) (((_x) & 0x0000ff00) ? __RD8((_x)>>8)<<8    : __RD8(_x))
> -#define __RD32(_x) (((_x) & 0xffff0000) ? __RD16((_x)>>16)<<16 : __RD16(_x))
> +#define __RD2(x)  (((x) & 0x00000002U) ? 0x2                     : ((x) & 0x1))
> +#define __RD4(x)  (((x) & 0x0000000cU) ? __RD2((x) >> 2) << 2    : __RD2(x))
> +#define __RD8(x)  (((x) & 0x000000f0U) ? __RD4((x) >> 4) << 4    : __RD4(x))
> +#define __RD16(x) (((x) & 0x0000ff00U) ? __RD8((x) >> 8) << 8    : __RD8(x))
> +#define __RD32(x) (((x) & 0xffff0000U) ? __RD16((x) >> 16) << 16 : __RD16(x))
>  
>  /*
>   * Calculate size of a shared ring, given the total available space for the
> -- 
> 2.41.0
> 

