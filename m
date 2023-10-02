Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E502D7B5D44
	for <lists+xen-devel@lfdr.de>; Tue,  3 Oct 2023 00:43:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.611819.951422 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnRd0-0001Rp-Mb; Mon, 02 Oct 2023 22:43:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 611819.951422; Mon, 02 Oct 2023 22:43:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnRd0-0001PL-Jq; Mon, 02 Oct 2023 22:43:02 +0000
Received: by outflank-mailman (input) for mailman id 611819;
 Mon, 02 Oct 2023 22:43:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oggk=FQ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qnRcy-0001P9-OA
 for xen-devel@lists.xenproject.org; Mon, 02 Oct 2023 22:43:00 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 088dda61-6175-11ee-98d2-6d05b1d4d9a1;
 Tue, 03 Oct 2023 00:42:59 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 53A20CE104D;
 Mon,  2 Oct 2023 22:42:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDAD7C433C7;
 Mon,  2 Oct 2023 22:42:51 +0000 (UTC)
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
X-Inumbo-ID: 088dda61-6175-11ee-98d2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696286573;
	bh=pLofm0+nX2ucZmJlrhodyVyFxCYFlphWF5PLjMEe/S0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=UL3PV1Tb4JtV3C1+WF27dZrL5ZeTNf5JMsjHS325rj2AQNzGASDM5xEfbwFF5T9SR
	 QKV/ZPeRPn7JstFgOzTR2fBPCKjNs1FUHTluAZmGT17Pxwz3pCTcWvQeTVMW8jTW4a
	 xHiAfnOxWBqhXrRZMh/9M7My3MHlFcAzcPIpc3OUAgfqfiFX4nNIz6PWvIfcRBd2ZL
	 rmJHUjCMZxPlX6HCRUi+FmO0eA3hojwflEMhahBjoy9/k0wuTLZhnbtd4+MoncAYHT
	 XknBm4i578BzUwrfB6NFyxPNHMPRWjITImrDtAO+1z3Uiz1Q0f7T+qImUyfOz8UBEg
	 LV40Rsl3O1Jrg==
Date: Mon, 2 Oct 2023 15:42:50 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, jbeulich@suse.com, andrew.cooper3@citrix.com, 
    roger.pau@citrix.com, Henry.Wang@arm.com, 
    George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
    Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH 6/7] xen/console: make function static inline
In-Reply-To: <c4f778440688a1e1f81cc149aca8dd5248895f68.1696232393.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2310021542430.2348112@ubuntu-linux-20-04-desktop>
References: <cover.1696232393.git.nicola.vetrini@bugseng.com> <c4f778440688a1e1f81cc149aca8dd5248895f68.1696232393.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 2 Oct 2023, Nicola Vetrini wrote:
> The definition of 'consoled_guest_tx' can be static inline,
> thereby fixing a violation of MISRA C:2012 Rule 8.4.
> 
> Fixes: 5ef49f185c2d ("x86/pv-shim: shadow PV console's page for L2 DomU")
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/include/xen/consoled.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/include/xen/consoled.h b/xen/include/xen/consoled.h
> index fd5d220a8aca..e943d8d48f7b 100644
> --- a/xen/include/xen/consoled.h
> +++ b/xen/include/xen/consoled.h
> @@ -12,7 +12,7 @@ size_t consoled_guest_tx(char c);
>  
>  #else
>  
> -size_t consoled_guest_tx(char c) { return 0; }
> +static inline size_t consoled_guest_tx(char c) { return 0; }
>  
>  #endif /* !CONFIG_PV_SHIM */
>  #endif /* __XEN_CONSOLED_H__ */
> -- 
> 2.34.1
> 

