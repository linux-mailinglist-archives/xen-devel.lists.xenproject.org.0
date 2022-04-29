Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B75BE515388
	for <lists+xen-devel@lfdr.de>; Fri, 29 Apr 2022 20:20:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.317628.537049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkVEM-0004fy-Oh; Fri, 29 Apr 2022 18:20:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 317628.537049; Fri, 29 Apr 2022 18:20:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkVEM-0004dK-Lm; Fri, 29 Apr 2022 18:20:38 +0000
Received: by outflank-mailman (input) for mailman id 317628;
 Fri, 29 Apr 2022 18:20:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=930Y=VH=kernel.org=maz@srs-se1.protection.inumbo.net>)
 id 1nkVEK-0004ct-JX
 for xen-devel@lists.xenproject.org; Fri, 29 Apr 2022 18:20:36 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0fb808e5-c7e9-11ec-8fc4-03012f2f19d4;
 Fri, 29 Apr 2022 20:20:35 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DB7C1B8376C;
 Fri, 29 Apr 2022 18:20:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C6C7C385A7;
 Fri, 29 Apr 2022 18:20:32 +0000 (UTC)
Received: from sofa.misterjones.org ([185.219.108.64] helo=why.misterjones.org)
 by disco-boy.misterjones.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <maz@kernel.org>)
 id 1nkVED-0080Zl-Vn; Fri, 29 Apr 2022 19:20:30 +0100
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
X-Inumbo-ID: 0fb808e5-c7e9-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651256432;
	bh=7UlwWJyNgO5O8HAPQY4CevoguxGtN71USDYsxCC4Y1I=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=u0+tCCPLMcAPDoyXRHMoixV/Z0LeuwRRZuVV6YJqDPXCMAyu6bp1HqrLhdZjG9Cyh
	 QYJFW5R7kiAcrSezRCwm7ENodSCUhCJjtpqzm8cd/HFpkS4sMGegRRQASH5n2SihkJ
	 71HJ1xTMFivjTVqgd4DPNTs7LM6lfZnZ8DzEzNE0oyYqPlKCdTvIv23u3eGTMBYaOt
	 2wiCePOny8nv8PLW7e+Nz32vtmsDfQhUnorB1/3LgjVu9HRSU6K6LoPIEjrMtXRAwq
	 gSkSxWg9xur9RU7CW+BnHL/qWaY7Tt1AlSEuqbaVhcTiKCDIrzlj5v67mhP4+8Bla0
	 PK6vOCY0vQL6g==
Date: Fri, 29 Apr 2022 19:20:29 +0100
Message-ID: <87mtg392fm.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: akpm@linux-foundation.org,
	bhe@redhat.com,
	pmladek@suse.com,
	kexec@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bcm-kernel-feedback-list@broadcom.com,
	coresight@lists.linaro.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-alpha@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-edac@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-s390@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-um@lists.infradead.org,
	linux-xtensa@linux-xtensa.org,
	netdev@vger.kernel.org,
	openipmi-developer@lists.sourceforge.net,
	rcu@vger.kernel.org,
	sparclinux@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	x86@kernel.org,
	kernel-dev@igalia.com,
	kernel@gpiccoli.net,
	halves@canonical.com,
	fabiomirmar@gmail.com,
	alejandro.j.jimenez@oracle.com,
	andriy.shevchenko@linux.intel.com,
	arnd@arndb.de,
	bp@alien8.de,
	corbet@lwn.net,
	d.hatayama@jp.fujitsu.com,
	dave.hansen@linux.intel.com,
	dyoung@redhat.com,
	feng.tang@intel.com,
	gregkh@linuxfoundation.org,
	mikelley@microsoft.com,
	hidehiro.kawai.ez@hitachi.com,
	jgross@suse.com,
	john.ogness@linutronix.de,
	keescook@chromium.org,
	luto@kernel.org,
	mhiramat@kernel.org,
	mingo@redhat.com,
	paulmck@kernel.org,
	peterz@infradead.org,
	rostedt@goodmis.org,
	senozhatsky@chromium.org,
	stern@rowland.harvard.edu,
	tglx@linutronix.de,
	vgoyal@redhat.com,
	vkuznets@redhat.com,
	will@kernel.org,
	Russell King <linux@armlinux.org.uk>
Subject: Re: [PATCH 02/30] ARM: kexec: Disable IRQs/FIQs also on crash CPUs shutdown path
In-Reply-To: <20220427224924.592546-3-gpiccoli@igalia.com>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
	<20220427224924.592546-3-gpiccoli@igalia.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/27.1
 (x86_64-pc-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: gpiccoli@igalia.com, akpm@linux-foundation.org, bhe@redhat.com, pmladek@suse.com, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, coresight@lists.linaro.org, linuxppc-dev@lists.ozlabs.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org, linux-hyperv@vger.kernel.org, linux-leds@vger.kernel.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, linux-pm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org, linux-tegra@vger.kernel.org, linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org, netdev@vger.kernel.org, openipmi-developer@lists.sourceforge.net, rcu@vger.kernel.org, sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org, kernel-dev@igalia.com, kernel@gpiccoli.net, halves@canonical.com, fabiomirmar@gmail.com, alejandro.j.jimenez@oracle.com, andriy.shevchenko@linux.intel.com, arnd@arndb.de, bp@alien8.de, corbe
 t@lwn.net, d.hatayama@jp.fujitsu.com, dave.hansen@linux.intel.com, dyoung@redhat.com, feng.tang@intel.com, gregkh@linuxfoundation.org, mikelley@microsoft.com, hidehiro.kawai.ez@hitachi.com, jgross@suse.com, john.ogness@linutronix.de, keescook@chromium.org, luto@kernel.org, mhiramat@kernel.org, mingo@redhat.com, paulmck@kernel.org, peterz@infradead.org, rostedt@goodmis.org, senozhatsky@chromium.org, stern@rowland.harvard.edu, tglx@linutronix.de, vgoyal@redhat.com, vkuznets@redhat.com, will@kernel.org, linux@armlinux.org.uk
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false

On Wed, 27 Apr 2022 23:48:56 +0100,
"Guilherme G. Piccoli" <gpiccoli@igalia.com> wrote:
> 
> Currently the regular CPU shutdown path for ARM disables IRQs/FIQs
> in the secondary CPUs - smp_send_stop() calls ipi_cpu_stop(), which
> is responsible for that. This makes sense, since we're turning off
> such CPUs, putting them in an endless busy-wait loop.
> 
> Problem is that there is an alternative path for disabling CPUs,
> in the form of function crash_smp_send_stop(), used for kexec/panic
> paths. This functions relies in a SMP call that also triggers a
> busy-wait loop [at machine_crash_nonpanic_core()], but *without*
> disabling interrupts. This might lead to odd scenarios, like early
> interrupts in the boot of kexec'd kernel or even interrupts in
> other CPUs while the main one still works in the panic path and
> assumes all secondary CPUs are (really!) off.
> 
> This patch mimics the ipi_cpu_stop() interrupt disable mechanism
> in the crash CPU shutdown path, hence disabling IRQs/FIQs in all
> secondary CPUs in the kexec/panic path as well.
> 
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Russell King <linux@armlinux.org.uk>
> Signed-off-by: Guilherme G. Piccoli <gpiccoli@igalia.com>
> ---
>  arch/arm/kernel/machine_kexec.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arm/kernel/machine_kexec.c b/arch/arm/kernel/machine_kexec.c
> index f567032a09c0..ef788ee00519 100644
> --- a/arch/arm/kernel/machine_kexec.c
> +++ b/arch/arm/kernel/machine_kexec.c
> @@ -86,6 +86,9 @@ void machine_crash_nonpanic_core(void *unused)
>  	set_cpu_online(smp_processor_id(), false);
>  	atomic_dec(&waiting_for_crash_ipi);
>  
> +	local_fiq_disable();
> +	local_irq_disable();
> +

My expectations would be that, since we're getting here using an IPI,
interrupts are already masked. So what reenabled them the first place?

Thanks,

	M.

-- 
Without deviation from the norm, progress is not possible.

