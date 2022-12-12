Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C824664A48D
	for <lists+xen-devel@lfdr.de>; Mon, 12 Dec 2022 17:05:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.459797.717577 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4lJA-00032p-0P; Mon, 12 Dec 2022 16:05:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 459797.717577; Mon, 12 Dec 2022 16:05:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4lJ9-00030L-Ti; Mon, 12 Dec 2022 16:05:35 +0000
Received: by outflank-mailman (input) for mailman id 459797;
 Mon, 12 Dec 2022 16:05:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2bIl=4K=templeofstupid.com=kjlx@srs-se1.protection.inumbo.net>)
 id 1p4lJ8-0002Uc-AS
 for xen-devel@lists.xenproject.org; Mon, 12 Dec 2022 16:05:34 +0000
Received: from black.elm.relay.mailchannels.net
 (black.elm.relay.mailchannels.net [23.83.212.19])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cc3259c4-7a36-11ed-91b6-6bf2151ebd3b;
 Mon, 12 Dec 2022 17:05:32 +0100 (CET)
Received: from relay.mailchannels.net (localhost [127.0.0.1])
 by relay.mailchannels.net (Postfix) with ESMTP id 80EBA640EAA
 for <xen-devel@lists.xenproject.org>; Mon, 12 Dec 2022 16:05:28 +0000 (UTC)
Received: from pdx1-sub0-mail-a306.dreamhost.com (unknown [127.0.0.6])
 (Authenticated sender: dreamhost)
 by relay.mailchannels.net (Postfix) with ESMTPA id 0F959641BE5
 for <xen-devel@lists.xenproject.org>; Mon, 12 Dec 2022 16:05:28 +0000 (UTC)
Received: from pdx1-sub0-mail-a306.dreamhost.com (pop.dreamhost.com
 [64.90.62.162]) (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
 by 100.103.24.106 (trex/6.7.1); Mon, 12 Dec 2022 16:05:28 +0000
Received: from kmjvbox (c-73-70-108-208.hsd1.ca.comcast.net [73.70.108.208])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: kjlx@templeofstupid.com)
 by pdx1-sub0-mail-a306.dreamhost.com (Postfix) with ESMTPSA id 4NW60k3gsBz3K
 for <xen-devel@lists.xenproject.org>; Mon, 12 Dec 2022 08:05:26 -0800 (PST)
Received: from johansen (uid 1000) (envelope-from kjlx@templeofstupid.com)
 id e0062 by kmjvbox (DragonFly Mail Agent v0.12);
 Mon, 12 Dec 2022 08:05:24 -0800
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
X-Inumbo-ID: cc3259c4-7a36-11ed-91b6-6bf2151ebd3b
X-Sender-Id: dreamhost|x-authsender|kjlx@templeofstupid.com
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1670861128; a=rsa-sha256;
	cv=none;
	b=MsWZ/aGXTmBi1PNHHjiFtZC3heWeHj8sFhzjs9rcu7L8oGvAW6yDEcnkyvfLZUN5fS02Qq
	vSa6Wyp1/cyHIhV4EPfTpcF1TaFYNlAD93zhGfOIf8iKnEldLhC72J/vl/NrHmsVbDeNc0
	EpJJ/r9io8sQ4HY6e3VFL+J44rV2umYFdpfF3ZqaHp+/ooLflqQ+8TTFv7izfOyYZcHvRI
	gEwEE7Bdh3FwGykfRH2n3UrrvP8PLCpmgKwBzJTFzdsC3OvIp0ifZrkpiFC0x7q+eprdxF
	fC3w044UghJjmwU5veobgwBzIo/D+SEsu2vTli0PXmp0TQptHFMPyRxRaHZjqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1670861128;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=eTQuoFAvDCg5Wk/HY/QA0RgQaxrFIn7prIyIP8P5BA8=;
	b=90U2dSA1XmxK/zKKqCYqtDS/pduhO49jUUBHv44rwVIwajujsIaikN02nPh12bQLNaTDsb
	NvVsfchnjI8dmsxGPa2zkIysMLZ28twqm6CY85+ek2DuqWLh49qXDvfUioIFMWFv/GP0QG
	GeyttXOHEfRB44zMa/zFEzDmmnYAKqy6Z2lDD1x3R5k1ohPcQNnHLWTAm2KdZfDVwP7uBe
	hvFT96xjdMzG5j1D2x1f5wRcJjZR8SJqt4PEMr73y2Pc/s4kNwjMNOJBR2/eLJQk132Rmf
	RR18kBSJoK3NP3GjYJkFdW+RMTU0luQwBrZ4Y+3p+smX9sE2Q4UbwgAt4fjhrA==
ARC-Authentication-Results: i=1;
	rspamd-d48c5ddb-fm2bt;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=kjlx@templeofstupid.com
X-Sender-Id: dreamhost|x-authsender|kjlx@templeofstupid.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|kjlx@templeofstupid.com
X-MailChannels-Auth-Id: dreamhost
X-Glossy-Imminent: 6f7087427083609a_1670861128347_3061564259
X-MC-Loop-Signature: 1670861128347:1737159212
X-MC-Ingress-Time: 1670861128347
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=templeofstupid.com;
	s=dreamhost; t=1670861126;
	bh=eTQuoFAvDCg5Wk/HY/QA0RgQaxrFIn7prIyIP8P5BA8=;
	h=Date:From:To:Cc:Subject:Content-Type;
	b=nmfTdh0MzhuVwJ4HwvjvorQHBgs0vj8eAOA6Ul9XT0o9zbmCyMKLpERyPCXvWY5Sl
	 +GTlDaQAuN/IcaYEqih+UE1AfZ60EsMYkaSz5YppWsdHLEmzU7g8CpMn3b7ptm6dVN
	 rZxPYrOPp7HZtQInZgk1DLHwGsyCR+nRHNf5LfEw=
Date: Mon, 12 Dec 2022 08:05:24 -0800
From: Krister Johansen <kjlx@templeofstupid.com>
To: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org, Marcelo Tosatti <mtosatti@redhat.com>,
	Anthony Liguori <aliguori@amazon.com>,
	David Reaver <me@davidreaver.com>,
	Brendan Gregg <brendan@intel.com>
Subject: [PATCH linux-next v2] x86/xen/time: prefer tsc as clocksource when
 it is invariant
Message-ID: <20221212160524.GB1973@templeofstupid.com>
References: <20221208163650.GA3225@templeofstupid.com>
 <1e6c1b08-d573-fba9-61fd-d40a74427d46@oracle.com>
 <20221212155730.GA1973@templeofstupid.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221212155730.GA1973@templeofstupid.com>

Kvm elects to use tsc instead of kvm-clock when it can detect that the
TSC is invariant.

(As of commit 7539b174aef4 ("x86: kvmguest: use TSC clocksource if
invariant TSC is exposed")).

Notable cloud vendors[1] and performance engineers[2] recommend that Xen
users preferentially select tsc over xen-clocksource due the performance
penalty incurred by the latter.  These articles are persuasive and
tailored to specific use cases.  In order to understand the tradeoffs
around this choice more fully, this author had to reference the
documented[3] complexities around the Xen configuration, as well as the
kernel's clocksource selection algorithm.  Many users may not attempt
this to correctly configure the right clock source in their guest.

The approach taken in the kvm-clock module spares users this confusion,
where possible.

Both the Intel SDM[4] and the Xen tsc documentation explain that marking
a tsc as invariant means that it should be considered stable by the OS
and is elibile to be used as a wall clock source.  The Xen documentation
further clarifies that this is only reliable on HVM and PVH because PV
cannot intercept a cpuid instruction.

In order to obtain better out-of-the-box performance, and reduce the
need for user tuning, follow kvm's approach and decrease the xen clock
rating so that tsc is preferable, if it is invariant, stable, the
guest is a HVM or PVH domain, and the tsc is not emulated.

[1] https://aws.amazon.com/premiumsupport/knowledge-center/manage-ec2-linux-clock-source/
[2] https://www.brendangregg.com/blog/2021-09-26/the-speed-of-time.html
[3] https://xenbits.xen.org/docs/unstable/man/xen-tscmode.7.html
[4] Intel 64 and IA-32 Architectures Sofware Developer's Manual Volume
    3b: System Programming Guide, Part 2, Section 17.17.1, Invariant TSC

Signed-off-by: Krister Johansen <kjlx@templeofstupid.com>
Code-reviewed-by: David Reaver <me@davidreaver.com>
---
v2:
  - Use cpuid information to determine if tsc is emulated.  Do not use tsc as
    clocksource if it is. (feedback from Boris Ostrovsky)
  - Move tsc checks into their own helper function
  - Add defines for tsc cpuid flags needed by new helper function.
---
 arch/x86/include/asm/xen/cpuid.h |  6 +++++
 arch/x86/xen/time.c              | 43 +++++++++++++++++++++++++++++++-
 2 files changed, 48 insertions(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/xen/cpuid.h b/arch/x86/include/asm/xen/cpuid.h
index 6daa9b0c8d11..d9d7432481e9 100644
--- a/arch/x86/include/asm/xen/cpuid.h
+++ b/arch/x86/include/asm/xen/cpuid.h
@@ -88,6 +88,12 @@
  *             EDX: shift amount for tsc->ns conversion
  * Sub-leaf 2: EAX: host tsc frequency in kHz
  */
+#define XEN_CPUID_TSC_EMULATED       (1u << 0)
+#define XEN_CPUID_HOST_TSC_RELIABLE  (1u << 1)
+#define XEN_CPUID_RDTSCP_INSTR_AVAIL (1u << 2)
+#define XEN_CPUID_TSC_MODE_DEFAULT   (0)
+#define XEN_CPUID_TSC_MODE_EMULATE   (1u)
+#define XEN_CPUID_TSC_MODE_NOEMULATE (2u)
 
 /*
  * Leaf 5 (0x40000x04)
diff --git a/arch/x86/xen/time.c b/arch/x86/xen/time.c
index 9ef0a5cca96e..4100b1c3f38d 100644
--- a/arch/x86/xen/time.c
+++ b/arch/x86/xen/time.c
@@ -20,6 +20,7 @@
 #include <asm/pvclock.h>
 #include <asm/xen/hypervisor.h>
 #include <asm/xen/hypercall.h>
+#include <asm/xen/cpuid.h>
 
 #include <xen/events.h>
 #include <xen/features.h>
@@ -474,15 +475,55 @@ static void xen_setup_vsyscall_time_info(void)
 	xen_clocksource.vdso_clock_mode = VDSO_CLOCKMODE_PVCLOCK;
 }
 
+/*
+ * Check if it is possible to safely use the tsc as a clocksource.  This is only
+ * true if the domain is HVM or PVH, the hypervisor notifies the guest that its
+ * tsc is invariant, and the tsc instruction is not going to be emulated.
+ */
+static int __init xen_tsc_safe_clocksource(void)
+{
+	u32 eax, ebx, ecx, edx;
+
+	if (!(xen_hvm_domain() || xen_pvh_domain()))
+		return 0;
+
+	if (!(boot_cpu_has(X86_FEATURE_CONSTANT_TSC)))
+		return 0;
+
+	if (!(boot_cpu_has(X86_FEATURE_NONSTOP_TSC)))
+		return 0;
+
+	if (check_tsc_unstable())
+		return 0;
+
+	cpuid(xen_cpuid_base() + 3, &eax, &ebx, &ecx, &edx);
+
+	if (eax & XEN_CPUID_TSC_EMULATED)
+		return 0;
+
+	if (ebx != XEN_CPUID_TSC_MODE_NOEMULATE)
+		return 0;
+
+	return 1;
+}
+
 static void __init xen_time_init(void)
 {
 	struct pvclock_vcpu_time_info *pvti;
 	int cpu = smp_processor_id();
 	struct timespec64 tp;
 
-	/* As Dom0 is never moved, no penalty on using TSC there */
+	/*
+	 * As Dom0 is never moved, no penalty on using TSC there.
+	 *
+	 * If it is possible for the guest to determine that the tsc is a safe
+	 * clocksource, then set xen_clocksource rating below that of the tsc so
+	 * that the system prefers tsc instead.
+	 */
 	if (xen_initial_domain())
 		xen_clocksource.rating = 275;
+	else if (xen_tsc_safe_clocksource())
+		xen_clocksource.rating = 299;
 
 	clocksource_register_hz(&xen_clocksource, NSEC_PER_SEC);
 
-- 
2.25.1


