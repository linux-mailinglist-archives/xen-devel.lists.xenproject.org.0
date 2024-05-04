Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF80F8BB8A5
	for <lists+xen-devel@lfdr.de>; Sat,  4 May 2024 02:15:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.716729.1118952 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3345-0003sR-Ti; Sat, 04 May 2024 00:15:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 716729.1118952; Sat, 04 May 2024 00:15:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3345-0003pf-QK; Sat, 04 May 2024 00:15:45 +0000
Received: by outflank-mailman (input) for mailman id 716729;
 Sat, 04 May 2024 00:15:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=498C=MH=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s3344-0003oi-5i
 for xen-devel@lists.xenproject.org; Sat, 04 May 2024 00:15:44 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 70a12c86-09ab-11ef-909c-e314d9c70b13;
 Sat, 04 May 2024 02:15:42 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 6A578CE1A2D;
 Sat,  4 May 2024 00:15:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E57AC4AF19;
 Sat,  4 May 2024 00:15:36 +0000 (UTC)
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
X-Inumbo-ID: 70a12c86-09ab-11ef-909c-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714781738;
	bh=pSXP/4179EUBJj40KOXInEIVPWcP3gBPOrw7GTh+l8Q=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=I8/Hxr9HrXvsGkZYevCU1bm7QsJAQ9ZAtbPMLczt1iFyTUSDYC9bJA8KBQuindaAZ
	 yP5dAVauspM4LVZHJBOauhRqNo8TASGs1jG9ZhCzqCDMfcRVyo7Mo4wHpLfS0+OmeV
	 cGG1ySA9QQTM6+4PSLknnZgVDLQCbqSsJHpsjrN0BfwQkFbu4clVNNYwI8/pATyJH4
	 /Tr5uY5H+cN0PWLx2rF5T/BtUBvK9fVHZTFi8nKxtlUmLOqL/nJADIeZQHaQA+03Vd
	 B/r9iBw5ghIWkbbL3sG8qAqo1R2cIxuyEm1Sfz37A5YmuNQXtsss/IqdEuAxwvyyVK
	 MOddGHwNxROHA==
Date: Fri, 3 May 2024 17:15:36 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org, 
    bertrand.marquis@arm.com, michal.orzel@amd.com, Volodymyr_Babchuk@epam.com, 
    jbeulich@suse.com, andrew.cooper3@citrix.com, edgar.iglesias@amd.com
Subject: Re: [PATCH v3 8/9] xen/arm64: cache: Use the generic xen/linkage.h
 macros
In-Reply-To: <20240501035448.964625-9-edgar.iglesias@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2405031715300.1151289@ubuntu-linux-20-04-desktop>
References: <20240501035448.964625-1-edgar.iglesias@gmail.com> <20240501035448.964625-9-edgar.iglesias@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 1 May 2024, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> 
> Use the generic xen/linkage.h macros to annotate code symbols.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/arch/arm/arm64/cache.S | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/arm/arm64/cache.S b/xen/arch/arm/arm64/cache.S
> index 9a88a2b497..66ed85f735 100644
> --- a/xen/arch/arm/arm64/cache.S
> +++ b/xen/arch/arm/arm64/cache.S
> @@ -40,7 +40,7 @@
>   *	- kaddr   - kernel address
>   *	- size    - size in question
>   */
> -ENTRY(__flush_dcache_area)
> +FUNC(__flush_dcache_area)
>  	dcache_line_size x2, x3
>  	add	x1, x0, x1
>  	sub	x3, x2, #1
> @@ -51,4 +51,4 @@ ENTRY(__flush_dcache_area)
>  	b.lo	1b
>  	dsb	sy
>  	ret
> -ENDPROC(__flush_dcache_area)
> +END(__flush_dcache_area)
> -- 
> 2.40.1
> 

