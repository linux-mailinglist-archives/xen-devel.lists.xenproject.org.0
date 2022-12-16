Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9EB064EEE4
	for <lists+xen-devel@lfdr.de>; Fri, 16 Dec 2022 17:21:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.464842.723361 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p6DSj-0000dG-6g; Fri, 16 Dec 2022 16:21:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 464842.723361; Fri, 16 Dec 2022 16:21:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p6DSj-0000bI-1b; Fri, 16 Dec 2022 16:21:29 +0000
Received: by outflank-mailman (input) for mailman id 464842;
 Fri, 16 Dec 2022 16:21:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Pl3e=4O=templeofstupid.com=kjlx@srs-se1.protection.inumbo.net>)
 id 1p6DSh-0000bA-Nc
 for xen-devel@lists.xenproject.org; Fri, 16 Dec 2022 16:21:27 +0000
Received: from boar.tulip.relay.mailchannels.net
 (boar.tulip.relay.mailchannels.net [23.83.218.250])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ae82d767-7d5d-11ed-8fd4-01056ac49cbb;
 Fri, 16 Dec 2022 17:21:26 +0100 (CET)
Received: from relay.mailchannels.net (localhost [127.0.0.1])
 by relay.mailchannels.net (Postfix) with ESMTP id 4A36D3E13BC
 for <xen-devel@lists.xenproject.org>; Fri, 16 Dec 2022 16:21:22 +0000 (UTC)
Received: from pdx1-sub0-mail-a305.dreamhost.com (unknown [127.0.0.6])
 (Authenticated sender: dreamhost)
 by relay.mailchannels.net (Postfix) with ESMTPA id DD23F3E1BCB
 for <xen-devel@lists.xenproject.org>; Fri, 16 Dec 2022 16:21:21 +0000 (UTC)
Received: from pdx1-sub0-mail-a305.dreamhost.com (pop.dreamhost.com
 [64.90.62.162]) (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
 by 100.123.200.84 (trex/6.7.1); Fri, 16 Dec 2022 16:21:22 +0000
Received: from kmjvbox (c-73-70-108-208.hsd1.ca.comcast.net [73.70.108.208])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: kjlx@templeofstupid.com)
 by pdx1-sub0-mail-a305.dreamhost.com (Postfix) with ESMTPSA id 4NYZ9F0ZKLzVw
 for <xen-devel@lists.xenproject.org>; Fri, 16 Dec 2022 08:21:20 -0800 (PST)
Received: from johansen (uid 1000) (envelope-from kjlx@templeofstupid.com)
 id e002b by kmjvbox (DragonFly Mail Agent v0.12);
 Fri, 16 Dec 2022 08:21:18 -0800
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
X-Inumbo-ID: ae82d767-7d5d-11ed-8fd4-01056ac49cbb
X-Sender-Id: dreamhost|x-authsender|kjlx@templeofstupid.com
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1671207681; a=rsa-sha256;
	cv=none;
	b=6RZQO6RU7uRZo8yw7NwRSY+IrHhjb/A6dpDjnb2N1gMc+svaKioGrgBLpdyiQ3w58S13i/
	3QuFRFCfO1sa3gP3VAAVJUt/OraonbuepQ7Li13RXkCKrI+x2DpcN6kU+XmGVbBEtCsm4c
	q2CYwU0Dfaqohfpx9upzydF6lh0P/YVz8bUy2SS/ZYwvO/44dGAceQQk1hPFfmFWHZxRDt
	ky2I65Q+94WILPRSq/WllpVVkkpqxAomRE7SveqshGUn+UVl0FXODPd+WCiS+xYhIRiW7Y
	0kX8bFLOtkHdyFSihd+/tTw5nCNkM3QM+XI6h40VyjMIn8VDd/gW8DJvCOg6Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1671207681;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 dkim-signature; bh=ntqixOp2Rzio0BYbTNNACIXCQK/YxtD97cLJBDAV5UI=;
	b=xBG5UBqwJphl7lHhyvlf2XAOum7u8VCgAlbmfOp3AJ19oowHDHBJ9BXQ/uL/iZYNVuKzg6
	AJcN0pAtUwi7sSd53zJTbt37jYJ1qjdpJyOsVN+ry5FCm9j+iqPqZ/2HZGCw1fWuvVqX8Y
	DkTqbcHfQRAQIxDZ6iXpDn971q4OwTEKde9L8rS3DTstWTNhFDCjnF0qxRrmXWXaRGab5s
	Mud70o+drfiLlkPiRB/uvONNTKkkGuc+7CuTkpR2YFGroJnjrSiqK3kGJFZCUVijiGBhYF
	37PfFon2oX+Lx3FMAv4IB3pR8HTL3tK6cAzYZgFrx3yC27VrWJ1ToRZvLulSFg==
ARC-Authentication-Results: i=1;
	rspamd-6f8d97c84c-c52ww;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=kjlx@templeofstupid.com
X-Sender-Id: dreamhost|x-authsender|kjlx@templeofstupid.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|kjlx@templeofstupid.com
X-MailChannels-Auth-Id: dreamhost
X-Print-Spill: 7eea6c0b0c88e9ea_1671207682134_153051426
X-MC-Loop-Signature: 1671207682134:1489128601
X-MC-Ingress-Time: 1671207682134
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=templeofstupid.com;
	s=dreamhost; t=1671207681;
	bh=ntqixOp2Rzio0BYbTNNACIXCQK/YxtD97cLJBDAV5UI=;
	h=Date:From:To:Cc:Subject:Content-Type;
	b=uOjwEYkoewh231QtAzac8ZB2yrw4S+dYoTWf6QzXpKonZvN7Cw/1ValnsZzDERPxJ
	 PBOXkrPYirXsqpx0lKtbotoInbq9A1hal4SomyS8mrA/bVKL/5A0soCi42sJyr0R2q
	 1+sfsMN2f2R5BVmt3hjGKA8zBkW87wsp+wI4gF3I=
Date: Fri, 16 Dec 2022 08:21:18 -0800
From: Krister Johansen <kjlx@templeofstupid.com>
To: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Jan Beulich <jbeulich@suse.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org, Marcelo Tosatti <mtosatti@redhat.com>,
	Anthony Liguori <aliguori@amazon.com>,
	David Reaver <me@davidreaver.com>,
	Brendan Gregg <brendan@intel.com>
Subject: [PATCH linux-next v3] x86/xen/time: prefer tsc as clocksource when
 it is invariant
Message-ID: <20221216162118.GB2633@templeofstupid.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

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
and is elibile to be used as a wall clock source.

In order to obtain better out-of-the-box performance, and reduce the
need for user tuning, follow kvm's approach and decrease the xen clock
rating so that tsc is preferable, if it is invariant, stable, and the
tsc will never be emulated.

[1] https://aws.amazon.com/premiumsupport/knowledge-center/manage-ec2-linux-clock-source/
[2] https://www.brendangregg.com/blog/2021-09-26/the-speed-of-time.html
[3] https://xenbits.xen.org/docs/unstable/man/xen-tscmode.7.html
[4] Intel 64 and IA-32 Architectures Sofware Developer's Manual Volume
    3b: System Programming Guide, Part 2, Section 17.17.1, Invariant TSC

Signed-off-by: Krister Johansen <kjlx@templeofstupid.com>
Code-reviewed-by: David Reaver <me@davidreaver.com>
---
v3:
  - Temporarily drop references to public API headers
  - tsc_emulated check is redundant if tsc_mode is no emulate. (feedback from
    Boris Ostrovsky)
  - Use cpuid_count instead of cpuid when accessing a cpuid leaf with subleaves.
    (feedback from Jan Beulich)
  - Kernel has its own cpuid hypercall and can intercept checks about the tsc
    mode.  The check for PV mode is inapposite and therefore removed. (feedback
    from Jan Beulich)
v2:
  - Use cpuid information to determine if tsc is emulated.  Do not use tsc as
    clocksource if it is. (feedback from Boris Ostrovsky)
  - Move tsc checks into their own helper function
  - Add defines for tsc cpuid flags needed by new helper function.
---
 arch/x86/xen/time.c | 38 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 37 insertions(+), 1 deletion(-)

diff --git a/arch/x86/xen/time.c b/arch/x86/xen/time.c
index 9ef0a5cca96e..95140609c8a8 100644
--- a/arch/x86/xen/time.c
+++ b/arch/x86/xen/time.c
@@ -474,15 +474,51 @@ static void xen_setup_vsyscall_time_info(void)
 	xen_clocksource.vdso_clock_mode = VDSO_CLOCKMODE_PVCLOCK;
 }
 
+/*
+ * Check if it is possible to safely use the tsc as a clocksource.  This is
+ * only true if the hypervisor notifies the guest that its tsc is invariant,
+ * the tsc is stable, and the tsc instruction will never be emulated.
+ */
+static int __init xen_tsc_safe_clocksource(void)
+{
+	u32 eax, ebx, ecx, edx;
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
+	/* Leaf 4, sub-leaf 0 (0x40000x03) */
+	cpuid_count(xen_cpuid_base() + 3, 0, &eax, &ebx, &ecx, &edx);
+
+	/* tsc_mode = no_emulate (2) */
+	if (ebx != 2)
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
+	 * clocksource, then set xen_clocksource rating below that of the tsc
+	 * so that the system prefers tsc instead.
+	 */
 	if (xen_initial_domain())
 		xen_clocksource.rating = 275;
+	else if (xen_tsc_safe_clocksource())
+		xen_clocksource.rating = 299;
 
 	clocksource_register_hz(&xen_clocksource, NSEC_PER_SEC);
 
-- 
2.25.1


