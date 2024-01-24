Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F4A839E51
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jan 2024 02:35:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.670688.1043635 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSSAU-0002db-Ku; Wed, 24 Jan 2024 01:35:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 670688.1043635; Wed, 24 Jan 2024 01:35:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSSAU-0002bC-Hp; Wed, 24 Jan 2024 01:35:06 +0000
Received: by outflank-mailman (input) for mailman id 670688;
 Wed, 24 Jan 2024 01:35:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qnut=JC=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rSSAT-0002b5-8m
 for xen-devel@lists.xenproject.org; Wed, 24 Jan 2024 01:35:05 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ca42956b-ba58-11ee-9b0f-b553b5be7939;
 Wed, 24 Jan 2024 02:35:02 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id D8236CE30CC;
 Wed, 24 Jan 2024 01:34:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC9C0C433F1;
 Wed, 24 Jan 2024 01:34:57 +0000 (UTC)
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
X-Inumbo-ID: ca42956b-ba58-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706060099;
	bh=HgM5Utc7htDc47vc7wH8ZGobLGRm3TbyynXaGN7mnSM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ZapcKNwYkQurAkunb4pXoH7qKACsDR3mE+XGsTu203AbkGDQ3DrZUXeLcAuqFgo/C
	 GsXJSEhUuB5J+HAOs7Fekd4a3za+RvheJhiqaNGlpoIWGN+vGIfo3BPpJuINwpiuJO
	 agmAqQaEE16lne6ydHPsHDPUeIuTMkYslrq1/IgfKwdfFd/NYDDlaEZNwL/qn1/Uy5
	 jsqBbXn+7AemA1mc5BtPIzrLqde7s3o9FyINWpK3Bgh8+zEcJf96moGbxsacZQBsq0
	 wv95Ra5q3lFQNgXx7h9JuJjWpbEU/j47Wh/+ckFaLVl92CIInHMw6xvXelcj404vmi
	 G/FTp6ch5HwHg==
Date: Tue, 23 Jan 2024 17:34:56 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Federico Serafini <federico.serafini@bugseng.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH] consolidate do_bug_frame() / bug_fn_t
In-Reply-To: <d466eb44-1160-4b57-a41f-752dbf626748@suse.com>
Message-ID: <alpine.DEB.2.22.394.2401231731570.2287888@ubuntu-linux-20-04-desktop>
References: <d466eb44-1160-4b57-a41f-752dbf626748@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi Jan, Andrew,

I managed to get back to read the mailing list and noticed this patch.

Is it still relevant and needs to be reviewed?

Are there any outstanding disagreements between maintainers on the
approach to take here?  Or should I just go ahead and review it?


On Tue, 9 Jan 2024, Jan Beulich wrote:
> The type not being used in do_bug_frame() is suspicious. Apparently
> that's solely because the type uses a pointer-to-const parameter,
> when run_in_exception_handler() wants functions taking pointer-to-non-
> const. Drop the const, in turn requiring Arm's do_bug_frame() to also
> have its const dropped. This then brings that function also closer to
> the common one, with Arm's use of vaddr_t remaining as a difference.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> This is an alternative proposal to
> https://lists.xen.org/archives/html/xen-devel/2023-12/msg01385.html,
> albeit without paving a road towards Andrew's desire of getting rid of
> show_execution_state_nonconst() again. Retaining (and propagating) the
> const would imply the need to cast away the const-ness somewhere on (at
> least) the path to invoking gdb stub code. Personally I'm averse to such
> casting away of const-ness ...
> 
> --- a/xen/arch/arm/include/asm/traps.h
> +++ b/xen/arch/arm/include/asm/traps.h
> @@ -69,7 +69,7 @@ void do_cp(struct cpu_user_regs *regs, c
>  void do_trap_smc(struct cpu_user_regs *regs, const union hsr hsr);
>  void do_trap_hvc_smccc(struct cpu_user_regs *regs);
>  
> -int do_bug_frame(const struct cpu_user_regs *regs, vaddr_t pc);
> +int do_bug_frame(struct cpu_user_regs *regs, vaddr_t pc);
>  
>  void noreturn do_unexpected_trap(const char *msg,
>                                   const struct cpu_user_regs *regs);
> --- a/xen/arch/arm/traps.c
> +++ b/xen/arch/arm/traps.c
> @@ -1202,7 +1202,7 @@ void do_unexpected_trap(const char *msg,
>      panic("CPU%d: Unexpected Trap: %s\n", smp_processor_id(), msg);
>  }
>  
> -int do_bug_frame(const struct cpu_user_regs *regs, vaddr_t pc)
> +int do_bug_frame(struct cpu_user_regs *regs, vaddr_t pc)
>  {
>      const struct bug_frame *bug = NULL;
>      const char *prefix = "", *filename, *predicate;
> --- a/xen/common/bug.c
> +++ b/xen/common/bug.c
> @@ -63,14 +63,10 @@ int do_bug_frame(struct cpu_user_regs *r
>  
>      if ( id == BUGFRAME_run_fn )
>      {
> -        void (*fn)(struct cpu_user_regs *) = bug_ptr(bug);
> +        bug_fn_t *fn = bug_ptr(bug);
>  
>          fn(regs);
>  
> -        /* Re-enforce consistent types, because of the casts involved. */
> -        if ( false )
> -            run_in_exception_handler(fn);
> -
>          return id;
>      }
>  
> --- a/xen/include/xen/bug.h
> +++ b/xen/include/xen/bug.h
> @@ -101,12 +101,11 @@ struct bug_frame {
>  #endif
>  
>  struct cpu_user_regs;
> -typedef void bug_fn_t(const struct cpu_user_regs *regs);
> +typedef void bug_fn_t(struct cpu_user_regs *regs);
>  
>  #ifndef run_in_exception_handler
>  
> -static void always_inline run_in_exception_handler(
> -    void (*fn)(struct cpu_user_regs *regs))
> +static void always_inline run_in_exception_handler(bug_fn_t *fn)
>  {
>      BUG_FRAME(BUGFRAME_run_fn, 0, fn, 0, NULL);
>  }
> 

