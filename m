Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADDF959A81A
	for <lists+xen-devel@lfdr.de>; Sat, 20 Aug 2022 00:16:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.390497.627980 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oPAHd-0007tD-SK; Fri, 19 Aug 2022 22:16:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 390497.627980; Fri, 19 Aug 2022 22:16:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oPAHd-0007qv-ON; Fri, 19 Aug 2022 22:16:05 +0000
Received: by outflank-mailman (input) for mailman id 390497;
 Fri, 19 Aug 2022 22:16:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c1Kg=YX=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oPAHc-0007qn-PK
 for xen-devel@lists.xenproject.org; Fri, 19 Aug 2022 22:16:04 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 83a12924-200c-11ed-9250-1f966e50362f;
 Sat, 20 Aug 2022 00:16:03 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 57363B8274A;
 Fri, 19 Aug 2022 22:16:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A85EFC433C1;
 Fri, 19 Aug 2022 22:16:01 +0000 (UTC)
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
X-Inumbo-ID: 83a12924-200c-11ed-9250-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660947362;
	bh=S24Vv4s4BGIHprYXiH/w+uB48DOEr4keqFRNxiZg/bY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=MmeauJ4bSEcCSkVtKqwMyU3zPmHFhqkd4Bot8oDtlixE63HDN8lhJJMsAvxPKWCPl
	 C7jd0h0Uqn4IJGfvdAAN9+lAn6Fv9QPDX+rtal/79nI6Br5F1nLv/NP9WIg/vIfNZ4
	 bRb/DAGSLbdZh4O72WVK0G41PbYkcwWKMmHNy8U8//DEe8GuLAiPXxJTDxkgE2wRcq
	 pO9zhmI9tRrN0SEvqNkVWrZSBoSq/zoceYK3U6lg6bptjUiFUagflky23C6Zhwwfv7
	 kQB48OFLRa0dTVYDedBsa822EMCVRjOi1KrXexpTACE4/G+7yiZY05NVOqDLnQHO6p
	 qE64YtoJbBkmg==
Date: Fri, 19 Aug 2022 15:16:01 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Xenia Ragiadakou <burzalodowa@gmail.com>
cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH 3/7] xen/elf: Fix MISRA C 2012 Rule 20.7 violations
In-Reply-To: <20220819194359.1196539-4-burzalodowa@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2208191515210.3790@ubuntu-linux-20-04-desktop>
References: <20220819194359.1196539-1-burzalodowa@gmail.com> <20220819194359.1196539-4-burzalodowa@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 19 Aug 2022, Xenia Ragiadakou wrote:
> In macros ELF32_ST_TYPE() and ELF64_ST_TYPE(), add parentheses around the
> macro parameter to prevent against unintended expansions.
> 
> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/include/xen/elfstructs.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/include/xen/elfstructs.h b/xen/include/xen/elfstructs.h
> index 616ebf9269..0a7c558a80 100644
> --- a/xen/include/xen/elfstructs.h
> +++ b/xen/include/xen/elfstructs.h
> @@ -305,11 +305,11 @@ typedef struct {
>  
>  /* Extract symbol info - st_info */
>  #define ELF32_ST_BIND(x)	((x) >> 4)
> -#define ELF32_ST_TYPE(x)	(((unsigned int) x) & 0xf)
> +#define ELF32_ST_TYPE(x)	(((unsigned int) (x)) & 0xf)
>  #define ELF32_ST_INFO(b,t)	(((b) << 4) + ((t) & 0xf))
>  
>  #define ELF64_ST_BIND(x)	((x) >> 4)
> -#define ELF64_ST_TYPE(x)	(((unsigned int) x) & 0xf)
> +#define ELF64_ST_TYPE(x)	(((unsigned int) (x)) & 0xf)
>  #define ELF64_ST_INFO(b,t)	(((b) << 4) + ((t) & 0xf))
>  
>  /* Symbol Binding - ELF32_ST_BIND - st_info */
> -- 
> 2.34.1
> 

