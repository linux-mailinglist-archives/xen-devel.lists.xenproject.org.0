Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE85970CE8E
	for <lists+xen-devel@lfdr.de>; Tue, 23 May 2023 01:13:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538136.837928 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1Ehb-0004Iv-Uu; Mon, 22 May 2023 23:12:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538136.837928; Mon, 22 May 2023 23:12:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1Ehb-0004Gp-SL; Mon, 22 May 2023 23:12:31 +0000
Received: by outflank-mailman (input) for mailman id 538136;
 Mon, 22 May 2023 23:12:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7M57=BL=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1q1Eha-0004Gj-LJ
 for xen-devel@lists.xenproject.org; Mon, 22 May 2023 23:12:30 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1ec436ff-f8f6-11ed-8611-37d641c3527e;
 Tue, 23 May 2023 01:12:28 +0200 (CEST)
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
X-Inumbo-ID: 1ec436ff-f8f6-11ed-8611-37d641c3527e
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1684797146;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=C7TsK7GgGmkvmWTTcWM2ucSNGAZooIPJARpsVm1elw0=;
	b=yrUtqJV10ki6ehHolL2hnu9DMcCIuWlud8kBCfHX2rWfH90kquusd5JROH50fXuSFSmQwU
	PKNQy6H0pPg6Mk5OQdYPhKYbeQI1YUR9KMUd/a7Qt8XePk2e/SyRiHPAMSjuFqp7Gvl67j
	jsYzQTS2roesS5yiUarkF8GfeI3DeGPf6Ebcoc4Ljc1KYqKx7NP63xqe3/V5tuO0wj3vfK
	JFIGfRt4eOzIcmOGPkAafZCHGsIxOB41QQ0hviBcfX4KV8V6SP+E8PZS1myMMBnon3NhCD
	iok8IPIaOi8QqOj9b+eAxWl9vgJ4JWbE94zRxWOk3/fV7mjhSGxDcyoSZunF8g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1684797146;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=C7TsK7GgGmkvmWTTcWM2ucSNGAZooIPJARpsVm1elw0=;
	b=LsHOhlHhAmIjOmv4OFf6rm8oVhRsGLXF3Ede/E4PfuqZRooT2DLrTIb9VMr4oD66YERTjE
	beGkkZmQ8Ci6bkBQ==
To: Mark Brown <broonie@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, x86@kernel.org, David Woodhouse
 <dwmw2@infradead.org>, Andrew Cooper <andrew.cooper3@citrix.com>, Brian
 Gerst <brgerst@gmail.com>, Arjan van de Veen <arjan@linux.intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Paul McKenney <paulmck@kernel.org>,
 Tom Lendacky <thomas.lendacky@amd.com>, Sean Christopherson
 <seanjc@google.com>, Oleksandr Natalenko <oleksandr@natalenko.name>, Paul
 Menzel <pmenzel@molgen.mpg.de>, "Guilherme G. Piccoli"
 <gpiccoli@igalia.com>, Piotr Gorski <lucjan.lucjanov@gmail.com>, Usama
 Arif <usama.arif@bytedance.com>, Juergen Gross <jgross@suse.com>, Boris
 Ostrovsky <boris.ostrovsky@oracle.com>, xen-devel@lists.xenproject.org,
 Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
 linux-arm-kernel@lists.infradead.org, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Guo Ren
 <guoren@kernel.org>, linux-csky@vger.kernel.org, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org, "James E.J.
 Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller
 <deller@gmx.de>, linux-parisc@vger.kernel.org, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>,
 Sabin Rapan <sabrapan@amazon.com>, "Michael Kelley (LINUX)"
 <mikelley@microsoft.com>, Ross Philipson <ross.philipson@oracle.com>,
 David Woodhouse <dwmw@amazon.co.uk>
Subject: Re: [patch V4 33/37] cpu/hotplug: Allow "parallel" bringup up to
 CPUHP_BP_KICK_AP_STATE
In-Reply-To: <2ed3ff77-c973-4e23-9e2f-f10776e432b7@sirena.org.uk>
References: <20230512203426.452963764@linutronix.de>
 <20230512205257.240231377@linutronix.de>
 <4ca39e58-055f-432c-8124-7c747fa4e85b@sirena.org.uk> <87bkicw01a.ffs@tglx>
 <2ed3ff77-c973-4e23-9e2f-f10776e432b7@sirena.org.uk>
Date: Tue, 23 May 2023 01:12:26 +0200
Message-ID: <87wn10ufj9.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, May 22 2023 at 23:27, Mark Brown wrote:
> On Mon, May 22, 2023 at 11:04:17PM +0200, Thomas Gleixner wrote:
>
>> That does not make any sense at all and my tired brain does not help
>> either.
>
>> Can you please apply the below debug patch and provide the output?
>
> Here's the log, a quick glance says the 
>
> 	if (!--ncpus)
> 		break;
>
> check is doing the wrong thing

Obviously.

Let me find a brown paperbag and go to sleep before I even try to
compile the obvious fix.

---
diff --git a/kernel/cpu.c b/kernel/cpu.c
index 005f863a3d2b..88a7ede322bd 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1770,9 +1770,6 @@ static void __init cpuhp_bringup_mask(const struct cpumask *mask, unsigned int n
 	for_each_cpu(cpu, mask) {
 		struct cpuhp_cpu_state *st = per_cpu_ptr(&cpuhp_state, cpu);
 
-		if (!--ncpus)
-			break;
-
 		if (cpu_up(cpu, target) && can_rollback_cpu(st)) {
 			/*
 			 * If this failed then cpu_up() might have only
@@ -1781,6 +1778,9 @@ static void __init cpuhp_bringup_mask(const struct cpumask *mask, unsigned int n
 			 */
 			WARN_ON(cpuhp_invoke_callback_range(false, cpu, st, CPUHP_OFFLINE));
 		}
+
+		if (!--ncpus)
+			break;
 	}
 }
 

