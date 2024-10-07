Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E619899396D
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2024 23:39:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.812515.1225293 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxvQw-0005lq-U4; Mon, 07 Oct 2024 21:38:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 812515.1225293; Mon, 07 Oct 2024 21:38:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxvQw-0005ie-Qh; Mon, 07 Oct 2024 21:38:26 +0000
Received: by outflank-mailman (input) for mailman id 812515;
 Mon, 07 Oct 2024 21:38:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QHG9=RD=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sxvQv-0005dL-AZ
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2024 21:38:25 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 796cf64b-84f4-11ef-99a2-01e77a169b0f;
 Mon, 07 Oct 2024 23:38:22 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CB92D5C5DC1;
 Mon,  7 Oct 2024 21:38:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E5EBC4CEC6;
 Mon,  7 Oct 2024 21:38:19 +0000 (UTC)
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
X-Inumbo-ID: 796cf64b-84f4-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728337100;
	bh=sEdm/Squhg0RayXaMiMYS8WlURo2VsJiTcHepsTlbOw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=OfQMnxzS4bmH0pWAKZUSygxAlGllc7trAVGMqekjMME2xfZiWhzE5d71Zf/7/Qu6/
	 P+Spgssnwj6FQbW1seYFxBfGB6iv5NGZKy+mOTD3BxYiqzaebsoOnq2je21ra0q9oy
	 qrkRdcUrljMKGo8Tu8qhCTQ5/hf7u3+3JrEzNg7Y4TShpkSsTpuodEg8ZibudQq5KK
	 YsQtvo8VbLuaR8I8TDtnA+9M/ew6lkO9tEeIKGxA7gluhxJzigl78n9GCzkKd1ksil
	 IUKVga62b580GgKAgl496YPD6aWncR8d7YpaCPV0dEzGLbwYW3flCoE9lo1A38+GqL
	 ockWvt1U0b53A==
Date: Mon, 7 Oct 2024 14:38:18 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
cc: qemu-devel@nongnu.org, sstabellini@kernel.org, anthony@xenproject.org, 
    paul@xen.org, peter.maydell@linaro.org, edgar.iglesias@amd.com, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1 1/1] hw/xen: Avoid use of uninitialized
 bufioreq_evtchn
In-Reply-To: <20241007211643.1572271-2-edgar.iglesias@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2410071438110.3512606@ubuntu-linux-20-04-desktop>
References: <20241007211643.1572271-1-edgar.iglesias@gmail.com> <20241007211643.1572271-2-edgar.iglesias@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 7 Oct 2024, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> 
> Avoid use of uninitialized bufioreq_evtchn. It should only
> be used if buffered IOREQs are enabled.
> 
> Resolves: Coverity CID 1563383
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  hw/xen/xen-hvm-common.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/xen/xen-hvm-common.c b/hw/xen/xen-hvm-common.c
> index 7d2b72853b..7ffbbfea23 100644
> --- a/hw/xen/xen-hvm-common.c
> +++ b/hw/xen/xen-hvm-common.c
> @@ -752,9 +752,10 @@ static int xen_map_ioreq_server(XenIOState *state)
>          return -1;
>      }
>  
> -    trace_xen_map_ioreq_server_buffered_io_evtchn(bufioreq_evtchn);
> -
> -    state->bufioreq_remote_port = bufioreq_evtchn;
> +    if (state->has_bufioreq) {
> +        trace_xen_map_ioreq_server_buffered_io_evtchn(bufioreq_evtchn);
> +        state->bufioreq_remote_port = bufioreq_evtchn;
> +    }
>  
>      return 0;
>  }
> -- 
> 2.43.0
> 

