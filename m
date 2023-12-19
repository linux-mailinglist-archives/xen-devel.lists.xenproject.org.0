Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43838817F52
	for <lists+xen-devel@lfdr.de>; Tue, 19 Dec 2023 02:39:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656455.1024626 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFP4x-0006Rg-2R; Tue, 19 Dec 2023 01:39:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656455.1024626; Tue, 19 Dec 2023 01:39:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFP4w-0006Ph-Uz; Tue, 19 Dec 2023 01:39:26 +0000
Received: by outflank-mailman (input) for mailman id 656455;
 Tue, 19 Dec 2023 01:39:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ry3N=H6=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rFP4v-0006Pb-Fx
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2023 01:39:25 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6eb8e5df-9e0f-11ee-9b0f-b553b5be7939;
 Tue, 19 Dec 2023 02:39:23 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 7E5D0CE09CC;
 Tue, 19 Dec 2023 01:39:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA04CC433C7;
 Tue, 19 Dec 2023 01:39:15 +0000 (UTC)
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
X-Inumbo-ID: 6eb8e5df-9e0f-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702949957;
	bh=vcPrlmnZ88ug1sjYKjBcxlpuXLKMPT2n/EEagmcdmBg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=QmfRCp7vnDujWl57ZA99auKXwWzo/sXMt2nzraCV9Kn6+nVC2joxemf3WcZWTtbZ5
	 mPmOchE8dmGAge2BUZj7umV8E3lRQQPkF7bXtze6G6cGBrR0mNAnXLCjfrCJ4CXCua
	 mfQ6ob2BiLmrfauEIQ7yGgdvq6R6mwvl8X9IQ0Ipi/6WdsDCFAIq8BCs3XE820rV9W
	 3tjitm32vl0VERi8u6oDYjbVbST3t6mlFGOlenKKE9Qwh4tKhd0+ICGRzlSWrzIUzl
	 udccSiwmY3L6VkDvzYlpPXyzLAqU1feXIboQ1+DxbiDfZvlNdpL+yFgMmlZfLUkAfI
	 VUSWUYWah1+dQ==
Date: Mon, 18 Dec 2023 17:39:14 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [XEN PATCH v2 6/7] xen/arm: vcpreg: address violation of MISRA
 C Rule 2.1
In-Reply-To: <9816362a11aeb7b9618500dea9bbf32e4b5483a9.1702891792.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2312181739060.3175268@ubuntu-linux-20-04-desktop>
References: <cover.1702891792.git.nicola.vetrini@bugseng.com> <9816362a11aeb7b9618500dea9bbf32e4b5483a9.1702891792.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 18 Dec 2023, Nicola Vetrini wrote:
> There is no path that reaches the call to 'advance_pc', thus violating MISRA C
> Rule 2.1.
> A call to ASSERT_UNREACHABLE() is added after the switch, despite this being
> useful to detect errors only in debug builds; if that marker is ever reached,
> a domain crash is triggered, as a defensive coding measure.
> 
> No functional change.
> 
> Signed-off-by: Julien Grall <julien@xen.org>
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> The code changes (including the comment) were made by Julien in [1]; I added the
> commit text and all other informations.
> 
> All the switch clauses, when expanded, end with a return statement
> and the default clause has an unconditional return, therefore
> advance_pc() is never reached.
> 
> However, it has been deemed safer to crash the domain if the switch is ever
> exited.
> 
> [1] https://lore.kernel.org/xen-devel/alpine.DEB.2.22.394.2312151232580.3175268@ubuntu-linux-20-04-desktop/T/#maa91d8025532455a6317119a1e4affa00a99e1ce
> ---
>  xen/arch/arm/vcpreg.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/arm/vcpreg.c b/xen/arch/arm/vcpreg.c
> index 39aeda9dab62..a2d050070473 100644
> --- a/xen/arch/arm/vcpreg.c
> +++ b/xen/arch/arm/vcpreg.c
> @@ -707,8 +707,14 @@ void do_cp10(struct cpu_user_regs *regs, const union hsr hsr)
>          inject_undef_exception(regs, hsr);
>          return;
>      }
> -
> -    advance_pc(regs, hsr);
> +    
> +    /*
> +     * All the cases in the switch should return. If this is not the
> +     * case, then something went wrong and it is best to crash the
> +     * domain.
> +     */
> +    ASSERT_UNREACHABLE();
> +    domain_crash(current->domain);
>  }
>  
>  void do_cp(struct cpu_user_regs *regs, const union hsr hsr)
> -- 
> 2.34.1
> 

