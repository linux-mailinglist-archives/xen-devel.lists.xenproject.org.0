Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FFC389CF2C
	for <lists+xen-devel@lfdr.de>; Tue,  9 Apr 2024 02:07:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.702084.1096870 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtz0h-00079c-Dd; Tue, 09 Apr 2024 00:06:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 702084.1096870; Tue, 09 Apr 2024 00:06:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtz0h-00077h-AM; Tue, 09 Apr 2024 00:06:47 +0000
Received: by outflank-mailman (input) for mailman id 702084;
 Tue, 09 Apr 2024 00:06:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0ECT=LO=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rtz0f-00077b-4f
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2024 00:06:45 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0b6ae875-f605-11ee-843a-3f19d20e7db6;
 Tue, 09 Apr 2024 02:06:43 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 851EA614BF;
 Tue,  9 Apr 2024 00:06:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36C58C433F1;
 Tue,  9 Apr 2024 00:06:40 +0000 (UTC)
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
X-Inumbo-ID: 0b6ae875-f605-11ee-843a-3f19d20e7db6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712621201;
	bh=zbNdj2WYUOSUf6fB/f110ctUXb/tzN+ipzo51WNYh0o=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=nFLr33B54QJShUxWRMC9PhJJa4Uuaae6xdR61hMvKcSmawZr5lRzLgBCca+0gsTgU
	 +t6m6hy3TGNM97492xCUPYmPESgQ4/hQTmypoRW32WCE4rPqef7GXBG18HD6gYe1Lt
	 2ryYu3kJob1nbtQV8HTPJ0RgL3li1JQG4e5rO1hb4Gk1SXgr8kbgukJO11wERJ2K0z
	 EIANX6UZVKcMRD9A3dmIjNRANFaPAF0u4qg9TSgcxClzHntoGRHoEZUk/ft7B1YYWH
	 SbQb4mwze9ae2HXrf6C/fUCV1J7pOrD/Vzhoh68XcBWk4KaRJMQIJtKH7+8YuwGLB8
	 5MvsBDh6NgDlw==
Date: Mon, 8 Apr 2024 17:06:38 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [XEN PATCH v2 7/9] xen/xsm: address violation of MISRA C Rule
 16.2
In-Reply-To: <7fbb80bf62fc2e5f91a89375134622366c0b3891.1712305581.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2404081706100.2245130@ubuntu-linux-20-04-desktop>
References: <cover.1712305581.git.nicola.vetrini@bugseng.com> <7fbb80bf62fc2e5f91a89375134622366c0b3891.1712305581.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 5 Apr 2024, Nicola Vetrini wrote:
> Refactor the switch so that a violation of
> MISRA C Rule 16.2 is resolved (A switch label shall only be used
> when the most closely-enclosing compound statement is the body of
> a switch statement).
> Note that the switch clause ending with the pseudo
> keyword "fallthrough" is an allowed exception to Rule 16.3.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

I had to read this a few times, but it is correct

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> The second switch is not the best in terms of readability, so it may
> be best to deviate this particular instance.
> ---
>  xen/include/xsm/dummy.h | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/xen/include/xsm/dummy.h b/xen/include/xsm/dummy.h
> index 88039fdd227c..84d3a8ed1c94 100644
> --- a/xen/include/xsm/dummy.h
> +++ b/xen/include/xsm/dummy.h
> @@ -83,17 +83,17 @@ static always_inline int xsm_default_action(
>          return 0;
>      case XSM_TARGET:
>          if ( evaluate_nospec(src == target) )
> -        {
>              return 0;
> +        fallthrough;
>      case XSM_XS_PRIV:
> -            if ( evaluate_nospec(is_xenstore_domain(src)) )
> -                return 0;
> -        }
> -        /* fall through */
> +        if ( (action == XSM_XS_PRIV) &&
> +             evaluate_nospec(is_xenstore_domain(src)) )
> +            return 0;
> +        fallthrough;
>      case XSM_DM_PRIV:
>          if ( target && evaluate_nospec(src->target == target) )
>              return 0;
> -        /* fall through */
> +        fallthrough;
>      case XSM_PRIV:
>          if ( is_control_domain(src) )
>              return 0;
> -- 
> 2.34.1
> 

