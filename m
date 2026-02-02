Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4AMhFCR1gGkV8gIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 02 Feb 2026 10:57:56 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B9FCA59F
	for <lists+xen-devel@lfdr.de>; Mon, 02 Feb 2026 10:57:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1218463.1527215 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmqgU-0001hS-Cc; Mon, 02 Feb 2026 09:57:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1218463.1527215; Mon, 02 Feb 2026 09:57:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmqgU-0001cy-68; Mon, 02 Feb 2026 09:57:30 +0000
Received: by outflank-mailman (input) for mailman id 1218463;
 Mon, 02 Feb 2026 09:52:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IGL7=AG=sony.com=shashank.mahadasyam@srs-se1.protection.inumbo.net>)
 id 1vmqbE-0001Il-Va
 for xen-devel@lists.xenproject.org; Mon, 02 Feb 2026 09:52:04 +0000
Received: from jpms-ob01.noc.sony.co.jp (jpms-ob01.noc.sony.co.jp
 [2001:cf8:ace:41::4]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d2cc2a73-001c-11f1-9ccf-f158ae23cfc8;
 Mon, 02 Feb 2026 10:52:02 +0100 (CET)
Received: from unknown (HELO jpmta-ob1.noc.sony.co.jp)
 ([IPv6:2001:cf8:0:6e7::6])
 by jpms-ob01.noc.sony.co.jp with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 18:51:38 +0900
Received: from unknown (HELO [127.0.1.1])
 ([IPv6:2001:cf8:1:573:0:dddd:6b3e:119e])
 by jpmta-ob1.noc.sony.co.jp with ESMTP; 02 Feb 2026 18:51:38 +0900
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
X-Inumbo-ID: d2cc2a73-001c-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=sony.com; s=s1jp; t=1770025922; x=1801561922;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=UGbV0HlypAsqDyqCwF4KKZshjhbYqkotn40a85H3Q7U=;
  b=Fsk8atP8nOli3A/kdU1FTFujNMxydunfy/0QabsYe7jNJhGm6H88rUTl
   inKAlL/r973SUJg9eT/QLvQ6XUQ5Z1zzVR3WfUx82Bh/+OVteJj5i9c0c
   i9g8QYmd1M2Fj6GWZ0zQGLNBVz7vA8wVOPX0KiVqO3vhAXRtayG1s6aam
   JyXxACjk15x5b0CeL9dCyap3V5e5y9+P4V5uVk2lZ9ONogp1rfsnTlbDL
   nFVA8cTmEmXDW5zHMNTWZ8HLFoZDQMYuHpAsQWRS6QQZHtlDkpL+jif+G
   i+LoAuD8joUkr/+y1Qm+QfGxsdGCUdd3H8PsWEFMyX0QDGANlaggsztfq
   w==;
X-IronPort-AV: E=Sophos;i="6.21,268,1763391600"; 
   d="scan'208";a="607384938"
From: Shashank Balaji <shashank.mahadasyam@sony.com>
Date: Mon, 02 Feb 2026 18:51:04 +0900
Subject: [PATCH 3/3] x86/virt: rename x2apic_available to
 x2apic_without_ir_available
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260202-x2apic-fix-v1-3-71c8f488a88b@sony.com>
References: <20260202-x2apic-fix-v1-0-71c8f488a88b@sony.com>
In-Reply-To: <20260202-x2apic-fix-v1-0-71c8f488a88b@sony.com>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Suresh Siddha <suresh.b.siddha@intel.com>, 
 "K. Y. Srinivasan" <kys@microsoft.com>, 
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
 Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
 Ajay Kaher <ajay.kaher@broadcom.com>, 
 Alexey Makhalov <alexey.makhalov@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Jan Kiszka <jan.kiszka@siemens.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Vitaly Kuznetsov <vkuznets@redhat.com>, Juergen Gross <jgross@suse.com>, 
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Ingo Molnar <mingo@elte.hu>, linux-kernel@vger.kernel.org, 
 linux-hyperv@vger.kernel.org, virtualization@lists.linux.dev, 
 jailhouse-dev@googlegroups.com, kvm@vger.kernel.org, 
 xen-devel@lists.xenproject.org, Rahul Bukte <rahul.bukte@sony.com>, 
 Shashank Balaji <shashank.mahadasyam@sony.com>, 
 Daniel Palmer <daniel.palmer@sony.com>, Tim Bird <tim.bird@sony.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=8661;
 i=shashank.mahadasyam@sony.com; h=from:subject:message-id;
 bh=40ywH2ksTo16iKGC5c7aKcdzHSb3M0fEznHdLx5ChZY=;
 b=owGbwMvMwCU2bX1+URVTXyjjabUkhsyG4pV73BSkW2t+bFj8lP/axHMSXQ/nLg+dcOZBrWq1l
 IycyNnlHaUsDGJcDLJiiiylStW/9q4IWtJz5rUizBxWJpAhDFycAjAR/UqGn4xiaRxyy02Nn4be
 9Xesdnx9Matg+r2d2y7WH5tzzWHmuTSG/4lN6178i2r5JLaG8/tKKYYCxeYn2uGibz7WxSq6yev
 mMAAA
X-Developer-Key: i=shashank.mahadasyam@sony.com; a=openpgp;
 fpr=75227BFABDA852A48CCCEB2196AF6F727A028E55
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[sony.com,none];
	R_DKIM_ALLOW(-0.20)[sony.com:s=s1jp];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:suresh.b.siddha@intel.com,m:kys@microsoft.com,m:haiyangz@microsoft.com,m:wei.liu@kernel.org,m:decui@microsoft.com,m:longli@microsoft.com,m:ajay.kaher@broadcom.com,m:alexey.makhalov@broadcom.com,m:bcm-kernel-feedback-list@broadcom.com,m:jan.kiszka@siemens.com,m:pbonzini@redhat.com,m:vkuznets@redhat.com,m:jgross@suse.com,m:boris.ostrovsky@oracle.com,m:mingo@elte.hu,m:linux-kernel@vger.kernel.org,m:linux-hyperv@vger.kernel.org,m:virtualization@lists.linux.dev,m:jailhouse-dev@googlegroups.com,m:kvm@vger.kernel.org,m:xen-devel@lists.xenproject.org,m:rahul.bukte@sony.com,m:shashank.mahadasyam@sony.com,m:daniel.palmer@sony.com,m:tim.bird@sony.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[shashank.mahadasyam@sony.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[31];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[sony.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shashank.mahadasyam@sony.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 05B9FCA59F
X-Rspamd-Action: no action

No functional change.

x86_init.hyper.x2apic_available is used only in try_to_enable_x2apic to check if
x2apic needs to be disabled if interrupt remapping support isn't present. But
the name x2apic_available doesn't reflect that usage.

This is what x2apic_available is set to for various hypervisors:

	acrn		boot_cpu_has(X86_FEATURE_X2APIC)
	mshyperv	boot_cpu_has(X86_FEATURE_X2APIC)
	xen		boot_cpu_has(X86_FEATURE_X2APIC) or false
	vmware		vmware_legacy_x2apic_available
	kvm		kvm_cpuid_base() != 0
	jailhouse	x2apic_enabled()
	bhyve		true
	default		false

Bare metal and vmware correctly check if x2apic is available without interrupt
remapping. The rest of them check if x2apic is enabled/supported, and kvm just
checks if the kernel is running on kvm. The other hypervisors may have to have
their checks audited.

Also fix the backwards pr_info message printed on disabling x2apic because of
lack of irq remapping support.

Compile tested with all the hypervisor guest support enabled.

Co-developed-by: Rahul Bukte <rahul.bukte@sony.com>
Signed-off-by: Rahul Bukte <rahul.bukte@sony.com>
Signed-off-by: Shashank Balaji <shashank.mahadasyam@sony.com>
---
 arch/x86/include/asm/x86_init.h |  4 ++--
 arch/x86/kernel/apic/apic.c     |  4 ++--
 arch/x86/kernel/cpu/acrn.c      |  2 +-
 arch/x86/kernel/cpu/bhyve.c     |  2 +-
 arch/x86/kernel/cpu/mshyperv.c  |  2 +-
 arch/x86/kernel/cpu/vmware.c    |  2 +-
 arch/x86/kernel/jailhouse.c     |  2 +-
 arch/x86/kernel/kvm.c           |  2 +-
 arch/x86/kernel/x86_init.c      | 12 ++++++------
 arch/x86/xen/enlighten_hvm.c    |  4 ++--
 10 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/arch/x86/include/asm/x86_init.h b/arch/x86/include/asm/x86_init.h
index 6c8a6ead84f6..b270d9eed755 100644
--- a/arch/x86/include/asm/x86_init.h
+++ b/arch/x86/include/asm/x86_init.h
@@ -116,7 +116,7 @@ struct x86_init_pci {
  * struct x86_hyper_init - x86 hypervisor init functions
  * @init_platform:		platform setup
  * @guest_late_init:		guest late init
- * @x2apic_available:		X2APIC detection
+ * @x2apic_without_ir_available: is x2apic available without irq remap?
  * @msi_ext_dest_id:		MSI supports 15-bit APIC IDs
  * @init_mem_mapping:		setup early mappings during init_mem_mapping()
  * @init_after_bootmem:		guest init after boot allocator is finished
@@ -124,7 +124,7 @@ struct x86_init_pci {
 struct x86_hyper_init {
 	void (*init_platform)(void);
 	void (*guest_late_init)(void);
-	bool (*x2apic_available)(void);
+	bool (*x2apic_without_ir_available)(void);
 	bool (*msi_ext_dest_id)(void);
 	void (*init_mem_mapping)(void);
 	void (*init_after_bootmem)(void);
diff --git a/arch/x86/kernel/apic/apic.c b/arch/x86/kernel/apic/apic.c
index cc64d61f82cf..8820b631f8a2 100644
--- a/arch/x86/kernel/apic/apic.c
+++ b/arch/x86/kernel/apic/apic.c
@@ -1836,8 +1836,8 @@ static __init void try_to_enable_x2apic(int remap_mode)
 		 * Using X2APIC without IR is not architecturally supported
 		 * on bare metal but may be supported in guests.
 		 */
-		if (!x86_init.hyper.x2apic_available()) {
-			pr_info("x2apic: IRQ remapping doesn't support X2APIC mode\n");
+		if (!x86_init.hyper.x2apic_without_ir_available()) {
+			pr_info("x2apic: Not supported without IRQ remapping\n");
 			x2apic_disable();
 			return;
 		}
diff --git a/arch/x86/kernel/cpu/acrn.c b/arch/x86/kernel/cpu/acrn.c
index 2c5b51aad91a..9204b98d4786 100644
--- a/arch/x86/kernel/cpu/acrn.c
+++ b/arch/x86/kernel/cpu/acrn.c
@@ -77,5 +77,5 @@ const __initconst struct hypervisor_x86 x86_hyper_acrn = {
 	.detect                 = acrn_detect,
 	.type			= X86_HYPER_ACRN,
 	.init.init_platform     = acrn_init_platform,
-	.init.x2apic_available  = acrn_x2apic_available,
+	.init.x2apic_without_ir_available = acrn_x2apic_available,
 };
diff --git a/arch/x86/kernel/cpu/bhyve.c b/arch/x86/kernel/cpu/bhyve.c
index f1a8ca3dd1ed..91a90a7459ce 100644
--- a/arch/x86/kernel/cpu/bhyve.c
+++ b/arch/x86/kernel/cpu/bhyve.c
@@ -61,6 +61,6 @@ const struct hypervisor_x86 x86_hyper_bhyve __refconst = {
 	.name			= "Bhyve",
 	.detect			= bhyve_detect,
 	.init.init_platform	= x86_init_noop,
-	.init.x2apic_available	= bhyve_x2apic_available,
+	.init.x2apic_without_ir_available = bhyve_x2apic_available,
 	.init.msi_ext_dest_id	= bhyve_ext_dest_id,
 };
diff --git a/arch/x86/kernel/cpu/mshyperv.c b/arch/x86/kernel/cpu/mshyperv.c
index 579fb2c64cfd..61458855094a 100644
--- a/arch/x86/kernel/cpu/mshyperv.c
+++ b/arch/x86/kernel/cpu/mshyperv.c
@@ -760,7 +760,7 @@ const __initconst struct hypervisor_x86 x86_hyper_ms_hyperv = {
 	.name			= "Microsoft Hyper-V",
 	.detect			= ms_hyperv_platform,
 	.type			= X86_HYPER_MS_HYPERV,
-	.init.x2apic_available	= ms_hyperv_x2apic_available,
+	.init.x2apic_without_ir_available = ms_hyperv_x2apic_available,
 	.init.msi_ext_dest_id	= ms_hyperv_msi_ext_dest_id,
 	.init.init_platform	= ms_hyperv_init_platform,
 	.init.guest_late_init	= ms_hyperv_late_init,
diff --git a/arch/x86/kernel/cpu/vmware.c b/arch/x86/kernel/cpu/vmware.c
index cb3f900c46fc..46d325818797 100644
--- a/arch/x86/kernel/cpu/vmware.c
+++ b/arch/x86/kernel/cpu/vmware.c
@@ -585,7 +585,7 @@ const __initconst struct hypervisor_x86 x86_hyper_vmware = {
 	.detect				= vmware_platform,
 	.type				= X86_HYPER_VMWARE,
 	.init.init_platform		= vmware_platform_setup,
-	.init.x2apic_available		= vmware_legacy_x2apic_available,
+	.init.x2apic_without_ir_available = vmware_legacy_x2apic_available,
 #ifdef CONFIG_AMD_MEM_ENCRYPT
 	.runtime.sev_es_hcall_prepare	= vmware_sev_es_hcall_prepare,
 	.runtime.sev_es_hcall_finish	= vmware_sev_es_hcall_finish,
diff --git a/arch/x86/kernel/jailhouse.c b/arch/x86/kernel/jailhouse.c
index 9e9a591a5fec..84a0bbe15989 100644
--- a/arch/x86/kernel/jailhouse.c
+++ b/arch/x86/kernel/jailhouse.c
@@ -291,6 +291,6 @@ const struct hypervisor_x86 x86_hyper_jailhouse __refconst = {
 	.name			= "Jailhouse",
 	.detect			= jailhouse_detect,
 	.init.init_platform	= jailhouse_init_platform,
-	.init.x2apic_available	= jailhouse_x2apic_available,
+	.init.x2apic_without_ir_available = jailhouse_x2apic_available,
 	.ignore_nopv		= true,
 };
diff --git a/arch/x86/kernel/kvm.c b/arch/x86/kernel/kvm.c
index 37dc8465e0f5..709eba87d58e 100644
--- a/arch/x86/kernel/kvm.c
+++ b/arch/x86/kernel/kvm.c
@@ -1042,7 +1042,7 @@ const __initconst struct hypervisor_x86 x86_hyper_kvm = {
 	.detect				= kvm_detect,
 	.type				= X86_HYPER_KVM,
 	.init.guest_late_init		= kvm_guest_init,
-	.init.x2apic_available		= kvm_para_available,
+	.init.x2apic_without_ir_available = kvm_para_available,
 	.init.msi_ext_dest_id		= kvm_msi_ext_dest_id,
 	.init.init_platform		= kvm_init_platform,
 #if defined(CONFIG_AMD_MEM_ENCRYPT)
diff --git a/arch/x86/kernel/x86_init.c b/arch/x86/kernel/x86_init.c
index ebefb77c37bb..9ddf8c901ac6 100644
--- a/arch/x86/kernel/x86_init.c
+++ b/arch/x86/kernel/x86_init.c
@@ -112,12 +112,12 @@ struct x86_init_ops x86_init __initdata = {
 	},
 
 	.hyper = {
-		.init_platform		= x86_init_noop,
-		.guest_late_init	= x86_init_noop,
-		.x2apic_available	= bool_x86_init_noop,
-		.msi_ext_dest_id	= bool_x86_init_noop,
-		.init_mem_mapping	= x86_init_noop,
-		.init_after_bootmem	= x86_init_noop,
+		.init_platform			= x86_init_noop,
+		.guest_late_init		= x86_init_noop,
+		.x2apic_without_ir_available	= bool_x86_init_noop,
+		.msi_ext_dest_id		= bool_x86_init_noop,
+		.init_mem_mapping		= x86_init_noop,
+		.init_after_bootmem		= x86_init_noop,
 	},
 
 	.acpi = {
diff --git a/arch/x86/xen/enlighten_hvm.c b/arch/x86/xen/enlighten_hvm.c
index fe57ff85d004..42f3d21f313d 100644
--- a/arch/x86/xen/enlighten_hvm.c
+++ b/arch/x86/xen/enlighten_hvm.c
@@ -311,7 +311,7 @@ static uint32_t __init xen_platform_hvm(void)
 		 * detect PVH and panic there.
 		 */
 		h->init_platform = x86_init_noop;
-		h->x2apic_available = bool_x86_init_noop;
+		h->x2apic_without_ir_available = bool_x86_init_noop;
 		h->init_mem_mapping = x86_init_noop;
 		h->init_after_bootmem = x86_init_noop;
 		h->guest_late_init = xen_hvm_guest_late_init;
@@ -325,7 +325,7 @@ struct hypervisor_x86 x86_hyper_xen_hvm __initdata = {
 	.detect                 = xen_platform_hvm,
 	.type			= X86_HYPER_XEN_HVM,
 	.init.init_platform     = xen_hvm_guest_init,
-	.init.x2apic_available  = xen_x2apic_available,
+	.init.x2apic_without_ir_available = xen_x2apic_available,
 	.init.init_mem_mapping	= xen_hvm_init_mem_mapping,
 	.init.guest_late_init	= xen_hvm_guest_late_init,
 	.init.msi_ext_dest_id   = msi_ext_dest_id,

-- 
2.43.0


