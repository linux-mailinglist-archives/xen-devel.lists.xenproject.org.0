Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C477709F3
	for <lists+xen-devel@lfdr.de>; Fri,  4 Aug 2023 22:43:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.577315.904352 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qS1dy-0001CT-1w; Fri, 04 Aug 2023 20:43:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 577315.904352; Fri, 04 Aug 2023 20:43:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qS1dx-0001Ao-V9; Fri, 04 Aug 2023 20:43:29 +0000
Received: by outflank-mailman (input) for mailman id 577315;
 Fri, 04 Aug 2023 20:43:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zgx5=DV=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qS1dw-0001Ag-5c
 for xen-devel@lists.xenproject.org; Fri, 04 Aug 2023 20:43:28 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8eee71aa-3307-11ee-8613-37d641c3527e;
 Fri, 04 Aug 2023 22:43:25 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9080A620A7;
 Fri,  4 Aug 2023 20:43:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 959EDC433C7;
 Fri,  4 Aug 2023 20:43:22 +0000 (UTC)
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
X-Inumbo-ID: 8eee71aa-3307-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691181804;
	bh=KKwcx5LNbFIDE+0Rb0D9JxK1rWrcq+pB7mVcltQdYz4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=UM0pz+a93+cn2ggbBTLlwPcVOwD4kkRx0PYZ97mdRZqIcobOpSINCsAcekiml8OS+
	 pXWmMpQm0qm88hPzI3lawo96TPpJhV332B45e+edYG17TZ9v7ccnLaYJUjo/f89mLm
	 JC74fn6F/X/WdMcTMoKliwk1h9oXYjQCWP5Z1cfDHayuc11DaiYWPojjvh9ZWGKVG6
	 Yun8jiV7430CF0E5gSxTf+Iw1WUrVJSU/Cys6x1roxT+Ov8ZLyVBpLd2T0sdzlj0ax
	 bLwhy2Ho1/atzYCxEFMITX/8fQTRTSvh8okXHuU/QFdR/V2v78d+W93muV+UyHpJHa
	 ltcOEliseA8Ew==
Date: Fri, 4 Aug 2023 13:43:21 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, Jan Beulich <jbeulich@suse.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH v2 1/4] x86/mce: address MISRA C:2012 Rule 5.3
In-Reply-To: <8a11baf39c140af9d5694298e5f1f0bf59ac0621.1691135862.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2308041343140.2127516@ubuntu-linux-20-04-desktop>
References: <cover.1691135862.git.nicola.vetrini@bugseng.com> <8a11baf39c140af9d5694298e5f1f0bf59ac0621.1691135862.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 4 Aug 2023, Nicola Vetrini wrote:
> Suitable mechanical renames are made to avoid shadowing
> the function identifier 'wait' declared in 'xen/include/xen/wait.h',
> thus addressing violations of MISRA C:2012 Rule 5.3:
> "An identifier declared in an inner scope shall not hide an
> identifier declared in an outer scope"
> 
> The parameter name 'bar' is added as well to comply with MISRA C:2012
> Rules 8.2 and 8.3.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Changes in v2:
> - Added parameter name 'bar' where missing.
> - Amended commit message.
> ---
>  xen/arch/x86/cpu/mcheck/barrier.c |  8 ++++----
>  xen/arch/x86/cpu/mcheck/barrier.h | 14 +++++++-------
>  2 files changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/xen/arch/x86/cpu/mcheck/barrier.c b/xen/arch/x86/cpu/mcheck/barrier.c
> index a7e5b19a44..51a1d37a76 100644
> --- a/xen/arch/x86/cpu/mcheck/barrier.c
> +++ b/xen/arch/x86/cpu/mcheck/barrier.c
> @@ -16,11 +16,11 @@ void mce_barrier_dec(struct mce_softirq_barrier *bar)
>      atomic_dec(&bar->val);
>  }
> 
> -void mce_barrier_enter(struct mce_softirq_barrier *bar, bool wait)
> +void mce_barrier_enter(struct mce_softirq_barrier *bar, bool do_wait)
>  {
>      int gen;
> 
> -    if ( !wait )
> +    if ( !do_wait )
>          return;
>      atomic_inc(&bar->ingen);
>      gen = atomic_read(&bar->outgen);
> @@ -34,11 +34,11 @@ void mce_barrier_enter(struct mce_softirq_barrier *bar, bool wait)
>      }
>  }
> 
> -void mce_barrier_exit(struct mce_softirq_barrier *bar, bool wait)
> +void mce_barrier_exit(struct mce_softirq_barrier *bar, bool do_wait)
>  {
>      int gen;
> 
> -    if ( !wait )
> +    if ( !do_wait )
>          return;
>      atomic_inc(&bar->outgen);
>      gen = atomic_read(&bar->ingen);
> diff --git a/xen/arch/x86/cpu/mcheck/barrier.h b/xen/arch/x86/cpu/mcheck/barrier.h
> index c4d52b6192..7ec483226f 100644
> --- a/xen/arch/x86/cpu/mcheck/barrier.h
> +++ b/xen/arch/x86/cpu/mcheck/barrier.h
> @@ -20,7 +20,7 @@ struct mce_softirq_barrier {
>  /*
>   * Initialize a barrier. Just set it to 0.
>   */
> -void mce_barrier_init(struct mce_softirq_barrier *);
> +void mce_barrier_init(struct mce_softirq_barrier *bar);
> 
>  /*
>   * This function will need to be used when offlining a CPU in the
> @@ -29,17 +29,17 @@ void mce_barrier_init(struct mce_softirq_barrier *);
>   * Decrement a barrier only. Needed for cases where the CPU
>   * in question can't do it itself (e.g. it is being offlined).
>   */
> -void mce_barrier_dec(struct mce_softirq_barrier *);
> +void mce_barrier_dec(struct mce_softirq_barrier *bar);
> 
>  /*
> - * If @wait is false, mce_barrier_enter/exit() will return immediately
> + * If @do_wait is false, mce_barrier_enter/exit() will return immediately
>   * without touching the barrier. It's used when handling a
>   * non-broadcasting MCE (e.g. MCE on some old Intel CPU, MCE on AMD
>   * CPU and LMCE on Intel Skylake-server CPU) which is received on only
>   * one CPU and thus does not invoke mce_barrier_enter/exit() calls on
>   * all CPUs.
>   *
> - * If @wait is true, mce_barrier_enter/exit() will handle the given
> + * If @do_wait is true, mce_barrier_enter/exit() will handle the given
>   * barrier as below.
>   *
>   * Increment the generation number and the value. The generation number
> @@ -53,9 +53,9 @@ void mce_barrier_dec(struct mce_softirq_barrier *);
>   * These barrier functions should always be paired, so that the
>   * counter value will reach 0 again after all CPUs have exited.
>   */
> -void mce_barrier_enter(struct mce_softirq_barrier *, bool wait);
> -void mce_barrier_exit(struct mce_softirq_barrier *, bool wait);
> +void mce_barrier_enter(struct mce_softirq_barrier *bar, bool do_wait);
> +void mce_barrier_exit(struct mce_softirq_barrier *bar, bool do_wait);
> 
> -void mce_barrier(struct mce_softirq_barrier *);
> +void mce_barrier(struct mce_softirq_barrier *bar);
> 
>  #endif /* _MCHECK_BARRIER_H */
> --
> 2.34.1
> 

