Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48475917B87
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 10:58:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.748530.1156270 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMOTT-0003Us-Vf; Wed, 26 Jun 2024 08:57:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 748530.1156270; Wed, 26 Jun 2024 08:57:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMOTT-0003Rx-SC; Wed, 26 Jun 2024 08:57:55 +0000
Received: by outflank-mailman (input) for mailman id 748530;
 Wed, 26 Jun 2024 08:57:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VtjD=N4=infradead.org=peterz@srs-se1.protection.inumbo.net>)
 id 1sMOTR-0003Rr-P8
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2024 08:57:54 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 296f6ee3-339a-11ef-b4bb-af5377834399;
 Wed, 26 Jun 2024 10:57:51 +0200 (CEST)
Received: from j130084.upc-j.chello.nl ([24.132.130.84]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
 id 1sMOSu-00000008YMV-01fV; Wed, 26 Jun 2024 08:57:26 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
 id 5C20D30057C; Wed, 26 Jun 2024 10:57:17 +0200 (CEST)
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
X-Inumbo-ID: 296f6ee3-339a-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=c55CHPi2kcTRcsfp+2hg5MOW5UaLFYITtMG7g7iadt0=; b=EljuUJOGKoAeaU+wJym6grYK7w
	vtfBwB3FBLnWHkkW0aaOZT5HY5PAe71/c2ZkAiv4uiXEk5Tu9Fk9EpV+jWxxVtwVJuMZxDT4wZD+C
	OgzcQI+YfIuKuW7E5yG249OJEMQbybPj4Hf6XW5zV5lCgXd+AOrb4jDtmNH8QvSfoSsBOOZIHf4zu
	LruI6N2DgNs4nYFo+fW2XsyWm2ESBENGJWk/k5f1xr2FKl3t1Ze5ROBM2byOolbgNZ+lLSDvrXY2i
	HUW529605MkK8Ew8FFV092FJLFXfv/xP00FRbSni+KhvPZlizc87RYNQOKrqTGbsDLEIVbqnsccQ4
	IPaKt9BA==;
Date: Wed, 26 Jun 2024 10:57:17 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Ma Ke <make24@iscas.ac.cn>
Cc: jgross@suse.com, boris.ostrovsky@oracle.com, tglx@linutronix.de,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	x86@kernel.org, hpa@zytor.com, jeremy@goop.org,
	xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] xen: Fix null pointer dereference in xen_init_lock_cpu()
Message-ID: <20240626085717.GB31592@noisy.programming.kicks-ass.net>
References: <20240626074339.2820381-1-make24@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240626074339.2820381-1-make24@iscas.ac.cn>

On Wed, Jun 26, 2024 at 03:43:39PM +0800, Ma Ke wrote:
> kasprintf() is used for formatting strings and dynamically allocating
> memory space. If memory allocation fails, kasprintf() will return NULL.
> We should add a check to ensure that failure does not occur.

Did you also consider what happens to the machine if you omit the rest
of this function at init?

As is, it is *extremely* unlikely the machine will fail the allocation
at boot (it has all the memory unused after all) and if for some
mysterious reason it does fail, we get a nice bug halting the boot and
telling us where shit hit fan.

Now we silently continue with undefined state and will likely run into
trouble later because we failed to setup things, like that irqhandler.
At which point everybody will be needing to buy a new WTF'o'meter to
figure out WTF happened to get in that insane position.



> Fixes: d5de8841355a ("x86: split spinlock implementations out into their own files")
> Signed-off-by: Ma Ke <make24@iscas.ac.cn>
> ---
> Found this error through static analysis.

Just because your tool found something, doesn't mean you have to be a
tool and also not think about things.

Please use brain don't be a tool.

> ---
>  arch/x86/xen/spinlock.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/x86/xen/spinlock.c b/arch/x86/xen/spinlock.c
> index 5c6fc16e4b92..fe3cd95c1604 100644
> --- a/arch/x86/xen/spinlock.c
> +++ b/arch/x86/xen/spinlock.c
> @@ -75,6 +75,8 @@ void xen_init_lock_cpu(int cpu)
>  	     cpu, per_cpu(lock_kicker_irq, cpu));
>  
>  	name = kasprintf(GFP_KERNEL, "spinlock%d", cpu);
> +	if (!name)
> +		return;
>  	per_cpu(irq_name, cpu) = name;
>  	irq = bind_ipi_to_irqhandler(XEN_SPIN_UNLOCK_VECTOR,
>  				     cpu,
> -- 
> 2.25.1
> 

