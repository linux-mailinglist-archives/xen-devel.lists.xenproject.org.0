Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2826A04E6
	for <lists+xen-devel@lfdr.de>; Thu, 23 Feb 2023 10:33:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.499971.771273 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pV7yX-0002Iz-T6; Thu, 23 Feb 2023 09:33:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 499971.771273; Thu, 23 Feb 2023 09:33:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pV7yX-0002Gm-Pr; Thu, 23 Feb 2023 09:33:17 +0000
Received: by outflank-mailman (input) for mailman id 499971;
 Thu, 23 Feb 2023 09:33:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uapr=6T=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pV7yW-0002Du-FD
 for xen-devel@lists.xenproject.org; Thu, 23 Feb 2023 09:33:16 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1939410a-b35d-11ed-88bb-e56d68cac8db;
 Thu, 23 Feb 2023 10:33:15 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 596FD337F7;
 Thu, 23 Feb 2023 09:33:15 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 110F513928;
 Thu, 23 Feb 2023 09:33:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id a0MDAtsy92OmbAAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 23 Feb 2023 09:33:15 +0000
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
X-Inumbo-ID: 1939410a-b35d-11ed-88bb-e56d68cac8db
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1677144795; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bjil8ydj+MbGLi24YOvmKTY6GkdCwB8f6NUZv/v3iL0=;
	b=f1lGkoc901x7lIfA6dv5NQpuQXuNT2Y9un8+vttO+jCblw1+Z+0VJz0GmtM8iUuNOWIJel
	zgALYUpQ3GLTcj425d8OzgfSLsqex9QOV+ZRjt7hqepTZeOZ4n5M0z2FX9oxt/xgInoJFz
	dMKS3jUEiMuk6ne8ZFQr4MNruZxSTtM=
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	xen-devel@lists.xenproject.org
Subject: [PATCH v3 05/12] x86/xen: set MTRR state when running as Xen PV initial domain
Date: Thu, 23 Feb 2023 10:32:36 +0100
Message-Id: <20230223093243.1180-6-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230223093243.1180-1-jgross@suse.com>
References: <20230223093243.1180-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When running as Xen PV initial domain (aka dom0), MTRRs are disabled
by the hypervisor, but the system should nevertheless use correct
cache memory types. This has always kind of worked, as disabled MTRRs
resulted in disabled PAT, too, so that the kernel avoided code paths
resulting in inconsistencies. This bypassed all of the sanity checks
the kernel is doing with enabled MTRRs in order to avoid memory
mappings with conflicting memory types.

This has been changed recently, leading to PAT being accepted to be
enabled, while MTRRs stayed disabled. The result is that
mtrr_type_lookup() no longer is accepting all memory type requests,
but started to return WB even if UC- was requested. This led to
driver failures during initialization of some devices.

In reality MTRRs are still in effect, but they are under complete
control of the Xen hypervisor. It is possible, however, to retrieve
the MTRR settings from the hypervisor.

In order to fix those problems, overwrite the MTRR state via
mtrr_overwrite_state() with the MTRR data from the hypervisor, if the
system is running as a Xen dom0.

Fixes: 72cbc8f04fe2 ("x86/PAT: Have pat_enabled() properly reflect state when running on Xen")
Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- new patch
V3:
- move the call of mtrr_overwrite_state() to xen_pv_init_platform()
---
 arch/x86/xen/enlighten_pv.c | 50 +++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
index bb59cc6ddb2d..729fb447a5b6 100644
--- a/arch/x86/xen/enlighten_pv.c
+++ b/arch/x86/xen/enlighten_pv.c
@@ -68,6 +68,7 @@
 #include <asm/reboot.h>
 #include <asm/hypervisor.h>
 #include <asm/mach_traps.h>
+#include <asm/mtrr.h>
 #include <asm/mwait.h>
 #include <asm/pci_x86.h>
 #include <asm/cpu.h>
@@ -119,6 +120,52 @@ static int __init parse_xen_msr_safe(char *str)
 }
 early_param("xen_msr_safe", parse_xen_msr_safe);
 
+/* Get MTRR settings from Xen and put them into mtrr_state. */
+static void __init xen_set_mtrr_data(void)
+{
+#ifdef CONFIG_MTRR
+	struct xen_platform_op op = {
+		.cmd = XENPF_read_memtype,
+		.interface_version = XENPF_INTERFACE_VERSION,
+	};
+	unsigned int reg;
+	unsigned long mask;
+	uint32_t eax, width;
+	static struct mtrr_var_range var[MTRR_MAX_VAR_RANGES] __initdata;
+
+	/* Get physical address width (only 64-bit cpus supported). */
+	width = 36;
+	eax = cpuid_eax(0x80000000);
+	if ((eax >> 16) == 0x8000 && eax >= 0x80000008) {
+		eax = cpuid_eax(0x80000008);
+		width = eax & 0xff;
+	}
+
+	for (reg = 0; reg < MTRR_MAX_VAR_RANGES; reg++) {
+		op.u.read_memtype.reg = reg;
+		if (HYPERVISOR_platform_op(&op))
+			break;
+
+		/*
+		 * Only called in dom0, which has all RAM PFNs mapped at
+		 * RAM MFNs, and all PCI space etc. is identity mapped.
+		 * This means we can treat MFN == PFN regarding MTTR settings.
+		 */
+		var[reg].base_lo = op.u.read_memtype.type;
+		var[reg].base_lo |= op.u.read_memtype.mfn << PAGE_SHIFT;
+		var[reg].base_hi = op.u.read_memtype.mfn >> (32 - PAGE_SHIFT);
+		mask = ~((op.u.read_memtype.nr_mfns << PAGE_SHIFT) - 1);
+		mask &= (1UL << width) - 1;
+		if (mask)
+			mask |= 1 << 11;
+		var[reg].mask_lo = mask;
+		var[reg].mask_hi = mask >> 32;
+	}
+
+	mtrr_overwrite_state(var, reg, MTRR_TYPE_UNCACHABLE);
+#endif
+}
+
 static void __init xen_pv_init_platform(void)
 {
 	/* PV guests can't operate virtio devices without grants. */
@@ -135,6 +182,9 @@ static void __init xen_pv_init_platform(void)
 
 	/* pvclock is in shared info area */
 	xen_init_time_ops();
+
+	if (xen_initial_domain())
+		xen_set_mtrr_data();
 }
 
 static void __init xen_pv_guest_late_init(void)
-- 
2.35.3


