Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE2276DD74
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 03:46:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.575944.901517 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRNPO-0004Of-Nm; Thu, 03 Aug 2023 01:45:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 575944.901517; Thu, 03 Aug 2023 01:45:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRNPO-0004MM-Kp; Thu, 03 Aug 2023 01:45:46 +0000
Received: by outflank-mailman (input) for mailman id 575944;
 Thu, 03 Aug 2023 01:45:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hVX3=DU=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qRNPM-0004MG-Ol
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 01:45:44 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 735bcd55-319f-11ee-8613-37d641c3527e;
 Thu, 03 Aug 2023 03:45:40 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A1B7C61BAA;
 Thu,  3 Aug 2023 01:45:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6182C433C8;
 Thu,  3 Aug 2023 01:45:37 +0000 (UTC)
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
X-Inumbo-ID: 735bcd55-319f-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691027139;
	bh=nynb/XD0+dwJaz0ovN23T/F0FlHbEyQJRCUDo7kQ6bs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=kq7EAPVxXwmCmmPYRn9WTDWc1jNbqvTHfW5SXL4fFE3BTSs3lQUxj6ENQSMaBf37N
	 tQQjQbbFJDG3zCMAM2TuP1cephKlzu5/rutkb6kWqJE5UrtAwhgmFx54LljfU9mXL2
	 ldGisjKT2UOiHeROqgHl8TzEbL4r0YBTGWc4+3c33YqFtNXFNZMbEPlp+hO3K6DQ1+
	 elvBefMqAlpblyhMj4Zcho1dkrDIFeR71Zj3uEO0nKrQRsGbme5qpykFvkOTBiaSDi
	 3QT7g9l9GsdUMSfpqlLIWKLEcfnbuuZ+ytyvLvSmN6mUgNaeuKNCeLRnaJe8+3Q3l2
	 uCFpjfkcGMAQg==
Date: Wed, 2 Aug 2023 18:45:36 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, Jan Beulich <jbeulich@suse.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH 1/4] x86/mce: address MISRA C:2012 Rule 5.3
In-Reply-To: <52ec7caf08089e3aaaad2bcf709a7d387d55d58f.1690969271.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2308021844020.2127516@ubuntu-linux-20-04-desktop>
References: <cover.1690969271.git.nicola.vetrini@bugseng.com> <52ec7caf08089e3aaaad2bcf709a7d387d55d58f.1690969271.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 2 Aug 2023, Nicola Vetrini wrote:
> Suitable mechanical renames are made to avoid shadowing, thus
> addressing violations of MISRA C:2012 Rule 5.3:
> "An identifier declared in an inner scope shall not hide an
> identifier declared in an outer scope"
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
>  xen/arch/x86/cpu/mcheck/barrier.c | 8 ++++----
>  xen/arch/x86/cpu/mcheck/barrier.h | 8 ++++----
>  2 files changed, 8 insertions(+), 8 deletions(-)
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

"wait" clashes with xen/common/sched/core.c:wait, which is globally
exported, right?

I think it would be good to add this info to the commit message in this
kind of patches.


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
> index c4d52b6192..5cd1b4e4bf 100644
> --- a/xen/arch/x86/cpu/mcheck/barrier.h
> +++ b/xen/arch/x86/cpu/mcheck/barrier.h
> @@ -32,14 +32,14 @@ void mce_barrier_init(struct mce_softirq_barrier *);
>  void mce_barrier_dec(struct mce_softirq_barrier *);
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
> @@ -53,8 +53,8 @@ void mce_barrier_dec(struct mce_softirq_barrier *);
>   * These barrier functions should always be paired, so that the
>   * counter value will reach 0 again after all CPUs have exited.
>   */
> -void mce_barrier_enter(struct mce_softirq_barrier *, bool wait);
> -void mce_barrier_exit(struct mce_softirq_barrier *, bool wait);
> +void mce_barrier_enter(struct mce_softirq_barrier *, bool do_wait);
> +void mce_barrier_exit(struct mce_softirq_barrier *, bool do_wait);

You might as well add "bar" as first parameter?


>  void mce_barrier(struct mce_softirq_barrier *);
>  
> -- 
> 2.34.1
> 

