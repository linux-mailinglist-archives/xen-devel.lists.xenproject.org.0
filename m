Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6621C1B0F19
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2020 16:59:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQXtN-0000jH-7I; Mon, 20 Apr 2020 14:59:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=61/n=6E=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jQXtL-0000jA-Dy
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2020 14:59:23 +0000
X-Inumbo-ID: 826fb37e-8317-11ea-9e09-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 826fb37e-8317-11ea-9e09-bc764e2007e4;
 Mon, 20 Apr 2020 14:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587394758;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0FMwLpqDC0VR7A4uGgKObYvkj59mRHa1JOdxdGTYGzg=;
 b=Aout0F85o8qaOSclzinxrlzka8Tjl96tYOCOdCfc/L1zh6twF0zY3gmc
 D/3TTlR3KSUmLh9IZvYlVh79JhjEPq8FKRMvNzjq9AP8JTM35Ui4/Ddfm
 SDHgpOe9kdOF2mdUkQiEpXcZLevEIsanj1VQR+I5R9iIxjejbOZ8nsV6G s=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 1mGYZCKyXlgwt18fLqgX04XEr+xWh5d5Y1kv8/xwox7zyJlXLBninIdrft4fV0zXKXMxc+Og+9
 DZFWLcRnHh2peXEkJ+6LF5mgc7BUXzLmO/DdVwdRSmJ3RBYux+u4j8AUn7snkuOYbHKIIf/B9t
 KHXATJ78feEYdBIWFmVQaAx2aaYEmozn5NV6H3pzqJfcN8ZQNduu0+z1gWHpzZkRtlQb7FkqIH
 xWRKaqjZ29FTtQL1UgJ8+VwbQ/hjdZaSww/+2FdvfzoIOK1ZPewLGj8RUa2ezFbpr0hC19NCQF
 hQA=
X-SBRS: 2.7
X-MesageID: 15959933
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,406,1580792400"; d="scan'208";a="15959933"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH 2/3] x86/boot: Don't enable EFER.SCE for !CONFIG_PV builds
Date: Mon, 20 Apr 2020 15:59:10 +0100
Message-ID: <20200420145911.5708-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200420145911.5708-1-andrew.cooper3@citrix.com>
References: <20200420145911.5708-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This will cause all SYSCALL/SYSRET instructions to suffer #UD rather than
following the MSR_{L,C}STAR pointers, allowing us to drop the star_enter()
panic helper, allowing us to clean up the IST stacks in a subsequent patch.

Drop the now-dead conditional SYSENTER logic in the middle of
subarch_percpu_traps_init().

In addition, vmx_restore_host_msrs() need not restore any host
state.  (Regarding the asymmetric changes, VT-x automatically restores
SYSENTER state on vmexit, and SVM restores both SYSCALL/SYSENTER state with
the VMSAVE/VMLOAD instructions.)

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Kevin Tian <kevin.tian@intel.com>
---
 xen/arch/x86/boot/trampoline.S |  4 ++--
 xen/arch/x86/efi/efi-boot.h    |  3 ++-
 xen/arch/x86/hvm/vmx/vmx.c     |  4 ++++
 xen/arch/x86/x86_64/traps.c    | 19 ++++++-------------
 4 files changed, 14 insertions(+), 16 deletions(-)

diff --git a/xen/arch/x86/boot/trampoline.S b/xen/arch/x86/boot/trampoline.S
index 18c6638924..928b4ad4ce 100644
--- a/xen/arch/x86/boot/trampoline.S
+++ b/xen/arch/x86/boot/trampoline.S
@@ -140,9 +140,9 @@ gdt_48:
 GLOBAL(trampoline_misc_enable_off)
         .quad   0
 
-/* EFER OR-mask for boot paths.  This gets adjusted with NX when available. */
+/* EFER OR-mask for boot paths.  SCE conditional on PV support, NX added when available. */
 GLOBAL(trampoline_efer)
-        .long   EFER_LME | EFER_SCE
+        .long   EFER_LME | (EFER_SCE * IS_ENABLED(CONFIG_PV))
 
 GLOBAL(trampoline_xen_phys_start)
         .long   0
diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
index a13304201f..bf0fae4f89 100644
--- a/xen/arch/x86/efi/efi-boot.h
+++ b/xen/arch/x86/efi/efi-boot.h
@@ -238,7 +238,8 @@ static void __init noreturn efi_arch_post_exit_boot(void)
     /* Set system registers and transfer control. */
     asm volatile("pushq $0\n\tpopfq");
     rdmsrl(MSR_EFER, efer);
-    efer |= EFER_SCE;
+    if ( IS_ENABLED(CONFIG_PV) )
+        efer |= EFER_SCE;
     if ( cpu_has_nx )
         efer |= EFER_NX;
     wrmsrl(MSR_EFER, efer);
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 869339062b..3e4b2e9a58 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -496,6 +496,10 @@ static void vmx_vcpu_destroy(struct vcpu *v)
  */
 static void vmx_restore_host_msrs(void)
 {
+    /* No PV guests?  No need to set restore host SYSCALL infrastructure. */
+    if ( !IS_ENABLED(CONFIG_PV) )
+        return;
+
     /* Relies on the SYSCALL trampoline being at the start of the stubs. */
     wrmsrl(MSR_STAR,         XEN_MSR_STAR);
     wrmsrl(MSR_LSTAR,        this_cpu(stubs.addr));
diff --git a/xen/arch/x86/x86_64/traps.c b/xen/arch/x86/x86_64/traps.c
index c3d4faea6b..93af0c5e87 100644
--- a/xen/arch/x86/x86_64/traps.c
+++ b/xen/arch/x86/x86_64/traps.c
@@ -299,17 +299,8 @@ static unsigned int write_stub_trampoline(
 
 DEFINE_PER_CPU(struct stubs, stubs);
 
-#ifdef CONFIG_PV
 void lstar_enter(void);
 void cstar_enter(void);
-#else
-static void __cold star_enter(void)
-{
-    panic("lstar/cstar\n");
-}
-#define lstar_enter star_enter
-#define cstar_enter star_enter
-#endif /* CONFIG_PV */
 
 void subarch_percpu_traps_init(void)
 {
@@ -321,6 +312,10 @@ void subarch_percpu_traps_init(void)
     /* IST_MAX IST pages + at least 1 guard page + primary stack. */
     BUILD_BUG_ON((IST_MAX + 1) * PAGE_SIZE + PRIMARY_STACK_SIZE > STACK_SIZE);
 
+    /* No PV guests?  No need to set up SYSCALL/SYSENTER infrastructure. */
+    if ( !IS_ENABLED(CONFIG_PV) )
+        return;
+
     stub_page = map_domain_page(_mfn(this_cpu(stubs.mfn)));
 
     /*
@@ -338,10 +333,8 @@ void subarch_percpu_traps_init(void)
     {
         /* SYSENTER entry. */
         wrmsrl(MSR_IA32_SYSENTER_ESP, stack_bottom);
-        wrmsrl(MSR_IA32_SYSENTER_EIP,
-               IS_ENABLED(CONFIG_PV) ? (unsigned long)sysenter_entry : 0);
-        wrmsr(MSR_IA32_SYSENTER_CS,
-              IS_ENABLED(CONFIG_PV) ? __HYPERVISOR_CS : 0, 0);
+        wrmsrl(MSR_IA32_SYSENTER_EIP, (unsigned long)sysenter_entry);
+        wrmsr(MSR_IA32_SYSENTER_CS, __HYPERVISOR_CS, 0);
     }
 
     /* Trampoline for SYSCALL entry from compatibility mode. */
-- 
2.11.0


