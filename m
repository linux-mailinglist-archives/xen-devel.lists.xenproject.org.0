Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4564778BB16
	for <lists+xen-devel@lfdr.de>; Tue, 29 Aug 2023 00:41:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.591852.924394 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qakv9-0006Oz-Nf; Mon, 28 Aug 2023 22:41:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 591852.924394; Mon, 28 Aug 2023 22:41:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qakv9-0006MV-KA; Mon, 28 Aug 2023 22:41:19 +0000
Received: by outflank-mailman (input) for mailman id 591852;
 Mon, 28 Aug 2023 22:41:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yBR3=EN=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qakv9-0006MP-43
 for xen-devel@lists.xenproject.org; Mon, 28 Aug 2023 22:41:19 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ffe79d68-45f3-11ee-8783-cb3800f73035;
 Tue, 29 Aug 2023 00:41:17 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 35E186192E;
 Mon, 28 Aug 2023 22:41:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75FFBC433C8;
 Mon, 28 Aug 2023 22:41:14 +0000 (UTC)
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
X-Inumbo-ID: ffe79d68-45f3-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693262475;
	bh=mNARWSW4ZzohMZ/kCWesyI+97PpTg66YZ9lPy6DUoLs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=JbiWbLpp5NbXuGCNcrX5jzltmWxzRgaP0Jj29bgp5EUdoUU/KWulpe+LHgT77Buom
	 /0tGWwXBkfsWDt7fdLftX70rFnmqvRB8w7MYiRpkwJSyV7uKOnirqP6hKTvS3IcePI
	 rNzoDCUpN7X6aPWJnQYN0r7QzIE0UcVgm+apytfKk7g55QLSzV5T8/Dc4pUj2DaTQ+
	 +13QXdiF+ITLYOJTNPXmTffGa19mR16OD0xwBhnRp/kPlxc6kmYJZ3NwLsFssRRJ35
	 x+9Rt+7lPuYYLzSAKw1WVTOOcQr4P+UmV6P/dUaKPcvzGnkusGkyr4Hx4NoMG4BJmU
	 YvP+Ihq9oP+uQ==
Date: Mon, 28 Aug 2023 15:41:12 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Simone Ballarin <simone.ballarin@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    sstabellini@kernel.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH 09/13] xen/common: address violations of MISRA C:2012
 Directive 4.10
In-Reply-To: <fe1768342df0cd9315af87c83cc6d8d09f61b983.1693228255.git.simone.ballarin@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2308281541050.6458@ubuntu-linux-20-04-desktop>
References: <cover.1693228255.git.simone.ballarin@bugseng.com> <fe1768342df0cd9315af87c83cc6d8d09f61b983.1693228255.git.simone.ballarin@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 28 Aug 2023, Simone Ballarin wrote:
> Add inclusion guards to address violations of
> MISRA C:2012 Directive 4.10 ("Precautions shall be taken in order
> to prevent the contents of a header file being included more than
> once").
> 
> Also C files, if included somewhere, need to comply with the guideline.
> 
> Mechanical change.
> 
> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/common/compat/grant_table.c | 7 +++++++
>  xen/common/coverage/gcc_4_7.c   | 5 +++++
>  xen/common/decompress.h         | 5 +++++
>  xen/common/event_channel.h      | 5 +++++
>  xen/common/multicall.c          | 5 +++++
>  5 files changed, 27 insertions(+)
> 
> diff --git a/xen/common/compat/grant_table.c b/xen/common/compat/grant_table.c
> index f8177c84c0..614ad71a59 100644
> --- a/xen/common/compat/grant_table.c
> +++ b/xen/common/compat/grant_table.c
> @@ -3,6 +3,10 @@
>   *
>   */
>  
> +
> +#ifndef __COMMON_COMPAT_GRANT_TABLE_C__
> +#define __COMMON_COMPAT_GRANT_TABLE_C__
> +
>  #include <xen/hypercall.h>
>  #include <compat/grant_table.h>
>  
> @@ -331,6 +335,9 @@ int compat_grant_table_op(
>      return rc;
>  }
>  
> +
> +#endif /* __COMMON_COMPAT_GRANT_TABLE_C__ */
> +
>  /*
>   * Local variables:
>   * mode: C
> diff --git a/xen/common/coverage/gcc_4_7.c b/xen/common/coverage/gcc_4_7.c
> index 25b4a8bcdc..12e4ec8cbb 100644
> --- a/xen/common/coverage/gcc_4_7.c
> +++ b/xen/common/coverage/gcc_4_7.c
> @@ -14,6 +14,9 @@
>   *    Wei Liu <wei.liu2@citrix.com>
>   */
>  
> +#ifndef __COMMON_COVERAGE_GCC_4_7_C__
> +#define __COMMON_COVERAGE_GCC_4_7_C__
> +
>  #include <xen/string.h>
>  
>  #include "gcov.h"
> @@ -193,6 +196,8 @@ size_t gcov_info_to_gcda(char *buffer, const struct gcov_info *info)
>      return pos;
>  }
>  
> +#endif /* __COMMON_COVERAGE_GCC_4_7_C__ */
> +
>  /*
>   * Local variables:
>   * mode: C
> diff --git a/xen/common/decompress.h b/xen/common/decompress.h
> index e8195b353a..da3c3abb6a 100644
> --- a/xen/common/decompress.h
> +++ b/xen/common/decompress.h
> @@ -1,3 +1,6 @@
> +#ifndef __COMMON_DECOMPRESS_H__
> +#define __COMMON_DECOMPRESS_H__
> +
>  #ifdef __XEN__
>  
>  #include <xen/cache.h>
> @@ -23,3 +26,5 @@
>  #define large_free free
>  
>  #endif
> +
> +#endif /* __COMMON_DECOMPRESS_H__ */
> diff --git a/xen/common/event_channel.h b/xen/common/event_channel.h
> index 45219ca67c..040bad77f9 100644
> --- a/xen/common/event_channel.h
> +++ b/xen/common/event_channel.h
> @@ -1,5 +1,8 @@
>  /* Event channel handling private header. */
>  
> +#ifndef __COMMON_EVENT_CHANNEL_H__
> +#define __COMMON_EVENT_CHANNEL_H__
> +
>  #include <xen/event.h>
>  
>  static inline unsigned int max_evtchns(const struct domain *d)
> @@ -52,6 +55,8 @@ int evtchn_fifo_init_control(struct evtchn_init_control *init_control);
>  int evtchn_fifo_expand_array(const struct evtchn_expand_array *expand_array);
>  void evtchn_fifo_destroy(struct domain *d);
>  
> +#endif /* __COMMON_EVENT_CHANNEL_H__ */
> +
>  /*
>   * Local variables:
>   * mode: C
> diff --git a/xen/common/multicall.c b/xen/common/multicall.c
> index 1f0cc4cb26..421bb25b70 100644
> --- a/xen/common/multicall.c
> +++ b/xen/common/multicall.c
> @@ -2,6 +2,9 @@
>   * multicall.c
>   */
>  
> +#ifndef __COMMON_MULTICALL_C__
> +#define __COMMON_MULTICALL_C__
> +
>  #include <xen/types.h>
>  #include <xen/lib.h>
>  #include <xen/mm.h>
> @@ -124,6 +127,8 @@ ret_t do_multicall(
>          __HYPERVISOR_multicall, "hi", call_list, nr_calls-i);
>  }
>  
> +#endif /* __COMMON_MULTICALL_C__ */
> +
>  /*
>   * Local variables:
>   * mode: C
> -- 
> 2.34.1
> 

