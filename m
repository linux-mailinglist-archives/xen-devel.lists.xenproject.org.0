Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 908E870573E
	for <lists+xen-devel@lfdr.de>; Tue, 16 May 2023 21:36:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.535566.833431 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pz0TF-0002r3-S0; Tue, 16 May 2023 19:36:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 535566.833431; Tue, 16 May 2023 19:36:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pz0TF-0002oV-OA; Tue, 16 May 2023 19:36:29 +0000
Received: by outflank-mailman (input) for mailman id 535566;
 Tue, 16 May 2023 19:36:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oY92=BF=kernel.org=arnd@srs-se1.protection.inumbo.net>)
 id 1pz0TE-00020V-Pg
 for xen-devel@lists.xenproject.org; Tue, 16 May 2023 19:36:28 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f2925092-f420-11ed-8611-37d641c3527e;
 Tue, 16 May 2023 21:36:27 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 26E8E63E90;
 Tue, 16 May 2023 19:36:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50CFDC433D2;
 Tue, 16 May 2023 19:36:20 +0000 (UTC)
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
X-Inumbo-ID: f2925092-f420-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684265786;
	bh=L/Qp31ZARnIa1bxC1DyJGeKMdFS5Wgtrq4kpQkQu2zw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bB9/JNuGXy+CuuSmBA1mIJQRdm3PDhpA4MNWL9vDjPPUv0Axx1Q2VLtiOmu5h4wlO
	 ZIiveTA4vEzmvtg6jqHfnB2IA/KyFoLv58fU1C/G4RLxDtlLb+qWaDnPLIHqxp+uJN
	 YuIEMEzwPeJyaUbpe/498ig/Aj8SroIALwN5a9JdhgsmlVncnEE6j0ApQr0CD6wwpG
	 uayon8hFFnce7FZ+xk3f501jDfoYnSDBCEasqeaP9EuAKAaVBUhLY0N+aATStZTdOq
	 FxWM3nrGI7ppoWHfghhJ25EqNePfkhNvOQNgYm+lOBRhMsfTshiuFBM/UygrVqzdJr
	 FaoOyV2QyNahg==
From: Arnd Bergmann <arnd@kernel.org>
To: x86@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andy Lutomirski <luto@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Juergen Gross <jgross@suse.com>,
	"Srivatsa S. Bhat (VMware)" <srivatsa@csail.mit.edu>,
	Alexey Makhalov <amakhalov@vmware.com>,
	VMware PV-Drivers Reviewers <pv-drivers@vmware.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Darren Hart <dvhart@infradead.org>,
	Andy Shevchenko <andy@infradead.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	linux-pci@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linux-pm@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH 03/20] x86: apic: hide unused safe_smp_processor_id on UP
Date: Tue, 16 May 2023 21:35:32 +0200
Message-Id: <20230516193549.544673-4-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230516193549.544673-1-arnd@kernel.org>
References: <20230516193549.544673-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

When CONFIG_SMP is disabled, the prototype for safe_smp_processor_id()
is hidden, which causes a W=1 warning:

/home/arnd/arm-soc/arch/x86/kernel/apic/ipi.c:316:5: error: no previous prototype for 'safe_smp_processor_id' [-Werror=missing-prototypes]

Since there are no callers in this configuration, just hide the definition
as well.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/x86/kernel/apic/ipi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/x86/kernel/apic/ipi.c b/arch/x86/kernel/apic/ipi.c
index 2a6509e8c840..9bfd6e397384 100644
--- a/arch/x86/kernel/apic/ipi.c
+++ b/arch/x86/kernel/apic/ipi.c
@@ -301,6 +301,7 @@ void default_send_IPI_mask_logical(const struct cpumask *cpumask, int vector)
 	local_irq_restore(flags);
 }
 
+#ifdef CONFIG_SMP
 /* must come after the send_IPI functions above for inlining */
 static int convert_apicid_to_cpu(int apic_id)
 {
@@ -329,3 +330,4 @@ int safe_smp_processor_id(void)
 	return cpuid >= 0 ? cpuid : 0;
 }
 #endif
+#endif
-- 
2.39.2


