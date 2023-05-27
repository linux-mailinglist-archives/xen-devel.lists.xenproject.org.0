Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E5A713512
	for <lists+xen-devel@lfdr.de>; Sat, 27 May 2023 15:41:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.540316.842013 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2u9R-0005j7-GC; Sat, 27 May 2023 13:40:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 540316.842013; Sat, 27 May 2023 13:40:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2u9R-0005gL-D2; Sat, 27 May 2023 13:40:09 +0000
Received: by outflank-mailman (input) for mailman id 540316;
 Sat, 27 May 2023 13:40:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cAXd=BQ=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1q2u9Q-0005ae-0a
 for xen-devel@lists.xenproject.org; Sat, 27 May 2023 13:40:08 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fc9c4d35-fc93-11ed-8611-37d641c3527e;
 Sat, 27 May 2023 15:40:04 +0200 (CEST)
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
X-Inumbo-ID: fc9c4d35-fc93-11ed-8611-37d641c3527e
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1685194803;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uhphG4bdKEhlSrLILx8LQHUnhtq5h2kh7PjylDw7WHk=;
	b=c7tPQEf1tDSaswC+udb6n2rEFtodyCz+0hqKKRaloSAWHscsivpNExWbDw/lNzJYugWAC1
	Jm29ndY/DVZdilpSdABXMmg7zcNPlf2ipCdzoFFpOsDlGdRTaa/cDp4VQIgvIIuUN9JR/Z
	4wJQUUIDzQZJXqPtRi0VknCvN575jHF4GBgn5HyL1/e+ips0AysDA2DuVxTFjRXavrRMCR
	ErEe1ocMuKOicQKxwfjXlIfBvhnKCrT8khka2tjtWb5cZaLE3ZEkUSF51OwhE4SNq1hAJg
	OsmAHNMb9ZxT3Z/Q3tFuCRyz5jSjP+VvrhVlox0l3Z4ceASC3h0ieO88IF9MuA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1685194803;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uhphG4bdKEhlSrLILx8LQHUnhtq5h2kh7PjylDw7WHk=;
	b=IAhogYOgiDrfm9G9lFn3jmOMGU4kEEQCTcf6iURfWSFeMNN2CJaahVSnX2MzxuXmnO+mLX
	zbrDN0kZP7Q4fvCA==
To: "Kirill A. Shutemov" <kirill@shutemov.name>
Cc: LKML <linux-kernel@vger.kernel.org>, x86@kernel.org, David Woodhouse
 <dwmw2@infradead.org>, Andrew Cooper <andrew.cooper3@citrix.com>, Brian
 Gerst <brgerst@gmail.com>, Arjan van de Veen <arjan@linux.intel.com>, Paolo
 Bonzini <pbonzini@redhat.com>, Paul McKenney <paulmck@kernel.org>, Tom
 Lendacky <thomas.lendacky@amd.com>, Sean Christopherson
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
 Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller
 <deller@gmx.de>, linux-parisc@vger.kernel.org, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>,
 Sabin Rapan <sabrapan@amazon.com>, "Michael Kelley (LINUX)"
 <mikelley@microsoft.com>, Dave Hansen <dave.hansen@linux.intel.com>
Subject: Re: [patch v3 31/36] x86/apic: Provide cpu_primary_thread mask
In-Reply-To: <87y1lbl7r6.ffs@tglx>
References: <20230508181633.089804905@linutronix.de>
 <20230508185218.962208640@linutronix.de>
 <20230524204818.3tjlwah2euncxzmh@box.shutemov.name> <87y1lbl7r6.ffs@tglx>
Date: Sat, 27 May 2023 15:40:02 +0200
Message-ID: <87sfbhlwp9.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, May 26 2023 at 12:14, Thomas Gleixner wrote:
> On Wed, May 24 2023 at 23:48, Kirill A. Shutemov wrote:
>> This patch causes boot regression on TDX guest. The guest crashes on SMP
>> bring up.

The below should fix that. Sigh...

Thanks,

        tglx
----
Subject: x86/smp: Initialize cpu_primary_thread_mask late
From: Thomas Gleixner <tglx@linutronix.de>
Date: Fri, 26 May 2023 21:38:47 +0200

Marking primary threads in the cpumask during early boot is only correct in
certain configurations, but broken e.g. for the legacy hyperthreading
detection.

This is due to the complete mess in the CPUID evaluation code which
initializes smp_num_siblings only half during early init and fixes it up
later when identify_boot_cpu() is invoked.

So using smp_num_siblings before identify_boot_cpu() leads to incorrect
results.

Fixing the early CPU init code to provide the proper data is a larger scale
surgery as the code has dependencies on data structures which are not
initialized during early boot.

Move the initialization of cpu_primary_thread_mask wich depends on
smp_num_siblings being correct to an early initcall so that it is set up
correctly before SMP bringup.

Fixes: f54d4434c281 ("x86/apic: Provide cpu_primary_thread mask")
Reported-by: "Kirill A. Shutemov" <kirill@shutemov.name>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 arch/x86/kernel/apic/apic.c |   18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

--- a/arch/x86/kernel/apic/apic.c
+++ b/arch/x86/kernel/apic/apic.c
@@ -2398,6 +2398,21 @@ static void cpu_mark_primary_thread(unsi
 	if (smp_num_siblings == 1 || !(apicid & mask))
 		cpumask_set_cpu(cpu, &__cpu_primary_thread_mask);
 }
+
+/*
+ * Due to the utter mess of CPUID evaluation smp_num_siblings is not valid
+ * during early boot. Initialize the primary thread mask before SMP
+ * bringup.
+ */
+static int __init smp_init_primary_thread_mask(void)
+{
+	unsigned int cpu;
+
+	for (cpu = 0; cpu < nr_logical_cpuids; cpu++)
+		cpu_mark_primary_thread(cpu, cpuid_to_apicid[cpu]);
+	return 0;
+}
+early_initcall(smp_init_primary_thread_mask);
 #else
 static inline void cpu_mark_primary_thread(unsigned int cpu, unsigned int apicid) { }
 #endif
@@ -2544,7 +2559,8 @@ int generic_processor_info(int apicid, i
 	set_cpu_present(cpu, true);
 	num_processors++;
 
-	cpu_mark_primary_thread(cpu, apicid);
+	if (system_state >= SYSTEM_BOOTING)
+		cpu_mark_primary_thread(cpu, apicid);
 
 	return cpu;
 }

