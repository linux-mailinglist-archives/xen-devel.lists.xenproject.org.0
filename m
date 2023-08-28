Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E507578BB1B
	for <lists+xen-devel@lfdr.de>; Tue, 29 Aug 2023 00:43:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.591861.924414 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qakxB-0007W0-B3; Mon, 28 Aug 2023 22:43:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 591861.924414; Mon, 28 Aug 2023 22:43:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qakxB-0007TV-7F; Mon, 28 Aug 2023 22:43:25 +0000
Received: by outflank-mailman (input) for mailman id 591861;
 Mon, 28 Aug 2023 22:43:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yBR3=EN=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qakxA-0007TG-CE
 for xen-devel@lists.xenproject.org; Mon, 28 Aug 2023 22:43:24 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4ab6f29b-45f4-11ee-8783-cb3800f73035;
 Tue, 29 Aug 2023 00:43:23 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id ED23063A26;
 Mon, 28 Aug 2023 22:43:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C1EFC433C8;
 Mon, 28 Aug 2023 22:43:20 +0000 (UTC)
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
X-Inumbo-ID: 4ab6f29b-45f4-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693262601;
	bh=IDO2rh4H5NU92FmYdt5Zh0gtNUcSG4jcGlt/Mbsp24E=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=dfHzenc37vJEgbM0srVy7xAKTnZuQEmVYzkK38jep1LWC1KvQBCCkfVnQ6BBmt0V/
	 IlTu/XCxkdKKP7g9/t6dwmBvYLe47eBaHEHvDVJKlSnJTK5MPS/Wui/zv+M6wibcVj
	 QLCc0tM0w+SKDwHZYB7IFCqMsl/LfNpODRLd2gWRKNaQf4fHjEBdHKu4PnA8lUrQKA
	 KTIGOMPrydawym38YivnRRBWJ8uYX2ZWv2Lqb7Mdxj6eUvSACIvcank3O+mXKZt9qI
	 Sn3ZRLN4JNVeeJ2tos1Pl/4BioNf70Js6t/42BSDd+zjoRXdixu9ZD2BN/OaY99IqF
	 Zxx3ZboHJNF8A==
Date: Mon, 28 Aug 2023 15:43:18 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Simone Ballarin <simone.ballarin@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    sstabellini@kernel.org, George Dunlap <george.dunlap@citrix.com>, 
    Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [XEN PATCH 11/13] xen/sched: address violations of MISRA C:2012
 Directive 4.10
In-Reply-To: <8f2179f60335edcf97a04e1c35c7f4bb574c2145.1693228255.git.simone.ballarin@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2308281543120.6458@ubuntu-linux-20-04-desktop>
References: <cover.1693228255.git.simone.ballarin@bugseng.com> <8f2179f60335edcf97a04e1c35c7f4bb574c2145.1693228255.git.simone.ballarin@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 28 Aug 2023, Simone Ballarin wrote:
> Add inclusion guards to address violations of
> MISRA C:2012 Directive 4.10 ("Precautions shall be taken in order
> to prevent the contents of a header file being included more than
> once").
> 
> Mechanical change.
> 
> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/common/sched/compat.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/xen/common/sched/compat.c b/xen/common/sched/compat.c
> index a596e3a226..d718e450d4 100644
> --- a/xen/common/sched/compat.c
> +++ b/xen/common/sched/compat.c
> @@ -3,6 +3,10 @@
>   *
>   */
>  
> +#ifndef __COMMON_SCHED_COMPAT_C__
> +#define __COMMON_SCHED_COMPAT_C__
> +
> +
>  #include <compat/sched.h>
>  
>  #define COMPAT
> @@ -44,6 +48,8 @@ int compat_set_timer_op(uint32_t lo, int32_t hi)
>      return do_set_timer_op(((s64)hi << 32) | lo);
>  }
>  
> +#endif /* __COMMON_SCHED_COMPAT_C__ */
> +
>  /*
>   * Local variables:
>   * mode: C
> -- 
> 2.34.1
> 

