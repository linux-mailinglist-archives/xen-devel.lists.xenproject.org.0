Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E83A8CB80D
	for <lists+xen-devel@lfdr.de>; Wed, 22 May 2024 03:21:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.727157.1131563 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9aes-0003pa-L9; Wed, 22 May 2024 01:20:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 727157.1131563; Wed, 22 May 2024 01:20:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9aes-0003o3-IR; Wed, 22 May 2024 01:20:46 +0000
Received: by outflank-mailman (input) for mailman id 727157;
 Wed, 22 May 2024 01:20:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ujjH=MZ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s9aer-0003nx-3P
 for xen-devel@lists.xenproject.org; Wed, 22 May 2024 01:20:45 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7f8fad40-17d9-11ef-b4bb-af5377834399;
 Wed, 22 May 2024 03:20:41 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 0393CCE104A;
 Wed, 22 May 2024 01:20:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 029F0C2BD11;
 Wed, 22 May 2024 01:20:35 +0000 (UTC)
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
X-Inumbo-ID: 7f8fad40-17d9-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716340837;
	bh=usutB9kPWnf7yH5amBRs8apuxDPP3FOX4HkS9wiYDt4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=toiKTwUlVz7v3j4HqRj5tLETv5GhQGYDP8KZwP07g66Aa1Gs7X/YGqqT1GOrPYIVD
	 lRsc1TEYG9eTZf61cUwDwcr33GnMkkBaHR25S7mYLwIx5ThRIpul/WttCTnFKHHXA+
	 IssliekBlOkUC53+2/Unq32AtSCnYqAtAiivAtI7GNMHwLLsXDQ4tenTCwp2QbBdYD
	 mBJ4C9u/7Chhl/8k9IhSJNIKeSuDVfRIr/Ni4R3nNkSFgc2t3GKyDwq8YojqY+2nbm
	 aMoOpKHb+sMjk+Npu00vsU7AyYRVFy594wQnWifc4OlYT77Zl6XQLBxTRCze7Fwyj6
	 dpSJkHDQOgxmA==
Date: Tue, 21 May 2024 18:20:34 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <JBeulich@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Roberto Bagnara <roberto.bagnara@bugseng.com>, 
    "consulting @ bugseng . com" <consulting@bugseng.com>, 
    Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH 1/3] xen/lzo: Implement COPY{4,8} using memcpy()
In-Reply-To: <20240521171546.3650664-2-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2405211819560.1052252@ubuntu-linux-20-04-desktop>
References: <20240521171546.3650664-1-andrew.cooper3@citrix.com> <20240521171546.3650664-2-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 21 May 2024, Andrew Cooper wrote:
> This is simpler and easier for both humans and compilers to read.
> 
> It also addresses 6 instances of MISRA R5.3 violation (shadowing of the ptr_
> local variable inside both {put,get}_unaligned()).
> 
> No change, not even in the compiled binary.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> CC: George Dunlap <George.Dunlap@citrix.com>
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: Roberto Bagnara <roberto.bagnara@bugseng.com>
> CC: consulting@bugseng.com <consulting@bugseng.com>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
>  xen/common/lzo.c | 11 ++---------
>  1 file changed, 2 insertions(+), 9 deletions(-)
> 
> diff --git a/xen/common/lzo.c b/xen/common/lzo.c
> index cc03f0f5547f..3454ce4a7e24 100644
> --- a/xen/common/lzo.c
> +++ b/xen/common/lzo.c
> @@ -25,15 +25,8 @@
>   */
>  
>  
> -#define COPY4(dst, src)    \
> -        put_unaligned(get_unaligned((const u32 *)(src)), (u32 *)(dst))
> -#if defined(__x86_64__)
> -#define COPY8(dst, src)    \
> -        put_unaligned(get_unaligned((const u64 *)(src)), (u64 *)(dst))
> -#else
> -#define COPY8(dst, src)    \
> -        COPY4(dst, src); COPY4((dst) + 4, (src) + 4)
> -#endif
> +#define COPY4(dst, src) memcpy(dst, src, 4)
> +#define COPY8(dst, src) memcpy(dst, src, 8)
>  
>  #ifdef __MINIOS__
>  # include <lib.h>
> -- 
> 2.30.2
> 

