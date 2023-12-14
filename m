Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14297813D0F
	for <lists+xen-devel@lfdr.de>; Thu, 14 Dec 2023 23:10:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654788.1022166 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDtu2-0004Xb-Im; Thu, 14 Dec 2023 22:09:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654788.1022166; Thu, 14 Dec 2023 22:09:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDtu2-0004VE-F8; Thu, 14 Dec 2023 22:09:58 +0000
Received: by outflank-mailman (input) for mailman id 654788;
 Thu, 14 Dec 2023 22:09:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fjLX=HZ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rDtu0-0004Tw-O8
 for xen-devel@lists.xenproject.org; Thu, 14 Dec 2023 22:09:56 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8145da4b-9acd-11ee-9b0f-b553b5be7939;
 Thu, 14 Dec 2023 23:09:54 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id EE032CE19BF;
 Thu, 14 Dec 2023 22:09:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 024E7C433C8;
 Thu, 14 Dec 2023 22:09:47 +0000 (UTC)
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
X-Inumbo-ID: 8145da4b-9acd-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702591789;
	bh=r0H0axnIr8sFfyx3f914gBTpH6k5yBQX/8Z21Aeq3tA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=g/YmWuxHUv4pukgpanQtM3jm4NUarpGkndcSfKetQDEUZystt+4YZkO3Zm6ka58lR
	 cckCaGy/aEX88ICCYRPqFxcE+n/vNWR+4p4reprd5MVEIEfbBrBBckudFh6pWgwGxg
	 JyYY75Vk9zzTAQI31b4uZ+wTQjdOimEZS26y4uRZcQZFN16YKlnd+Rdmz8B0RKc6KI
	 m8LxVlidDIo3wL6VKQ9riOeInANalHF9XuAz3Zq5yH/2Xt1iQhhxpNGNSbptXPJtuJ
	 d96NyprwFlS7oWJ+VosThCIBRQubD1MPRbUYl8HU3idBfiUW0agJArgRQPhAuDwIUV
	 9HehReNdP15fQ==
Date: Thu, 14 Dec 2023 14:09:46 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Wei Liu <wl@xen.org>
Subject: Re: [XEN RFC] xen/bug: introduce bug_fn_nonconst_t to validate
 run_in_exception_handle()
In-Reply-To: <3423244b0b1506d2a928799d80e15c19add75566.1702570086.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2312141407580.3175268@ubuntu-linux-20-04-desktop>
References: <3423244b0b1506d2a928799d80e15c19add75566.1702570086.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 14 Dec 2023, Federico Serafini wrote:
> Introduce function type bug_fn_nonconst_t (as opposed to bug_fn_t)
> to validate the argument passed to run_in_exception_handle().
> 
> Place the definition of bug_fn_nonconst_t before of asm/bug.h inclusion
> so that arch-specific implementations of run_in_exception_handler() can
> use it (and move bug_fn_t into the same place for the same reason).
> 
> Furthermore, use bug_fn_nonconst_t to address violations of
> MISRA C:2012 Rule 8.2  ("Function types shall be in prototype form with
> named parameters").
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> ---
> At the moment, bug_fn_t can not be used within run_in_exception_handler()
> because of the const qualifier on the formal parameter.
> I tried to adjust the constness of the functions passed to
> run_in_exception_handler but at a certain point I stopped:
> a lot of code churn is required and I am not sure about the correctenss of the
> result.
> So, I came up with this solution, taking inspiration from the exising functions
> show_execution_state() and show_execution_state_nonconst().
> 
> I would like to ask if:
> 1) I correctly applied Julien's suggestion about the visibility [1];
> 2) this RFC can become a patch.
> 
> [1]
> https://lists.xenproject.org/archives/html/xen-devel/2023-11/msg01361.html
> ---
>  xen/common/bug.c      |  2 +-
>  xen/include/xen/bug.h | 21 +++++++++++++++------
>  2 files changed, 16 insertions(+), 7 deletions(-)
> 
> diff --git a/xen/common/bug.c b/xen/common/bug.c
> index ca166e102b..9170821ab8 100644
> --- a/xen/common/bug.c
> +++ b/xen/common/bug.c
> @@ -63,7 +63,7 @@ int do_bug_frame(struct cpu_user_regs *regs, unsigned long pc)
>  
>      if ( id == BUGFRAME_run_fn )
>      {
> -        void (*fn)(struct cpu_user_regs *) = bug_ptr(bug);
> +        bug_fn_nonconst_t *fn = bug_ptr(bug);
>  
>          fn(regs);
>  
> diff --git a/xen/include/xen/bug.h b/xen/include/xen/bug.h
> index cb5138410e..c6f5594af5 100644
> --- a/xen/include/xen/bug.h
> +++ b/xen/include/xen/bug.h
> @@ -12,6 +12,18 @@
>  #define BUG_LINE_LO_WIDTH (31 - BUG_DISP_WIDTH)
>  #define BUG_LINE_HI_WIDTH (31 - BUG_DISP_WIDTH)
>  
> +#ifndef __ASSEMBLY__
> +
> +/*
> + * Make bug_fn_t and bug_fn_nonconst_t visible for arch-specific implementation
> + * of run_in_exception_handler.
> + */
> +struct cpu_user_regs;
> +typedef void bug_fn_t(const struct cpu_user_regs *regs);
> +typedef void bug_fn_nonconst_t(struct cpu_user_regs *regs);
> +
> +#endif
> +
>  #include <asm/bug.h>
>  
>  #ifndef __ASSEMBLY__
> @@ -99,18 +111,15 @@ struct bug_frame {
>  
>  #endif
>  
> -struct cpu_user_regs;
> -typedef void bug_fn_t(const struct cpu_user_regs *regs);

I am not sure why you moved this up in the file, but everything looks
correct to me. I would ack it but I'll let Julien confirm in regards to
his older comment.


>  #ifndef run_in_exception_handler
>  
>  /*
>   * TODO: untangle header dependences, break BUILD_BUG_ON() out of xen/lib.h,
>   * and use a real static inline here to get proper type checking of fn().
>   */
> -#define run_in_exception_handler(fn) do {                   \
> -    (void)((fn) == (void (*)(struct cpu_user_regs *))NULL); \
> -    BUG_FRAME(BUGFRAME_run_fn, 0, fn, 0, NULL);             \
> +#define run_in_exception_handler(fn) do {       \
> +    (void)((fn) == (bug_fn_nonconst_t *)NULL);  \
> +    BUG_FRAME(BUGFRAME_run_fn, 0, fn, 0, NULL); \
>  } while ( false )
>  
>  #endif /* run_in_exception_handler */
> -- 
> 2.34.1
> 

