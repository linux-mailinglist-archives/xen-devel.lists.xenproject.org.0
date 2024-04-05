Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CFF789927D
	for <lists+xen-devel@lfdr.de>; Fri,  5 Apr 2024 02:11:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701039.1095070 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsXAu-0001G3-LL; Fri, 05 Apr 2024 00:11:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701039.1095070; Fri, 05 Apr 2024 00:11:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsXAu-0001EB-Ho; Fri, 05 Apr 2024 00:11:20 +0000
Received: by outflank-mailman (input) for mailman id 701039;
 Fri, 05 Apr 2024 00:11:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GKl/=LK=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rsXAt-0001E5-Bb
 for xen-devel@lists.xenproject.org; Fri, 05 Apr 2024 00:11:19 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 05118aee-f2e1-11ee-a1ef-f123f15fe8a2;
 Fri, 05 Apr 2024 02:11:17 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B433F61760;
 Fri,  5 Apr 2024 00:11:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BB8FC433C7;
 Fri,  5 Apr 2024 00:11:14 +0000 (UTC)
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
X-Inumbo-ID: 05118aee-f2e1-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712275875;
	bh=4imSE6SeydPBnL4L4W+FoBGx4LT9iAce8CQA7NgZOMI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=P6s8PUHzo15j81341lStTZfPhCA7BSBwjWUO9homQia8IpRZrjmuXGFUtUBesGizh
	 7LYCKT99mPmPQviHWcwOVYN6jyySpqemsJwArUMsYP1/bxIHTyPAqy2I/1xDjn2wy9
	 FFeb25ITy+y6eUnwaXQGN44OLTDY+EblUBWl5RFMpDvQC0IC+OI9Z61uS6DuhZT7p3
	 BeRiRGCWdw+hb1tOeTpjaNYncWR9YW2x8SUj81tAO+za0Nrg9+jvBESPpW7zv8f9Ge
	 /Myyrksuu8kjpQdRrJCfNEfkh7RzY7ZrKVlRzY3Rjjf5QI7GC9myq/i4rNvnYyD8lv
	 qOwVmUlcl3Cbw==
Date: Thu, 4 Apr 2024 17:11:13 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, bertrand.marquis@arm.com, julien@xen.org, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [XEN PATCH v3 2/7] arm/public: address violations of MISRA C
 Rule 20.7
In-Reply-To: <142c27a41cea7402a68035dd466db0b47487fb06.1711700095.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2404041711040.2245130@ubuntu-linux-20-04-desktop>
References: <cover.1711700095.git.nicola.vetrini@bugseng.com> <142c27a41cea7402a68035dd466db0b47487fb06.1711700095.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 29 Mar 2024, Nicola Vetrini wrote:
> MISRA C Rule 20.7 states: "Expressions resulting from the expansion
> of macro parameters shall be enclosed in parentheses". Therefore, some
> macro definitions should gain additional parentheses to ensure that all
> current and future users will be safe with respect to expansions that
> can possibly alter the semantics of the passed-in macro parameter.
> 
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/include/public/arch-arm.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
> index a25e87dbda3a..e167e14f8df9 100644
> --- a/xen/include/public/arch-arm.h
> +++ b/xen/include/public/arch-arm.h
> @@ -209,7 +209,7 @@
>      do {                                                    \
>          __typeof__(&(hnd)) _sxghr_tmp = &(hnd);             \
>          _sxghr_tmp->q = 0;                                  \
> -        _sxghr_tmp->p = val;                                \
> +        _sxghr_tmp->p = (val);                              \
>      } while ( 0 )
>  #define set_xen_guest_handle(hnd, val) set_xen_guest_handle_raw(hnd, val)
>  
> -- 
> 2.34.1
> 

